*start 
[freeimage layer=1 time="1"]
[cm]
[wait time=300]
@layopt layer=message0 visible=false
@layopt layer=1 visible=false
@bg storage ="back_3.png" time=0
[stopbgm]
[playbgm storage=se_noise.mp3 buf=1]
[chara_config ptext="chara_name_area"]

*room_00
@layopt layer=message0 visible=false
[cm]
;チラシ
[locate x=1000 y=480]
[button graphic="s03_poster.png" target=*paper_kaizaki]

;怪崎さん
[locate x=804 y=197]
[button graphic="s02_shoko.png" target=*s03_kaizaki]

[s]

*paper_kaizaki
[cm]
@layopt layer=message0 visible=true
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=400 y=100 storage="poster.png"
#
It looks like a promotional flyer for VTuber “Shoko.”[l][cm]
There’s something written on the back, too.[l][cm]
“• Tried exaggerating my self-introduction[r]
• Self-introduction RTA[l][cm]
• Tried introducing myself through random back-translation ← selected[r]
• Self-introduction (all lies)”[l][cm]
[freeimage layer=1 time="1"]
@jump target=*room_00
[s]

;==================================================

*s03_kaizaki
[cm]
[chara_show name="shoko" face="kutitozi" time=200 ]

;第1問から
[cm]
[if exp="f.q1 == 1"]
[chara_show name="shoko"]
@layopt layer=message0 visible=true
@jump target=*q1
[endif]

;第2問から
[cm]
[if exp="f.q2 == 1"]
[chara_show name="shoko"]
@layopt layer=message0 visible=true
@jump target=*select_s03_a2
[endif]

;第3問から
[cm]
[if exp="f.q3 == 1"]
[chara_show name="shoko"]
@layopt layer=message0 visible=true
@jump target=*select_s03_a3
[endif]

;はじめから
[cm]
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true time="100"
@image layer=1 x=50 y=190 storage="select_01.png"
[button graphic="select_s03_a1.png" target=*select_s03_a1 x=83 y=270 ]
[s]

*select_s03_a1
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Ah, Shoko~.[l][cm]
Oh, right! Since you’re here, let’s have a quiz![l][cm]

*q1
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="doya"  time=1]
Question one! How does Shoko greet people?[l]

@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=300 y=490 storage="inputbox.png"
[edit name="f.question1" left="530" top="590" width="250" height="30" maxchars=25]
[button graphic="title/bt_okpu.png" enterimg="title/bt_okpu2.png" x=920 y=608 target=*commit_1]
[s]

;ここで入力したものを確定させる
*commit_1
[freeimage layer=1 time="1"]
[commit name="f.question1"]
[cm]

[if exp="f.question1 =='Ohashoko gozaimasu' || f.question1 =='ohashoko gozaimasu' || f.question1 =='おはしょうこざいます'"]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]

I see. Makes sense.[l][cm]
Then, next question.[l][cm]
@jump target=*select_s03_a2
[endif]

#shoko
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Hmm… Looks like that’s not it?[l][cm]
[eval exp="f.q1 = 1"]
[chara_hide name="shoko" time=200 ]
@jump target=*room_00
[s]


*select_s03_a2
@layopt layer=message0 visible=true
[eval exp="f.q1 = 0"]
[chara_mod name="shoko" face="doya"  time=1]
Question two! What’s Shoko’s defining feature?[l]

@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=300 y=490 storage="inputbox.png"
[edit name="f.question2" left="530" top="590" width="250" height="30" maxchars=25]
[button graphic="title/bt_okpu.png" enterimg="title/bt_okpu2.png" x=920 y=608 target=*commit_2]
[s]

;ここで入力したものを確定させる
*commit_2
[commit name="f.question2"]
[freeimage layer=1 time="1"]
[cm]

[if exp="f.question2 =='Unclouded left eye' || f.question2 =='unclouded left eye' || f.question2 =='曇りなき左目'"]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
Oh! You really know her![l][cm]
Last question![l][cm]
@jump target=*select_s03_a3
[endif]

[cm]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
Looks like that’s incorrect~.[l][cm]
[eval exp="f.q2 = 1"]
[chara_hide name="shoko" time=200 ]
@jump target=*room_00
[s]


*select_s03_a3
@layopt layer=message0 visible=true
[eval exp="f.q2 = 0"]
[chara_mod name="shoko" face="doya"  time=1]
Question three! How is Shoko feeling right now?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=300 y=490 storage="inputbox.png"
[edit name="f.question3" left="530" top="590" width="250" height="30" maxchars=25]
[button graphic="title/bt_okpu.png" enterimg="title/bt_okpu2.png" x=920 y=608 target=*commit_3]
[s]

;ここで入力したものを確定させる
*commit_3
[commit name="f.question3"]
[freeimage layer=1 time="1"]
[cm]

[if exp="f.question3 =='fun' || f.question3 =='Fun' || f.question3 =='たのしい'"]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
You really know your stuff, huh?[l][cm]
I thought no one would ever get this one right…[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Did you look it up online?![l][cm]
……。[l][cm]
…………。[l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
I mean, even if you did look it up, it doesn’t bother me at all… really![l][cm]
Ha-ha, oh well~.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
！[l][cm]
Hey, wait—are you connected to the internet?![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Then maybe we can call for help from outside![l]
@jump target=*select_s03_b1
[endif]

#shoko
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Go take another look.[l][cm]
[eval exp="f.q3 = 1"]
[chara_hide name="shoko" time=200]
@jump target=*room_00
[s]

;==================================================

*select_s03_b1
#
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;自分でやったら？
[button graphic="select_s03_e1.png" target=*select_s03_e1 x=83 y=380 ]
;試してみよう
[button graphic="select_s03_e2.png" target=*select_s03_e2 x=83 y=445 ]
[s]

*select_s03_e1
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="komari"  time=1]
My phone can’t get through to the outside world anymore,[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
I thought it was a service outage, but it’s great that your connection works~.[l][cm]
@jump target=s03_02
[s]

*select_s03_e2
[freeimage layer=1 time="1"]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
[cm]
Yeah! Let’s try it![l][cm]
@jump target=s03_02
[s]

*s03_02
#shoko
Try contacting my friend through X![l][cm]
Search for “Megic_00”—the account should come up,[r]
and if we ask for help, we might be able to get out of here![l][cm]
My DMs aren’t open to everyone, but try sending a direct message![l][cm]
@jump target=s03_03
[s]

;探索
*s03_03
[current layer="message0"]
[stopbgm]
[playbgm storage=bgm_02.mp3 buf=1 wait=20000 ]
[cm]
[chara_hide name="shoko" time=200]
[wait time=100]
[freeimage layer=1 time="1"]
@layopt layer=message0 visible=false
@bg storage ="back_3.png" time=0

[cm]
;チラシ
[locate x=1000 y=480]
[button graphic="s03_poster.png" target=*paper_2_kaizaki]

;怪崎さん
[locate x=804 y=197]
[button graphic="s02_shoko.png" target=*s03_2_kaizaki]

;スマホ所持
[locate  x=250 y=645]
[button graphic="s03_smartphone.png" target="*sp_op02"]

[s]

;スマホ開ける
*sp_op02
[call storage="scene3_sp.ks" target="*open"]
[s]

;チラシ2回目
*paper_2_kaizaki
[cm]
@layopt layer=message0 visible=true
#
It looks like a promotional flyer for VTuber “Shoko.”[l][cm]
There’s something written on the back, too.[l][cm]
“• Tried exaggerating my self-introduction[r]
• Self-introduction RTA[l][cm]
• Tried introducing myself through random back-translation ← selected[r]
• Self-introduction (all lies)”[l][cm]
@jump target=*s03_03
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;怪崎さん
*s03_2_kaizaki
[cm]
@layopt layer=message0 visible=true
[chara_show name="shoko" time=200 ]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
Were you able to get in touch?[l]

#
@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;したよ
[button graphic="select_s03_c1.png" target=*select_s03_c1 x=83 y=380 ]
;していない
[button graphic="select_s03_c2.png" target=*select_s03_c2 x=83 y=445 ]
[s]

*select_s03_c1
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
Thanks~.[l][cm]
Then let’s talk until we can get out.[l][cm]
[eval exp="f.contact_ok = 1"]
@jump target=*s03_3_kaizaki
[s]

*select_s03_c2
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
Couldn’t find the account?[l][cm]
It’s “Megic_00.”[l][cm]
@jump target=*s03_03
[s]

;会話
*s03_3_kaizaki
[cm]
@layopt layer=message0 visible=false
[freeimage layer=1 time="1"]
[chara_mod name="shoko" face="kutitozi"  time=1]

[if exp="f.Megic_ok == 1"]
;スマホ
@image layer=1 x=30 y=100 storage="select_02.png"
[button graphic="s03_smartphone.png" target=*sp_op02 x=250 y=645 ]
[endif]

@image layer=1 x=30 y=100 storage="select_02.png"
;ゲーム
[button graphic="select_s03_d1.png" target=*select_s03_d1 x=63 y=185 ]
;音楽
[button graphic="select_s03_d2.png" target=*select_s03_d2 x=63 y=255 ]
;TRPG
[button graphic="select_s03_d3.png" target=*select_s03_d3 x=63 y=325 ]

@image layer=1 x=750 y=560 storage="select_02.png"
;インターネット
[button graphic="select_s03_d4.png" target=*select_s03_d4 x=783 y=645 ]
;自分
[button graphic="select_s03_d5.png" target=*select_s03_d5 x=783 y=715 ]
;友達
[button graphic="select_s03_d6.png" target=*select_s03_d6 x=783 y=780 ]
[s]


;ゲーム
*select_s03_d1
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
I play games a lot, actually~.[l][cm]
I don’t really play console games,[l][cm]
mostly indie games on my computer.[l][cm]
I used to play a lot of freeware, but once I started high school, I began playing paid games too.[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
I said I don’t play console games, but what’s the difference between PC games and console games, anyway?[l][cm]
Could PC games be classified as console games too?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=30 y=100 storage="select_02.png"
;同じだ
[button graphic="select_s03_d1_1.png" target=*select_s03_d1_1 x=63 y=185 ]
;同じじゃない
[button graphic="select_s03_d1_2.png" target=*select_s03_d1_2 x=63 y=255 ]
;コンシューマーゲームって何？
[button graphic="select_s03_d1_3.png" target=*select_s03_d1_3 x=63 y=325 ]
[s]

;同じだ
*select_s03_d1_1
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
Maybe they are the same?[l][cm]
Yeah, I guess you can play games made by independent developers on home consoles these days.[l][cm]
This kind of genre classification is hard for me.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;同じじゃない
*select_s03_d1_2
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
You think they’re different?[l][cm]
I get the impression that companies make console games, so I guess independent games don’t count?[l][cm]
I wish someone knowledgeable would explain it~.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;コンシューマーゲームって何？
*select_s03_d1_3
[freeimage layer=1 time="1"]
[cm]
#shoko
Console games are games played on home consoles.[l][cm]
Games played on smartphones are called social games,[l][cm]
and games you play at arcades are called arcade games.[l][cm]
[chara_mod name="shoko" face="komari"  time=1]
If you don’t even know what console games are, this probably isn’t a great topic…[l][cm]
@jump target=*s03_3_kaizaki
[s]


;音楽
*select_s03_d2
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Do you listen to music?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;聴く
[button graphic="select_s03_d2_1.png" target=*select_s03_d2_1 x=83 y=380 ]
;聴かない
[button graphic="select_s03_d2_2.png" target=*select_s03_d2_2 x=83 y=445 ]
[s]

;聴く
*select_s03_d2_1
[cm]
[freeimage layer=1 time="1"]
#shoko
[chara_mod name="shoko" face="doya"  time=1]
Nice~.[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
I listen to music on my way to school, too.[l][cm]
Lately I’ve been interested in alternative rock.[l][cm]
I hear it’s defined as “rock with an underground spirit,”[l][cm]
but these days the definition seems pretty vague.[l][cm]
Apparently alternative rock covers a pretty wide range, even under one name.[l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
Music is complicated.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;聞かない
*select_s03_d2_2
[cm]
[freeimage layer=1 time="1"]
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
You don’t listen?![l][cm]
Don’t you get bored on your way to school?[l]

[freeimage layer=1 time="1"]
@image layer=1 x=50 y=290 storage="select_01.png"
;暇だ
[button graphic="select_s03_d2_2_1.png" target=*select_s03_d2_2_1 x=83 y=380 ]
;暇じゃない
[button graphic="select_s03_d2_2_2.png" target=*select_s03_d2_2_2 x=83 y=445 ]
[s]

;暇だ
*select_s03_d2_2_1
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
Then why not give music a try?[l][cm]
I’d recommend something, but I’m not exactly an expert myself~.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
I wonder if there’s anything on my phone.[l]
[wait time=1000]
[stopbgm storage=se_noise.mp3 buf=1]
[stopbgm]
[playbgm storage=olt_1.mp3 loop=false]
[wait time=3200]
[cm]
[chara_mod name="shoko" face="komari"  time=1]
Oh, crap![l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
…You didn’t hear anything, did you?[l][cm]
[stopbgm]
[playbgm storage=bgm_02.mp3 buf=1]
@jump target=*s03_3_kaizaki
[s]

;暇じゃない
*select_s03_d2_2_2
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
Are you keeping yourself entertained some other way?[l][cm]
There are all sorts of things you can do on a train~.[l][cm]
Play games, check social media…[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Are you studying?![l][cm]

[freeimage layer=1 time="1"]
@image layer=1 x=30 y=100 storage="select_02.png"
;してるよ
[button graphic="select_s03_d2_3_1.png" target=*select_s03_d2_3_1 x=63 y=185 ]
;してない
[button graphic="select_s03_d2_3_2.png" target=*select_s03_d2_3_2 x=63 y=255 ]
;電車通学じゃない
[button graphic="select_s03_d2_3_3.png" target=*select_s03_d2_3_3 x=63 y=325 ]
[s]

;してるよ
*select_s03_d2_3_1
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="komari"  time=1]
W-wow, you’re incredibly diligent![l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
You’re such a model student![l][cm]
@jump target=*s03_3_kaizaki
[s]

;していない
*select_s03_d2_3_2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
#shoko
Exactly~.[l][cm]
[chara_mod name="shoko" face="komari"  time=1]
I mean, you’ve got to study later anyway—why would you want to study on the train too?![l][cm]
@jump target=*s03_3_kaizaki
[s]

;電車通学じゃない
*select_s03_d2_3_3
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
……？[l][cm]
You’re a commuter by train, aren’t you?[l][cm]
@jump target=*s03_3_kaizaki
[s]

;TRPG
*select_s03_d3
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Do you know what TRPGs are?[l]

@image layer=1 x=50 y=290 storage="select_01.png"
;知ってる
[button graphic="select_s03_d3_1.png" target=*select_s03_d3_1 x=83 y=380 ]
;知らない
[button graphic="select_s03_d3_2.png" target=*select_s03_d3_2 x=83 y=445 ]
[s]

;知ってる
*select_s03_d3_1
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="doya"  time=1]
#shoko
Oh! You know what they are?![l][cm]
I love Call of Cthulhu, and I play Emoklore and Bigami too~.[l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
I even have a whole stack of unread rulebooks…[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Do your friends happen to like TRPGs too?[l][cm]
We usually play online, but I’d love to try it in person![l][cm]
I hope we get to someday~![l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
Ah! I got a little carried away![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Hehe, sorry.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;知らない
*select_s03_d3_2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
TRPGs are a type of analog game—a non-digital game,[l][cm]
Put simply, players act as their characters and talk in character,[l][cm]
roll dice like in a board game, and work together to advance the story.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Of course, the details vary from game to game,[l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
but the biggest feature is that you don’t use a computer to resolve the rules.[l][cm]
[chara_mod name="shoko" face="komari"  time=1]
…You don’t look very interested.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;インターネット
*select_s03_d4
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
What do you like about the internet?[l]

@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=300 y=490 storage="inputbox.png"
[edit name="f.search" left="530" top="590" width="250" height="30" maxchars=25]
[button graphic="title/bt_okpu.png" enterimg="title/bt_okpu2.png" x=920 y=608 target=*commit]
[s]

;ここで入力したものを確定させる

*commit
[commit name="f.search"]
[freeimage layer=1 time="1"]
[cm]
[if exp="f.search =='Take Me Outside' || f.search =='take me outside' || f.search =='そとにつれてって'"]
@jump storage="scene4.ks" target=*start
[endif]

[if exp="f.search ==('Let'+String.fromCharCode(39)+'s go outside together') || f.search =='いっしょにそとにでよう'"]
@jump storage="scene5.ks" target=*start
[endif]

[cm]
[chara_mod name="shoko" face="doya"  time=1]
#shoko
The internet is a funny thing![l][cm]
[freeimage layer=1 time="1"]
@jump target=*s03_3_kaizaki
[s]

;自分
*select_s03_d5
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="metozihohoemi"  time=1]
#shoko
Here’s a sudden announcement: Earth is going to end today![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
But don’t worry.[l][cm]
If you press this button, in three minutes, a second you will be born on Mars[l][cm]
—with your body, memories, and personality copied perfectly—and you’ll survive![l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
If you don’t press it, you’ll die here along with Earth.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
…If someone told you that, would you press the button?[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
If you imagine the button has been pressed, would you still consider yourself alive?[l][cm]
@jump target=*s03_3_kaizaki
[s]

;友達
*select_s03_d6
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
You mean “Megic_00”?[l][cm]
We’re just friends.[l][cm]
@jump target=*s03_3_kaizaki
[s]
