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
За окном кромешная тьма.[l][cm]
Город…[l][cm]
Я вижу город, в котором живу.[l][cm]
Мы на третьем этаже. Прыжок отсюда закончится гораздо хуже, чем просто ушибами.[l]

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
Мне удалось открыть окно.[l][cm]
Дует лёгкий ветерок.[l][cm]
Если крикнуть, может быть, кто-нибудь придёт на помощь.[l]

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
Раздался мой крик.[l][cm]
…………。[l][cm]
Ответа нет.[l][cm]
@jump target=*room_01
[s]

;開けない/叫ばない
*select_s01_a2
[freeimage layer=1 time="1"]
[cm]
Ладно, лучше отказаться.[l][cm]
@jump target=*room_01
[s]

;黒板
*s02_blackboard
[cm]
@layopt layer=message0 visible=true
#
Доска чисто вытерта.[l][cm]
Похоже, здесь записаны дата и дежурный.[l][cm]
«Дата: 〈текст повреждён в исходнике〉[r]
　Дежурный: [emb exp="f.player_name"]»[l][cm]
……？[l][cm]
@jump target=*room_01
[s]

;時計
*s02_clock
[cm]
@layopt layer=message0 visible=true
#
Сейчас уже за 20:00.[l][cm]
Нужно скорее отсюда выбраться.[l][cm]
@jump target=*room_01
[s]

;掃除ロッカー
*s02_locker
[cm]
@layopt layer=message0 visible=true

[if exp="f.locker == 1]
#
Кроме тряпки, здесь ничего интересного нет.[l][cm]
@jump target=*room_02

[else]
#
Есть ли здесь что-нибудь полезное?[l][cm]
Получена тряпка.[l][cm]
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
Отсюда не выйти.[l][cm]
@layopt layer=2 visible=false
@jump target=*room_02

[else]
#
Передняя дверь заперта и не открывается.[l][cm]
Точно, на задней двери должен быть внутренний замок.[l][cm]
Надо проверить.[l][cm]
[endif]

Замок заперт. Попробую открыть.[l][cm]
[playse storage=se_door.mp3 loop=false]
……[l][cm]

; --- 両方持っている場合 ---
[if exp="f.vinegar == 1 && f.dust_cloth == 1"]
Попробую использовать тряпку и уксус.[l][cm]
Ржавчина сошла![l][cm]
Попробую повернуть ключ.[l][cm]
Замок открылся.[l][cm]
Теперь можно выйти наружу![l][cm]
[playse storage=se_door.mp3 loop=false]
……？[l][cm]
Дверь не открывается: снаружи что-то зацепилось.[l][cm]
Чёрт![l][cm]
Столько усилий впустую.[l][cm]
[eval exp="f.mudakurou = 1"]
@jump target=*room_02

; --- お酢だけ ---
[elsif exp="f.vinegar == 1"]
Я полил замок уксусом.[l][cm]
Если найти чем вытереть, ржавчину можно будет убрать.[l][cm]
@jump target=*room_02

; --- 何もなし ---
[else]
Похоже, замок заржавел и совсем не поддаётся.[l][cm]
Как бы убрать ржавчину?[l][cm]
@jump target=*room_02
[endif]
[s]

;掲示板
*s02_board
[cm]
@layopt layer=message0 visible=true
#
Здесь висят объявления о мероприятиях и бюллетень по страховке.[l][cm]
Похоже, этот класс готовит спектакль к школьному фестивалю.[l][cm]

;1935
[if exp="f.age_1935 == 1"]
Похоже, это популярный фильм «Каникулы в Италии».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1940
[if exp="f.age_1940 == 1"]
Похоже, это популярный фильм «Большой монстр Гобира».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1945
[if exp="f.age_1945 == 1"]
Похоже, это популярный фильм «Звук — это мюзикл».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1950
[if exp="f.age_1950 == 1"]
Похоже, это популярный фильм «Школьник-обезьяна».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1955
[if exp="f.age_1955 == 1"]
Похоже, это популярный фильм «Экспрессо».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1960
[if exp="f.age_1960 == 1"]
Похоже, это популярный фильм «Джордж».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1965
[if exp="f.age_1965 == 1"]
Похоже, это популярный фильм «E.T.C».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1970
[if exp="f.age_1970 == 1"]
Похоже, это популярный фильм «Камбэк в будущее».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1975
[if exp="f.age_1975 == 1"]
Похоже, это популярный фильм «Тайпаника».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1980
[if exp="f.age_1980 == 1"]
Похоже, это популярный фильм «Принцесса ёкаев».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1985
[if exp="f.age_1985 == 1"]
Похоже, это популярный фильм «Таинственное исчезновение Ити и Итиро».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1990
[if exp="f.age_1990 == 1"]
Похоже, это популярный фильм «Пэрри Холтер и лебединый отряд».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;1995
[if exp="f.age_1995 == 1"]
Похоже, это популярный фильм «Охана и король моря».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2000
[if exp="f.age_2000 == 1"]
Похоже, это популярный фильм «Моё имя».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2005
[if exp="f.age_2005 == 1"]
Похоже, это популярный фильм «Тайный клинок: Бесконечный поезд».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2009
[if exp="f.age_2009 == 1"]
Похоже, это популярный фильм «Закон страны».[l][cm]
[eval exp="f.festival = 1"]
[endif]

;2010
[if exp="f.age_2010 == 1"]
Похоже, это фильм «〈название повреждено в исходнике〉».[l][cm]
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
Внутри ничего, кроме уксуса и смартфона.[l][cm]
@jump target=*room_02

[else]
#
Это моё место.[l][cm]
Что же у меня сегодня с собой?[l][cm]
В ящике обнаружился смартфон.[l][cm]
Похоже, внутри есть что-то ещё.[l][cm]
Обнаружился уксус.[l][cm]
…Уксус?[l][cm]
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
Это место, где сидела Кайзаки.[l][cm]

;----- 許可をもらっている -> 調べられる -----
[if exp="f.ok_kaizaki == 1"]
Я порылся в ящике.[l][cm]
Оттуда выпал какой-то листок.[l][cm]
Похоже на рекламную листовку.[l][cm]
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=400 y=100 storage="poster.png"
Кайзаки…?[l][cm]
На обратной стороне тоже что-то написано.[l][cm]
«• Попробовать приукрасить самопрезентацию[r]
• RTA самопрезентации[l][cm]
• Самопрезентация через случайный обратный перевод ← выбрано»[r]
• Самопрезентация (всё ложь)»[l][cm]
Что это вообще такое?[l][cm]
Может, спросить Кайзаки?[l][cm]
[freeimage layer=1 time="1"]
[eval exp="f.paper_kaizaki = 1"]
@jump target=*room_02
[s]

;----- 許可なし -> 注意文を出して許可待ちフラグを立てる -----
[else]
…Не буду копаться здесь без разрешения.[l][cm]
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
Что случилось? Нашлось что-нибудь?[l][cm]

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
Понятно.[l][cm]
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
Почему меня заперли…?[l][cm]
Ну-у…[l][cm]
Я очнулась в классе.[l][cm]
Сегодня шестым уроком была физкультура, помнишь?[l][cm]
Я устала и тихонько уснула во время классного часа.[l][cm]
А проснулась уже сейчас.[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Несправедливо! Могли бы меня разбудить.[l]

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
Вот же неприятность~.[l][cm]
Всё равно никому нет до меня дела.[l][cm]
……。[l][cm]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Не стоило тебе это говорить…[l][cm]
@jump target=*s02_kaizaki
[s]

*select_s02_c2_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
Как невежливо! Конечно, друзья есть![l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
…Правда говорю![l][cm]
Тебя ведь тоже никто не разбудил, верно?[l][cm]
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
Что-то я устала. Интересно, удастся ли мне сегодня попасть домой?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Слушай, а почему ты здесь?[l]

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
…Что? Ты в порядке?[l][cm]
Ты ведь учишься в этом классе?[l][cm]
Ведь так?[l]

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
Ведь так?[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Интересно, почему же?[l][cm]
Тебя тоже вымотала физкультура?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Ничего! Как только выберемся, всё будет хорошо![l][cm]
[chara_mod name="kaizaki" face="doya"  time=1]
Забудем прошлое и двинемся вперёд![l][cm]
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
Дверь не открылась?[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Ну что поделать.[l][cm]
Обычно я не люблю, когда кто-то заглядывает в мою парту,[r]
но сейчас чрезвычайная ситуация.[l][cm]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Можешь осмотреть моё место.[l][cm]
[eval exp="f.ok_kaizaki = 1"]
@jump target=*s02_kaizaki
[s]

[else]
Моё место?[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Э-э… я не очень хочу, чтобы туда заглядывали.[l][cm]
Сначала осмотри весь класс. Если ничего не найдёшь — тогда можно.[l][cm]
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
В этом году на школьном фестивале будет спектакль.[l][cm]

;1935
[if exp="f.age_1935 == 1"]
Постановка — «Каникулы в Италии»?[l][cm]
Ты знаешь фильм «Каникулы в Италии»?[l]
[endif]

;1940
[if exp="f.age_1940 == 1"]
Постановка — «Большой монстр Гобира»?[l][cm]
Ты знаешь фильм «Большой монстр Гобира»?[l]
[endif]

;1945
[if exp="f.age_1945 == 1"]
Постановка — «Звук — это мюзикл»?[l][cm]
Ты знаешь фильм «Звук — это мюзикл»?[l]
[endif]

;1950
[if exp="f.age_1950 == 1"]
Постановка — «Школьник-обезьяна»?[l][cm]
Ты знаешь фильм «Школьник-обезьяна»?[l]
[endif]

;1955
[if exp="f.age_1955 == 1"]
Постановка — «Экспрессо»?[l][cm]
Ты знаешь фильм «Экспрессо»?[l]
[endif]

;1960
[if exp="f.age_1960 == 1"]
Постановка — «Джордж»?[l][cm]
Ты знаешь фильм «Джордж»?[l]
[endif]

;1965
[if exp="f.age_1965 == 1"]
Постановка — «E.T.C»?[l][cm]
Ты знаешь фильм «E.T.C»?[l]
[endif]

;1970
[if exp="f.age_1970 == 1"]
Постановка — «Камбэк в будущее»?[l][cm]
Ты знаешь фильм «Камбэк в будущее»?[l]
[endif]

;1975
[if exp="f.age_1975 == 1"]
Постановка — «Тайпаника»?[l][cm]
Ты знаешь фильм «Тайпаника»?[l]
[endif]

;1980
[if exp="f.age_1980 == 1"]
Постановка — «Принцесса ёкаев»?[l][cm]
Ты знаешь фильм «Принцесса ёкаев»?[l]
[endif]

;1985
[if exp="f.age_1985 == 1"]
Постановка — «Таинственное исчезновение Ити и Итиро»?[l][cm]
Ты знаешь фильм «Таинственное исчезновение Ити и Итиро»?[l]
[endif]

;1990
[if exp="f.age_1990 == 1"]
Постановка — «Пэрри Холтер и лебединый отряд»?[l][cm]
Ты знаешь фильм «Пэрри Холтер и лебединый отряд»?[l]
[endif]

;1995
[if exp="f.age_1995 == 1"]
Постановка — «Охана и король моря»?[l][cm]
Ты знаешь фильм «Охана и король моря»?[l]
[endif]

;2000
[if exp="f.age_2000 == 1"]
Постановка — «Моё имя»?[l][cm]
Ты знаешь фильм «Моё имя»?[l]
[endif]

;2005
[if exp="f.age_2005 == 1"]
Постановка — «Тайный клинок: Бесконечный поезд»?[l][cm]
Ты знаешь фильм «Тайный клинок: Бесконечный поезд»?[l]
[endif]

;2009
[if exp="f.age_2009 == 1"]
Постановка — «Закон страны»?[l][cm]
Ты знаешь фильм «Закон страны»?[l]
[endif]

;2010
[if exp="f.age_2010 == 1"]
Постановка — «〈название повреждено в исходнике〉»?[l][cm]
Ты знаешь фильм «〈название повреждено в исходнике〉»?[l]
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
Он ведь недавно был популярен~.[l][cm]
@jump target=*select_s02_c6_common
[s]

;知らない
*select_s02_c6_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
[chara_mod name="kaizaki" face="komari"  time=1]
Что?! Ты не знаешь?! О нём недавно все говорили![l][cm]
@jump target=*select_s02_c6_common
[s]

*select_s02_c6_common
[chara_mod name="kaizaki" face="nomal"  time=1]
Тебе нравятся спектакли?[l][cm]
Я люблю и смотреть их, и играть в них~![l][cm]
Но обычно я тихо сижу в уголке класса,
так что неловко лезть вперёд только в такие моменты…[l][cm]
На самом деле я хотела бы сыграть главную роль,[l][cm]
но согласилась бы даже на маленькую роль~.[l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
……。[l][cm]
…………。[l][cm]
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Слушай.[l][cm]
А тебе[l][cm]
когда-нибудь казалось, что ты — главный герой?[l][cm]
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
Уксус?[l][cm]
А, тот самый уксус.[l][cm]
Я думала, что потеряла его, но он оказался у тебя на месте.[l][cm]
Я держу его под рукой — вдруг пригодится~.[l][cm]
Уксус ведь классика эскейп-игр, правда?[l][cm]
[chara_mod name="kaizaki" face="doya"  time=1]
Можешь пользоваться им как хочешь. Считай, это подарок![l][cm]
@jump target=*s02_kaizaki
[s]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;チラシ
*select_s02_c8
[freeimage layer=1 time="1"]
[cm]

@layopt layer=message0 visible=true
#kaizaki
Листовка?[l][cm]
[chara_mod name="kaizaki" face="komarihazi"  time=1]
Что?! Ты видел ту листовку?![l][cm]
Ну… э-э… как бы это сказать…[l][cm]
Ничего особенного, правда? Ахаха~.[l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
……。[l][cm]
[chara_mod name="kaizaki" face="komari"  time=1]
Э-э…[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Я вообще отаку: люблю игры и аниме.[l][cm]
А ещё я недавно подсела на Vtuber.[l][cm]
Ты знаешь, кто такие Vtuber?[l]

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
Vtuber — это сокращение от «Virtual YouTuber»,[l][cm]
так называют стримеров и авторов видео, выступающих в образе виртуальных персонажей.[l][cm]
[chara_mod name="kaizaki" face="doya"  time=1]
Кажется, будто персонаж настоящий. Это так интересно![l][cm]
Если хочешь, поищи информацию![l][cm]
@jump target=*s02_kaizaki
[s]

;知っている
*select_s02_c3_2
[freeimage layer=1 time="1"]
[cm]
#kaizaki
О! Тебе, случайно, не нравится?[l]

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
Серьёзно?! Я так рада![l][cm]
Кто тебе нравится?[l]

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

[if exp="f.vtubername =='怪崎' || f.vtubername =='Сёко' || f.vtubername =='Шоко' || f.vtubername =='Кайзаки Сёко'"]
#kaizaki
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Сёко…?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Ты её знаешь![l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
Фух, отлично.[l][cm]
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
Я тоже её знаю.[l][cm]
[chara_hide name="shoko"]
[chara_mod name="shoko" face="nomal"  time=1]
@jump storage="scene3.ks" target=*start
[endif]


;===

[if exp="f.vtubername =='怪崎ショウ子' || f.vtubername =='Сёко' || f.vtubername =='Шоко' || f.vtubername =='Кайзаки Сёко'"]
#kaizaki
[chara_mod name="kaizaki" face="kutitozi"  time=1]
Сёко…?[l][cm]
[chara_mod name="kaizaki" face="nomal"  time=1]
Ты её знаешь![l][cm]
[chara_mod name="kaizaki" face="metozihohoemi"  time=1]
Фух, отлично.[l][cm]

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
Я тоже её знаю.[l][cm]
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
Ого! А я, кажется, почти её не смотрела~.[l][cm]
Точно! Давай как-нибудь спокойно всё обсудим![l][cm]
Просто вокруг меня мало кто любит Vtuber, поэтому поговорить об этом почти не с кем.[l][cm]
Обещай![l][cm]
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
Я-я не знаю такого Vtuber~![l][cm]
Я тоже потом поищу информацию! Правда![l][cm]
@jump target=*s02_kaizaki
[s]
