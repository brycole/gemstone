#debuglevel 10

gosub routinecommon

	var monitor atk
	var monitor no
	var resonance 2
	var ignorerooms 2
var weapon %1
var grind 1
var rub 0

action var grind 1 when ^The grindstone begins to lose|the grinding wheel slows down|^The stone wheel slows down|begins to lose momentum
action var grind 0 when keeping it spinning fast\.$
action var rub 1 when ^The grinding has left many nicks 
action var oil 1 when the metal now needs protection

#gosub put.2 "get my weapon book" "turn book to chapter 10" "^You turn|^The book is"
#gosub put.2 "turn my book to page 3" "Study book" "^Roundtime"
#gosub put.1 "stow book" "^You put"

goto do.grind

do.push:
	if %oil = 1 then goto do.oil
	if %rub = 1 then goto do.rub
	if %grind = 1 then goto do.grind
	gosub put.1 "push grind with my %weapon" "^Roundtime"
	goto do.push

do.grind:
	if %grind = 1 then 
		{
			gosub put.1 "turn grind"
			goto do.grind
		}
	goto do.push
	
do.rub:
	var rub 0
	gosub put.2 "get my brush" "rub %weapon with brush" "^Roundtime"
	gosub put.1 "stow brush" "^You put"
	goto do.push

do.oil:
	gosub put.2 "get my oil" "pour my oil on my %weapon" "^Roundtime"
	gosub put.2 "stow my oil" "app my %weapon careful" "^Roundtime"
	
	echo WEAPON IS BALANCED!
	exit
	
include routinecommon.cmd 	
	