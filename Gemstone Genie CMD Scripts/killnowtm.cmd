#debuglevel 10

gosub routinecommon
gosub routinecombat
gosub routinenecrobuffs
gosub routinesteal

var mob1 %1
var mob2 shaman
var death 0
var cman draw
var noskin 1
var castcamb 1
var camb medallion

gosub dodge attack

kill.loop1:
	if $monstercount < 1 then 
	{
		if "$preparedspell" != "None" then gosub release
		delay 1
		goto kill.loop1
	}		
	gosub put.2 "prep acs" "target %2" "^You begin"
	delay 9
	gosub cast
	if contains("$roomobjs", "appears dead") then
	{
		if "$preparedspell" != "None" then gosub release
		goto necrohealnow
		#gosub castbuff Consume Flesh 12 20 20
		#gosub put.1 "perform consume on %mob1" "^Roundtime"
		#gosub spelldelay
		#var castcamb 1
		#gosub checkhealth
		#gosub cast %healnow
	}
	goto kill.loop1
kill.search1:
	if %clean = 1 then goto donehealing
	gosub put.1 "loot" "^You search"
	if $monstercount > 0 then gosub put.1 "face next" "^You turn|^There is nothing"		
	goto kill.loop1
	
donehealing:
	echo Done healing!
	echo Returning to script.
	gosub returnhome
	send .keldustrain
	
exit
include routinecommon.cmd 
include routinecombat.cmd
include routinenecrobuffs.cmd
include routinesteal.cmd
include routinebox.cmd
include routinenecroheal.cmd