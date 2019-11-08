action goto delay2 when You have not pondered your last observation sufficiently.
action goto end when Too many futures cloud your mind - you learn nothing.
action goto observe when You see nothing regarding the future.

put get my tele
pause

observe:
	put center tele on %1
	pause
	put peer tele
	pause

delay1:
	echo 3 minute timer.	
	delay 180
	goto observe
	pause

delay2:
	echo 15 second timer.
	delay 15
	goto observe

end:
	put #parse observe1.cmd done.
	put #beep
echo Observation pool for %1 is FULL!
put stow tele