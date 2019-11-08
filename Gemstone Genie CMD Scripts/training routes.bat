#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routinenecrobuffs
	gosub routinesteal
	gosub routinemagic
			
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
	var monster3 eel
	var monster4 angiswaerd
	var killmob1 XXX
	var parryweapon sunblade
	var helm bala
	var glove gloves
	var evasion 80
	var loot treasure
	var saferoom 202
	var manasong 1
	var exitnow 0
	var ritual preserve
	var ritualon 1
	var noskin 0
	var arise 0
	var castcamb 1
	var camb medallion
	var docharge 6
	var dokill skinning
	var doarise 0
	var getdirt 0
	
	gosub powercheck
	
#*********          *********
#*********  Keldus  *********
#*********          *********

Keldus:
	gosub spellfactor_check
	gosub armor.wear
	gosub dodge
	gosub spellstance 130 100 70
	gosub emptyhands
	
	if $zoneid = 123 then goto combatstart
	
	gosub returnhome
	gosub move 196
	send .repair
	waitfor @repair done.
	
## ** Steal train and movement
#	gosub stealsetup


## ** Climbing/Swimming Start
	gosub move 598
	gosub fillcamb
	gosub move 346
	gosub velaclimb
	gosub returnhome



## ** Move to combats
	#gosub stealsetup
	gosub findcombatroom
	if %playerhere = 1 then goto combatbypass
		
	gosub reveal
## ** Combat start
combatstart:
## ** Spell training in combat
	gosub dodge	
	gosub start.magiclearn

## ** Thanatology and Skinning Training
	var tmcast 1
	var death 0
	gosub killthan.fight
	
## ** TM training
	var tmcast 1
	var death 0
	gosub tm.fight
	gosub tactics.start
	
## ** Weapon train start	
	var death 0
	var tmcast 1
	gosub le.fight
## ** Leave combat
combatbypass:

	gosub put.1 "Stop stalk" "^You stop|^You're not"
	gosub emptyhands
	gosub returnhome

	gosub stealsetup

## ** Sell skins
## ** Not needed while climbing in town.
	if $zoneid = 4 then gosub move 14
	#if $zoneid = 62 then gosub move 101
	gosub returnhome
	
	
## ** Lore location	
	gosub move 201
	gosub checkplayer
	if %playerhere = 1 then gosub move 134
	gosub checkplayer
	if %playerhere = 1 then goto lorebypass
		

## ** Turn off invis
	gosub reveal
	#gosub put.1 "teach sorc to stoh" "^You begin to lecture|^Stoh is already"
	
	#gosub start.magiclearn
	#gosub stamcheck
	gosub fillcamb
	gosub spelldelay
## ** Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub stow my book
	gosub m.inputooks "armor book" 1 5
	gosub stow my book
	gosub endskill Scholarship
	
	gosub stealsetup
	gosub move 201
	gosub checkplayer
	if %playerhere = 1 then gosub move 134
	#gosub put.1 "teach sorc to stoh" "^You begin to lecture|^Stoh is already"
	gosub reveal
	
mechtraining:	
# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub startskill Mechanical_Lore
	gosub m.inputraid grass sfsf bin
	gosub endskill Mechanical_Lore

	gosub stealsetup
	
	gosub move 201
	gosub checkplayer
	if %playerhere = 1 then gosub move 134
	gosub checkplayer
	if %playerhere = 1 then goto lorebypass
	gosub reveal
	#gosub put.1 "teach sorc to stoh" "^You begin to lecture|^Stoh is already"
	
## ** Forage & Perception training
	var collect rock
	gosub startcollect 9999999
	
lorebypass:
## ** Crossbow backtraining
	gosub reveal
	#gosub rangedcombat.start
## ** checknerves
	gosub move 7
	gosub checknerves
		
	gosub returnhome
	gosub release
	
	gosub stealsetup
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 30
	goto Keldus

exit
include routinesteal.cmd
include routinecommon.cmd 
include routinecombat.cmd
include routinenecrobuffs.cmd
include routinenecroheal.cmd