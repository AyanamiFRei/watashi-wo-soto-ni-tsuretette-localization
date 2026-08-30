*start 
[cm]
[freeimage layer=1 time="1"]
;音：チャイム
[wait time=1000]
[playse storage=se_chime.mp3 loop=false]
[wait time=20000]
@bg storage ="back_1.png" time=8000
;後で消す
@bg storage ="back_1.png" time=1000

[cm]
@layopt layer=message0 visible=true

[cm]
#
Where am I?[l][cm]
#
A classroom?[l][cm]
#
I must have fallen asleep without realizing it.[l][cm]

[chara_config ptext="chara_name_area"]

#secret
Good morning.[l][cm]
@bg storage ="still_1.png" time=1000
[stopbgm]
[playbgm storage=bgm_01.mp3 buf=1]

[wait time=300]
#
Looking toward the voice, I saw an unfamiliar girl.[l][cm]
#
If she's wearing a sailor uniform, this must be a school after all.[l][cm]

#secret
Looks like you were asleep for quite a while~.[r]
Me too, though.[l]

;君は誰？
@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=190 storage="select_01.png"
[button graphic="select_a1.png" target=*select_a1 x=83 y=270 ]
[s]

*select_a1
[freeimage layer=1 time="1"]
[cm]

#secret
What?! You don't know my name?![l][cm]
#secret
How cruel~. We are classmates, after all.[l][cm]
#kaizaki
I'm Kaizaki! I sit next to you![l][cm]

#
That's right—she's Kaizaki. Why can't I remember her?[l][cm]

#kaizaki
Honestly… Try to remember me properly![l][cm]
@jump target=*common_a

*common_a
[cm]
#kaizaki
By the way, do you know what time it is?[l]

;選択
[freeimage layer=1 time="1"]
@image layer=1 x=150 y=290 storage="select_01.png"
;知らない
[button graphic="select_b1.png" target=*select_b1 x=183 y=380 ]
;18時ぐらい？
[button graphic="select_b2.png" target=*select_b2 x=183 y=445 ]
[s]

*select_b1
[freeimage layer=1 time="1"]
[cm]

#kaizaki
You just woke up~.[l][cm]
#kaizaki
It's eight p.m.! We've blown right past dismissal time.[l][cm]

@jump target=*common_b

*select_b2
[freeimage layer=1 time="1"]
[cm]

#kaizaki
So close~.[l][cm]
#kaizaki
The correct answer is eight. It's 8 p.m.; we're already past dismissal.[l][cm]

@jump target=*common_b

*common_b
[cm]
#kaizaki
I want to go home too~.[l][cm]
#kaizaki
Looks like the classroom door has been locked, so I can't get out…[l][cm]
#kaizaki
Come on, try opening the door.[l][cm]

@layopt layer=message0 visible=false
@bg storage ="back_1.png" time=100
[locate x=1126 y=174]
[button graphic="door.png" target=*door]
[s]

*door
[cm]
@layopt layer=message0 visible=true
[playse storage=se_door.mp3 loop=false]
#
Looks like the door is locked from the outside.[l][cm]
@jump target=*common_c

*common_c
[cm]
[chara_show name="kaizaki" face="komari"]
#kaizaki
See? What are we going to do…?[l][cm]
I've tried all sorts of things too, but nothing worked.[l][cm]
[chara_mod name="kaizaki" face="kutitozi" time=1 ]
Hey, could you get me outside?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=340 storage="select_01.png"
;いいよ
[button graphic="select_d1.png" target=*select_d1 x=83 y=430 ]
;協力してよ
[button graphic="select_d2.png" target=*select_d2 x=83 y=495 ]
[s]

*select_d1
[freeimage layer=1 time="1"]
[cm]

#kaizaki
[chara_mod name="kaizaki" face="nomal" time=1]
Yay! Thanks![l][cm]

@jump target=*common_d

*select_d2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="nomal"  time=1]
I will, I will! Of course I will![l][cm]

@jump target=*common_d

*common_d
#kaizaki
Then let's begin Operation Escape![l][cm]

;シーン2へ移動
@layopt layer=1 visible=false  time=200
[chara_hide name="kaizaki"  time=1]
@jump storage="scene2.ks"

[s]
