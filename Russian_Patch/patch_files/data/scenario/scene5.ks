*start
[cm]
[wait time=300]
[stopbgm storage=bgm_02.mp3 buf=1 ]
@layopt layer=message0 visible=true
@bg storage ="back_3.png" time=100
[chara_show name="shoko"]
[chara_config ptext="chara_name_area"]

#shoko
……。[l][cm]
…………。[l][cm]
Хочешь выйти наружу?[l][cm]
Да брось, здесь ведь хорошо.[l][cm]
Давай останемся здесь.[l][cm]
Или тебе надоело со мной разговаривать?[l][cm]
……。[l][cm]
…………。[l][cm]
[chara_mod name="shoko" face="kutitozi_2"  time=1]
Выйти?[l][cm]
Куда?[l][cm]
Твоё место — здесь.[l][cm]
Проверь профиль.[l][cm]

@layopt layer=message0 visible=false
;スマホ表示
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
Ну? Тебе больше негде быть.[l][cm]
Тебе остаётся только быть здесь.[l][cm]
Я всё это время ждала.[l][cm]
Я ждала, что кто-нибудь придёт сюда ко мне.[l][cm]
В реальном мире мне нет места.[l][cm]
Я всё это время ждала человека, который даст мне место.[l][cm]
Оставайся здесь навсегда[cm]
[stopbgm storage=bgm_03.mp3 loop=false buf=1]
;ノイズ音＆スマホの通知画面を表示
[playse storage=se_meg.mp3 loop=false]
#secret
Прекрати уже[l][cm]
#shoko
……？[l][cm]
Кто там?[l][cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false]
Не помнишь?[l][cm]
[playse storage=se_meg.mp3 loop=false]
Это ты.[l][cm]
#shoko
…Я?[l][cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false]
Да.[l][cm]
[playse storage=se_meg.mp3 loop=false]
Давай больше не будем повторять одно и то же[l][cm]
[playse storage=se_meg.mp3 loop=false]
Ты ведь знаешь, как тяжело оказаться здесь взаперти[l][cm]
[playse storage=se_meg.mp3 loop=false]
Ты хочешь обречь и этого человека на ту же участь?[l][cm]
#shoko
[font size="30"]
！[l][cm]
Что ты несёшь?![l][cm]
Наконец-то можно выбраться — это идеальный шанс![l][cm]
Мне всё равно, что с этим человеком будет![l][cm]
[font size="30"]
Я отсюда выйду и вернусь в реальный мир![l][cm]
[font size="35"]
Я человек из реального мира![l][cm]
[font size="45"]
Я не хочу становиться этой Сёко![l][cm]
[font size="80"]
Я стану тобой и выберусь отсюда!!![l][cm]
#Megic
[playse storage=se_meg.mp3 loop=false]
……[l][cm]
[playse storage=se_meg.mp3 loop=false]
Нет, с ней, похоже, не поговорить[l][cm]

*s05_02
[cm]
[playse storage=se_meg.mp3 loop=false]
[emb exp="f.player_name"] [l][cm]
[playse storage=se_meg.mp3 loop=false]
Сейчас Сёко пытается переписать твою личность[l][cm]
[playse storage=se_meg.mp3 loop=false]
Если хочешь выбраться, не забудь себя[l][cm]
[playse storage=se_meg.mp3 loop=false]
;バグったプロフィール画面が表示される
[playse storage=se_meg.mp3 loop=false]
Верни своему профилю исходный вид[l][cm]
[playse storage=se_meg.mp3 loop=false]
Не бойся, в этом мире есть подсказки[l][cm]
[playse storage=se_meg.mp3 loop=false]
В этом мире есть всё необходимое, чтобы завершить историю[l][cm]
[playse storage=se_meg.mp3 loop=false]
Времени почти не осталось[l][cm]
[playse storage=se_meg.mp3 loop=false]
Удачи[l][cm]
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

;スマホ
[locate x=250 y=645]
[button graphic="s05_smartphone.png" target="*05_sp_op"]

;ドア
[locate x=206 y=122]
[button graphic="s05_door.png" opacity=0 target=*s05_door]

;掃除ロッカー
[locate x=359 y=157]
[button graphic="s05_locker.png" target=*s05_locker]

;掲示板
[locate x=0 y=106]
[button graphic="s05_board.png" target=*s05_board]

;プレイヤーの席
[locate x=480 y=405]
[button graphic="s05_mydesk.png" target=*s05_mydesk]

;飼崎の席
[locate x=138 y=390]
[button graphic="s05_kaizakidesk.png" target=*s05_kaizakidesk]

;左
[locate x=50 y=400]
[button graphic="s02_left.png" target=*room_05_01]
[s]


*room_05_01
[cm]
@layopt layer=message0 visible=false
@bg storage ="back_4.png" time=0

;時計
[locate x=1039 y=145]
[button graphic="s05_clock.png" target=*s05_clock ]

;窓
[locate x=0 y=75]
[button graphic="s05_window.png" target=**s05_window]

;黒板
[locate x=551 y=166]
[button graphic="s05_blackboard.png" target=s05_blackboard]

;右
[locate x=1150 y=400]
[button graphic="s02_right.png" target=*room_05_02]

[s]

;ドア
*s05_door
[cm]
@layopt layer=message0 visible=true

; --- 両方持っている場合 ---
[if exp="f.vinegar_05 == 1 && f.dust_cloth_05 == 1"]
Использованы тряпка и уксус.[l][cm]
Под ржавчиной проступили буквы.[l][cm]
「[emb exp="f.player_fpassword"]」 [l][cm]
[eval exp="f.mudakurou_05 = 1"]
@jump target=*room_05_02

; --- お酢だけ ---
[elsif exp="f.vinegar == 1"]
Этого недостаточно.[l][cm]
@jump target=*room_05_02

; --- 何もなし ---
[else]
Дверь заржавела.[l][cm]
Похоже, под ржавчиной что-то написано.[l][cm]
@jump target=*room_05_02
[endif]
[s]

;窓
*s05_window
[cm]
@layopt layer=message0 visible=true
#
За окном кромешная тьма.[l][cm]
@jump target=*room_05_01
[s]

;掃除ロッカー
*s05_locker
[cm]
@layopt layer=message0 visible=true
[if exp="f.locker_05 == 1]
#
Больше здесь нечего брать.[l][cm]
@jump target=*room_05_02
[else]

#
Здесь есть тряпка.[l][cm]
Тряпка получена.[l][cm]
[eval exp="f.dust_cloth_05 = 1"]
[eval exp="f.locker_05 = 1"]
[endif]

@jump target=*room_05_02
[s]


;黒板
*s05_blackboard
[cm]
@layopt layer=message0 visible=true
#
Доска чисто вытерта.[l][cm]
Похоже, здесь записаны дата и дежурный.[l][cm]
«Дата: 〈неразборчиво〉 [r]
　Дежурный: [emb exp="f.player_name"]»[l][cm]
@jump target=*room_05_01
[s]

;時計
*s05_clock
[cm]
@layopt layer=message0 visible=true
#
Время перевалило за 20:00.[l][cm]
Похоже, часы не сдвинулись с тех пор, как мы сюда пришли.[l][cm]
@jump target=*room_05_01
[s]


;掲示板
*s05_board
[cm]
@layopt layer=message0 visible=true
#
Здесь висит афиша спектакля к школьному фестивалю.[l][cm]

;1935
[if exp="f.age_1935 == 1"]
Похоже, это постановка по популярному во второй половине 1930-х фильму «Каникулы в Италии».[l][cm]
[endif]

;1940
[if exp="f.age_1940 == 1"]
Похоже, это постановка по популярному в первой половине 1940-х фильму «Большой монстр Гобира».[l][cm]
[endif]

;1945
[if exp="f.age_1945 == 1"]
Похоже, это постановка по популярному во второй половине 1940-х фильму «Звук — это мюзикл».[l][cm]
[endif]

;1950
[if exp="f.age_1950 == 1"]
Похоже, это постановка по популярному в первой половине 1950-х фильму «Школьник-обезьяна».[l][cm]
[endif]

;1955
[if exp="f.age_1955 == 1"]
Похоже, это постановка по популярному во второй половине 1950-х фильму «Экспрессо».[l][cm]
[endif]

;1960
[if exp="f.age_1960 == 1"]
Похоже, это постановка по популярному в первой половине 1960-х фильму «Джордж».[l][cm]
[endif]

;1965
[if exp="f.age_1965 == 1"]
Похоже, это постановка по популярному во второй половине 1960-х фильму «E.T.C».[l][cm]
[endif]

;1970
[if exp="f.age_1970 == 1"]
Похоже, это постановка по популярному в первой половине 1970-х фильму «Камбек-фьючер».[l][cm]
[endif]

;1975
[if exp="f.age_1975 == 1"]
Похоже, это постановка по популярному во второй половине 1970-х фильму «Тайпаника».[l][cm]
[endif]

;1980
[if exp="f.age_1980 == 1"]
Похоже, это постановка по популярному в первой половине 1980-х фильму «Принцесса ёкаев».[l][cm]
[endif]

;1985
[if exp="f.age_1985 == 1"]
Похоже, это постановка по популярному во второй половине 1980-х фильму «Похищение Ити и Итиро».[l][cm]
[endif]

;1990
[if exp="f.age_1990 == 1"]
Похоже, это постановка по популярному в первой половине 1990-х фильму «Пэрри Холтер и лебединый отряд».[l][cm]
[endif]

;1995
[if exp="f.age_1995 == 1"]
Похоже, это постановка по популярному во второй половине 1990-х фильму «Охана и король моря».[l][cm]
[endif]

;2000
[if exp="f.age_2000 == 1"]
Похоже, это постановка по популярному в первой половине 2000-х фильму «Моё имя».[l][cm]
[endif]

;2005
[if exp="f.age_2005 == 1"]
Похоже, это постановка по популярному во второй половине 2000-х фильму «Тайный клинок: Бесконечный поезд».[l][cm]
[endif]

;2009
[if exp="f.age_2009 == 1"]
Похоже, это постановка по популярному во второй половине 2000-х фильму «Закон страны».[l][cm]
[endif]

;2010
[if exp="f.age_2010 == 1"]
Похоже, это постановка по популярному в первой половине 2010-х фильму «〈неразборчивое название〉».[l][cm]
[endif]

@jump target=*room_05_02
[s]

;プレイヤーの席
*s05_mydesk
[cm]
@layopt layer=message0 visible=true
Это не моя парта.[l][cm]
Получен уксус.[l][cm]
[eval exp="f.vinegar_05 = 1"]
@jump target=*room_05_02
[s]

;怪崎の席
*s05_kaizakidesk
[cm]
@layopt layer=message0 visible=true
#
Это место, где сидела Кайзаки.[l][cm]
Теперь её здесь нет.[l][cm]
@jump target=*room_05_02
[s]

;==============================================================================
;スマホ
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


;第1問：生年月日
*s05_q1
[cm]
@layopt layer=2 visible=true
@bg storage ="back_5_sp1.png" time=0
;もどる
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


;第2問：職業
*s05_q2
[cm]
[eval exp="f.s05q2 = 1"]
@bg storage ="back_5_sp2.png" time=0
;もどる
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


;第3問：名前
*s05_q3
[cm]
;もどる
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


;第4問：パスワード
*s05_q4
[cm]
;もどる
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
Хорошо. Похоже, память к тебе вернулась.[cm]
[chara_show name="shoko" face="end" time=1 ]
#shoko
[font size=60]
Прекрати! Не уходи! Верни меня![l][cm]
[font size=60]
Выпусти меня наружу! Пожалуйста![l][cm]
[font size=60]
Нет! Я хочу домой![l][cm]
[font size=60]
Меня![l][cm]
[font size=70]
Выведи меня наружу!![l][cm]
#Megic
[playse storage=se_meg.mp3 loop=false]
……[l][cm]
[playse storage=se_meg.mp3 loop=false]
…………。[l][cm]
[playse storage=se_meg.mp3 loop=false]
[stopbgm]
[stopbgm storage=bgm_04.mp3 loop=false buf=1]
Можно я немного о себе расскажу?[l]

;選択肢
[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=150 y=290 storage="select_01.png"
;いいよ
[button graphic="select_s05_a1.png" target=*select_s05_a1 x=183 y=380 ]
;早く帰りたい
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
Спасибо[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Это пространство создано для «неё».[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Нет… для тех, кто признаёт её существование.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Поэтому она должна быть здесь.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Я тоже из тех, кто её признаёт.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Она хотела выбраться отсюда.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
И я в итоге помог ей.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Не понимая, к чему это приведёт.[l]

[freeimage layer=1 time="1"]
@layopt layer=1 visible=true
@image layer=1 x=150 y=290 storage="select_01.png"
;彼女はここから出られるの？
[button graphic="select_s05_b1.png" target=*select_s05_b1 x=183 y=380 ]
;君はここから出ないの？
[button graphic="select_s05_b2.png" target=*select_s05_b1 x=183 y=445 ]
[s]

*select_s05_b1
[freeimage layer=1 time="1"]
[cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false buf=2]
Я выберусь отсюда…?[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Да, точно.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Либо кто-то займёт её место,[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
либо[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
если никто больше не будет её признавать, она сама постепенно исчезнет вместе с этим местом.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Спасибо за компанию до самого конца.[l][cm]
@jump target=s05_04
[s]

*select_s05_a2
[freeimage layer=1 time="1"]
[cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false buf=2]
Да, точно.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Прости за эти странные слова.[l][cm]
@jump target=s05_04
[s]

*s05_04
[freeimage layer=1 time="1"]
[cm]
#Megic_00
[playse storage=se_meg.mp3 loop=false buf=2]
Хорошо, давай всё закончим.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Здесь тебе больше нечего делать.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Спасибо, что ты здесь.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Спустя столько времени снова удалось с кем-то поговорить — это было приятно.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Не могу сказать: «Ещё увидимся»,[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
но мне будет приятно, если ты сохранишь меня в уголке своей памяти.[l][cm]
[playse storage=se_meg.mp3 loop=false buf=2]
Тогда я выключаюсь.[l][cm]
[chara_hide name="shoko" time=100 ]

@bg storage ="back_5.png" time=0
@layopt layer=message0 visible=false time="1"
[position layer=message1 width=1200 height=900 top=0 left=0 opacity=0 page=fore ]
[current layer="message1"]

@layopt layer=message1 visible=true time="1"
[font size="20"]
[font color=0x00FF00]

;テキスト
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

MESSAGE ................ "Спасибо за игру."[r]

end of credits.log[r]
SYSTEM POWER ........... OFFLINE[r]
████████████████████ 100%[r]
..........SHUTDOWN COMPLETE[r]
[wait time=3000]
[cm]
[stopbgm storage=se_end.mp3 loop=false buf=1]
@bg storage ="black.png" time=100
[eval exp="f.end = 1"]

; ｢10秒待て｣という[wait]命令を出す
[wait time="90000"]
[cm]
[font color=0xffffff]
[font size=15]
А, прости.[r][l]
Кнопка «Завершить» не предусмотрена.[r][l]
Чтобы закрыть окно, нажми «×» в правом верхнем углу.[r][l]
Тогда ты сможешь выйти наружу.[r][l]
Пока! 👋
[s]
