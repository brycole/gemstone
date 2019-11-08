#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routineclericbuffs
	gosub routinesteal

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
	var lowmana 50
	var globalexp 15
	var killmob wolf
	var moblong frostweyr bear
	var monster1 mey
	var monster2 goblin
	var monster3 bear
	var monster4 togball
	#var killmob1 scout ogre
	var parryweapon dagger
	var helm helm
	var gloves sleeve
	var evasion 81
	var loot treasure
	var saferoom 63
	var manasong 1
	var exitnow 0
	var noskin 0
	var ritual preserve
	var ritualon 0
	var arise 0
	var castcamb 1
	var camb medallion
	var docharge 5
	var dokill skinning
	var doarise 0
	var getdirt 0
	var nodirt 0
		
	gosub powercheck
	
#*********          *********
#*********  Vayek   *********
#*********          *********

Vayek:
	gosub heavy.wear
	gosub m.inputlock
	gosub spellstance 130 100 70
	gosub emptyhands
		
	action put #echo >log Red Gem pouch is full when ^The \w+ \w+ pouch is too full
	gosub put.1 "fill my pou with my pack" "^You fill|^There aren't|is too full to fit any more gems|^You open"
	action remove ^The \w+ \w+ pouch is too full
	
	if $zoneid = 123 then goto combatstart
	
	gosub returnhome

## ** filling water vial
	gosub waterfill

## ** Climbing/Swimming Start
	gosub move 291
	gosub fillcamb
	gosub move 346
	gosub velaclimb
	gosub returnhome

combatstart:	
## ** Move to combats
	gosub findcombatroom
	if %playerhere = 1 then goto combatbypass

## ** Combat start

## ** Weapon train start
	gosub cyclic_check
	var death 0
	gosub pole.fight
	gosub m.inputrawl.start
	gosub ht.fight
	gosub debil.fight
## ** TM training
	var tmcast 1
	var death 0
	gosub tm.fight	
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
	
	gosub move 35
	gosub ritualaltar

loretemp:	
## ** Lore location	
	gosub move 598
	if %nodirt = 1 then gosub foragedirt
	gosub pomcast
	gosub cyclic_check
	gosub fillcamb
	
	gosub put.1 "cough" "^You cough"
	gosub checkplayer
	if %playerhere = 1 then gosub move 597
	#gosub checkplayer
	#if %playerhere = 1 then goto lorebypass

## ** Mech training
	gosub prayerbead.start
	
## ** Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "armor book" 1 9
	gosub put stow my book
	gosub m.inputooks "carv book" 1 5
	gosub put stow my book
	gosub endskill Scholarship
	
## ** Forage & Perception training
	var collect rock
	gosub startcollect 9999999
	
lorebypass:
	gosub move 510
	gosub move 49
	gosub m.inputankrun

	gosub repairall
	gosub autohealer
	#gosub move 219
	#gosub get my holy oil
	#gosub put.1 "drop


ht_temp:
## ** Throwing backtraining
#	gosub move 3
#	gosub move 206
	
	gosub returnhome
	
	gosub move 35
	gosub ritualaltar
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Vayek

exit
include routinesteal.cmd
include routinecommon.cmd 
include routinecombat.cmd
include routineclericbuffs.cmd