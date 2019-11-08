#debuglevel 10

gosub routinecommon
gosub routinecombat
gosub routinenecrobuffs
gosub routinesteal
gosub routinebox

var monitor no
var resonance climbing
put #var bundle 1
var tmcast 0
var baseprep 1
var ritual preserve
var mob1 %2
var mob2 shaman
var death 0
var cman draw
var noskin 1

kill.now1:
	gosub leslice.combo
	var cman draw
kill.loop1:
	if "$preparedspell" = "None" then gosub prep cf
	if $monstercount < 1 then gosub pause 1
	if "%weaponrange" = "melee" then
	{
		if (("$righthandnoun" != "jambiya") && ("$lefthandnoun" != "jambiya")) then 
		{
			gosub emptyhands
			gosub get my jamb
		}
		gosub put.1 "%cman %1" "%cman.msg"
	}
		else gosub pause 1
	if contains("$roomobjs", "appears dead") then
	{
		gosub put.1 "perform consume on %mob1" "^Roundtime"
		#gosub put.1 "harness 7" "^Roundtime"
		put #ECHO CAST BODY PART NOW
		put #BEEP
		put health
		waitfor You gesture
		put loot
		put health
		goto kill.loop1
	}
	goto kill.loop1

exit
include routinecommon.cmd 
include routinecombat.cmd
include routinenecrobuffs.cmd
include routinesteal.cmd
include routinebox.cmd