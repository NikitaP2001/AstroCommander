include main.inc
include time.inc

.data

frame_rate      dd 34
startTicks      dd 0

.code

TimerStart proc
	sub rsp, 28h                						
	
	invoke GetTickCount
	mov startTicks, eax
	
	add rsp, 28h
	ret
TimerStart endp

TimerDelay proc
	sub rsp, 28h
	
	invoke timer_get_ticks
	cmp eax, frame_rate
	jae @end
	
	mov ecx, frame_rate
	sub ecx, eax
	invoke Sleep, ecx
@end:
	
	add rsp, 28h
	ret
TimerDelay endp

timer_get_ticks proc
	sub rsp, 28h

	invoke GetTickCount
	sub eax, startTicks

	add rsp, 28h
	ret
timer_get_ticks endp


END