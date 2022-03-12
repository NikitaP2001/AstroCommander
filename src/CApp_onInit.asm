include main.inc
include CApp_onInit.inc
include CApp.inc

.code

CApp_onInit proc
LOCAL   dwStatus:DWORD
LOCAL	XScreen:DWORD
LOCAL	YScreen:DWORD
LOCAL 	wndExtsz[8]:BYTE

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
	
	; Get console window size
	invoke GetConsoleWindowSize,WINDOW_WIDTH,WINDOW_HEIGHT
	mov room_height, eax
	shr rax, 32	
	mov room_width, eax			
	
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
	
	; Initilize device context
	invoke GetDC,rax
	.if rax == NULL
		SHOW_ERROR "GetDC"	
		mov dwStatus, eax
	.endif
	mov qword ptr window, rax		
	
	; Set Window extesion in logical units
	invoke SetWindowExtEx,rax,dword ptr room_width, \
	dword ptr room_height, addr wndExtsz
	invoke SetWindowExtEx,qword ptr window,dword ptr room_width, \
	dword ptr room_height, addr wndExtsz
	
	; Create virual screen
	invoke CreateCompatibleDC,qword ptr window
	mov HDC ptr screen, rax
	
	invoke CreateCompatibleBitmap,qword ptr window,XScreen,YScreen
	.if rax == NULL
		SHOW_ERROR "CreateCompatibleBitmap"	
		mov dwStatus, eax
	.endif
	mov screenBmp, rax
	invoke SelectObject,qword ptr screen,rax
	mov bmpOld, rax
	
	; Load resources
	invoke cimg_load_bmp,qword ptr hInstance,IDI_BACKGROUND, \
	dword ptr room_width,dword ptr room_height
	mov hBackground, rax
	.if rax == 0
		mov dwStatus, 0
	.endif
	
	mov eax, dwStatus
	ret
CApp_onInit endp


END