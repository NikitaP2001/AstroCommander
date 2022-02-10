include main.inc
include CApp.inc



.code

main proc        
	sub rsp, 8h
	and rsp, -10h
	
	invoke HideConsole
	
	invoke CApp_onExecute
	
	invoke ExitProcess,eax
	
	ret
main endp


END