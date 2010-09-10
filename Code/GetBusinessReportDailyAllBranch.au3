#include <BaseFunc\BOReportFunction.au3>
#include <BaseFunc\ClickFunction.au3>
#include <BaseFunc\FileBaseFunction.au3>

Func GetBusinessReportOneDay($ArgDay, $ArgMonth, $ArgYear)
	WinWaitActive("[CLASS:ThunderRT6MDIForm]")
	;-- truy cap vao menu bao cao -- tai chinh
	Send("^w"); phim tat

	;-- for...
	$arrBranch = ReadArrayDataFromFile("Branch.txt")
	;_ArrayDisplay($arrBranch, "Data From File")

	FOR $OneBranch IN $arrBranch
		;-- cung cap thong tin cho form bao cao hhct
		;SetReportGoodsDetailsArg($OneBranch, 1, 9, 2010, 1, 9, 2010, True)
		SetReportGoodsDetailsArg($OneBranch, $ArgDay, $ArgMonth, $ArgYear, $ArgDay, $ArgMonth, $ArgYear, True)

		;-- luu bao cao
		Sleep(5000);
		Local $Path = "C:\" & $OneBranch & " " & String($ArgYear) & String($ArgMonth) & String($ArgDay)
		GetReportWithAvailablePath($Path)
	NEXT
		;-- tat form
		Click(2, 277, 174);click va`o nut dong y
		Sleep(100)
EndFunc

