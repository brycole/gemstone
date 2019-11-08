#debuglevel 10

gosub routinecommon

action goto foundmaterial when (animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|platinum) (\w*)

var monitor atk
var monitor no
var resonance 2

riverhaven:
	var movex 0
	var movelist nw|ne|se|n|go root|n|n|n|nw|se|ne|sw|e|e|ne|go niche|out|sw|w|w|n|go pass|null|n|n|e|sw|ne|nw|nw|w|s|nw|ne|ne|up|ne
	var minelist yy|yy|yy|y|y|y|y|y|yy|nn|yy|nn|y|y|yy|y|n|nn|n|n|y|n|y|y|y|y|yy|nn|yy|yy|y|y|yy|nn|yy|yy|yy

	gosub move 45
	gosub put.1 "prospect" "^Roundtime"
	gosub moveto
	
	Echo mining done!

moveto:
	if %movelist(%movex) = "go pass" then put kneel
	matchre waitroom ^Please rephrase
	matchre moveto.pause %rtwait
	matchre minecheck ^Obvious
	matchre engaged ^You are engaged
	matchre webbed ^As you start to move,|^You can't do that while
	put %movelist(%movex)
	matchwait
moveto.pause:
	pause .1
	goto moveto

webbed:
	delay 5
	goto moveto	

minecheck:
	if ((%minelist(%movex) = "yy") || ((%minelist(%movex) = "y")) then gosub put.1 "prospect" "^Roundtime"
	math movex add 1
	goto moveto

engaged:
	gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	goto moveto

waitroom:
	delay 1
	waitforre ^Obvious
	gosub put.1 "dance silly" "^You leap"
	goto minecheck
	
foundmaterial:
	put #beep
	put #beep
	put #beep
	echo Found material!
	gosub put.1 "get my shovel" "^You get"
	gosub rel
	send .mine
	waitfor @DONE
	gosub emptyhands
	math movex add 1
	goto moveto
	
exit
include routinecommon.cmd	