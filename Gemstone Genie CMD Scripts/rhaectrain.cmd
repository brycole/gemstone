#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routinebardbuffs
		
initialize: 
	### When changing area locations, update gosub RUNHIDE, RETURNHOME
	
	put #log >ExpLogR *********
	put #log >ExpLogR Login time/date.
	put #log >ExpLogR $datetime
	#var monitor atk
	#var monitor no
	#var resonance 2
	#var ignorerooms 2

	var baseprep 1
	var maxcreature 7
	var collect rock
	var lowmana 50
	var globalexp 15
	var killmob wolf
	var monster1 viper
	var monster2 goblin
	var monster3 eel
	var monster4 caiman
	#var killmob1 scout ogre
	var stance DEF
	var parryweapon dagger
	var helm helm
	var glove gauntlet
	var evasion 81
	var loot equipment
	var saferoom 390
	var manasong 1
	var exitnow 0
	
	gosub splay
	gosub splay
	gosub put.1 "power" "^Roundtime:"
	gosub ss playtrain vocals stop
	
	gosub put.1 "tap pyr in sack" "^You tap|I could not"
	gosub put.1 "tap pyr in second sack" "^You tap|I could not"
	gosub put.1 "tap pyr in third sack" "^You tap|I could not"
	
	gosub pyramid get
	put #var lastarmor SFASF
	gosub armorswap $lastarmor heavy
	
	
#*********        *********
#*********  Rhaec  *********
#*********        *********

Rhaec:
	gosub splay
	gosub splay
	gosub put.2 "get %helm" "wear %helm" "^You put|^You"
	gosub put.2 "get %glove" "wear %glove" "^You slip|^You"
	gosub put.1 "song quiet" "^You are|^You will"
	gosub put.1 "mana song 1" "^Your enchante"
	gosub dodge
	gosub emptyhands
	gosub armorswap $lastarmor heavy

#goto bypass

	if $zoneid = 11 then 
		{
			## leucro script exit
			gosub move 36
			##gosub move 114
		}
	
	
	goto swimexit
	gosub move 88
	put #var train.start $gametime
swimmingtemp:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto swimexit
	gosub put.1 "n" "^Obvious|^You can't swim"
	gosub put.1 "s" "^Obvious|^You can't swim"
	if $Swimming.LearningRate < %globalexp then goto swimmingtemp
swimexit:

	gosub move 126
		
	gosub checkplayer
	if %playerhere = 1 then goto mechbypass1

	goto mechtraining1
	gosub pyramid drop
# Arcana training	
	var bardrecast 1
	gosub splay
	gosub startskill Arcana
	gosub put.2 "rem %helm" "stow %helm" %stow.msg
	if "$righthandnoun" != "medallion" then gosub put.1 "rem wren medal" "^You remove|^You detach|^Remove what"
	if "$righthandnoun" != "medallion" then gosub get my medal
	gosub m.inputardarcana
	gosub endskill Arcana
	gosub put.1 "wear medal" "^You attach|^You wear|^You hang"
	gosub put.2 "get %helm" "wear %helm" "^You put|^You"
	gosub emptyhands
	var bardrecast 0

mechtraining1:	
# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub pyramid drop
	gosub startskill Mechanical_Lore
	gosub m.inputraid grass sfasf gutter
	gosub endskill Mechanical_Lore
	gosub pyramid get

mechbypass1:

##  BYPASS TM TRAINING
	goto TMBYPASS
## TM Training
## Move to TM Combats

	var str lyre
	
	gosub move 396
	gosub stamcheck
		
	gosub move 55
	gosub checkplayer
	if %playerhere = 1 then 
	{
		gosub move 54
		gosub checkplayer
		if %playerhere = 1 then goto tmbypass
	}

	put #var train.start $gametime
	gosub put.1 "stance eva 20" "^Your stance"
	gosub startskill Light_Plate
armortrain:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto armorexit
	gosub spawncheck
	gosub ppcheck
	if $Light_Plate.LearningRate < 33 then
		{
			gosub pause 1
			goto armortrain
		}
armorexit:
	gosub endskill Light_Plate
	gosub emptyhands
	
	gosub startskill Targeted_Magic
	put #var train.start $gametime
	var adjust 0
	var forceloud 1

tmtrain:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto tmexit
	if $Targeted_Magic.LearningRate > 33 then goto tmexit
	gosub spawncheck
	gosub ppcheck
	if $monstercount < 1 then gosub pause 15
		else
		{
			if %manasong = 10 then gosub put.1 "mana song 1" "^Your enchante"
			if (("%stance" = "dodge") || ("%stance" = "parry")) then 
			{
				gosub dodge attack
				gosub put.1 "stance eva 20" "^Your stance"
			}
			gosub prep bolt
			gosub put.1 "target" "^You begin"
			gosub cast
			gosub prep bolt
			gosub put.1 "target" "^You begin"
			gosub manacheck
			gosub cast
		}
	if contains("$roomobjs", "appears dead") then
	{
		gosub put loot equipment
		gosub put.1 "face next" "^You turn|^There is nothing"
	}
	goto tmtrain	

tmexit:
		gosub endskill Targeted_Magic

tmbypass:
		var forceloud 0
		var adjust 1
		var crawl 0
		gosub emptyhands
crawlloop:
		action var crawl 1 when a crawlway
		gosub flee
		if %crawl = 0 then
		{
			gosub walk n
			gosub walk nw
			if $roomid != 0 then var crawl 1
			goto crawlloop
		}
		action remove a crawlway
		gosub move 22
				
TMBYPASS:
## COMBAT START	
		gosub dodge

## MOVE TO COMBATS

	gosub move 394
	gosub vipertrail enter
	gosub move 44
	gosub checkplayer
	if %playerhere = 1 then 
		{
			gosub move 42
			gosub checkplayer
			if %playerhere = 1 then gosub move 48
			gosub checkplayer
			if %playerhere = 1 then goto combatbypass
		}

	gosub pyramid drop
	gosub get my %parryweapon
	gosub parry
	
	put #var train.start $gametime
	gosub startskill Parry_Ability
parrytrain:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto parryexit
	gosub spawncheck
	gosub ppcheck
	if $Parry_Ability.LearningRate < 33 then
		{
			gosub appcritter
			goto parrytrain
		}
parryexit:
	gosub endskill Parry_Ability
	gosub dodge
	gosub emptyhands
	
	gosub pyramid drop
	
put #var train.start $gametime
	gosub startskill Shield_Usage
shieldtrain:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto shieldexit
	gosub spawncheck
	gosub ppcheck
	if $Shield_Usage.LearningRate < 33 then
		{
			gosub pause 1
			goto shieldtrain
		}
shieldexit:
	gosub endskill Shield_Usage
	gosub emptyhands
	
## appraisal
	gosub startskill Appraisal
apploop:
	if $Appraisal.LearningRate < %globalexp then
	{
		gosub spawncheck
		gosub appcritter
		goto apploop
	}
	gosub endskill Appraisal
	
	gosub dodge attack
	
	gosub pyramid drop
	put #var train.start $gametime
	gosub startskill Light_Thrown
	var skinexp 35
	var offhandexp 33
weapon.train:
	echo %axes axes. %thrownknife knives.
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	#if %traintemp > 1200 then goto weaponexit
	if $Light_Thrown.LearningRate > 33 then goto weaponexit
	gosub spawncheck
	gosub ppcheck
	if $monstercount < 1 then gosub pause 15
		elseif (("%stance" = "dodge") || ("%stance" = "parry")) then gosub dodge attack
	if $Offhand_Weapon.LearningRate < 20 then
	{
		if (("$righthandnoun" = "bola") || ("$righthandnoun" = "axe") || ("$righthandnoun" = "steelstars")) then
		{
			gosub put.1 "swap" "^You move|^You have"
			gosub get my %parryweapon
		}
	}
	if $monstercount > 0 then 
	{
		if (("$righthandnoun" = "bola") || ("$righthandnoun" = "axe")) then gosub throw
		if contains("$righthandnoun", "steelstar") then gosub throw
		if (("$lefthandnoun" = "bola") || ("$lefthandnoun" = "axe")) then gosub throw left
		if contains("$lefthandnoun", "steelstar") then gosub throw left
	}
	if %axes > 0 then
	{
		if (("$righthandnoun" != "axe") && ("$lefthandnoun" != "axe")) then gosub get axe
	}
		else if matchre("$roomobjs", "throwing axe\b") then gosub get axe
	if %thrownknife > 0 then
	{
		if (("$righthandnoun" != "steelstars") && ("$lefthandnoun" != "steelstars")) then gosub get my %thrownweap
	}
		elseif (("$righthandnoun" != "bola") && ("$lefthandnoun" != "bola")) then gosub get bola				
	if %death = 1 then gosub skinarray
	goto weapon.train
weaponexit:
	echo %axes axes. %thrownknife knives.
	if ((%axes < %maxaxe) || (%thrownknife < %maxthrown)) then gosub killthrown
	gosub dodge
	gosub emptyhands
	gosub killthrown
	gosub throwcheck
	gosub endskill Light_Thrown
	
	var bardrecast 0
	gosub splay

combatbypass:

	gosub pyramid get
	gosub flee
	gosub emptyhands

	gosub move 36
	gosub vipertrail exit
## Exit vipers

## Move to climbing
	
	gosub move 349

## Climbing Start	
	gosub startskill Climbing
	gosub crossclimb
climbend:	
	gosub endskill Climbing
	gosub returnhome
	

## Move back to base	
	gosub move 126
	gosub checkplayer
	if %playerhere = 1 then goto mechbypass2

	gosub stamcheck
	gosub emptyhands
	gosub pyramid drop
	var collect rock

##	Instrument section
#	bypass:
	gosub instrumentall
	var books1 0
	var books2 0
		
	goto fabypass
	
# First aid training
	gosub startskill First_Aid
	gosub put get my cloth comp
	gosub compendium 10
	gosub put get my red comp
	gosub compendium 7
	gosub endskill First_Aid

# Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book
	gosub endskill Scholarship

fabypass:
	
# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub pyramid drop
	gosub startskill Mechanical_Lore
	gosub m.inputraid grass sfsa gutter
	gosub endskill Mechanical_Lore
	gosub pyramid get

# Forage & Perception training
	gosub pyramid drop	
	gosub startskill Perception
	var collect rock
	gosub collect 9999999
	gosub endskill Perception
	gosub pyramid get

mechbypass2:	
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Rhaec

exit
include routinecommon.cmd 
include routinecombat.cmd
include routinebardbuffs.cmd