include CApp_onInit.inc


.code

CApp_onInit proc
LOCAL   dwStatus
        sub rsp, 28h
        
        mov  dwStatus, 1

        
        mov eax, dwStatus
        ret
CApp_onInit endp





END