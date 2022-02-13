include main.inc
include CApp.inc
include CApp_onInit.inc
include CApp_onStart.inc
include CApp_onGame.inc
include CApp_OnQuit.inc

.const


.data

hWnd			HANDLE  0
hInstance		HANDLE 	0
window			HDC  	0
screen			HDC 	0
screenBmp		HDC 	0
bmpOld			HDC 	0

hBackground		HDC 	0

id_state        dd STATE_NULL
next_state      dd STATE_NULL

szGameTitle     db "AstroCommander", 0

room_width		dd	0
room_height		dd  0

.code

CApp_onExecute proc
LOCAL dwStatus:DWORD 
	sub rsp, 28h
	and rsp, -10h
	
	mov dwStatus, STATE_NULL
	
	invoke CApp_onInit
	.if eax == 0
		xor eax, eax
		dec eax
		mov dwStatus, eax
		jmp @end			
	.endif
	
	invoke CApp_onStart
	
	invoke CApp_onGame
	
	invoke CApp_OnQuit

@end:
	mov eax, dwStatus
	ret
CApp_onExecute endp

; Bitmap image manipulation procs
cimg_load_bmp proc hInst:QWORD, idBmp:DWORD
	sub rsp, 28h
	and rsp, -10h
	
	invoke LoadBitmap,rcx,edx
	.if rax == NULL
		SHOW_ERROR "LoadBitmap"			
	.endif
	
@end:	

	add rsp, 28h
	ret
cimg_load_bmp endp

cimg_draw_bmp proc hBmp:HDC,hScreen:HDC,x:DWORD,y:DWORD,w:DWORD,h:DWORD
LOCAL hOldBmp:HDC
LOCAL hMemDC:HDC 
	sub rsp, 60h
	and rsp, -16
	mov hBmp, rcx
	mov hScreen, rdx
	mov x, r8d
	mov y, r9d		
	
	invoke CreateCompatibleDC,hScreen
	mov hMemDC, rax
	
	invoke SelectObject,rax,hBmp
	mov hOldBmp, rax
	
	invoke StretchBlt,hScreen,x,y,w,h,hMemDC,0,0,640,480,SRCCOPY
	.if rax == NULL
		SHOW_ERROR "StretchBlt"			
	.endif
	
	invoke SelectObject,hMemDC,hOldBmp
	invoke DeleteDC,hMemDC	
	
	ret
cimg_draw_bmp endp

END