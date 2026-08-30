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
Где я?[l][cm]
#
Класс?[l][cm]
#
Похоже, меня незаметно сморило.[l][cm]

[chara_config ptext="chara_name_area"]

#secret
Доброе утро.[l][cm]
@bg storage ="still_1.png" time=1000
[stopbgm]
[playbgm storage=bgm_01.mp3 buf=1]

[wait time=300]
#
Обернувшись на голос, передо мной оказалась незнакомая девушка.[l][cm]
#
Раз на ней форма, значит, это всё-таки школа?[l][cm]

#secret
Похоже, сон надолго тебя сморил~.[r]
Хотя и меня.[l]

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
Что?! Ты что, не знаешь моего имени?![l][cm]
#secret
Как жестоко~. Мы ведь одноклассники.[l][cm]
#kaizaki
Я Кайзаки! Сижу рядом с тобой![l][cm]

#
Точно, это Кайзаки. Почему я её не помню?[l][cm]

#kaizaki
Ну и ну… постарайся не забывать меня![l][cm]
@jump target=*common_a

*common_a
[cm]
#kaizaki
Кстати, знаешь, который сейчас час?[l]

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
Ты ведь только что очнулся~.[l][cm]
#kaizaki
Уже восемь вечера! Время ухода из школы давно прошло.[l][cm]

@jump target=*common_b

*select_b2
[freeimage layer=1 time="1"]
[cm]

#kaizaki
Жаль, совсем чуть-чуть~.[l][cm]
#kaizaki
Правильный ответ — восемь. Сейчас 20:00, время ухода уже прошло.[l][cm]

@jump target=*common_b

*common_b
[cm]
#kaizaki
Я тоже хочу домой~.[l][cm]
#kaizaki
Похоже, дверь класса заперли, и я не могу выйти…[l][cm]
#kaizaki
Ну-ка, попробуй открыть дверь?[l][cm]

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
Похоже, дверь заперта снаружи.[l][cm]
@jump target=*common_c

*common_c
[cm]
[chara_show name="kaizaki" face="komari"]
#kaizaki
Вот видишь. Что же нам делать…[l][cm]
Я тоже всё перепробовала, но ничего не вышло.[l][cm]
[chara_mod name="kaizaki" face="kutitozi" time=1 ]
Слушай, ты не выведешь меня наружу?[l]

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
Ура! Спасибо![l][cm]

@jump target=*common_d

*select_d2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="nomal"  time=1]
Да-да! Конечно, помогу![l][cm]

@jump target=*common_d

*common_d
#kaizaki
Тогда начинаем операцию по побегу![l][cm]

;シーン2へ移動
@layopt layer=1 visible=false  time=200
[chara_hide name="kaizaki"  time=1]
@jump storage="scene2.ks"

[s]
