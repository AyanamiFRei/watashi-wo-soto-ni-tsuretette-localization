*start
[cm]
[wait time=300]
[stopbgm storage=bgm_02.mp3 buf=1 ]
@layopt layer=message0 visible=true
@bg storage ="back_3.png" time=100
[chara_show name="shoko"]
[chara_config ptext="chara_name_area"]

#shoko
……[l][cm]
…………[l][cm]
Do you want to go outside?[l][cm]
Come on, it’s nice here.[l][cm]
Let’s stay here.[l][cm]
Or are you tired of talking to me?[l][cm]
……[l][cm]
…………[l][cm]
[chara_mod name="shoko" face="kutitozi_2"  time=1]
You want to leave?[l][cm]
Where would you go?[l][cm]
Your place is here.[l][cm]
Check your profile.[l][cm]

@layopt layer=message0 visible=false
;Display smartphone
[cm]
[locate  x=250 y=645]
[button graphic="s03_smartphone.png" target="*select_s05_sp1"]
[s]

*select_s05_sp1
[call storage="scene5_sp.ks" target="*open"]
[s]

*s05_01
[cm]
[wait time=300]
[current layer="message0"]
@layopt layer=message0 visible=true
@bg storage ="still_3.png" time=100
[playbgm storage=bgm_03.mp3 loop=true buf=1]
#shoko
See? You don’t have anywhere else to belong.[l][cm]
You have no choice but to stay here.[l][cm]
I’ve been waiting all this time.[l][cm]
I was waiting for someone to come here for me.[l][cm]
I have no place in the real world, you know.[l][cm]
I’ve been waiting for someone to give me a place to belong.[l][cm]
Stay here forever.[cm]
[stopbgm storage=bgm_03.mp3 loop=false buf=1]
;Play noise and display the smartphone notification screen
[playse storage=se_meg.mp3 loop=false]
#secret
Stop it already.[l][cm]
#shoko
……?[l][cm]
Who’s there?[l][cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false]
Have you forgotten?[l][cm]
[playse storage=se_meg.mp3 loop=false]
It’s you.[l][cm]
#shoko
……Me?[l][cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false]
Yes.[l][cm]
[playse storage=se_meg.mp3 loop=false]
Let’s stop repeating the same thing.[l][cm]
[playse storage=se_meg.mp3 loop=false]
You know what it’s like to be trapped here too, don’t you?[l][cm]
[playse storage=se_meg.mp3 loop=false]
Do you want to put this person through the same thing?[l][cm]
#shoko
[font size="30"]
！[l][cm]
What are you talking about?![l][cm]
I can finally get out—this is the perfect chance![l][cm]
I don’t care what happens to this person![l][cm]
[font size="30"]
I’m getting out of here and going back to the real world![l][cm]
[font size="35"]
I’m a person from the real world![l][cm]
[font size="45"]
I don’t want to become Shoko, of all people![l][cm]
[font size="80"]
I’ll become you and get out!!![l][cm]
#Megic
[playse storage=se_meg.mp3 loop=false]
……[l][cm]
[playse storage=se_meg.mp3 loop=false]
No, there’s no getting through to her.[l][cm]

*s05_02
[cm]
[playse storage=se_meg.mp3 loop=false]
[emb exp="f.player_name"] [l][cm]
[playse storage=se_meg.mp3 loop=false]
Shoko is trying to rewrite your identity.[l][cm]
[playse storage=se_meg.mp3 loop=false]
If you want to get out, don’t forget who you are.[l][cm]
[playse storage=se_meg.mp3 loop=false]
;Display the glitched profile screen
[playse storage=se_meg.mp3 loop=false]
Rewrite your profile back to its original form.[l][cm]
[playse storage=se_meg.mp3 loop=false]
It’s okay. There are clues in this world.[l][cm]
[playse storage=se_meg.mp3 loop=false]
Everything you need to finish this story is in this world.[l][cm]
[playse storage=se_meg.mp3 loop=false]
There isn’t much time.[l][cm]
[playse storage=se_meg.mp3 loop=false]
Good luck.[l][cm]
[chara_hide name="shoko"]
[stopbgm]
[playbgm storage=bgm_04.mp3 loop=true buf=1]
@jump target=*room_05_02
[s]

;==============================================================================

*room_05_02
[cm]
@layopt layer=message0 visible=false
@bg storage ="back_5.png" time=0

;Smartphone
[locate x=250 y=645]
[button graphic="s05_smartphone.png" target="*05_sp_op"]

;Door
[locate x=206 y=122]
[button graphic="s05_door.png" opacity=0 target=*s05_door]

;Cleaning locker
[locate x=359 y=157]
[button graphic="s05_locker.png" target=*s05_locker]

;Bulletin board
[locate x=0 y=106]
[button graphic="s05_board.png" target=*s05_board]

;Player’s desk
[locate x=480 y=405]
[button graphic="s05_mydesk.png" target=*s05_mydesk]

;Kaizaki’s desk
[locate x=138 y=390]
[button graphic="s05_kaizakidesk.png" target=*s05_kaizakidesk]

;Left
[locate x=50 y=400]
[button graphic="s02_left.png" target=*room_05_01]
[s]


*room_05_01
[cm]
@layopt layer=message0 visible=false
@bg storage ="back_4.png" time=0

;Clock
[locate x=1039 y=145]
[button graphic="s05_clock.png" target=*s05_clock ]

;Window
[locate x=0 y=75]
[button graphic="s05_window.png" target=**s05_window]

;Blackboard
[locate x=551 y=166]
[button graphic="s05_blackboard.png" target=s05_blackboard]

;Right
[locate x=1150 y=400]
[button graphic="s02_right.png" target=*room_05_02]

[s]

;Door
*s05_door
[cm]
@layopt layer=message0 visible=true

; --- If both items are held ---
[if exp="f.vinegar_05 == 1 && f.dust_cloth_05 == 1"]
The rag and vinegar were used.[l][cm]
Letters appeared beneath the rust.[l][cm]
"[emb exp="f.player_fpassword"]"[l][cm]
[eval exp="f.mudakurou_05 = 1"]
@jump target=*room_05_02

; --- Vinegar only ---
[elsif exp="f.vinegar == 1"]
That isn’t enough.[l][cm]
@jump target=*room_05_02

; --- Nothing ---
[else]
The door is rusted.[l][cm]
There seems to be something written beneath the rust.[l][cm]
@jump target=*room_05_02
[endif]
[s]

;Window
*s05_window
[cm]
@layopt layer=message0 visible=true
#
It’s pitch-black outside the window.[l][cm]
@jump target=*room_05_01
[s]

;Cleaning locker
*s05_locker
[cm]
@layopt layer=message0 visible=true
[if exp="f.locker_05 == 1]
#
There’s nothing else to take here.[l][cm]
@jump target=*room_05_02
[else]

#
There’s a rag.[l][cm]
You got a rag.[l][cm]
[eval exp="f.dust_cloth_05 = 1"]
[eval exp="f.locker_05 = 1"]
[endif]

@jump target=*room_05_02
[s]


;Blackboard
*s05_blackboard
[cm]
@layopt layer=message0 visible=true
#
The blackboard has been wiped clean.[l][cm]
It looks like the date and the person on duty are written here.[l][cm]
"Date: (text corrupted in source) [r]
  Person on duty: [emb exp="f.player_name"]"[l][cm]
@jump target=*room_05_01
[s]

;Clock
*s05_clock
[cm]
@layopt layer=message0 visible=true
#
It’s past 8:00 p.m.[l][cm]
The clock doesn’t seem to have moved since we got here.[l][cm]
@jump target=*room_05_01
[s]


;Bulletin board
*s05_board
[cm]
@layopt layer=message0 visible=true
#
A poster for the school festival play is hanging here.[l][cm]

;1935
[if exp="f.age_1935 == 1"]
The production seems to be based on the movie "Holiday in Italy," popular in the latter half of the 1930s.[l][cm]
[endif]

;1940
[if exp="f.age_1940 == 1"]
The production seems to be based on the movie "The Giant Monster Gobira," popular in the first half of the 1940s.[l][cm]
[endif]

;1945
[if exp="f.age_1945 == 1"]
The production seems to be based on the movie "Sound Is Musical," popular in the latter half of the 1940s.[l][cm]
[endif]

;1950
[if exp="f.age_1950 == 1"]
The production seems to be based on the movie "The Monkey Student," popular in the first half of the 1950s.[l][cm]
[endif]

;1955
[if exp="f.age_1955 == 1"]
The production seems to be based on the movie "Expresso," popular in the latter half of the 1950s.[l][cm]
[endif]

;1960
[if exp="f.age_1960 == 1"]
The production seems to be based on the movie "George," popular in the first half of the 1960s.[l][cm]
[endif]

;1965
[if exp="f.age_1965 == 1"]
The production seems to be based on the movie "E.T.C.," popular in the latter half of the 1960s.[l][cm]
[endif]

;1970
[if exp="f.age_1970 == 1"]
The production seems to be based on the movie "Comeback Future," popular in the first half of the 1970s.[l][cm]
[endif]

;1975
[if exp="f.age_1975 == 1"]
The production seems to be based on the movie "Taipanic," popular in the latter half of the 1970s.[l][cm]
[endif]

;1980
[if exp="f.age_1980 == 1"]
The production seems to be based on the movie "Yokai Princess," popular in the first half of the 1980s.[l][cm]
[endif]

;1985
[if exp="f.age_1985 == 1"]
The production seems to be based on the movie "The Disappearance of Ichi and Ichiro," popular in the latter half of the 1980s.[l][cm]
[endif]

;1990
[if exp="f.age_1990 == 1"]
The production seems to be based on the movie "Parry Holter and the Swan Brigade," popular in the first half of the 1990s.[l][cm]
[endif]

;1995
[if exp="f.age_1995 == 1"]
The production seems to be based on the movie "Ohana and the Sea King," popular in the latter half of the 1990s.[l][cm]
[endif]

;2000
[if exp="f.age_2000 == 1"]
The production seems to be based on the movie "My Name," popular in the first half of the 2000s.[l][cm]
[endif]

;2005
[if exp="f.age_2005 == 1"]
The production seems to be based on the movie "Secret Blade: Infinite Train," popular in the latter half of the 2000s.[l][cm]
[endif]

;2009
[if exp="f.age_2009 == 1"]
The production seems to be based on the movie "The Law of the Land," popular in the latter half of the 2000s.[l][cm]
[endif]

;2010
[if exp="f.age_2010 == 1"]
The production seems to be based on the movie "(title corrupted in source)," popular in the first half of the 2010s.[l][cm]
[endif]

@jump target=*room_05_02
[s]

;Player’s desk
*s05_mydesk
[cm]
@layopt layer=message0 visible=true
It’s not my desk.[l][cm]
You got some vinegar.[l][cm]
[eval exp="f.vinegar_05 = 1"]
@jump target=*room_05_02
[s]

;Kaizaki’s desk
*s05_kaizakidesk
[cm]
@layopt layer=message0 visible=true
#
This is the seat where Kaizaki used to sit.[l][cm]
She isn’t here anymore.[l][cm]
@jump target=*room_05_02
[s]

;==============================================================================
;Smartphone
*05_sp_op
[cm]
@bg storage="back_5_sp.png" time=0
@layopt layer=2 visible=true

[if exp="f.s05q4 == 1"]
@jump target=*s05_q4
[endif]

[if exp="f.s05q3 == 1"]
@jump target=*s05_q3
[endif]

[if exp="f.s05q2 == 1"]
@jump target=*s05_q2
[endif]

@jump target=*s05_q1
[s]


;Question 1: Birth year
*s05_q1
[cm]
@layopt layer=2 visible=true
@bg storage ="back_5_sp1.png" time=0
;Back
[locate x=910 y=50]
[button graphic="button/icon_cancel.png" target=*room_05_02]

;1935
[locate x=470 y=360]
[button graphic="age_1935.png" target=*age_1935]

;1940
[locate x=590 y=360]
[button graphic="age_1940.png" target=*age_1940]

;1945
[locate x=730 y=360]
[button graphic="age_1945.png" target=*age_1945]

;1950
[locate x=455 y=410]
[button graphic="age_1950.png" target=*age_1950]

;1955
[locate x=590 y=410]
[button graphic="age_1955.png" target=*age_1955]

;1960
[locate x=730 y=410]
[button graphic="age_1960.png" target=*age_1960]

;1965
[locate x=455 y=460]
[button graphic="age_1965.png" target=*age_1965]

;1970
[locate x=590 y=460]
[button graphic="age_1970.png" target=*age_1970]

;1975
[locate x=730 y=460]
[button graphic="age_1975.png" target=*age_1975]

;1980
[locate x=455 y=510]
[button graphic="age_1980.png" target=*age_1980]

;1985
[locate x=590 y=510]
[button graphic="age_1985.png" target=*age_1985]

;1990
[locate x=730 y=510]
[button graphic="age_1990.png" target=*age_1990]

;1995
[locate x=455 y=560]
[button graphic="age_1995.png" target=*age_1995]

;2000
[locate x=590 y=560]
[button graphic="age_2000.png" target=*age_2000]

;2005
[locate x=730 y=560]
[button graphic="age_2005.png" target=*age_2005]

;2009
[locate x=455 y=620]
[button graphic="age_2009.png" target=*age_2009]

;2010
[locate x=590 y=620]
[button graphic="age_2010.png" target=*age_2010]
[s]

;==============================================================

*age_1935
[if exp="f.age_1935 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1940
[if exp="f.age_1940 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1945
[if exp="f.age_1945 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1950
[if exp="f.age_1950 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1955
[if exp="f.age_1955 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1960
[if exp="f.age_1960 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1965
[if exp="f.age_1965 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1970
[if exp="f.age_1970 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1975
[if exp="f.age_1975 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1980
[if exp="f.age_1980 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1985
[if exp="f.age_1985 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1990
[if exp="f.age_1990 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_1995
[if exp="f.age_1995 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_2000
[if exp="f.age_2000 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_2005
[if exp="f.age_2005 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_2009
[if exp="f.age_2009 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

*age_2010
[if exp="f.age_2010 == 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target="*s05_q2"
[endif]
@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target="*s05_q1"
[s]

;==============================================================


;Question 2: Occupation
*s05_q2
[cm]
[eval exp="f.s05q2 = 1"]
@bg storage ="back_5_sp2.png" time=0
;Back
[locate x=910 y=50]
[button graphic="button/icon_cancel.png" target=*room_05_02]

[edit name="f.question_05_2" left="500" top="400" width="300" height="25" maxchars=25]
[button graphic="title/bt_ok.png" enterimg="title/bt_ok2.png" x="630" y="500" target=*commit_2]
[s]

*commit_2
[commit]
[cm]

[if exp="f.question_05_2 == f.player_shokugyo"]
[eval exp="f.s05q3 = 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target=*s05_q3
[endif]

@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target=*s05_q2
[s]


;Question 3: Name
*s05_q3
[cm]
;Back
[locate x=910 y=50]
[button graphic="button/icon_cancel.png" target=*room_05_02]

@bg storage ="back_5_sp3.png" time=0
[edit name="f.question_05_3" left="500" top="400" width="300" height="25" maxchars=25]
[button graphic="title/bt_ok.png" enterimg="title/bt_ok2.png" x="630" y="500" target=*commit_3]
[s]

*commit_3
[commit]
[cm]

[if exp="f.question_05_3 == f.player_name"]
[eval exp="f.s05q4 = 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target=*s05_q4
[endif]

@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target=*s05_q3
[s]


;Question 4: Password
*s05_q4
[cm]
;Back
[locate x=910 y=50]
[button graphic="button/icon_cancel.png" target=*room_05_02]

@bg storage ="back_5_sp4.png" time=0
[edit name="f.question_05_4" left="500" top="400" width="300" height="25" maxchars=25]
[button graphic="title/bt_ok.png" enterimg="title/bt_ok2.png" x="630" y="500" target=*commit_4]
[s]

*commit_4
[commit]
[cm]

[if exp="f.question_05_4 == f.player_fpassword"]
[eval exp="f.s05q3 = 1"]
@bg storage ="back_5_sp_t.png" time=0
[wait time=3000]
@jump target=*s05_03
[endif]

@bg storage ="back_5_sp_f.png" time=0
[wait time=3000]
@jump target=*s05_q4
[s]

;==============================================================================

*s05_03
[cm]
@layopt layer=message0 visible=true
@bg storage ="back_5.png" time=100

#Megic_00
[playse storage=se_meg.mp3 loop=false]
Good. It looks like your memory has come back.[cm]
[chara_show name="shoko" face="end" time=1 ]
#shoko
[font size=60]
Stop! Don’t go! Give me back![l][cm]
[font size=60]
Let me out! Please![l][cm]
[font size=60]
No! I want to go home![l][cm]
[font size=60]
Me![l][cm]
[font size=70]
Take me outside!![l][cm]
#Megic
[playse storage=se_meg.mp3 loop=false]
……[l][cm]
[playse storage=se_meg.mp3 loop=false]
…………。[l][cm]
[playse storage=se_meg.mp3 loop=false]
[stopbgm]
[stopbgm storage=bgm_04.mp3 loop=false buf=1]
Can I tell you a little about myself?[l]

;Choices
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=150 y=290 storage="select_01.png"
;Sure
[button graphic="select_s05_a1.png" target=*select_s05_a1 x=183 y=380 ]
;I want to go home
[button graphic="select_s05_a2.png" target=*select_s05_a2 x=183 y=445 ]
[s]

*select_s05_a1
[cm]
[freeimage layer=1 time="1"]

#Megic_00
[stopbgm]
[stopbgm storage=bgm_04.mp3 loop=false buf=1]
[playbgm storage=bgm_05.mp3 loop=true buf=1]
[playse storage=se_meg.mp3 loop=false buf=2]
Thank you.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
This space was created for "her."[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
No… it was created for the people who recognize her.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
That’s why she has to be here.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
I was one of the people who recognized her.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
She wanted to get out of here.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
So I helped her—in the end.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Without knowing what it meant.[l]

[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=150 y=290 storage="select_01.png"
;Can she get out of here?
[button graphic="select_s05_b1.png" target=*select_s05_b1 x=183 y=380 ]
;Aren’t you going to leave?
[button graphic="select_s05_b2.png" target=*select_s05_b1 x=183 y=445 ]
[s]

*select_s05_b1
[freeimage layer=1 time="1"]
[cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false buf=2]
I get out of here…?[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
That’s right.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Someone could take her place.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Or…[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
If no one recognizes her anymore, I think she’ll simply disappear along with this place.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Thanks for staying with me this far.[l][cm]
@jump target=s05_04
[s]

*select_s05_a2
[freeimage layer=1 time="1"]
[cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false buf=2]
Yeah, I suppose so.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Sorry for saying something strange.[l][cm]
@jump target=s05_04
[s]

*s05_04
[freeimage layer=1 time="1"]
[cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false buf=2]
All right. Let’s end this.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
There’s nothing more you can do here.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Thank you for coming here.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
It was nice to talk to someone again after so long.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
I can’t say "See you again," though,[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
but I’d be glad if you kept me in a corner of your memory.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Then I’m shutting down.[l][cm]
[chara_hide name="shoko" time=100 ]

@bg storage ="back_5.png" time=0
@layopt layer=message0 visible=false time="1"
[position layer=message1 width=1200 height=900 top=0 left=0 opacity=0 page=fore ]
[current layer="message1"]

@layopt layer=message1 visible=true time="1"
[font size="20"]
[font color=0x00FF00]

;Text
[stopbgm]
[playbgm storage=se_end.mp3 loop=true buf=1]
sh:down.exe[r]
cl0sing... f_i_l_e_s...[r]
unmount /root/memory OK[r]
unmount /usr/dreams OK[r]
signal lost... s1gnal l0st...[r]
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒[r]
..........SYSTEM HALTED[r]
[r]
[r]
initializing credits.log[r]
[r]
PROJECT_TITLE .......... "watashiwo_sotoni_turetette"[r]
[r]
CREATOR ................ OnibiShoten[r]
SCENARIO ............... Aio Nino[r]
PROGRAM ................ Aio Nino[r]
GRAPHICS ............... Aio Nino[r]
BACKGROUND ASSETS ............... Adobe Stock / ぱくたそ[r]
MUSIC ............ 蒲鉾さちこ / Heitaro Ashibe / EN_OKAWA / 鷹尾まさき(タカオマサキ) / 松浦洋介 by DOVA-SYNDROME[r]
SE ............ 効果音ラボ[r]
THEME SONG ............ suishe[r]
[wait time="2000"]
SPECIAL_THANKS ......... 山田垂 / 藤ヶ崎カトリーヌ / てふぬと / 樫衣うい / シスターソニア / プーニ＝アンナ / 兎桜こう / エオル / 今永さらら / 皐月めい / 空鳴ツクシ / 四十五 / サビカケ / 桃乃亥タオ[r]

MESSAGE ................ "Thank you for playing."[r]

end of credits.log[r]
SYSTEM POWER ........... OFFLINE[r]
████████████████████ 100%[r]
..........SHUTDOWN COMPLETE[r]
[wait time=3000]
[cm]
[stopbgm storage=se_end.mp3 loop=false buf=1]
@bg storage ="black.png" time=100
[eval exp="f.end = 1"]

; Issue the [wait] command that says “wait 10 seconds”
[wait time="90000"]
[cm]
[font color=0xffffff]
[font size=15]
Ah, sorry.[r][l]
The “Quit” button hasn’t been implemented.[r][l]
To close the window, click the “×” in the upper-right corner.[r][l]
That’s how you get out.[r][l]
Bye! 👋
[s]
