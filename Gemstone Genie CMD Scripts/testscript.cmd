debuglevel 10	
	
	gosub routinecommon
	gosub routinecombat
	gosub routinebardbuffs

initialize: 
	var monitor atk
	var monitor no
	var resonance 2
	var ignorerooms 2
	var collect rock 
	var globalexp 20
	var monster1 hog
	var stance DEF
	var skintype hoof|skin
	var ix 0



loop:

delay 5
gosub roundtimedone
goto loop

exit
    
include routinecommon.cmd 
include routinecombat.cmd
include routinebardbuffs.cmd