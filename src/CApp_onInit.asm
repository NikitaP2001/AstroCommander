include main.inc
include CApp_onInit.inc
include CApp.inc

.code

CApp_onInit proc
LOCAL   dwStatus:DWORD
LOCAL	XScreen:DWORD
LOCAL	YScreen:DWORD
	sub rsp, 28h    
	and rsp, -10h
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
	mov HANDLE ptr hInstance, rax
	.if rax == NULL
		SHOW_ERROR "GetModuleHandle"	
		mov dwStatus, eax
	.endif
	
	invoke GetConsoleWindow
	.if rax == NULL
		SHOW_ERROR "GetConsoleWindow"	
		mov dwStatus, eax
	.endif
	mov HANDLE ptr hWnd, rax
		
	invoke GetDC,rax
	.if rax == NULL
		SHOW_ERROR "GetDC"	
		mov dwStatus, eax
	.endif
	mov HDC ptr window, rax
	
	; Create virual window
	invoke CreateCompatibleDC, rax
	mov HDC ptr screen,rax
	
	invoke CreateCompatibleBitmap,qword ptr window,XScreen,YScreen
	.if rax == NULL
		SHOW_ERROR "CreateCompatibleBitmap"	
		mov dwStatus, eax
	.endif
	mov screenBmp, rax
	invoke SelectObject,qword ptr screen,rax
	mov bmpOld, rax
	
	invoke cimg_load_bmp,qword ptr hInstance,IDI_BACKGROUND
	mov hBackground, rax
	.if rax == 0
		mov dwStatus, 0
	.endif		
	
	mov eax, dwStatus
	ret
CApp_onInit endp


END