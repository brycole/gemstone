	routinecombat:
	setvariable cheststat off
	setvariable shieldstat off
	setvariable glovestat off
	setvariable cowlstat off
	var apptime 0
	var jacked none
	action setvariable evasion $1 when ^Your evasion ability is now set at (.*)\%\.
	action setvariable evasion $1 when ^  Evade  :  (.*)\%
	action setvariable shield $1 when ^Your shield ability is now set at (.*)\%\.
	action setvariable shield $1 when ^  Block  :  (.*)\%
	action setvariable parry $1 when ^Your parry ability is now set at (.*)\%\.
	action setvariable parry $1 when ^  Parry  :  (.*)\%
	action setvariable attack $1 when ^Your attack ability is now set at (.*)\%\.
	action setvariable attack none when ^You do not have enough points to allocate 100% toward your attack stance
	action setvariable attack $1 when ^  Attack :  (.*)\%
	action setvariable lastmaneuver parry when You move into a position to parry|already in a position to parry
	action setvariable lastmaneuver feint when ou feint
	action setvariable lastmaneuver draw when ou step backward and
	action setvariable lastmaneuver sweep when ou thrust|ou sweep
	action setvariable lastmaneuver slice when ou slice|ou jab
	action setvariable lastmaneuver chop when ou chop|ou punch
	action setvariable lastmaneuver dodge when You move into a position to dodge|But you are already dodging
	action setvariable loaded no when ^But your.*isn't loaded|^Your.*isn't loaded|You snipe.*%ammo |You fire a|Your.*falls from.*bow
	action setvariable loaded yes when ^You reach into your.* to load|^You load.*bow with|^You should unload
	action setvariable engage yes when ^It would help if you were closer|^You aren't close enough
#	action setvariable engage no when ^You begin to advance|^You are already at melee
	action goto mainloop when You move along to follow your mark



	action var weaponrange melee when You close to melee range on|You're.*balanced and in.*position.|You are already at melee
	action var weaponrange pole when You close to pole range on|^It would help if you were closer|^You close to pole weapon range
	action var weaponrange missile when ^You are already as far away as you can get!|^You aren't close enough to attack|^It would help if you were closer|^You aren't close enough


	action math arrangecount add 4 when ^Arrange what
	action math arrangecount add 4 when not be skinned, so you can't arrange it either
	action math arrangecount add 1 when ^You properly arrange .* corpse in a manner that, while making the process more difficult, guarantees a greater reward.
	action math arrangecount add 4 when ^You make a serious mistake in the arranging process, damaging the very trophy you were hoping to get!  The corpse is worthless now

	action setvariable shieldstat on when ^You slide your left arm through the straps.*and flex
	action setvariable shieldstat off when ^You loosen the straps.*and remove it
	action setvariable glovestat on when ^You slip s.*gloves onto your hands
	action setvariable glovestat off when ^You pull of.*gloves from your hands
	action setvariable cheststat on when ^You work your way into.*coat
	action setvariable cheststat on when Your armor hinders your attempt
	action setvariable cheststat off when ^You have nothing of that sort
	action setvariable cheststat off when ^You work your way out of.*coat
	action setvariable cowlstat on when ^You put.* on your head
	action setvariable cowlstat off when ^You.* off your head
	action put thrust when ^You can't backstab that
	action goto exitfull when ^You feel a wave of nausea rising from your gut as you notice a sickly green fluid oozing
	action goto exitfull when ^You are carrying between 400 and 499 items on you
	action put fire when ^You can not poach|^How can you poach if you are not stalking your target?|^How can you poach if you are not hidden?|How can you snipe if you are not hidden

#	action goto nothunting when There is nothing else to face
	action if $stunned = 1 then goto stunned when stun
	action goto leavecombat when LEAVECOMBATNOW
	action put face next when What do you want to advance towards?
	action if "%engage" = "yes" then put engage when ^You turn to face
#	action goto resetweapons when your leather clad fist
	action goto resetweapons when You need a free hand to pick that up
	action goto resetweapons when ^You can not load.*bow with.*in your left hand|^But you don't have a ranged weapon in your hand to fire with|You need two hands to wield this weapon|^But the %melee in your right hand isn't a ranged weapon!|^You can't load.*silly|^Wouldn't it be better if you used a melee weapon
	action goto resetweapons when ^You need a free hand for that|^You can't load the|^Your hands are too full for that
	action goto resetweapons when ^You don't have a weapon|^It's easier to juggle if you start.* and nothing in your left hand

	action put kick dirt when There doesn't seem to be anything left in the pile.
	action var box full when There doesn't seem to be any more room left in your gem-encrusted box to fit that dirt!
	action var box empty when You don't have any dirt in your gem-encrusted box!
	action var box clutter when ^The room is too cluttered to find anything here
	action put engage when ^Snipe dirt at somebody that far away
	action var dirt no when seems to no longer be irritated by the dirt
	action var dirt yes when reveal yourself, throwing a handful of dirt
	action var dirt yes when ^They already have dirt in their eyes

	setvariable swings (feints|sweeps|slices|chops|jabs)
	setvariable dancekill %dancewith
	setvariable toomany %dancewith
	setvariable dangerous %dancewith
	setvariable monstersdead 0
	setvariable lastmaneuver attack1
	setvariable skin no
	setvariable loaded no
	setvariable engage no
	setvariable appnew yes
	math dancekill add 1
	math toomany add 2
	math dangerous add 3
	gosub routinesearch
	return





activecount:
	if $monstercount = 0 then var dirt no
	if $monstercount = 0 then goto activehunt
	if contains("$roomobjs", "$monster1") then return
	if contains("$roomobjs", "$monster2") then return
	if contains("$roomobjs", "$monster3") then return
	if contains("$roomobjs", "$monster4") then return
	goto activehunt


dirt:
	if "%dirt" = "yes" then return
	if "%box" = "empty" then return
	if !contains("$righthand", "%melee") then gosub getmelee
	if !contains("$lefthand", "Empty") then if !contains("$lefthand", "dirt") then gosub put stow left
	if !contains("$lefthand", "dirt") then
		{
		if contains("$roomobjs", "some dirt" then gosub put get dirt
		else gosub put push my box
		}



	if contains("$lefthand", "dirt") then if "%weaponrange" = "missile" then
		{
		gosub put engage
		pause 1
		if "%weaponrange" = "missile" then gosub pause 1
		if "%weaponrange" = "missile" then gosub pause 1
		if "%weaponrange" = "missile" then gosub pause 1
		}
	if contains("$lefthand", "dirt") then gosub hide
	if contains("$lefthand", "dirt") then if $hidden = 0 then goto dirt
	if contains("$lefthand", "dirt") then 
		{
		if $Offhand_Weapon.LearningRate < 25 then gosub put ambush sight left
			else gosub put ambush sight
		}
	if !contains("$lefthand", "dirt") then if $monstercount > 0 then goto dirt
	return

collectdirt:
	var box empty
	gosub emptyhands
	if !contains("$roomobjs", "dirt") then gosub put collect dirt
		else if !contains("$righthand", "dirt") then gosub put get dirt
	if contains("$righthand", "dirt") then gosub put put my dirt in my box


	if "%box" = "full" then	if contains("$righthand", "dirt") then gosub put drop my dirt
	if "%box" = "full" then return
	if "%box" = "clutter" then return
	goto collectdirt

dodge:
	if "%lastmaneuver" = "dodge" then return
	if contains("$righthandnoun", "bow") then gosub retreat
	if contains("$righthandnoun", "bow") then put retreat
	gosub put dodge
	return

weaponcheck:
	if contains("$roomobjs", "%melee") then var jacked %melee
	if contains("$roomobjs", "%ranged") then var jacked %ranged
	if "%jacked" = "none" then return
	gosub retreat
	gosub emptyhands
	gosub put stow %jacked
	var jacked none
	return



dance:
	var dancestyle default
	var resonance dance
	setvariable dancetime 0
	setvariable fulldance $0
	eval fulldance replace ("%fulldance", " ", "|")
	var dancestyle %fulldance(1)
	var dancemax %fulldance(0)

	danceloop:
	if %dancetime < %dancemax then
	{
	if $monstercount > %toomany then return
	pause 5

	math dancetime add 5
	gosub roundtime
	goto danceloop
	}
	return





arrange:
	
#	gosub put retreat
	gosub getmelee
	if contains("$roomobjs", "dead") then if %arrangecount < 4 then gosub put arrange
		else {
		var arrangecount 0
		return
		}
	goto arrange
	

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



hunt:
	if $hidden = 1 then return
	if %hunttime > %grandcounter then return
	if $monstercount = 0 then if $hidden = 1 then gosub put unhide
	if $Perception.LearningRate > 29 then return

	gosub put hunt
	evalmath hunttime (%grandcounter + 1)
	return



appcritter:
	if $hidden = 1 then return
	if %apptime > %grandcounter then return
	if $monstercount = 0 then if $hidden = 1 then gosub put unhide
	if $Appraisal.LearningRate > 25 then return

	eval crittercount count("$monsterlist", "%monster1")
	if %crittercount > 0 then gosub apprun %monster1
	eval crittercount count("$monsterlist", "%monster2")
	if %crittercount > 0 then gosub apprun %monster2
	eval crittercount count("$monsterlist", "%monster3")
	if %crittercount > 0 then gosub apprun %monster3
	eval crittercount count("$monsterlist", "%monster4")
	if %crittercount > 0 then gosub apprun %monster4

	evalmath apptime (%grandcounter + 5)
	return

	apprun:
	gosub put app $0 quick
	gosub put mark all $0
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put app second $0 quick
	gosub put mark all second $0
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put app third $0 quick
	gosub put mark all third $0
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put app fourth $0 quick
	gosub put mark all fourth $0
	math crittercount subtract 1
	if %crittercount < 1 then return
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



Throw:
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
	gosub put aim
	return
hide:
	if $hidden = 1 then return
	gosub put hide
	pause 0.1
	return


stalk:
	gosub put stalk
	return

snipe:
fire:
	gosub getranged
	gosub stance attack 100
	pause 0.1
	pause 0.1
	pause 0.1
	pause 0.1
	if $hidden = 1 then gosub put poach
		else gosub put fire
	gosub skinarray
#	if "%skin" != "no" then gosub skinning	
	return
load:
#	gosub appcritter
	if "%loaded" = "yes" then return
	if $hidden = 1 then put unhide
	if $hidden = 1 then pause 0.1
	gosub getranged
	if contains("$roomobjs", "%ammo") then gosub put get %ammo
	gosub put load
#	setvariable loaded yes
	return

ammo:
	if $monstercount > 0 then gosub put retreat
	if contains("$roomobjs", "%ammo") then gosub put stow %ammo
	else return
	goto ammo


retreat:
	if $dead = 1 then goto exitfull
	if $health < 80 then goto exitquick
	if $stunned = 1 then goto exitquick
	if $prone = 1 then gosub put stand
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

include routinesearch.cmd