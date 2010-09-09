WinWaitActive("[CLASS:ThunderRT6MDIForm]")
;-- truy cap vao menu bao cao -- tai chinh
;Send(!3); mo menu "bao cao"
; mo bao cao tai chinh
;Send("{DOWN}")
;Send("{ENTER}")
Send("^w"); phim tat

;-- bat cua so bbtc
WinWaitActive("[CLASS:ThunderRT6FormDC]")

;--chinh chi nhanh
ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:SSDataWidgetsEdit; INSTANCE:2]","COM TAM CALI 1 - NT")

;-- chinh ngay
; chinh ngay cho "tu ngay"
ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:2]")
;Sleep(500);delay
Send("01")
Send("{RIGHT}")
Send("09")
Send("{RIGHT}")
Send("2010")

; chinh ngay cho "den ngay"
ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:1]")
;Sleep(500);delay
Send("01")
Send("{RIGHT}")
Send("09")
Send("{RIGHT}")
Send("2010")

;-- chinh cac thuoc tinh khac nhu danh dau check,...
ControlCommand ( "[CLASS:ThunderRT6FormDC]", "", "[CLASS:ThunderRT6CheckBox; INSTANCE:5]", "Check")

;-- ok
;chinh sang mode relative voi client cua window hien tai
AutoItSetOption ("MouseCoordMode", 2)
MouseClick ( "left", 95, 175)
;tra ve relative binh thuong
AutoItSetOption ("MouseCoordMode", 1)

;-- bat trang bao cao
Sleep(5000)
;WinWaitActive("[CLASS:ThunderRT6FormDC]")

;-- chon nut report
Send("{TAB}")
Send("{ENTER}")

;-- nhap duong dan + ten file
Sleep(1000);
MouseClick ( "left", 475, 390)
;ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:ThunderRT6TextBox1; INSTANCE:1]","C:\NT 0901")
Send("C:\NT 0901")

;-- xuat file

;-- tat report, chuan bi xuat cai tiep theo

