#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>
#include <GetBusinessReportDailyAllBranch.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$mainwindow = GUICreate("DailyReport - Finance", 500, 300)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
;GUICtrlCreateLabel("Hello world! How are you?", 30, 10)

;~ $var = FileOpenDialog("Choose a file", "C:\Windows\", "Images (*.jpg;*.bmp)", 1 + 4 )

;~ If @error Then
;~     MsgBox(4096,"","No File(s) chosen")
;~ Else
;~     $var = StringReplace($var, "|", @CRLF)
;~     MsgBox(4096,"","You chose " & $var)
;~ EndIf

;-- ctrl
GUICtrlCreateLabel("From Date:", 10, 10)
$DP_FromDate = GUICtrlCreateDate ( "", 75, 8, 90, 20, $DTS_SHORTDATEFORMAT)

GUICtrlCreateLabel("To Date: ", 10, 40)
$DP_ToDate = GUICtrlCreateDate ( "", 75, 36, 90, 20, $DTS_SHORTDATEFORMAT)

;-- bt kich hoat chuong trinh
$okbutton = GUICtrlCreateButton("OK", 220, 200, 60)
GUICtrlSetOnEvent($okbutton, "OKButton")

GUISetState(@SW_SHOW)

While 1
  Sleep(1000)  ; Idle around
WEnd

Func OKButton()
  ;Note: at this point @GUI_CTRLID would equal $okbutton,
  ;and @GUI_WINHANDLE would equal $mainwindow
  ;MsgBox(0, "GUI Event", "You pressed OK!")
  ;MsgBox(0, "Date", GUICtrlRead($DP_FromDate))

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
		GetBusinessReportOneDay($NewDate[3], $NewDate[2], $NewDate[1])
	Next

;~ 	For $x = $FromDate[1] to $ToDate[1]
;~ 		;MsgBox(0, "234", $x)
;~ 		GetBusinessReportOneDay($x, $FromDate[2], $FromDate[3])
;~ 	Next

EndFunc

Func CLOSEClicked()
  ;Note: at this point @GUI_CTRLID would equal $GUI_EVENT_CLOSE,
  ;and @GUI_WINHANDLE would equal $mainwindow
  ;MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting...")
  Exit
EndFunc