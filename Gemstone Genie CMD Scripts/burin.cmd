#debuglevel 10

gosub routinecommon
gosub routinemoonbuffs

var sigil sigil
var imbuespell unleash
var resonance climbing
var monitor no

action var sigilstudy $0 when (Guiding your fingers .+)

burin:

	gosub sigilbook blue 7 Nightingale
	#gosub sigil.sky Yavash
	#gosub sigilbook black 6 Wren

exit

sigilbook:
	var sigilcolor $1
	var pagenumber $2
	var sigilobject $3
	if "$1" = "blue" then gosub get sigil from canvas sack
	if "$1" = "black" then gosub get sigil from bag
	gosub put.1 "open sigil" "^You carefully"
	var sigilpage 1
	gosub sigil.turnpage $2
	gosub sigil.study
	gosub sigil.bind
return
		
sigil.turnpage:
	gosub put.1 "turn sigil" "^Roundtime"
	math sigilpage add 1
	if $1 = %sigilpage then return
		else goto sigil.turnpage

sigil.study:
	gosub put.1 "read sigil" "^Roundtime"
	if contains("%sigilstudy", "%sigilobject") then gosub put.1 "study sigil" "^Roundtime"
return
	
sigil.bind:
	gosub get burin
	gosub put.1 "trace burin" "^Roundtime"
	gosub prep %imbuespell 15
	delay 5
	gosub cast burin
	if "$1" = "blue" then gosub put.1 "put sigil in canvas sack" "%stow.msg"
	if "$1" = "black" then gosub put.1 "put sigil in bag" "%stow.msg"
	gosub put.1 "focus burin" "^Roundtime"
	gosub put.1 "focus burin" "^Roundtime"
return		

sigil.sky:
	gosub put.1 "study $1"
	gosub sigil.bind
return
	
include routinecommon.cmd
include routinemoonbuffs.cmd