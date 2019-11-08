#debuglevel 10

if $connected = 0 then goto playtime
	
	gosub routinecommon
	gosub routinecombat
	gosub routineclericbuffs
	gosub routinepvpalerts
			
initialize: 
	action var learning 1 when ^Stoh begins to lecture you
	### When changing area locations, update gosub RUNHIDE, RETURNHOME
	
	put #log >LoginTimes ********* 
	put #log >LoginTimes Login time/date.
	put #log >LoginTimes $datetime
	put #var monitor ""
	var resonance

	var learning 0
	var baseprep 1
	var collect rock
	var playsong off
	var lowmana 0
	var startexp 15
	var globalexp %startexp
	var killmob XXX
	var killmob1 XXX
	var monster1 giant
	var monster2 dryad
	var monster3 nyad
	var monster4 angiswaerd
	var parryweapon spear
	var helm bala
	var gloves gloves
	var evasion 80
	var loot treasure
	var saferoom 44
	var exitnow 0
	var ritualon 0
	var noskin 0
	if %noskin = 1 then put #echo >log Green Skinning is off.
	var arise 0
	var docamb 1
	var camb fox
	var docharge 10
	var start.docharge 10
	var dokill skinning
	var container1 back
	var container2 haver
	var doarise 0
	var getdirt 0
	var spelluproom 0
	var collectmagic 0
	var arrange.first part
	var arrange.second part
	var loreroom 33
	var loreroomsecond 29
	var homezone 4
	var trainarmor.var 0
	var incombat 0
	var bowtype shortbow
## put #var priorityskill XXX  -  This is currently set in game. Not automatically.
	put #var dopriority 1
	var currentbleeder left arm
	var startresearch 1
	var researchloop 1
	var first.research Utility
	var second.research Augmentation
	var third.research Warding
	var 1research Utility
	var 2research Augmentation
	var 3research Warding
	var tmdelay 15
	var playtype psalm halting
	put #var pvpalert no
	
	if $tmoff = 1 then put #echo >log Red TM is OFF. Use tmoff variable to turn on.
	if $debiloff = 1 then put #echo >log Red Debilitation is OFF. Use debiloff variable to turn on.
	if $tacticsoff = 1 then put #echo >log Red Tactics is OFF. Use tacticsoff variable to turn on.

	gosub release
	gosub powercheck

	
#*********          *********
#*********  Kaislan  *********
#*********          *********

	

	#send .repair
	#waitfor @repair done.
	
Kaislan:
	var doresearch 0
	var incombat 0
	gosub emptyhands
	gosub trainarmor wear
	gosub dodge
	gosub spellstance 130 100 70
		
if "%1" = "magic" then goto magicnow
if "%1" = "start" then goto start
if "%1" = "combat" then goto combatnow
if "%1" = "bypass" then goto bypasscombat

## ** Sell and do rituals
	if "$zoneid" = "127" then gosub move 510
	if "$zoneid" = "126" then gosub move 49
	gosub sellcheck
	gosub arearituals
	gosub returnhome

start:
## ** Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	var garbage 0
	gosub braid grass
	var garbage 0

## ** Train Athletics via Swimming
	if $Athletics.LearningRate < %globalexp then gosub swimnow
	
## ** Start combat section
## ** Use exp skil names and weapon names
combatnow:
	var maxcreature 4
	var maxcreature.area 4
	var mincreature.start 2
	var specialmove 1
	var doresearch 0
	gosub arearituals
	gosub release
	gosub startcombat Twohanded_Edged sword
	gosub startcombat Bow %bowtype
	gosub startcombat Crossbow crossbow
	gosub startcombat Small_Edged axe
	gosub startcombat Light_Thrown axe
	gosub startcombat Heavy_Thrown spear
	gosub startcombat Brawling NONE
	#gosub flee
## ** Frost angis exits
	gosub move 250
	gosub put.2 "remove skates" "stow skates" "^You put your"
	gosub move 29
	gosub release
	gosub arearituals
	
bypasscombat:
	
	var doresearch 0
	gosub assess
			
## ** Train perception while spell training. Uses perception learning.
	#var doresearch 0
	#var collectmagic 1
	#gosub start.magiclearn

## ** Magic training, uses magic magic learning.
magicnow:
	var doresearch 0
	gosub start.magiclearn
	
## ** Forage & Perception training, in case perception doesn't lock during magic.
	gosub arearituals
	var doresearch 1
	var collect rock
	gosub startcollect 9999999	

## ** Scholarship training - $1 first chapter, $2 last chapter
	gosub books "weapon book" 1 9
	gosub books "armor book" 1 4
	
	if "%1" != "" then 
	{
		send .kaislantrain
		exit
	}
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 33
	goto Kaislan

exit
include routinecommon.cmd 
include routinecombat.cmd
include routineclericbuffs.cmd
include routinepvpalerts.cmd