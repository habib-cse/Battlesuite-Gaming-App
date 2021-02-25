from django.shortcuts import render, redirect, HttpResponse, reverse
from django.contrib.sites.models import Site
from django.http import JsonResponse, HttpRequest
from accounts.models import Mainuser
from .models import *
from .forms import TournamentForm
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib import messages
from django.contrib.auth.models import User
from django.template.defaulttags import register
from django.http.response import StreamingHttpResponse
from .camera import VideoCamera, ScreenCapture
import numpy as np
import cv2
import dateutil.parser
from datetime import timedelta
from pathlib import Path
import random
from django.conf import settings
from django.utils import timezone, dateformat
from django.utils.timezone import now
import os
from datetime import datetime


def test(request):
    all_messages = LivestreamMessage.objects.all()

    context = {"messages": all_messages}
    return render(request, "frontend/test.html", context)


@register.filter
def split(string, key):
    return string.split(key)[0]

def routine_tournament_check():
    for tournament in Tournament.objects.all():
        all_team_user_in_tournament = TournamentTeamUser.objects.filter(tournament=tournament)
        #Checking if tournament is finished
        if tournament.finished:
            tournament_winner = TournamentWin.objects.get(tournament=tournament).team

            for relation in all_team_user_in_tournament:
                notification_title = f"Tournament finished"
                notification_message = f"""<p style="font-size:16px; margin-bottom:10px;">Tournament <strong>{tournament.name}</strong> has ended! Prep</p> <br>
                                            <p style="font-size:16px; margin-bottom:10px;">Winner is {tournament_winner.name}</p>"""

                Notification.objects.create(user_id=relation.user.id, title=notification_title,
                                            message=notification_message)

            tournament.delete()

        #checking is tournament started
        elif tournament.started:
            if len(all_team_user_in_tournament) != (tournament.player_amount + tournament.player_amount):
                for relation in all_team_user_in_tournament:
                    notification_title = f"Tournament Failed to start!"
                    notification_message = f"""<p style="font-size:16px; margin-bottom:10px;">Tournament <strong>{tournament.name}</strong> did not start due to lack of players!</p> <br>"""

                    Notification.objects.create(user_id=relation.user.id, title=notification_title,
                                                message=notification_message)
                tournament.delete()
        # checking if tournament starts in 5 minutes
        else:
            seconds_remaining = int((tournament.date - now()).total_seconds())
            if seconds_remaining < 0:
                if len(all_team_user_in_tournament) != (tournament.player_amount + tournament.player_amount):
                    for relation in all_team_user_in_tournament:
                        notification_title = f"Tournament Failed to start!"
                        notification_message = f"""<p style="font-size:16px; margin-bottom:10px;">Tournament <strong>{tournament.name}</strong> did not start due to lack of players!</p> <br>"""

                        Notification.objects.create(user_id=relation.user.id, title=notification_title,
                                                    message=notification_message)
                    tournament.delete()
                else:
                    tournament.started = True
                    tournament.save()

                    for relation in all_team_user_in_tournament:
                        tournament_link = "127.0.0.1:8000" + reverse('core:tournament_waiting', args=(relation.user.username, str(tournament.pk)))

                        notification_title = f"Tournament Started!"
                        notification_message = f"""<p style="font-size:16px; margin-bottom:10px;">Tournament <strong>{tournament.name}</strong> has started!</p> <br>
                                                                    <a class="action-button"href="{tournament_link}">Go to Tournament</a>"""

                        Notification.objects.create(user_id=relation.user.id, title=notification_title,
                                                    message=notification_message)

            if seconds_remaining < 300:
                for relation in all_team_user_in_tournament:
                    notification_title = f"Tournament starts in 5 minutes!"
                    notification_message = f"""<p style="font-size:16px; margin-bottom:10px;">Tournament <strong>{tournament.name}</strong> has 5 minutes until it starts! Prep</p> <br>"""

                    Notification.objects.create(user_id=relation.user.id, title=notification_title,
                                                message=notification_message)


def read_file(request):
    f = open('.well-known/pki-validation/37E000EFB71CA98D33942FBFC59AE7F0.txt', 'r')
    file_content = f.read()
    f.close()
    return HttpResponse(file_content, content_type="text/plain")


def predict_win(template, image):
    gray = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
    res = cv2.matchTemplate(gray, template, cv2.TM_CCOEFF_NORMED)
    print(np.max(res))
    if np.max(res) > 0.8:
        return 1
    else:
        return 0


# Create your views here.

def home(request):
    return render(request, 'frontend/landing_page.html')


def all_tournaments(request):
    tournaments = Tournament.objects.filter(finished=False, started=True)

    active_tournaments = {}

    if len(tournaments) != 0:
        for tournament in tournaments:
            try:
                tournament_round = TournamentRound.objects.get(tournament=tournament)
                active_games = tournament_round.games.all()
                teams = [[i for i in GameTeam.objects.filter(game=game)] for game in active_games]
                active_tournaments[tournament] = teams
            except:
                pass

    playing_tournaments = False
    if len(active_tournaments) > 0:
        playing_tournaments = True

    context = {
        "playing_tournaments": playing_tournaments,
        "active_tournaments": active_tournaments,
    }

    return render(request, 'frontend/index.html', context=context)


@login_required()
def tournament_mytournament(request, username):
    routine_tournament_check()
    platform_games = load_game_platforms()
    if request.user.username != username:
        return render(request, "frontend/error-page.html")

    if request.method == "GET":
        tournaments = Tournament.objects.filter(creator=request.user)
        tournaments = [[tournament, int((tournament.date - now()).total_seconds() / (60 * 60)),
                        int((tournament.date - now()).total_seconds())] for tournament
                       in tournaments if not tournament.finished]
        context = {
            "username": username,
            "path": "mytournament",
            "tournaments": tournaments,
        }
        return render(request, "frontend/tournament-page-mytournament.html", context)

    elif request.method == "POST":
        if 'Edit Tournament' in request.POST:
            tournament_pk = request.POST['Tournament-To-Edit']
            request.method = "GET"
            return redirect("core:create_tournament", username=username, tournament_pk=tournament_pk)

        elif 'Cancel Tournament' in request.POST:
            tournament_pk = request.POST['Tournament-To-Edit']
            tournament = Tournament.objects.get(pk=tournament_pk)
            notification_title = f"Tournament Cancelled"
            notification_message = f"""<p style="font-size:16px; margin-bottom:10px;">Tournament <strong>{tournament.name}</strong> has been cancelled! It will no longer take place.</p> <br>"""

            all_team_user_in_tournament = TournamentTeamUser.objects.filter(tournament=tournament)
            for relation in all_team_user_in_tournament:
                Notification.objects.create(user_id=relation.user.id, title=notification_title,
                                            message=notification_message)

            tournament.delete()

            request.method = "GET"
            return tournament_mytournament(request, username=username)


def tournament_redirect(request):
    return redirect("core:mytournament", username=request.user.username, )


def save_chat_message(request):
    if request.is_ajax():
        game = Game.objects.get(pk=int(request.GET["game_pk"]))
        user = User.objects.get(pk=int(request.GET["user_pk"]))
        message = request.GET["message"]

    new_message = LivestreamMessage(game=game, user=user, message=message)
    new_message.save()

    return HttpResponse(HttpResponse(json.dumps({"success": "yes"}), content_type="application/json"))


def update_livestream_messages(request):
    if request.is_ajax():
        game = Game.objects.get(pk=request.GET["game_pk"])

    all_messages = LivestreamMessage.objects.filter(game=game)

    context = {"messages": all_messages}
    return render(request, "frontend/livestream_messages.html", context=context)


@login_required()
def tournament_challenges(request, username):
    if request.user.username != username:
        return render(request, "frontend/error-page.html")
    try:
        user_team = Team.objects.filter(team_member=request.user)[0]
        challenges = Challenge.objects.filter(challenged_team=user_team)
    except:
        challenges = []

    context = {
        "username": username,
        "path": "challenges",
        "challenges": challenges,
    }

    if request.method == "GET":
        return render(request, "frontend/tournament-page-challenges.html", context)

    elif request.method == "POST":
        if "Decline Challenge" in request.POST:
            tournament = request.POST['Tournament-To-Edit']
            tournament = Tournament.objects.get(pk=tournament)
            challenge_to_delete = Challenge.objects.get(tournament=tournament, challenged_team=user_team)
            challenge_to_delete.delete()

            notification_title = f"{username} declined the Invaitation"
            notification_message = f"""
                    <p style="font-size:16px; margin-bottom:10px;">"<strong>{username}</strong> declined the invaitation to join the Tournament <strong>{tournament.name}</strong> "</p> <br> 
                """
            Notification.objects.create(user_id=tournament.creator.id, title=notification_title,
                                        message=notification_message)

            request.method = "GET"
            return tournament_challenges(request, username=username)

        elif "Accept Challenge" in request.POST:
            tournament = request.POST['Tournament-To-Edit']
            tournament = Tournament.objects.get(pk=tournament)
            tournament_team = TournamentTeam(tournament=tournament, team=user_team)
            tournament_team.save()

            user_relation = TournamentTeamUser(tournament=tournament, team=user_team, user=request.user)
            user_relation.save()

            challenge_to_delete = Challenge.objects.get(tournament=tournament, challenged_team=user_team)
            challenge_to_delete.delete()

            notification_title = f"{username} Accepted the Invaitation"
            notification_message = f"""
                                <p style="font-size:16px; margin-bottom:10px;"><strong>{username}</strong> accepted the invaitation to join the Tournament <strong>{tournament.name}</strong></p> <br> 
                            """
            Notification.objects.create(user_id=tournament.creator.id, title=notification_title,
                                        message=notification_message)
            return redirect('core:challenged_team_invite_teammembers', username=username, tournament_pk =str(tournament.pk))


@login_required()
def tournament_invites(request, username):
    if request.user.username != username:
        return render(request, "frontend/error-page.html")
    try:
        user_team = Team.objects.filter(team_member=request.user)[0]
        invites = Challenge.objects.filter(challenged_team=user_team)
    except:
        user_team = None
        invites = []

    context = {
        "path": "invites",
        "invites": invites,
        "user_team": user_team,
        "username": username,
    }

    if request.method == "GET":
        return render(request, "frontend/tournament-page-invites.html", context)

    elif request.method == "POST":
        if "Decline Invite" in request.POST:
            tournament = request.POST['Tournament-To-Edit']
            tournament = Tournament.objects.get(pk=tournament)
            invite_to_delete = TournamentInvite.objects.get(tournament=tournament, user=request.user)
            invite_to_delete.delete()
            request.method = "GET"
            return tournament_challenges(request, username=username)
        elif "Accept Invite" in request.POST:
            tournament = request.POST['Tournament-To-Edit']
            tournament = Tournament.objects.get(pk=tournament)
            user_relation = TournamentTeamUser(tournament=tournament, team=user_team, user=request.user)
            user_relation.save()
            invite_to_delete = TournamentInvite.objects.get(tournament=tournament, user=request.user)
            invite_to_delete.delete()
            return tournament_challenges(request, username=username)


@login_required()
def create_tournament(request, username, tournament_pk="new_tournament"):
    team_size_choices = ["1 VS 1", "2 VS 2", "3 VS 3", "4 VS 4", "5 VS 5"]
    team_number_choices = ["2 Teams", "4 Teams", "8 Teams"]
    game_length_choices = ["40 Minutes", "60 Minutes", "80 Minutes"]

    if request.user.username != username:
        return render(request, "frontend/error-page.html")

    if tournament_pk == "new_tournament":
        tournament = None
        tournament_date = None
    else:
        try:
            tournament = Tournament.objects.get(pk=int(tournament_pk))
            tournament_date = tournament.date.strftime("%Y-%m-%dT%H:%M")
        except:
            return render(request, "frontend/error-page.html")
    torunament_form = TournamentForm()
    context = {
        "platform_games": load_game_platforms(),
        "username": username,
        "tournament_pk": tournament_pk,
        "team_size_choices": team_size_choices,
        "team_number_choices": team_number_choices,
        "game_length_choices": game_length_choices,
        "tournament": tournament,
        "tournament_date": tournament_date,
        "now": timezone.now().strftime("%Y-%m-%dT%H:%M"),
        "torunament_form": torunament_form
    }
    return render(request, "frontend/create-my-tournament.html", context=context)


def list_teams(request):
    if request.is_ajax():
        search = request.GET["search"]
        tournament_pk = request.GET["tournament_pk"]
        host_team_pk = request.GET["host_team_pk"]

        tournament = Tournament.objects.get(pk=tournament_pk)
        host_team = Team.objects.get(pk=host_team_pk)

    challenged_teams = Challenge.objects.filter(host_team=host_team, tournament=tournament)
    challenged_teams = [relation.challenged_team.pk for relation in challenged_teams]

    if search == "":
        count = Team.objects.count()
        filtered_teams = []

        team_number = 21
        if count < team_number:
            team_number = count
        for i in range(team_number):
            random_team = Team.objects.all()[random.randint(0, count - 1)]
            if random_team not in filtered_teams:
                filtered_teams.append(random_team)
    else:
        filtered_teams = Team.objects.filter(name__icontains=search)

    if host_team in filtered_teams:
        filtered_teams.remove(host_team)

    context = {
        "all_teams": filtered_teams,
        "tournament": tournament,
        "user_team": host_team,
        "challenged_teams": challenged_teams

    }

    return render(request, 'frontend/challenge_teams.html', context=context)

@login_required()
def challenged_team_invite_teammembers(request, username, tournament_pk):
    if request.user.username != username:
        return render(request, "frontend/error-page.html")

    user_team = Team.objects.filter(team_member=request.user)[0]
    tournament = Tournament.objects.get(pk=int(tournament_pk))

    teammembers = user_team.team_member.all()
    teammembers = [i for i in teammembers if i != request.user]

    invited_teammembers = [TournamentInvite.objects.filter(tournament=tournament, user=tm) for tm in teammembers]
    invited_teammembers = [queryset[0] for queryset in invited_teammembers if len(queryset) > 0]

    invited_teammembers = [relation.user.pk for relation in invited_teammembers]

    context = {
        "teammembers": teammembers,
        "invited_teammembers": invited_teammembers,
        "user_team": user_team,
        "tournament": tournament
    }

    return render(request, "frontend/create-my-tournament-teams-challenged.html", context=context)

@login_required()
def edit_tournament(request, username, tournament_pk):
    if tournament_pk == "new_tournament":
        new_tournament_pk = save_new_tournament(request)
        return redirect("core:edit_tournament", username=username, tournament_pk=str(new_tournament_pk))

    if request.user.username != username:
        return render(request, "frontend/error-page.html")

    user_team = Team.objects.filter(team_member=request.user)[0]

    tournament = Tournament.objects.get(pk=int(tournament_pk))
    challenged_teams = Challenge.objects.filter(host_team=user_team, tournament=tournament)
    challenged_teams = [relation.challenged_team.pk for relation in challenged_teams]

    all_teams = [team for team in Team.objects.all()]
    all_teams.remove(user_team)

    teammembers = user_team.team_member.all()
    teammembers = [i for i in teammembers if i != request.user]

    invited_teammembers = [TournamentInvite.objects.filter(tournament=tournament, user=tm) for tm in teammembers]
    invited_teammembers = [queryset[0] for queryset in invited_teammembers if len(queryset) > 0]

    invited_teammembers = [relation.user.pk for relation in invited_teammembers]

    context = {
        "platform_games": load_game_platforms(),
        "username": username,
        "tournament_pk": str(tournament_pk),
        "all_teams": all_teams,
        "challenged_teams": challenged_teams,
        "teammembers": teammembers,
        "invited_teammembers": invited_teammembers,
        "user_team": user_team,
        "tournament": tournament
    }

    return render(request, "frontend/create-my-tournament-teams.html", context)


def challenge_team(request):
    if request.is_ajax():
        challenged_team_pk = request.GET["challenged_team_pk"]
        tournament_pk = request.GET["tournament_pk"]
        host_team_pk = request.GET["host_team_pk"]

        challenged_team = Team.objects.get(pk=challenged_team_pk)
        host_team = Team.objects.get(pk=host_team_pk)
        tournament = Tournament.objects.get(pk=tournament_pk)

    old_challenge = Challenge.objects.filter(tournament=tournament, host_team=host_team,
                                             challenged_team=challenged_team)
    if len(old_challenge) == 0:
        new_challenge = Challenge(tournament=tournament,
                                  host_team=host_team,
                                  challenged_team=challenged_team)

        notification_title = f"Challenged to tournament"
        notification_message = f"""
                                        <p style="font-size:16px; margin-bottom:10px;"><strong>{tournament.creator.username}</strong> has challenged you to take part in their tournament: <strong>{tournament.name}</strong></p> <br> 
                                    """
        Notification.objects.create(user_id=challenged_team.admin.id,
                                    title=notification_title,
                                    message=notification_message)

        new_challenge.save()

        data = {
            "team_name": challenged_team.name,
        }

        return HttpResponse(json.dumps(data), content_type='application/json')
    else:
        return HttpResponse(json.dumps({"team_name": ""}), content_type='application/json')


def invite_teammember(request):
    if request.is_ajax():
        tournament_pk = request.GET["tournament_pk"]
        invited_user_pk = request.GET["invited_user_pk"]

        tournament = Tournament.objects.get(pk=tournament_pk)
        invited_user = User.objects.get(pk=invited_user_pk)

    ole_invite = TournamentInvite.objects.filter(tournament=tournament, user=invited_user)
    if len(ole_invite) == 0:
        new_invite = TournamentInvite(tournament=tournament, user=invited_user)

        notification_title = f"Invited to tournament"
        notification_message = f"""
                                               <p style="font-size:16px; margin-bottom:10px;"><strong>{tournament.creator.username}</strong> has invited you to take part in the tournament: <strong>{tournament.name}</strong></p> <br> 
                                           """
        Notification.objects.create(user_id=invited_user.id,
                                    title=notification_title,
                                    message=notification_message)

        new_invite.save()
        data = {
            "invited_user_name": invited_user.username,
        }

        return HttpResponse(json.dumps(data), content_type='application/json')
    else:
        return HttpResponse(json.dumps({"invited_user_name": ""}), content_type='application/json')


import pandas as pd


def load_game_platforms():
    platform_game_df = pd.read_excel(f"{settings.STATICFILES_DIRS[0]}/project-static/data/platform_game_map.xlsx")
    platform_games = {}
    for platform, gamedf in platform_game_df.groupby(platform_game_df.columns[0]):
        platform_games[platform] = list(gamedf.iloc[:, 1].values)

    return platform_games


def save_new_tournament(request):
    user_team = Team.objects.filter(team_member=request.user)[0]
    form = TournamentForm(request.POST, request.FILES)
    tournament = Tournament(creator=request.user)
    setattr(tournament, 'name', form.data["name"])
    setattr(tournament, 'game_name', form.data["game_select"])
    setattr(tournament, 'date', dateutil.parser.parse(form.data["date"]))
    setattr(tournament, 'game_length', int(split(form.data["match_duration_select"], " ")))
    setattr(tournament, 'description', form.data["description"])
    setattr(tournament, 'platform', form.data["platform"])
    setattr(tournament, 'player_amount', int(split(form.data["deathmath_mode_select"], " ")))
    setattr(tournament, 'number_of_teams', int(split(form.data["team_number_select"], " ")))
    setattr(tournament, 'platform', form.data["platform"])
    setattr(tournament, 'cover_photo', request.FILES["cover_photo"])
    tournament.save()

    notification_title = "Tournament Created"
    notification_message = f"Your tournament: <strong>{tournament.name}</strong> has been created!"
    Notification.objects.create(user_id=tournament.creator.id, title=notification_title, message=notification_message)

    relation = TournamentTeam(tournament=tournament, team=user_team)
    relation.save()

    user_relation = TournamentTeamUser(tournament=tournament, team=user_team, user=request.user)
    user_relation.save()

    return tournament.pk


def check_tournament_win(tournament):
    teams_in_tournament = TournamentTeam.objects.filter(tournament=tournament)
    if len(teams_in_tournament) == 1:
        try:
            tournament_winner = TournamentWin.objects.get(tournament=tournament)
        except:
            tournament_winner = TournamentWin(tournament=tournament, team=teams_in_tournament[0].team)
            tournament_winner.save()
            users_in_team = TournamentTeamUser.objects.filter(tournament=tournament, team=teams_in_tournament[0].team)[0]
            for user_in_team in users_in_team:
                tournament_winner.players.add(user_in_team)
            tournament_winner.save()
            tournament.finished = True
            tournament.save()


import time
def end_game(request, tournament_pk, username, prev_round):
    print("--------------------------------------------------------------------------------")
    print("game ended")
    print(request.user)
    time.sleep(random.randint(1, 10))
    tournament = Tournament.objects.get(pk=int(tournament_pk))
    if tournament.finished:
        return HttpResponse(HttpResponse(json.dumps({"finished": "yes"}), content_type="application/json"))
    try:
        tournamentround = TournamentRound.objects.get(tournament=tournament)
        round = tournamentround.round
        if round == int(prev_round):
            games = tournamentround.games.all()
            for game in games:
                teamA, teamB = GameTeam.objects.filter(game=game)
                saved_game = PreviousGame(teamA=teamA.team, teamB=teamB.team, points_teamA=teamA.points, points_teamB=teamB.points)
                saved_game.save()
                all_users = []
                for player in TournamentTeamUser.objects.filter(tournament=tournament, team=teamA.team):
                    all_users.append(player)
                for player in TournamentTeamUser.objects.filter(tournament=tournament, team=teamB.team):
                    all_users.append(player)

                for player in all_users:
                    saved_game.players.add(player)

                saved_game.save()

                if teamA.points >= teamB.points:
                    to_delete = TournamentTeam.objects.get(tournament=tournament, team=teamB.team)
                    to_delete.delete()

                    for tts in TournamentTeamUser.objects.filter(tournament=tournament, team=teamB.team):
                        tts.delete()
                elif teamB.points >= teamA.points:
                    to_delete = TournamentTeam.objects.get(tournament=tournament, team=teamA.team)
                    to_delete.delete()

                    for tts in TournamentTeamUser.objects.filter(tournament=tournament, team=teamA.team):
                        tts.delete()

            tournamentround.delete()
            check_tournament_win(tournament)
            if not tournament.finished:
                prepare_tournament_games(tournament, round)
            else:
                return HttpResponse(HttpResponse(json.dumps({"finished": "yes"}), content_type="application/json"))
        return HttpResponse(HttpResponse(json.dumps({"finished": "no"}), content_type="application/json"))
    except:
        return HttpResponse(HttpResponse(json.dumps({"finished": "no"}), content_type="application/json"))


def prepare_tournament_games(tournament, round):
    avaliable_teams = [i.team for i in TournamentTeam.objects.filter(tournament=tournament)]
    tournamentround = TournamentRound(tournament=tournament, round=round + 1)
    tournamentround.save()
    while len(avaliable_teams) % 2 == 0 and len(avaliable_teams) > 0:
        game = Game(tournament=tournament, duration=tournament.game_length)

        teamA = random.choice(avaliable_teams)
        avaliable_teams.remove(teamA)

        teamB = random.choice(avaliable_teams)
        avaliable_teams.remove(teamB)

        players_teamA = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=teamA)]
        players_teamB = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=teamB)]

        game.save()

        for player in players_teamA:
            game.players.add(player)

        for player in players_teamB:
            game.players.add(player)

        game_teamA = GameTeam(game=game, team=teamA)
        game_teamB = GameTeam(game=game, team=teamB)

        game_teamA.save()
        game_teamB.save()

        tournamentround.games.add(game)


def check_player_conectivity(Game, LoadingScreen):
    for player in Game.players.all():
        if player not in LoadingScreen.players.all():
            return False
    return True


@login_required()
def tournament_start_waiting(request, username, tournament_pk):
    if request.user.username != username:
        return render(request, "frontend/error-page.html")
    tournament = Tournament.objects.get(pk=int(tournament_pk))
    check_tournament_win(tournament)

    user_team = Team.objects.filter(team_member=request.user)[0]
    try:
        tournamentround = TournamentRound.objects.get(tournament=tournament)
    except:
        prepare_tournament_games(tournament, 0)
        tournamentround = TournamentRound.objects.get(tournament=tournament)

    if len(TournamentTeamUser.objects.filter(tournament=tournament, team=user_team)) == 0:
        return render(request, "frontend/lost-page.html")

    games_in_tournament = tournamentround.games.all()
    for game in games_in_tournament:
        if request.user in game.players.all():
            break

    if len(LoadingScreen.objects.filter(Game=game)) != 0:
        loadingscreen = LoadingScreen.objects.filter(Game=game)[0]
    else:
        loadingscreen = LoadingScreen(Game=game)
        loadingscreen.save()

    if request.user not in loadingscreen.players.all():
        loadingscreen.players.add(request.user)

    teamA = user_team
    teamB = GameTeam.objects.filter(game=game).exclude(team=teamA)[0].team
    context = {
        "game": game,
        "teamA": teamA,
        "teamB": teamB
    }
    if check_player_conectivity(game, loadingscreen):
        adminA = teamA.admin
        adminB = teamB.admin

        chosen_admin = random.choice([adminA, adminB])
        try:
            loadingscreenadmin = LoadingScreenAdmin.objects.get(loadingscreen=loadingscreen)
        except:
            loadingscreenadmin = LoadingScreenAdmin(loadingscreen=loadingscreen, admin=chosen_admin)
            loadingscreenadmin.save()
        return tournament_admin_start(request, username, tournament_pk)

    return render(request, "frontend/start-tournament-loading-page.html", context)


@login_required()
def tournament_admin_start(request, username, tournament_pk):
    if request.user.username != username:
        return render(request, "frontend/error-page.html")
    tournament = Tournament.objects.get(pk=int(tournament_pk))
    user_team = Team.objects.filter(team_member=request.user)[0]
    tournament_round = TournamentRound.objects.get(tournament=tournament)

    games_in_tournament = Game.objects.filter(tournament=tournament)
    for game in games_in_tournament:
        if request.user in game.players.all():
            break

    enemy_team = [i.team for i in GameTeam.objects.filter(game=game) if i.team != user_team][0]

    teammembers = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=user_team)]
    opponenets = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=enemy_team)]

    loadingscreen = LoadingScreen.objects.get(Game=game)
    loadingscreenadmin = LoadingScreenAdmin.objects.get(loadingscreen=loadingscreen)

    try:
        lsrp = LoadingScreenReadyPlayers.objects.get(loadingscreen=loadingscreen)
    except:
        lsrp = None
    if request.method == "POST":
        if "Admin Ready" in request.POST:
            loadingscreenadmin.ready = True
            loadingscreenadmin.save()
            lsrp = LoadingScreenReadyPlayers(loadingscreen=loadingscreen)
            lsrp.save()
            lsrp.players.add(request.user)
        elif "Player Ready" in request.POST:
            if request.user not in lsrp.players.all():
                lsrp.players.add(request.user)

    if lsrp is not None:
        if check_player_conectivity(game, lsrp):
            try:
                trrp = TournamentRoundReadyPlayers.objects.get(tournamentround=tournament_round)
            except:
                trrp = TournamentRoundReadyPlayers(tournamentround=tournament_round)
            trrp.save()
            return redirect('core:game_livestream_dashboard', username=request.user.username,
                            tournament_pk=str(tournament.pk))

    context = {
        "username": username,
        "tournament_pk": tournament_pk,
        "game": game,
        "teamA": user_team,
        "teamB": enemy_team,
        "teammembers": teammembers,
        "opponenets": opponenets,
        "loadingscreenadmin": loadingscreenadmin
    }

    if request.user == loadingscreenadmin.admin:
        return render(request, "frontend/start-tournament-set-up-admin.html", context=context)
    else:
        return render(request, "frontend/start-tournament-set-up-waiting.html", context=context)


def clean_game_name(name):
    return name.replace(":", "")


def start_stream(camera, directory, user, tournament_pk, to_predict):
    index = 1
    predictions = []
    tournament = Tournament.objects.get(pk=int(tournament_pk))
    tournament_round = TournamentRound.objects.get(tournament=tournament)
    game_name = tournament.game_name

    round = TournamentRound.objects.get(tournament=tournament)
    game = [i for i in round.games.all() if user in i.players.all()][0]

    user_team = Team.objects.filter(team_member=user)[0]

    game_team = GameTeam.objects.get(game=game, team=user_team)

    teammembers = [i for i in TournamentTeamUser.objects.filter(tournament=tournament, team=user_team)]
    tournament_team_user = TournamentTeamUser.objects.get(tournament=tournament, user=user, team=user_team)
    template = cv2.imread(
        f'{settings.STATICFILES_DIRS[0]}/project-static/Models/{clean_game_name(game_name)}/{clean_game_name(game_name)}.png',
        0)

    detected_delay = None
    while True:
        frame, image, resized = camera.get_frame()
        if to_predict and tournament_round.started:
            if index % 10 == 0:
                predictions.append(predict_win(template, image))
            if detected_delay is not None:
                if detected_delay % 5 == 0:
                    if user_team.admin == user:
                        total_detected_wins = 0
                        for teammember in teammembers:
                            if teammember.detected_win:
                                total_detected_wins += 1
                        if total_detected_wins >= int(len(teammembers) / 2):
                            game_team.points = game_team.points + 1
                            game_team.save()

                    detected_delay = None
                    tournament_team_user.detected_win = False
                    tournament_team_user.save()

            if len(predictions) == 10:
                print(predictions)
                wins_detected = np.where(np.array(predictions) == 1)[0].shape[0]
                if wins_detected / len(predictions) >= 0.3:
                    tournament_team_user.detected_win = True
                    tournament_team_user.save()
                    detected_delay = 0
                predictions = []

        with open(f"{directory}frame-{index}", "wb+") as f:
            f.write(resized)
            f.close()
        if index > 30:
            os.remove(f"{directory}frame-{index - 30}")

        if detected_delay is not None:
            detected_delay += 1
        index += 1

        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + resized + b'\r\n\r\n')


def load_feed(directory):
    while True:
        with open(directory + os.listdir(directory)[1], "rb") as f:
            frame = f.read()
            f.close()
            yield (b'--frame\r\n'
                   b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')


def video_feed_host(request, username, tournament_pk):
    Path(f"media/livestreams/{tournament_pk}/").mkdir(parents=True, exist_ok=True)
    Path(f"media/livestreams/{tournament_pk}/{username}").mkdir(parents=True, exist_ok=True)
    Path(f"media/livestreams/{tournament_pk}/{username}/webcam/").mkdir(parents=True, exist_ok=True)
    for file in os.listdir(f"media/livestreams/{tournament_pk}/{username}/webcam/"):
        os.remove(f"media/livestreams/{tournament_pk}/{username}/webcam/" + file)
    directory = f"media/livestreams/{tournament_pk}/{username}/webcam/"
    response = StreamingHttpResponse(start_stream(VideoCamera(), directory, request.user, tournament_pk, False),
                                     content_type='multipart/x-mixed-replace; boundary=frame')
    return response


def screen_feed_host(request, username, tournament_pk):
    Path(f"media/livestreams/{tournament_pk}/").mkdir(parents=True, exist_ok=True)
    Path(f"media/livestreams/{tournament_pk}/{username}").mkdir(parents=True, exist_ok=True)
    Path(f"media/livestreams/{tournament_pk}/{username}/video_feed/").mkdir(parents=True, exist_ok=True)
    for file in os.listdir(f"media/livestreams/{tournament_pk}/{username}/video_feed/"):
        os.remove(f"media/livestreams/{tournament_pk}/{username}/video_feed/" + file)
    directory = f"media/livestreams/{tournament_pk}/{username}/video_feed/"
    response = StreamingHttpResponse(start_stream(ScreenCapture(), directory, request.user, tournament_pk, True),
                                     content_type='multipart/x-mixed-replace; boundary=frame')
    return response


def video_feed(request, username, tournament_pk):
    directory = f"media/livestreams/{tournament_pk}/{username}/video_feed/"
    response = StreamingHttpResponse(load_feed(directory),
                                     content_type='multipart/x-mixed-replace; boundary=frame')
    return response


def screen_feed(request, username, tournament_pk):
    directory = f"media/livestreams/{tournament_pk}/{username}/webcam/"
    response = StreamingHttpResponse(load_feed(directory),
                                     content_type='multipart/x-mixed-replace; boundary=frame')
    return response


def game_livestream_dashboard(request, username, tournament_pk):
    tournament = Tournament.objects.get(pk=int(tournament_pk))
    games = TournamentRound.objects.get(tournament=tournament).games.all()
    tournamentround = TournamentRound.objects.get(tournament=tournament)
    trrp = TournamentRoundReadyPlayers.objects.get(tournamentround=tournamentround)

    if request.user not in tournamentround.players.all():
        tournamentround.players.add(request.user)

    for game in games:
        if request.user in game.players.all():
            break

    user_team = Team.objects.filter(team_member=request.user)[0]
    enemy_team = [i.team for i in GameTeam.objects.filter(game=game) if i.team != user_team][0]

    user_game_team = GameTeam.objects.get(game=game, team=user_team)
    enemy_game_team = GameTeam.objects.get(game=game, team=enemy_team)

    teammembers = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=user_team)]
    opponenets = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=enemy_team)]

    teammembers = {i: j for i, j in enumerate(teammembers, start=1)}

    tournament_team_user = TournamentTeamUser.objects.get(tournament=tournament, user=request.user, team=user_team)

    stream_ready = tournament_team_user.live
    show_camera = False
    show_video = False

    if request.method == "POST":
        if "Ready" in request.POST:
            stream_ready = True
            tournament_team_user.live = True
            tournament_team_user.save()
            trrp.players.add(request.user)

    if len(trrp.players.all()) == len(tournamentround.players.all()):
        if not tournamentround.started:
            tournamentround.started = True
            tournamentround.start_time = now()
            tournamentround.save()
    end_time = tournamentround.start_time + timedelta(minutes=3)
    now_time = now()
    distance_seconds = (end_time - now_time).total_seconds()
    player_ready = request.user in trrp.players.all()

    context = {
        "username": username,
        "tournament_pk": tournament_pk,
        "show_camera": show_camera,
        "show_video": show_video,
        "user_team": user_team,
        "enemy_team": enemy_team,
        "teammembers": teammembers,
        "opponenets": opponenets,
        "stream_ready": stream_ready,
        "user_game_team": user_game_team,
        "enemy_game_team": enemy_game_team,
        "tournamentround": tournamentround,
        "player_ready": player_ready,
        "end_time": end_time.timestamp(),
        "now": now_time.timestamp(),
        "distance_seconds": distance_seconds
    }

    return render(request, "frontend/tournament-streaming-dashboard.html", context=context)


def update_points(request):
    if request.is_ajax():
        user_game_team = GameTeam.objects.get(pk=int(request.GET['user_game_team']))
        enemy_game_team = GameTeam.objects.get(pk=int(request.GET['enemy_game_team']))
    context = {
        "user_game_team": user_game_team,
        "enemy_game_team": enemy_game_team
    }
    return render(request, "frontend/scoreboard.html", context=context)


def livestream_view_page(request, tournament_pk, username):
    try:
        tournament = Tournament.objects.get(pk=tournament_pk)
    except:
        return render(request, "frontend/error-page.html")

    if tournament.finished:
        return render(request, "frontend/error-page.html")

    user = [i for i in TournamentTeamUser.objects.filter(tournament=tournament) if i.user.username == username][0].user
    user_team = Team.objects.filter(team_member=user)[0]
    tournament_team_users = TournamentTeamUser.objects.filter(tournament=tournament)
    if len(tournament_team_users) == 0:
        return render(request, "frontend/error-page.html")
    else:
        tournament_team_user = TournamentTeamUser.objects.get(tournament=tournament, user=user, team=user_team)
        if tournament_team_user.live == False:
            return render(request, "frontend/error-page.html")

    games = TournamentRound.objects.get(tournament=tournament).games.all()

    for game in games:
        if request.user in game.players.all():
            break

    enemy_team = [i.team for i in GameTeam.objects.filter(game=game) if i.team != user_team][0]

    teammembers = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=user_team)]
    opponenets = [i.user for i in TournamentTeamUser.objects.filter(tournament=tournament, team=enemy_team)]

    user_game_team = GameTeam.objects.get(game=game, team=user_team)
    enemy_game_team = GameTeam.objects.get(game=game, team=enemy_team)

    context = {"username": username,
               "tournament_pk": tournament_pk,
               "teammembers": teammembers,
               "opponenets": opponenets,
               "user_team": user_team,
               "enemy_team": enemy_team,
               "tournament": tournament,
               "user_game_team": user_game_team,
               "enemy_game_team": enemy_game_team,
               "game": game, }
    return render(request, "frontend/livestream-display.html", context=context)


@login_required()
def follow_community(request):
    community_list = Community.objects.filter(status=True).order_by('name')
    search = ""
    if request.method == 'POST':
        search = request.POST.get('search')
        community_list = community_list.filter(name__icontains=search)

    page = request.GET.get('page', 1)
    paginator = Paginator(community_list, 15)
    try:
        community_lists = paginator.page(page)
    except PageNotAnInteger:
        community_lists = paginator.page(1)
    except EmptyPage:
        community_lists = paginator.page(paginator.num_pages)

    context = {
        'community_list': community_lists,
        'search': search,
    }
    return render(request, 'frontend/follow_community.html', context)


@login_required
def community_following(request):
    if request.is_ajax():
        community_id = int(request.GET.get('community_id'))
        user_id = request.user.id
        Follow.objects.create(user_id=user_id, community_id=community_id)
        return JsonResponse({"message": "Following"})


@login_required
def community_details(request, id):
    community = Community.objects.get(id=id)
    follower = Follow.objects.filter(community_id=id).count()
    comment_list = Communityforum.objects.filter(community_id=id).order_by('-datetime')
    community_list = Follow.objects.filter(user_id=request.user.id)
    context = {
        'community': community,
        'follower': follower,
        'comment_list': comment_list,
        'community_list': community_list,
    }
    return render(request, 'frontend/community_details.html', context)


@login_required
def add_communitycontent(request, id): 
    if request.method == 'POST':
        profile_pic = request.FILES.get('profile_image')
        fs = FileSystemStorage()
        fname = fs.save(profile_pic.name, profile_pic)
        upload_file_url = fs.url(fname)
        content = request.POST.get('content')
        return redirect('core:publish_communitycontent', cid=id, image=profile_pic, content=content)

    context = {
        'id': id
    }
    return render(request, 'frontend/add_communitycontent.html', context)


@login_required
def publish_communitycontent(request, cid, image, content):
    user_id = request.user.id
    if request.method == 'POST':
        Communityforum.objects.create(user_id=user_id, community_id=cid, image=image, content=content)
        return redirect('core:community_details', cid)
    context = {
        'content': content,
        'image': image,
        'cid': cid,
    }
    return render(request, 'frontend/publish_communitycontent.html', context)


@login_required
def add_like(request):
    if request.is_ajax():
        content_id = int(request.GET.get('content_id'))
        communityforum = Communityforum.objects.get(id=content_id)
        notification_recever = communityforum.user.id
        user_id = request.user.id
        user = User.objects.get(id=user_id)
        Like.objects.create(user_id=user_id, communityforum_id=content_id)
        ntfc_title = "{} liked your community content".format(user.username)
        notification_msg = "{} liked your community content".format(user.username)
        Notification.objects.create(user_id=notification_recever, title=ntfc_title, message=notification_msg)
        return JsonResponse({"message": "Liked"})


@login_required
def add_usercomment(request, forum_id):
    user_id = request.user.id
    user = User.objects.get(id=user_id)
    community_forum = Communityforum.objects.get(id=forum_id)
    comments_list = Usercomment.objects.filter(commented_forum_id=forum_id).order_by('-datetime')

    page = request.GET.get('page', 1)
    paginator = Paginator(comments_list, 5)
    try:
        numbers = paginator.page(page)
    except PageNotAnInteger:
        numbers = paginator.page(1)
    except EmptyPage:
        numbers = paginator.page(paginator.num_pages)

    if request.method == 'POST':
        comment_text = request.POST.get('comment')
        Usercomment.objects.create(commented_user_id=user_id, commented_forum_id=forum_id, comment_text=comment_text)

        community_url = "/add-usercomment/{}".format(forum_id)
        ntfc_title = "{} commented on your community content".format(user.username)
        notification_msg = """
        <p style="font-size:16px; margin-bottom:10px;"><strong>{}</strong> commented on your community content. Check the comment by clicking the following button. </p>
        <a style="float:left;width:150px;padding:10px;display:inline-block; margin-right:10px;background:green;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Check Comment</a>
        """.format(user.username, community_url)
        Notification.objects.create(user_id=community_forum.user.id, title=ntfc_title, message=notification_msg)

        return redirect('core:add_usercomment', forum_id)

    context = {
        'comments_list': numbers,
        'community_forum': community_forum,
    }
    return render(request, 'frontend/add_usercomment.html', context)


@login_required
def comment_edit(request, id):
    if request.method == 'POST':
        new_comment = request.POST.get('new_comment')
        user_comment = Usercomment.objects.get(id=id)
        user_comment.comment_text = new_comment
        user_comment.save()
        return redirect('core:add_usercomment', user_comment.commented_forum.id)


@login_required
def comment_delete(request, id):
    user_comment = Usercomment.objects.get(id=id)
    user_comment.delete()
    return redirect('core:add_usercomment', user_comment.commented_forum.id)


import json


def get_places(request):
    if request.is_ajax():
        q = request.GET.get('term', '')
        places = Community.objects.filter(name__icontains=q)
        results = []
        for pl in places:
            place_json = {}
            place_json = pl.name
            results.append(place_json)
        data = json.dumps(results)
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype)


def team_default(request):
    user_id = request.user.id
    try:
        friend_list = Friend.objects.get(user_id=user_id)
    except:
        friend_list = None

    team_list = Team.objects.all()
    context = {
        'friend_list': friend_list,
        'team_list': team_list,
    }
    return render(request, 'frontend/team_default.html', context)


def create_team(request):
    admin_id = request.user.id
    admin_team_check = Team.objects.filter(admin_id=admin_id)
    if admin_team_check.exists():
        team = admin_team_check[0]
        return redirect('core:team_details', team.id)

    hash_tags = Hashtag.objects.filter(status=True)
    try:
        friend_list = Friend.objects.get(user_id=request.user.id)
    except:
        friend_list = None

    if request.method == "POST":
        bg_image = request.FILES.get('background_image')
        fs = FileSystemStorage()
        fname = fs.save(bg_image.name, bg_image)
        upload_file_url = fs.url(fname)

        logo_image = request.FILES.get('team_logo')
        fs = FileSystemStorage()
        fname = fs.save(logo_image.name, logo_image)
        upload_file_url = fs.url(fname)
        team_name = request.POST.get("team_name")
        tag_list = request.POST.getlist('tags[]')
        team_member_list = request.POST.getlist('members[]')
        hashtag_size = len(tag_list)
        team_member_size = len(team_member_list)
        if hashtag_size > 8:
            messages.error(request, "You have selected More than 8 Hash Tags")
            return redirect('core:create_team')
        else:
            if team_member_size > 10:
                messages.error(request, "You have selected More than 10 Tem members")
                return redirect('core:create_team')
            else:
                team_name_check = Team.objects.filter(name=team_name)

                if team_name_check.exists():
                    messages.error(request, "Team name already existed")
                    return redirect('core:create_team')

                team = Team.objects.create(name=team_name, admin_id=admin_id, logo=logo_image,
                                           background_image=bg_image)
                for tag in tag_list:
                    tag = Hashtag.objects.get(id=tag)
                    team.hastag.add(tag)

                if team_member_list:
                    for member in team_member_list:
                        team_invite = Teaminvite.objects.create(team_id=team.id, member_id=member)
                        ntfc_title = "Invaitation to Join {} Team".format(team_name)
                        accept_url = "/invaitation-accept/{}/{}".format(team.id, team_invite.id)
                        decline_url = "/invaitation-decline/{}/{}".format(team.id, team_invite.id)
                        notification_msg = """
                            <p style="font-size:16px; margin-bottom:10px;"><strong>{}</strong> sent you invaitation to join the the team <strong>{}</strong>.</p> <br> 
                            <a style="float:left;width:100px;padding:10px;display:inline-block; margin-right:10px;background:green;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Accept</a>
                            <a style="float:left;width:100px;padding:10px;display:inline-block; margin-right:10px;background:red;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Decline</a> 
                        """.format(request.user.username, team_name, accept_url, decline_url)
                        Notification.objects.create(user_id=member, title=ntfc_title, message=notification_msg)

                admin_member = User.objects.get(id=request.user.id)
                team.team_member.add(admin_member)
                return redirect('core:team_details', team.id)

    context = {
        'hash_tags': hash_tags,
        'friend_list': friend_list,
    }
    return render(request, 'frontend/create_team.html', context)

SLIDER_IDS = ["w-node-2ce24cdb9956-d514f07c", "w-node-2ce24cdb9963-d514f07c", "w-node-2ce24cdb9970-d514f07c", "w-node-2ce24cdb997d-d514f07c", "w-node-2ce24cdb998a-d514f07c"]

def team_details(request, id):
    team = Team.objects.get(id=id)
    number_of_game_wins = []
    all_prev_games = []
    teamAwins = PreviousGame.objects.filter(teamA=team)
    teamBwins = PreviousGame.objects.filter(teamB=team)

    for i in teamAwins:
        all_prev_games.append(i)
        if i.points_teamA > i.points_teamB:
            number_of_game_wins.append(i)

    for i in teamBwins:
        all_prev_games.append(i)
        if i.points_teamB > i.points_teamA:
            number_of_game_wins.append(i)

    prev_games = []
    for index in range(0, len(all_prev_games), 7):
        next_index = index + 7
        if next_index > len(all_prev_games):
            next_index = len(all_prev_games)
        prev_games.append(list(zip(all_prev_games[index:next_index], SLIDER_IDS[0:next_index-index])))

    number_of_tournament_wins = len(TournamentWin.objects.filter(team=team))
    number_of_game_wins = len(number_of_game_wins)
    context = {
        'team': team,
        "number_of_tournament_wins": number_of_tournament_wins,
        "number_of_game_wins": number_of_game_wins,
        "prev_games": prev_games
    }
    return render(request, 'frontend/team_details.html', context)


def team_update(request, id):
    team = Team.objects.get(id=id)
    if request.method == "POST":
        bg_image = request.FILES.get('bg_image')
        logo_image = request.FILES.get('logo_image')

        if bg_image:
            fs = FileSystemStorage()
            fname = fs.save(bg_image.name, bg_image)
            upload_file_url = fs.url(fname)
            team.background_image = bg_image

        if logo_image:
            fs = FileSystemStorage()
            fname = fs.save(logo_image.name, logo_image)
            upload_file_url = fs.url(fname)
            team.logo = logo_image

        team.save()
        return redirect('core:team_details', id)


def invaitation_decline(request, team_id, invite_id):
    user = User.objects.get(id=request.user.id)
    team_invite = Teaminvite.objects.get(id=invite_id)
    if team_invite.receive_status:
        messages.success(request, "You have already Accepted this invaitation")
        return redirect("core:notification_list")

    if not team_invite.status:
        messages.success(request, "You have already declined this invaitation")
        return redirect("core:notification_list")

    team = Team.objects.get(id=team_id)
    team_invite.status = False
    team_invite.save()
    ntfc_title = "{} declined the Invaitation".format(user.username, team.name)
    notification_msg = """
        <p style="font-size:16px; margin-bottom:10px;">"<strong>{}</strong> declined the invaitation to join the Team <strong>{}</strong> "</p> <br> 
    """.format(user.username, team.name)
    Notification.objects.create(user_id=team.admin.id, title=ntfc_title, message=notification_msg)
    return redirect("core:notification_list")


def invaitation_accept(request, team_id, invite_id):
    team = Team.objects.get(id=team_id)
    user = User.objects.get(id=request.user.id)
    user_check = user.team_set.filter(id=team_id)
    team_invite = Teaminvite.objects.get(id=invite_id)

    if not team_invite.status:
        messages.success(request, "You have already declined this invaitation")
        return redirect("core:notification_list")
    if user_check.exists():
        messages.success(request, "You have already Accepted this invaitation")
        return redirect("core:notification_list")
    else:
        team_invite.receive_status = True
        team_invite.save()
        team.team_member.add(user)
        ntfc_title = "{} jointed the Team {}".format(user.username, team.name)
        team_url = "/team-details/{}".format(team.id)
        notification_msg = """
            <p style="font-size:16px; margin-bottom:10px;">"<strong>{}</strong> accepted the invaitation and jointed the Team <strong>{}</strong> "</p> <br> 
            <a style="float:left;width:130px;padding:10px;display:inline-block; margin-right:10px;background:green;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Check Team</a> 
        """.format(user.username, team.name, team_url)
        Notification.objects.create(user_id=team.admin.id, title=ntfc_title, message=notification_msg)

        return redirect('core:team_details', team_id)


def notification_list(request):
    user_id = request.user.id
    notifications = Notification.objects.filter(user_id=user_id).order_by('-date')

    page = request.GET.get('page', 1)
    paginator = Paginator(notifications, 5)
    try:
        ntfc_list = paginator.page(page)
    except PageNotAnInteger:
        ntfc_list = paginator.page(1)
    except EmptyPage:
        ntfc_list = paginator.page(paginator.num_pages)

    context = {
        'notifications': ntfc_list
    }
    return render(request, 'frontend/notification_list.html', context)


def notification_details(request, id):
    notification = Notification.objects.get(id=id)
    notification.view_status = True
    notification.save()
    context = {
        'notification': notification
    }
    return render(request, 'frontend/notification_details.html', context)


def add_team_member(request, team_id):
    return render(request, 'frontend/add_team_member.html')


def search_team_player(request,cid):
    user = User.objects.get(id=request.user.id)
    team_list = user.team_set.all()
    if request.method == 'POST':
        query = request.POST.get('query')
        query_team = Team.objects.filter(name__icontains=query)
        query_player = User.objects.filter(username__icontains=query)
        context = {
            'team_list': team_list,
            'query_team': query_team,
            'query_player': query_player, 
            'cid': cid, 
        }
    else:
        context = {
            'team_list': team_list, 
            'cid': cid, 
        }
    return render(request, 'frontend/search_team_player.html', context)


def player_profile(request, id):
    player = User.objects.get(id=id)
    team = player.team_set.all()[0]
    team_list = player.team_set.all()
    friend_list = player.friend_set.all()

    tournament_wins = player.tournamentwin_set.all()
    all_prev_games = player.previousgame_set.all()


    number_of_game_wins = []
    for prev_game in all_prev_games:
        if prev_game.teamA == team:
            if prev_game.points_teamA > prev_game.points_teamB:
                number_of_game_wins.append(prev_game)
        elif prev_game.teamB == team:
            if prev_game.points_teamB > prev_game.points_teamA:
                number_of_game_wins.append(prev_game)

    prev_games = []
    for index in range(0, len(all_prev_games), 7):
        next_index = index + 7
        if next_index > len(all_prev_games):
            next_index = len(all_prev_games)
        prev_games.append(list(zip(all_prev_games[index:next_index], SLIDER_IDS[0:next_index-index])))

    number_of_tournament_wins = len(tournament_wins)
    number_of_game_wins = len(number_of_game_wins)

    context = {
        'player': player,
        'team_list': team_list,
        'friend_list': friend_list,
        "number_of_tournament_wins": number_of_tournament_wins,
        "number_of_game_wins": number_of_game_wins,
        "prev_games": prev_games
    }
    return render(request, 'frontend/player_profile.html', context)

def team_viewer_page(request, team_pk):
    user = request.user
    team = Team.objects.get(pk=team_pk)
    number_of_game_wins = []
    all_prev_games = []

    teamAwins = PreviousGame.objects.filter(teamA=team)
    teamBwins = PreviousGame.objects.filter(teamB=team)

    sub = Subscription.objects.filter(team=team, user=request.user)
    subscribed = False
    if len(sub) != 0:
        subscribed = True


    for i in teamAwins:
        all_prev_games.append(i)
        if i.points_teamA > i.points_teamB:
            number_of_game_wins.append(i)

    for i in teamBwins:
        all_prev_games.append(i)
        if i.points_teamB > i.points_teamA:
            number_of_game_wins.append(i)

    prev_games = []
    for index in range(0, len(all_prev_games), 7):
        next_index = index + 7
        if next_index > len(all_prev_games):
            next_index = len(all_prev_games)
        prev_games.append(list(zip(all_prev_games[index:next_index], SLIDER_IDS[0:next_index-index])))

    number_of_subs = len(Subscription.objects.filter(team=team))

    number_of_tournament_wins = len(TournamentWin.objects.filter(team=team))
    number_of_game_wins = len(number_of_game_wins)
    context = {
        "user": user,
        'team': team,
        "number_of_tournament_wins": number_of_tournament_wins,
        "number_of_game_wins": number_of_game_wins,
        "prev_games": prev_games,
        "subscribed": subscribed,
        "number_of_subs": number_of_subs
    }
    return render(request, 'frontend/team-page-for-viewers.html', context)

def player_profile_update(request):
    id = request.user.id
    player = Mainuser.objects.get(user_id=id)
    if request.method == "POST":
        bg_image = request.FILES.get('bg_image')
        logo_image = request.FILES.get('logo_image')
        gaming_platform = request.POST.get('gaming_platform')
        if bg_image:
            fsb = FileSystemStorage()
            fnameb = fsb.save(bg_image.name, bg_image)
            upload_file_url = fsb.url(fnameb)
            player.bgimage = bg_image

        if logo_image:
            fs = FileSystemStorage()
            fname = fs.save(logo_image.name, logo_image)
            upload_file_url = fs.url(fname)
            player.profile_pic = logo_image

        player.gaming_platform = gaming_platform
        player.save()
        return redirect('core:player_profile', id)


def create_inappropiate_post(request, forum_id, community_id):
    user_id = request.user.id
    Foruminappropiate.objects.create(user_id=user_id, forum_id=forum_id)
    return redirect('core:community_details', community_id)


def send_friend_request(request, recever_id):
    sender_id = request.user.id
    sender = User.objects.get(id=sender_id)
    friend_request = Friendrequest.objects.create(serner_id=sender_id, recever_id=recever_id)
    ntfc_title = "{} send you friend request".format(sender.username)
    accept_url = "/friend-request-accept/{}/{}".format(sender_id, friend_request.id)
    decline_url = "/friend-request-decline/{}/{}".format(sender_id, friend_request.id)
    notification_msg = """
        <p style="font-size:16px; margin-bottom:10px;"><strong>{}</strong> sent you friend request</p> <br> 
        <a style="float:left;width:100px;padding:10px;display:inline-block; margin-right:10px;background:green;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Accept</a>
        <a style="float:left;width:100px;padding:10px;display:inline-block; margin-right:10px;background:red;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Decline</a> 
    """.format(sender.username, accept_url, decline_url)
    Notification.objects.create(user_id=recever_id, title=ntfc_title, message=notification_msg)
    return redirect('core:player_profile', recever_id)


def friend_request_accept(request, sender_id, request_id):
    friend_request = Friendrequest.objects.get(id=request_id)
    if friend_request.status == False:
        messages.success(request, "You have already cancelled the friend request")
        return redirect('core:notification_list')

    if friend_request.accepted_status == True:
        messages.success(request, "You have already accepted the friend request")
        return redirect('core:notification_list')

    sender = User.objects.get(id=sender_id)
    user_id = request.user.id
    friend_object, created = Friend.objects.get_or_create(user_id=user_id)
    friend_object.friend_list.add(sender)

    user = User.objects.get(id=user_id)
    friend_object_sender, created = Friend.objects.get_or_create(user_id=sender_id)
    friend_object_sender.friend_list.add(user)

    friend_request.accepted_status = True
    friend_request.save()

    ntfc_title = "{} accepted friend request".format(user.username)
    profile_url = '/player-profile/{}'.format(user_id)
    notification_msg = """
        <p style="font-size:16px; margin-bottom:10px;"><strong>{}</strong> friend your friend request. </p> <br> 
        <a style="float:left;width:130px;padding:10px;display:inline-block; margin-right:10px;background:green;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">View Profile</a> 
    """.format(user.username, profile_url)
    Notification.objects.create(user_id=sender_id, title=ntfc_title, message=notification_msg)
    return redirect('core:player_profile', user_id)


def friend_request_decline(request, sender_id, request_id):
    friend_request = Friendrequest.objects.get(id=request_id)
    if friend_request.status == False:
        messages.success(request, "You have already cancelled the friend request")
        return redirect('core:notification_list')

    if friend_request.accepted_status == True:
        messages.success(request, "You have already accepted the friend request")
        return redirect('core:notification_list')

    friend_request.accepted_status = False
    friend_request.status = False
    friend_request.save()

    user = User.objects.get(id=request.user.id)
    sender = User.objects.get(id=sender_id)

    ntfc_title = "{} declined your friend request".format(user.username)
    notification_msg = """
        <p style="font-size:16px; margin-bottom:10px;"><strong>{}</strong> declined your friend request. </p> 
    """.format(user.username)
    Notification.objects.create(user_id=sender_id, title=ntfc_title, message=notification_msg)

    return redirect('core:notification_list')


def friend_request_cancel(request, recever_id):
    sender_id = request.user.id
    request = Friendrequest.objects.filter(serner_id=sender_id, recever_id=recever_id)
    request.delete()
    return redirect('core:player_profile', recever_id)


def joining_team_request(request, team_id, team_admin_id):
    user_id = request.user.id
    team = Team.objects.get(id=team_id)
    user = User.objects.get(id=user_id)
    total_team_joined = user.team_set.all().count()
    if total_team_joined >= 5:
        messages.warning(request, "You have already joined 5 teams")
        return redirect('core:team_details', team_id)
    else:
        total_invite = Teaminvite.objects.filter(member_id=user_id, receive_status=False, status=True).count()
        total_active = total_team_joined + total_invite
        if total_active >= 5:
            messages.warning(request, "You have joined {} team and you have send {} invaitations").format(
                total_team_joined, total_invite)
        else:
            team_invite = Teaminvite.objects.create(team_id=team_id, member_id=user_id)
            ntfc_title = "Invaitation to Join {} Team".format(team.name)
            accept_url = "/invaitation-accept/{}/{}".format(team.id, team_invite.id)
            decline_url = "/invaitation-decline/{}/{}".format(team.id, team_invite.id)
            notification_msg = """
                <p style="font-size:16px; margin-bottom:10px;"><strong>{}</strong> sent you invaitation to join the the team <strong>{}</strong>.</p> <br> 
                <a style="float:left;width:100px;padding:10px;display:inline-block; margin-right:10px;background:green;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Accept</a>
                <a style="float:left;width:100px;padding:10px;display:inline-block; margin-right:10px;background:red;text-decoration:none;border-radius:4px;font-size:16px;text-align:center;color:#fff" href="{}">Decline</a> 
            """.format(request.user.username, team.name, accept_url, decline_url)
            Notification.objects.create(user_id=team_admin_id, title=ntfc_title, message=notification_msg)

    return redirect('core:team_details', team_id)

def subscribe_to_team(request):
    if request.is_ajax():
        user_pk = request.GET["user_pk"]
        team_pk = request.GET["team_pk"]

        user = User.objects.get(pk=user_pk)
        team = Team.objects.get(pk=team_pk)

    prev_sub = Subscription.objects.filter(user=user, team=team)
    if len(prev_sub) == 0:
        new_sub = Subscription(user=user, team=team)
        new_sub.save()
        data = {"status": "subbed"}
        ntfc_title = "Subscribed to team"
        notification_msg = f"""<p style="font-size:16px; margin-bottom:10px;">You subscribed to team {team.name}</p>"""
    else:
        sub = prev_sub[0]
        sub.delete()
        data = {"status": "unsubbed"}
        ntfc_title = "Unsubscribed from team"
        notification_msg = f"""<p style="font-size:16px; margin-bottom:10px;">You unsubscribed from team {team.name}</p>"""

    data["num_of_subs"] = len(Subscription.objects.filter(team=team))

    Notification.objects.create(user_id=user.id, title=ntfc_title, message=notification_msg)

    return HttpResponse(
        json.dumps(data),
        content_type="application/json"
    )
