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
Похоже, это рекламная листовка VTuber «Сёко».[l][cm]
На обратной стороне тоже что-то написано.[l][cm]
«• Попробовать преувеличить самопрезентацию[r]
• RTA самопрезентации[l][cm]
• Попробовать самопрезентацию через случайный обратный перевод ← выбрано[r]
• Самопрезентация (всё неправда)»[l][cm]
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
А, про Сёко~.[l][cm]
Точно! Раз уж заговорили, давай устроим викторину![l][cm]

*q1
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="doya"  time=1]
Вопрос первый! Как Сёко здоровается?[l]

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

[if exp="f.question1 =='Охасёкодзаимас' || f.question1 =='охасёкодзаимас' || f.question1 =='おはしょうこざいます'"]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]

Ага, понятно.[l][cm]
Тогда следующий вопрос.[l][cm]
@jump target=*select_s03_a2
[endif]

#shoko
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Хм… Похоже, не то?[l][cm]
[eval exp="f.q1 = 1"]
[chara_hide name="shoko" time=200 ]
@jump target=*room_00
[s]


*select_s03_a2
@layopt layer=message0 visible=true
[eval exp="f.q1 = 0"]
[chara_mod name="shoko" face="doya"  time=1]
Вопрос второй! Какая у Сёко отличительная черта?[l]

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

[if exp="f.question2 =='Незамутнённый левый глаз' || f.question2 =='незамутнённый левый глаз' || f.question2 =='曇りなき左目'"]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
Ого! Ты хорошо её знаешь![l][cm]
И последний вопрос![l][cm]
@jump target=*select_s03_a3
[endif]

[cm]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
Похоже, неверно~.[l][cm]
[eval exp="f.q2 = 1"]
[chara_hide name="shoko" time=200 ]
@jump target=*room_00
[s]


*select_s03_a3
@layopt layer=message0 visible=true
[eval exp="f.q2 = 0"]
[chara_mod name="shoko" face="doya"  time=1]
Вопрос третий! Что сейчас чувствует Сёко?[l]

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

[if exp="f.question3 =='весело' || f.question3 =='Весело' || f.question3 =='たのしい'"]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
А ты, оказывается, хорошо разбираешься?[l][cm]
Я думала, на этот вопрос никто никогда не ответит…[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Ты что, поискал ответы в интернете?![l][cm]
……。[l][cm]
…………。[l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
Н-ну, даже если ты поискал, меня это совсем не расстраивает… совсем![l][cm]
Да нет, ха-ха~.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
！[l][cm]
Слушай, а у тебя есть доступ в интернет?![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Тогда, может, мы сможем позвать кого-нибудь снаружи на помощь?[l]
@jump target=*select_s03_b1
[endif]

#shoko
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Проверь ещё раз.[l][cm]
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
С моего смартфона больше не удаётся связаться с внешним миром,[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Я думала, это просто сбой связи, но хорошо, что у тебя связь работает~.[l][cm]
@jump target=s03_02
[s]

*select_s03_e2
[freeimage layer=1 time="1"]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
[cm]
Да! Давай попробуем![l][cm]
@jump target=s03_02
[s]

*s03_02
#shoko
Попробуй связаться через X с Megic — мы дружим![l][cm]
Поищи «Megic_00» — этот аккаунт должен найтись,[r]
и, если попросить о помощи, мы, возможно, выберемся![l][cm]
Я не открывала личные сообщения для всех, но попробуй отправить прямое сообщение![l][cm]
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
Похоже, это рекламная листовка VTuber «Сёко».[l][cm]
На обратной стороне тоже что-то написано.[l][cm]
«• Попробовать преувеличить самопрезентацию[r]
• RTA самопрезентации[l][cm]
• Попробовать самопрезентацию через случайный обратный перевод ← выбрано[r]
• Самопрезентация (всё неправда)»[l][cm]
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
Удалось с ней связаться?[l]

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
Спасибо~.[l][cm]
Тогда поговорим, пока не выберемся.[l][cm]
[eval exp="f.contact_ok = 1"]
@jump target=*s03_3_kaizaki
[s]

*select_s03_c2
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="kutitozi"  time=1]
Не удалось найти аккаунт?[l][cm]
Вот аккаунт: «Megic_00».[l][cm]
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
Я вообще часто играю~.[l][cm]
В консольные игры я почти не играю,[l][cm]
в основном играю в инди-игры на компьютере.[l][cm]
Раньше я часто играла в бесплатные игры, но с тех пор, как пошла в старшую школу, играю и в платные.[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Я сказала, что не играю в консольные игры, но чем вообще компьютерные игры отличаются от консольных?[l][cm]
Может, игры для ПК тоже относят к консольным?[l]

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
Может, и одинаковые?[l][cm]
Да, действительно: сейчас на домашних приставках можно играть и в игры независимых разработчиков.[l][cm]
Мне сложно разбираться в таких классификациях.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;同じじゃない
*select_s03_d1_2
[freeimage layer=1 time="1"]
[cm]
#shoko
[chara_mod name="shoko" face="nomal"  time=1]
Думаешь, они разные?[l][cm]
Кажется, консольные игры делают компании, так что игры независимых разработчиков, наверное, не считаются?[l][cm]
Вот бы кто-нибудь знающий объяснил~.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;コンシューマーゲームって何？
*select_s03_d1_3
[freeimage layer=1 time="1"]
[cm]
#shoko
Консольные игры — это игры для домашних игровых приставок.[l][cm]
Игры на смартфонах называют социальными играми,[l][cm]
а игры в игровых автоматах — аркадными.[l][cm]
[chara_mod name="shoko" face="komari"  time=1]
Если ты вообще не знаешь, что такое консольные игры, тема не очень удачная…[l][cm]
@jump target=*s03_3_kaizaki
[s]


;音楽
*select_s03_d2
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Ты слушаешь музыку?[l]

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
Здорово~.[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Я тоже слушаю музыку по дороге в школу.[l][cm]
В последнее время меня интересует жанр альтернативного рока.[l][cm]
Говорят, альтернативный рок — это «рок с духом андеграунда»,[l][cm]
но сейчас это определение довольно расплывчатое.[l][cm]
Даже под одним названием «альтернативный рок» скрывается много разного.[l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
Музыка — сложная штука.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;聞かない
*select_s03_d2_2
[cm]
[freeimage layer=1 time="1"]
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Не слушаешь?![l][cm]
А тебе не скучно по дороге в школу?[l]

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
Тогда почему бы тебе не попробовать слушать музыку?[l][cm]
Я бы что-нибудь посоветовала, но сама не очень разбираюсь~.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Интересно, есть ли что-нибудь в моём телефоне.[l]
[wait time=1000]
[stopbgm storage=se_noise.mp3 buf=1]
[stopbgm]
[playbgm storage=olt_1.mp3 loop=false]
[wait time=3200]
[cm]
[chara_mod name="shoko" face="komari"  time=1]
Ой, блин![l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
…Надеюсь, ничего не было слышно, да?[l][cm]
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
Ты развлекаешься чем-то другим?[l][cm]
В поезде ведь много чем можно заняться~.[l][cm]
Поиграть, посмотреть соцсети…[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Ты что, учишься?![l][cm]

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
Н-ну ты даёшь![l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Вот это умница![l][cm]
@jump target=*s03_3_kaizaki
[s]

;していない
*select_s03_d2_3_2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
#shoko
Вот и я о том же~.[l][cm]
[chara_mod name="shoko" face="komari"  time=1]
Всё равно ведь ещё предстоит учиться — не хочется делать это ещё и в поезде![l][cm]
@jump target=*s03_3_kaizaki
[s]

;電車通学じゃない
*select_s03_d2_3_3
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
……？[l][cm]
Ты ведь ездишь в школу на поезде?[l][cm]
@jump target=*s03_3_kaizaki
[s]

;TRPG
*select_s03_d3
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Ты знаешь, что такое НРИ?[l]

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
О! Ты знаешь?![l][cm]
Я люблю «Ктулху», а ещё играю в «Эмоклоа» и «Бигами»~.[l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
У меня даже накопилась стопка непрочитанных книг правил…[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Может, твои друзья тоже любят НРИ?[l][cm]
Обычно мы играем через интернет, а мне хотелось бы попробовать вживую![l][cm]
Надеюсь, когда-нибудь получится~![l][cm]
[chara_mod name="shoko" face="komarihazi"  time=1]
Ой! Я что-то слишком увлеклась![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Хе-хе, извини.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;知らない
*select_s03_d3_2
[freeimage layer=1 time="1"]
[cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
НРИ — это разновидность аналоговых, то есть некомпьютерных, игр,[l][cm]
проще говоря, игроки отыгрывают персонажей и разговаривают от их имени,[l][cm]
бросают кубики, как в игре-ходилке, и вместе развивают историю.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
Конечно, у разных игр правила отличаются,[l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
но главное — для разрешения игровых ситуаций не используют компьютер.[l][cm]
[chara_mod name="shoko" face="komari"  time=1]
…Похоже, тебе не очень интересно.[l][cm]
@jump target=*s03_3_kaizaki
[s]

;インターネット
*select_s03_d4
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="nomal"  time=1]
#shoko
Что тебе нравится в интернете?[l]

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
[if exp="f.search =='Выведи меня наружу' || f.search =='выведи меня наружу' || f.search =='そとにつれてって'"]
@jump storage="scene4.ks" target=*start
[endif]

[if exp="f.search =='Давай выйдем наружу вместе' || f.search =='давай выйдем наружу вместе' || f.search =='いっしょにそとにでよう'"]
@jump storage="scene5.ks" target=*start
[endif]

[cm]
[chara_mod name="shoko" face="doya"  time=1]
#shoko
Интернет — забавная штука![l][cm]
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
Внезапная новость: сегодня Земля погибнет![l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Но не волнуйтесь.[l][cm]
Если нажать эту кнопку, через три минуты на Марсе родится[l][cm]
другой вы — с идеально скопированными телом, памятью и личностью, и вы выживете![l][cm]
[chara_mod name="shoko" face="metozihohoemi"  time=1]
Если не нажать, вы умрёте вместе с Землёй.[l][cm]
[chara_mod name="shoko" face="nomal"  time=1]
…Если бы тебе такое сказали, ты бы стал нажимать эту кнопку?[l][cm]
[chara_mod name="shoko" face="kutitozi"  time=1]
Если представить, что кнопка уже нажата, ты продолжал бы считать, что живёшь?[l][cm]
@jump target=*s03_3_kaizaki
[s]

;友達
*select_s03_d6
[freeimage layer=1 time="1"]
[cm]
@layopt layer=message0 visible=true
[chara_mod name="shoko" face="kutitozi"  time=1]
#shoko
Ты про «Megic_00»?[l][cm]
Мы просто друзья.[l][cm]
@jump target=*s03_3_kaizaki
[s]
