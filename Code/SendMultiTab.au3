#include <BaseFunc\ButtonBaseFunction.au3>
#include <BaseFunc\FileBaseFunction.au3>
#include <Array.au3>

;$arr = ReadArrayDataFromFile("USP.txt")

;_ArrayDisplay($arr, "Data From File")

;WinWaitActive("[CLASS:YahooBuddyMain]")
;ControlSetText("[CLASS:YahooBuddyMain]","","[CLASS:Edit; INSTANCE:1]",$arr[0])
;ControlSetText("[CLASS:YahooBuddyMain]","","[CLASS:Edit; INSTANCE:2]",$arr[1])
;Send("{TAB}")
;Send($arr[1])
;xu ly click chuot vao button
;ButtonControlClick("[CLASS:YahooBuddyMain]", "&Sign In", "[CLASS:Button; INSTANCE:4]")

;For example, open Folder Options (in the control panel) and try the following:
;Send("{TAB}") Navigate to next control (button, checkbox, etc)
;Send("+{TAB}") Navigate to previous control.
;Send("^{TAB}") Navigate to next WindowTab (on a Tabbed dialog window)
;Send("^+{TAB}") Navigate to previous WindowTab.
;Send("{SPACE}") Can be used to toggle a checkbox or click a button.
;Send("{+}") Usually checks a checkbox (if it's a "real" checkbox.)
;Send("{-}") Usually unchecks a checkbox.
;Send("{NumPadMult}") Recursively expands folders in a SysTreeView32.

;Use Alt-key combos to access menu items. Also, open Notepad and try the following:
;Send("!f") Send Alt+f, the access key for Notepad's file menu. Try other letters!

;Send("{DOWN}") Move down a menu.
;Send("{UP}") Move up a menu.
;Send("{LEFT}") Move leftward to new menu or expand a submenu.
;Send("{RIGHT}") Move rightward to new menu or collapse a submenu.

WinWaitActive("[CLASS:vfp77400000]")

Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
;nhap gi do roi tab
Send("{ESCAPE}")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
;tk no
Send("13111")
Send("{TAB}")
Send("{TAB}")
;repeat ne`
Send("1230")
Send("{ENTER}")
Send("{RIGHT}")
;nhap so luong
Send("5")
Send("{ENTER}")
Send("{F4}");new
Sleep(500);delay
;--------------------
Send("1230")
Send("{ENTER}")
Send("{RIGHT}")
;nhap so luong
Send("50")
Send("{ENTER}")
Send("{F4}");new
Sleep(500);delay
;--------------------
Send("13001")
Send("{ENTER}")
Send("{RIGHT}")
;nhap so luong
Send("50")
Send("{ENTER}")
Sleep(500)