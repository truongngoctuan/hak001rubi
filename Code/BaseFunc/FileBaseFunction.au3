#include <Array.au3>

Func ReadArrayDataFromFile($ArgFileName)
	Local $file = FileOpen($ArgFileName, 0)
	Local $ArrDataFromFile[1]
	$ArrDataFromFile[0] = 0

	; Check if file opened for reading OK
	If $file = -1 Then
		MsgBox(0, "Error", "Unable to open file.")
		Exit
	EndIf

	; Read in 1 character at a time until the EOF is reached
	While 1
		$line = FileReadLine($file)
		If @error = -1 Then ExitLoop
		;MsgBox(0, "Line read:", $line)

		If StringLeft ($line, 1) == ";" Then
			;donothing
		Else
			$ArrDataFromFile[0] += 1;
			_ArrayAdd($ArrDataFromFile, $line)
			EndIf
	Wend

	FileClose($file)

	;_ArrayDelete($ArrDataFromFile, 0)
	;_ArrayDisplay($ArrDataFromFile, "Data From File")

	Return $ArrDataFromFile
EndFunc
