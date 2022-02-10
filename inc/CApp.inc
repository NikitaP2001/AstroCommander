IFNDEF CAPP_INC
CAPP_INC EQU CAPP_INC

EXTERNDEF       szGameTitle:BYTE
EXTERNDEF		hWnd:DWORD
EXTERNDEF 		hInstance:DWORD
EXTERNDEF 		window:DWORD
EXTERNDEF		screen:DWORD
EXTERNDEF 		screenBmp:DWORD
EXTERNDEF 		bmpOld:DWORD

CApp_onExecute  PROTO

; game states
STATE_NULL              equ     0
STATE_TITLE             equ     1
STATE_ROOM_FIRST        equ     2
STATE_ROOM_SECOND       equ     3
STATE_ROOM_THIRD        equ     4
STATE_ROOM_COMPLETED    equ     5
STATE_EXIT              equ     6

ROOM_WIDTH				equ		640
ROOM_HEIGHT				equ		480

WINDOW_WIDTH			equ		80
WINDOW_HEIGHT			equ		40

EXTERNDEF id_state:DWORD
EXTERNDEF next_state:DWORD

ENDIF