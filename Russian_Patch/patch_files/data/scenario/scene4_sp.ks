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
[button graphic="icon_batsu.png"]

;Profile
[locate x=460 y=150]
[button graphic="icon_profile.png" target=*Profile_check]
[s]

*Profile_check
[cm]

@layopt layer=message1 visible=true
@bg storage ="back_2_sp_3.png" time=1
[font size="20"]
[font color=0xffffff]
имя >> перезапись завершена[r]
род занятий >> перезапись завершена[r]
год рождения >> перезапись завершена
[wait time=5000]
@jump storage="scene4.ks" target=*s04_01
[s]
