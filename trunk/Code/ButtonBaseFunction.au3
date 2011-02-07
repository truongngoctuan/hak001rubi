;xu ly click chuot vao button
Func ButtonControlClick($ArgTitle, $ArgText, $ArgButtonID)
	;chinh sang mode relative voi client cua window hien tai
	AutoItSetOption ("MouseCoordMode", 2)
	; $array[0] = X position
	; $array[1] = Y position
	; $array[2] = Width
	; $array[3] = Height
	Local $pos = ControlGetPos($ArgTitle, $ArgText, $ArgButtonID)

	MouseMove($pos[0] + $pos[2] / 2, $pos[1] + $pos[3] / 2)

	ControlClick($ArgTitle, $ArgText, $ArgButtonID, "left");click

	; tra ve relative binh thuong
	AutoItSetOption ("MouseCoordMode", 1)
EndFunc