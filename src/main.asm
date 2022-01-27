include main.inc
include CApp.inc



.code

main proc
        sub rsp, 30h
        
        invoke CApp_onExecute
        
        invoke ExitProcess,eax
        
        ret
main endp


END