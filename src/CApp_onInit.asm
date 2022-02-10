include main.inc
include CApp_onInit.inc
include CApp.inc

.code

CApp_onInit proc
LOCAL   dwStatus:DWORD
	sub rsp, 28h        
	mov  dwStatus, 1
	
	invoke SetConsoleTitle,addr szGameTitle
	
	invoke SetConsoleCursorState, 0
	
	invoke SetConsoleSize,WINDOW_WIDTH,WINDOW_HEIGHT
	
	invoke SetConsoleCenterScreen,HWND_TOP
	.if eax == 0	
		SHOW_ERROR "SetConsoleCenterScreen"
	
		mov dwStatus, eax
	.endif	
	
	mov eax, dwStatus
	ret
CApp_onInit endp





END