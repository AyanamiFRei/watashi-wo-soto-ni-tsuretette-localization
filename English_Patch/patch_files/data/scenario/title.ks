
[cm]

@clearstack
@wait time = 200

*start 
@bg storage ="pf_start.gif" time=1 
[button x=600 y=500 graphic="title/bt_start.png" enterimg="title/bt_start2.png"  target="gamestart" keyfocus="1"]
[s]

*gamestart
[stopbgm storage=se_noise.mp3]
@bg storage ="black.png" time=1 
;一番最初のシナリオファイルへジャンプする
@layopt layer=message0 visible=false
[position layer=message0 width=1000 height=237 top=670 left=150 ]
[position layer=message0 page=fore frame="textbox.png" margint="65" marginl="30" marginr="30" marginb="60"]

;[button name="role_button" role="skip" graphic="button/icon_skip.png" x=1100 y=10]
[button name="role_button" role="backlog" graphic="button/icon_log.png" x=1140 y=10]
[button name="role_button" role="load" graphic="button/icon_load.png" x=1180 y=10]
[button name="role_button" role="save" graphic="button/icon_save.png" x=1220 y=10]

;キャラクター怪崎ショウ子を登録
[chara_new name="shoko" storage="./data/fgimage/shoko.png" jname="Shoko"]
[ptext name="chara_name_area" layer=message0 width="200" color=white x=180 y=690 size=26]
;表情の登録
[chara_face name="shoko" face="nomal" storage="shoko.png"]
[chara_face name="shoko" face="doya" storage="shoko_doya.png"]
[chara_face name="shoko" face="komari" storage="shoko_komari.png"]
[chara_face name="shoko" face="kutitozi" storage="shoko_kutitozi.png"]
[chara_face name="shoko" face="metozihohoemi" storage="shoko_metozihohoemi.png"]
[chara_face name="shoko" face="komarihazi" storage="shoko_komarihazi.png"]
[chara_face name="shoko" face="kutitozi_2" storage="shoko_kutitozi_2.png"]
[chara_face name="shoko" face="end" storage="shoko_end.png"]

;キャラクターMegicを登録
[chara_new name="Megic_00" storage="./data/fgimage/kaizaki.png" jname="Megic"]
[ptext name="chara_name_area" layer=message0 width="200" color=white x=180 y=690 size=26]

;キャラクター飼崎を登録
[chara_new name="kaizaki" storage="./data/fgimage/kaizaki.png" jname="Kaizaki"]
;表情の登録
[chara_face name="kaizaki" face="nomal" storage="kaizaki.png"]
[chara_face name="kaizaki" face="doya" storage="kaizaki_doya.png"]
[chara_face name="kaizaki" face="komari" storage="kaizaki_komari.png"]
[chara_face name="kaizaki" face="kutitozi" storage="kaizaki_kutitozi.png"]
[chara_face name="kaizaki" face="metozihohoemi" storage="kaizaki_metozihohoemi.png"]
[chara_face name="kaizaki" face="komarihazi" storage="kaizaki_komarihazi.png"]

;キャラクター???を登録
[chara_new name="secret" storage="./data/fgimage/kaizaki.png" jname="???"]
[ptext name="chara_name_area" layer=message0 width="200" color=white x=180 y=690 size=26]


@jump storage="scene1.ks"

