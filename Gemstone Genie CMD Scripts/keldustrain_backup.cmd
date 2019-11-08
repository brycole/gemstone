#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routinenecrobuffs
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
	var lowmana 0
	var globalexp 15
	var killmob XXX
	var monster1 viper
	var monster2 goblin
	var monster3 eel
	var monster4 caiman
	var killmob1 XXX
	var parryweapon dagger
	var helm bala
	var glove sleeve
	var evasion 82
	var loot treasure
	var saferoom 406
	var manasong 1
	var exitnow 0
	var ritual preserve
	var ritualon 1
	var noskin 0
	var arise 1
	var castcamb 1
	
	gosub powercheck
	
#*********          *********
#*********  Keldus  *********
#*********          *********

Keldus:
	gosub armor.wear
	gosub dodge
	gosub emptyhands
	
	#if $zoneid = 11 then goto combatstart
	
## ** Steal train and movement
	gosub stealsetup
	
## ** Sell skins
## ** Not needed while climbing in town.
	#if $zoneid = 4 then gosub move 14
	
## ** Climbing/Swimming Start
	if $zoneid = 4 then gosub move 264
	if $zoneid = 1 then gosub move 173
	if $zoneid = 6 then gosub move 98
	if $zoneid = 7 then gosub move 197
	gosub swimnow
	gosub put.1 "climb bri" "^Obvious"
	
## ** Move to combats
	gosub stealsetup
	gosub findcombatroom
	if %playerhere = 1 then goto combatbypass
		
	gosub reveal
## ** Combat start
combatstart:
## ** Spell training in combat
	gosub put.1 "stance set 100 0 100 0" "^Setting"
	gosub put.1 "block" "^Roundtime|^But you are already blocking"
	gosub start.magiclearn

## ** Shield Train
	gosub startskill Shield_Usage
	put #var train.start $gametime
	if "$righthandnoun" != "%camb" then gosub put.1 "rem %camb" "^You remove|^You detach|^You slide|^Remove what"
	if "$righthandnoun" != "%camb" then gosub get my %camb
	
dloop:
	gosub reveal
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto dloopexit
	if $monstercount > 3 then goto dloopexit
	if "%Philosopher" = "off" then gosub PHP
	if $Evasion.LearningRate < 34 then
	{
		if "%Philosopher" = "off" then gosub PHP
		gosub huntcheck
		if (($Appraisal.LearningRate < 33) && ($monstercount > 0)) then gosub appcritter
			else
			{
				if (($Arcana.LearningRate < 34) || ($Primary_Magic.LearningRate < 34)) then if $mana > %lowmana then gosub quickarcana
					else gosub pause 1
			}
		goto dloop
	}
dloopexit:
	gosub endskill Shield_Usage
	gosub splay
	gosub put.1 "wear %camb" "%wear.msg"
	goto combatbypass
## ** Weapon train start	
	gosub put.1 "stance set 80 1 100 100" "^Setting"
	var death 0
	var tmcast 1
	gosub le.fight
## ** Leave combat
combatbypass:

	gosub put.1 "Stop stalk" "^You stop|^You're not"
	gosub flee
	gosub emptyhands
	gosub returnhome

	gosub stealsetup
	
	
## ** Lore location	
	gosub move 416

	gosub checkplayer
	if %playerhere = 1 then goto lorebypass
	
## ** Turn off invis
	gosub eotboff
	
	gosub findclass Arcana
	#gosub stamcheck
	if %heavy = 0 then gosub heavy.wear
	
	# Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "carv book" 1 5
	gosub put stow my book
	gosub endskill Scholarship
	
	gosub stealsetup
	gosub move 416
	if $invisible = 1 then gosub eotboff
	
mechtraining:	
# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub startskill Mechanical_Lore
	gosub m.inputraid vine sfsf bin
	gosub endskill Mechanical_Lore

	gosub put.1 "forage dirt" "^Roundtime"
	gosub put.1 "forage dirt" "^Roundtime"
	gosub stow left
	gosub stow right
	
	gosub stealsetup
	gosub move 416
	if $invisible = 1 then gosub eotboff
	
## ** Forage & Perception training
	var collect rock
	gosub startcollect 9999999
	
lorebypass:
## ** Arcana & Magic Training	
## ** Training in combat
		
	math globalexp add 10
	if %globalexp > 25 then var globalexp 33
	goto Keldus

exit
include routinesteal.cmd
include routinecommon.cmd 
include routinecombat.cmd
include routinenecrobuffs.cmd