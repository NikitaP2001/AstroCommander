include main.inc
include CApp_onInit.inc
include CApp.inc

.code

CApp_onInit proc
LOCAL   dwStatus:DWORD
LOCAL	XScreen:DWORD
LOCAL	YScreen:DWORD
	sub rsp, 28h    
	and rsp, -16
	mov  dwStatus, 1
		
	invoke GetSystemMetrics,SM_CXSCREEN
	mov XScreen, eax
	invoke GetSystemMetrics,SM_CYSCREEN
	mov YScreen, eax
	
	invoke SetConsoleTitle,addr szGameTitle
	
	invoke SetConsoleCursorState, 0
	
	invoke SetConsoleSize,WINDOW_WIDTH,WINDOW_HEIGHT
	
	invoke SetConsoleCenterScreen,HWND_TOP
	.if eax == 0	
		SHOW_ERROR "SetConsoleCenterScreen"	
		mov dwStatus, eax
	.endif	
	
	invoke GetModuleHandle,NULL
	mov hInstance, eax
	.if eax == NULL
		SHOW_ERROR "GetModuleHandle"	
		mov dwStatus, eax
	.endif
	
	invoke GetConsoleWindow
	.if eax == NULL
		SHOW_ERROR "GetConsoleWindow"	
		mov dwStatus, eax
	.endif
	mov hWnd, eax
		
	invoke GetDC,eax
	.if eax == NULL
		SHOW_ERROR "GetDC"	
		mov dwStatus, eax
	.endif
	mov window, eax
	
	; Create virual window
	invoke CreateCompatibleDC	
	mov screen,eax
	invoke CreateCompatibleBitmap,dword ptr window,XScreen,YScreen
	.if eax == NULL
		SHOW_ERROR "CreateCompatibleBitmap"	
		mov dwStatus, eax
	.endif
	mov screenBmp, eax
	invoke SelectObject,dword ptr screen,eax
	mov bmpOld, eax
	
	mov eax, dwStatus
	ret
CApp_onInit endp





END