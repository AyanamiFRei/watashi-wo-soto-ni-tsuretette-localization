*start
[freeimage layer=1 time="1"]
[cm]
[wait time=300]
[stopbgm storage=bgm_02.mp3 buf=1 ]
@layopt layer=message0 visible=true
@bg storage ="back_3.png" time=100
[chara_show name="shoko"]
[chara_config ptext="chara_name_area"]
[chara_mod name="shoko" face="kutitozi"  time=1]

#shoko
……[l][cm]
…………[l][cm]
Do you want to go outside?[l][cm]
Come on, it’s nice here.[l][cm]
Let’s stay here.[l][cm]
Or are you tired of talking to me?[l][cm]
……[l][cm]
…………[l][cm]
You want to leave?[l][cm]
Where would you go?[l][cm]
Your place is here.[l][cm]
Check your profile on your phone.[l][cm]

@layopt layer=message0 visible=false
;Display smartphone
[cm]
[locate  x=250 y=645]
[button graphic="s03_smartphone.png" target="*select_s04_sp1"]
[s]

*select_s04_sp1
[call storage="scene4_sp.ks" target="*open"]
[s]

*s04_01
[cm]
[wait time=300]
[current layer="message0"]
@bg storage ="back_2_0.png" time=0
[playbgm storage=bgm_06.mp3 buf=1 ]
[chara_show name="shoko" time=1 ]
[chara_mod name="shoko" face="nomal"  time=1]
@layopt layer=message0 visible=true
#shoko
See? You don’t have anywhere else to belong.[l][cm]
You have no choice but to stay here.[l][cm]
I’ve been waiting all this time.[l][cm]
I was waiting for someone to come here for me.[l][cm]
I have no place in the real world, you know.[l][cm]
I’ve been waiting for someone to give me a place to belong.[l][cm]
Stay here forever.[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
……。[l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
But…[l][cm]
If you still want to leave—[l][cm]
bring me the key.[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
I’ve been trapped in here all this time.[l][cm]
I can’t get out without the key.[l][cm]
*s04_02
If you bring it to me, I can get out of here.[l]

;Choices
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=50 y=290 storage="select_01.png"
;No
[button graphic="select_s04_a1.png" target=*select_s04_a1 x=83 y=380 ]
;All right
[button graphic="select_s04_a2.png" target=*select_s04_a2 x=83 y=445 ]
[s]

*select_s04_a1
[freeimage layer=1 time="1"]
[cm]
#shoko
I see.[l][cm]
@jump target=*s04_02
[s]

*select_s04_a2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Thank you![l][cm]
By the way, the key isn’t here.[l][cm]
Keys lock doors from the "outside," after all![l][cm]
Tell me when you figure out where the key is![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
@jump target=*s04_03
[s]

*s04_03
[cm]
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=50 y=290 storage="select_01.png"
;Found the key
[button graphic="select_s04_b1.png" target=*select_s04_b1 x=83 y=380 ]
;Don’t know where the key is
[button graphic="select_s04_b2.png" target=*select_s04_b2 x=83 y=445 ]
[s]

*select_s04_b2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
The key isn’t here.[l][cm]
When you’re stuck, it’s best to look back from the beginning, don’t you think?[l][cm]
That’s one of the rules of riddles, right?[l][cm]
@jump target=*s04_03
[s]

*select_s04_b1
[cm]
@layopt layer=1 visible=true
[freeimage layer=1 time="1"]
@image layer=1 x=300 y=490 storage="inputbox.png"
[edit name="f.kye" left="530" top="590" width="250" height="30" maxchars=25]
[button graphic="title/bt_okpu.png" enterimg="title/bt_okpu2.png" x=920 y=608 target=*commit]
[s]

;Confirm the input entered here
*commit
[commit name="f.kye"]
[cm]
[if exp="f.kye =='replace_with_shoko'"]
@jump target=*s04_04
[endif]

#shoko
[cm]
[freeimage layer=1 time="1"]
This doesn’t seem to be it.[l][cm]
@jump target=*s04_03
[s]

*s04_04
[cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
[freeimage layer=1 time="1"]
[wait time=5000]
[stopbgm storage=bgm_06.mp3 buf=1 ]
#shoko
Thank you for bringing it.[l][cm]
I can finally get out.[l][cm]
Come on, it’s time to say good morning.[l][cm]
[chara_hide name="shoko"　time=3000]
#
Shoko[l][cm]
@layopt layer=message0 visible=false

*end_real
[cm]
@bg storage ="noise.gif" time=100
[stopbgm]
[playbgm storage=se_noise.mp3 buf=1 ]
[wait time=3000]

[stopbgm storage=se_noise.mp3 buf=1 ]
@bg storage ="black.png" time=100
@bg storage ="back_6.png" time=5000
[stopbgm]
[playbgm storage=se_morning.mp3 buf=1 ]
[wait time=1000]

@layopt layer=message0 visible=true
#
Hmm.[l][cm]
Morning already?[l][cm]
Morning…?[l][cm]
It feels like I was somewhere else just a moment ago.[l][cm]
So it was a dream.[l][cm]
It felt like such a strange dream.[l][cm]

*roop
@layopt layer=message0 visible=false

;TV
[locate x=421 y=85]
[button graphic="s04_tv.png" target=*tv]
[s]

*tv
[cm]
[stopbgm]
[stopbgm storage=se_morning.mp3 buf=1 ]
[playse storage=se_open.mp3 loop=false]
@bg storage ="black.png" time=100
[wait time=1000]
[cm]
[movie storage=ending.mp4 ]
@jump storage="scene0.ks"
[s]
