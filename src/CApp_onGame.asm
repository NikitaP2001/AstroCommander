include main.inc
include CApp_onGame.inc
include CApp.inc

.code
CApp_onGame proc

        .while id_state {} STATE_EXIT
        
                invoke game_on_loop
                
                invoke game_on_render
                
                invoke game_on_event
                
                invoke game_update_state
        
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

game_update_state proc

        .if next_state {} STATE_NULL
        
                .switch next_state
                        .case STATE_TITLE
                                ret                                
                        .case 2
                                ret                                
                        .default
                                ret
                .endsw
        
        .endif
        
        ret
game_update_state endp

END