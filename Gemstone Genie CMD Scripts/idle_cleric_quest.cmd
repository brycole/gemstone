
if $health < 60 then goto exitquick

gosub routinecommon

var monitor no
var resonance climbing
action goto prayvision when ^Your vision
action goto exitquick when eval $health < 50
action var god rutilor when a team of oxen
action var god saem when bartender stands off
action var god murr when yourself travelling the
action var god albreda when young child sitting
action var god lemicus when alone on a raft
action var god peri when pasty husks around
action var god kuniyo when in front of a fire
action var god beren when toiling in a dusty
action var god divy when working in front of a

goto dignow
#goto prayvision
start.idle:

	put health
	delay 20
	if "$lefthand" != "Empty" then put empty left
	delay 2
	if "$righthand" != "Empty" then put empty right
	delay 2
	
goto start.idle

prayvision:
#put #beep   
put pray %god
pause
goto start.idle

dignow:
	if $stamina > 50 then
	{
		if $standing = 0 then put stand
		put dig
		pause
	}
		else if $prone = 0 then put lie
		pause
		goto dignow


include routinecommon.cmd