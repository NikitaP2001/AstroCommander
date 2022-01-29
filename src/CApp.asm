include main.inc
include CApp.inc
include CApp_onInit.inc
include CApp_onStart.inc
include CApp_onGame.inc
include CApp_OnQuit.inc

.const


.data

id_state        dd STATE_NULL
next_state      dd STATE_NULL

szGameTitle     db "AstroCommander", 0

.code

CApp_onExecute proc
LOCAL dwStatus:DWORD        
        sub rsp, 28h
        and rsp, -16
        
        mov dwStatus, STATE_NULL
        
        invoke CApp_onInit
        .if eax == 0
        
                invoke MessageBoxA,0,"CApp_onExecute: onInit error", \
                "Error occured",MB_OK+MB_ICONERROR
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



END