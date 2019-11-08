#debuglevel 10

	gosub routinecommon
	gosub routinemoonbuffs
	gosub routineenchant

	var item %1 %2
	var totalitem %3
	var itemcount 0
	
cj.loop:
	if %itemcount >= %totalitem then goto cj.exit
	gosub get %item from bag
	gosub prep imbue 10
	delay 5
	gosub cast %item
	gosub prep imbue 10
	delay 5
	gosub cast %item

	gosub sigil.check white 8 Phoenix
	gosub sigil.check blue 7 Boar
	
	gosub put.1 "put my %item in wove sack"
	#gosub put.1 "focus %item" "^Roundtime"
	
	math itemcount add 1
	goto cj.loop
cj.exit:
	echo %itemcount CJ's made.
	
	exit

include routinecommon.cmd
include routinemoonbuffs.cmd
include routineenchant.cmd