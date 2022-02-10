include main.inc
include CApp_OnQuit.inc
include CApp.inc

.code

CApp_OnQuit proc

	; Release virtual window
	invoke SelectObject,dword ptr screen,dword ptr bmpOld
	invoke DeleteDC,dword ptr screen
	invoke DeleteObject,dword ptr screenBmp
	
	invoke ReleaseDC,dword ptr hWnd,dword ptr window

CApp_OnQuit endp



END