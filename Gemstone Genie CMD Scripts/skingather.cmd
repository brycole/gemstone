#debuglevel 10

gosub routinecommon
gosub routinecombat
gosub routinemagebuffs

	var baseprep 1
	var maxcreature 7
	var collect rock
	var lowmana 0
	var globalexp 15
	var killmob XXX
	var monster1 bear
	var monster2 goblin
	var monster3 togball
	var monster4 snowbeast
	var killmob1 XXX
	var parryweapon dagger
	var helm helm
	var glove sleeve
	var evasion 82
	var loot treasure
	var saferoom 63
	var manasong 1
	var exitnow 0
	var ritualon 0
	var noskin 0
	var arise 0
	var castcamb 1
	var camb anklet
	var docharge 5
	var dokill skinning
	var doarise 0

skin.fight:
	gosub parry attack
	var cman slice
skin.loop:
	if "%Zephyr" = "off" then gosub castbuff Zephyr 15 30 12
	if "%Substratum" = "off" then gosub castbuff Substratum 20 35 21
	if $monstercount > 0 then gosub tmcheck
	if $monstercount > 0 then gosub tmcheck
	if ("%weaponrange" = "melee") then
	{
		if $monstercount < 1 then gosub pause 1
		if (("$righthandnoun" != "scythe") && ("$lefthandnoun" != "scythe")) then 
		{
			gosub emptyhands
			gosub put.1 "rem scythe" "%wear.msg"
		}
		if "$righthandnoun" = "scythe" then gosub put.1 "%cman" "%cman.msg"
	}
		else
		{
			if (($monstercount > 0) && (%advance = 0)) then gosub adv
				else gosub pause 1
		}
	gosub deathcheck
	gosub ppcheck
	goto skin.loop
skin.exit:
	put #beep
	gosub emptyhands
	
return


exit
include routinecommon.cmd 
include routinecombat.cmd
include routinemagebuffs.cmd