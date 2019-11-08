debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinecombat
	gosub routinebardbuffs
		
initialize: 
	put #log >ExpLogR *********
	put #log >ExpLogR $datetime
	#var monitor atk
	#var monitor no
	#var resonance 2
	#var ignorerooms 2

	var baseprep 1
	var collect rock
	var lowmana 50
	var globalexp 10
	var killmob wolf
	var monster1 beisswurm
	var monster2 goblin
	var monster3 eel
	#var killmob1 scout ogre
	var stance DEF
	var parryweapon sword
	var helm barb
	var glove gauntlet
	var evasion 80
	var loot equipment
	var ix 0
	
	#goto bypass
	#gosub put.1 "power" "^Roundtime:"
	#goto bypass
	#gosub ss playtrain vocals stop

#*********        *********
#*********  Rhaec  *********
#*********        *********

Rhaec:

lore:	
	gosub sortskill Mechanical_Lore|Scholarship|Appraisal|Strings 4
	gosub skillcheck1
	gosub sortskill Mechanical_Lore 1
	gosub skillcheck1
	echo done!
	exit
skillcheck1:
	if $%sort(%ix).LearningRate < %globalexp then 
		{
			if "%sort(%ix)" = "%priorskill" then
				{
					evalmath ix (%ix + 1)
					goto skillcheck1
				}
			gosub %sort(%ix)
			var priorskill %sort(%ix)
			evalmath i (%ix + 1)
			goto skillcheck1
		}
	if %ix != %countskills then
		{
			evalmath ix (%ix + 1)
			goto skillcheck1
		}
	var ix 0

return
echo DONE
exit

	gosub put.1 "song quiet" "^You are|^You will"
	gosub dodge
	gosub splay
	gosub emptyhands

	if $zoneid = 7 then 
		{
			gosub move 347
			gosub move 114
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


gosub move 264
gosub move 98
gosub move 396

goto climbpass

put #var train.start $gametime
climbtemp:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto climbexit
	if $Climbing.LearningRate > %globalexp then goto climbexit
	put #var last.climb $gametime
	
	gosub climb 0
	gosub put.1 "climb practice trunk" "^You begin"
delay1:
	evalmath climbtemp ($gametime - $last.climb)
	if %climbtemp > 60 then
		{
			waitforre ^You continue|^You finish
			gosub put.1 "stop climb" "^You stop"
			goto climbtemp
		}
		else delay 5
		goto delay1	
climbexit:
	
	gosub move 347
	gosub move 114
climbpass:	
		gosub put.1 "stance set 100 100 0 0" "^Setting your"

	gosub move 34
	put #var mapper search
	gosub move 35
	gosub get my %parryweapon
	put #var mapper defense
	gosub checkplayer
	if %playerhere = 1 then 
		{
			gosub move 37
			gosub checkplayer
			if %playerhere = 1 then goto combatbypass
		}

	put #var train.start $gametime
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
	gosub emptyhands
	gosub dodge

put #var train.start $gametime
shieldtrain:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto shieldexit
	gosub spawncheck
	gosub ppcheck
	if $Shield_Usage.LearningRate < 33 then
		{
			gosub appcritter
			goto shieldtrain
		}
shieldexit:
	gosub emptyhands
	
## appraisal
apploop:
	if $Appraisal.LearningRate < %globalexp then
	{
		gosub spawncheck
		gosub appcritter
		goto apploop
	}
	
	gosub dodge attack

	#gosub flee

#goto combatbypass
lt.train:
	gosub spawncheck
	gosub ppcheck
	if $monstercount < 1 then gosub pause 15
	if $Light_Thrown.LearningRate > %globalexp then
		{
			if $Offhand_Weapon.LearningRate > %globalexp then goto throwexit
			if "$righthandnoun" = "rock" then
				{
					gosub put.1 "swap" ".+"
					gosub get my %parryweapon
					gosub parry attack
				}
		}
	if $monstercount > 0 then 
		{
			if "$righthandnoun" = "rock" then gosub throw
			if "$lefthandnoun" = "rock" then gosub throw left
		}
	if (("$righthandnoun" != "rock") && ("$lefthandnoun" != "rock")) then gosub get rock
	if %death = 1 then gosub skinarray
	goto lt.train
throwexit:
	gosub dodge
	gosub emptyhands
	gosub throwcheck

	gosub dodge attack
	put #var train.start $gametime
skin.train:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto skinexit
	gosub spawncheck
	gosub ppcheck
	if $monstercount < 1 then gosub pause 15
	if $Light_Thrown.LearningRate > 33 then
		{
			if $Offhand_Weapon.LearningRate > 35 then goto skinexit
			elseif $Skinning.LearningRate > %globalexp then goto skinexit
			if "$righthandnoun" = "rock" then
				{
					gosub put.1 "swap" ".+"
					gosub get my %parryweapon
					gosub parry attack
				}
				
		}
		elseif $Skinning.LearningRate > %globalexp then goto skinexit
	if $monstercount > 0 then 
		{
			if "$righthandnoun" = "rock" then gosub throw
			if "$lefthandnoun" = "rock" then gosub throw left
		}
	if (("$righthandnoun" != "rock") && ("$lefthandnoun" != "rock")) then gosub get rock
	if %death = 1 then gosub skinarray
	goto skin.train
skinexit:
	gosub dodge
	gosub emptyhands
	gosub throwcheck
	
	gosub flee

combatbypass:	
# ** Move to train magic in combat areas
	gosub move 22
	gosub move 347
	#gosub move 114
	
	gosub move 23
	gosub move 774
	gosub checkplayer
	if %playerhere = 1 then gosub move 773
	
Strings:
	gosub emptyhands
	var collect dust bunny
	if $zoneid = 4 then gosub move 14
	gosub move 774
	gosub checkplayer
	if %playerhere = 1 then gosub move 773
	gosub instrumentall
	var collect rock
return

	goto fabypass
	
# First aid training
	gosub startskill First_Aid
	gosub put get my cloth comp
	gosub compendium 10
	gosub put get my red comp
	gosub compendium 7
	gosub endskill First_Aid

fabypass:
Scholarship:
# Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book
	gosub endskill Scholarship
return

	gosub move 172
	
Mechanical_Lore:
	gosub move 287
	gosub checkplayer
	if %playerhere = 1 then return

# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub pyramid drop
	gosub startskill Mechanical_Lore
	gosub m.inputraid grass dgd bin
	gosub endskill Mechanical_Lore
	gosub pyramid get

return

mechbypass2:
	gosub move 289
	put #var mapper search
	gosub move 291
	put #var mapper defense

	
# Forage & Perception training
	gosub pyramid drop	
	gosub startskill Perception
	var collect rock
	gosub collect 9999999
	gosub endskill Perception
	gosub pyramid get
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Rhaec

exit
include routinecommon.cmd 
include routinecombat.cmd
include routinebardbuffs.cmd