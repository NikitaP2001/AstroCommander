include CApp_onInit.inc


.code

CApp_onInit proc
LOCAL   dwStatus
        sub rsp, 30h
        
        mov  dwStatus, 1

        
        mov eax, dwStatus
        ret
CApp_onInit endp





END