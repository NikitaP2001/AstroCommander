IFNDEF CAPP_INC
CAPP_INC EQU CAPP_INC

EXTERNDEF       szGameTitle:BYTE

EXTERNDEF		hWnd:HANDLE  		; console window handle
EXTERNDEF 		hInstance:HANDLE	; module handle
EXTERNDEF 		window:HDC 			; console window device context
EXTERNDEF		screen:HDC			; virtual screen device context
EXTERNDEF 		screenBmp:HDC		
EXTERNDEF 		bmpOld:HDC

EXTERNDEF		hBackground:HDC		; bachground bitmap handle

CApp_onExecute  PROTO

; resources
IDI_BACKGROUND		   	equ 	100


; game states
STATE_NULL              equ     0
STATE_TITLE             equ     1
STATE_ROOM_FIRST        equ     2
STATE_ROOM_SECOND       equ     3
STATE_ROOM_THIRD        equ     4
STATE_ROOM_COMPLETED    equ     5
STATE_EXIT              equ     6

EXTERNDEF	room_width:DWORD
EXTERNDEF	room_height:DWORD

WINDOW_WIDTH			equ		80
WINDOW_HEIGHT			equ		40

EXTERNDEF id_state:DWORD
EXTERNDEF next_state:DWORD

cimg_load_bmp PROTO hInst:QWORD, idBmp:DWORD, img_w:DWORD, img_h:DWORD

cimg_draw_bmp PROTO hBmp:HDC,hScreen:HDC,x:DWORD,y:DWORD,w:DWORD,h:DWORD

ENDIF