include main.inc
include CApp_OnQuit.inc
include CApp.inc

.code

CApp_OnQuit proc
	sub rsp, 28h

	invoke DeleteObject,qword ptr hBackground

	; Release virtual window
	invoke SelectObject,qword ptr screen,qword ptr bmpOld
	invoke DeleteDC,qword ptr screen
	invoke DeleteObject,qword ptr screenBmp
	
	invoke ReleaseDC,qword ptr hWnd,qword ptr window

	add rsp, 28h
	ret
CApp_OnQuit endp



END