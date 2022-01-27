include main.inc
include CApp.inc
include CApp_onInit.inc

.const


.data

id_state        DWORD STATE_NULL
next_state      DWORD STATE_NULL

.code

CApp_onExecute proc
LOCAL dwStatus:DWORD
        sub rsp, 30h
        
        mov dwStatus, STATE_NULL
        
        invoke CApp_onInit
        .if eax == 0
        
                invoke MessageBoxA,0,"CApp_onExecute: onInit error", \
                "Error occured",MB_OK+MB_ICONERROR
                jmp @end
                
        .endif
        
        

@end:
        mov eax, dwStatus
        ret
CApp_onExecute endp



END