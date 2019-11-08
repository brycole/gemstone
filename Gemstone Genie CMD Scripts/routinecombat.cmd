	routinecombat:
	setvariable cheststat off
	setvariable shieldstat off
	setvariable glovestat off
	setvariable cowlstat off
	var apptime 0
	var c 0
	var jacked none
	
	include creaturelist.cmd
	
	#action var death 1 when balance\]|balanced\]|^There is nothing|^Face what\?|lies still\.$|expiring\.$|goes limp\.$|seems to deflate slightly\.$|mist with a cry of despair\.$
	##action (combat) var death 0 when ^[A|An] .+ (decays|crumbles|melts|withers) (away|into)\.
	
###	dissolves into a pile|mist with a cry of despair\.$|folds up into itself and turns to dust\.$|collapses to the ground for ### good\.$|releasing a foul stench better suited to an abattoir\.$|^The corpse of the frost angiswaerd collapses

	action (combat) var ambusherhere 1 when ^\w+ leaps from hiding|^You notice \w+ trying to slip|^You notice \w+ slip into|poachs|snipes
	
	action (combat) var dodge 1 when You move into a position to dodge|But you are already dodging
	action (combat) var block 1 when You move into a position to block|But you are already blocking
	#action var hidetrain 1 when ^You leap
	
	action (combat) var weaponrange melee;var advance 0 when You close to melee range on|^\[You're|You are already at melee|closes to melee range
	action (combat) var weaponrange pole when ^You close to pole range on|^It would help if you were closer|^You close to pole weapon range|^The .+ closes to pole weapon
	action var weaponrange missile when ^You are already as far away as you can get!|^You aren't close enough to attack|^It would help if you were closer|^You aren't close enough|^You retreat from combat|^You must be closer to use tactical

	#action (combat) var swapsword 2he when ^You switch your sword so that you can use it as a two-handed edged weapon\.$
	#action (combat) var swapsword he when ^You switch your sword so that you can use it as a heavy edged weapon\.$

	action (combat) var thrown.down 1 when ^The (throwing|light) (axe|spear) falls to the
	
	action goto exitfull when ^You are carrying between 400 and 499 items on you

	action (ranged) var aimfull 1 when ^You think you have your best shot
	action (ranged) var aimfull 0; var aiming 0; var cman aim when ^You stop concentrating|^Since your left hand is now full, you stop|^Since you are no longer holding your ranged weapon
	action (ranged) var cman fire; var aiming 1 when ^You begin to target
	action (ranged) var cman load when ^(But )?[Y|y]our (competition|battle) (longbow|shortbow|bow) isn't loaded!|^You unload the (longbow|shortbow|bow)|^You sling an (osage|cherry|azurelle) (competition|battle) (longbow|shortbow|bow) over|[Y|y]ou fire [a|an]|^You put your (shortbow|bow) in your
	
	action put unload my %bowtype when ^You need to unload
	
	action (combat) var do.tactics 1 when ^You can no longer see openings
	
	action (combat) goto stunned when $stunned = 1
	action (combat) goto leavecombat when LEAVECOMBATNOW
		
	## ** Area specific
	action (combat) var tinglenow 1 when bashes a heavy stone mattock bearing a

	action (combat) off
	
	var swings (feints|sweeps|slices|chops|jabs)
	var dancekill %dancewith
	var toomany %dancewith
	var dangerous %dancewith
	var monstersdead 0
	var lastmaneuver attack1
	var skin no
	var loaded 0
	var engage no
	var appnew yes
	var retreat.msg ^You are already as far away as you can get!|^You aren't close enough to attack|^It would help if you were closer|^You aren't close enough|^You retreat
	var weaponrange missile
	var cman draw
	var dodge 0
	var counter first|second|third|fourth|fifth|sixth|seventh|END
	math dancekill add 1
	math toomany add 2
	math dangerous add 3
	var heavy 1
	var ambusherhere 0
	var laststance dodge
	var thrown.down 0
	gosub routinesearch
	
return

startcombat:
	var Malediction off
	var Soul off
	if $dormant.infection = 1 then return
	var incombat 1
	var trainskill.var $1
	var trainweapon.var $2
## ** Move to combats
	action (combat) on
	gosub findcombatroom
	gosub movecombatroom
	if %playerhere = 1 then goto combatbypass
	if "%Eyes" = "on" then gosub release eotb
	gosub maincombat.start
## ** Return to main character script
	var incombat 0

return

findcombatroom:
	var spelluproom 1
	## ** theren bloodwolves
	#var combatrooms 361|362|356
	
	## ** theren red brocket deer
	#var combatrooms 146|105|147	
	
	## ** Crossing Young Ogres
	
	#var combatrooms 337|336|335
	
	## ** Shard gargoyles
	
	##var combatrooms 176|180|183
		
	## ** Thicket vipers in crossing
	
	#var combatrooms 44|48|42
	
	## ** snowbeast 
	#var combatrooms 28|30|31
	
	## ** crossing rats
	#var combatrooms 446|240|243
		
	## ** copperhead vipers
	#var combatrooms 132|133|131
	
	## ** Crossing bloodwolves
	#var combatrooms 308|304|306
	
## **** Boar Clan Hunting *** ##
	## ** Young cave trolls in Hib
	#var combatrooms 220|221|219
	
	## ** blight ogres
	#var combatrooms 307|308|304
	
	## ** blood vines
	#var combatrooms 239|241|235
	
	## ** togball
	#var combatrooms 590|588|585
	#var combatrooms 230|228|229
	#var combatrooms 463|464|468
	#var combatrooms 583|584|586
	
	## ** Tresses
	##var combatrooms 260|252|253
	
	## ** Nyads // Dryads
	#var combatrooms 281|283|269
	
	## ** Giant Blight Ogres
	var combatrooms 305|310|306
	
	## ** frost bears
	##var combatrooms 81|72|93
	##var combatrooms 80|79|73
	
	## ** frost angiswaerd
	var combatrooms 251|252|256
	
	## ** mountain giants
	#var combatrooms 192|197|193
	
	## ** Pivuh
	#var combatrooms 288|290|289	
	
	## ** goblins/ hogs
	#var combatrooms 57|65|52
	
	## ** Eels Premium
	#var combatrooms 235|237|234

return

movespelluproom:
	
	## ** Spellup rooms
	if %spelluproom = 1 then
	{
		if "$zoneid" = "66" then var spellroom 180
		if "$zoneid" = "69" then var spellroom 283
		if "$zoneid" = "99" then var spellroom 390
		if "$zoneid" = "4" then var spellroom 411
		if "$zoneid" = "40" then var spellroom 142
		if "$zoneid" = "1" then var spellroom 173
		if "$zoneid" = "11" then var spellroom 53
		if "$zoneid" = "6" then var spellroom 98
		if "$zoneid" = "61" then var spellroom 130
		if "$zoneid" = "127" then var spellroom 595
		if "$zoneid" = "126" then var spellroom 49
		if "$zoneid" = "116" then var spellroom 3
		if "$zoneid" = "7" then var spellroom 353
		if "$zoneid" = "123" then var spellroom 4
		if "$zoneid" = "9b" then var spellroom 27
		if "$zoneid" = "40a" then var spellroom 53
	}
	## ** DO SPELLUPS
	if !matchre("$roomid", "%combatrooms") then 
	{
		gosub move %spellroom
		gosub buffcheck
	}
	var spelluproom 0
return
		
movecombatroom:
	## ** Moving to copperhead vipers
	#if "$zoneid" = "4" then gosub move 264
	#if "$zoneid" = "6" then gosub move 98
	#if "$zoneid" = "7" then gosub move 397

	## ** Moving to Himineldar Road Area from Boar
	if "$zoneid" = "127" then gosub move 510
	if "$zoneid" = "126" then gosub move 49
	if "$zoneid" = "116" then gosub move 3
	
	## ** Moving to pivuh near raven (use Himineldar Road)
	#if "$zoneid" = "123" then gosub move 175

	## ** Moving to thicket vipers
	#if "$zoneid" = "4" then gosub move 264
	#if "$zoneid" = "6" then gosub move 98
	#if "$zoneid" = "7" then gosub move 394
	
	## ** Moving to red brocket deer
	if "$zoneid" = "40" then gosub move 263
	if "$zoneid" = "42" then gosub move 2
		
	## ** Moving to shipyard rats
	#if "$zoneid" = "4" then gosub move 14
	
	
	gosub movespelluproom
	var spelluproom 0
	
## ** If already in a combat room, don't move
	if matchre("$roomid", "%combatrooms") then return
## ** Special Movements
## ** Enter custom movement!
	if %specialmove = 1 then 
	{
		gosub move 247
		gosub put.2 "get skates" "wear skates" "^You slide"
	}
	
	gosub move %combatrooms(0)
	var combatroom.location 0
	gosub checkplayer
	if %playerhere = 1 then 
		{
			gosub move %combatrooms(1)
			var combatroom.location 1
			gosub checkplayer
			if %playerhere = 1 then 
			{
				gosub move %combatrooms(2)
				var combatroom.location 2
				gosub checkplayer
				if %playerhere = 1 then goto leavecombat
			}
		}
	if "%Eyes" = "on" then gosub release eotb
return

maincombat.start:
	put #var train.start $gametime
	gosub startskill %trainskill.var
	var thrown.train 0
	var ranged.train 0
	var tmcast 1
	var mincreature %mincreature.start
	var ammo  bolt| soot-stained arrow| drake-fang arrow| quadrello| ice-adder arrow| basilisk arrow
	
	if matchre("%trainskill.var", "Thrown") then var thrown.train 1
	if matchre("%trainskill.var", "Thanatology") then 
	{
		var thrown.train 1
		var mincreature 0
	}
	if matchre("%trainskill.var", "Crossbow|Bow") then var ranged.train 1
	if matchre("%trainskill.var", "Crossbow|Bow") then
	{
		var attackstance dodge attack
		gosub dodge attack
	}
	else
	{
		var attackstance parry attack
		gosub parry attack
	}
	
	if "%Eyes" = "on" then gosub release eotb
	gosub switchweapon %trainweapon.var
	
	var oldglobal %globalexp
	var globalexp 33
	var debilitation.var 1
	var pv 0
	var do.tactics 1
	var weaponexp.track 0
		
	if "%Ivory" = "offxxxx" then 
	{
		gosub castbuff "Ivory Mask" 15 40 20
		gosub spelldelay
	}
	##if (("%Ivory" = "on") && ("%Quicken" = "off")) then gosub qe
maincombat.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if $standing = 0 then gosub stand
	gosub %attackstance
	
	## ** Timer and main exp skill to stop combat
	if (($%trainskill.var.LearningRate > 33) || (%traintemp > 1200)) then goto maincombat.exit
	
	## ** Check exp to determine if %mincreature is needed
	gosub checkpassivecombats
	
	## ** Put up hydra hex if cleric.
	if (("$guild" = "Cleric") && ("%Hydra" = "off")) then gosub hydrahex
	
	## ** IF A MONSTER IS HERE, DO COMBAT SKILLS
	if $monstercount > %mincreature then
	{
		if "%Manifest" = "off" then gosub castbuff "Manifest Force" 15 15 4
		gosub debilcheck
		gosub tmcheck
		gosub debilcheck
		gosub tmcheck
		if (("%weaponrange" != "missile") && ("%Manifest" = "off") && ($monstercount > %maxcreature)) then gosub retreat
		if ((("%weaponrange" = "melee") || (%thrown.train = 1)) && ($health > 85)) then
		{
			### *** Get your weapon. Empty hands. ***
			if (("$righthandnoun" != "%trainweapon.var") && ("$lefthandnoun" != "%trainweapon.var") && ("%trainweapon.var" != "NONE")) then 
			{
				gosub emptyhands
				if %ranged.train = 1 then 
				{
					if "%trainweapon.var" = "%bowtype" then gosub put.1 "remove my %bowtype" "%wear.msg"
					if "%trainweapon.var" = "crossbow" then gosub put.1 "untie my crossbow from toolstrap" "%wear.msg|^You need a free hand" 
				}
				else
					{
						if %thrown.down = 1 then 
						{
							gosub get %trainweapon.var
							var thrown.down 0
						}
							else gosub get my %trainweapon.var
					}
			}
			## *** Offhand attacks and swapping ***
			if ((%thrown.train != 1) && ("$righthandnoun" = "%trainweapon.var") && ($Offhand_Weapon.LearningRate < 34) && ("%weaponskill.var" = "Small_Edged")) then 
			{
				#gosub get my %parryweapon
				gosub put.1 "swap" "^You move"
			
			}
			if "$lefthandnoun" = "%trainweapon.var" then
			{
				if %thrown.train = 1 then gosub swap
					else
					{
						if (($Offhand_Weapon.LearningRate > 33) && ($%weaponskill.var.LearningRate < 34) && ("%weaponskill.var" = "Small_Edged")) then gosub put.1 "swap" "^You move"
							else gosub put.1 "%cman left" "%cman.msg"
					}
			}
			## *** Main attack section
			if (("$righthandnoun" = "%trainweapon.var") || ("%weaponskill.var" = "Brawling")) then
			{
				if (($%weaponskill.var.LearningRate > 33) && ($Offhand_Weapon.LearningRate < 30) && ("%weaponskill.var" = "Small_Edged")) then gosub put.1 "swap" "^You move"
				if %ranged.train = 0 then gosub put.1 "%cman" "%cman.msg"
			## *** Adjustment for ranged combat ***
			## *** Fire at full aim ***
				if %ranged.train = 1 then
				{
				if (("%cman" = "fire") && (%aiming = 0)) then var cman aim
					if (("%cman" = "fire") && (%aimfull = 1)) then 
					{
						gosub put.1 "%cman" "%cman.msg"
						var ammogone 1
						var aimfull 0
						var aiming 0
						var unload 0
					}
						else
						{
							if "%cman" = "load" then 
							{
								var unload 1
								if "%trainweapon.var" = "crossbow" then gosub put.1 "load" "%cman.msg"
									else gosub put.1 "load my basi arrow" "%cman.msg"
								gosub put.1 "aim" "^You begin|^You are already"
							}
							if "%cman" = "aim" then gosub put.1 "aim" "^You begin|^You are already"
								else
								{
									gosub huntcheck
									gosub pause .5
								}
						}
				}
			}
			#if %ranged.train = 0 then gosub tactics.learn
			gosub tactics.learn
			if %ranged.train = 1 then gosub getammo
			gosub appcritter
			gosub weaponexp.track
		}
			else 
			{
				if (($monstercount > 0) && ("%weaponrange" != "melee") && ($health > 85) && (%advance = 0)) then gosub adv
					else gosub pause 1
			}
	}
		else
		{
			if $monstercount < 1 then 
			{
				gosub quickspelltrain
				gosub startcollect 1
				gosub huntcheck
				gosub pause .5
			}
				else 
				{
					gosub quickspelltrain
					gosub huntcheck
					if $monstercount > 0 then gosub tactics.learn
					gosub pause .5
				}
		}
		
	gosub combatchecks
	goto maincombat.loop
maincombat.exit:
	if %ammogone = 1 then gosub kill.ammo
	var globalexp %oldglobal
	gosub endskill %trainskill.var
	gosub emptyhands
	if "%Quicken" = "On" then gosub release qe
	if (("$preparedspell" != "None") &&  (%usedcamb = 1)) then gosub spelldelay
		else gosub release spell
	gosub dodge
	if %thrown.down = 1 then gosub stow %trainweapon.var
	var weaponrange
	var thrown.train 0
	var ranged.train 0
	var thrown.down 0
	action (ranged) off
return

combatchecks:
	## ** TM & Debilitation are tied to each other. ** ##
	if (($Targeted_Magic.LearningRate < 5) && (%traintemp > 888800) && (%tmcast = 1) && ($Debilitation.LearningRate < 5) && ($tmoff != 1) then 
	{
		put #var tmoff 1
		put #var debiloff 1
		put #echo >log Turning TM off. Learning Rate: $Targeted_Magic.LearningRate Time in training: %traintemp
		put #echo >log Turning Debilitation off. Learning Rate: $Debilitation.LearningRate Time in training: %traintemp
		put #log >ExpLog Debilitation off. Learning Rate: $Debilitation.LearningRate Time in training: %traintemp
		put #log >ExpLog Turning TM off. Learning Rate: $Targeted_Magic.LearningRate Time in training: %traintemp
	}
	if (($Tactics.LearningRate < 5) && (%traintemp > 800) && (%do.tactics = 1) && ($tacticsoff != 1)) then 
	{
		put #var tacticsoff 1
		put #echo >log Turning Tactics off. Learning Rate: $Tactics.LearningRate Time in training: %traintemp
		put #log >ExpLog Turning Tactics off. Learning Rate: $Tactics.LearningRate Time in training: %traintemp
	}

	gosub deathcheck
	if %ranged.train = 1 then gosub getammo
	gosub ppcheck
	gosub buffcheck
	#if "%Ivory" = "off" then gosub castbuff "Ivory Mask" 15 40 20
	#if "%Butcher" = "off" then gosub castbuff "Butcher's Eye" 15 40 20
	#if (("%Ivory" = "on") && ("%Quicken" = "off")) then gosub qe
	gosub stamcheck
return

weaponexp.track:
	if %weaponexp.track = 0 then return
	if "$charactername" = "Raelok" then
	{
		if "%weaponskill.var" = "Small_Edged" then
		{
			if (($%weaponskill.var.LearningRate > 30) || (($%weaponskill.var.LearningRate < 2) && (%traintemp > 180))) then gosub switchweapon spear
			var weapontrack.timer %traintemp
			math weapontrack.timer add 180
		}
		if "%weaponskill.var" = "Polearms" then
		{
			if (($%weaponskill.var.LearningRate > 30) || (($%weaponskill.var.LearningRate < 2) && (%traintemp > %weapontrack.timer))) then gosub switchweapon axe
			var weapontrack.timer %traintemp
			math weapontrack.timer add 180
		}
		if (("%weaponskill.var" = "riste") then
		{
			if (($Twohanded_Blunt.LearningRate = 34) && ($Large_Blunt.LearningRate = 34) && ($Large_Edged.LearningRate = 34)) then gosub switchweapon axe
		}
	}
return

switchweapon:
	var trainweapon.var $1
	## ** Switch for thrown weapons
	if %thrown.train = 1 then var cman lob
	else
	{
	if "%trainweapon.var" = "axe" then 
	{
		var cman slice
		var weaponskill.var Small_Edged
	}
	if matchre("%trainskill.var", "Brawling") then 
	{
	var cman punch
	var weaponskill.var Brawling
	}
	if "%trainweapon.var" = "axe" then 
	{
		var cman slice
		var weaponskill.var Small_Edged
	}
	if "%trainweapon.var" = "sword" then 
	{
		var cman slice
		var weaponskill.var Twohanded_Edged
	}
	if "%trainweapon.var" = "spear" then 
	{
		var cman thrust
		var weaponskill.var Polearms
	}
	if "%trainweapon.var" = "risteXXX" then 
	{
		#action (combat) var riste.type he;var cman slice;var weaponskill.var Large_Edged when ^You switch your riste so that you can use it as a #heavy edged weapon.
		#action (combat) var riste.type 2hb;var cman swing;var weaponskill.var Twohanded_Blunt when ^You switch your riste so that you can use it as #a two-handed blunt weapon.
		#action (combat) var riste.type lb;var cman swing;var weaponskill.var Large_Blunt when ^You switch your riste so that you can use it as a #heavy blunt weapon.
		
		gosub emptyhands
		gosub get my %trainweapon.var
		gosub put.1 "swap my riste" "^You switch"
	}
	if "%trainweapon.var" = "crossbow" then
	{
		var cman load
		var weaponskill.var Crossbow
		action (ranged) on
	}
	if "%trainweapon.var" = "%bowtype" then
	{
		var cman load
		var weaponskill.var Bow
		action (ranged) on
	}
	}

return	

wearbow:
	if %unload = 1 then gosub put.1 "unload my %bowtype" "^Roundtime|^But your"
	gosub put.1 "wear %bowtype" "%wear.msg"
	gosub emptyhands
return

checkpassivecombats:
	if $Chain_Armor.LearningRate < 34 then return
	if $Light_Armor.LearningRate < 34 then return
	if $Plate_Armor.LearningRate < 34 then return
	if $Brigandine.LearningRate < 34 then return
	if $Evasion.LearningRate < 34 then return
	var mincreature 0
return


kill.ammo:
	var tmcast 1
	var kill.looptimer $gametime
	gosub release spell
kill.loop:
	evalmath killlooptemp ($gametime - %kill.looptimer)
	echo %killlooptemp seconds in kill loop.
	
	if %killlooptemp > 240 then
	{
		echo ****** SERIOUS ERROR *******
		echo ****** SERIOUS ERROR *******
		echo ****** IN LOOP FOR OVER 4 MINUTES ******
		echo ****** IN LOOP FOR OVER 4 MINUTES ******
		echo ****** EXITING LOOP ******
		put #echo >log Serious error in kill.loop.  See skill log.
		put #log >SkillLog Error in kill.loop
		put #log >SkillLog $time
		put #log >SkillLog $lastcommand
		put #log >SkillLog $roomobjs
		put #log >SkillLog $roomplayers
		put #log >SkillLog $roomname
		put #log >SkillLog $roomexits
		put #log >SkillLog $righthand
		put #log >SkillLog $lefthand
		var ammogone 0
		var tmcast 0
		return
	}
	if %ammogone = 1 then
	{
		gosub tmcheck killnow
		gosub get spear
		if "$righthandnoun" = "spear" then gosub put.1 "lob" "%cman.msg"
		if "$lefthandnoun" = "spear" then gosub put.1 "lob left" "%cman.msg"
		gosub getammo
		gosub pause 1
		if (($monstercount < 1) && (%ammogone = 1)) then goto kill.loopexit
		goto kill.loop
	}
kill.loopexit:
	if %thrown.down = 1 then gosub stow spear
    var tmcast 0
return
	
	
checkambusher:
	var ambusherhere 0
	gosub checkplayer
	if %playerhere = 1 then
	{
		if %combatroom.location = 0 then 
		{
			gosub move %combatrooms(1)
			var combatroom.location 1
			gosub checkplayer
			if %playerhere = 1 then 
			{
				gosub move %combatrooms(2)
				var combatroom.location 2
				gosub checkplayer
				if %playerhere = 1 then goto leavecombat
			}	
		}
		else if %combatroom.location = 1 then 
		{
			gosub move %combatrooms(2)
			var combatroom.location 2
			gosub checkplayer
			if %playerhere = 1 then goto leavecombat
		}		
	}
return

leavecombat:
	gosub clear
	goto bypasscombat

tactics.learn:
	if $tacticsoff = 1 then return
	if $Tactics.LearningRate > 33 then return
	if %do.tactics = 0 then return
	if "%weaponrange" = "missile" then return
		
	action var stoploop 1 when ^Your analysis reveals a massive opening

	var stoploop 0
	var do.tactics 0
	gosub dodge attack
analyze.loop:
	if "%weaponrange" = "missile" then goto analyze.exit
	
	gosub put.1 "analyze" "^You fail|^Roundtime|^Analyze what|^You must be closer"
		
	if $Tactics.LearningRate > 33 then var stoploop 1
	if contains("$roomobjs", "appears dead") then var stoploop 1
	if %stoploop = 0 then goto analyze.loop
	
analyze.exit:
	action remove ^Your analysis reveals a massive opening

return
	
	
fightmonster:
	put #var train.start $gametime
	gosub startskill Heavy_Edged
	gosub edge.combo
	var cman draw
	var hidetrain 1
	
fightmonster.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto fightmonster.exit
	if (($Heavy_Edged.LearningRate > 33) && ($Twohanded_Edged.LearningRate > 33) && ($Thanatology_LearningRate > 33)) then goto fightmonster.exit
	if $monstercount < 1 then gosub pause 1
	if "%weaponrange" = "melee" then
	{
		gosub tmcheck
		if (("$righthandnoun" != "sword") && ("$lefthandnoun" != "sword")) then 
		{
			gosub emptyhands
			gosub get my sword
		}
		if $monstercount < 1 then delay 1
		if (("%swapsword" = "he") then
		{
			var temp2he $Twohanded_Edged.LearningRate
			math temp2he add 5
			if %temp2he > 33 then var temp2he 33
			if ($Heavy_Edged.LearningRate > %temp2he) then gosub put.1 "swap my sword" "^You switch"
		}
		if (("%swapsword" = "2he") then
		{
			var temphe $Heavy_Edged.LearningRate
			math temphe add 5
			if %temphe > 33 then var temphe 33
			if %temphe < $Twohanded_Edged.LearningRate then gosub put.1 "swap my sword" "^You switch"
		}
	## ** Main combat driver
	if %hidetrain = 1 then
	{
		if $Hiding.LearningRate < 30 then
		{
			var hidetrain 0
			gosub put.1 "hide" "%hide.msg"
		}
			
		if (($Stalking.LearningRate < 30) && ($hidden = 1)) then gosub put.1 "stalk" "%stalk.msg"
	}
	gosub put.1 "%cman" "%cman.msg"
	}
		else gosub pause 1
	gosub deathcheck
	gosub ppcheck
	#gosub buffcheck
	gosub huntcheck
	gosub stamcheck 
	
goto fightmonster.loop
fightmonster.exit:
return

le.fight:
	put #var train.start $gametime
	gosub startskill Small_Edged
	#gosub leslice.combo
	gosub dodge attack
	gosub put.1 "remove robe" "^You work"
	gosub stow robe
	var cman slice
	var hidetrain 1
le.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if %traintemp > 1200 then goto le.exit
	if (($Small_Edged.LearningRate) > 33 && ($Offhand_Weapon.LearningRate > 33) && ($Stealth.LearningRate > 33)) then goto le.exit
	#if (($Small_Edged.LearningRate) > 33 && ($Offhand_Weapon.LearningRate > 33)) then goto le.exit
	#if $Stealth.LearningRate > 33 then goto le.exit
	if "%weaponrange" = "melee" then
	{
		if $monstercount < 1 then gosub pause 1
		if (("$righthandnoun" != "axe") && ("$lefthandnoun" != "axe")) then 
		{
			gosub emptyhands
			gosub get my axe
			if (("$righthandnoun" = "axe") && ($Offhand_Weapon.LearningRate < 34)) then gosub put.1 "swap" "^You move"
		}
		if (("$lefthandnoun" = "axe") && ($Offhand_Weapon.LearningRate > 33)) then gosub put.1 "swap" "^You move"
		if (("$righthandnoun" = "axe") && ($Small_Edged.LearningRate > 33)) then gosub put.1 "swap" "^You move"
		if %hidetrain = 1 then
		{	
			if (($Stealth.LearningRate < 34) && ($monstercount > 0)) then
			{	
				#var hidetrain 0
				gosub put.1 "hide" "%hide.msg"
			}
			if (($Stealth.LearningRate < 34) && ($hidden = 1)) then gosub put.1 "stalk" "%stalk.msg"
		}
		if (($Small_Edged.LearningRate) < 35 || ($Offhand_Weapon.LearningRate < 35)) then
		{
			if "$lefthandnoun" = "axe" then gosub put.1 "%cman left" "%cman.msg"
			if "$righthandnoun" = "axe" then gosub put.1 "%cman" "%cman.msg"
		}
			elseif (("$preparedspell" != "Acid Splash") || ("$preparedspell" != "Energy Bolt")) then delay 1
	}
		else
		{
			if (($monstercount > 0) && (%advance = 0) && ($health > 89)) then gosub adv
				else
				{
					gosub startcollect 1
				}
		}
	gosub deathcheck
	if (($health < 95) && ($monstercount > 0)) then gosub casttarget sv 1 10
	if $Appraisal.LearningRate < 32 then gosub appcritter
	gosub ppcheck
	#gosub buffcheck
	gosub huntcheck
	gosub stamcheck
	goto le.loop
le.exit:
	gosub get robe
	gosub put.1 "wear robe" "^Roundtime"
	gosub endskill Small_Edged
return

tm.fight:
	put #var train.start $gametime
	gosub startskill Targeted_Magic
	action put face next when ^You are not engaged to anything
	
	gosub block attack
	gosub release spell
	var cman NONE
tm.loop:
	if (("$righthandnoun" != "axe") && ("$lefthandnoun" != "axe")) then 
		{
			gosub emptyhands
			gosub get my axe
		}
	gosub pause .5
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds train
	if (($Targeted_Magic.LearningRate > 33) || (%traintemp > 1200)) then goto tm.exit
	#gosub buffcheck
	if $monstercount > 0 then gosub tmcheck
	if $monstercount > 0 then gosub tmcheck
	#if $Appraisal.LearningRate < 32 then gosub appcritter
	if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
	#gosub buffcheck
	gosub ppcheck
	gosub huntcheck
	goto tm.loop
tm.exit:
	gosub endskill Targeted_Magic
	action remove ^You are not engaged to anything
	gosub release spell
return

debil.fight:
	put #var train.start $gametime
	gosub startskill Debilitation
	action put face next when ^You are not engaged to anything
	
	gosub block
	gosub release
	var cman NONE
	var Soul off
	var Malediction off
debil.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds train
	if (($Debilitation.LearningRate > 33) || (%traintemp > 1200)) then goto debil.exit
	gosub buffcheck
	if (("%Malediction" = "off") && ($monstercount > 0) && (("$preparedspell" = "None") || ("$preparedspell" = "Malediction"))) then gosub castbuff "Malediction" 5 5 3
	if (("%Soul" = "off") && ($monstercount > 0) && (("$preparedspell" = "None") || ("$preparedspell" = "Soul Bonding"))) then gosub castbuff "Soul Bonding" 5 5 3
	if (($monstercount > 0) && ("$preparedspell" = "None")) then
	{
		gosub put.1 "prep sick 5" "^You begin"
		gosub cast
	}
		else delay 1
	if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
	#gosub buffcheck
	gosub ppcheck
	gosub huntcheck
	goto debil.loop
debil.exit:
	gosub endskill Debilitation
	action remove ^You are not engaged to anything
	gosub release
return	

ht.fight:
	put #var train.start $gametime
	gosub startskill Heavy_Thrown
	action put face next when ^You are not engaged to anything
	
	gosub block attack
	gosub emptyhands
	var cman NONE
ht.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds train
	if "%Zephyr" = "off" then gosub castbuff Zephyr 15 30 12
	if (($Heavy_Thrown.LearningRate > 33) || (%traintemp > 1200)) then goto ht.exit
	if (("%Malediction" = "off") && ($monstercount > 0) && (("$preparedspell" = "None") || ("$preparedspell" = "Malediction"))) then gosub castbuff "Malediction" 20 20 8
	if $monstercount > 0 then
	{
		#gosub put.1 "bob" "^Roundtime"
		if (($Heavy_Thrown.LearningRate < 34) && ("$righthandnoun" != "hammer")) then gosub put.2 "get hamm" "throw" "%cman.msg"
		if (($Heavy_Thrown.LearningRate < 34) && ("$righthandnoun" = "hammer")) then gosub put.1 "throw" "%cman.msg"
	}
		else gosub throwcheck
	gosub deathcheck
	if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
	gosub buffcheck
	gosub ppcheck
	goto ht.loop
ht.exit:
	gosub endskill Heavy_Thrown
	action remove ^You are not engaged to anything
	gosub throwcheck
return	
	
hb.fight:
	put #var train.start $gametime
	gosub startskill Large_Blunt
	
	gosub block attack
	var cman slice
hb.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds train
	if ((($Large_Blunt.LearningRate > %globalexp) || (%traintemp > 1200)) then goto hb.exit
	if "%Zephyr" = "off" then gosub castbuff Zephyr 15 30 12
	if (("%Malediction" = "off") && ($monstercount > 0) && (("$preparedspell" = "None") || ("$preparedspell" = "Malediction"))) then gosub castbuff "Malediction" 20 20 8
	if ("%weaponrange" = "melee") then
	{
		if $monstercount < 1 then
		{
			if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
			var weaponrange
		}
		if (("$righthandnoun" != "star") && ("$lefthandnoun" != "star")) then 
		{
			gosub emptyhands
			gosub put.1 "wield star" "%wield.msg"
		}
		if $Large_Blunt.LearningRate < 34 then if "$righthandnoun" = "star" then gosub put.1 "%cman" "%cman.msg"
	}
		else
		{
			if (($monstercount > 0) && (%advance = 0)) then gosub adv
				else 
				{
					if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
						else gosub pause 1
				}
		}
	gosub deathcheck
	gosub ppcheck
	gosub buffcheck
	gosub huntcheck
	gosub stamcheck
	goto hb.loop
hb.exit:
	gosub endskill Large_Blunt
	gosub emptyhands
	
return

pole.fight:
	put #var train.start $gametime
	gosub startskill Polearms
	
	gosub block attack
	var cman slice
pole.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds train
	if ((($Polearms.LearningRate > %globalexp) || (%traintemp > 1200)) then goto pole.exit
	#if "%Zephyr" = "off" then gosub castbuff Zephyr 15 30 12
	#if (("%Malediction" = "off") && ($monstercount > 0) && (("$preparedspell" = "None") || ("$preparedspell" = "Malediction"))) then gosub castbuff "Malediction" 20 20 8
	if ("%weaponrange" = "melee") then
	{
		if $monstercount < 1 then
		{
			if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
			var weaponrange
		}
		if (("$righthandnoun" != "scythe") && ("$lefthandnoun" != "scythe")) then 
		{
			gosub emptyhands
			gosub put.1 "rem scythe" "%wear.msg"
		}
		if $Polearms.LearningRate < 34 then if "$righthandnoun" = "scythe" then gosub put.1 "%cman" "%cman.msg"
	}
		else
		{
			if (($monstercount > 0) && (%advance = 0)) then gosub adv
				else 
				{
					if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
						else gosub pause 1
				}
		}
	gosub deathcheck
	gosub ppcheck
	gosub buffcheck
	gosub huntcheck
	gosub stamcheck
	goto pole.loop
pole.exit:
	gosub endskill Polearms
	gosub emptyhands
	
return

brawl.start:
	action var analyze_now 1 when ^Utilizing .+ tactics|^You fail to find|^You can no longer see|^You must be closer to use tactical
	action math combo_pos subtract 1 when A %moblong (dodges|evades),
	action (combos) var combo $1 when by landing (.*)\.$
	action (combos) off
	
	gosub cyclic_check
	gosub block attack
	gosub emptyhands
	var analyze_now 1
	delay 5
brawl.loop:
	if (($monstercount > 0) && ("%weaponrange" = "melee")) then
	{
		if %analyze_now = 1 then gosub analyze 
		gosub put.1 "%combo(%combo_pos)" "%cman.msg"
		math combo_pos add 1
	}
	else gosub pause 1
	gosub quickspelltrain
	gosub buffcheck
	gosub ppcheck
	gosub huntcheck
	gosub deathcheck
	gosub stamcheck
	if (($Brawling.LearningRate < 33) || ($Tactics.LearningRate < 33)) then goto brawl.loop
	#if (($Brawling.LearningRate < 33)) then goto brawl.loop
	gosub release spell
return

analyze:
	var analyze_now 0
	action (combos) on
	gosub put.1 "analyze" "^Roundtime|^You fail to find"
	var combo_pos 1
	eval combo replacere("%combo", "(,?\s?((an|a)|and (an|a))\s)", "|")
    action (combos) off
	if %analyze_now = 1 then goto analyze
return

## ** brawl old
#brawl.start:
	#var brawlman bob|weave|circle|parry|shove
	#var bnum 0
#	gosub block
#brawl.loop:
#	gosub put.1 "%brawlman(%bnum)" "^Roundtime"
#	math bnum add 1
#	if %bnum = 4 then var bnum 0
#	gosub buffcheck
#	gosub ppcheck
#	gosub huntcheck
#	if $Brawling.LearningRate < %globalexp then goto brawl.loop
#return


tactics.start:
	var bnum 0
	var tacticsman bob|weave|circle|shove
	
	gosub startskill Tactics
	gosub block
tactics.loop:
	if "%weaponrange" = "melee" then gosub put.1 "%tacticsman(%bnum)" "^Roundtime"
		else gosub pause 1
	#math bnum add 1
	if %bnum = 4 then var bnum 0
	gosub buffcheck
	if ((($Arcana.LearningRate < 35) || ($Primary_Magic.LearningRate < 35)) && ($monstercount < 1)) then gosub startcollect 1
	gosub quickspelltrain
	if "$guild" = "XXXX" then
	{
		gosub fissurecheck
		gosub magetrain
	}
	gosub ppcheck
	gosub huntcheck
	if $Tactics.LearningRate < 33 then goto tactics.loop
	
	gosub endskill Tactics
	gosub release
return

rangedcombat.start:
	put #var train.start $gametime
	var ammo bolt
	var tmcast 1
	var noskin 0
	
	gosub startskill Crossbow
	gosub block attack
	#gosub put.1 "remove shield" "^You loosen"
	gosub put.1 "stance set 80 0 100 100"  "^Setting your"
rangedcombat.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	if (($Crossbow.LearningRate > 33) || (%traintemp > 1200)) then goto kill.ranged
	if $monstercount > 0 then
	if "%weaponrange" = "melee" then
	{
		gosub aim
		gosub fire
	}
		else
		{
			if (($monstercount > 0) && (%advance = 0) && ($health > 89)) then gosub adv
				else gosub startcollect 1
		}
	if "%Manifest" = "off" then gosub castbuff "Manifest Force" 15 15 20
	gosub deathcheck
	gosub getammo
	goto rangedcombat.loop
kill.ranged:
	if %ammogone = 1 then
	{
		gosub tmcheck
		gosub getammo
		delay .5
		goto kill.ranged
	}
rangedcombat.exit:
	var noskin 0
	gosub emptyhands
	gosub endskill Crossbow
	
return
	
deathcheck:
	#if $monstercount > 2 then gosub quick.frostbite
	if matchre("$roomobjs", "(which|that) appears dead") then
	{
		if %aiming = 1 then 
		{
			gosub put.1 "aim stop" "^You stop concentrating|^But you're not"		
			var aiming 0
			var aimfull 0
		}
		#var hidetrain 1
		var analyze_now 1
		var do.tactics 1
		var weaponrange missile
		if (("$preparedspell" = "%targetspell") && !matchre("$preparedspell", "%areaspells")) then gosub release spell
		if (("$guild" = "Necromancer") && (%ritualon = 1) then if matchre ("$roomobjs", "(%ritualcritters) ((which|that) appears dead|\(dead\))") then gosub ritual $1
		gosub skinarray
		if $monstercount > 0 then gosub put.1 "face next" "^You turn|^There is nothing" 
		gosub %attackstance
		if matchre("$roomobjs", "(which|that) appears dead") then gosub deathwait
		var Soul off
		var Malediction off
		goto deathcheck
	}
return

deathwait:
	put #var last.death $gametime
deathwait.loop:
	delay 1
	evalmath deathtemp ($gametime - $last.death)
	if %deathtemp > 3 then return
	if matchre("$roomobjs", "(which|that) appears dead") then goto deathwait.loop
return


debilcheck:
	if $debiloff = 1 then return
	#if $Debilitation.LearningRate > 30 then return
	#if (($Debilitation.LearningRate > 33) && ("%trainweapon.var" != "%bowtype")) then return
	#if $Debilitation.LearningRate > 33 then return
	if %debilitation.var = 1 then
	{
		if (("$roomplayers" = "") && ("$guild" = "Necromancer")) then 
		{
			#if (("%Heighten" = "off") && (("$preparedspell" = "None") || ("$preparedspell" = "Heighten Pain"))) then gosub castbuff "Heighten #Pain" 5 5 9
			if (("%Petrifying" = "off")) && (("$preparedspell" = "None") || ("$preparedspell" = "Petrifying Visions"))) then gosub castbuff "Petrifying Visions" 5 5 5
		}
		if "$guild" = "Cleric" then
		{
			#if (($monstercount > 0) && (!matchre("$monsterlist", "stunned")) && (("$preparedspell" = "None") || ("$preparedspell" = "Phelim's Sanction"))) then #gosub castbuff "Phelim's Sanction" 10 10 5
		#else if (("%Malediction" = "off")) && (("$preparedspell" = "None") || ("$preparedspell" = "Malediction"))) then gosub castbuff "Malediction" 10 10 5
		if (("%Soul" = "off")) && (("$preparedspell" = "None") || ("$preparedspell" = "Soul Sickness"))) then gosub castbuff "Soul Sickness" 5 5 5
		}
	}
return

tmcheck:
	if "$1" = "hplow" then
	{
		gosub casttarget "Siphon Vitality" 10 10 %tmdelay
		gosub deathcheck
		return
	}
	if ("$1" = "killnow"|"%trainskill.var" = "Thanatology") then
	{
		if "%Manifest" = "off" then gosub castbuff "Manifest Force" 15 15 4
		#gosub casttarget "Acid Splash" 10 10 %tmdelay
		if $mana > 50 then gosub casttarget "Fire of Ushnish" 10 10 15
		gosub casttarget "Fists of Faenella" 30 30 %tmdelay
		gosub deathcheck
		return
	}
	if $tmoff = 1 then return
	if $Targeted_Magic.LearningRate > 33 then return
	if %tmcast = 1 then
	{
		if (("$roomplayers" = "") && ("$guild" = "Necromancer")) then 
		{
			var targetspell Acid Splash
			if $health < 95 then var targetspell Siphon Vitality
		}
			else if ("$guild" = "Necromancer") then return
		if ("$guild" = "Cleric") then
		{
			## **** Change this when you have new spells
			if (($monstercount > 1) && ($mana > 50)) then 
			{
				#if "$preparedspell" = "Hand of Tenemlor" then gosub release
				var targetspell Fire of Ushnish
				var tmdelay 15
			}
				else
				{
					#if %ranged.train = 0 then if !matchre("$roomobjs", "(coin|mattock|card|runestone)") then put drop 10 copper dokoras
					#if %ranged.train = 0 then if matchre("$roomobjs", "(coin|mattock|card|runestone)") then var targetspell Telekinetic Throw
					#if "$preparedspell" = "Divine Radiance" then gosub release
					#var targetspell Hand of Tenemlor
					var targetspell Fists of Faenella
					var tmdelay 10
					#if %ranged.train = 0 then if matchre("$roomobjs", "(coin|mattock|card)") then var targetspell Telekinetic Throw
				}
		}
		if "$guild" = "mage" then var targetspell Geyser
		if ((matchre("$preparedspell", "%targetspells")) && ($spelltime < %tmdelay)) then return
		if ((matchre("$preparedspell", "%targetspells")) || ("$preparedspell" = "None")) then 
		{
			gosub casttarget "%targetspell" 5 5 %tmdelay
			#gosub casttarget "%targetspell" 2 0
		}
			else if "$preparedspell" = "None" then gosub casttarget "%targetspell" 5 5 %tmdelay
	}
		else return
	gosub deathcheck
return

tingleroom:
	var tingleon 1
	## ** monster 4 tingle
	if $spelltime > 5 then gosub spelldelay
	if "$preparedspell" != "None" then gosub release
	eval crittercount count("$monsterlist", "%monster4")
	if %crittercount > 0 then gosub tinglerun %monster4


	var tinglenow 0
	var tingleon 0
return

tinglerun:
	gosub prep tingle
	gosub pause 4
	gosub cast $0
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub prep tingle
	gosub pause 4
	gosub cast second $0
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub prep tingle
	gosub pause 4
	gosub cast third $0
	math crittercount subtract 1
	if %crittercount < 1 then return
	
	gosub prep tingle
	gosub pause 4
	gosub cast fourth $0
	math crittercount subtract 1
	if %crittercount < 1 then return
return

huntcheck:
	if $monstercount >= %maxcreature.area then return
	if $Perception.LearningRate > 30 then return
	evalmath hunttemp ($gametime - $last.hunt)
	## 75 second timer
	if %hunttemp > 75 then goto huntnow
		else return
huntnow:
	put #var last.hunt $gametime
	gosub put.1 "hunt" "^Roundtime"
return

start.stalk:
	var c 0
	if (($Stalking.LearningRate > 30) && ($monstercount < 2) && ("$weaponrange" != "melee")) then return
	
mob.count:
	var mob.temp $monsterlist 
	var mob1.c 0
	var mob2.c 0
	var mob3.c 0
	var mob4.c 0
	eval mob.temp replace("%mob.temp", ", ", "|")
	eval mob.temp replace("%mob.temp", " and ","|")
	eval mob.temp replace("%mob.temp", ".", "|")
	eval mob1.c count("%mob.temp", "%mob1")
	eval mob2.c count("%mob.temp", "%mob2")
	eval mob3.c count("%mob.temp", "%mob3")
	eval mob4.c count("%mob.temp", "%mob4")
	evalmath totalmob (%mob1.c + %mob2.c + %mob3.c + %mob4.c)
	
	if $hidden = 0 then gosub put.1 "hide" "^Roundtime"
	if "%weaponrange" = "melee" then gosub retreat.pole

mob1.c:
	if %mob1.c != 0 then 
	{
		gosub adv %counter(%c) %mob1
		evalmath c (%c +1 )
		if %c < %mob1.c then goto mob1.c
		var c 0
	}

mob2.c:
	if %mob2.c != 0 then 
	{
		gosub adv %counter(%c) %mob2
		evalmath c (%c +1 )
		if %c < %mob2.c then goto mob2.c
		var c 0
	}

	mob3.c:
	if %mob3.c != 0 then 
	{
		gosub adv %counter(%c) %mob3
		evalmath c (%c +1 )
		if %c < %mob3.c then goto mob3.c
		var c 0
	}

mob4.c:
	if %mob4.c != 0 then 
	{
		gosub adv %counter(%c) %mob4 
		evalmath c (%c +1 )
		if %c < %mob4.c then goto mob4.c
		var c 0
	}
	gosub unhide
return
	
activecount:
	if $monstercount = 0 then var dirt no
	if $monstercount = 0 then goto activehunt
	if contains("$roomobjs", "$monster1") then return
	if contains("$roomobjs", "$monster2") then return
	if contains("$roomobjs", "$monster3") then return
	if contains("$roomobjs", "$monster4") then return
	goto activehunt

retreat.missile:
	matchre return ^You retreat from combat|^You are already|^You sneak back
	matchre retreat.missile ^You retreat back|^Roundtime:|^You stop advancing|%rtwait
	put ret
	matchwait 10
return
	
retreat.pole:
	matchre return ^You retreat|^You are already|^You sneak back
	matchre retreat.pole ^Roundtime\:|%rt.com|^You stop advancing
	put ret
	matchwait 10
return
	
dodge:
	var dodgestance $1
	if (("%dodgestance" = "attack") && ("%laststance" = "dodge attack")) then return
		else if (("%dodgestance" != "attack") && ("%laststance" = "dodge")) then return
	## ** character setup
	if "$charactername" = "Kaislan" then
	{
		if matchre("%trainweapon.var", "Bow|Crossbow") then var stance_dodge 100 0 100 0
			else var stance_dodge 100 0 100 0
		if matchre("%trainweapon.var", "Bow|Crossbow") then var stance_attack 83 0 100 100
			else var stance_attack 83 0 100 100
	}
	var stance dodge
	if "%dodgestance" = "attack" then var stance dodge attack
	if "%dodgestance" != "attack" then gosub put.1 "stance set %stance_dodge" "^Setting your"
		else gosub put.1 "stance set %stance_attack" "^Setting your"
		
	var laststance %stance
	if %dodge = 0 then gosub put.1 "dodge" "\[Roundtime|^But you are already|Roundtime"
return

parry:
	if (("$1" = "attack") && ("%laststance" = "parry attack")) then return
		else if (("$1" != "attack") && ("%laststance" = "parry")) then return
	if (("$righthand" = "Empty") && ("%trainweapon.var" != "NONE")) then gosub get my %trainweapon.var
	## ** character setup
	if "$charactername" = "Kaislan" then
	{
		var stance_parry 100 53 50 0
		var stance_attack 50 80 53 100
	}
	var stance parry
	if "$1" = "attack" then var stance parry attack
	if "$1" != "attack" then gosub put.1 "stance set %stance_dodge" "^Setting your"
		else gosub put.1 "stance set %stance_attack" "^Setting your"
	
	var laststance %stance
	if %dodge = 0 then gosub put.1 "dodge" "\[Roundtime|^But you are already|Roundtime"
return

block:
	## ** character setup
	if "$charactername" = "Kaislan" then
	{
		var stance_block 60 42 100 0
		var stance_attack 40 42 100 100
	}
	if "$charactername" = "Vayek" then
	{
		var stance_block 41 41 100 0
		var stance_attack 41 41 100 100
	}
	var stance block
	if "$1" = "attack" then var stance block attack
	if "$1" != "attack" then 
	{
		if "%laststance" = "block" then return
		gosub put.1 "stance set %stance_block" "^Setting your"
		gosub put.1 "stance set 60 60 100 0" "^Setting your"
	}
		else 
		{
			if "%laststance" = "block attack" then return
			gosub put.1 "stance set %stance_attack" "^Setting your"
			#gosub put.1 "stance set 60 60 61 0" "^Setting your"
			#gosub put.1 "stance set 60 60 81" "^Setting your"
			#gosub put.1 "stance set 60 80 81" "^Setting your"
			#gosub put.1 "stance set 60 60 81 100" "^Setting your"			
		}
	var laststance %stance
	if %block = 0 then gosub put.1 "block" "\[Roundtime|^But you are already|Roundtime"
return

armorswap:
	if "$2" = "$lastarmor" then
	{
		echo Current armor is $1.  No need to rewear.
		return
	}
	gosub $1.remove
	gosub $2.wear
	put #var lastarmor $2
return

heavy.wear:
	var heavy 1
	gosub put.2 "get heav grea" "wear grea" "%wear.msg"
	gosub put.2 "get helm" "wear helm" "%wear.msg"
	gosub put.2 "get cuir" "wear cuir" "%wear.msg"
	gosub put.2 "get shield" "wear shield" "%wear.msg"	
	gosub put.2 "get sleeve" "wear sleeve" "%wear.msg"
return

heavy.remove:
	var heavy 0
	gosub put.2 "rem heavy grea" "stow grea" "%stow.msg"
	gosub put.2 "rem helm" "stow helm" "%stow.msg"
	gosub put.2 "rem shield" "stow shield" "%stow.msg"
	gosub put.2 "rem slee" "stow slee" "%stow.msg"
	gosub put.2 "rem cuir" "stow cuir" "%stow.msg"
return

brig.wear:
	gosub put.2 "get lam vamb" "wear vamb" "%wear.msg"
	gosub put.2 "get lam grea" "wear grea" "%wear.msg"
	gosub put.2 "get lorica" "wear lorica" "%wear.msg"
return

brig.remove:
	gosub put.2 "rem lam vamb" "stow vamb" "%stow.msg"
	gosub put.2 "rem lorica" "stow lorica" "%stow.msg"
	gosub put.2 "rem lam grea" "stow grea" "%stow.msg"
return

trainarmor:
	var bodytrain lorica
	var helmtrain balaclava
	if "$1" = "remove" then
	{
		if %trainarmor.var = 0 then return
		var trainarmor.var 0
		#gosub put.2 "rem shield" "stow shield" "%stow.msg"
		gosub put.2 "rem %helmtrain" "stow %helmtrain" "%stow.msg"
		gosub put.2 "rem greave" "stow greave" "%stow.msg"
		gosub put.2 "rem vamb" "stow vamb" "%stow.msg"
		gosub put.2 "rem %bodytrain" "stow %bodytrain" "%stow.msg"
		gosub put.2 "rem gloves" "stow gloves" "%stow.msg"
	}
	else if "$1" = "wear" then
		{
			if %trainarmor.var = 1 then return
			var trainarmor.var 1
			#gosub put.2 "get my shield" "wear shield" "%wear.msg"
			gosub put.2 "get my %bodytrain" "wear %bodytrain" "%wear.msg"
			gosub put.2 "get my greave" "wear greave" "%wear.msg"
			gosub put.2 "get my vamb" "wear vamb" "%wear.msg"
			gosub put.2 "get my gloves" "wear gloves" "%wear.msg"
			gosub put.2 "get my %helmtrain" "wear %helmtrain" "%wear.msg"
		}
return

box.remove:
	gosub put.2 "rem bala" "stow bala" "%stow.msg"
	gosub put.2 "rem glo" "stow glo" "%stow.msg"
return

box.wear:
	gosub put.2 "get my bala" "wear bala" "%wear.msg"
	gosub put.2 "get my glo" "wear glo" "%wear.msg"
return

stunned:
	goto exitquick
	setvariable resonance stunned
	pause 1
	if $stunned = 1 then goto stunned
	gosub put khri stop
	gosub put khri start silence
	if not $invisible = 1 then goto noinvisostunned
	pause 5
	if not $invisible = 1 then goto noinvisostunned
	gosub smartranged
	pause 20
	pause 20
	noinvisostunned:
	put stand
	pause 1
	gosub retreat
	pause 1
	gosub put khri stop
	goto mainloop

adv:
	var advance 1
	gosub put.1 "adv $0" "%advance.msg"
return
	
hunt:
	if $hidden = 1 then return
	if %hunttime > %grandcounter then return
	if $monstercount = 0 then if $hidden = 1 then gosub put unhide
	if $Perception.LearningRate > 29 then return

	gosub put hunt
	evalmath hunttime (%grandcounter + 1)
	return

flee:
	if "$guild" = "Necromancer" then return
	if $monstercount < 1 then return
	var bardrecast 1
	action var doflee 1 when your exit\.$|^You realize|^You are already|It's all a blur|^Hoping the gods
	action var doflee 0 when ^Obvious|^You assess
	gosub put.1 "flee" "your exit\.$|^You assess|^You realize|^You are already"
flee.loop:
	if %doflee = 1 then
		{
			gosub pause 1
			goto flee.loop
		}
	var bardrecast 0
	action remove your exit\.$|^You realize|^You are already|It's all a blur|^Hoping the gods
	action remove ^Obvious|^You assess
return
	


appcritter:
return
	if $Appraisal.LearningRate > 30 then return
		#gosub put.1 "app shield" "^Roundtime"
	eval crittercount count("$monsterlist", "%monster1")
		if %crittercount > 0 then gosub apprun %monster1
	eval crittercount count("$monsterlist", "%monster2")
		if %crittercount > 0 then gosub apprun %monster2
	eval crittercount count("$monsterlist", "%monster3")
		if %crittercount > 0 then gosub apprun %monster3
	eval crittercount count("$monsterlist", "%monster4")
		if %crittercount > 0 then gosub apprun %monster4

	#if $monstercount < 1 then gosub pause 5
	#delay 1

return

apprun:
	gosub put.1 "app $0 quick" "^\[Roundtime|^You cannot|^You can't"
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put.1 "app second $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put.1 "app third $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put.1 "app fourth $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return
return

spawncheck:
	if (($Heavy_Plate.LearningRate > 33) && ($Light_Plate.LearningRate < 20) && ("$lastarmor" = "heavy")) then gosub armorswap heavy brig
		elseif (($Heavy_Plate.LearningRate < 15) && ("$lastarmor" != "heavy")) then gosub armorswap $lastarmor heavy
	if (($Light_Plate.LearningRate > 33) && ("$lastarmor" = "brig")) then gosub armorswap brig heavy
	
	if (($monstercount < 4) && ("%Sire" = "off") && ($stamina > 80)) then 
		{
			if %loud = 0 then gosub put.1 "song loud" "^You are|^You will"
			if (("%laststance" != "parry") || ("%laststance" != "parry attack")) then gosub bardcast Sire
				else gosub bardcast Harmony
		}
	if (($monstercount > 3) && ("%Sire" = "on") && ($stamina > 80)) then 
		{
			gosub splay
			if %forceloud = 1 then 
			{
				if %loud = 0 then gosub put.1 "song loud" "^You are|^You will"
			}
			elseif %loud = 1 then gosub put.1 "song quiet" "^You are|^You will"
			gosub bardcast Harmony
		}
return

stance:
	eval stancefull replace ("$0", " ", "|")
	var stancetype %stancefull(0)
	var stancelevel %stancefull(1)
	if "%stancelevel" = "" then if "%%stancetype" = "100" then return
	if "%stancelevel" = "%%stancetype" then return

	put stance %stancetype %stancelevel
	gosub roundtime
	return

needtorest:
	if $stamina > 79 then return
	setvariable resonance needtorest
	echo ** WHEW need to rest **
	if $stamina < 65 then goto leavecombat
	if $stamina < 70 then pause 5
	if $stamina < 80 then pause 5
	return

swing1:
	put engage
	if $monstercount < 1 then goto activehunt
	var engage_start %halfcounter
	swingloop:
	if "%weaponrange" != "melee" then pause 1
	if "%weaponrange" != "melee" then pause 1
	if "%weaponrange" != "melee" then gosub pause 1
	if "%weaponrange" != "melee" then pause 1
	if "%weaponrange" != "melee" then pause 1
	setvariable engage no
swing:
	setvariable swing $0
	if matchre("%swing", ".*parry.*") then var swing parry
	if matchre("%swing", ".*dodge.*") then var swing dodge
	if matchre("%swing", "backstab") then if $hidden = 0 then gosub hide
	if matchre("%swing", "ambush") then if $hidden = 0 then gosub hide
	if "$righthand" = "Empty" then gosub getmelee
	gosub needtorest
	gosub stance attack 100
	gosub put %swing
	gosub skinarray
	if "%weaponrange" != "melee" then goto swing1
	return



Throw123:
	if "%appnew" = "yes" then gosub appcritter
	gosub needtorest
	gosub stance attack 100
	gosub put throw
	gosub skinarray
	if "%engage" = "yes" then goto swing1
	return

aim:
	gosub getranged
	gosub load
	gosub put.1 "aim" "^You begin"	
	matchre return ^You think you have your best shot possible now\.
	matchwait 1
	return

snipe:
fire:
	gosub getranged
	if $hidden = 1 then gosub put poach
		else gosub put.1 "fire" "^\[Roundtime"
	var loaded 0
	return
load:
	var ammogone 1
	if %loaded = 1 then return
	if $hidden = 1 then gosub unhide
	gosub getranged
	gosub put.1 "nock cross" "^Roundtime"
	var loaded 1
	return

getranged:
	if "$righthandnoun" != "crossbow" then gosub put.1 "remove crossbow" "%wield.msg"
	return
	
getammo:
	var start.loop $gametime
getammo.loop:
	gosub deathcheck
	evalmath looptemp ($gametime - %start.loop)
	echo %looptemp seconds in loop.
	
	if %looptemp > 180 then
	{
	echo ****** SERIOUS ERROR *******
	echo ****** SERIOUS ERROR *******
	echo ****** IN LOOP FOR OVER 3 MINUTES ******
	echo ****** IN LOOP FOR OVER 3 MINUTES ******
	echo ****** EXITING LOOP ******
	put #echo >log Serious error in getammo.loop.  See skilllog.
	put #log >SkillLog Error in getammo.loop
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand
	put #log >SkillLog $roomobjs
	put #log >SkillLog $roomplayers
	put #log >SkillLog $roomname
	put #log >SkillLog $roomexits
	put #log >SkillLog $righthand
	put #log >SkillLog $lefthand
	return
	}
	
	if matchre("$roomobjs", "(%ammo)") then 
	{
		#if (("$lefthandnoun" = "shield") || ("$righthandnoun" = "shield")) then gosub put.1 "wear shield" "%wear.msg"
		var ammogone 0
		gosub put.1 "stow $1" "^You put|^Stow"
		goto getammo.loop
	}
	#if (("$lefthandnoun" != "shield") && ("$righthandnoun" != "shield")) then gosub put.1 "remove shield" "^You loosen"
return
	
throwcheck:
	var throwcheck 1
	if contains("$roomobjs", "throwing hammer") then 
		{
			gosub put.1 "stow ham" "^You put|^Stow"
			goto throwcheck
		}
	if contains("$roomobjs", "lush green prayer mat") then 
		{
			gosub emptyhands
			gosub put.1 "roll mat" "^You carefully" 
			gosub put.1 "stow mat" "^You put|^Stow"
			goto throwcheck
		}
	if contains("$roomobjs", "lumium light spear") then 
		{
			gosub put.1 "stow spear" "^You put|^Stow"
			goto throwcheck
		}
	if contains("$roomobjs", "javelin") then 
		{
			gosub put.1 "stow jave" "^You put|^Stow"
			goto throwcheck
		}
	if matchre("$roomobjs", "bola\b") then 
		{
			gosub put.1 "stow bola" "^You put|^Stow"
			goto throwcheck
		}
	if matchre("$roomobjs", "throwing axe\b") then 
		{
			gosub put.1 "stow axe" "^You put|^Stow"
			goto throwcheck
		}
	if matchre("$roomobjs", "steelstar\b") then 
		{
		action math tempthrown add 1 when ^You put your steelstar in
		action put #parse @stowdone;var tempthrown 0 when eval %tempthrown = 2
			eval thrownweap.count count("$roomobjs", "%thrownweap")
			if %thrownweap.count > 1 then
			{
				put stow steel
				gosub put.1 "stow steel" "@stowdone|^Stow"
			}
				else gosub put.1 "stow steel" "^You put|^Stow"
			goto throwcheck
		}
#	if %exitnow = 1 then return
	var throwcheck 0
	var tempthrown 0
	#action remove eval %tempthrown = 2
	#action remove ^You put your steelstar in
return


retreat:
	gosub roundtimedone
	pause 0.1
	put retreat
	matchre retdone ^You retreat from combat
	matchre retdone ^You sneak back out of combat
	matchre retdone ^You are already as far away as you can get
	matchre retreat ^You sneak back out to pole
	matchre retreat ^You stop advancing
	matchre retreat %kritter.*closes to pole weapon range on you
	matchre retreat lands a.*to you
	matchre retreat ...wait
	matchre retreat You can't do that while entangled
	matchre retreat type ahead
	matchre retreat a sand sprite
	matchre retreat You are still stunned
	matchre fleenow You try to sneak out of combat, but are unable to get away
	matchre retreat ^You retreat back to pole range
	matchre retreat ^You are unable to retreat
	matchwait 8
fleenow:
retdone:
	return

armoron:
	if $monstercount > 0 then gosub retreat
	gosub emptyhands
	if "%weaponrange" != "missile" then if $monstercount > 0 then gosub retreat
	gosub put get my coat
	gosub put wear my coat
	if "%weaponrange" != "missile" then if $monstercount > 0 then gosub retreat
	gosub put get my bala
	gosub put wear my bala
	if "%weaponrange" != "missile" then if $monstercount > 0 then gosub retreat
	gosub put get my gloves
	gosub put wear my gloves
	if "%weaponrange" != "missile" then if $monstercount > 0 then gosub retreat
	gosub put get my greav
	gosub put wear my greav
	if "%weaponrange" != "missile" then if $monstercount > 0 then gosub retreat
	gosub put get my shield
	gosub put wear my shield
	if "%weaponrange" != "missile" then if $monstercount > 0 then gosub retreat


	setvariable cheststat on
	setvariable shieldstat on
	setvariable glovestat on
	setvariable cowlstat on
	return

armoroff:
	if $monstercount > 0 then gosub retreat
	gosub emptyhands
	gosub put rem my coat
	gosub put stow my coat
	gosub put rem my bala
	gosub put stow my bala
	gosub put rem my gloves
	gosub put stow my gloves
	gosub put rem my greav
	gosub put stow my greav
	gosub put rem my shield
	gosub put stow my shield
	setvariable cheststat off
	setvariable shieldstat off
	setvariable glovestat off
	setvariable cowlstat off
	return

resetweapons:
	gosub emptyhands
	goto initialize
	
edge.combo:
	action var cman %man2 when [Yy]ou step backward
	action var cman %man3 when [Yy]ou sweep a
	action var cman %man4 when [Yy]ou slice a
	action var cman %man5 when [Yy]ou chop a
	action var cman %man1 when [Yy]ou feint a
	var man1 draw
	var man2 sweep
	var man3 slice
	var man4 chop
	var man5 feint
return

hb.combo:
	action var cman %man2 when [Yy]ou feint a
	action var cman %man3 when [Yy]ou bash a
	action var cman %man4 when [Yy]ou sweep a
	action var cman %man5 when [Yy]ou step backward
	action var cman %man1 when [Yy]ou swing a
	var man1 feint
	var man2 bash
	var man3 sweep
	var man4 draw
	var man5 swing
return

lethrust.combo:
	action var cman %man1 when [Yy]ou feint
	action var cman %man2 when [Yy]ou lunge
	action var cman %man3 when [Yy]ou thrust
	action var cman %man4 when [Yy]ou jab
	var man1 lunge
	var man2 thrust
	var man3 jab
	var man4 feint
return

leslice.combo:
	action var cman %man1 when [Yy]ou sweep a
	action var cman %man2 when [Yy]ou step backward
	action var cman %man3 when [Yy]ou slice a
	action var cman %man4 when [Yy]ou chop a
	var man1 draw
	var man2 slice
	var man3 chop
	var man4 sweep
return

include routinesearch.cmd
include bundle.cmd

## **** OLD CODE ***
#if "%trainweapon.var" = "riste" then
#{
#	if (($Twohanded_Blunt.LearningRate < 34) || ($Large_Blunt.LearningRate < 34) || ($Large_Edged.LearningRate < 34)) then if #($%weaponskill.var.LearningRate > 33) then gosub put.1 "swap my riste" "^You move"		
				#}