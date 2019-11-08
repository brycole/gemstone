#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routinemoonbuffs
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
	var monster1 deer
	var monster2 cougar
	var monster3 eel
	var monster4 caiman
	#var killmob1 scout ogre
	var parryweapon dagger
	var helm bala
	var glove sleeve
	var evasion 81
	var loot treasure
	var saferoom 12
	var manasong 1
	var exitnow 0
	var ritualon 0
	var noskin 0

	
	gosub ppcheck
	
	gosub ss playtrain vocals stop
	
#*********          *********
#*********  Keldus  *********
#*********          *********

Keldus:
	gosub armor.wear
	gosub dodge
	gosub emptyhands

## ** Move to combats	
	if $zoneid = 4 then gosub move 14
	if $zoneid = 1 then
	{
		gosub move 171
		gosub walk n
	}
	if $zoneid = 7 then gosub move 352
	gosub move 152
	gosub checkplayer
	if %playerhere = 1 then 
		{
			gosub move 463
			gosub checkplayer
			if %playerhere = 1 then gosub move 465
			gosub checkplayer
			if %playerhere = 1 then gosub move 468
			gosub checkplayer
			if %playerhere = 1 then goto combatbypass
		}
	#gosub put.2 "get belt knife" "wear belt knife" "^You attach|^You are"

	gosub reveal
## ** Combat start

## ** Shield/Parry Train
	gosub startskill Shield_Usage
	#gosub get my dagger
	gosub put.1 "stance set 100 0 100 0" "^Setting"
	gosub put.1 "dodge" "\[Roundtime|^But you are already|Roundtime"
	var parryswap 0
	var camb armband
	put #var train.start $gametime
	if "$righthandnoun" != "%camb" then gosub put.1 "rem %camb" "^You remove|^You detach|^You slide|^Remove what"
	if "$righthandnoun" != "%camb" then gosub get my %camb
dloop:
	if $Vocals.LearningRate < 27 then if "%humming" = "no" then gosub put hum $vocals_song
	gosub reveal
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto dloopexit
	if $Evasion.LearningRate < 34 then
	{
		if (($Shield_Usage.LearningRate > 33) && (%parryswap = 0)) then
		{
			#var parryswap 1
			#gosub put.1 "stance set 75 25 100 0" "^Setting"
			if "%Philosopher's" = "XXX" then
				{
					gosub castbuff php 15 19
					delay 21
					gosub castbuff php 15 19
				}
		}
		gosub huntcheck
		if $Appraisal.LearningRate < 33 then gosub appcritter
			else
			{
				if (($Arcana.LearningRate < 34) || ($Primary_Magic.LearningRate < 34)) then gosub quickarcana
					else gosub pause 1
			}
		goto dloop
	}
dloopexit:
	gosub endskill Shield_Usage
	gosub splay
	gosub put.1 "wear %camb" "%wear.msg"

## ** Weapon train start	
	gosub put.1 "stance set 80 1 100 100" "^Setting"
	var death 0
	var tmcast 1
	gosub le.fight
## ** Leave combat

	gosub put.1 "Stop stalk" "^You stop|^You're not"
	gosub flee
	#gosub put.2 "rem belt knife" "stow knife" "^You put"
	gosub returnhome
	gosub emptyhands

## ** Sell skins
## ** Not needed while climbing in town.
	#gosub move 14
	#gosub checksell
	#gosub move 172
## ** Leave town
#	gosub move 132

combatbypass:

## ** Steal setup and go
	gosub stealsetup
	
## Climbing/Swimming Start
	gosub returnhome
	gosub move 88
	gosub swimnow
	gosub endskill Swimming

## ** Lore location	
	gosub move 132

## ** Turn off invis
		gosub castbuff eotb 18 19
		delay 20
		gosub castbuff eotb 18 19
	
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
		
mechtraining:	
# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	#gosub pyramid drop
	gosub startskill Mechanical_Lore
	gosub m.inputraid vine sfsf bin
	gosub endskill Mechanical_Lore
	#gosub pyramid get

mechbypass:
	
# Forage & Perception training
	gosub pyramid drop	
	gosub startskill Foraging
	var collect rock
	gosub collect 9999999
	gosub endskill Foraging
	gosub pyramid get
	
mechbypass2:
## ** Arcana & Magic Training	
	#gosub quickarcana
		
	math globalexp add 10
	if %globalexp > 25 then var globalexp 33
	goto Keldus

exit
include routinesteal.cmd
include routinecommon.cmd 
include routinecombat.cmd
include routinenecrobuffs.cmd