from django.contrib import admin
from .models import *
from import_export.admin import ImportExportModelAdmin

# Register your models here.


@admin.register(Community)
class CommunityAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Community

@admin.register(Communityforum)
class CommunityforumAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Communityforum
 

@admin.register(Follow)
class FollowAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Follow
 

@admin.register(Like)
class LikeAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Like
 

@admin.register(Usercomment)
class UsercommentAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Usercomment
 

@admin.register(Hashtag)
class HashtagAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Hashtag
 

@admin.register(Friend)
class FriendAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Friend
 

@admin.register(Notification)
class NotificationAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Notification
 

@admin.register(Team)
class TeamAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Team
 

@admin.register(Teaminvite)
class TeaminviteAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Teaminvite
 

@admin.register(Friendrequest)
class FriendrequestAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Friendrequest
 

@admin.register(Foruminappropiate)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    
    class Meta:
        model = Foruminappropiate


@admin.register(TournamentInvite)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = TournamentInvite


@admin.register(GameTeam)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = GameTeam


@admin.register(TournamentTeam)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = TournamentTeam

@admin.register(TournamentTeamUser)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = TournamentTeamUser

@admin.register(TournamentRound)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = TournamentRound

@admin.register(Tournament)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = Tournament

@admin.register(TournamentWin)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = TournamentWin

@admin.register(Game)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = Game

@admin.register(LivestreamMessage)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = LivestreamMessage

@admin.register(Challenge)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = Challenge

@admin.register(Subscription)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = Subscription

@admin.register(PreviousGame)
class ForuminappropiateAdmin(ImportExportModelAdmin):
    class Meta:
        model = PreviousGame