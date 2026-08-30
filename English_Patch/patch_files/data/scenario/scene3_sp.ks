*open
[cm]
[wait time=300]
[freeimage layer=1 time="1"]
[chara_hide name="shoko" time="1" ]
@layopt layer=message1 visible=false time="1"
@layopt layer=message0 visible=false time="1"
@bg storage ="back_2_sp.png" time=1
[position layer=message1 width=460 height=700 top=100 left=420 opacity=0 page=fore margint="65" marginl="30" marginr="30" marginb="60"]
[current layer="message1"]

;X
[locate x=800 y=790]
[button graphic="icon_batsu.png" target=*Megic_help_ok]

;Profile
[locate x=460 y=150]
[button graphic="icon_profile.png" target=*Profile_check]

;もどる
[locate x=910 y=50]
[button graphic="button/icon_cancel.png" target=*end]
[s]

*Profile_check
[cm]

;もどる
[locate x=910 y=50]
[button graphic="button/icon_cancel.png" target=*end]

[stopbgm storage=bgm_02.mp3 buf=1]
@layopt layer=message1 visible=true
@bg storage ="back_2_sp_3.png" time=1
[font size="20"]
[font color=0xffffff]
name >> [emb exp="f.player_name"] [r]
occupation >> [emb exp="f.player_shokugyo"][r]
age >> being overwritten
[s]

*Megic_help_ok
[cm]
[if exp="f.Megic_ok == 1"]
@bg storage ="back_2_sp3.png" time=1
@layopt layer=message1 visible=true
[font size="20"]
[font color=0x00FF00]
[emb exp="f.player_name"] >[emb exp="f.message"] [r]
[font color=0xffffff]
Megic >Who are you?[r]
Megic >You’re not Kaizaki.[r]
Megic >Where are you?[r]
[font color=0x00FF00]
[emb exp="f.player_name"] >[emb exp="f.whear"][r]
[font color=0xffffff]
Megic >I see.[r]
Megic >I’ll tell you how to get out.[r]
Megic >Invite her outside.[r]
Megic >Tell her, “Let’s go outside together.”[r]
Megic >Whether you believe me is up to you.[r]
Megic >Don’t lose yourself.[r]
[locate x=630 y=820]
[button graphic="button/icon_home.png" target=*open]
[s]
[endif]

@jump target=*Megic_help
[s]


*Megic_help
[cm]
@bg storage ="back_2_sp2.png" time=1

;home
@layopt layer=message1 visible=false
[locate x=630 y=820]
[button graphic="button/icon_home.png" target=*open]

@layopt layer=message0 visible=false
[edit name="f.search" left="455" top="755" width="350" height="25" maxchars=25]
[button graphic="button/icon_search.png" x=820 y=755 target=*commit]
[s]

;ここで入力したものを確定させる

*commit
[commit name="f.search"]
[cm]

[if exp="f.search =='Megic_00'"]
[cm]
@jump target=*Megic_chat
[endif]

[cm]
@bg storage ="back_2_sp4.png" time=1
[wait time=3000]
@jump target=*Megic_help
[s]


*Megic_chat
[cm]
@bg storage ="back_2_sp3.png" time=1

@layopt layer=1 visible=true
[edit name="f.message" left="470" top="735" width="330" height="30" maxchars=25]
[button graphic="button/icon_send.png" enterimg="button/icon_send.png" x=820 y=745 target=*commit0]
[s]

*commit0
[commit]
@jump target="*message_1"
[s]

*message_1
@layopt layer=message1 visible=true

[font size="20"]
[font color=0x00FF00]
[emb exp="f.player_name"] >[emb exp="f.message"] [r]
[font color=0xffffff]
[wait time=5000]
[playse storage=se_meg.mp3 loop=false]
Megic >Who are you?[r]
[wait time=3500]
[playse storage=se_meg.mp3 loop=false]
Megic >You’re not Kaizaki.[r]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >Where are you?[r]

[wait time=1000]
@layopt layer=1 visible=true
[edit name="f.whear" left="470" top="735" width="330" height="30" maxchars=25]
[button graphic="button/icon_send.png" enterimg="button/icon_send.png" x=820 y=745 target=*commit2]
[s]

;ここで入力したものを確定させる
*commit2
[commit]
@jump target="*select_s03sp_a1"
 [s]


*select_s03sp_a1
[font color=0x00FF00]
[emb exp="f.player_name"] >[emb exp="f.whear"][r]
[font color=0xffffff]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >I see.[r]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >I’ll tell you how to get out.[r]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >Invite her outside.[r]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >Tell her, “Let’s go outside together.”[r]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >Whether you believe me is up to you.[r]
[wait time=3000]
[playse storage=se_meg.mp3 loop=false]
Megic >Don’t lose yourself.[r]
[eval exp="f.Megic_ok = 1"]

;home
[locate x=630 y=820]
[button graphic="button/icon_home.png" target=*open]

[s]

*end
[if exp="f.contact_ok == 1"]
[freeimage layer=1 time="1"]
[stopbgm]
[playbgm storage=bgm_02.mp3 buf=1 wait=20000 ]
@layopt layer=message1 visible=false time="1"
@bg storage ="back_3.png" time=1
[chara_show name="shoko" time="1" ]
[current layer="message0"]
@jump storage="scene3.ks" target=*s03_3_kaizaki
[endif]

@jump storage="scene3.ks" target=*s03_03
[s]
