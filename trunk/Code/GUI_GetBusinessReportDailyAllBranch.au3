#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>

Opt("GUIOnEventMode", 1)  ; Change to OnEvent mode
$mainwindow = GUICreate("Hello World", 200, 100)
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
;GUICtrlCreateLabel("Hello world! How are you?", 30, 10)
$okbutton = GUICtrlCreateButton("OK", 70, 50, 60)
GUICtrlSetOnEvent($okbutton, "OKButton")

;-- ctrl
$DP_FromDate = GUICtrlCreateDate ( "", 5, 10, 85, 20, $DTS_SHORTDATEFORMAT)
$DP_ToDate = GUICtrlCreateDate ( "", 5, 30, 85, 20, $DTS_SHORTDATEFORMAT)

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

	For $x = $FromDate[2] to $ToDate[2]
		MsgBox(0, "234", $x)
	Next

EndFunc

Func CLOSEClicked()
  ;Note: at this point @GUI_CTRLID would equal $GUI_EVENT_CLOSE,
  ;and @GUI_WINHANDLE would equal $mainwindow
  ;MsgBox(0, "GUI Event", "You clicked CLOSE! Exiting...")
  Exit
EndFunc