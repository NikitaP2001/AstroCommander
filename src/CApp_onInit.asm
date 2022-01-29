include main.inc
include CApp_onInit.inc
include CApp.inc

.code

CApp_onInit proc
LOCAL   dwStatus
        sub rsp, 28h        
        mov  dwStatus, 1
        
        invoke SetConsoleTitle,addr szGameTitle
        
        mov eax, dwStatus
        ret
CApp_onInit endp





END