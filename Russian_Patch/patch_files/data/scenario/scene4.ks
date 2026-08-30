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
……。[l][cm]
…………。[l][cm]
Хочешь выйти наружу?[l][cm]
Да брось, здесь ведь хорошо.[l][cm]
Давай останемся здесь.[l][cm]
Или тебе надоело со мной разговаривать?[l][cm]
……。[l][cm]
…………。[l][cm]
Выйти?[l][cm]
Куда?[l][cm]
Твоё место — здесь.[l][cm]
Проверь профиль в смартфоне.[l][cm]

@layopt layer=message0 visible=false
;スマホ表示
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
Ну? Тебе больше негде быть.[l][cm]
Тебе остаётся только быть здесь.[l][cm]
Я всё это время ждала.[l][cm]
Я ждала, что кто-нибудь придёт сюда ко мне.[l][cm]
В реальном мире мне нет места.[l][cm]
Я всё это время ждала человека, который даст мне место.[l][cm]
Оставайся здесь навсегда.[l][cm]
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
Но…[l][cm]
если ты всё ещё хочешь уйти —[l][cm]
принеси ключ.[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Я всё это время заперта здесь.[l][cm]
Я не могу выйти без ключа.[l][cm]
*s04_02
Если принесёшь его, я смогу выбраться отсюда.[l]

;選択
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=50 y=290 storage="select_01.png"
;いやだ
[button graphic="select_s04_a1.png" target=*select_s04_a1 x=83 y=380 ]
;わかった
[button graphic="select_s04_a2.png" target=*select_s04_a2 x=83 y=445 ]
[s]

*select_s04_a1
[freeimage layer=1 time="1"]
[cm]
#shoko
Вот как.[l][cm]
@jump target=*s04_02
[s]

*select_s04_a2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Спасибо![l][cm]
Кстати, ключа здесь нет.[l][cm]
Ключ ведь запирает дверь с «наружной» стороны![l][cm]
Когда поймёшь, где ключ, скажи мне![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
@jump target=*s04_03
[s]

*s04_03
[cm]
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=50 y=290 storage="select_01.png"
;カギを見つけた
[button graphic="select_s04_b1.png" target=*select_s04_b1 x=83 y=380 ]
;カギの場所がわからない
[button graphic="select_s04_b2.png" target=*select_s04_b2 x=83 y=445 ]
[s]

*select_s04_b2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
Ключа здесь нет.[l][cm]
Если не знаешь, что делать, попробуй оглянуться на всё с самого начала.[l][cm]
Это ведь классическое правило загадок.[l][cm]
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

;ここで入力したものを確定させる
*commit
[commit name="f.kye"]
[cm]
[if exp="f.kye =='replace_with_shoko'"]
@jump target=*s04_04
[endif]

#shoko
[cm]
[freeimage layer=1 time="1"]
Похоже, это не он.[l][cm]
@jump target=*s04_03
[s]

*s04_04
[cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
[freeimage layer=1 time="1"]
[wait time=5000]
[stopbgm storage=bgm_06.mp3 buf=1 ]
#shoko
Спасибо за ключ.[l][cm]
Наконец-то я смогу выйти.[l][cm]
Ну вот, уже пора говорить «доброе утро».[l][cm]
[chara_hide name="shoko"　time=3000]
#
Сёко…[l][cm]
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
Хм-м…[l][cm]
Уже утро?[l][cm]
Утро…?[l][cm]
Кажется, ещё недавно меня здесь не было.[l][cm]
Значит, это был сон.[l][cm]
Кажется, сон был какой-то странный.[l][cm]

*roop
@layopt layer=message0 visible=false

;テレビ
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
