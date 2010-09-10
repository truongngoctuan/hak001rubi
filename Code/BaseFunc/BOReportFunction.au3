Func GetReportWithAvailablePath($ArgPath)
	;-- chon nut report
	Send("{TAB}")
	Send("{ENTER}")

	;-- nhap duong dan + ten file
	Sleep(1000);
	MouseClick ( "left", 475, 390)
	;ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:ThunderRT6TextBox1; INSTANCE:1]","C:\NT 0901")
	Send($ArgPath)

	;-- xuat file
	MouseClick ( "left", 425, 435); click va`o nut dong y
	Sleep(1000)
	MouseClick ( "left", 525, 465); click va`o nut dong y

	;-- tat report, chuan bi xuat cai tiep theo
	MouseClick ( "left", 640, 435); click va`o nut thoat
	MouseClick ( "left", 1014, 7); click va`o nut dong
EndFunc

Func SetReportGoodsDetailsArg($ArgBranch, $ArgFromDay, $ArgFromMonth, $ArgFromYear, $ArgToDay, $ArgToMonth, $ArgToYear, $ArgbTheoCa)
	;-- bat cua so bbtc
	WinWaitActive("[CLASS:ThunderRT6FormDC]")

	;--chinh chi nhanh
	ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:SSDataWidgetsEdit; INSTANCE:2]",$ArgBranch)

	;-- chinh ngay
	; chinh ngay cho "tu ngay"
	ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:2]")
	;Sleep(500);delay
	Send(String($ArgFromDay))
	Send("{RIGHT}")
	Send(String($ArgFromMonth))
	Send("{RIGHT}")
	Send(String($ArgFromYear))

	; chinh ngay cho "den ngay"
	ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:1]")
	;Sleep(500);delay
	Send(String($ArgToDay))
	Send("{RIGHT}")
	Send(String($ArgToMonth))
	Send("{RIGHT}")
	Send(String($ArgToYear))

	;-- chinh cac thuoc tinh khac nhu danh dau check,...
	ControlCommand ( "[CLASS:ThunderRT6FormDC]", "", "[CLASS:ThunderRT6CheckBox; INSTANCE:5]", "Check")
EndFunc