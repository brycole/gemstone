#debuglevel 10	

if $connected = 0 then goto playtime
	
	gosub routinecommon
	gosub routinecombat
	gosub routinenecrobuffs
	gosub routinepvpalerts
			
initialize: 
	action var learning 1 when ^Stoh begins to lecture you
	### When changing area locations, update gosub RUNHIDE, RETURNHOME
	
	put #log >LoginTimes ********* 
	put #log >LoginTimes Login time/date.
	put #log >LoginTimes $datetime
	put #var monitor ""
	#var resonance roomrecovery

	var learning 0
	var baseprep 1
	var maxcreature 7
	var collect rock
	var lowmana 0
	var startexp 15
	var globalexp %startexp
	var globalexp %startexp
	var killmob XXX
	var monster1 viper
	var monster2 leucro
	var monster3 wolf
	var monster4 angiswaerd
	var killmob1 XXX
	var parryweapon spear
	var helm bala
	var gloves gloves
	var evasion 80
	var loot treasure
	var saferoom 64
	var manasong 1
	var exitnow 0
	var ritual preserve
	var ritualon 1
	var noskin 0
	var arise 0
	var castcamb 1
	var camb pivuh
	var docharge 7
	var start.docharge 7
	var dokill skinning
	var doarise 0
	var getdirt 0
	var spelluproom 0
	var collectmagic 0
	var arrange.first part
	var arrange.second part
	var loreroom 415
	var loreroomsecond 415
	var homezone 127
	var steal.yes 1
	var trainarmor.var 0
	var incombat 0
	var bowtype shortbow
## put #var priorityskill XXX  -  This is currently set in game. Not automatically.
	put #var dopriority 0
	var currentbleeder XXXright hand
	var startresearch 1
	var researchloop 1
	var first.research Warding
	var second.research Augmentation
	var third.research Arcana
	var 1research Warding
	var 2research Augmentation
	var 3research Fundamental
	
	var tmdelay 10
	
	if $tmoff = 1 then put #echo >log Red TM is OFF. Use tmoff variable to turn on.
	if $debiloff = 1 then put #echo >log Red Debilitation is OFF. Use debiloff variable to turn on.
	if $tacticsoff = 1 then put #echo >log Red Tactics is OFF. Use tacticsoff variable to turn on.
	
	gosub put.1 "open my bald" "^You open|^That is already"
	gosub powercheck
	
#*********          *********
#*********  Raelok  *********
#*********          *********

	#send .repair
	#waitfor @repair done.
	
Raelok:
	gosub emptyhands
	gosub trainarmor wear
	gosub dodge
	gosub spellstance 130 100 70
	
if "%1" = "magic" then goto magicnow
	
	gosub stealcheck
	
## ** Start combat section
## ** Skill names Thanatology, Polearms
	var minmonster.start 0
	var doresearch 0
	gosub startcombat Bow shortbow
	gosub startcombat Crossbow crossbow
	gosub startcombat Small_Edged axe
	gosub startcombat Light_Thrown axe
	gosub startcombat Polearms spear
	gosub startcombat Heavy_Thrown spear
	#gosub startcombat Thanatology spear
bypasscombat:
	gosub healcheck
	gosub stealcheck
		
## ** Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	var garbage 0
	var doresearch 1
	gosub braid vine
	var garbage 0

## ** Faldesu Swimming Directions
    if $Athletics.LearningRate < %globalexp then
	{
		gosub eotb
		if $zoneid = 4 then gosub move 264
		if $zoneid = 6 then gosub move 98
		gosub swimnow
		gosub returnhome
	}
	var doresearch 0

## ** Forage & Perception training, in case perception doesn't lock during magic.
	var collect rock
	var doresearch 1
	gosub startcollect 9999999	
	var doresearch 0
	
## ** Train perception while spell training. Uses perception learning.
	var collectmagic 1
	gosub start.magiclearn

## ** Magic training, uses magic magic learning.
magicnow:
	gosub start.magiclearn

## ** Scholarship training - $1 first chapter, $2 last chapter
	gosub books "weapon book" 1 9
	gosub books "armor book" 1 4
	
	if "%1" != "" then 
	{
		send .raeloktrain
		exit
	}
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 33
	goto Raelok

exit
include routinecommon.cmd 
include routinecombat.cmd
include routinenecrobuffs.cmd
include routinenecroheal.cmd
include routinepvpalerts.cmd