Run("C:\Program Files\Trillian\trillian.exe")
WinWaitActive("[CLASS:Trillian: Server Login]")
;chinh sang mode relative voi client cua window hien tai
AutoItSetOption ("MouseCoordMode", 2)
MouseClick ( "left", 180, 280)
;tra ve relative binh thuong
AutoItSetOption ("MouseCoordMode", 1)