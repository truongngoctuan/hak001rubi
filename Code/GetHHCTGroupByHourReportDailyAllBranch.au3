
#include <BaseFunc\BOReportFunction.au3>
#include <BaseFunc\ClickFunction.au3>
#include <BaseFunc\FileBaseFunction.au3>

Func GetHHCTGroupByHourReportOneDay($ArgDay, $ArgMonth, $ArgYear, $ArgFolderPath, $arrBranch)
	WinWaitActive("[CLASS:ThunderRT6MDIForm]")
	;-- truy cap vao menu bao cao -- tai chinh
	;khong co phim tat
	Send("!3")
	Send("{DOWN}")
	Send("{DOWN}")
	Send("{DOWN}")
	Send("{DOWN}")
	Send("{ENTER}")

	;Sleep(500)
	;-- for...
	;$arrBranch = ReadArrayDataFromFile("Branch.txt")
	;_ArrayDisplay($arrBranch, "Data From File")

	FOR $OneBranch IN $arrBranch
		;-- cung cap thong tin cho form bao cao hhct
		;SetReportGoodsDetailsArg($OneBranch, 1, 9, 2010, 1, 9, 2010, True)
		SetReportHHCTGroupByHourArg($OneBranch, $ArgDay, $ArgMonth, $ArgYear, $ArgDay, $ArgMonth, $ArgYear, True)

		;-- luu bao cao
		Sleep(15000)
		;Local $Path = "C:\" & $OneBranch & " " & String($ArgYear) & String($ArgMonth) & String($ArgDay)
		Local $Path = StringFormat("%s%s %04d_%02d_%02d", $ArgFolderPath, $OneBranch, $ArgYear, $ArgMonth, $ArgDay)
		GetReportWithAvailablePath($Path)
	NEXT
		;-- tat form
		Click(2, 277, 174);click va`o nut dong y
		Sleep(100)
EndFunc
