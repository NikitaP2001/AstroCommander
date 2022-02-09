IFNDEF CAPP_INC
CAPP_INC EQU CAPP_INC

EXTERNDEF       szGameTitle:BYTE

CApp_onExecute  PROTO

; game states
STATE_NULL              equ     0
STATE_TITLE             equ     1
STATE_ROOM_FIRST        equ     2
STATE_ROOM_SECOND       equ     3
STATE_ROOM_THIRD        equ     4
STATE_ROOM_COMPLETED    equ     5
STATE_EXIT              equ     6

EXTERNDEF id_state:DWORD
EXTERNDEF next_state:DWORD

ENDIF