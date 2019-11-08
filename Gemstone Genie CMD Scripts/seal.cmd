#debuglevel 10

gosub routinecommon
gosub routinecombat
gosub routinemagebuffs
var monitor no
var resonance climbing
var item jerkin

loop:
	gosub get wax
	gosub put.1 "apply wax to my %item" "^Roundtime"
	gosub stow wax
	gosub get slick
	gosub put.1 "rub %item with slick" "^Roundtime"
	gosub stow slick
	goto loop


exit
include routinecommon.cmd 
include routinecombat.cmd
include routinemagebuffs.cmd