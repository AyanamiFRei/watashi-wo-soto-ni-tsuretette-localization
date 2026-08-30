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

;Close
[locate x=800 y=790]
[button graphic="icon_batsu.png" target=*Megic_help_ok]

;Profile
[locate x=460 y=150]
[button graphic="icon_profile.png" target=*Profile_check]
[s]

*Profile_check
[cm]

@layopt layer=message1 visible=true
@bg storage ="back_5_sp_0.png" time=1
[font size="20"]
[font color=0xffffff]
name >> overwrite complete[r]
occupation >> overwrite complete[r]
birth year >> overwrite complete
[wait time=5000]
@jump storage="scene5.ks" target=*s05_01
[s]

*Megic_help_ok
[cm]
@layopt layer=message1 visible=true
@bg storage ="back_2_sp3.png" time=1
[font size="20"]
[font color=0x00FF00]
[emb exp="f.player_name"] >[emb exp="f.message"] [r]
[font color=0xffffff]
Megic >Who are you?[r]
Megic >You’re not Kaizaki, are you?[r]
Megic >Where are you?[r]
[font color=0x00FF00]
[emb exp="f.player_name"] >[emb exp="f.whear"][r]
[font color=0xffffff]
Megic >I see.[r]
Megic >I’ll tell you how to get out of there.[r]
Megic >Invite her outside.[r]
Megic >Tell her, "Let’s go outside together."[r]
Megic >Whether you believe me is up to you.[r]
Megic >Don’t lose yourself.[r]
[locate x=630 y=820]
[button graphic="button/icon_home.png" target=*open]
[s]
