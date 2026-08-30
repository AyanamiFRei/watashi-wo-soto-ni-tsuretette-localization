*start
[cm]
[freeimage layer=1 time="1"]
[eval exp="f.checked_desk = 0"]
[eval exp="f.smartphone = 0"]
[eval exp="f.dust_cloth = 0"]
[eval exp="f.locker = 0"]
[eval exp="f.mudakurou = 0"]
[eval exp="f.festival = 0"]
[eval exp="f.vinegar = 0"]
[eval exp="f.mydesk = 0"]
[eval exp="f.ok_kaizaki = 0"]
[eval exp="f.paper_kaizaki = 0"]
[eval exp="f.checked_desk = 0"]
[eval exp="f.ok_kaizaki = 0"]
[eval exp="f.paper_kaizaki = 0"]
[eval exp="f.q1 = 0"]
[eval exp="f.q2 = 0"]
[eval exp="f.q3 = 0"]
[eval exp="f.contact_ok = 0"]
[eval exp="f.Megic_ok = 0"]
[eval exp="f.s05q3 = 0"]
[eval exp="f.end = 0"]
[eval exp="f.s05q4 = 0"]
[eval exp="f.s05q3 = 0"]
[eval exp="f.s05q2 = 0"]
[eval exp="f.vinegar_05 = 0"]
[eval exp="f.dust_cloth_05 = 0"]
[eval exp="f.locker_05 = 0"]
[eval exp="f.mudakurou_05 = 0"]
[eval exp="f.age_1935 = 0"]
[eval exp="f.age_1940 = 0"]
[eval exp="f.age_1945 = 0"]
[eval exp="f.age_1950 = 0"]
[eval exp="f.age_1955 = 0"]
[eval exp="f.age_1960 = 0"]
[eval exp="f.age_1965 = 0"]
[eval exp="f.age_1970 = 0"]
[eval exp="f.age_1975 = 0"]
[eval exp="f.age_1980 = 0"]
[eval exp="f.age_1985 = 0"]
[eval exp="f.age_1990 = 0"]
[eval exp="f.age_1995 = 0"]
[eval exp="f.age_2000 = 0"]
[eval exp="f.age_2005 = 0"]
[eval exp="f.age_2009 = 0"]
[eval exp="f.age_2010 = 0"]

@layopt layer=message0 visible=false
@bg storage ="re_start.gif" time=1 
[playbgm storage=se_noise.mp3 loop=true]
[button x=610 y=500 graphic="title/bt_ok.png" enterimg="title/bt_ok2.png"  target="*profile1_Edit"]
[s]

*profile1_Edit
[cm]
[freeimage layer=1 time="1"]
@bg storage ="pf_name.gif" time=1 
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
[cm]
[freeimage layer=1 time="1"]
@bg storage ="pf_shokugyo.gif" time=1 
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
[freeimage layer=1 time="1"]
@bg storage ="pf_password.gif" time=1 
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
@jump storage="title.ks" 

[s]
