#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>
#include <GetBusinessReportDailyAllBranch.au3>
#include <EditConstants.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$WinWidth = 400
$WinHeight = 225
$mainwindow = GUICreate("DailyReport - Finance", $WinWidth, $WinHeight)
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
$arrBranch = ReadArrayDataFromFile("Branch.txt")
;_ArrayDisplay($arrBranch, "Data From File")
;can them $arrCheckedBranch de quan ly
Dim $CBox_arrBranch[1]
;FOR $OneBranch IN $arrBranch
For $iCount = 0 To $arrBranch[0] - 1 Step 1
	_ArrayAdd($CBox_arrBranch, GUICtrlCreateCheckbox ($arrBranch[$iCount + 1], $WinWidth / 2 + 20, 35 + $iCount * 20))
	GUICtrlSetState( $CBox_arrBranch[$iCount + 1], $GUI_CHECKED)
Next

$CBox_arrBranch[0] = $arrBranch[0]

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
	GUISetState(@SW_MINIMIZE)

	Local $FromDate
	Local $FromTime
	_DateTimeSplit(GUICtrlRead($DP_FromDate), $FromDate, $FromTime)

	Local $ToDate
	Local $ToTime
	_DateTimeSplit(GUICtrlRead($DP_ToDate), $ToDate, $ToTime)
	;datediff va dateadd nhan kieu du lieu la: "YYYY/MM/DD[ HH:MM:SS]"
	Local $DDiffFromDateToDate = _DateDiff( 'D', StringFormat("%04d/%02d/%02d", $FromDate[3], $FromDate[2], $FromDate[1]), StringFormat("%04d/%02d/%02d", $ToDate[3], $ToDate[2], $ToDate[1]))
	For $x = 0 to $DDiffFromDateToDate
		;MsgBox(0, String($x), _DateAdd('D', $x, StringFormat("%04d/%02d/%02d", $FromDate[3], $FromDate[2], $FromDate[1])))

		;-- NewDate
		Local $NewDateTime = _DateAdd('D', $x, StringFormat("%04d/%02d/%02d", $FromDate[3], $FromDate[2], $FromDate[1]))
		Local $NewDate
		Local $NewTime
		_DateTimeSplit($NewDateTime, $NewDate, $NewTime)

		;MsgBox(0, "Date1", $NewDate[1])
		;MsgBox(0, "Date2", $NewDate[2])
		;MsgBox(0, "Date3", $NewDate[3])
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
			_ArrayDisplay($arrCheckedBranch, "Data From File")
			;GetBusinessReportOneDay($NewDate[3], $NewDate[2], $NewDate[1], GUICtrlRead($Edit_Path), $arrCheckedBranch)
			EndIf
	Next

	GUISetState(@SW_SHOW)
EndFunc

;------------------------------------------------------------------------------
Func BtAddBranch()
	;hein notepad cho phep chinh suabranch
	Run("notepad.exe Branch.txt")
	;nap lai danh sach branch
EndFunc

;------------------------------------------------------------------------------
Func BrowseButton()
	Local $var = FileSelectFolder("Choose a folder.", "")
	GUICtrlSetData ($Edit_Path, $var)
EndFunc

;------------------------------------------------------------------------------
Func CLOSEClicked()
  ;Note: at this point @GUI_CTRLID would equal $GUI_EVENT_CLOSE,
  ;and @GUI_WINHANDLE would equal $mainwindow
  ;MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting...")
  Exit
EndFunc