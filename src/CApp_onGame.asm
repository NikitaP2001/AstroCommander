include main.inc
include CApp_onGame.inc
include CApp.inc
include time.inc

.code
CApp_onGame proc

	.while id_state {} STATE_EXIT
	
		invoke TimerStart

		invoke game_on_loop
		
		invoke game_on_render
		
		invoke game_on_event
		
		invoke game_update_state

		invoke TimerDelay
	.endw

	ret
CApp_onGame endp

game_on_loop proc
        
        
        
	ret
game_on_loop endp

game_on_render proc


	ret
game_on_render endp

game_on_event proc


	ret
game_on_event endp

; Process updating id_state to next_state
game_update_state proc uses rbx

	.if next_state {} STATE_NULL
	
		.switch next_state
			.case STATE_TITLE
					
			.case STATE_ROOM_FIRST
					
			.case STATE_ROOM_SECOND
					
			.case STATE_ROOM_THIRD
					
			.case STATE_ROOM_COMPLETED
													 
		.endsw
		
		mov ebx, next_state
		mov id_state, ebx
		
		mov next_state, NULL
	.endif
	
	ret
game_update_state endp

END