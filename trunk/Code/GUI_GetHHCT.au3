#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>
;#include <GetHHCT.au3>
#include <EditConstants.au3>
#include <ButtonConstants.au3>
#include <BaseFunc\BOReportFunction.au3>
;#include <BaseFunc\ClickFunction.au3>
#include <BaseFunc\FileBaseFunction.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$WinWidth = 400
$WinHeight = 275
$mainwindow = GUICreate("HHCT Beta 1", $WinWidth, $WinHeight)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")

;-----------------------------------
;-- ctrl from date - to date
GUICtrlCreateLabel("From Date:", 10, 10)
$DP_FromDate = GUICtrlCreateDate ( "", 99, 8, 100, 20, $DTS_SHORTDATEFORMAT)

GUICtrlCreateLabel("To Date: ", 10, 40)
$DP_ToDate = GUICtrlCreateDate ( "", 99, 36, 100, 20, $DTS_SHORTDATEFORMAT)

;-----------------------------------
;-- ctrl - nhap duong dan
GUICtrlCreateLabel("Save Report As: ", 10, 75)
$Edit_Path = GUICtrlCreateEdit("", 10, 90, $WinWidth / 2 - 25 - 10 - 2, 20, BitOr($ES_WANTRETURN, $ES_READONLY))
GUICtrlSetData ($Edit_Path, "C:\")

$Bt_Browse = GUICtrlCreateButton("...", $WinWidth / 2 - 25, 78 + 10, 25)
GUICtrlSetOnEvent($Bt_Browse, "BrowseButton")

;-----------------------------------
;-- bt OK kich hoat chuong trinh
$okbutton = GUICtrlCreateButton("OK", ($WinWidth - 60) / 2, $WinHeight - 25 - 10, 60)
GUICtrlSetOnEvent($okbutton, "OKButton")

;-----------------------------------
;-- list checkbox chon danh sach branch
GUICtrlCreateLabel("Branch: ", $WinWidth / 2 + 15, 10)
Dim $CBox_arrBranch[1]
Dim $arrBranch

MakeListBranch()

;-----------------------------------
;-- them xoa sua list branch
$Bt_BranchManager = GUICtrlCreateButton("+", ($WinWidth - 60) / 2 + 88, 6, 25)
GUICtrlSetOnEvent($Bt_BranchManager, "BtAddBranch")


;-----------------------------------
GUISetState(@SW_SHOW)

While 1
  Sleep(1000)  ; Idle around
WEnd

;------------------------------------------------------------------------------
Func OKButton()
  ;Note: at this point @GUI_CTRLID would equal $okbutton,
  ;and @GUI_WINHANDLE would equal $mainwindow
  ;MsgBox(0, "GUI Event", "You pressed OK!")
  ;MsgBox(0, "Date", GUICtrlRead($DP_FromDate))
	GUISetState(@SW_HIDE)
	ActiveFormHHCT()
	;doi den khi bat form
	WinWaitActive("[CLASS:ThunderRT6FormDC]")

	;--------------------
	;branch
	;kiem tra checkbox nao duoc danh dau thi lay cai do
	Local $arrCheckedBranch[1]
	$arrCheckedBranch[0] = 0
	;For $CBoxOneBranch In $CBox_arrBranch
	For $iCount = 1 To $CBox_arrBranch[0] Step 1
		If GUICtrlRead($CBox_arrBranch[$iCount]) == $GUI_CHECKED Then
				$arrCheckedBranch[0] += 1
				_ArrayAdd($arrCheckedBranch, GUICtrlRead($CBox_arrBranch[$iCount], 1))
			EndIf
		Next

	If $arrCheckedBranch[0] <> 0 Then
		_ArrayDelete($arrCheckedBranch, 0)
		EndIf

	;_ArrayDisplay($arrCheckedBranch, "Data From File")

	;--------------------
	;date
	Local $FromDate
	Local $FromTime
	_DateTimeSplit(GUICtrlRead($DP_FromDate), $FromDate, $FromTime)

	Local $ToDate
	Local $ToTime
	_DateTimeSplit(GUICtrlRead($DP_ToDate), $ToDate, $ToTime)
	;datediff va dateadd nhan kieu du lieu la: "YYYY/MM/DD[ HH:MM:SS]"
	Local $DDiffFromDateToDate = _DateDiff( 'D', StringFormat("%04d/%02d/%02d", $FromDate[3], $FromDate[2], $FromDate[1]), StringFormat("%04d/%02d/%02d", $ToDate[3], $ToDate[2], $ToDate[1]))
	For $x = 0 to $DDiffFromDateToDate
		;-- NewDate
		Local $NewDateTime = _DateAdd('D', $x, StringFormat("%04d/%02d/%02d", $FromDate[3], $FromDate[2], $FromDate[1]))
		Local $NewDate
		Local $NewTime
		_DateTimeSplit($NewDateTime, $NewDate, $NewTime)

		GetBusinessReportOneDay($NewDate[3], $NewDate[2], $NewDate[1], GUICtrlRead($Edit_Path), $arrCheckedBranch)

		Next

	DeactiveFormHHCT()
	GUISetState(@SW_SHOW)
EndFunc

;-----------------------------------------------------------
Func GetBusinessReportOneDay($ArgDay, $ArgMonth, $ArgYear, $ArgFolderPath, $arrBranch)
	;-- chinh cac thuoc tinh khac nhu danh dau check,...
	SetHHCTCheckDatHang()
	SetHHCTCheckChiTiet()
	;SetHHCTCheckTheoCa()

	FOR $OneBranch IN $arrBranch
		;-- cung cap thong tin cho form bao cao hhct
		;SetReportGoodsDetailsArg($OneBranch, 1, 9, 2010, 1, 9, 2010, True)
		;SetReportGoodsDetailsArg($OneBranch, $ArgDay, $ArgMonth, $ArgYear, $ArgDay, $ArgMonth, $ArgYear, True)

		;setup cho form
		;--chinh chi nhanh
		SetBranch($OneBranch)

		;-- chinh ngay
		; chinh ngay cho "tu ngay"
		SetFromDay($ArgDay, $ArgMonth, $ArgYear)

		; chinh ngay cho "den ngay"
		SetToDay($ArgDay, $ArgMonth, $ArgYear)

		;-- ok
		Click(2, 95, 175)

		;-- doi de luu bao cao
		Sleep(31000)
		;Local $Path = "C:\" & $OneBranch & " " & String($ArgYear) & String($ArgMonth) & String($ArgDay)
		Local $Path = StringFormat("%s%s %04d_%02d_%02d", $ArgFolderPath, $OneBranch, $ArgYear, $ArgMonth, $ArgDay)
		GetReportWithAvailablePath($Path)
	NEXT
EndFunc

;-----------------------------------------------------------
;bat/tat form
Func ActiveFormHHCT()
	WinWaitActive("[CLASS:ThunderRT6MDIForm]")
	;-- truy cap vao menu bao cao -- tai chinh
	Send("^e"); phim tat
EndFunc

Func DeactiveFormHHCT()
	;-- tat form
	Click(2, 277, 174);click va`o nut close
	Sleep(100)
EndFunc

;------------------------------------------------------------------------------
Func BtAddBranch()
	;hein notepad cho phep chinh suabranch
	GUISetState(@SW_HIDE)
	RunWait("notepad.exe Branch.txt")
	GUISetState(@SW_SHOW)
	; huy danh sach cu
	For $iCount = $CBox_arrBranch[0] To 1 Step -1
		GUICtrlDelete($CBox_arrBranch[$iCount]);
		_ArrayDelete($CBox_arrBranch, $iCount)
	Next
	$CBox_arrBranch[0] = 0

	;nap lai danh sach branch
	MakeListBranch()
EndFunc

;------------------------------------------------------------------------------
Func BrowseButton()
	GUISetState(@SW_HIDE)
	Local $var = FileSelectFolder("Choose a folder.", "")
	GUISetState(@SW_SHOW)
	GUICtrlSetData ($Edit_Path, $var)
EndFunc

;------------------------------------------------------------------------------
Func CLOSEClicked()
  ;Note: at this point @GUI_CTRLID would equal $GUI_EVENT_CLOSE,
  ;and @GUI_WINHANDLE would equal $mainwindow
  ;MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting...")
  Exit
EndFunc

Func MakeListBranch()
	$arrBranch = ReadArrayDataFromFile("Branch.txt")
	;_ArrayDisplay($arrBranch, "Data From File")
	;can them $arrCheckedBranch de quan ly
	;FOR $OneBranch IN $arrBranch
	For $iCount = 0 To $arrBranch[0] - 1 Step 1
		; kiem tra xem co # hay khong
		;_ArrayAdd($CBox_arrBranch, GUICtrlCreateCheckbox ($arrBranch[$iCount + 1], $WinWidth / 2 + 20, 35 + $iCount * 20))

		If StringLeft($arrBranch[$iCount + 1], 1) == "#" Then
			_ArrayAdd($CBox_arrBranch, GUICtrlCreateCheckbox (StringRight($arrBranch[$iCount + 1], StringLen($arrBranch[$iCount + 1]) - 1), $WinWidth / 2 + 20, 35 + $iCount * 20))
			GuiCtrlSetState($CBox_arrBranch[$iCount + 1],$GUI_DISABLE)
		Else
			_ArrayAdd($CBox_arrBranch, GUICtrlCreateCheckbox ($arrBranch[$iCount + 1], $WinWidth / 2 + 20, 35 + $iCount * 20))
			GUICtrlSetState( $CBox_arrBranch[$iCount + 1], $GUI_CHECKED)
		EndIf

	Next

	$CBox_arrBranch[0] = $arrBranch[0]
EndFunc