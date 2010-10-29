Func GetReportWithAvailablePath($ArgPath)
	;-- chon nut report
	Send("{TAB}")
	Send("{ENTER}")

	;-- nhap duong dan + ten file
	Sleep(200);
	MouseClick ( "left", 475, 390)
	;ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:ThunderRT6TextBox1; INSTANCE:1]","C:\NT 0901")
	Send($ArgPath)
	Sleep(200)

	;-- xuat file
	MouseClick ( "left", 425, 435); click va`o nut dong y
	Sleep(5000)
	; hien ra cai thong bao
	MouseClick ( "left", 525, 465); click va`o nut dong y
	Sleep(250)

	;-- tat report, chuan bi xuat cai tiep theo
	MouseClick ( "left", 640, 435); click va`o nut thoat
	Sleep(250)
	MouseClick ( "left", 1014, 7); click va`o nut dong
	Sleep(500)
EndFunc

Func SetReportGoodsDetailsArg($ArgBranch, $ArgFromDay, $ArgFromMonth, $ArgFromYear, $ArgToDay, $ArgToMonth, $ArgToYear, $ArgbTheoCa)
	;-- bat cua so bbtc
	WinWaitActive("[CLASS:ThunderRT6FormDC]")

	;--chinh chi nhanh
	ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:SSDataWidgetsEdit; INSTANCE:2]",$ArgBranch)
	;Sleep(100)

	;-- chinh ngay
	; chinh ngay cho "tu ngay"

	;ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:2]")

	Click(2, 121, 54)
	Send(String($ArgFromMonth))

	Click(2, 100, 54)
	Send(String($ArgFromDay))

	;Sleep(100)
	Send("{RIGHT}")
	Send("{RIGHT}")
	Send(String($ArgFromYear))
	;Sleep(100)
	Send("{ENTER}")
	;Sleep(100)

	; chinh ngay cho "den ngay"
	;ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:1]")

	Click(2, 118, 83)
	Send(String($ArgToMonth))

	Click(2, 100, 83)
	Send(String($ArgToDay))

	Send("{RIGHT}")
	Send("{RIGHT}")
	Send(String($ArgToYear))
	;Sleep(100)
	Send("{ENTER}")
	;Sleep(100)

	;-- chinh cac thuoc tinh khac nhu danh dau check,...
	ControlCommand ( "[CLASS:ThunderRT6FormDC]", "", "[CLASS:ThunderRT6CheckBox; INSTANCE:5]", "Check")
	Sleep(100)

	;-- ok
	Click(2, 95, 175)
EndFunc

Func SetReportHHCTGroupByHourArg($ArgBranch, $ArgFromDay, $ArgFromMonth, $ArgFromYear, $ArgToDay, $ArgToMonth, $ArgToYear, $ArgbTheoCa)
	;-- bat cua so bbtc
	WinWaitActive("[CLASS:ThunderRT6FormDC]")

	;--chinh chi nhanh
	ControlSetText("[CLASS:ThunderRT6FormDC]","","[CLASS:SSDataWidgetsEdit; INSTANCE:2]",$ArgBranch)
	;Sleep(100)

	;-- chinh ngay
	; chinh ngay cho "tu ngay"

	;ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:2]")

	Click(2, 121, 54)
	Send(String($ArgFromMonth))

	Click(2, 100, 54)
	Send(String($ArgFromDay))

	;Sleep(100)
	Send("{RIGHT}")
	Send("{RIGHT}")
	Send(String($ArgFromYear))
	;Sleep(100)
	Send("{ENTER}")
	;Sleep(100)

	; chinh ngay cho "den ngay"
	;ControlFocus("[CLASS:ThunderRT6FormDC]", "", "[CLASS:DTPicker20WndClass; INSTANCE:1]")

	Click(2, 118, 83)
	Send(String($ArgToMonth))

	Click(2, 100, 83)
	Send(String($ArgToDay))

	Send("{RIGHT}")
	Send("{RIGHT}")
	Send(String($ArgToYear))
	;Sleep(100)
	Send("{ENTER}")
	;Sleep(100)

	;-- chinh cac thuoc tinh khac nhu danh dau check,...
	;danh dau check vao theo nhom
	ControlCommand ( "[CLASS:ThunderRT6FormDC]", "", "[CLASS:ThunderRT6CheckBox; INSTANCE:4]", "Check")
	Sleep(100)

	;-- ok
	Click(2, 95, 175)
EndFunc