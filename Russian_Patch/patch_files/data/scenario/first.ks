*start

[wait time=300]
[cm]
[freeimage layer=1 time="1"]
@layopt layer=message0 visible=false
@bg storage ="pf_at.gif" time=1 
[playbgm storage=se_noise.mp3 loop=true]
[button x=600 y=500 graphic="title/bt_checked.png" enterimg="title/bt_checked2.png"  target="*profile1_Edit"]
[button x=610 y=570 graphic="title/load.png" target=*loadmenu]
[s]

*loadmenu
[cm]
[showload]

[jump target=*start]
[s]

*profile1_Edit
[cm]
@bg storage ="pf_name.gif" time=1 
[image layer="1" storage="15_input_A.png" x="0" y="0"]
; [edit]x2 入力欄を出します。
[edit name="f.player_name" left="550" top="350" width="150" height="25" size="20" maxchars="10" initial="Без имени"]
 
[button graphic="title/bt_ok.png" enterimg="title/bt_ok2.png" target="*profile1_Commit" x="610" y="500"]
[s]

*profile1_Commit
 
 [commit]
 [cm]
 @jump target="*profile2_Edit"
 [s]

*profile2_Edit
@bg storage ="pf_shokugyo.gif" time=1 
[image layer="1" storage="15_input_A.png" x="0" y="0"]
; [edit]x2 入力欄を出します。
[edit name="f.player_shokugyo" left="550" top="350" width="150" height="25" size="20" maxchars="10" initial="учёба"]
[button graphic="title/bt_ok.png" enterimg="title/bt_ok2.png" target="*profile2_Commit" x="610" y="500"]
[s]

*profile2_Commit
 
 [commit]
 [cm]
 @jump target="*profile3_Edit"
 [s]

*profile3_Edit
@bg storage ="pf_age.gif" time=1 
#
;1935
[locate x=250 y=400]
[button graphic="age_1935.png" target=*age_1935]
;1940
[locate x=400 y=400]
[button graphic="age_1940.png" target=*age_1940]
;1945
[locate x=580 y=400]
[button graphic="age_1945.png" target=*age_1945]
;1950
[locate x=750 y=400]
[button graphic="age_1950.png" target=*age_1950]
;1955
[locate x=950 y=400]
[button graphic="age_1955.png" target=*age_1955]
;1960
[locate x=205 y=500]
[button graphic="age_1960.png" target=*age_1960]
;1965
[locate x=400 y=500]
[button graphic="age_1965.png" target=*age_1965]
;1970
[locate x=580 y=500]
[button graphic="age_1970.png" target=*age_1970]
;1975
[locate x=750 y=500]
[button graphic="age_1975.png" target=*age_1975]
;1980
[locate x=950 y=500]
[button graphic="age_1980.png" target=*age_1980]
;1985
[locate x=205 y=600]
[button graphic="age_1985.png" target=*age_1985]
;1990
[locate x=400 y=600]
[button graphic="age_1990.png" target=*age_1990]
;1995
[locate x=580 y=600]
[button graphic="age_1995.png" target=*age_1995]
;2000
[locate x=750 y=600]
[button graphic="age_2000.png" target=*age_2000]
;2005
[locate x=950 y=600]
[button graphic="age_2005.png" target=*age_2005]
;2009
[locate x=205 y=700]
[button graphic="age_2009.png" target=*age_2009]
;2010
[locate x=400 y=700]
[button graphic="age_2010.png" target=*age_2010]
[s]

;==============================================================

*age_1935
[eval exp="f.age_1935 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1940
[eval exp="f.age_1940 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1945
[eval exp="f.age_1945 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1950
[eval exp="f.age_1950 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1955
[eval exp="f.age_1955 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1960
[eval exp="f.age_1960 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1965
[eval exp="f.age_1965 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1970
[eval exp="f.age_1970 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1975
[eval exp="f.age_1975 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1980
[eval exp="f.age_1980 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1985
[eval exp="f.age_1985 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1990
[eval exp="f.age_1990 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_1995
[eval exp="f.age_1995 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_2000
[eval exp="f.age_2000 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_2005
[eval exp="f.age_2005 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_2009
[eval exp="f.age_2009 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

*age_2010
[eval exp="f.age_2010 = 1"]
@jump target="*profile4_Edit"
[cm]
[s]

;==============================================================

*profile4_Edit
[cm]
@layopt layer=2 visible=false
@bg storage ="pf_password.gif" time=1 
[image layer="1" storage="15_input_A.png" x="0" y="0"]
; [edit]x2 入力欄を出します。
[edit name="f.player_fpassword" left="550" top="350" width="150" height="25" size="20" maxchars="10" initial="xxxx"]
 
[button graphic="title/bt_ok.png" enterimg="title/bt_ok2.png" target="*profile4_Commit" x="610" y="500"]
[s]

*profile4_Commit
 
 [commit]
 [cm]
 @jump target="*first_ed"
 [s]

*first_ed
;タイトル画面へ移動
[cm]
@layopt layer=2 visible=false
@jump storage="title.ks" 

[s]
