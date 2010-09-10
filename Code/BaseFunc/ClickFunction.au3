Func Click($ArgMode, $ArgCoordX,$ArgCoordY)
	;chinh sang mode relative voi client cua window hien tai
	AutoItSetOption ("MouseCoordMode", 2)
	MouseClick ( "left", $ArgCoordX, $ArgCoordY)
	;tra ve relative binh thuong
	AutoItSetOption ("MouseCoordMode", 1)
EndFunc

