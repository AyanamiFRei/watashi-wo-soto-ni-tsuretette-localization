*start 
[freeimage layer=1 time="1"]
[cm]
[wait time=300]
@layopt layer=message0 visible=false
@bg storage ="back_1.png" time=100
[chara_config ptext="chara_name_area"]

; フラグの初期化
[eval exp="f.checked_desk = 0"]
[eval exp="f.smartphone = 0"]

*room_01
[cm]
@layopt layer=message0 visible=false
@layopt layer=1 visible=true  time=200
@bg storage ="back_1.png" time=0

;時計
[locate x=1039 y=145]
[button graphic="s02_clock.png" target=*s02_clock]

;窓
[locate x=0 y=75]
[button graphic="s02_window.png" target=*s02_window]

;黒板
[locate x=551 y=166]
[button graphic="s02_blackboard.png" target=*s02_blackboard]

;右
[locate x=1150 y=400]
[button graphic="s02_right.png" target=*room_02]

[s]

*room_02
[cm]
@layopt layer=message0 visible=false
@layopt layer=1 visible=true  time=200
@bg storage ="back_2.png" time=0

;ドア
[locate x=206 y=122]
[button graphic="s02_door.png" target=*s02_door]

;掃除ロッカー
[locate x=359 y=157]
[button graphic="s02_locker.png" target=*s02_locker]

;掲示板
[locate x=0 y=106]
[button graphic="s02_board.png" target=*s02_board]

;プレイヤーの席
[locate x=480 y=405]
[button graphic="s02_mydesk.png" target=*s02_mydesk]

;飼崎の席
[locate x=138 y=390]
[button graphic="s02_kaizakidesk.png" target=*s02_kaizakidesk]

;飼崎さん
[locate x=810 y=197]
[button graphic="s02_kaizaki.png" target=*s02_kaizaki]

;左
[locate x=50 y=400]
[button graphic="s02_left.png" target=*room_01]

[s]

;窓
*s02_window
[cm]
@layopt layer=message0 visible=true
#
It's pitch-black outside the window.[l][cm]
The city…[l][cm]
I can see the city I live in.[l][cm]
This should be the third floor. If I jumped, I'd be risking far more than a few injuries.[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;開ける
[button graphic="select_s01_a1.png" target=*select_s01_a1 x=83 y=380 ]
;開けない
[button graphic="select_s01_a2.png" target=*select_s01_a2 x=83 y=445 ]
[s]

;窓を開ける
*select_s01_a1
[freeimage layer=1 time="1"]
[cm]
I opened the window.[l][cm]
A gentle breeze is blowing.[l][cm]
If I shout, someone might come to help.[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;叫ぶ
[button graphic="select_s01_b1.png" target=*select_s01_b1 x=83 y=380 ]
;叫ばない
[button graphic="select_s01_b2.png" target=*select_s01_a2 x=83 y=445 ]
[s]

;叫ぶ
*select_s01_b1
[freeimage layer=1 time="1"]
[cm]
I shouted.[l][cm]
…………。[l][cm]
There was no answer.[l][cm]
@jump target=*room_01
[s]

;開けない/叫ばない
*select_s01_a2
[freeimage layer=1 time="1"]
[cm]
Better not.[l][cm]
@jump target=*room_01
[s]

;黒板
*s02_blackboard
[cm]
@layopt layer=message0 visible=true
#
The blackboard has been wiped clean.[l][cm]
It looks like the date and the student on duty are written here.[l][cm]
“Date: (text corrupted in source)[r]
　Student on duty: [emb exp="f.player_name"]”[l][cm]
……?[l][cm]
@jump target=*room_01
[s]

;時計
*s02_clock
[cm]
@layopt layer=message0 visible=true
#
It's past 8 p.m.[l][cm]
We need to get out of here soon.[l][cm]
@jump target=*room_01
[s]

;掃除ロッカー
*s02_locker
[cm]
@layopt layer=message0 visible=true

[if exp="f.locker == 1]
#
There's nothing of interest here besides the cleaning rag.[l][cm]
@jump target=*room_02

[else]
#
Is there anything useful here?[l][cm]
I found a cleaning rag.[l][cm]
[eval exp="f.dust_cloth = 1"]
[eval exp="f.locker = 1"]
[endif]
@jump target=*room_02
[s]

;ドア
*s02_door
[cm]
@layopt layer=message0 visible=true

[if exp="f.mudakurou == 1]
#
There's no way out through here.[l][cm]
@layopt layer=2 visible=false
@jump target=*room_02

[else]
#
The front door was locked and wouldn't open.[l][cm]
Come to think of it, the back door should have an inside lock.[l][cm]
Let's investigate.[l][cm]
[endif]

The lock is fastened. I'll try opening it.[l][cm]
[playse storage=se_door.mp3 loop=false]
……[l][cm]

; --- 両方持っている場合 ---
[if exp="f.vinegar == 1 && f.dust_cloth == 1"]
Let's try the rag and vinegar.[l][cm]
The rust came off![l][cm]
I'll try turning the key.[l][cm]
The lock opened.[l][cm]
We'll be able to get outside![l][cm]
[playse storage=se_door.mp3 loop=false]
……？[l][cm]
Something seems to be caught on the outside of the door, so I can't open it.[l][cm]
Damn it![l][cm]
All that effort for nothing.[l][cm]
[eval exp="f.mudakurou = 1"]
@jump target=*room_02

; --- お酢だけ ---
[elsif exp="f.vinegar == 1"]
I poured vinegar on the lock.[l][cm]
If only I had something to wipe it with, I might be able to remove the rust.[l][cm]
@jump target=*room_02

; --- 何もなし ---
[else]
It looks rusty; it's not going to open at all.[l][cm]
Is there any way to remove the rust?[l][cm]
@jump target=*room_02
[endif]
[s]

;掲示板
*s02_board
[cm]
@layopt layer=message0 visible=true
#
Notices about school events and an insurance bulletin are posted here.[l][cm]
Looks like our class is putting on a play for the school festival.[l][cm]

;1935
[if exp="f.age_1935 == 1"]
The play seems to be the recently popular film “Holiday in Italy.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1940
[if exp="f.age_1940 == 1"]
The play seems to be the recently popular film “Giant Monster Gobira.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1945
[if exp="f.age_1945 == 1"]
The play seems to be the recently popular film “Sound Is Musical.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1950
[if exp="f.age_1950 == 1"]
The play seems to be the recently popular film “The Monkey Student.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1955
[if exp="f.age_1955 == 1"]
The play seems to be the recently popular film “Expresso.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1960
[if exp="f.age_1960 == 1"]
The play seems to be the recently popular film “George.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1965
[if exp="f.age_1965 == 1"]
The play seems to be the recently popular film “E.T.C.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1970
[if exp="f.age_1970 == 1"]
The play seems to be the recently popular film “Comeback Future.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1975
[if exp="f.age_1975 == 1"]
The play seems to be the recently popular film “Taipanic.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1980
[if exp="f.age_1980 == 1"]
The play seems to be the recently popular film “Yokai Princess.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1985
[if exp="f.age_1985 == 1"]
The play seems to be the recently popular film “The Mysterious Disappearance of Ichi and Ichiro.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1990
[if exp="f.age_1990 == 1"]
The play seems to be the recently popular film “Parry Holter and the Swan Brigade.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1995
[if exp="f.age_1995 == 1"]
The play seems to be the recently popular film “Ohana and the Sea King.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2000
[if exp="f.age_2000 == 1"]
The play seems to be the recently popular film “My Name.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2005
[if exp="f.age_2005 == 1"]
The play seems to be the recently popular film “Secret Blade: Infinite Train Arc.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2009
[if exp="f.age_2009 == 1"]
The play seems to be the recently popular film “The Law of the Land.”[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2010
[if exp="f.age_2010 == 1"]
The play seems to be the film “(title corrupted in source).”[l][cm]
[eval exp="f.festival = 1"]
[endif]

@jump target=*room_02
[s]

;プレイヤーの席
*s02_mydesk
[cm]
@layopt layer=message0 visible=true

[if exp="f.mydesk == 1]
#
There was nothing inside besides the vinegar and smartphone.[l][cm]
@jump target=*room_02

[else]
#
This is the seat where I was sitting.[l][cm]
What did I bring today, again?[l][cm]
I found a smartphone in the drawer.[l][cm]
Looks like there's something else inside.[l][cm]
I found some vinegar.[l][cm]
…Vinegar?[l][cm]
[eval exp="f.vinegar = 1"]
[eval exp="f.smartphone = 1"]
[eval exp="f.mydesk = 1"]
[endif]
@jump target=*room_02
[s]


;飼崎の席
*s02_kaizakidesk
[cm]
@layopt layer=message0 visible=true

; 初回だけ既定値0にする（毎回上書きしない）
[if exp="typeof f.ok_kaizaki === 'undefined'"]
  [eval exp="f.ok_kaizaki = 0"]
[endif]

#
This is the seat where Kaizaki was sitting.[l][cm]

;----- 許可をもらっている -> 調べられる -----
[if exp="f.ok_kaizaki == 1"]
I rummaged through the drawer.[l][cm]
A piece of paper fell out.[l][cm]
Looks like a flyer.[l][cm]
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=400 y=100 storage="poster.png"
Shoko…?[l][cm]
There's something written on the back too.[l][cm]
“• Try an exaggerated self-introduction[r]
• Self-introduction RTA[l][cm]
• Give my self-introduction through random back-translation ← chosen”[r]
• Self-introduction (all lies)”[l][cm]
What is this supposed to be?[l][cm]
Maybe I should ask Kaizaki.[l][cm]
[freeimage layer=1 time="1"]
[eval exp="f.paper_kaizaki = 1"]
@jump target=*room_02
[s]

;----- 許可なし -> 注意文を出して許可待ちフラグを立てる -----
[else]
…I shouldn't rummage through it without permission.[l][cm]
[eval exp="f.checked_desk = 1"]
[endif]
@jump target=*room_02
[s]


;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;飼崎さん
*s02_kaizaki
[cm]
@layopt layer=message0 visible=true
[chara_show name="kaizaki" face="kutitozi" time=200]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
#kaizaki
What is it? Did you find something?[l][cm]

@layopt layer=message0 visible=false
@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=30 y=100 storage="select_02.png"

;飼崎さんの席
[if exp="f.checked_desk == 1"]
@image layer=1 x=750 y=560 storage="select_03.png"
[button graphic="select_s02_c5.png" target=*select_s02_c5 x=783 y=645 ]
[endif]

;文化祭
[if exp="f.festival == 1"]
@image layer=1 x=750 y=560 storage="select_03.png"
[button graphic="select_s02_c6.png" target=*select_s02_c6 x=783 y=705 ]
[endif]

;お酢
[if exp="f.vinegar == 1"]
[locate x=1000 y=250]
@image layer=1 x=750 y=560 storage="select_03.png"
[button graphic="select_s02_c7.png" target=*select_s02_c7 x=783 y=765 ]
[endif]

;チラシ
[if exp="f.paper_kaizaki == 1"]
@image layer=1 x=750 y=560 storage="select_03.png"
[button graphic="select_s02_c8.png" target=*select_s02_c8 x=783 y=825 ]
[endif]

;なんでもない
[button graphic="select_s02_c1.png" target=*select_s02_c1 x=63 y=185 ]
;どうしてここにいるの？
[button graphic="select_s02_c2.png" target=*select_s02_c2 x=63 y=255 ]
;君のこと
[button graphic="select_s02_c4.png" target=*select_s02_c4 x=63 y=325 ]

[s]


*select_s02_c1
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
#kaizaki
I see.[l][cm]
[chara_hide name="kaizaki" time=1]
@jump target=*room_02
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;どうしてここにいるの？
*select_s02_c2
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
#kaizaki
Why was I locked in here…?[l][cm]
Well…[l][cm]
When I came to, I was asleep in the classroom.[l][cm]
Sixth period was P.E. today, right?[l][cm]
I got tired, so I secretly slept through homeroom.[l][cm]
Then I woke up and it was already this late.[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
So unfair! Someone could've woken me up.[l]

;選択肢
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;災難だったね
[button graphic="select_s02_c2_1.png" target=*select_s02_c2_1 x=83 y=380 ]
;友達いないの？
[button graphic="select_s02_c2_2.png" target=*select_s02_c2_2 x=83 y=445 ]
[s]

*select_s02_c2_1
[freeimage layer=1 time="1"]
[cm]
#kaizaki
What a disaster~.[l][cm]
No one cares about me anyway.[l][cm]
……。[l][cm]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
I shouldn't have told you that…[l][cm]
@jump target=*s02_kaizaki
[s]

*select_s02_c2_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
How rude! Of course I have friends![l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
…I really do, okay?[l][cm]
You weren't woken up either, were you?[l][cm]
@jump target=*s02_kaizaki
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;君のこと
*select_s02_c4

[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
#kaizaki
[chara_mod name="kaizaki" face="komari"  time=1]
I'm getting kind of tired. I wonder if I'll make it home today?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Hey, why are you here?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;わからない
[button graphic="select_s02_c4_1.png" target=*select_s02_c4_1 x=83 y=380 ]
;思い出せない
[button graphic="select_s02_c4_1_1.png" target=*select_s02_c4_1 x=83 y=445 ]
[s]


*select_s02_c4_1
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="komari"  time=1]
…Huh? Are you all right?[l][cm]
At the very least, you're a student in this class, right?[l][cm]
Right?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;……
[button graphic="select_s02_c4_2.png" target=*select_s02_c4_2 x=83 y=380 ]
;そうだ
[button graphic="select_s02_c4_3.png" target=*select_s02_c4_3 x=83 y=445 ]
[s]

*select_s02_c4_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="kutitozi"  time=1]
……。[l][cm]
@jump target=*select_s02_c4_1
[s]

*select_s02_c4_3
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="nomal"  time=1]
Right?[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
I wonder why.[l][cm]
Maybe P.E. tired you out too?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Well! It'll be all right once we get out of here![l][cm]
[chara_mod name="kaizaki" face="doya"  time=1]
Forget the past and keep moving forward![l][cm]
@jump target=*s02_kaizaki
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;飼崎さんの席
*select_s02_c5
[freeimage layer=1 time="1"]
[cm]

@layopt layer=message0 visible=true
[if exp="f.mudakurou == 1]
#kaizaki
You couldn't open the door?[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Oh well.[l][cm]
I don't usually like anyone looking through my desk,[r]
but this is an emergency.[l][cm]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
You can search my desk.[l][cm]
[eval exp="f.ok_kaizaki = 1"]
@jump target=*s02_kaizaki
[s]

[else]
My seat?[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Um… I don't really like people looking through it.[l][cm]
Search the whole classroom first. If that doesn't turn anything up, you can look.[l][cm]
[endif]
@jump target=*s02_kaizaki
[s]

[eval exp="f.paper_kaizaki = 1"]
@jump target=*room_02
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;文化祭
*select_s02_c6
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
#kaizaki
Looks like this year's school festival is putting on a play.[l][cm]

;1935
[if exp="f.age_1935 == 1"]
The production is “Holiday in Italy,” right?[l][cm]
Do you know the movie “Holiday in Italy”?[l]
[endif]

;1940
[if exp="f.age_1940 == 1"]
The production is “Giant Monster Gobira,” right?[l][cm]
Do you know the movie “Giant Monster Gobira”?[l]
[endif]

;1945
[if exp="f.age_1945 == 1"]
The production is “Sound Is Musical,” right?[l][cm]
Do you know the movie “Sound Is Musical”?[l]
[endif]

;1950
[if exp="f.age_1950 == 1"]
The production is “The Monkey Student,” right?[l][cm]
Do you know the movie “The Monkey Student”?[l]
[endif]

;1955
[if exp="f.age_1955 == 1"]
The production is “Expresso,” right?[l][cm]
Do you know the movie “Expresso”?[l]
[endif]

;1960
[if exp="f.age_1960 == 1"]
The production is “George,” right?[l][cm]
Do you know the movie “George”?[l]
[endif]

;1965
[if exp="f.age_1965 == 1"]
The production is “E.T.C,” right?[l][cm]
Do you know the movie “E.T.C”?[l]
[endif]

;1970
[if exp="f.age_1970 == 1"]
The production is “Comeback Future,” right?[l][cm]
Do you know the movie “Comeback Future”?[l]
[endif]

;1975
[if exp="f.age_1975 == 1"]
The production is “Taipanic,” right?[l][cm]
Do you know the movie “Taipanic”?[l]
[endif]

;1980
[if exp="f.age_1980 == 1"]
The production is “Yokai Princess,” right?[l][cm]
Do you know the movie “Yokai Princess”?[l]
[endif]

;1985
[if exp="f.age_1985 == 1"]
The production is “The Mysterious Disappearance of Ichi and Ichiro,” right?[l][cm]
Do you know the movie “The Mysterious Disappearance of Ichi and Ichiro”?[l]
[endif]

;1990
[if exp="f.age_1990 == 1"]
The production is “Parry Holter and the Swan Brigade,” right?[l][cm]
Do you know the movie “Parry Holter and the Swan Brigade”?[l]
[endif]

;1995
[if exp="f.age_1995 == 1"]
The production is “Ohana and the Sea King,” right?[l][cm]
Do you know the movie “Ohana and the Sea King”?[l]
[endif]

;2000
[if exp="f.age_2000 == 1"]
The production is “My Name,” right?[l][cm]
Do you know the movie “My Name”?[l]
[endif]

;2005
[if exp="f.age_2005 == 1"]
The production is “Secret Blade: Infinite Train Arc,” right?[l][cm]
Do you know the movie “Secret Blade: Infinite Train Arc”?[l]
[endif]

;2009
[if exp="f.age_2009 == 1"]
The production is “The Law of the Land,” right?[l][cm]
Do you know the movie “The Law of the Land”?[l]
[endif]

;2010
[if exp="f.age_2010 == 1"]
The production is “(title corrupted in source),” right?[l][cm]
Do you know the movie “(title corrupted in source)”?[l]
[endif]

@jump target=*select_s02_c6_0
[s]

*select_s02_c6_0
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=340 storage="select_01.png"
;知っている
[button graphic="select_s02_c6_1.png" target=*select_s02_c6_1 x=83 y=430 ]
;知らない
[button graphic="select_s02_c6_2.png" target=*select_s02_c6_2 x=83 y=495 ]
[s]

;知っている
*select_s02_c6_1
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="nomal"  time=1]
It was popular recently, wasn't it~?[l][cm]
@jump target=*select_s02_c6_common
[s]

;知らない
*select_s02_c6_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="komari"  time=1]
What?! You don't know it?! Everyone was talking about it recently![l][cm]
@jump target=*select_s02_c6_common
[s]

*select_s02_c6_common
[chara_mod name="kaizaki" face="nomal"  time=1]
Do you like plays?[l][cm]
I love both watching them and performing in them~![l][cm]
But I'm usually the quiet type who keeps to the corner of the classroom,
so I feel awkward pushing myself forward only on occasions like this…[l][cm]
I really want to play the lead,[l][cm]
but I'd be happy even with a small part~.[l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
……。[l][cm]
…………。[l][cm]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Hey.[l][cm]
Have you ever[l][cm]
felt like you were the protagonist?[l][cm]
……。[l][cm]

@jump target=*s02_kaizaki
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;お酢
*select_s02_c7
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
#kaizaki
[chara_mod name="kaizaki" face="nomal"  time=1]
Vinegar?[l][cm]
Oh, that vinegar.[l][cm]
I thought I'd lost it, but it was in your seat.[l][cm]
I keep it handy in case it comes in useful~.[l][cm]
Vinegar is a classic in escape games, right?[l][cm]
[chara_mod name="kaizaki" face="doya"  time=1]
Feel free to use it. Consider it a gift![l][cm]
@jump target=*s02_kaizaki
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;チラシ
*select_s02_c8
[freeimage layer=1 time="1"]
[cm]

@layopt layer=message0 visible=true
#kaizaki
Flyer?[l][cm]
[chara_mod name="kaizaki" face="komarihazi"  time=1]
What?! You saw that flyer?![l][cm]
No, um, hehe~ How should I put this…[l][cm]
It's nothing special, really? Ahaha~.[l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
……。[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Um…[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
I'm kind of an otaku—I like games and anime.[l][cm]
And lately I've gotten really into Vtubers.[l][cm]
You know what Vtubers are?[l]

;選択肢
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;知らない
[button graphic="select_s02_c3_1.png" target=*select_s02_c3_1 x=83 y=380 ]
;知っている
[button graphic="select_s02_c3_2.png" target=*select_s02_c3_2 x=83 y=445 ]
[s]

;知らない
*select_s02_c3_1
[freeimage layer=1 time="1"]
[cm]
#kaizaki
Vtuber is short for “Virtual YouTuber,”[l][cm]
the term for streamers and video creators who perform as virtual characters.[l][cm]
[chara_mod name="kaizaki" face="doya"  time=1]
They seem like real characters, and that's what makes them so interesting![l][cm]
Look them up if you like![l][cm]
@jump target=*s02_kaizaki
[s]

;知っている
*select_s02_c3_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
Oh! Do you happen to like them?[l]

;選択肢
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;好き
[button graphic="select_s02_c3_3.png" target=*select_s02_c3_3 x=83 y=380 ]
;そうでもない
[button graphic="select_s02_c3_4.png" target=*select_s02_c3_4 x=83 y=445 ]
[s]

;好き
*select_s02_c3_3
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="doya"  time=1]
Seriously?! I'm so happy![l][cm]
Who's your favorite?[l]

@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=300 y=490 storage="inputbox.png"
[edit name="f.vtubername" left="530" top="590" width="250" height="30" maxchars=25]
[button graphic="title/bt_okpu.png" enterimg="title/bt_okpu2.png" x=920 y=608 target=*commit]
[s]

;ここで入力したものを確定させる
*commit
[commit name="f.vtubername"]
[freeimage layer="1" time="1"]
[cm]

[if exp="f.vtubername =='怪崎' || f.vtubername =='Shoko'"]
#kaizaki
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Shoko…?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
You know her![l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
Whew, that's a relief.[l][cm]
[chara_hide name="kaizaki" time=1]
@layopt layer=message0 visible=false
@bg storage ="noise.gif" time=100
[stopbgm]
[playbgm storage=se_noise.mp3 buf=1 ]
[wait time=1000]
[stopbgm storage=se_noise.mp3 buf=1 ]

;キャラクター怪崎ショウ子を登場
[chara_show name="shoko" time=1]
@bg storage ="back_2_0.png" time=100
@layopt layer=message0 visible=true
#shoko
I know her too.[l][cm]
[chara_hide name="shoko"]
[chara_mod name="shoko" face="nomal"  time=1]
@jump storage="scene3.ks" target=*start
[endif]


;===

[if exp="f.vtubername =='怪崎ショウ子' || f.vtubername =='Kaizaki Shoko'"]
#kaizaki
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Shoko…?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
You know her![l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
Whew, that's a relief.[l][cm]

[chara_hide name="kaizaki" time=1]
@layopt layer=message0 visible=false
@bg storage ="noise.gif" time=100
[stopbgm]
[playbgm storage=se_noise.mp3 buf=1 ]
[wait time=1000]
[stopbgm storage=se_noise.mp3 buf=1 ]

;キャラクター怪崎ショウ子を登場
[chara_show name="shoko" time=1]
@bg storage ="back_2_0.png" time=100
@layopt layer=message0 visible=true
#shoko
I know her too.[l][cm]
[chara_hide name="shoko"]
[chara_mod name="shoko" face="nomal"  time=1]
@jump storage="scene3.ks" target=*start
[endif]

;===


[if exp="f.vtubername =='山田垂'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='藤ヶ崎カトリーヌ'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='てふぬと'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='樫衣うい'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='シスターソニア'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='プーニ＝アンナ'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='兎桜こう'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='エオル'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='今永さらら'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='皐月めい'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='空鳴ツクシ'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='四十五'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='サビカケ'"]
@jump target=*gest_vtuber
[endif]

[if exp="f.vtubername =='桃乃亥タオ'"]
@jump target=*gest_vtuber
[endif]

;その他
#kaizaki
Oh! I don't think I've watched her much~.[l][cm]
That's it! Let's have a proper chat about it sometime![l][cm]
Not many people around me like Vtubers, so I hardly ever get the chance to talk about them.[l][cm]
Promise?[l][cm]
@jump target=*s02_kaizaki
[s]

;そうでもない
*select_s02_c3_4
[freeimage layer=1 time="1"]
[cm]
#kaizaki
……？[l][cm]
@jump target=*select_s02_c3_2
[s]

;スペシャルサンクス
*gest_vtuber
[freeimage layer=1 time="1"]
[cm]
#kaizaki
……。[l][cm]
[chara_mod name="kaizaki" face="komarihazi"  time=1]
I-I don't know that Vtuber~![l][cm]
I'll look them up too! I promise![l][cm]
@jump target=*s02_kaizaki
[s]
