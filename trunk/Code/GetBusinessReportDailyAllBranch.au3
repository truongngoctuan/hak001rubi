#include <BaseFunc\BOReportFunction.au3>
#include <BaseFunc\ClickFunction.au3>
#include <BaseFunc\FileBaseFunction.au3>

WinWaitActive("[CLASS:ThunderRT6MDIForm]")
;-- truy cap vao menu bao cao -- tai chinh
Send("^w"); phim tat

;-- for...
$arrBranch = ReadArrayDataFromFile("Branch.txt")
FOR $OneBranch IN $arrBranch
    ;-- cung cap thong tin cho form bao cao hhct
	SetReportGoodsDetailsArg("NT", 1, 9, 2010, 1, 9, 2010, True)

	;-- ok
	Click(2, 95, 175)

	;-- luu bao cao
	Local $Path = $OneBranch & " " & String(2010) & String(9) & String(1)
	GetReportWithAvailablePath($Path)

	;-- tat form
	Sleep(200)
	Click(0, 355, 11);click va`o nut dong y
	Sleep(100)
NEXT


