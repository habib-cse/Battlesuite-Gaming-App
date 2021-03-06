PGDMP                     
    x            battlesuite    12.1    12.2 O   W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    18130    battlesuite    DATABASE     }   CREATE DATABASE battlesuite WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE battlesuite;
                habiburrahman    false            �            1259    18301    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            �            1259    18299    account_emailaddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    222            [           0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    221            �            1259    18311    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            �            1259    18309     account_emailconfirmation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    224            \           0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    223            �            1259    18427    accounts_mainuser    TABLE     B  CREATE TABLE public.accounts_mainuser (
    id integer NOT NULL,
    profile_pic character varying(100),
    pro_status boolean NOT NULL,
    pro_signup_type character varying(50),
    status boolean NOT NULL,
    user_id integer NOT NULL,
    bgimage character varying(100),
    gaming_platform character varying(500)
);
 %   DROP TABLE public.accounts_mainuser;
       public         heap    postgres    false            �            1259    18425    accounts_mainuser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_mainuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.accounts_mainuser_id_seq;
       public          postgres    false    236            ]           0    0    accounts_mainuser_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.accounts_mainuser_id_seq OWNED BY public.accounts_mainuser.id;
          public          postgres    false    235            �            1259    18162 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    18160    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            ^           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    18172    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    18170    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            _           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    18154    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    18152    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            `           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    18180 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    18190    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    18188    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            a           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    18178    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            b           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    18198    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    18196 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            c           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    18471    core_communityforum    TABLE       CREATE TABLE public.core_communityforum (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    content text NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    community_id integer NOT NULL,
    user_id integer NOT NULL
);
 '   DROP TABLE public.core_communityforum;
       public         heap    postgres    false            �            1259    18469    core_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_comment_id_seq;
       public          postgres    false    242            d           0    0    core_comment_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.core_comment_id_seq OWNED BY public.core_communityforum.id;
          public          postgres    false    241            �            1259    18442    core_community    TABLE     �   CREATE TABLE public.core_community (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    image character varying(100) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL
);
 "   DROP TABLE public.core_community;
       public         heap    postgres    false            �            1259    18440    core_community_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_community_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.core_community_id_seq;
       public          postgres    false    238            e           0    0    core_community_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.core_community_id_seq OWNED BY public.core_community.id;
          public          postgres    false    237            �            1259    18450    core_follow    TABLE     �   CREATE TABLE public.core_follow (
    id integer NOT NULL,
    following_date timestamp with time zone NOT NULL,
    community_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.core_follow;
       public         heap    postgres    false            �            1259    18448    core_follow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_follow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_follow_id_seq;
       public          postgres    false    240            f           0    0    core_follow_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_follow_id_seq OWNED BY public.core_follow.id;
          public          postgres    false    239            
           1259    19002    core_foruminappropiate    TABLE     �   CREATE TABLE public.core_foruminappropiate (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    forum_id integer NOT NULL,
    user_id integer NOT NULL
);
 *   DROP TABLE public.core_foruminappropiate;
       public         heap    postgres    false            	           1259    19000    core_foruminappropiate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_foruminappropiate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.core_foruminappropiate_id_seq;
       public          postgres    false    266            g           0    0    core_foruminappropiate_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.core_foruminappropiate_id_seq OWNED BY public.core_foruminappropiate.id;
          public          postgres    false    265                       1259    18879    core_friend    TABLE     �   CREATE TABLE public.core_friend (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.core_friend;
       public         heap    postgres    false                       1259    18887    core_friend_friend_list    TABLE     �   CREATE TABLE public.core_friend_friend_list (
    id integer NOT NULL,
    friend_id integer NOT NULL,
    user_id integer NOT NULL
);
 +   DROP TABLE public.core_friend_friend_list;
       public         heap    postgres    false                       1259    18885    core_friend_friend_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_friend_friend_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_friend_friend_list_id_seq;
       public          postgres    false    260            h           0    0    core_friend_friend_list_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_friend_friend_list_id_seq OWNED BY public.core_friend_friend_list.id;
          public          postgres    false    259                       1259    18877    core_friend_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_friend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_friend_id_seq;
       public          postgres    false    258            i           0    0    core_friend_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_friend_id_seq OWNED BY public.core_friend.id;
          public          postgres    false    257                       1259    18982    core_friendrequest    TABLE     �   CREATE TABLE public.core_friendrequest (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    accepted_status boolean NOT NULL,
    status boolean NOT NULL,
    recever_id integer NOT NULL,
    serner_id integer NOT NULL
);
 &   DROP TABLE public.core_friendrequest;
       public         heap    postgres    false                       1259    18980    core_friendrequest_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_friendrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.core_friendrequest_id_seq;
       public          postgres    false    264            j           0    0    core_friendrequest_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.core_friendrequest_id_seq OWNED BY public.core_friendrequest.id;
          public          postgres    false    263            �            1259    18836    core_hashtag    TABLE     �   CREATE TABLE public.core_hashtag (
    id integer NOT NULL,
    tag character varying(100) NOT NULL,
    status boolean NOT NULL,
    community_id integer NOT NULL
);
     DROP TABLE public.core_hashtag;
       public         heap    postgres    false            �            1259    18834    core_hashtag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_hashtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.core_hashtag_id_seq;
       public          postgres    false    248            k           0    0    core_hashtag_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.core_hashtag_id_seq OWNED BY public.core_hashtag.id;
          public          postgres    false    247            �            1259    18731 	   core_like    TABLE     �   CREATE TABLE public.core_like (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    communityforum_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.core_like;
       public         heap    postgres    false            �            1259    18729    core_like_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_like_id_seq;
       public          postgres    false    244            l           0    0    core_like_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_like_id_seq OWNED BY public.core_like.id;
          public          postgres    false    243                        1259    18868    core_notification    TABLE       CREATE TABLE public.core_notification (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    message text NOT NULL,
    date timestamp with time zone NOT NULL,
    view_status boolean NOT NULL,
    status boolean NOT NULL,
    user_id integer NOT NULL
);
 %   DROP TABLE public.core_notification;
       public         heap    postgres    false            �            1259    18866    core_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.core_notification_id_seq;
       public          postgres    false    256            m           0    0    core_notification_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.core_notification_id_seq OWNED BY public.core_notification.id;
          public          postgres    false    255            �            1259    18844 	   core_team    TABLE     1  CREATE TABLE public.core_team (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    logo character varying(100) NOT NULL,
    background_image character varying(100) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    admin_id integer NOT NULL
);
    DROP TABLE public.core_team;
       public         heap    postgres    false            �            1259    18852    core_team_hastag    TABLE     �   CREATE TABLE public.core_team_hastag (
    id integer NOT NULL,
    team_id integer NOT NULL,
    hashtag_id integer NOT NULL
);
 $   DROP TABLE public.core_team_hastag;
       public         heap    postgres    false            �            1259    18850    core_team_hastag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_team_hastag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.core_team_hastag_id_seq;
       public          postgres    false    252            n           0    0    core_team_hastag_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.core_team_hastag_id_seq OWNED BY public.core_team_hastag.id;
          public          postgres    false    251            �            1259    18842    core_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_team_id_seq;
       public          postgres    false    250            o           0    0    core_team_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_team_id_seq OWNED BY public.core_team.id;
          public          postgres    false    249            �            1259    18860    core_team_team_member    TABLE     �   CREATE TABLE public.core_team_team_member (
    id integer NOT NULL,
    team_id integer NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.core_team_team_member;
       public         heap    postgres    false            �            1259    18858    core_team_team_member_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_team_team_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.core_team_team_member_id_seq;
       public          postgres    false    254            p           0    0    core_team_team_member_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.core_team_team_member_id_seq OWNED BY public.core_team_team_member.id;
          public          postgres    false    253                       1259    18961    core_teaminvite    TABLE     �   CREATE TABLE public.core_teaminvite (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    receive_status boolean NOT NULL,
    status boolean NOT NULL,
    member_id integer NOT NULL,
    team_id integer NOT NULL
);
 #   DROP TABLE public.core_teaminvite;
       public         heap    postgres    false                       1259    18959    core_teaminvite_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_teaminvite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.core_teaminvite_id_seq;
       public          postgres    false    262            q           0    0    core_teaminvite_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.core_teaminvite_id_seq OWNED BY public.core_teaminvite.id;
          public          postgres    false    261            �            1259    18810    core_usercomment    TABLE        CREATE TABLE public.core_usercomment (
    id integer NOT NULL,
    comment_text text NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    commented_forum_id integer NOT NULL,
    commented_user_id integer NOT NULL
);
 $   DROP TABLE public.core_usercomment;
       public         heap    postgres    false            �            1259    18808    core_usercomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_usercomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.core_usercomment_id_seq;
       public          postgres    false    246            r           0    0    core_usercomment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.core_usercomment_id_seq OWNED BY public.core_usercomment.id;
          public          postgres    false    245            �            1259    18258    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    18256    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219            s           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    18144    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    18142    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            t           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    18133    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    18131    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            u           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    18289    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    18338    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    18336    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    226            v           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    225            �            1259    18349    socialaccount_socialaccount    TABLE     D  CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.socialaccount_socialaccount;
       public         heap    postgres    false            �            1259    18347 "   socialaccount_socialaccount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.socialaccount_socialaccount_id_seq;
       public          postgres    false    228            w           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;
          public          postgres    false    227            �            1259    18360    socialaccount_socialapp    TABLE     #  CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);
 +   DROP TABLE public.socialaccount_socialapp;
       public         heap    postgres    false            �            1259    18358    socialaccount_socialapp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.socialaccount_socialapp_id_seq;
       public          postgres    false    230            x           0    0    socialaccount_socialapp_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;
          public          postgres    false    229            �            1259    18368    socialaccount_socialapp_sites    TABLE     �   CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);
 1   DROP TABLE public.socialaccount_socialapp_sites;
       public         heap    postgres    false            �            1259    18366 $   socialaccount_socialapp_sites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.socialaccount_socialapp_sites_id_seq;
       public          postgres    false    232            y           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;
          public          postgres    false    231            �            1259    18376    socialaccount_socialtoken    TABLE     �   CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);
 -   DROP TABLE public.socialaccount_socialtoken;
       public         heap    postgres    false            �            1259    18374     socialaccount_socialtoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.socialaccount_socialtoken_id_seq;
       public          postgres    false    234            z           0    0     socialaccount_socialtoken_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;
          public          postgres    false    233            �           2604    18304    account_emailaddress id    DEFAULT     �   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    18314    account_emailconfirmation id    DEFAULT     �   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    18430    accounts_mainuser id    DEFAULT     |   ALTER TABLE ONLY public.accounts_mainuser ALTER COLUMN id SET DEFAULT nextval('public.accounts_mainuser_id_seq'::regclass);
 C   ALTER TABLE public.accounts_mainuser ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    18165    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    18175    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    18157    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    18183    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    18193    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    18201    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    18445    core_community id    DEFAULT     v   ALTER TABLE ONLY public.core_community ALTER COLUMN id SET DEFAULT nextval('public.core_community_id_seq'::regclass);
 @   ALTER TABLE public.core_community ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    18474    core_communityforum id    DEFAULT     y   ALTER TABLE ONLY public.core_communityforum ALTER COLUMN id SET DEFAULT nextval('public.core_comment_id_seq'::regclass);
 E   ALTER TABLE public.core_communityforum ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    18453    core_follow id    DEFAULT     p   ALTER TABLE ONLY public.core_follow ALTER COLUMN id SET DEFAULT nextval('public.core_follow_id_seq'::regclass);
 =   ALTER TABLE public.core_follow ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    19005    core_foruminappropiate id    DEFAULT     �   ALTER TABLE ONLY public.core_foruminappropiate ALTER COLUMN id SET DEFAULT nextval('public.core_foruminappropiate_id_seq'::regclass);
 H   ALTER TABLE public.core_foruminappropiate ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    265    266            �           2604    18882    core_friend id    DEFAULT     p   ALTER TABLE ONLY public.core_friend ALTER COLUMN id SET DEFAULT nextval('public.core_friend_id_seq'::regclass);
 =   ALTER TABLE public.core_friend ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    258    258            �           2604    18890    core_friend_friend_list id    DEFAULT     �   ALTER TABLE ONLY public.core_friend_friend_list ALTER COLUMN id SET DEFAULT nextval('public.core_friend_friend_list_id_seq'::regclass);
 I   ALTER TABLE public.core_friend_friend_list ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    260    260            �           2604    18985    core_friendrequest id    DEFAULT     ~   ALTER TABLE ONLY public.core_friendrequest ALTER COLUMN id SET DEFAULT nextval('public.core_friendrequest_id_seq'::regclass);
 D   ALTER TABLE public.core_friendrequest ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            �           2604    18839    core_hashtag id    DEFAULT     r   ALTER TABLE ONLY public.core_hashtag ALTER COLUMN id SET DEFAULT nextval('public.core_hashtag_id_seq'::regclass);
 >   ALTER TABLE public.core_hashtag ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    18734    core_like id    DEFAULT     l   ALTER TABLE ONLY public.core_like ALTER COLUMN id SET DEFAULT nextval('public.core_like_id_seq'::regclass);
 ;   ALTER TABLE public.core_like ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    18871    core_notification id    DEFAULT     |   ALTER TABLE ONLY public.core_notification ALTER COLUMN id SET DEFAULT nextval('public.core_notification_id_seq'::regclass);
 C   ALTER TABLE public.core_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            �           2604    18847    core_team id    DEFAULT     l   ALTER TABLE ONLY public.core_team ALTER COLUMN id SET DEFAULT nextval('public.core_team_id_seq'::regclass);
 ;   ALTER TABLE public.core_team ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            �           2604    18855    core_team_hastag id    DEFAULT     z   ALTER TABLE ONLY public.core_team_hastag ALTER COLUMN id SET DEFAULT nextval('public.core_team_hastag_id_seq'::regclass);
 B   ALTER TABLE public.core_team_hastag ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            �           2604    18863    core_team_team_member id    DEFAULT     �   ALTER TABLE ONLY public.core_team_team_member ALTER COLUMN id SET DEFAULT nextval('public.core_team_team_member_id_seq'::regclass);
 G   ALTER TABLE public.core_team_team_member ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    18964    core_teaminvite id    DEFAULT     x   ALTER TABLE ONLY public.core_teaminvite ALTER COLUMN id SET DEFAULT nextval('public.core_teaminvite_id_seq'::regclass);
 A   ALTER TABLE public.core_teaminvite ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    262    262            �           2604    18813    core_usercomment id    DEFAULT     z   ALTER TABLE ONLY public.core_usercomment ALTER COLUMN id SET DEFAULT nextval('public.core_usercomment_id_seq'::regclass);
 B   ALTER TABLE public.core_usercomment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    18261    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    18147    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    18136    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    18341    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    18352    socialaccount_socialaccount id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);
 M   ALTER TABLE public.socialaccount_socialaccount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    18363    socialaccount_socialapp id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);
 I   ALTER TABLE public.socialaccount_socialapp ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    18371     socialaccount_socialapp_sites id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);
 O   ALTER TABLE public.socialaccount_socialapp_sites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    18379    socialaccount_socialtoken id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);
 K   ALTER TABLE public.socialaccount_socialtoken ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            (          0    18301    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    222    �      *          0    18311    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    224   �      6          0    18427    accounts_mainuser 
   TABLE DATA           �   COPY public.accounts_mainuser (id, profile_pic, pro_status, pro_signup_type, status, user_id, bgimage, gaming_platform) FROM stdin;
    public          postgres    false    236   :�                0    18162 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   c�                0    18172    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ��                0    18154    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   ��                0    18180 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   ��      !          0    18190    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   ��      #          0    18198    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   0�      8          0    18442    core_community 
   TABLE DATA           K   COPY public.core_community (id, name, image, datetime, status) FROM stdin;
    public          postgres    false    238   M�      <          0    18471    core_communityforum 
   TABLE DATA           j   COPY public.core_communityforum (id, image, content, datetime, status, community_id, user_id) FROM stdin;
    public          postgres    false    242   ��      :          0    18450    core_follow 
   TABLE DATA           P   COPY public.core_follow (id, following_date, community_id, user_id) FROM stdin;
    public          postgres    false    240   6�      T          0    19002    core_foruminappropiate 
   TABLE DATA           Y   COPY public.core_foruminappropiate (id, datetime, status, forum_id, user_id) FROM stdin;
    public          postgres    false    266   ��      L          0    18879    core_friend 
   TABLE DATA           @   COPY public.core_friend (id, date, status, user_id) FROM stdin;
    public          postgres    false    258   �      N          0    18887    core_friend_friend_list 
   TABLE DATA           I   COPY public.core_friend_friend_list (id, friend_id, user_id) FROM stdin;
    public          postgres    false    260   ��      R          0    18982    core_friendrequest 
   TABLE DATA           f   COPY public.core_friendrequest (id, date, accepted_status, status, recever_id, serner_id) FROM stdin;
    public          postgres    false    264   C�      B          0    18836    core_hashtag 
   TABLE DATA           E   COPY public.core_hashtag (id, tag, status, community_id) FROM stdin;
    public          postgres    false    248   �      >          0    18731 	   core_like 
   TABLE DATA           U   COPY public.core_like (id, datetime, status, communityforum_id, user_id) FROM stdin;
    public          postgres    false    244   B�      J          0    18868    core_notification 
   TABLE DATA           c   COPY public.core_notification (id, title, message, date, view_status, status, user_id) FROM stdin;
    public          postgres    false    256   u�      D          0    18844 	   core_team 
   TABLE DATA           a   COPY public.core_team (id, name, logo, background_image, datetime, status, admin_id) FROM stdin;
    public          postgres    false    250   .�      F          0    18852    core_team_hastag 
   TABLE DATA           C   COPY public.core_team_hastag (id, team_id, hashtag_id) FROM stdin;
    public          postgres    false    252   ��      H          0    18860    core_team_team_member 
   TABLE DATA           E   COPY public.core_team_team_member (id, team_id, user_id) FROM stdin;
    public          postgres    false    254   �      P          0    18961    core_teaminvite 
   TABLE DATA           _   COPY public.core_teaminvite (id, date, receive_status, status, member_id, team_id) FROM stdin;
    public          postgres    false    262   {      @          0    18810    core_usercomment 
   TABLE DATA           u   COPY public.core_usercomment (id, comment_text, datetime, status, commented_forum_id, commented_user_id) FROM stdin;
    public          postgres    false    246         %          0    18258    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   �                0    18144    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   w"                0    18133    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �#      &          0    18289    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    220   �'      ,          0    18338    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    226   �F      .          0    18349    socialaccount_socialaccount 
   TABLE DATA           v   COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
    public          postgres    false    228   G      0          0    18360    socialaccount_socialapp 
   TABLE DATA           ]   COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
    public          postgres    false    230   &J      2          0    18368    socialaccount_socialapp_sites 
   TABLE DATA           R   COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
    public          postgres    false    232   �J      4          0    18376    socialaccount_socialtoken 
   TABLE DATA           l   COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
    public          postgres    false    234   K      {           0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);
          public          postgres    false    221            |           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    223            }           0    0    accounts_mainuser_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.accounts_mainuser_id_seq', 37, true);
          public          postgres    false    235            ~           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);
          public          postgres    false    208                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 128, true);
          public          postgres    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 31, true);
          public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 37, true);
          public          postgres    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            �           0    0    core_comment_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.core_comment_id_seq', 23, true);
          public          postgres    false    241            �           0    0    core_community_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.core_community_id_seq', 41, true);
          public          postgres    false    237            �           0    0    core_follow_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_follow_id_seq', 80, true);
          public          postgres    false    239            �           0    0    core_foruminappropiate_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.core_foruminappropiate_id_seq', 3, true);
          public          postgres    false    265            �           0    0    core_friend_friend_list_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.core_friend_friend_list_id_seq', 46, true);
          public          postgres    false    259            �           0    0    core_friend_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.core_friend_id_seq', 9, true);
          public          postgres    false    257            �           0    0    core_friendrequest_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.core_friendrequest_id_seq', 31, true);
          public          postgres    false    263            �           0    0    core_hashtag_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.core_hashtag_id_seq', 32, true);
          public          postgres    false    247            �           0    0    core_like_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.core_like_id_seq', 70, true);
          public          postgres    false    243            �           0    0    core_notification_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.core_notification_id_seq', 163, true);
          public          postgres    false    255            �           0    0    core_team_hastag_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.core_team_hastag_id_seq', 145, true);
          public          postgres    false    251            �           0    0    core_team_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.core_team_id_seq', 22, true);
          public          postgres    false    249            �           0    0    core_team_team_member_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.core_team_team_member_id_seq', 50, true);
          public          postgres    false    253            �           0    0    core_teaminvite_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.core_teaminvite_id_seq', 93, true);
          public          postgres    false    261            �           0    0    core_usercomment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_usercomment_id_seq', 45, true);
          public          postgres    false    245            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 348, true);
          public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 53, true);
          public          postgres    false    202            �           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    225            �           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 29, true);
          public          postgres    false    227            �           0    0    socialaccount_socialapp_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 2, true);
          public          postgres    false    229            �           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 2, true);
          public          postgres    false    231            �           0    0     socialaccount_socialtoken_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 29, true);
          public          postgres    false    233                       2606    18334 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    222                       2606    18306 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    222                       2606    18318 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    224                       2606    18316 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    224            /           2606    18432 (   accounts_mainuser accounts_mainuser_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.accounts_mainuser
    ADD CONSTRAINT accounts_mainuser_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.accounts_mainuser DROP CONSTRAINT accounts_mainuser_pkey;
       public            postgres    false    236            1           2606    18434 /   accounts_mainuser accounts_mainuser_user_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.accounts_mainuser
    ADD CONSTRAINT accounts_mainuser_user_id_key UNIQUE (user_id);
 Y   ALTER TABLE ONLY public.accounts_mainuser DROP CONSTRAINT accounts_mainuser_user_id_key;
       public            postgres    false    236            �           2606    18287    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    18214 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    18177 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    18167    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    18205 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    18159 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            �           2606    18195 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            �           2606    18229 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �           2606    18185    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            �           2606    18203 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217                       2606    18243 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    18281     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            :           2606    18479 %   core_communityforum core_comment_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.core_communityforum
    ADD CONSTRAINT core_comment_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.core_communityforum DROP CONSTRAINT core_comment_pkey;
       public            postgres    false    242            3           2606    18447 "   core_community core_community_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.core_community
    ADD CONSTRAINT core_community_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.core_community DROP CONSTRAINT core_community_pkey;
       public            postgres    false    238            6           2606    18455    core_follow core_follow_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_follow
    ADD CONSTRAINT core_follow_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_follow DROP CONSTRAINT core_follow_pkey;
       public            postgres    false    240            l           2606    19007 2   core_foruminappropiate core_foruminappropiate_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.core_foruminappropiate
    ADD CONSTRAINT core_foruminappropiate_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.core_foruminappropiate DROP CONSTRAINT core_foruminappropiate_pkey;
       public            postgres    false    266            ^           2606    18946 O   core_friend_friend_list core_friend_friend_list_friend_id_user_id_0797b737_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_friend_friend_list
    ADD CONSTRAINT core_friend_friend_list_friend_id_user_id_0797b737_uniq UNIQUE (friend_id, user_id);
 y   ALTER TABLE ONLY public.core_friend_friend_list DROP CONSTRAINT core_friend_friend_list_friend_id_user_id_0797b737_uniq;
       public            postgres    false    260    260            `           2606    18892 4   core_friend_friend_list core_friend_friend_list_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_friend_friend_list
    ADD CONSTRAINT core_friend_friend_list_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_friend_friend_list DROP CONSTRAINT core_friend_friend_list_pkey;
       public            postgres    false    260            Z           2606    18884    core_friend core_friend_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_friend
    ADD CONSTRAINT core_friend_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_friend DROP CONSTRAINT core_friend_pkey;
       public            postgres    false    258            g           2606    18987 *   core_friendrequest core_friendrequest_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.core_friendrequest
    ADD CONSTRAINT core_friendrequest_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.core_friendrequest DROP CONSTRAINT core_friendrequest_pkey;
       public            postgres    false    264            F           2606    18841    core_hashtag core_hashtag_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.core_hashtag
    ADD CONSTRAINT core_hashtag_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.core_hashtag DROP CONSTRAINT core_hashtag_pkey;
       public            postgres    false    248            >           2606    18736    core_like core_like_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_like
    ADD CONSTRAINT core_like_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_like DROP CONSTRAINT core_like_pkey;
       public            postgres    false    244            W           2606    18876 (   core_notification core_notification_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.core_notification
    ADD CONSTRAINT core_notification_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.core_notification DROP CONSTRAINT core_notification_pkey;
       public            postgres    false    256            L           2606    18857 &   core_team_hastag core_team_hastag_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.core_team_hastag
    ADD CONSTRAINT core_team_hastag_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.core_team_hastag DROP CONSTRAINT core_team_hastag_pkey;
       public            postgres    false    252            O           2606    18906 B   core_team_hastag core_team_hastag_team_id_hashtag_id_773d351d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_team_hastag
    ADD CONSTRAINT core_team_hastag_team_id_hashtag_id_773d351d_uniq UNIQUE (team_id, hashtag_id);
 l   ALTER TABLE ONLY public.core_team_hastag DROP CONSTRAINT core_team_hastag_team_id_hashtag_id_773d351d_uniq;
       public            postgres    false    252    252            I           2606    18849    core_team core_team_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_team
    ADD CONSTRAINT core_team_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_team DROP CONSTRAINT core_team_pkey;
       public            postgres    false    250            Q           2606    18865 0   core_team_team_member core_team_team_member_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.core_team_team_member
    ADD CONSTRAINT core_team_team_member_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.core_team_team_member DROP CONSTRAINT core_team_team_member_pkey;
       public            postgres    false    254            T           2606    18920 I   core_team_team_member core_team_team_member_team_id_user_id_7aabfff0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.core_team_team_member
    ADD CONSTRAINT core_team_team_member_team_id_user_id_7aabfff0_uniq UNIQUE (team_id, user_id);
 s   ALTER TABLE ONLY public.core_team_team_member DROP CONSTRAINT core_team_team_member_team_id_user_id_7aabfff0_uniq;
       public            postgres    false    254    254            d           2606    18966 $   core_teaminvite core_teaminvite_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.core_teaminvite
    ADD CONSTRAINT core_teaminvite_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.core_teaminvite DROP CONSTRAINT core_teaminvite_pkey;
       public            postgres    false    262            C           2606    18818 &   core_usercomment core_usercomment_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.core_usercomment
    ADD CONSTRAINT core_usercomment_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.core_usercomment DROP CONSTRAINT core_usercomment_pkey;
       public            postgres    false    246                       2606    18267 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            �           2606    18151 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    18149 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    18141 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203                       2606    18296 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    220                       2606    18345 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    226                       2606    18343    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    226                       2606    18357 <   socialaccount_socialaccount socialaccount_socialaccount_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_pkey;
       public            postgres    false    228                       2606    18388 R   socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);
 |   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq;
       public            postgres    false    228    228            #           2606    18396 Y   socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);
 �   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq;
       public            postgres    false    232    232            !           2606    18365 4   socialaccount_socialapp socialaccount_socialapp_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.socialaccount_socialapp DROP CONSTRAINT socialaccount_socialapp_pkey;
       public            postgres    false    230            %           2606    18373 @   socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp_sites_pkey;
       public            postgres    false    232            +           2606    18386 S   socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);
 }   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq;
       public            postgres    false    234    234            -           2606    18384 8   socialaccount_socialtoken socialaccount_socialtoken_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_pkey;
       public            postgres    false    234            
           1259    18335 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    222                       1259    18325 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    222                       1259    18332 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    224                       1259    18331 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    224            �           1259    18288    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    18225 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    18226 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    18211 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            �           1259    18241 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            �           1259    18240 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            �           1259    18255 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            �           1259    18254 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �           1259    18282     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            8           1259    18490 "   core_comment_community_id_7286a1c9    INDEX     j   CREATE INDEX core_comment_community_id_7286a1c9 ON public.core_communityforum USING btree (community_id);
 6   DROP INDEX public.core_comment_community_id_7286a1c9;
       public            postgres    false    242            ;           1259    18491    core_comment_user_id_a9a9430c    INDEX     `   CREATE INDEX core_comment_user_id_a9a9430c ON public.core_communityforum USING btree (user_id);
 1   DROP INDEX public.core_comment_user_id_a9a9430c;
       public            postgres    false    242            4           1259    18466 !   core_follow_community_id_e8d0e645    INDEX     a   CREATE INDEX core_follow_community_id_e8d0e645 ON public.core_follow USING btree (community_id);
 5   DROP INDEX public.core_follow_community_id_e8d0e645;
       public            postgres    false    240            7           1259    18467    core_follow_user_id_075c46a1    INDEX     W   CREATE INDEX core_follow_user_id_075c46a1 ON public.core_follow USING btree (user_id);
 0   DROP INDEX public.core_follow_user_id_075c46a1;
       public            postgres    false    240            j           1259    19018 (   core_foruminappropiate_forum_id_46807a96    INDEX     o   CREATE INDEX core_foruminappropiate_forum_id_46807a96 ON public.core_foruminappropiate USING btree (forum_id);
 <   DROP INDEX public.core_foruminappropiate_forum_id_46807a96;
       public            postgres    false    266            m           1259    19019 '   core_foruminappropiate_user_id_0dbe099b    INDEX     m   CREATE INDEX core_foruminappropiate_user_id_0dbe099b ON public.core_foruminappropiate USING btree (user_id);
 ;   DROP INDEX public.core_foruminappropiate_user_id_0dbe099b;
       public            postgres    false    266            \           1259    18957 *   core_friend_friend_list_friend_id_f69915e4    INDEX     s   CREATE INDEX core_friend_friend_list_friend_id_f69915e4 ON public.core_friend_friend_list USING btree (friend_id);
 >   DROP INDEX public.core_friend_friend_list_friend_id_f69915e4;
       public            postgres    false    260            a           1259    18958 (   core_friend_friend_list_user_id_c1447c86    INDEX     o   CREATE INDEX core_friend_friend_list_user_id_c1447c86 ON public.core_friend_friend_list USING btree (user_id);
 <   DROP INDEX public.core_friend_friend_list_user_id_c1447c86;
       public            postgres    false    260            [           1259    18944    core_friend_user_id_78fd37ef    INDEX     W   CREATE INDEX core_friend_user_id_78fd37ef ON public.core_friend USING btree (user_id);
 0   DROP INDEX public.core_friend_user_id_78fd37ef;
       public            postgres    false    258            h           1259    18998 &   core_friendrequest_recever_id_7f0cb60d    INDEX     k   CREATE INDEX core_friendrequest_recever_id_7f0cb60d ON public.core_friendrequest USING btree (recever_id);
 :   DROP INDEX public.core_friendrequest_recever_id_7f0cb60d;
       public            postgres    false    264            i           1259    18999 %   core_friendrequest_serner_id_806065bd    INDEX     i   CREATE INDEX core_friendrequest_serner_id_806065bd ON public.core_friendrequest USING btree (serner_id);
 9   DROP INDEX public.core_friendrequest_serner_id_806065bd;
       public            postgres    false    264            D           1259    18898 "   core_hashtag_community_id_a4a26ff0    INDEX     c   CREATE INDEX core_hashtag_community_id_a4a26ff0 ON public.core_hashtag USING btree (community_id);
 6   DROP INDEX public.core_hashtag_community_id_a4a26ff0;
       public            postgres    false    248            <           1259    18758 $   core_like_communityforum_id_d0f583a8    INDEX     g   CREATE INDEX core_like_communityforum_id_d0f583a8 ON public.core_like USING btree (communityforum_id);
 8   DROP INDEX public.core_like_communityforum_id_d0f583a8;
       public            postgres    false    244            ?           1259    18759    core_like_user_id_0580bca0    INDEX     S   CREATE INDEX core_like_user_id_0580bca0 ON public.core_like USING btree (user_id);
 .   DROP INDEX public.core_like_user_id_0580bca0;
       public            postgres    false    244            X           1259    18938 "   core_notification_user_id_6e341aac    INDEX     c   CREATE INDEX core_notification_user_id_6e341aac ON public.core_notification USING btree (user_id);
 6   DROP INDEX public.core_notification_user_id_6e341aac;
       public            postgres    false    256            G           1259    18904    core_team_admin_id_4afec97d    INDEX     U   CREATE INDEX core_team_admin_id_4afec97d ON public.core_team USING btree (admin_id);
 /   DROP INDEX public.core_team_admin_id_4afec97d;
       public            postgres    false    250            J           1259    18918 $   core_team_hastag_hashtag_id_d6cb13ae    INDEX     g   CREATE INDEX core_team_hastag_hashtag_id_d6cb13ae ON public.core_team_hastag USING btree (hashtag_id);
 8   DROP INDEX public.core_team_hastag_hashtag_id_d6cb13ae;
       public            postgres    false    252            M           1259    18917 !   core_team_hastag_team_id_3801aabb    INDEX     a   CREATE INDEX core_team_hastag_team_id_3801aabb ON public.core_team_hastag USING btree (team_id);
 5   DROP INDEX public.core_team_hastag_team_id_3801aabb;
       public            postgres    false    252            R           1259    18931 &   core_team_team_member_team_id_e6ac459c    INDEX     k   CREATE INDEX core_team_team_member_team_id_e6ac459c ON public.core_team_team_member USING btree (team_id);
 :   DROP INDEX public.core_team_team_member_team_id_e6ac459c;
       public            postgres    false    254            U           1259    18932 &   core_team_team_member_user_id_40ad4a3c    INDEX     k   CREATE INDEX core_team_team_member_user_id_40ad4a3c ON public.core_team_team_member USING btree (user_id);
 :   DROP INDEX public.core_team_team_member_user_id_40ad4a3c;
       public            postgres    false    254            b           1259    18977 "   core_teaminvite_member_id_b2e423d6    INDEX     c   CREATE INDEX core_teaminvite_member_id_b2e423d6 ON public.core_teaminvite USING btree (member_id);
 6   DROP INDEX public.core_teaminvite_member_id_b2e423d6;
       public            postgres    false    262            e           1259    18978     core_teaminvite_team_id_95d54cfd    INDEX     _   CREATE INDEX core_teaminvite_team_id_95d54cfd ON public.core_teaminvite USING btree (team_id);
 4   DROP INDEX public.core_teaminvite_team_id_95d54cfd;
       public            postgres    false    262            @           1259    18829 ,   core_usercomment_commented_forum_id_36e4114b    INDEX     w   CREATE INDEX core_usercomment_commented_forum_id_36e4114b ON public.core_usercomment USING btree (commented_forum_id);
 @   DROP INDEX public.core_usercomment_commented_forum_id_36e4114b;
       public            postgres    false    246            A           1259    18830 +   core_usercomment_commented_user_id_1eb674bc    INDEX     u   CREATE INDEX core_usercomment_commented_user_id_1eb674bc ON public.core_usercomment USING btree (commented_user_id);
 ?   DROP INDEX public.core_usercomment_commented_user_id_1eb674bc;
       public            postgres    false    246                       1259    18278 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219                       1259    18279 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219                       1259    18298 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    220            	           1259    18297 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    220                       1259    18346     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    226                       1259    18394 ,   socialaccount_socialaccount_user_id_8146e70c    INDEX     w   CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);
 @   DROP INDEX public.socialaccount_socialaccount_user_id_8146e70c;
       public            postgres    false    228            &           1259    18408 .   socialaccount_socialapp_sites_site_id_2579dee5    INDEX     {   CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);
 B   DROP INDEX public.socialaccount_socialapp_sites_site_id_2579dee5;
       public            postgres    false    232            '           1259    18407 3   socialaccount_socialapp_sites_socialapp_id_97fb6e7d    INDEX     �   CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);
 G   DROP INDEX public.socialaccount_socialapp_sites_socialapp_id_97fb6e7d;
       public            postgres    false    232            (           1259    18419 -   socialaccount_socialtoken_account_id_951f210e    INDEX     y   CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);
 A   DROP INDEX public.socialaccount_socialtoken_account_id_951f210e;
       public            postgres    false    234            )           1259    18420 )   socialaccount_socialtoken_app_id_636a42d7    INDEX     q   CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);
 =   DROP INDEX public.socialaccount_socialtoken_app_id_636a42d7;
       public            postgres    false    234            w           2606    18319 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    213    3314    222            x           2606    18326 U   account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e;
       public          postgres    false    224    222    3342            ~           2606    18435 D   accounts_mainuser accounts_mainuser_user_id_c42ecc10_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_mainuser
    ADD CONSTRAINT accounts_mainuser_user_id_c42ecc10_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.accounts_mainuser DROP CONSTRAINT accounts_mainuser_user_id_c42ecc10_fk_auth_user_id;
       public          postgres    false    236    3314    213            p           2606    18220 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    3301    207            o           2606    18215 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    211    3306    209            n           2606    18206 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    207    205    3296            r           2606    18235 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    215    3306            q           2606    18230 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    213    3314    215            t           2606    18249 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    217    3301            s           2606    18244 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    217    213    3314            �           2606    18480 K   core_communityforum core_comment_community_id_7286a1c9_fk_core_community_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_communityforum
    ADD CONSTRAINT core_comment_community_id_7286a1c9_fk_core_community_id FOREIGN KEY (community_id) REFERENCES public.core_community(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.core_communityforum DROP CONSTRAINT core_comment_community_id_7286a1c9_fk_core_community_id;
       public          postgres    false    242    238    3379                       2606    18456 B   core_follow core_follow_community_id_e8d0e645_fk_core_community_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_follow
    ADD CONSTRAINT core_follow_community_id_e8d0e645_fk_core_community_id FOREIGN KEY (community_id) REFERENCES public.core_community(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.core_follow DROP CONSTRAINT core_follow_community_id_e8d0e645_fk_core_community_id;
       public          postgres    false    3379    238    240            �           2606    18461 8   core_follow core_follow_user_id_075c46a1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_follow
    ADD CONSTRAINT core_follow_user_id_075c46a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.core_follow DROP CONSTRAINT core_follow_user_id_075c46a1_fk_auth_user_id;
       public          postgres    false    213    3314    240            �           2606    19008 J   core_foruminappropiate core_foruminappropia_forum_id_46807a96_fk_core_comm    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_foruminappropiate
    ADD CONSTRAINT core_foruminappropia_forum_id_46807a96_fk_core_comm FOREIGN KEY (forum_id) REFERENCES public.core_communityforum(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.core_foruminappropiate DROP CONSTRAINT core_foruminappropia_forum_id_46807a96_fk_core_comm;
       public          postgres    false    3386    242    266            �           2606    19013 N   core_foruminappropiate core_foruminappropiate_user_id_0dbe099b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_foruminappropiate
    ADD CONSTRAINT core_foruminappropiate_user_id_0dbe099b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.core_foruminappropiate DROP CONSTRAINT core_foruminappropiate_user_id_0dbe099b_fk_auth_user_id;
       public          postgres    false    266    3314    213            �           2606    18947 T   core_friend_friend_list core_friend_friend_list_friend_id_f69915e4_fk_core_friend_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_friend_friend_list
    ADD CONSTRAINT core_friend_friend_list_friend_id_f69915e4_fk_core_friend_id FOREIGN KEY (friend_id) REFERENCES public.core_friend(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.core_friend_friend_list DROP CONSTRAINT core_friend_friend_list_friend_id_f69915e4_fk_core_friend_id;
       public          postgres    false    260    3418    258            �           2606    18952 P   core_friend_friend_list core_friend_friend_list_user_id_c1447c86_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_friend_friend_list
    ADD CONSTRAINT core_friend_friend_list_user_id_c1447c86_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_friend_friend_list DROP CONSTRAINT core_friend_friend_list_user_id_c1447c86_fk_auth_user_id;
       public          postgres    false    3314    260    213            �           2606    18939 8   core_friend core_friend_user_id_78fd37ef_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_friend
    ADD CONSTRAINT core_friend_user_id_78fd37ef_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.core_friend DROP CONSTRAINT core_friend_user_id_78fd37ef_fk_auth_user_id;
       public          postgres    false    258    213    3314            �           2606    18988 I   core_friendrequest core_friendrequest_recever_id_7f0cb60d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_friendrequest
    ADD CONSTRAINT core_friendrequest_recever_id_7f0cb60d_fk_auth_user_id FOREIGN KEY (recever_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.core_friendrequest DROP CONSTRAINT core_friendrequest_recever_id_7f0cb60d_fk_auth_user_id;
       public          postgres    false    264    3314    213            �           2606    18993 H   core_friendrequest core_friendrequest_serner_id_806065bd_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_friendrequest
    ADD CONSTRAINT core_friendrequest_serner_id_806065bd_fk_auth_user_id FOREIGN KEY (serner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.core_friendrequest DROP CONSTRAINT core_friendrequest_serner_id_806065bd_fk_auth_user_id;
       public          postgres    false    3314    264    213            �           2606    18893 D   core_hashtag core_hashtag_community_id_a4a26ff0_fk_core_community_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_hashtag
    ADD CONSTRAINT core_hashtag_community_id_a4a26ff0_fk_core_community_id FOREIGN KEY (community_id) REFERENCES public.core_community(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.core_hashtag DROP CONSTRAINT core_hashtag_community_id_a4a26ff0_fk_core_community_id;
       public          postgres    false    248    238    3379            �           2606    18748 H   core_like core_like_communityforum_id_d0f583a8_fk_core_communityforum_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_like
    ADD CONSTRAINT core_like_communityforum_id_d0f583a8_fk_core_communityforum_id FOREIGN KEY (communityforum_id) REFERENCES public.core_communityforum(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.core_like DROP CONSTRAINT core_like_communityforum_id_d0f583a8_fk_core_communityforum_id;
       public          postgres    false    242    244    3386            �           2606    18753 4   core_like core_like_user_id_0580bca0_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_like
    ADD CONSTRAINT core_like_user_id_0580bca0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.core_like DROP CONSTRAINT core_like_user_id_0580bca0_fk_auth_user_id;
       public          postgres    false    213    244    3314            �           2606    18933 D   core_notification core_notification_user_id_6e341aac_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_notification
    ADD CONSTRAINT core_notification_user_id_6e341aac_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.core_notification DROP CONSTRAINT core_notification_user_id_6e341aac_fk_auth_user_id;
       public          postgres    false    3314    213    256            �           2606    18899 5   core_team core_team_admin_id_4afec97d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_team
    ADD CONSTRAINT core_team_admin_id_4afec97d_fk_auth_user_id FOREIGN KEY (admin_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.core_team DROP CONSTRAINT core_team_admin_id_4afec97d_fk_auth_user_id;
       public          postgres    false    250    3314    213            �           2606    18912 H   core_team_hastag core_team_hastag_hashtag_id_d6cb13ae_fk_core_hashtag_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_team_hastag
    ADD CONSTRAINT core_team_hastag_hashtag_id_d6cb13ae_fk_core_hashtag_id FOREIGN KEY (hashtag_id) REFERENCES public.core_hashtag(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.core_team_hastag DROP CONSTRAINT core_team_hastag_hashtag_id_d6cb13ae_fk_core_hashtag_id;
       public          postgres    false    252    248    3398            �           2606    18907 B   core_team_hastag core_team_hastag_team_id_3801aabb_fk_core_team_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_team_hastag
    ADD CONSTRAINT core_team_hastag_team_id_3801aabb_fk_core_team_id FOREIGN KEY (team_id) REFERENCES public.core_team(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.core_team_hastag DROP CONSTRAINT core_team_hastag_team_id_3801aabb_fk_core_team_id;
       public          postgres    false    250    3401    252            �           2606    18921 L   core_team_team_member core_team_team_member_team_id_e6ac459c_fk_core_team_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_team_team_member
    ADD CONSTRAINT core_team_team_member_team_id_e6ac459c_fk_core_team_id FOREIGN KEY (team_id) REFERENCES public.core_team(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_team_team_member DROP CONSTRAINT core_team_team_member_team_id_e6ac459c_fk_core_team_id;
       public          postgres    false    254    250    3401            �           2606    18926 L   core_team_team_member core_team_team_member_user_id_40ad4a3c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_team_team_member
    ADD CONSTRAINT core_team_team_member_user_id_40ad4a3c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_team_team_member DROP CONSTRAINT core_team_team_member_user_id_40ad4a3c_fk_auth_user_id;
       public          postgres    false    254    213    3314            �           2606    18967 B   core_teaminvite core_teaminvite_member_id_b2e423d6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_teaminvite
    ADD CONSTRAINT core_teaminvite_member_id_b2e423d6_fk_auth_user_id FOREIGN KEY (member_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.core_teaminvite DROP CONSTRAINT core_teaminvite_member_id_b2e423d6_fk_auth_user_id;
       public          postgres    false    213    3314    262            �           2606    18972 @   core_teaminvite core_teaminvite_team_id_95d54cfd_fk_core_team_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_teaminvite
    ADD CONSTRAINT core_teaminvite_team_id_95d54cfd_fk_core_team_id FOREIGN KEY (team_id) REFERENCES public.core_team(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.core_teaminvite DROP CONSTRAINT core_teaminvite_team_id_95d54cfd_fk_core_team_id;
       public          postgres    false    3401    262    250            �           2606    18819 J   core_usercomment core_usercomment_commented_forum_id_36e4114b_fk_core_comm    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_usercomment
    ADD CONSTRAINT core_usercomment_commented_forum_id_36e4114b_fk_core_comm FOREIGN KEY (commented_forum_id) REFERENCES public.core_communityforum(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.core_usercomment DROP CONSTRAINT core_usercomment_commented_forum_id_36e4114b_fk_core_comm;
       public          postgres    false    242    246    3386            �           2606    18824 L   core_usercomment core_usercomment_commented_user_id_1eb674bc_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_usercomment
    ADD CONSTRAINT core_usercomment_commented_user_id_1eb674bc_fk_auth_user_id FOREIGN KEY (commented_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_usercomment DROP CONSTRAINT core_usercomment_commented_user_id_1eb674bc_fk_auth_user_id;
       public          postgres    false    246    213    3314            u           2606    18268 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    205    219    3296            v           2606    18273 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    3314    213            |           2606    18409 O   socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc;
       public          postgres    false    228    3356    234            }           2606    18414 K   socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc;
       public          postgres    false    230    3361    234            {           2606    18402 P   socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si;
       public          postgres    false    226    3354    232            z           2606    18397 U   socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc;
       public          postgres    false    3361    230    232            y           2606    18389 X   socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id;
       public          postgres    false    228    3314    213            (      x������ � �      *      x������ � �      6     x��S�n�0<����H��[��"q# (���Т@R�ݯ/�Z�(�A��3��$[�Ҭ��`�	?2�|��|���!U�lq�5xꛕ[����cN�οȿ�ŷ����_�o�$��7L����j頭 }7�9��4�/�1��l�RT�����t�������ՒK��Ϧ̸�,*�0�O��v��"IVd$-�:Ţ(c�IR�,�	��6x�fύ�{$�#�C�#�EQ� !zu��8>���Gы��S� ;H�^�?ގՒ�$M���E����9P�$N�h�,(��A�(t'�6�s���:r��V�s�}���1`�SwׇpÜS���&�4Xì�[(��0�*�<'�GsN����__����2���CU&�b�إQ�#o��qd�Hm@���q�n4T�ʦ�eP��k�����(o��:O�����>2'P$I��4�p��	��[#ˣ<�xr��b��	)�#������������ѧ����	l��OCՈ��/ʖ�S��H��c�|��˺0�-���`�^�U�r�            x�3��--N-����� �            x������ � �         �  x�}�ݎ�6�����������EQ�w
#����^��ž}e�I�3w��������S7�����mz=����l����1���֍�����9�/��_5�, �>�?�M0TFgs�܇�c��́5�0�4�@t'�Z�S,l�	�F�������oc����/D��D�Aı�.�����/Y��������@)�� ^< _���a��W�L���i�9�Y	pj�1��F)����Iޝ�fB�]����ч�Z�a����1�팡���^g\E�;�1�}V;��q��q�� �z� �hd\�E��������]eX�9�2�j�GOZ�z;U�I�����Z�y��?��ܻu��-� �M^��H���-�%ZY��Vim���:N�c���'�����o/�(0��&WQ�+�y�H�m/��R�B�n/	M�vW�<߆K���j������l���-��l�b_���j6A�A%�u��{����)��+b����Ǖ�XՇ��
Y*�D!�_�a�3��3�cS��AbX�jG�$zfR���L��y�ݦ���F�TYg}�R�z"J��C'��t�?�a�o5t�)U@O�Ȫ\*6���V"���0rV�췸Vѣ�ʥ���Sw�	o��R�0������y��\`d*F�Q*#L�!�D�;Dp��>|�3�Û�M�k��D��U�Ho�-OXx#�w|�ߓ/�z8���Ԫ�AcD��g
]%:��Dw����ߊ}ǹp*�86��w��z$U�K�^ωlD�K.��G���裻<��a��͚f���&(�v9HdiVQV�E:�()u_:��4ծ!��i�z׉��N4M����܂�iw;�s��zwԢ��h�p�w]	ۣ=�9�|%���s�K0�;����&�t�k�Cy�ǵՁ�\�q-��z1ǟlU�Ii�	*;�@|ґ��E�R>~�1�Y������p�]a��f����=n�D6
����:\�mͅh�b��*)��JK*A��D�'���<��w�̅o������::EDe�t��H��9'�v���{�\8����#*(�B+��1(�"0��P���0~߾]]�P��`��'f�݊x��3�ŝ#\����x#�&Ŀ[|{��5��")K���A`�D�U��*�#V��$5"V��t�6�O�.C�����[��\ߖ�P%��<	�J�;ry6$r��w�|Z(鿿c���m         E  x�}�[o�Z������;3��Hv����Z<���L@�,H�����9��IX&������i+w���~�;Q& �  Q��=ۆ?��r{:~0��Y�,�����7]��h!S��-T��B �o|C������(c	a�X�o����?���j�c����FH!D���f��BsSb�g�ȱ��G�~!Rdg�RcSٔP��fy�O��ջ��Oh���(� C���{�*��E+�j/� I�)�+�c��ǺC�6k=�?�7ZF2g���b<����GK;%2ֻl���ŝ��4��+�m +�)������&c�$�*�T�6�
�
&�m2W����Xs�
�F�mX[o����la�Y|�kc�;���"f�Gf�Y� 
�
`"a�o2�J��4��]� ����s�����e#y���_��*M�	��yu�t�!*4i����Su��P��߀|ި	�D�)��;w[���rv��~�q�r�3$�͸�ۇ�^<I7����h�3�=c��jUu��iE#/�����;~�0���9�!��HE(S��xl9�d� ]Y	���� q���ɒw��1!P��@&� ���@~������ݮ�
�����=��+}4	{��N`�N�G��9�YuT��ݰ��9�2�ë�I�6w˼>B糦�9'��U�@���h�Ѷ�a�< ]�����=����������d��y�-Rӱ���/m�scQ i�X~kw^d��x��A��)�+F�z<3��͗q�WU24u7Φ]��@=0�ZT��c�t�ۅU��i �"�2&�`^cy;����l/1k<cW���	�0�Β?c#Z��F��d����i7��uW���/������\lF��D%Hޚc�S'�
I���fb�<�SP�MV=%2(�6��	�:��;Cd�8�Q�S��i��0��i����֟Ȉ��!����4��R7���)���RF��pv�=�n�z��	����I4]U���P�����{�W����T%S�\��=Kr�s���`�='�d[���,z��<�Sx�����Y�x��˒�IO� �C�[E"K�_���xww�*�      !   ?   x�˹  �X.���{��:@�7�Nd���&�-�c�P�J{�a�����(��E�bb�      #      x������ � �      8   �  x����O�Hǟ�_���d��{�V
t ���h�L�K�d�����4){{;p�*:���_�@4�>�������ry�)�6�m��^?��nI%3�2�3F�4TX��M,clI�$(!9�%7�p.���Z!��K�1�(�����B�"�7���E��Р��W/e�]���h@�@����� �ܵ�'�!�UϾ	��D�D*K� ��_� #Q��̭�iU�'��5=^��)���T�w�*[�u��v�k��934Ǭ�1��<�@d��Mb@����]׭}���<��# ��N0�R��@�Ѵ����?�2o?�0O��`�����*x�/e!��sS��4+,5��/|��p�ŭ�vL����WZ..�t:K	��R'B[�Ƙ��V�+�y�\�W'ߴ�B��$�)�����'0�C"�k :�m�*_�x	�^}���9�&�&�
9V���x���)KQ��{�e���Q�������Ӄր�|���D���(�*�U/n���5��M�E��L��������
 +Y��_\����N��{:��:j�,�v���￸.{����}N��5��Ai�75٬ʰ!��B05Rѭ[���E�+TU��]�!��+�ז�w�b�K��AȊ�u 
�(Z]Oc���&��4� W��!�f�1�M`�'�(ء(=Ԧ=�  ã���`L߭��M�ZUe
��XFӛӳ���0;IC���X&
��cD��?\��2>b��nkߴ�kH����?���/$ZS�`x�4�19�&��
��$���/�`�$�x���k��p�����h���6! 1R���`�������8�5V4.�d"�_̧a����Ji̕��\2
�P�i&C���Y�&z&v��bU���}�?��I��\����QcA3��������Ɵ�u0=��>΁�')Oz��\�0Cr�a�D7����x��G����kvDZ7���zۡ�H[ev������Ɯ��޸x�~�����ж�=��ހ4|:e`Fw9D�l�I"D�}?��b�MS}�Y�\�ơ��Wy�Xu�*
���|is�
�-���}��r�Gp����/�����m|��&Ą�DY��n���w����mhp,"!I��F��k��)��uM����qe|�mV����x�t��ָ��a#�&��1�4�*�{���/���d�"�#nx��_~N^�(��{	����,X	��t�;ߦx�z}X㏫�;/�M�&\�S�2{|H۲t\x$M���ep>NX!���E�-�\j����B1o��e\\��C�
ܗ5.UT�1���9~~:��(^lp�B�o\(�Yf�j��7thݿrm��ܻ.�.kb�1[PZ俓��� ��-�      <   >	  x��Y�r۸�-?�m;����3ٸ����i�v2�IPbL\�̼N�/�sAY����6ӏM63�,����8�� 拱o���oK�۩�~+D��y/_|/����U��o/��.���az��n���Z�l�(-{�����*fT��X�{�
�o'|P��R����r�n���F1X�Y��$>�����2����L�� _��� ɒ?��.�B��g¸�m�����h���V�7��aỺ)ٮ}��ƺ /u�x��$k����Ϊ�2�w������ �ިkH�����~���Y�FuU;1���	>{md7��"!����X�(뷆r'���w���w�N��d��13�v4�]Ε�ɉ�m��Q�e5��N!��5��67��c�,�U�q�kږ�;�;dA�\���y������"� �q��<�m��ܻCV=�)�6��^I�x��6�5~0(�!�q�m�N͈�b[y����	�IU>���κ4W�Ԟ�J�Ѹb�9dbɮ2j(�ӽ+V��i2#wl7������n1�7zc$b�޻Q����,M#ˈa��n�V�=#���J{���JP��H%�6����WQ��?��c���Q��Q�ai�4j&����Z��;J)z�B,M�vo:�b)ӛ�m*�Q��kJ�a	o��f���ˍ,Z��V�U�������:VY�j$�+��%�Wڥ{�WE�I`M�F��.���pcu?2��0V� V�+���h�l`��k��Fy��:-�&t;�R��T=�8�k�V��BKS-�&.�v�*��F6��sZ~IͶW���;U��-�A��	e+���A�XN�eD��r�`����jӴ�Ȯy?���Z�gc@q[�Q��a�1JI#[@oԜ���qȩ!����2"L 
�(���,��"���s���ճ��z�������Y����g�2{�Arl0ي�~�qR��������~���＇��VM̠&���be�{�D���[{��V���8K!ΖN>XZ����A,2?��[]gA�gI�������x��(�W�Y�a�J�y՟�+�y} m��*o���|4��WT���g��c�A]e{�dq��$�N>{}��@}i�q~}�o u���w�">� ��jG`=`��%R+��4�Nώ}�S�@?l�#{G��CX�.4zO; =�.�Q9���6��8�ts?��'sԜ��hW+Uy�����v-֎�נ��C�]���~g�iK�U�8�
K�o �|=� ��Bi!J �ԁ�I(T��o����R��kH�S��d��8PS��=�/b��8^����p�7��|�8�&�����%����x�s��)����`�@�`t�,IטM�ș�&�F�N�����pRcY҈z�[��U�J���闵ڒ	����ʾ��9���&�M�s�Cu��t���JV���j�b%�Y�#s��N9��(�P��*L@D`,~L~r��ŧ���n�H���*?���b%bJx��ɼC�8����\��ӗ�AZ�@����W85��*��~�mO~s�9E�����(
|����z�]�|9�+pq���us��1ӫƙ ��f-ۆ��ճ�Fv�p�Þ�����OF��@Z� ������٩u���#H�]��>�Y�7]��3���t�)�Zj�2`�͔�����L��=e.͋���_^D���+���C'���w�H�8=��O@ F�F"�B��zd)�A#���8X���xу����^�}�TTa�W�,k^�\�B���<�������B�1�(<O}�x�o�ysu5_ĭ�v���Q�	qKI:��fs�"�&m١��\D�|����k{:`�����p$�h��H� �i����gx�# �'�H�\[�WF�g�Q��D���k2�C�<C�x��q���GY�G|������oh����)��x�.�֡�Aw��&�͛�;]�|�s�I����g�y=�M��~�<gD/�Eǩ��$�B?.D��,�Ҡ���~��q%�u��������mHYm��;�\f����%�y.�t,���4�9�K3�Wh���C����%{j��������=Kx�rMU�a�p��ey)d��������RPK�����`]�Nǋ�����?ځ�ǝ*M7�⇣5	=f)��(]��ϣ(Ig딎zB,>z�U��h���Mu����r핺�;�x��?����n�6��͡ۊ�}����c��/a�cEL�ɡ�{��qz,c�2���ܣ��p- ����oW�;���Κ �_��U�^��c�K}!x��g�5~�_\\�;�Id      :   h  x�m�Ǎ#1��t�/�(o������1s| ٿ���b���v�($��G~H/�o�ҐM$���������S�����T�Zs0	ʧ��@��M�g��qPҔ�\����.�9�Ej�>�/�oU��p�g��J]s(���
��t�:@p�Uꖽ��:zGn@�1���K䠤AP��(�D���!�Tʞ*:P=�����=ItwD����"{�ٌTA���<�l���O^
ߪҪB���-y}U�]�%:Y��R:(mT� �Q|TFFi%wEܫ�Z�	M�]�RzPр1MwG��Eo/��IH�R8���[���Gݲ��ե�B8x����5��Qʦi����;��F^��>TI�,#Y��0=v��՜mO6�b\�s4N߳=I1���(jڸE�F�����X`T�U�l���져�Gr�5�?u�v�}���*�U=?�V���?�,e�E�Uo����rx��X+�zl�X
�$2r/�蠨1�x����[Q%�����ar`�L�Fw��~=0k�!k�e�4j���a2?�h�0X�CSŷ⊌���N���%���^8v�z�;�9~@Ɛ�����l������9H�      T   D   x�]�1�@�zy��9�ro��?ZX�L9�6���s�Xլ�7��Uk��mL�Z#\.�~��      L   �   x�]�Kn�0��y
���!�g�:'��QU�&���T9!Cg#�&WFz<$��A~#��s��!���uD���в�:,H�r���K��K��9��uKز�Z;�4o�:��()��7����f�1Ls���T�5T���R���X�d"��c7O      N   �   x���1��XL`��^�!���a���E��M�1�������\8�*9�F���W�֒���4�h�����)Q�!.�|��"��$/�ڡ��Fj�ֱ�~�d[�^�\����E�=���Q%      R   �   x�]�An1�����Gc�m������
�h���-��A�^Ћvr�e�������3����]�#�G�I���~�֌��1��3��(J�cY �
!����5����7�om��}�dY/�M���Zz0��NW�������,�O'Q���#�{�6}�<�P�B���)�|���HX      B   '  x�=��n�0E�s?�ʌ�ג@H�El���E)R�BZ�~}=6��s��yx��k?t���@CU��(��;��� ��zR���Lay�1#�����;�<�(h�2��e�0JpBw�ݏh��_�U�h�<t5`�t8�[Z����[�RpJ�*۝�I���ѪɅK��G�D� fe�SI��xt]0H�>uÿ��"���R4��z^�b�Bl��M!)m�w�D. Y�h/!������A�]Ц���vh���73~`I�k{q��5�O���0	�{w�#�Fh_��?�a�б���?a�jG      >   #  x�m�K�1D��Sx�?E�%���J��ư��fUQB/F�����:�.�X4�������܄�ʀ�nmsr�r�� ����tᘺ$P��rۋm[������6�+aAD�k`q�p��k��{�n+�L4Bwp�r岫 ���sŅ�B	���a����rG�̚w~!Npͤ@E�Rn��\C�Z!���Z%7]C��Y�*��k���L���Gktrk&�]�
�{��PL;F�!�w�3�"c`����p.��I�$���l�<�W.�����Z���HXF��f�cO�1�aIW�$7��=�D��w	�/�BSk���hO���urhhg��O�'XW�Յ��X����ʕr���y��>@��CY�����>2��x>��Vֳ4\q��P�0[m�ՙ�w)nN_@�K�� �G���{��T0Gc����`�W	Q�X�&w��{a�� ��Y0�	ޱ�[Gi��RR�A���Eh؍u-^����������땳!��� m�\�:�*m�����Z��)w2��k�J�/l��L�(�      J   �  x��]mo�8��
#���Cr��v�u�/����ݗ
'QRo;�8����#-٢lQV�8�LY�ɦ��y����̐�_&�����h:�ϧ��OG��O�����c�8�f�������I������l:������ӛ����A�1���ߦO�Q����?�����O^}�����$��W�˾�������8���v<��qv;�ut3��!�{�ܘ�4ߙonF���t4�&���xz��]�~8�M.f���������_�fӧ�Mz7˲ɻy����&����H'�I��j:��f�����1����N'�������v����$�6s�����g��w���__g������5�n^T?d���j�uF	%@.(�K��	�#�+g�g�3*{##G����{�^�6�=N����~H�Ǉ��nxo��h�OYkv \���w��8�7r�Y�MMQ&����nnm'zLF��m�'J��D�Ӗ���	��fr�����[�=
�Ei@Z���
j/P�ʧI]V	�"K7����;�Q��v�ꬌ��1mw$o��v�]����y$o�U3�W����A�ݑ�����V}Ƣf�m�LFP8�
��]l��֛�Pc%8��2p$o�}	�\IWJ�]�(%QJ�BJ�0*�^	�6EP"_�ﮍ�6K�r{{���������`��ךa?��R���2�x�af�����	���|XMeu �	������|��/�`�<�]=�v���EK��<\6A����H��?l�����L�T��� ��؀=�։�.o+�'p*���6;w�M�
*_&���#���Y�J�>!��ǂԓ�i{?��?+�b�I��O�(�̣��e��'#�N�*zsT#���lh�&�Y�Co4:���l��؀�P'Λ��b%n=�&�"QQ7��M>��Q��n�{=E�?_��6�2��b�¿�ݽ�	�τ��������W<�%�pr��6M��1��h��7=�Ə��>g�_��ԜXS3$���P��'gj�r� �D�^	���Go�Y;�S0qŶ�y�i"��N���XGw��ۄ�DR��B���>�Y�����GG�5�b���~j�� e�S��T� ����$���.�~���]&�ȄVL N�;'.���1R��T$R�:f��"1�揿�������ʷ���y!��Eenr�,��E��*���R.#ꓼ���Q�?JC�`X�6�QV@[�¡#)����l�v�e艥ԛ��$We�4#=!Ί�2���^���Ak�lV�h��Sa�����{�8������xG�T7yD�����7���ى�9Ƅ�'�eۍ1 \���)�%ߑ1���p*���;2�˼m�����ib�j���]6��@�+����vv���
���q�)�	���{$i��.��ϲ#�{IX�<�'�[Iᦽ��m�F� ���Ka�*�<a\1!]���n�.���;�0},�BU�v�8�K'�TEO<C�H��(�V�__�%���-z���r ©���)x�?�lzB$Ɲ��d���#|-��>a[y)%	C��:�<ٍf���s�5q�"��9x�F��mT�\)�@�s2Y����H)9�3K�Ɋ;�;�N�S�M� <�T�����DG���`��p�x)�ё��0'�Ay���z
�QN��oE�S�ˊJ����ʓM)s"�	=�4���(C9��v�֊�9ʄ�#�O�N�AV��0ғ��
q�]��=�ZN�F�q��	=%���. [�F$8$�(�YJ���Ao����_g������G�]
�O:���|���L�8 Ͼ��]����{���oo7�)��p�c�S����u���}8e�ޠ��1h���wI�4��~(a�����\�����ׄ��c��j�YE�UCmԺ^Y��3\�6��q�jod
uB)�����9d�+{����	�X*����:L��M�4?�����������3�������t����6,���������n�P�bu�оV�g��֞��O���̧<̦��qf�z~��Q������3k3I�"���QC�Bj�Y6OUbj���-�N�L ���l!4���Vb�2?dN6�vڡ��t����GEk��A"�&]֩���}n���1Y7���\�-L�}BR�y�(�\��f|1Qrmo��&��nض��Ђ^��iM_@5/��@�tx�����i�_]c�V�L=�s�	т	��"y�"	�����R��[ٌ/��M#��p�� <g�'��ň�(�)O)�26!�	� ������dC�ʳtr1f�"���䠀�k��!8G�JA)F܆s�$T#H�H��-����k�*аBbň��j����F	Q�d1�<��4��`�h�(�r������:�L�
--�2��QN]���9}YB�zzo������y�ɼ�oU�Ϩm|D$����Mƛ+�qo!�\QU���.qj��-����_�-������R�z���������u�?����ӯ���'��I��팏���jZ˼'J�ħ��T�&TS�-� �Y�ۜ��7�[ ��. �����c6+f���*��˶*�c47��,�+k}!5-�4.�ߝ�����־?/R ZU����o��(M��n��K�+O����fDv�V]3���w��za �����_�ɛ۟ɻ�~aO�P������遶�a��#nޞR0���p$�˨�48]U�����r�XV�H1�-X���2���(�Ľ�7�e�3�*@l�Ʃ- �PZ�jc9�ػ�@7'M/���L1��"�m;P����ʐ� nA���<Q�#ގU�2#��,C��,���t�Ӣ�D�Z�x+V��hBgN��Ū��Ln1�u���;���r>�-�vCnxBH	pK������,;9�vM��.i~��iQ T����J27���w��h-w�҆�(3�c�4��roݒǱd�ɳߞ<��A�D'ȹ�nO��똣Gv�p�xd�� �O�N�T�b�Є�M��6ٞ{���݆Mv��N��l��bK�n@�y���~�,�Hz���)�E�)��o�4�2MB�0���h���lY}C�ȓ.�$�&����A�r��k��}��#�d���DPt����'fc�e[3Aa<���g�u5�Gܴ5̱�lW�R�Ⱥ߃�*����r<%���,�|�r��M^���(��^�W�zKm�W��r��T�]���GC�D"d�%��"�Ɔm~g�2�*a�����2k��@�����WnH��X��@�W3�o����}^O��Q���/�������-����]�'�hJ'9�{�5��C�H�.�$�\�)؉&�+�V����i�I�y��$:�4�Go�	*�=e�,���xxfx1��DP��i��ȓ��I��z���A�ps�y}vG�I�y���Oj�|��	"+O�lt���m��|�#��H���k��y�mi�����8�a~X�̵g�\��v��&�����4%4�,AF9�d�p��)��D�%F+,��n��V��?.��w�E;#����\V���[F���m0�����ΉF7��� �RP	�6���7�8���(�c�����߭���z�]�י{�0P���S�,�sEmܐD!�e�B��h_��	�%���b
v�����V��E�t�.zKfX tэYb��"� Q��0��T�z&O>;�E�� zS�#]�N��3z�)؉.�tO`�[��q���ˇ�)�i�±Z���,���UFֱ$��&�~ش�~~5)��bu7�"УJ�7�Y����CYJy��P���X���0�c����e��?�>,�$�j!�{�#����Kqc�ۢIXX��#���.Qjk�t�@Z�]\@��=�:\�r�&$�̍-�m�P�]��)ȥ��ϵ�t�ie�<���i�f%�	AЪ��!�5C����o�#����Wv�(M�rS/~Oz���fehD      D   Z  x��V�r�8}����-1j]�-7�SI�N&;U[�R��0�@ '�~�6؉cC��U<؈�>}��i��̓�.��C�څ+�"����V;��v��IQ9��_d�ݳ��k��SG@@{�(�(a�c4�A����F�A=`j�6�֟�	�y�ւ$���U��,�#FR��
��&����.��-ia�$s�Ŗe��đ��˺"i>���U�<#���"�������/I?��\,�<��q�aVB1�̂�H�d���;5Aۊ��]��^80�ܔ�Ϯ|���07L�Ap][ތ��׌�=(��@a�|%@�
��j��U�һ�h����H�,�j���#-b�WA�[ջx8����.)")Q)*�[@����4�l�y��n��gA�8�0�<`G�T���ZMb{��eV��E�������]~���;`m��E0�齜�@L��l��L�p�����־D��$�l�m ݸ��H�ԗOpl����1"^�ƋQ��ϱ�K�=���`M7>��@�M7���7��g�L29{���������2�G�l�T����(���NW{�`�x%G6MM>3��zeS?���2�͒8����_j�?S�5�5U2b���o�҃f^����+�c�g��pzGyY�G����_� ��uz�-Įٶ2bA$��N+��R%�n�絛�u��LZ�3��#���5��k/3��5r�����`W���0b�̕��V���܍��n�i��5��n6*-R?8��0�=#9z�̳��t@���4��B��{����+���듉i��=_,�s�J�'#оTȌ�֌���ќ{�n�࣠��F�y��xñO%l���YO\]7�ٓ�"]�f��Wd��)�Q����n�=���l��a�d��j���e_E4�xx���_�62�+=�D�E�	�=/N���U�)-p��*_K�2���Jp��o���fY���i{���I��}������ӣ��84�q����T�$��y����V�x��'�ߙ�UA�oO�Q{3�p��V���ڣx3�;��p{gb�C�nl䈸�<]��"���(�V���K��o9��!�S
���{8���� Է!Y      F     x�%�۵�0C��bf�y�r��c$�O��b�}�3|6.�v�$��Jf���v��ʃq�KXPhoW�'�UJiV�7��~`#��G��&M�K҆_���υ�w�K����}��8�B���MiEH/�R�O:��	Q�5E�Ce2�Hפ,�S�q�7<�}~M
��%ܦ�w��HϤ�ǂ�셔߯t�T��~)�}��x�p�4�ͥI�R]X��܅F��A� �Sr�l)˒#`�ue��A��ޥ�w=)�+�z��ga�G@�f�˄[�z�*_�B��B�s���@�(
���#����	��]��[�R
f8y��R�~f���GD/;�T$_b����o���-��O�ַ��Ѣ�P����^_�]+YӅ������n�6��֪�)M�'I��/J/)�,1����1��mH㐉�K܃���d<����K�(;�8q~~�f���:���i���'�g��'b�>�q�D�oh7+�H�zI�g�'��~�q����<��/scIvW�Z}K�� �Я��      H   �   x���E!פ�w�#j/��:^�jF��an�Hᢈtl��G8�D.<���R��x�I�^:o���Ⱦ#^����eOy�xArL�Ȝ+͆��g�h�0�1�qG��0�e�)Q�F6��{�G���ʕpV��4j�d�\����˳X�D�|��D�uG�3���F����6      P   |  x�u�In�0 �ut��?jp|��{���v�6, �qE��A@���E�DZ�V�Y�������  �	u"}�ةNh�ɛ�N�
��Aw����SvWj���C/�= �^�	Eg�e�	e�SYE�Dy���R�)?��iO�Y���NeB-{�ꄦ�����=U$�^VQ�R])3��^�	5��e�	�^�{�@����8�"-�mw�O��c��'�Nw%C�*��LK�DRd�	,jZs���E�D}��PEh�ek��	e>5U��DJ���u��S���}��N��X1�@��{���TR&�N�Z'�>��.�"y�������a��j�W��+~Q���W����ݺ*�)����ת^�P��Z���C����î�r�w�WW�T�^�H} *�vW��umKY 5S�KQ�ү�r�Z�sj�ړpZ��Xs��S4>-˒>�	E�U�z[��J�ir\i5�K���?�� ƍ��j[����b+h�S12m�r�rOթ�&�^�ÂO��S�P�V�Fy���Mw�_�O�rU]B���G�=US��hfe�&`�xO�����҄֗M{�*ט$�����5,۩���O�UK{}������2��R�گ      @   �  x��ZKo�6>˿��z	�E�R,P�����b/�E�jd��#��}��lK���f;"�3��|�!E�/��F�c��v[��n�m˼9����}B�hQaMU�T��*�E��i*1��
?1��
��H�ҿ5�#��؏_����RZ�L�K)�������)�8�+̡�6�p��=xvmc+X��Ƕ�ȔWZ>�7-M	_��Rۦ��qAʯSeD*Rj���3y�~�[�?[7���4G����AQ���&�Pi�heMӂRy	�<�2i�ܮ�]�2D{1�Z�b�G�C���ʭ+���
�7�<sՋ�Ӽ�r���r�S!���G7Ȉ���~
풔���*9k��T�š���NY��?����.+�������-��m�A�2��b��/���+
���5j�M����]6���|F ��;��Ζ�ˍs�E�V��L�NP�$�?�1��~����,�t&��N���3�,�n�̟�q܅J�V��a���o\��4�̝A��%�:�P"X�V�*l�̺#�/�gXf��	���ԇ9�l��E�!pm�ɰ�;C����1m�{I�
�\���P�O�v���^XV��A�E^ Of�~hܮTy��C��m�Q0��UqU�)�Ϫ����aajؒN��^�+��i�j*��N߻��<g�l���+F$cCJJ�t���S
�D1��01�$J�7��x*�T
i:5J��v�YS�(�O:e�1�HG8�W��Rα��ɑ"<Bﮔ��m�% �B&���Qѝ)��):X�M��V|��;`ezN����l�p���g�"�pm���b���2�H���:�]�+1�}������k��ܛ���/�$��o�YPl����� �2�fm���.�Jo:rq葹���J*.�Hi�|��uO旞D8�'�<ړ^̋=�=	3_�� ��72�BS���U�| /e4�C���/��� �����\�ƃ�%�Ξ-�������Y�\���԰$�Cy(�QT3�$��5��X�
E2p�U��.I��W)�����R~}d�#��O��St�45d��)'�k&����KD�2��)�G��R�rƢ[�U�:���#�y*U*�9����b��8߀E�9D�?6��~�C����h�M���頁o���o��+�L��,5�&���m��w]��y�)�N��ߥ�<��RP�7sN#��7Ž5���K}��Å��)�d�d�­4�NszU��Q�Q
rj�0�G�{� ��aWu �y �/,�b�ah��-��̺��)!��ZMu���<��.7��ΩWݙ2�7���1HXT�&�k���qgǡ�Q)�X0B�^�q����B�GH����s����F�t*�T,�fǛP蓽 �޳x&{�j��~z[�YB���ZNf\�됝� }��$�~���{�Ș�X&����q�� ��c����P���ޔ�%�G��I&Yh�X��'�4f��An�塀�%30`��N� ��f�|@�Y� C^�ܽ����� �k�}�i�
�+k:x!g\`��M�}��CH��[aje��O�$c+i��tḰ�+�4���l%���h���2���e!>g�,l� �r�@�r$�G�&NW�1�l��L�������[���&�@DHJ�������|&�~쓓F4�D���*��F���+��f��^      %      x��][s7�~f~Ŕ_�xЍ+�|Y_�؎+v�=�-Z�e&�"�u�[�߷��3�`$�Jʩ�R���F߀��x(|#�\��2��V�afr�x��_.w7���~���,�ϗ��Ϳ��_gR�����R�T�� �������n?wB����}^�/"ԃO��������O7W�պY/����y�t���\|�?��cZ�C�Aυi��t�A��ۑY#!����9�9��+�;"��پ9L�Au	��a��z"��΅h���JF������Ǜ-��L���v�����ذ2��\@ϵi�F�*� ��i�tR)й����K�*tF	SH�LB�9��	���%$/���/\��-�\�΅m%H0X$T.�� Z���aZ��2�X*H=Z��'���)E�k��v�'��Υl�KA)h"].b�J���aOdA�s��F���
�L��2� �Wd��(����"��p��02d�V�(,���D4D�O���Ċ����A�REJ�b�A��v�� )o��0�|�n�A��(Pl>�\�>ŷdq�D�b�a��d>ID��
0X	��Co��_/���2���b B�H��(���q�gO~|ڼ�0v�h�9��M�R�I���f�_W�� 9�fΒb�w������8��d�HA D�ȟ��GUEP%�6{@��-��s ?�_�F���p�4�TqL�Cv^8�S��������b�>�Ualb��UFc�Nn����FW�])�m���	�+�U�#�M��!V'�"f�W���������I0ڑ5#J��Љ�	�d�!}��j�����n�Z�}�K�X1�C�v�9b�QǊ��"l\���*6;��"����	zq���r|V��T� krYIj�[����M��A�V��6�`֛u�"���q���7�i?4�M��NT��(�\�â�"-+�ZM�=�9�:Ac|vf�9�:Ak�����M�<蹴t��� �?SWd=��AVVW׌��]0�X�[�t�M싫���F�ھ���B�1[W#*���H���ρ�� 8O 8ښ��;�ø<��0<���td�"+�����龩P�B�^͸��
���Q���Ԉ�5��>�~�Aa}�]:��(��=d���ξ;a�!4��������vsA��Xf�J
ߥD'd1s��/>}jv���f�A�����z��0����V�l΢E�-�V7�����Ca�(J��{&ke>���
�L����I%�V���y�S�Az��&~sD
������<|�L����p��hr��|�qJw���µVi'��Ʃy��|Z].���Y܅����'~+rp��|[�S��%Y&}�.��|*:�*ս�ߗ���t��߉>�!��[$ä�}���㨛�߀V��W>N�d��/��4��A>��T�R>���e��W��e���Rd�T�-��w���~L�<K�\�\(h�z��f]֥0�E�Ȉ˨֋��UU��➗�ad?���L^Ν��%�/%g/6��e�n�il�D�J���`��
�W��y�Z7�W��1��|	��dx!�'oo>^���d5k ^� �X޺h�������cȐ� ��.R�׫���@P!Y!�O�;���r���q]G��I(��N��0FB��Ζ��j��������g�vI�����ܭ��}���~Q��	�~�m��R�$�_��\����NN\�]��^��%��5iy�8��YV ��E�x�h>.���3?H��M�]`���N��P�H�ɯ5�=b�����9碭���v����l��GoG
1�����u�_�i�o6d��}Y+�H!����%�䘪a�0=۟w�mW�y���<q��a0pF�\�M����'ϐ�!�꜇}�<�.���˯i7��``�ҧ�"���=���oRh�4��!�WEz�V���W:��'���ڹ$�8�Z�9H��f\Tt0I�r	[��>�b|!�*�%t���@��JL�闈2:9CfDFVd�p�ZO*2N�u| �Z1YTԒ���`G�A�L��* 7"曊����[N.Kc���O.��D6��f�a�?����J��c�/��"ߤp��AN�NĊ4�.Drt"����Ert"���`!�� �hA:�)����D ��A���3�Q�u!M.�S���w�n.2�-����,T�	@">Ɗī\d|���6K��}�}-\��b�q|���ݰ&�c&�@��N�V ��*듛.J3���Ӎ=�	 �4�uK�A�aYZ�J]]�9�_���)�U�cl����:zgS�T�V���JP�1�C&S��R��jiK��A�q�NA�v�!>|x9�D_���b��H��?��/����zAF��A�saK�$��D�����[-/�%G�/uH�R��cՂt���G�Ξa2�G�,���h��c���D�!D������$�bX:b�Mz�r�fj*:G����$cءL�%�.�(�:����o^�j�6g-�v)T�&E�d�b�[rֆ�k��a�IϞ�|�hr9i���*ZT��A0&�s�B�.�g����L��<t�U�B�iE#��S�ȹ�"$v�3�����nɹ�lP(�@�f"����T%�HF/�h����h^T��R�LEd�d-��Б��4�����hd���E�E��-��͓�v�TK�R�lE��3�>)҄��Tݾ霵�=?^�x��a����w
�^-7u��s�R�lLD����bݼ�ٮvW��]��F�yұ=�����͓���ķ����/��	��~~�db�M�a�'���T�t�N��p�t���)��ѻ'�~j^L�"'����ɫ������V�A�K�:�:�j����|(^.^XŞ�
}[�٭.�7�������?���n:�>��������@��+1 $����-5�C�&!���<�YC�;��v�\�7��ݾ߫�A���|�Va�������:W��<m��by���xr_�*`<�-*���^��g,1��tR�ԋ�������Y�X�cA�Z���.�ɶ ���W�[	�������N�a��֭`K )Z�ҫ�	yt�ǫ�v��F h=����o5������<y�FńOX�1�\�T���hʤ����,tɹ� ��t�%i;���#��T��&�)���р#!�nx��1d��a�C
R*N�h�Nh
Y��LANŮ�B��=��yW	4H��p�әc};��W��QP�;n[�A�F1F}��Qp4Կ����J%�HO5�I"��c*�U5["9��Xeb&���^��Zv�
Ek��jv&�p>�=�)SR�Ԅ��L{��c�&Q5d�7&�m�R�fQ��r�>��V�9DNyůOG-_� U�MĘ������0p�W�:��Q�(au�������ȑ��C_�qY];��)R�~tՍ@ 
��P���lE+��V�������(�����Z]Q=���E*P]O=��;��^�fp[���T�I�C����Z%dJ�s�u�Gic��!�8ؒ��u�!V닆��Q7+��kE�*c1VY0�(oV���<eK($���v	5�p��jy�q�MKGq�(*\�Qc�=5�n���������t�/�K����FrM����5�2C'7H�w�IV�w��rq�ʁ�@H6r���v�"3���z�&��v�i��EK�ieb蕤 8�bd�N7!��+���S��12l�
$R��{""��<��j��{���� ���X\s���FY�N<�@�||�r�K�>3�ɉ'#�r��ŊB��f��7��6�u3�?L0}�bLv�T�^�l�i)JN��ɘ��I���;�1=�.]x2&V0�鲘'C�
$�r�k'c�
&*յ��i*�J��=�d�BY����&��ɘ5��� NW#�����w%�S1��F���9]���E�%�ۜ�9�E��?��9sL��K��OW#S#Ɣ:E�����c��V�ɘcjĘH�Mq�ɘcj0��*�'c �  ��c�t9�t-�1-bH�"y��1-bL��kM:sL��s�O�"U�"��+��)�s�&��C��C>�<]�TE��"�N�YQ ɷQ��}2dE�tɣ9��>ҵ���GU�G�J7�O�ԅ���t��'�_z�>�JE�i�6���h�ITZѵ��D�'Q��F��hA�$�dJ��y�Q�`q�&��ڪh��$j�!-U-X�D�]wlM�`_'�t����,K�ޚ�%���
����j�6Y���P%���ɂ?���D+d�h\��BM�B&�Tz	�J&S!��2�3U�d*d�:�U.�
��I���%Sᒵ�w�q�D+\"G<ꍬr�ָD�J05��<`�]�����U���	+R��&YᒓJB-c%+Tr�nV�d+Lr�D�I��$��H�G��#~"�Yk�9-RsJM�UX��fdM�B"g0%�j�#B�:$J�1|C�����Q�2e6pܭz���6�����
�v逯6�^�v�kl�qp*�?��Zr�N�|Y..�6�u��)sC����X�Z�ոOS�|cg������N	��3�~Y-��Τ�2��<g���7�6��e��w�S��s��܀�3Iݑ8������sq�\�r���c���?g2��BS?�����Gs�bd.���uz�l<t�S�"˹(n�0&�T�x��ʹp��^uQ�Qz*��Y�d��1�[�1�Jc�N��}̭?�O�s�\U#N��'M�?��*�s�_OH��g����A����Ա�Sg�}�Mn����!��΀�24�=��	v��vM��u�Vol=ˋ���p'��VvO��Pf~�e�4ܭ�N�ޞ��^�{0yUɰ�԰J�D���[n�_o���y�8��b�����{����~�C7 ��cNpr (⬎��Rso�`6
n3���W���b3 W%81�{Nuzp= ����|�>�l��M~#���͞xG�^�2{�t���as�N���o�����G�8��e���5c�k�����i#1e���������ҏ�ŗ�T�3�^v������ص�������f�����)�.:�V�9�S���x��y�	�Hە<ݱI��R�{υ1;M~��F_Ԉ�X�+��\TO��>K� ?�$��Q���sL��Ky��7V�����tN�_�NSB(ɩ^�::����6H���ҩ�ޚ�}��?>�+ʇg���}A��ڡ�Al�R�N�n�!(�C�;iT��2s��:����x"�����!��8���PJ�o��g����L�ߌ��Bo�#��c��!'r��U�*���8D	\C2+��Q�����[�G`��!��Ã�Zӱ�_�������
7�2��oE�~'DDǰ)�pҰ�[�}��,~vض�����X�Fo��!�����쌃S� !�����S��ʁ�!�ՠ߯�I�Y��G����G/	F,AP���cC�)�jP">w|irbh���{�-�U��8�)��?Q�R����m	����� 9�J)
D�������C����8�����V�����H-��nZ,�Sb��Ղ>�q�e�w��(��C,3�5u#�.]=6t��`����h�0t�2Ǆ�����k�)�T��rn��u��Ý�׫�b}�uc=�����c���T��|ב�rB�`@����i��o���o����!�         #  x�mQIn�0<��)"9�_zd�&��ZZ���"�I�\͐�R�ё6��K����EDL�r��a�̜B���fLp&��c�1?8����=�$2nk_8mL��t����mpy�Yq��ti�r'r0����@���A����Ȳö3����=_�PL����С	�UO��ԙ��j��-]�5a3t��`��0���6��?�)��@ɇ(����&�����f��?nu<%B?�Zw�Ph"�U�5�]/Xt^��A]E����g̈́_s�A>Y$�y󁤹�� ~��,         �  x��Vێ�J|f������n�%��#�zC`Z���h��uw �v�P^H��r�lʮ�vO�j�!��6���(�A��EYUH�)!�'�n�4~� P�!7~ׄ�Hn���+]�8������>+��;�w��(Wy�PWy�`������kp�GJ�!�\�ȥ���K6�?\�ǵ��Si2y�2�~�|=V�;V}�!���_�������H��B%�T��������r?Md�Z��GJ�;�O����Db�Pk��c�>peS���F ��,��E����/�&�]�		�Lf��?�9�O_���~Hݯ���]S�?<i�a�U��Bg���-P"��(���%&is1��.T �T�����ѐ�ӈ�^X�MG�rǾ�:���De����e�uM�пZ�f�\v3T�?.
�# s�޲�v�
l!0�s�&C�F�O�2�h�%�f㿷��h0�=�sk�q��Mm�3}_���r3t%�y�\�Z+�"D�����U���{�g@c�4	��Y�����;6?������B9>�"D9�/�?��d!U!�LIm櫀��p_=��D�H�)@��Hv��|8��+��4�&20Ɗ��0����7��QzA�f�b�/_F�0i.aAo�c�Ok+�#e9RI".�P7�ľ]�2��PHç��9[�����ؖ�D^�,�ΐ���� L\�;�;�-(���,Ղ�79�P�i�P��Τ��K�K���맦�&^�:��n�����y� ��84��w��_�ـ*��ԓ��p�".G=��
7�LE����%�LdV����jw��#�������;f�|�Pa���&�heR�Ȯ����r�F��Z(�Y��L�b��~�.���y��L(#据���H�]���aw]�r�l~�=��R0�9+3��Ǐ�j��#Oe @&̀'S�B�ќ���f�.�-�ͬ��;��M�t���>8I/��;�[.]��:�켫������X~ 8      &      x�ռI��Z,<��5���fo�1؀��d��}ϯ������W*�,�G�C8�Z�Έ4s٨�]�6�|?'l�1�����àE��ԇ�����Z�'S�i���*�@I���f�x�'۠�"����`�7�?��7��~�V�EO^]��,Q`'������K��],�G�Z7�o����&�cP��6�[Ooٵ����·��>�3#�xR�)dzu��#�+V��N�K�����1Qx5Uڔ�i���z�Rɋ�C��C��� ������_M��� �o�}�Yሆq�s2��3# �t:���u-�//�g�K�jɸ�8�Y}y����
�h�]!�O�y�t�rl� W`JΏ�ޥ��Sj�rRZY�h�I�������a���ِ�i�Xh�� ��;*ϊ�)���D��K���������ە����Zlo[�:Nf|n��q�ŋ��]C���j%U�h���#�PV%c�N��U�Ƈ$�CAr��b)H"�O_EX�!4�7MiC�UF���Ѕ�%�^^,�;U�7i��#�#[UWA?�H�2�W�f��K6V�<��$�x����C��ثSn�#*����=�2�VY"����t���@��{]dBR�%�<�O�1�&k4��H��"o����Q�OG�A��b�;na��Rn��mH�Kr�V['0M���>'p��.x�?D� �����H��P��C	q�5�ώ��v6Fq�t��MY|���݉˃�y_�1��9�wuO`Bp\�=iu2�Ź^Q�y���a9Dq��"X���.ڐ�*.s�!�q��Vۛ��"�/|���y�msݯ~q���l�^�A\h�x�t�{�f(�Z��:�M*fN���H���������lWO�=�B���R�{�F�����c3D��y����;��8J��7��z{%]7M��!?ĥM�ԗ��D�"KD�#w�/U�f��My�Zy-e>��������)�,���ߊ��H�������^E�H�#��ԏ`�f�۬����(���#�	�ẇ��׻"w�HZ�j\*D�l���j��v�M?)��CP�&��W���)���/��N�Si��A��U����h��Έ��mNeL���:u�����J��Z�O�RP�	���|��@�F�r$��2�_��Tޑ.[�4c�Ow`�*{L��'���%��m�����j��@�����F������1-�Z��0�a�`� �B(�6��ɳK%����ꈺ�T[l�|o���NI��my>��3֡S��5?���s��7W\�m�VO ~Çy�����	�x�Pa����m� ���V�F(��\����O��sK(��\k����)����IW/ǕJ�?�d����9@}����?j�Ȫ���C/f�"M"�r�)�Hg�����0Y�\<�!x�s����3xܕD�
k���N�ȸ�'!�Ck�f�����0= �W�B��-����mǇN�V�@-DK�%G;�B��,���x�B1p���u�L��2V���l�CAeQW^��b."���R��A_*
rA�"�[#L���!Öe�$/� �i���̣]���2�͋��"���}܋�>T=�b���v�y�Rq�o�Y�ċi��J���d�|�`���w{)�i'��^�������NO�Ǭv�pnS�9K8,w0�f{���H����I������ǃԷ8dO5
�˚i�:����6�ͱ�8��.��@�.�Q�y��Q\��B���j�:��hDH�C��V{9�E�;���j�jV��p���Lx��Iq�7��/+�Isr����8�&��HH _��V�S��AnYSO�L��1��&�:*�����D|N��A8�C��u�7��;ݰ�f\�������˛���,��&i?�"�!�?��^J�1���)w� :mڡ7��y�cӍ��k1�Rq+�U���$�v��K�g�i
���r&�?�3�
g�'<$���I! �-��K߲ÎL���0��$	�Ȏh���Q���@}"~kt`���t�j���%�����n�Y�w�7i5�'�!0�s���,���5�v}P�d��"AVQ}�~>�C̑b���!=�u��Ӵ�<�.���Ē%$6e3������G8�]_9T�X��*�)��	G!�4aac���ƽ�IϢ8��w�,@�	T���\�_mBW��AAȬmã~�/8[_�%�I�i��N49��$,۵%v|��l[�-da�,>
�9h5�T��e��fm��s~�.ա42i��t�m�a��o�5� �"hȒo����g-��s?]2��+mv�oj�<�<|���ݯ�Ļ��ۮ'f��>��}�S%2Y��I7�$�����%�(_���%�SG�]̦tQ�K���Q�V�Jv�Z������b��G�<.��Y�Cfɓ�$*�h.!#��Bv]���JȲ�S��*����{&�J�)Z/�/����c娪1}H'_vﺺ����E��²9X�]u�kD�.0�}�wk��׾�����,�ri3����m��V�r��[� �P"놦��#�Ճ �A��	�-:d`����K�ozz�ۺΫpFߣ���/H����Մ����X���2��s�4��m^ث�E� �JK&w����J�W���_oW�3�G_��9�Q�ve\��<ۑc'��=����/����'n�达��m_X��Yb ������Z�Se�ʻ��g���-@� �h���?C3��5��:HF���(`�,q�.�Ȑ\iˊ���T�>*�O!��}s]\Rd�K7��xX?^���)�Ҙ�
��O&k*�&\f	=��E�ݶ�7P���Q�|&Fp��w���ȳ�N�n�?D����N���5���#�bN�P,��M0�� ��b�j�f麦{2J�b��
ʧ���'^��ӎΫ`YZ�8ɅY�S�o/���7su��1[t�u�%���j�������B�:]J��I�Jٯ�[.�ׁR�1���G'��Z_BZc2��<��I��l}u���u�����q}�a�:�mW&�L������;`'�ׄ�r�\�#�0OBٹU�f�i�ͮ�)��F[:+G�-������7I���ǥu��٪����7M���ivx��{��)e�O��4c��2�f���e҉.o�ڥ����˛d�@��أH�O�q�,�������M���r룠4.}[tr�� ���z�y�u�	֮a׍�xf/��P���f�`���?�>%k���@.���Lйi{�e~>�u�ɞ���`Ke�s�,��a�F?�\ї��Z���z�~��9�9_4Ƙ|׬������ⴞ���UmO���O��G���-o��E�aE�T*+r9��c'{�Ky���lFCȴ�I��b#?�)�us5OF��Ux�RY��/ݦ.�\Xi��y�y/o��"BÍ��ni�dC�w����Lx�C�8
��U���_{Ɍg��P�9M�/D&�,%�����8�JDR�%5�ph]�]]���|�������f�M!�)m3gH�E�Y���F��v���?�����N���R0�'�תɄ8̭ߙH��GmE��+[�X�D�B��ݷ�_������ق�H:*5�G��Q�I|�����tL�ݬ*u�W[I��ӄ���Ѿ|$�VWz�0=�ɗ�T��f� ��k�lw�������P�{�{��Ca��bq%iw����Gm�#���9�~$�~�ob쬙�M���j�i����@��ː�Ǖ٣_����X@��.S��$��: 5�Tgbf9���!ЫMđ��(@�37c&r�,�(?6�dJ˷F3��?���CC��Q!�bR��b�����Rߛ�{xL-�(��N���:x��Ut�u�[4um�n�è-�eKO��@��'��cJZ!o�[u�� ���MF�2;��k�CP�N����ʕ��t�K2x"3r�#��2nYFZDc�?.��P���/N��FE��욕3+nM[V���C�J��=;"�2�ߝ�*�gv;ѓK��\1�����1�G֙v}f9dZ+}�����:���y���_��5� %  2Is�#�|�0�Jc^�ә��Aˤk�wP��l$'�2�*��|eH�U�2U#�Q.��=qͣ�� �"��������]#���)���c&d=f[�M#���q��v?0���rB2-�tͮآ��0��pi��V�<s8J���z�7����އeY�����L�"G8�8Dq3t�H�KjB�!�g\�<D.0�1y��r��_�2O`��H/�}}��H��C���<Ϙ/��/��Yj&� pݨȰY�>UY���}�8$A!��B��>_����f��h�Ryv/B�Wmn���K���JY�oa�y�<��?��?��2����u_�p6UD8Q߳U�[UKRM2F�t=�!s�~w�z�Md�F�7e�_�Y�����}�a4��au=��p���D����H��ǲG�L1�a��
<*j�����'��k(���̫?���ǳ'�����j��1Ḏ�Ө.�g���'��W�KR�3�[ �qPva�1~��#K��T�6q�8T�`zf�����"�v(��#qk���Z/��}�U�G�%ۮ��B�P��h�$�[ 6���+o��[����P�I�!r1 ���3}E�\z�G�HNn��W�����j�M@��y#�T+������kGS,�^�x)�81�%m���͌8�>t͚¿�H]~���m��g��q�_��י�8]��:�J�)��h����r�c��a�&��J�u�TR�$C�=���>����˾�.Q�
/�<�����m�K���@<�X;�|�ɣ�ݭ��m6�묞/gQ�nO5]l��mm�cE:�v��	$����!�5�g!j��|�u��PQD��%�� ��T���[��Pqͳ��8e�S�˕�\���>�~ :t2q��cK���W���"kƈ`�_�xNG�uW�#�]"�ЈڎH|�*���n�#l,�=VX
1,'���Zek�4q��J9l������4�x����>�f�W�~�w9e8�+���d`lÚ���#�c���s���]�b�h!u���x�j�I�ᥨ��.�)����I�"Y����R����_�n��..��w"�I��8���U�Ŷ�����2S�%���B��Uf��.R���܇��em���@��;���W���w�zįV}��q�����D��,�q]�`韇X�	��0�]Г��+�<\�ZQP����a!N%�F����?h��s�	�pZ���?�WG���{a+��zi��o���C 1_$��FdS�����ܦ��8�α:����*����Qx���L�:/��U�$��;�=F��Sod����j�П�!1��/�!��e��8Qd�������N��0j�܅a}�8��M��u|ք��6��!͊���n���O�)>G�T���c�;�YX�P��<mT%�Da�EFx#�a?����ϗ7���LcD�{d���C�
U"�[�~�qd���������R��y�~K��n�/����'^C�4�]_��k�ݶ���e8��?���4S���X�Ů�զ��~��g���^�|�P�,�Lǫ��n�9f3HDڶ�m����u�"�1yZ��`L�\c�7'۔�I���w6�%㘡~�yk���Ex���{���أ��Z�q+��
������*��l�W�/������i���f��j��4�k����ۢ�Xd]R)C:I��l@V�0[���������>Z͏�z'��n���'}d�LG�ޟή��gT��)Q,��$���P_&0z�5��b�Ο�O�u44c�m�t#��!�(����BjK��=��'��r�������l�՞	
t���DkmNf��p�Y~A��L��	*��I�^]���Lk�(�FQ�GI�5����"���ݹ�{Y��6��N"��Sjm��}v������w^��(�V��d�_[���/���CF�/�VA��ۼ�`<�L��R�W��"Gb�/�? �)�w�<��7D4����/_�v�IW*&������8҂�4��'�So��\YsWYH��x��+��f�V�2�{q������a�K��z���1�.�,z��G��Ӻr�j� 27�aq���m<�'�ݶ��׊�.�W(���m������E4�1E�����b��@YYUg�7RS�}��O���;�����<�������Ӫ����'�U�7��z�k��o�g��|�U��V����������F	=5a8k('���Qi�\����$���qx-
��R�mu�9�Lu6i�Σ��H׿�c�#g8�&b�ݎ,��ˬ��2r+Ӹ%F/�챌�O�\wd$ܚ8{g��2Okz�=�J���±nH-��
{'D���Yj��B��J�$��,���m�C���	'�*2����}��*����3�s����o��p�h�A��ǆh��-ڻtbL[H-Wp���*���Ȩ���}n��/�B�w�����Z��vbL�41`9��a�>3n�jK��s��L5b�R]�T��!��c��=U���S֛�q2��E}k9;��ht-��.�b'�	Z�-�j��~��0z4Lϝ��^4�B�,O�n��wh�o�l{��gw��|�{��|�vO@��Dg���:��\��ܤ�ތI��a䥩Iy5m���Q���I߭��'��ʢh�S2!ܫ�3��^�d1o%�tNl[&7�������$	���u����+��B�`3�	`X&![���+��瑥�wڞ���
:]��*܈�t��E��1tc-����|�w)�b)��`��m�
 �+D�E1 `G��ٴ$F���������X,�~zlȍ�P���w-//HޫU���7�V�,�/2z��د� x������
i��pkgu^���D���;'�L}SF��鍽_��Qe�yU0��^�������'��_����1�=�"5��LG��Rn{�-ͤC1���'�\���N��Z��UG1�ȼ�ʣ1CYX���ʭ�P��q�t����`n�4�fC�1���$J�i���2'�fǞ�&� [9�R���Uf�z̹��S�4
�]3 �]�07܍�T;�~\�۩I-�+��*#g3��*�0������9�4�4���b
C�
uM]��9Ѥ���c�Y`��ޚ;lO�� �J��1��a;�k@?yl�¯) ޗM���,���,e�m�D���S=�X�ʧ�	����Nd7�����(��������o�2Oꋶ^�U�4C�ޅ�_.������y��~�Qz����0(:8y��E����8��if�n��w���R�U ��^��`�d���u�.�#��mn��^��|�c�)�2�� �^�S�Pe�鬉����'�H g�օt��6U�}�#	�IT*mo��%���! �ۊ�~�����o�V[��}��,�'+1�컲!{x=��x���|����� �z�Օ�ٽֶw��+�[v.�3k��8���{�Q� -X�F���c+`�_�,�D��p�Q�������j��{'�<d��^^<Xy�ˏ䐀'����Y���m~e�Ů��KP]k�i��J�
C��I�
��YZ���7Βp^&�ʞ�{S��1 +~��ړ*���	�j&8�	X���53xsR�}-�F���[�1�'�
�C7x�}�l��Q6 �Z���?8IR��M��M�7'+��ll6������$���m:3���>t���8*~Ļm��^��M}���+u����������m����+#y�s�0-H˴
c�u'kX�F&ꪪ�'��zxr8#^��n���](�ptn����|���J�qu\S���%fs���������d��      ,   !   x�3���ON���/.��000�G�s��qqq �
�      .     x���Yo�@���xmmf��� d�����M��cc�Vc7K��^;I��T���g���7�̀jxq�nc� #�+�Y1�R6 202��,A�|B|��A���?mZz��r�ތ��-'���&O�y~������h�!�­��ë� �,O�ggY��Z�`����K7u�(s��t�e����M�ӻV���U��V��u�;��X�py/��I$�.6�_�p>F^k��ᴒY���<��>�ر��6ܨ��A�|X(�a!FRaF�B��`)*$��Tdn!j���o ��\|�xh�B;�&|���jE-b��m�ڃ�����n/��7�vz>j|����7��&���?�ŗ'�� ��N���qk;�M/�	P.1+B�zA��t �0�)�bk�P�	#�L8��۬�����[?]fu ���yz�	���$�`$'�J�U�Rb�"K�,����F�U��FҶ+Wws��A7���(��������_n'aqrz7;z��ǿe5y���l����I��.g����x2�:�G��p2?�>�3��{�m��!�+n��)�JO����.6�t�,S

d#v�m0*i���"k��
oy��н���UpI�/_�=������]�t���3����@��~zsl\z���F���	�r�PD��Q,(e�HmCg����*]�^S�
�k�y���Z��j�Sb�u��]O�yg��s�r�x�)�ҽ����q�q�����8�<;�~���k?LM���z      0   �   x�M̱n�0 ����@���$�X�S�*8g1�� ���ڥ����x=�x�]��iԶB�L���X��Lܢh+-��P������K��A�7��/���G b�H��!Y�����s:�㒇����f��Ie�x��/��N>�Y�\�x�ӈ������"O{�v�b*�&0��1�ު@z      2      x�3�4�4�2�4�1z\\\ 	      4   �  x�m�[��H�g�W��	����򍋀*��2	An� xA.��t�d2�I��Η�6�S��2B���)fc��`�>/��f��Sz�����\��:w�%<��LMQb*�œ�����u���Pk�>�Ж���ֻ||'��/� G�߉>�}�7(�}"~ʜ�,���fKk%�K�u��fW6�7�P�3� +�[�`�0�C�/�.�@�	��u�$���l���?Nf��b30��h	1�N�÷$_v�SZ�_�Dm˱�eҟ�5K^�����׳��YS'ƮɁb��c�%"��l�N��0���+��z��H��ͦ�&�[�
�c�H��s����W ��dMh�M�_$�'I�؞s\��:o����+lת6~^k��?5���J9��Ef�{��9���l�� ��>M�#?�]�G[ٳ��5��Қ/��.�Kl�S٤nf5���b��⚹铻�O�[��{T�dƆ��e7���#�ܒ��[���%���v��O��k��
�0+�l"��Eܕ��$L(�h�C�[��o
K��n�����WA�Yj3tV�"�!�x�-��dJr�q�[��Y��m�J�����i�Aޕ�1Ƶ�rFFn�E�"�Az��gGX�_��<�@��jwi��]��'� ��[��L�j�u��'��y
��Vn]E�l<�y9>����C�惨�U��� Ŝ�M��)|�O	���6W�S��FH�~�c��ϣ�5oE��*[��k�y�A?�!B�1+H�<�iH�E었Y����Ǹ�(lp(X�8���U��f��(���]�=b�[K��"�ҡ����`{�;���?��t	��x|�A-�7�����B�O����8J��z�\J�;M\�IH�l�z;�B�8��%>�b��P�i��/�ٽ'�:����a����V%���ZH��p��gd��%D0���,���ˏ���iJ�u     