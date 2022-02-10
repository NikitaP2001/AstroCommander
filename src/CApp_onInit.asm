include main.inc
include CApp_onInit.inc
include CApp.inc

.code

CApp_onInit proc
LOCAL   dwStatus:DWORD
LOCAL	XScreen:DWORD
LOCAL	YScreen:DWORD
	sub rsp, 28h        
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
	mov hWnd, eax
		
	invoke GetDC,eax
	mov window, eax
	
	; Create virual vindow
	invoke CreateCompatibleDC
	invoke CreateCompatibleBitmap,dword ptr window,XScreen,YScreen
	
	mov eax, dwStatus
	ret
CApp_onInit endp





END