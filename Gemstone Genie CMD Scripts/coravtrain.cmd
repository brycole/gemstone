#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routinemagebuffs
			
initialize: 
	### When changing area locations, update gosub RUNHIDE, RETURNHOME
	
	put #log >ExpLogR *********
	put #log >ExpLogR Login time/date.
	put #log >ExpLogR $datetime
	#var resonance 2
	#var ignorerooms 2

	var baseprep 1
	var maxcreature 7
	var collect rock
	var lowmana 0
	var globalexp 15
	var killmob XXX
	var monster1 bear
	var monster2 goblin
	var monster3 togball
	
	## ** tingle mob
	var monster4 ogre
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
	var camb medallion
	var docharge 5
	var dokill skinning
	var doarise 0
	
	gosub powercheck
	
#*********          *********
#*********  Corav   *********
#*********          *********

Corav:
	gosub spellfactor_check
	gosub heavy.wear
	gosub m.inputlock
	gosub spellstance 130 100 70
	gosub emptyhands
	
	action put #echo >log Red Gem pouch is full when ^The \w+ \w+ pouch is too full
	gosub put.1 "fill my pou with my back" "^You fill|^There aren't|is too full to fit any more gems|^You open"
	action remove ^The \w+ \w+ pouch is too full
	
	var Fissure Off
	
	if $roomid = 331 then goto combatstart
	
	gosub returnhome

#	send .repair
#	waitfor @repair done.
	
## ** Climbing/Swimming Start
	gosub move 598
	gosub fillcamb
	gosub move 346
	gosub velaclimb
	gosub returnhome

## ** Move to combats
	combatstart:
	gosub findcombatroom
	if %playerhere = 1 then goto combatbypass

## ** Combat start
	var Fissure off
	
## ** TM training
	var tmcast 1
	var death 0
	gosub tm.fight
	gosub tactics.start
	
## ** Weapon train start	
	gosub ht.fight
	gosub hb.fight
	gosub pole.fight

## ** Spell training in combat
	gosub m.inputlock
	gosub start.magiclearn
	
## ** Leave combat
combatbypass:

	gosub flee
	gosub emptyhands
	gosub returnhome
	
## ** Sell skins
## ** Not needed while climbing in town.
	if $zoneid = 4 then gosub move 14
	#if $zoneid = 62 then gosub move 101
	gosub returnhome
	
## ** Lore location	
	gosub move 598
	
	var Fissure off
	gosub put.1 "cough" "^You cough"
	gosub checkplayer
	if %playerhere = 1 then gosub move 597
	#gosub checkplayer
	#if %playerhere = 1 then goto lorebypass
	
	gosub fissurecheck
	gosub fillcamb
	gosub aethercheck
	
## ** Summon training
	gosub summon.start
	gosub put.1 "dance silly" "^You leap"
	
	gosub fissurecheck
	gosub aethercheck
	
# Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "armor book" 1 9
	gosub put stow my book
	gosub m.inputooks "carv book" 1 5
	gosub put stow my book
	gosub endskill Scholarship
	
	gosub fissurecheck
	gosub aethercheck
	
mechtraining:	
# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub startskill Mechanical_Lore
	gosub m.inputraid vine sfsf bin
	gosub endskill Mechanical_Lore
	
	gosub fissurecheck
	gosub aethercheck
	
## ** Forage & Perception training
	var collect rock
	gosub startcollect 9999999
	
lorebypass:
	gosub move 510
	gosub move 49
	gosub m.inputankrun

	gosub repairall
	gosub coravheal
	gosub returnhome
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Corav

exit
include routinecommon.cmd 
include routinecombat.cmd
include routinemagebuffs.cmd