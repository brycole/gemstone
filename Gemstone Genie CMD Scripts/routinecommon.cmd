

routinecommon:
	timer clear
	timer start
	var rtgood ^Roundtime:|^\[Roundtime|^Cast Roundtime
	var rtwait ^\.\.\.wait|^Wait|^You don't seem to be able to move to do that|^You struggle against the shadowy webs to no avail\.|^Sorry, system is slow|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!
	var stow.msg ^You put|^What were|^You can't put|^There isn't|too thick to fit|^Stow what|^But that|^You hang|too long to fit|^You just can't|^You briefly|^There doesn't seem|^You easily|^You pick up \d+ (silver|bronze|copper|gold|platinum)
	var get.msg ^You get|remove|^You pick up|^You are already holding that\.|^You fade in for a moment as you pick up|^You pull|^What were you referring to\?|^But that is already in your inventory\.|^You are not strong enough to pick|^With deliberate poise|^You need a free hand|^But that
	var put.msg ^You put|^What were|^You easily
	var drop.msg ^You drop|^You place|^I could not|^If you wish|^Having no
	var wear.msg ^You attach|^You work|^You slip|^You put a|^You are already|^You slide|^You hang|^You remove|^Remove what|^You sling|^Wear what|^You aren't|^You easily
	var prep.msg ^You raise an arm skyward|^You trace|^You begin chanting
	var cast.msg ^You gesture|^You cup|^You whisper|^You trace|^Your target pattern|^You make a holy gesture|^Flickering shadows tear|^You sense a|^You strike your heel|^You open your
	var collect.msg ^You take|^Now what|^I could not find|^The room is too cluttered
	var cman.msg ^\[Roundtime|^Roundtime|^You aren't|^There is nothing|^Roundtime|already loaded|^You begin|^How can you|^What are you trying to throw|^You need both|^You begin to target|^You load the|^Your \w+ crossbow
	var ritual.msg ^This ritual may only|^Rituals do not work|^A skinned creature is worthless|^This corpse has already been|^The preservation ritual performed|^Lacking your knife, you cannot perform any rituals.|^Roundtime:
	var advance.msg ^What do you want to advance towards\?|^You begin to advance on|already quite dead\.|^You are already advancing on|^You are already at melee with|^You begin to stealthily advance on|^You spin around to face|^You will have to retreat from your current melee first\.
	
	var halfcounter 0
	var quartcounter 0
	var astrocounter
	var grandcounter 0
	var GMchecks 0
	var keywords 0
	var exitnow 0
	var expswitch 0
	var noarrows 0
	var condition 0
	var sellbox
	var talking none
	var disarmattempt 0
	var collect_count 0	
	var camb orb
	var stunloop 0
	var healnow 0
	var healswitch 1
	var steal.yes 0
	var clericswitch 0
	var autohealer.exit 0
	var castnow 0
	var pvpbuffs 0
	var backtrace 0
	var swimmingnow 0
	var runverbs (asks|exclaim|says|exclaims|whisper|comes out of hiding|bends over.*corpse briefly|leaps from hiding)\b/i
	var garbagelist grass|braid|limb|vine|material|dirt
	
	action goto exitquick when \[Your PvP setting is now locked into OPEN
	action goto autohealer.move when ^You are in no condition|^An instant rush of black and blue fire explodes into being, consuming your|^You feel a wave of nausea
		
	action var talking $0 when (\S+) %runverbs
	action var talking $0 when ^You hear (.+)
	
	#action var icefall 1 when ^Running heedlessly through the icy terrain
	#action var fallmsg 1 when ^You lose your footing and fall|^You smack the ground with a sickening thud\.|^You are knocked to the|^The wind knocks you off your balance|^The blast of wind picks you up|pounces on you, knocking you painfully|^You attempt to kick mud at a .+, but you slip and land on your rear|^A great stag charges suddenly .+ hammers into you, slamming you to the ground|^An Agresh bear rears up behind you, and grabs you in a mighty bear hug|, the bear knocks you painfully to the ground|^A great stag charges suddenly, his vicious antlers catching you|^A great stag charges suddenly, goring you|^The tail snaps between your legs sending|^With a fluid whirl, a hunter troll plants

	#action var fallok 1 when ^A (?:frost|storm) giant lifts \w+ huge foot|^A storm giant takes a deep breath|Screaming, you plunge towards the ground below\.|^It quickly becomes apparent that you will not finish|^You are buffeted by a sudden gust of wind|^A gust of wind tugs at your sleeves|pounces on you, knocking you painfully|^You attempt to kick mud at a .+, but you slip and land on your rear|^A great stag charges suddenly .+ hammers into you, slamming you to the ground|^An Agresh bear rears up behind you, and grabs you in a mighty bear hug|, the bear knocks you painfully to the ground|^A great stag charges suddenly, his vicious antlers catching you|^A great stag charges suddenly, goring you|^A three-toed tegu lashes its tail out|^Quick strike sends you stumbling|^Your feet are suddenly

	#action var disarmattempt 1 when ^\n+ swings his .+ your .+ %firstweapon and connects!
	#action var condition 1 when ^You're not in any condition|^You can't seem to think clearly
	
	## ** Weapons on the ground
	action put stow $1 when You notice a .+ (axe|spear) at your feet

	## ** Skill training triggers
	action var tending 0 when ^The bandages binding your
	var tending 0
	
	## ** coin counting actions
	action var skincoin $1 when takes the .+ along with (\d+) silver\.
	action var skincoin $1 when removes the items and hands you a note for (\d+)
	action var skincoin $1 when then places a note for (\d+)
	
	action var disconnected yes when Connection (?:lost|closed)\.
	#action goto exitfull when WARNING:  You have a somewhat high number of items on your person|You're carrying far too many items already
	action goto windblown when ^The blast of wind picks you up
	
	gosub routineGMcheck
	gosub routinemagic
	
	action (exp) off
return

put.1:
	var firstcommand $1
	var waitstring $2
	match clear
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "$monitor" != "no" then if %keywords > 3 then goto GMcheckmain
putting.1:
	matchre pause.putting.1 %rtwait
	matchre roundtimedone %waitstring
	matchre spellresearch.1 ^Are you sure you want to do
	put %firstcommand
	echo %firstcommand
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
	goto roundtimedone
pause.putting.1:
	pause .1
	pause .1
	goto putting.1
spellresearch.1:
	pause .1
	pause .1
	put research stop
goto putting.1


put.2:
	var firstcommand $1
	var secondcommand $2
	var waitstring $3
	match clear
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "$monitor" != "no" then if %keywords > 3 then goto GMcheckmain
putting.2:	
	matchre pause.putting.2 %rtwait
	matchre roundtimedone %waitstring
	matchre spellresearch.2 ^Are you sure you want to do
	put %firstcommand
	echo %firstcommand
	put %secondcommand
	echo %secondcommand
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
	goto roundtimedone
pause.putting.2:
	pause .1
	pause .1
	goto putting.2
spellresearch.2:
	pause .1
	pause .1
	put research stop
goto putting.2

roundtimedone:
	if %checktime = 1 then gosub checktime
	if "$charactername" = "Kaislan" then put #statusbar Keywords = %keywords    Resonance = %resonance    Eluned = %elunedtemp     Tamsine = %tamsinetemp
	if "$charactername" = "Stoh" then put #statusbar Keywords = %keywords    Resonance = %resonance
	if $webbed = 1 then goto exitfull
	if %exitnow = 0 then
	{
		if $dead = 1 then goto exitfull
		if $health < 60 then goto exitquick
		#if (($stunned = 1) && ($monstercount > 0)) then goto exitquick
		if (($stunned = 1) && (%stunloop = 0)) then goto stunloop
	}
	if matchre("$prompt", "DEAD") then
	{	
		goto exitfulldead
	}
	if (($standing = 0) && ($kneeling != 1) && !matchre("%resonance", "(moving|healing)"))) then gosub stand
	if %disarmattempt = 1 then goto disarmexit
	if %keywords < 0 then var keywords 0
	if %condition = 1 then 
	{
		var condition 0
		gosub clear
		goto sellnow
	}
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "$monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	if %t < .1 then timer clear
	if %t < .1 then timer start
	if %t > 15 then gosub grandcounter
	if %lastrt > 20 then goto gmcheckrt
	#if $roomid = %loreroom then if $monstercount > 0 then goto exitquick
	#if "%disconnected" = "yes" then gosub notconnected
	#if $connected = 0 then goto notconnected
	if "%talking" != "none" then gosub antipersonnel
	var talking none
	
## *** Start non-mandatory sections
	if ((%backtrace = 1) && (located = 1)) then
	{
		var located 0
		put perc
	}
	if (("%Manifest" = "off") && ("$preparedspell" = "Manifest Force") && ($spelltime > 14) && (%incombat = 1) && (%castnow = 0)) then 
	{
		var castnow 1
		if $monstercount > %maxcreature then gosub castnow
	}
	if (!matchre("$preparedspell", "(None|%sorc_list|Persistance of Mana)") && ($spelltime > 27) && (%invoke = 0) && (%castnow = 0)) then 
	{
		var castnow 1
		gosub castnow
	}
	if ((matchre("$roomplayers", "Aayveia")) && (%teaching = 0)) then gosub teachraelok
	if ((matchre("$roomplayers", "Stoh")) && (%learning = 1)) then gosub listenstoh
	if %spellupswitch = 0 then gosub spellupcheck
	if (($bleeding = 1) && (%tending = 0)) then gosub tendwound
	if ((%healnow = 1) && (%healswitch = 1)) then 
	{
		var healswitch 0
		gosub clear
		send .raeloktrain
		exit
	}
	if (("$guild" = "Cleric") && (%clericswitch = 0) && ($stunned = 0)) then
	{
		gosub badgecheck
		gosub praycheck
		gosub prayer.matcheck
		gosub communecheck
		#gosub eluned_commune
		#gosub tasmine_commune
	}
	if (("$pvpalert" = "yes") && (%pvpbuffs = 0) && (%invoke = 0) && ("$preparedspell" = "None")) then gosub buffcheck
	if ((%startresearch = 1) && (%doresearch = 1) && (%researchloop = 1)) then
	{
		var researchloop 0
		gosub researchcheck
	}
	if %ambusherhere = 1 then goto checkambusher
return

teachraelok:
	var teaching 1
	gosub put.1 "teach %teachskill to Aay" "^You begin|is already"
	if "%teachskill" = "arcana" then var teachskill sorcery
	else var teachskill sorcery
return

listenstoh:
	var learning 0
	gosub put.1 "listen to stoh" "^You begin"
return

spellupcheck:
	evalmath spelltemp ($gametime - $last.spellup)
	if %spelltemp < 13500 then return
	var spellupswitch 1
	gosub spellupnow

stow:
	var do1 $1
	var do2 $2
	gosub put.1 "stow $0" "%stow.msg"
return	

emptyhands:
	if %garbage = 1 then
	{
		if matchre("$righthandnoun", "%garbagelist") then gosub put.1 "put my $righthandnoun in %bin" "%put.msg"
		if matchre("$lefthandnoun", "%garbagelist") then gosub put.1 "put my $lefthandnoun in %bin" "%put.msg"
	}
	
	if "$righthandnoun" = "crossbow" then gosub put.1 "tie my cross to toolstrap" "%wear.msg"
	if "$righthandnoun" = "%bowtype" then gosub wearbow
	
	if matchre("$righthandnoun", "%garbagelist") then gosub put.1 "empty right" "%drop.msg"
	if matchre("$lefthandnoun", "%garbagelist") then gosub put.1 "empty left" "%drop.msg"
	
	if matchre("$righthand", "(braided heavy rope|bundling rope)") then gosub put.1 "empty right" "%drop.msg"
	if matchre("$lefthand", "(braided heavy rope|bundling rope)") then gosub put.1 "empty left" "%drop.msg"
	
	if (("$righthandnoun" = "%camb") || ("$lefthandnoun" = "%camb") && ("%camb" != "orb")) then gosub put.1 "wear %camb" "%wear.msg"
	
	if "$righthandnoun" = "crossbow" then gosub put.1 "tie my cross to toolstrap" "%wear.msg"
	if "$righthandnoun" = "%bowtype" then gosub wearbow
	if "$lefthand" != "Empty" then gosub stow left
	if "$righthand" != "Empty" then gosub stow right
return

get:
	var do1 $0
	gosub put.1 "get %do1" "%get.msg"
return

getitemlist:
	action var contents $1 when ^In the .* you see (.+)\.$
	action var contents $1 when ^You rummage .* and see (.+)\.$
return

removeitemlist:
	action remove ^In the .* you see (.+)\.$
	action remove ^You rummage .* and see (.+)\.$
return

swap:
	gosub put.1 "swap $0" "^You move|^You have|^You switch"
return

stunloop:
	var stunloop 1
	gosub pause 1
	if $stunned = 1 then goto stunloop
	var stunloop 0
return

stand:
	var stand.msg ^You stand back up|^You leap to|^You swim back|^You are already standing|^You are so unbalanced|^You are overburdened|^The weight of all your|^Roundtime|^\[Roundtime|^Maybe you should
	var stand.loopcount 0
stand.loop1:
	math stand.loopcount add 1
	if %stand.loopcount > 20 then goto stand.loopexit
	if $standing = 0 then gosub put.1 "dance" "%stand.msg"
	if $standing = 0 then gosub put.1 "stand" "%stand.msg"
	
	if $standing = 0 then goto stand.loop1
return

stand.loopexit:
	put #echo >log Red Standloop bugged. Fix asap. room: $roommname, $roomobjs, $roomdesc, $roomplayers
return

## ** Training gosubs

startskill:
	if (($priorityskill.LearningRate < 2) && ($dopriority = 1) && ("$priorityskill" != "") && (%incombat = 0)) then 
	{
		put #var dopriority 0
		put #echo >Log Purple $priorityskill is too low, resetting script to combat. Current skill is $0.
		put #log >ExpLog $priorityskill is too low, resetting script to combat. Current skill is $0.
		if "$priorityskill" = "Thanatology" then send .raeloktrain combat
	}
    if $priorityskill.LearningRate > 15 then put #var dopriority 1
	var starttime $gametime
	var rankstart $$0.LearningRate
	put #log >ExpLog $time
	put #log >ExpLog $1 starting mindstate: $$0.LearningRate
return

endskill:
	var endtime $gametime
	var rankend $$0.LearningRate
	var timediff 0
	var mindstatetime 0
	var rankdiff 0
	evalmath rankdiff (%rankend - %rankstart)
	evalmath timediff (%endtime - %starttime)
	put #log >ExpLog $1 ending mindstate: $$0.LearningRate
	evalmath timediff (%timediff / 60)
	put #log >ExpLog %timediff minutes training skill.
	evalmath mindstatetime (%timediff / %rankdiff)
	put #log >ExpLog %mindstatetime minutes per mindstate.
	if %incombat = 0 then gosub stealcheck
return

startcollect:
	var collect_max 999
	var collect_count 0
	if "$1" != "" then var collect_max $1
	if %collect_max < 4 then goto collect
	if "$lefthand" != "Empty" then gosub stow left
	if %incombat = 0 then gosub loreroom
	gosub startskill Perception
	var skillexit collect.end
		
collect:
	##if (("$zoneid" = "123xxxx") && ($1 < 5) && ($roomid != 89) && ($roomid != 262)) then
	if (("$zoneid" = "123xxxx") && (99 < 5) && ($roomid != 89) && ($roomid != 262)) then
	{
		if "$guild" = "mage" then
		{
			gosub fissurecheck
			return
		}
		#gosub quickspelltrain
		gosub pause 1
		return
	}
	var percepexp %globalexp
	gosub ppcheck
	if %collect_max > 4 then
	{
		gosub cyclic_check
		if %doresearch = 0 then gosub quickspelltrain
	}
	if %collect_count < %collect_max then
		{
			math collect_count add 1
			if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
			if matchre("$roomobjs", "pile of %collect") then gosub put.1 "kick %collect" "%collect.msg"
			gosub put.1 "collect %collect" "^Roundtime:"
			if matchre("$roomobjs", "pile of %collect") then gosub put.1 "kick %collect" "%collect.msg"
			if (($Outdoorsmanship.LearningRate > %percepexp) && ($Perception.LearningRate > %percepexp)) then goto collect.end
		}
		else goto collect.end
	goto collect
collect.end:
	if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
	if matchre("$roomobjs", "pile of %collect") then gosub put.1 "kick %collect" "%collect.msg"
	if %collect_max = 999 then gosub endskill Perception
	var collect_count 0
return

startburin:	
	action var newburin 1 when ^Eventually, you end up with
	action var burinerror 1 when ^It would be better to find
	
	var newburin 0
	
	gosub emptyhands
	gosub startskill Mechanical_Lore
	
	
imbueburin:
	var burinerror 0
	if $Mechanical_Lore.LearningRate > %globalexp then
	{
		action remove ^Eventually, you end up with
		action remove ^It would be better to find
		gosub emptyhands
		gosub endskill Mechanical_Lore
		return
	}
	if $Attunement.LearningRate < 30 then gosub ppcheck
	if "$righthandnoun" != "knife" then gosub get carv knife
	gosub put.1 "forage oak limb" "^Roundtime"
	if ("$preparedspell" != "None") then gosub release
	gosub prep imbue 25
	delay 5
	gosub cast my limb
	gosub prep imbue 25
	delay 5
	gosub cast my limb
burinloop:
	#gosub quickspelltrain
	if %burinerror = 1 then goto imbueburin
	if "$righthandnoun" != "knife" then gosub get carv knife
	if (("$lefthandnoun" != "limb") && ("$righthandnoun" != "limb")) then gosub get limb
	if (("$lefthandnoun" != "limb") && ("$righthandnoun" != "limb")) then 
		{
			gosub emptyhands
			goto imbueburin
		}
	if %newburin = 0 then gosub put.1 "carve my limb with knife" "^Roundtime"
		else goto newburin
	if %newburin = 1 then goto newburin
	goto burinloop
newburin:
	var newburin 0
	gosub put.1 "w" "^Obvious"
	gosub emptyhands
	gosub put.1 "e" "^Obvious"
	if "$righthandnoun" != "knife" then gosub emptyhands
	goto imbueburin

braid:
	gosub loreroom
	gosub startskill Mechanical_Lore
	var skillexit mechend
	var doresearch 1
	
	action var pullbraid 1 when ^Frustration wells|^You fumble around|^Try as you might|^You need both hands|^The braided .+ is already as long
	action var morematerial 1 when ^You need to have more material
	
	var pullbraid 0
	var garbage 0
	var empty 0
	var braid $1
	var bin $3
	var astroswitch $4
	var braidexp %globalexp
	var braidexp 33
	var braid.msg ^Try as you|^Roundtime|^You need both|^You need to have more material|^The braided .+ is already as long
	#if "$charactername" = "Rhaec" then var braidexp 33
	#if $Time.isDay = 1 then var braidexp 33
	if $2 = "g" then var garbage 1
	if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
	if $roomid = 136 then var braid grass
	gosub put.2 "rem %gloves" "stow %gloves" "%stow.msg"
	gosub put.1 "forage %braid" "^Roundtime"
braidloop:
	var braidexp %globalexp
	var braidexp 33
	#if "$charactername" = "Rhaec" then var braidexp 33
	#if $Time.isDay = 1 then var braidexp 33
	gosub ppcheck
	if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
	if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then gosub pause 1
	if %morematerial = 1 then
	{
		gosub put.1 "forage %braid" "^Roundtime"
		var morematerial 0
	}
braidcont:
	if "$guild" = "mage" then gosub fissurecheck
	gosub cyclic_check
	if %doresearch = 0 then gosub quickspelltrain
	if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then
	{
		if contains("$roomobjs", "%braid") then gosub get %braid
			else gosub put.1 "forage %braid" "^Roundtime"
	}		
	if %pullbraid = 1 then
	 {
	 		gosub put.1 "pull my %braid" "^Roundtime|^I'm afraid"
	 		var pullbraid 0
	 		var empty 1
	 }
		else
			{
				if "$righthand" != "Empty" then gosub put.1 "braid my %braid" "%braid.msg"
				if %foragemore = 1 then
					{
						if "%astroswitch" = "astro" then
						 {
						 	evalmath astrotime ($gametime - $last.peer)
							echo %astrotime
							if %astrotime > 180 then
		 				 		{
		 				 			gosub emptyhands
		 				 			var astroreturn 1
		 				 			goto astrotrain
		 				 			var astroreturn 0
		 				 			if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
		 				 		}
						 }
						 if "$righthand" = "Empty" then gosub put.1 "get %braid" ".+"
						 gosub put.1 "forage %braid" "^Roundtime"
						 var foragemore 0
						 pause
						 if "$righthand" = "Empty" then goto mechend
					}
			}
	if %empty = 1 then 
		{
			if %garbage = 1 then 
			{
				
			}		
				else gosub walkdump
			var empty 0
			gosub put.1 "forage %braid" "^Roundtime"
		}
	goto braidloop
mechend:
	action remove ^Frustration wells|^You fumble around|^Try as you might|^You need both hands|^The braided .+ is already as long
	var astroreturn 0
	gosub walkdump
	gosub put.2 "get my %gloves" "wear my %gloves" "%wear.msg"
	gosub endskill Mechanical_Lore
	return

walkdump:
	if "$charactername" = "Kaislan" then gosub put.1 "%loreroom.dump(0)" "^Obvious"
		else gosub put.1 "sw" "^Obvious"
	#gosub put.1 "sw" "^Obvious"
	gosub emptyhands
	if "$charactername" = "Kaislan" then gosub put.1 "%loreroom.dump(1)" "^Obvious"
		else gosub put.1 "ne" "^Obvious"
	#gosub put.1 "ne" "^Obvious"
return

assess:
	gosub loreroom
	gosub emptyhands
	var appraise.exp %globalexp
	var appraise.exp 33
	gosub startskill Appraisal
	gosub playsong.start
assess.loop:
	#if (($Appraisal.LearningRate > %appraise.exp) && ($Performance.LearningRate > %appraise.exp) && ("$charactername" = "Kaislan")) then goto assess.exit
	#3	else if (($Appraisal.LearningRate > %appraise.exp) && ("$charactername" = "Stoh")) then goto assess.exit
	if ($Appraisal.LearningRate > %appraise.exp) then goto assess.exit
	if "$righthand" != "copper zills" then gosub put.1 "remove zills" "%wear.msg"
	if "$righthand" != "copper zills" then gosub put.1 "get my zills" "%get.msg"
	gosub playsong.play
	gosub put.1 "assess zills" "^Roundtime"
	#if %doresearch = 0 then gosub quickspelltrain
	goto assess.loop
assess.exit:
	gosub playsong.exit
	gosub put.2 "get my emb cloth" "clean my zill with my emb cloth" "^\[Roundtime|^A pair"
	gosub put.2 "stow my cloth" "wear zill" "%wear.msg"
	gosub endskill Appraisal
return

playsong.start:
	action (playsong) var playsong off when ^You finish
	action (playsong) on
	if "$charactername" = "Kaislan" then var playsong off
		else var playsong NULL
return
playsong.play:
	if "%playsong" = "off" then 
	{
		gosub put.1 "play %playtype" "^You|^You're|^Perhaps"
		var playsong on
	}
return
playsong.exit:
	action (playsong) off
	var playsong off
	gosub put.1 "stop play" "^You stop|^In the name of"
return
	
playsongoff:
	put stop play
	var playsong off
	pause .5
return

	
locksmithtrain:
	gosub emptyhands
	gosub get my trunk	

lockloop:
	gosub put.1 "pick my trunk blind" "^Roundtime"
	if $Locksmithing.LearningRate > 33 then goto lockend
	goto lockloop

lockend:
	gosub emptyhands
	return

	
books:
	action (books) on
	action (books) var math keywords subtract 1 when ^You (scan|turn)
	gosub startskill Scholarship
	gosub playsong.start
	var skillexit books.end
	gosub loreroom
	var scholarexp %globalexp
	if %play.yes = 1 then var scholarexp 33
	if $Scholarship.LearningRate > %scholarexp then return
	action setvar newchapter 1 when ^This chapter does not have that many pages.
	var doresearch 0
	var newchapter 0
	var chapter $2
	var endchapter $3
	var page 1
	gosub get $1
	gosub reveal
turnchapter:	
	gosub put.1 "turn my book to chapter %chapter" "^You turn|^This book"
turnpage:
	gosub put.1 "turn my book to page %page" "^You turn|^This chapter"
studybook:
	if %newchapter = 1 then
		{
			var newchapter 0
			var page 1
			evalmath chapter (%chapter + 1)
			if %chapter > %endchapter then return
			goto turnchapter
		}
	if $Scholarship.LearningRate > %scholarexp then goto books.end
	if "$guild" = "mage" then gosub fissurecheck
	if "$righthandnoun" != "book" then gosub get $1
	gosub cyclic_check
	#if %doresearch = 0 then gosub quickspelltrain	
	gosub ppcheck
	#gosub reveal
	if "$righthandnoun" != "book" then gosub get $1
	gosub playsong.play
	gosub put.1 "study my book" "^Roundtime"
	if "$charactername" = "Rhaec" then
	{
		if %play.yes = 1 then
		{
			if %play.song = 1 then
			{
				if $%learn.play > %globalexp then return	
				gosub ppcheck
				gosub put.1 "%play_comm %song" "^You|^You're|^Perhaps"
				var play.song 0
				var play.instr 0
			}
		}
	}
	evalmath page (%page + 1)
	goto turnpage
books.end:
	action (books) off
	gosub playsong.exit
	gosub endskill Scholarship
	gosub emptyhands
return

tendwound:
    if $bleeding != 1 then return
	if "%playsong" = "on" then gosub playsongoff
	var tending 1
	if "%resonance" = "climbing" then
	{	
		
	}
	if "$charactername" = "Keldus" then
	{
		gosub put.1 "tend my right leg" "^Roundtime|^That area|^Doing your best|too injured for you to"
		gosub put.1 "tend my abdomen" "^Roundtime|^That area|^Doing your best|too injured for you to"
		#gosub put.1 "tend my right hand" "^Roundtime|^That area|^Doing your best|too injured for you to"
		#gosub put.1 "tend my left hand" "^Roundtime|^That area|^Doing your best|too injured for you to"
	}
	if "$charactername" = "Stoh" then
	{
		gosub put.1 "tend my chest" "^Roundtime|^That area|^Doing your best|too injured for you to"
		gosub put.1 "tend my back" "^Roundtime|^That area|^Doing your best|too injured for you to"
	}
	if "$charactername" = "Raelok" then
	{
		gosub put.1 "tend my %currentbleeder" "^Roundtime|^That area|^Doing your best|too injured for you to"		
	}
	if "$charactername" = "Kaislan" then
	{
		gosub put.1 "tend my %currentbleeder" "^Roundtime|^That area|^Doing your best|too injured for you to"		
	}
return	
	
swimnow:
	var swimmingnow 1
	if "$charactername" = "Kaislan" then var doresearch 0
		else var doresearch 1
	var boarswim 1
	var langswim 0
	var crossfeld.swim 0
	var archer.swim 0
	var roomcheck 0
	gosub put.2 "remove zill" "stow zill" "^You put"
	
	## ** Lang swimming
	if %langswim = 1 then
	{
		if $roomid = 63 then gosub move 58
		gosub move 65
	}	
	## ** Boar swimming, Liirewsag River
	if %boarswim = 1 then
	{
		gosub move 100
		gosub move 146
		var firstdirection south
		var seconddirection north
		
	}
	## ** Crossing Swimming, Faldesu
	if %crossfeld.swim = 1 then gosub move 197
	
	## ** Boar Clan to Archer Ford
	if %archerswim = 1 then
	{
		if "$zoneid" = "127" then gosub move 510
		gosub move 3
		var firstdirection northwest
		var seconddirection southeast
		var roomcheck 1
		var firstroom 2
		var secondroom 3
	}
	
	gosub startskill Athletics
	gosub trainarmor remove
	gosub emptyhands
	#gosub reveal
swim.loop:
	if $Athletics.LearningRate < 34 then
	{
		#gosub eotb
		gosub cyclic_check
		gosub ppcheck
		if matchre("$roomexits", "%firstdirection") then gosub walk %firstdirection
		    else gosub pause 1
		if %roomcheck = 1 then if "$roomid" != "%firstroom" then gosub move %firstroom
		gosub stamcheck
		if matchre("$roomexits", "%seconddirection") then gosub walk %seconddirection
		    else gosub pause 1
		if %roomcheck = 1 then if "$roomid" != "%secondroom" then gosub move %secondroom
		gosub stamcheck
		
		## ** Spell buffs to keep up
		#if "%Fissure" = "off" then gosub castbuff "Ethereal Fissure" 15 15 21
		if "%Benediction" = "off" then gosub castbuff "Benediction" 15 45 21
		#if "%Sure" = "off" then gosub castbuff "Sure Footing" 5 25 21
		#if "%Ease" = "off" then gosub castbuff "Ease Burden" 5 25 21
		#if "%Vigor" = "off" then gosub castbuff "Vigor" 20 20 21
		#if "$guild" = "mage" then gosub magetrain
		if (((!matchre("$roomid", "(144|146|152|153)")) && (%doresearch = 0) && ($mana > 60)) || ("$preparedspell" != "None")) then gosub quickspelltrain
		
		## ** Boar clan swim exits
		if "$roomid" = "1465555" then
		{
			gosub walk climb bank
			gosub walk south
			gosub walk south
			gosub walk climb river bank
		}
		goto swim.loop
	}
swimnow.exit:
	gosub endskill Athletics
	if %boarswim = 1 then gosub move 146
	gosub trainarmor wear
	if %boarswim = 1 then 
	{
		gosub move 100
		gosub move 14
	}
	if "$zoneid" = "126" then gosub move 102
	gosub release
	gosub put.2 "get my zill" "wear my zill" "^You slide"
	var swimmingnow 0
return

stamcheck:
	if $stamina < 90 then 
	{	
		#if "%Zephyr" = "off" then
		#{
		#if ("$preparedspell" != "None") then gosub release
		#		gosub castbuff Zephyr 15 15 12
		#		gosub spelldelay
		#}
		if "$guild" = "warrior mage" then
		{
			if (($stamina > 30) && ($stamina < 70) && ("%Zephyr" = "off") && ("$preparedspell" = "None")) then
			{
				gosub prep zeph
				delay 15
				put cast
			}
		}
		delay 2
		gosub roundtimedone
		goto stamcheck
	}
return

ppcheck:
	evalmath perctemp ($gametime - $last.perc)
	#if ((%perctemp > 60) && ("$charactername" = "Stoh") && ($Appraisal.LearningRate < 30)) then
	#{
	#	put #var last.perc $gametime
	#	gosub put.1 "app my bundle careful" "^Roundtime"
	#}
	if $Attunement.LearningRate > 30 then return
	## room mana 60 second timer, planet mana 300 seconds
	if "$guild" != "Moon" then 
		{
			if %perctemp > 60 then goto powercheck
				else return
		}
		else if %perctemp < 300 then return
powercheck:
	##  ** Can use a PP trigger or set last.pp here.
	put #var last.perc $gametime
	gosub powerp
return

powerp:
	
	if "$guild" != "Moon" then
		{
			if "%playsong" = "on" then return
			#gosub necrospelloff
			gosub clericspelloff
			gosub put.1 "power" "^Roundtime|^You are a bit too"
			return
		}
	var perp1 $1
	
	# **** Old version
	gosub AUS
	if "%Aura" = "XXXX" then 
		{
			if "$preparedspell" != "None" then
			{
				if $spelltime > 20 then gosub castrequest 1 1 1 1
					else gosub release spell
			}
			gosub prep aus
			gosub pause 1
			gosub castrequest 1 1 1 1
		}
	gosub perc
	gosub perc xibar
	gosub perc yavash
	gosub perc katamba
	gosub perc moonlight
	gosub perc enlightened
	gosub perc psychic
	gosub perc perception
	gosub perc planets
	gosub perc mana
return

sell.temppawn:
	var cc 0
	echo $temppawnlist
	echo $temppawnlist(%cc) in temp list.
	if "$temppawnlist(%cc)" = "" then goto temppawndone
	if matchre("$temppawnlist(%cc)", "(\w+)$") then var tempget $0
	gosub put.1 "get my %tempget from my pack" "%get.msg"
	gosub put.1 "sell my $righthandnoun" "%sellpawn.msg"
	if "$righthand" != "Empty" then
		{
			var templist $nopawnlist
			var templist %templist$righthand|
			put #var nopawnlist %templist
			if "$righthand" != "Empty" then gosub put.1 "empty right" "^You drop|^Whoah"
			if "$righthand" != "Empty" then gosub put.1 "lower my $righthandnoun" "^You drop|lower"
		}
	math cc add 1
	goto sell.temppawn

temppawndone:
	put #var temppawnlist ""
return

reveal:
	if $invisible = 1 then 
	{
		gosub put.1 "hum scale" "^You begin|^You are"
		gosub put.1 "stop hum" "^You stop|^In the name"
	}
return

loreroom:
	if $roomid != %loreroom then 
	{
		gosub returnhome
		gosub move %loreroom
		var loreroom.dump nw|se
		if "$guild" = "Cleric" then gosub foragedirt
	}
	gosub checkplayer
	if %playerhere = 1 then 
	{
		gosub move %loreroomsecond
		var loreroom.dump w|e
		if "$guild" = "Cleric" then gosub foragedirt
	}
	
	if "%Eyes" = "on" then gosub release eotb
	if "$charactername" = "Stoh" then if "$invisible" = 1 then gosub release sov
	
return

stance:
	var attackstance %fightstance
	if %stance = 99 then return
	if "$1" = "defense" then
	{
		if %stance != 0 then gosub put.1 "stance d" "You are now in a defensive|^You are unable"
	}
	if "$1" = "offense" then
	{
		if ((%stance = 0) && ("%spelltype" != "XXX")) then gosub put.1 "stance %attackstance" "^You are now in a"
	}
return

skinsell:
#debuglevel 10
	var skincoin 0
	var packfull 0
	gosub put.2 "rem %pack" "sell my %pack" "You ask"
	gosub put.1 "wear %pack" "^You put|^You attach"
	var firstcoin %skincoin

	var skincoin 0
	gosub put.2 "rem %quiver" "sell my %quiver" "You ask"
	gosub put.1 "wear %quiver" "^You put|^You attach|^You drape"
	var secondcoin %skincoin
	
	evalmath skintime round(((($gametime - $last.starthunt) / 60) / 60), 2)
	
	evalmath skincoin (%firstcoin + %secondcoin)
	evalmath skintemp round((%skincoin / %skintime), 2)
	
	echo %skincoin total coins.
	echo %skintime hours since the last sell.
	echo %skintemp coins per hour.
	if ((%mobcycle = 1) || (%mobcycle = 3)) then 
	{
		if ((%skintemp < 100000) && (%mobcycle = 1)) then var mobcycle 2
		#if ((%skintemp < 100000) && (%mobcycle = 3)) then var mobcycle 3
		put #var skinsperhour1 $skinsperhour1|%skintemp
	}
	else
		{
			if ((%mobcycle = 2) || (%mobcycle = 4)) then 
			{
				if ((%skintemp < 100000) && (%mobcycle = 2)) then var mobcycle 1
				#if ((%skintemp < 100000) && (%mobcycle = 4)) then var mobcycle 3
				put #var skinsperhour2 $skinsperhour2|%skintemp
			}
		}
	#debuglevel 0
return

gemsell:
	var pack toolkit
	var gemsell 0
	gosub move gem
	
sellallpawn:
	gosub getitemlist
	
sell.setup:
	var contents
	gosub put.1 "rummage in my %pack" "^In the|^There is nothing|^You rummage"
	var keywords 0
	eval contents replace("%contents",", ", "|")
	eval contents replace("%contents"," and ","|")
	eval item.max count("%contents", "|")
	evalmath item.max %item.max + 1
	echo %item.max items max.
	var ii 0
	gosub removeitemlist
	if %item.max = 0 then goto sell.pawn.done

sell.pawn:
	var sellpawn
	if "%contents(%ii)" = "" then goto sell.pawn.done
	if %gemsell = 2 then if matchre("%contents(%ii)@", ("(%alchemyloot)@") then var sellpawn $1
	if %gemsell = 1 then if matchre("%contents(%ii)@", ("(%jewelryloot)@") then var sellpawn $1
	if %gemsell = 0 then if matchre("%contents(%ii)@", (".+ (\S+)@") then var sellpawn $1
	if "%sellpawn" != "" then gosub put.1 "get my %sellpawn from my %pack" "You|Get|%pack"
	if "$righthand" = "Empty" then goto pawn.next
	## ** Pawn save list
sellagain:
	if matchre("$righthand", "kyanite") then
	{
		put #echo >log Purple Item in pawn save list - $righthand
		gosub put.1 "put $righthandnoun in %container2" "You put"
		gosub stow all
		goto pawn.next
	}
	gosub put.1 "sell my $righthandnoun" "^You (?:offer|ask)|^Please|^What"
	if "$righthand" != "Empty" then gosub emptyhands
	if "$lefthand" != "Empty" then gosub emptyhands
	var keywords 0
	pawn.next:
	math ii add 1
	goto sell.pawn

sell.pawn.done:
	if %gemsell != 0 then 
	{
		var gemsell 0
		gosub emptysack
	}
	
return

sellboxes:
	var container %container1
	
sellboxsetup:
	gosub getitemlist
	action var phase 1 when Either get a chest in one of your hands so he
		
	var contents
	var openbox
	
	gosub put.1 "l in my %container" "^In the|^There is nothing"
	eval contents replace("%contents",", ", "|")
	eval contents replace("%contents"," and ","|")
	eval item.max count("%contents", "|")
	evalmath item.max %item.max + 1
	echo %item.max items max.
	var ii 0
	gosub removeitemlist

boxloop:
	var phase 0
	if "%contents(%ii)" = "" then
	{
		if "%container" = "%container1" then 
		{	
			var container %container2
			goto sellboxsetup
		}
		else goto packcheck
	}
	if matchre("%contents(%ii)@", ("(\b%boxlist\b)@") then var openbox $1
	if "%openbox" != "" then gosub put.1 "get my %openbox from my %container" "You|^Get"
		else 
		{
			math ii add 1
			goto boxloop
		}
	gosub put.1 "ring bell" "^You ring"
	if ((%phase = 1) && ("$prof" = "sorcerer")) then
	{
		if "$righthand" != "Empty" then gosub put.1 "drop right" "^You think that you can"
		if "$righthand" != "Empty" then gosub put.1 "ring bell" "^You ring"
	}
	gosub put.1 "pay" "\b%boxlist\b"
	gosub put.1 "open my %openbox" "^You open"
	gosub put.1 "get my coins" "^You gather|^Get what"
	gosub put.1 "empty my %openbox in my sack" "^Roundtime|^You try"
	gosub put.1 "put my %openbox in %boxtrash" "^As you place|^If you wish"
	if "$righthand" != "Empty" then 
	{
		gosub put.1 "get my plate" "^You remove|^Get what"
		gosub put.1 "put my plate in %boxtrash" "^As you place|^I could not"
		gosub put.1 "put my %openbox in %boxtrash" "^As you place|^If you wish"
		gosub put.1 "put my %openbox in %boxtrash" "^As you place|^I could not"
	}
	
	var openbox
	math ii add 1
	goto boxloop
	
packcheck:
	gosub getitemlist
	goto packskip

packcheckloop:
	var contents
	gosub put.1 "look in my sack" "^In the|^There is nothing"
	
	if matchre("%contents", "(\b%uncommonloot\b|\b(%jewelryloot)\b|envelope)(?:,|\.| \band\b)") then
	{
		var t0 $0
		var t1 $1
		var t3 $3
		var t4 $4
		var tempstow %t1
		if "%t3" != "" then var tempstow %t3
		if "%t4" != "" then var tempstow %t4
		
		gosub put.1 "get %tempstow from my sack" "^You remove"
		if matchre("$righthand", "\b(?:drake|feras|wand|steel lockpick|crystal amulet)\b") then
		{
			gosub put.1 "put my %tempstow in my %pack" "^You put"
			goto packcheckloop
		}
		if !matchre("$righthand", "\b(?:drake|feras|wand|steel lockpick|crystal amulet)\b") then
		{
			put #echo >log Purple Special box loot! %t1
			gosub put.1 "stow right" "^You"
		}
		goto packcheckloop
	}
packskip:	
	gosub removeitemlist
	action remove Either get a chest in one of your hands so he
	var sellbox
	var keywords 0
emptysack:	
	gosub put.1 "remove my sack" "^You remove"
	gosub put.1 "empty my sack in my %pack" "^You try"
	gosub put.1 "wear sack" "^You attach"
		
return

buyarrows:
	if "$zoneid" = "10" then
	{
		gosub move 80
		var arrowshop 104
		var arrowmenu 7
	}
	if "$zoneid" = "30" then
	{
		var arrowshop 44
		var arrowmenu 7
	}
	if "$zoneid" = "20" then
	{
		var arrowshop 70
		var arrowmenu 1
	}
	if "$zoneid" = "1" then
	{
		var arrowshop 97
		var arrowmenu 7
	}
	var resonance roomrecovery
	var noarrows 0
	gosub move %arrowshop
	gosub put.1 "order %arrowmenu" "^You ask"
	gosub put.1 "buy" "hands you"
	gosub put.1 "order %arrowmenu" "^You ask"
	gosub put.1 "buy" "hands you"
	gosub put.1 "bundle" "You bundle"
	gosub put.1 "order %arrowmenu" "^You ask"
	gosub put.1 "buy" "hands you"
	gosub put.1 "bundle" "You bundle"
	gosub put.1 "order %arrowmenu" "^You ask"
	gosub put.1 "buy" "hands you"
	gosub put.1 "bundle" "You bundle"
	gosub put.1 "out" "^Obvious"
	#if $mana > 40 then gosub put.2 "prep 411" "cast my arrows" "Cast Roundtime"
	#delay 3
	gosub put.1 "put arrows in %quiver" "You put" 
	#var eblade 1
return

checkplayer:
		var playerhere 0
		if contains("$roomplayers", "Also here") then var playerhere 1
		if contains("$roomobjs", " that appears stunned") then var playerhere 1
		if contains("$roomobjs", " that is lying") then var playerhere 1
		if contains("$roomobjs", "appears dead") then var playerhere 1
		if matchre("$roomobjs", " bolt| arrow| quarrel| pulzone") then var playerhere 1
		if contains("$roomobjs", " bundle") then var playerhere 1
		if contains("$roomobjs", " Shadow Servant,") then var playerhere 1
		if matchre("$roomobjs", "(lynx|bear|owl|leopard|panther|cat|dog|raven|falcon|goose|crow|bat|XXXratXXX|rabbit|piglet|squirrel|turtle|lizard|guinea-pig|gerbil)(,|\.| and)") then var playerhere 1
		if contains("$roomplayers", "Aayveia") then var playerhere 0
return

walk:
	#if (($monstercount > 0) && ("%weaponrange" != "missile")) then
	#{
		#if %heavy = 1 then gosub heavy.remove
		#gosub put.1 "retreat" "%retreat.msg|^Roundtime:|^You are"
		#gosub put.1 "retreat" "%retreat.msg|^Roundtime:|^You are"
		#goto walk
	#}
	gosub put.1 "$0" "^Obvious|^You can't swim"
return

expcheck:
	action (exp) on
	gosub put.1 "exp" "^Level:"
	#if %expswitch = 0 then gosub put.1 "spirit" "^Spirit"
	#	elseif %expswitch = 1 then gosub put.1 "stamina" "^Stamina points"
	action (exp) off
return

exptracker:
	action (trackexp) on
	
	var exptime
	var expdiff
	
	evalmath exptime round(((($gametime - $last.expcheck) / 60) / 60), 2)
	
	if %exptime < 1 then
	{
		echo %exptime hours since the last exp check.
		echo Skipping any exp checks less then one hour.
		action (trackexp) off
		return
	}
	
	
	put #var oldexp $currentexp
	
	gosub put.1 "exp" "Physical"
	
	evalmath exptime round(((($gametime - $last.expcheck) / 60) / 60), 2)
	evalmath expdiff $currentexp - $oldexp
	evalmath exptemp round((%expdiff / %exptime), 2)
	
	echo %exptime hours since the last exp check.
	echo %expdiff experience was gained since the last exp check.
	echo %exptemp experience per hour.
	
	put #var exp_perhour $exp_perhour|%exptemp
		
	put #var last.expcheck $gametime
	action (trackexp) off
return

skillcheck:
	var tempexp.cap %globalexp
	if "$1" != "" then var tempexp.cap $1
	if $%sort(%ix).LearningRate < %tempexp.cap then 
		{
			if "%sort(%ix)" = "%priorskill" then
				{
					evalmath ix (%ix + 1)
					goto skillcheck1
				}
			echo %sort(%ix)
			exit
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


sortskill:
	var items $1
	var countskills $2
	math countskills subtract 1
	var i 0
	
SORT.I:
	var j %i
	math j add 1
SORT.J:
	#if $%items(%j).Ranks < $%items(%i).Ranks or ($%items(%j).Ranks = $%items(%i).Ranks and $%items(%j).LearningRate < $%items(%i).LearningRate) then
	if $%items(%j).LearningRate < $%items(%i).LearningRate then
	{
		var itemi %items(%i)
		var itemj %items(%j)
		eval items replace("%items", "%items(%i)", "temp2")
		eval items replace("%items", "%items(%j)", "temp1")
		eval items replace("%items", "temp1", "%itemi")
		eval items replace("%items", "temp2", "%itemj")
	}
	math j add 1
	if %j <= %countskills then goto SORT.J
	math i add 1
	if %i < %countskills then goto SORT.I
	var sort %items
return

move:
	if "$0" = "" then return
	if %thrown.down = 1 then gosub stow %trainweapon.var
	if $hidden = 1 then gosub put.1 "unhide" "^You"
	if "$0" = "$roomid" then return
	put #script abort automapper
	if $invisible = 0 then
	{
		#if (("$guild" = "Necromancer") && (%getdirt = 0)) then gosub eotb 10 2
		if "$guild" = "Necromancer") then gosub eotb snap
		##if (("$guild" = "moon") && ("%train_now" != "forging")) then gosub rfwalk 5 1
	}
	if $roomid = 0 then put #mapper reset
	if $roomid = 0 then goto moveto.error
	var oldresonance
	if "%resonance" != "" then var oldresonance %resonance
	var resonance moving
	put #var mapperpath none
	if $1 > 0 then put #mapper path $1
	put #var lastmove $1
	if $1 > 0 then if "$mapperpath" = "none" then goto moveto.error
	put #mapper walk $0
movewait:
	gosub roundtimedone
	matchre movereturn @walk done.
	matchre movecounter Obvious
	matchre movecounter closes in behind you
	matchre movecounter you sneak
	matchre movecounter you go
	matchre movecounter ^Roundtime
	matchre movewait ^You can't go there\.|^Roundtime
	matchre movewait you edge across the bridge
	matchre movewait ^You struggle
	matchre movewait Almost to the highest part of the bridge
	matchre movewait As you walk across the last stretch, a sudden gust of wind shakes the bridge
	matchwait 15
moveto.error:
	echo Move timed out!
	if "%disconnected" = "yes" then goto notconnected
	if $roomid = 0 then
	{
		gosub movedir
		if $roomid != 0 then gosub move $lastmove
			else
			{
				if matchre("$roomobjs", "door") then 
				{
					put #echo >log Red Door in hib is messed up! FIX.
					gosub move go door
				}
				else
				{
					put #echo >log Red Unable to recover room!
					put quit
					exit
				}
			}
	}
	echo LOST...
	goto roomrecovery
	
movecounter:
	var disconnected no
	if %keywords > 0 then math keywords subtract 1
	if matchre("$roomname", "Hunting Preserve") then var keywords 0
	if "$monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	goto movewait
movereturn:
	if "%oldresonance" != "" then var resonance %oldresonance
	if "%resonance" = "moving" then var resonance
	var talking none
	return

movedir:
		if $up = 1 then
			{
				gosub put.1 "up" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $east = 1 then 
			{
				gosub put.1 "east" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $north = 1 then
			{
				gosub put.1 "north" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $northeast = 1 then
			{
				gosub put.1 "ne" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $northwest = 1 then 
			{
				gosub put.1 "nw" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $down = 1 then
			{
				gosub put.1 "d" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $west = 1 then
			{
				gosub put.1 "w" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $south = 1 then
			{
				gosub put.1 "s" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $southeast = 1 then
			{
				gosub put.1 "se" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $southwest = 1 then
			{
				gosub put.1 "sw" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if matchre("$roomobjs", "door") then 
		{
			put #echo >log Red Door in hib is messed up! FIX.
			gosub move go door
		}	
		if matchre("$roomexits", "none") then
		{
			put #echo >log Red No exits! Unable to recovery.
			put quit
			exit
		}
return
	
grandcounter:
	if %t > 15 then gosub gmcheckupdate
	if %t > 0 then gosub grandupdate
	return
gmcheckupdate:
	setvariable keywords 0
	return
grandupdate:
	math halfcounter add 1
	math quartcounter add 1
	math astrocounter add 1
	if %halfcounter > 3 then math grandcounter add 1
	if %halfcounter > 3 then setvariable halfcounter 0
	timer clear
	timer start
return
	
pause:
	var time $0
	pauseloop:
	if %time > 5 then 
	{
		pause 1
		math time subtract 1
	}
		else
		{
			pause .2
			math time subtract .2
		}
	gosub roundtimedone
	gosub loopfix
	if %time > 0 then goto pauseloop
return

loopfix:
	if %time < 0 then return
	if %time > 5 then 
	{
		pause 1
		math time subtract 1
	}
		else
		{
			pause .2
			math time subtract .2
		}
return

antipersonnel:
	if "%resonance" = "runhide" then return
	if "%resonance" = "climbing" then return
	if "%resonance" = "stealing" then return
	if "%resonance" = "moving" then return
	if "%resonance" = "roomrecovery" then return
	if "%runhide" = "yes" then return
	
	
	if matchre("%talking", "%oklist") then return
	if matchre("%resonance", "%ignorerooms") then return
	
	
	if matchre("%resonance", "a voice yells from the") then return
	
	if matchre("%talking", "a gravelly whisper accompanying the motion") then return
	if matchre("%talking", "\[?OOC: .+ (PM|AM)") then return
	if matchre("%talking", "\[?OOC: .+ 3.0") then return
	if matchre("%talking", "shouts, .+ \[?OOC:") then return
	if matchre("%talking", "shout, .+ \[?OOC:") then return
	if matchre("%talking", "voice of a crier outside") then return
	if matchre("%talking", "Order of the White Rose") then return
	if matchre("%talking", "Your mind hears") then return
		
	if matchre("%talking", "You hear a muffled") then return
	if matchre("%talking", "The wind is but a whisper") then return
	
	if matchre("%talking", "Turning, you see a smiling nedum") then return
	
	## ** Shops/services **
	if matchre("%talking", "asks the gemcutter") then return
	if matchre("%talking", "The gem") then return
	if matchre("%talking", "The teller carefully records") then return
	if matchre("%talking", "The money-changer says crossly") then return
	if matchre("%talking", "your rope back") then return
	if matchre("%talking", "asks Rasiya") then return
		
	## ** Creatures
	
	if matchre("%talking", "and turn to see a kelpie") then return
	if matchre("%talking", "You hear a gleeful hoot and turn to see a stone-throwing") then return
	if matchre("%talking", "A malodorous bucca (giggles|whoops|bounces|covers)") then return
	
	## ** Necromancer lines
	if matchre("%talking", "^You whisper the final word|^You whisper several words of arcane") then return
	
	## ** Spell lines
	if matchre("%talking", "^With a final, swirling whisper") then return
	if matchre("%talking", "^You hear someone chanting") then return
	
	## ** Astrology
	if matchre("%talking", "^The Brigantine") then return
		
	## ** Cleric lines
	if matchre("%talking", "^You hear a soft voice say") then return
	
	## ** Room descriptions
	if matchre("%talking", "^Tall sharp blades of switch grass") then return
	if matchre("%talking", "^The neat rows of grain curve east slightly to the north and") then return
	if matchre("%talking", "^The ridge widens out") then return
	if matchre("%talking", "^The remnant of an incredible") then return
	if matchre("%talking", "^Utter darkness under the") then return
	
	## ** Autohealer lines
	if matchre("%talking", "Shalvard") then return
	if matchre("%talking", "(Kheldas|Remcinsh|Aayveia)") then return

	var keywords 0
	#debuglevel 10
	put #echo >log Red Runehide trigger!! %talking
	if matchre("%talking", "(?:killing|talk|hurting|attacking|tell|answer|reply|speak|ignore|typing|type|you there|demand)") then
	{
		var gmlogoff 1
		delay 3
		put say Hmmmm.
		delay 2
	}
	
	if "%talking" != "none" then echo %talking
	var runhide_action wave
	if contains("%talking", "asks,") then var runhide_action shake head
	
	setvariable talking none
	gosub clear
	debuglevel 0
	goto runhide

runhide:
	#goto GMcheckmain
	gosub getmat.now
	put #play helphelp
	put #play helphelp
	put #play helphelp
	put #play helphelp
	var runhide yes
	var resonance
	gosub clear
	gosub returnhome
	gosub stow all
	gosub move %saferoom
	if %gmlogoff = 1 then gosub pause 45
		else gosub pause 120
	var runhide no
	if %gmlogoff = 1 then goto GMcheckmain
	goto $charactername

standloop:
	var oldresonance
	if "%resonance" != "" then var oldresonance resonance
	var resonance moving
standloop1:
	pause .1
	gosub put.1 "dance silly" "^You leap"
	if $standing != 1 then goto standloop1
	var resonance
	if "%oldresonance" != "" then var resonance %oldresonance
return

vipercrack:	
	gosub put.1 "search" "^Roundtime"
	gosub put.1 "go crack" "^Obvious|^You can't"
	if $roomid != 13 then goto vipercrack
viperloop:
	gosub put.1 "search" "^Roundtime"
	gosub put.1 "go open" "^Obvious|^You can't"
	if $roomid = 13 then goto viperloop
return
	
roomrecovery:
	put #script abort automapper
	gosub returnhome
	gosub move %saferoom
		
	gosub clear
	goto $charactername

restnow:
	gosub returnhome
	goto supernode
	
returnhome:
	if "$zoneid" = "%homezone" then return
	if $roomid = 0 then gosub movedir
	##gosub flee
	## Comment out your home zone
	if "$guild" = "Necromancer" then gosub eotb snap
	gosub emptyhands
	
	## ** Boar clan and hib
	## ** From Boar to Hib
	#if "$zoneid" = "127" then gosub move 510
	#if "$zoneid" = "126" then gosub move 49
	#if "$zoneid" = "123" then gosub move 169
	#if "$zoneid" = "116" then gosub move 3
	
	## ** To boar from Hib
	if "$zoneid" = "175" then gosub move 69
	if "$zoneid" = "123" then gosub move 169
	if "$zoneid" = "116" then 
	{
		gosub autoheal.check
		gosub arearituals
		gosub move 217
	}
	if "$zoneid" = "126" then gosub move 103
	
	###*** to trolls if "$zoneid" = "116" then gosub move 3
	
	if "$zoneid" = "40a" then gosub move 125
	if "$zoneid" = "112" then gosub move 112
	if "$zoneid" = "42" then gosub move 2
	if "$zoneid" = "211" then gosub move 2
	if "$zoneid" = "10" then gosub move 22
	if "$zoneid" = "14c" then gosub move 21
	if "$zoneid" = "92" then gosub move 92
	if "$zoneid" = "98" then gosub move 86
	if "$zoneid" = "65" then gosub move 1
	if "$zoneid" = "10" then gosub move 22

## *** To Crossing
	if "$zoneid" = "14c" then gosub move 21
	if "$zoneid" = "9b" then gosub move 9
	if "$zoneid" = "11" then gosub move 2
	## ** NTR ROAD - 7
	if "$zoneid" = "7" then gosub move 347
	## ** North Gate
	if "$zoneid" = "6" then gosub move 114
	## ** Home Zone
	#if "$zoneid" = "4" then gosub move 14
## *** To Crossing	
	
	if "$zoneid" = "8" then gosub move 43
	if (("$zoneid" = "116") && ("$charactername" = "Stoh")) then gosub move 3
	if "$zoneid" = "1" then 
	{
		## ** Bank zone
		gosub move 172
		#gosub move 145
		#gosub move 171
		#gosub walk n
	}
	if "$zoneid" = "6" then gosub move 114
	if "$zoneid" = "90" then gosub move 663
	if "$zoneid" = "69" then gosub move 1
	if "$zoneid" = "67" then gosub move 132
	if "$zoneid" = "65" then gosub move 1
	if "$zoneid" = "62" then gosub move 101
return

sellcheck:
	gosub sellbundle
	gosub gemsell
	gosub bankrun
return

autohealer.move:
	var autohealer.exit 1
	gosub emptyhands
	## ** To Hib from boar
	if "$zoneid" = "127" then gosub move 510
	if "$zoneid" = "126" then gosub move 49
	
	## ** To hib from shard
	if "$zoneid" = "123" then gosub move 169
	goto autohealer

autoheal.check:
	action (autohealer) var wounds $1 when ^You have ((\b(?!no )\w+).+)$
	action (autohealer) on
	
	var wounds
	gosub put.1 "health" "^Your body"
	
	if "%wounds" = "" then
	{
		action (autohealer) off
		return
	}
autohealer:
	var resonance healing
	gosub emptyhands
	gosub cyclic_check
	gosub move healer
	pause 3
	if "$kheldas_say" = "1" then if matchre("$roomplayers", "Kheldas") then 
	{
		put say Sorry about cutting earlier.
		pause 2
		put bow
		put #var kheldas_say 0
	}
	
autohealerwait.loop:
	if "$roomplayers" != "" then
	{
		if matchre("$roomplayers", "Also here: .+ who is lying") then
		{
			gosub pause 10
			put health
			goto autohealerwait.loop
		}
	}
	if $invisible = 1 then gosub reveal
	gosub put.1 "lie" "^You lie down\."
	var doresearch 1
	pause 1
healfull.loop:
	if $prone = 1 then
	{
		gosub pause 10
		put health
		goto healfull.loop
	}
	if "%resonance" != "stealing" then var resonance
	var doresearch 0
	if %autohealer.exit = 1 then 
	{
		var autohealer.exit 0
		goto $charactername
	}
	else return

stealcheck:
	#debuglevel 10
	if %steal.yes = 0 then return
	if %stealexit = 1 then
	{
		evalmath stealtemp (%stealexit.timer - $last.steal)
		var stealexit 0
	}
	gosub healcheck
		else evalmath stealtemp ($gametime - $last.steal)
	evalmath stealtemp (%stealtemp / 60)
	evalmath stealtemp round(%stealtemp, 2)
	evalmath stealecho (60 - %stealtemp)
	echo %stealecho minutes until steal timer is up.
	if %stealtemp < 60 then return
	
	## ** Spell up room
	gosub returnhome
	gosub emptyhands
	gosub release
	if "$charactername" = "Raelok" then
	{
		var temp99 0
		if %doresearch = 1 then var temp99 1
		if %doresearch = 1 then var doresearch 0
	
		var 1.spelluproom 415
		var 2.spelluproom 415
		var towngate 14
				
		gosub move %1.spelluproom
		gosub checkplayer
		if %playerhere = 1 then gosub move %2.spelluproom
		gosub trainarmor remove
			gosub spellstance 100 130 70
			gosub castbuff Obfuscation 16 30 20
			gosub spelldelay
			gosub castbuff Vigor 20 20 20
			gosub spelldelay
			gosub castbuff "Rite of Contrition" 7 7 20
			gosub spelldelay
			gosub release eotb
			gosub eotb
		
		## ** Move to town for stealing
		gosub move %towngate
		gosub sellcheck
		gosub move 103
		
		gosub emptyhands
		#gosub researchcheck
		gosub eotb
		put #var last.steal $gametime
		send .steal
		put #script pause raeloktrain
		if %temp99 = 1 then var doresearch 1
		gosub trainarmor wear
		gosub spellstance 130 100 70
		## ** End Raelok
	}
	if "$charactername" = "Stoh" then
	{
		gosub move 232
		if "%Shadows" = "off" then 
		{	
			gosub shadows
		}
		## ** Start stealing
		put #var last.steal $gametime
		gosub stealaesry.now
		## ** End Stoh
	}
	if "$charactername" = "Vayek" then
	{
		gosub move 229
		gosub heavy.remove
		## ** Start stealing
		## ** West gate entrance to town
		##** Cross west gate gosub move 14
		put #var last.steal $gametime
		gosub stealaesry.now
		gosub heavy.wear
		## ** End Vayek
	}
	gosub tendwound
	gosub returnhome
	var resonance
return

getmat.now:	
	var exitstand 0
	var playsong off
	put stop play
	pause 1
	if "%playsong" = "on" then goto getmat.now

getmat.now.loop:
	if matchre("$roomobjs", "prayer mat") then
	{
	if $standing = 0 then 
	{
		math exitstand add 1
		if %exitstand > 2 then goto getmat.now.exit
		if $standing = 0 then 
		{
			put dance
			pause .5
		}
		if $standing = 0 then 
		{
			put stand
			pause .5
		}
		goto getmat.now.loop
	}
	}
getmat.now.exit:
	if matchre("$roomobjs", "prayer mat") then
	{
		if "$lefthand" != "Empty" then put stow left
		pause .5
		if "$righthand" != "Empty" then put stow right
		pause .5
		put roll mat
		pause .5
		if matchre("$roomobjs", "prayer mat") then put roll mat
		pause .5
		if matchre("$roomobjs", "prayer mat") then put roll mat
	}
	if matchre("$roomobjs", "prayer mat") then put #echo >log Red Prayer mat still on ground! $lefthand, $righthand, $roomname, $roomobjs
return	

windblown:
	gosub clear
	var skinnow 1
windblownloop:
	pause .5
	if $stunned = 1 then goto windblownloop
	if $standing = 0 then gosub stand
	var skinnow 0
	goto starthunt
	
exit:
	put #flash
	action clear
	var exitnow 1
	gosub clear
	pause 15
	timer clear
	timer stop
	put quit
	pause 2
	put quit
	goto reconnect
exitfulldead:
	put say Ouch.
	pause 2
	put say Really?
	pause 5
	put say I can't deal with this right now.
	pause 1
	goto exitquick
exitfull:
	put #flash
	action clear
	var exitnow 1
	gosub clear
	pause 20
	if dead then put quit
	pause 2
	if dead then put quit
	pause 20
exitquick5:
	pause 5
exitquick:
	gosub getmat.now
	put #script abort automapper
	put #flash
	put #beep
	put #beep
	action clear
	var exitnow 1
	gosub clear
	#config connect False
	put quit
	pause 2
	put quit
	exit

gmcheckexit:
	## *** Not using
	gosub stance defense
	gosub checkplayer
	if %playerhere = 1 then 
	{
		put say OOC: Sorry... I think im getting script checked.
	}
	pause 5
	put SAY OOC: HELLO.  
	pause 5
	put SAY OOC: Seriously, leave me alone.
	pause 2
	put say OOC: I'm killing you because you are the enemy, give me experience, and that's what the game was designed for.
	pause 7
	put say OOC: So thank you, for bringing me OOC.
	pause 5
	gosub returnhome
	goto exitquick
	
	
disarmexit:
	put say BACK OFF.
	pause 1
	pause 1
	if matchre("$roomobjs", "%firstweapon") then put get my %first weapon
	goto exitquick
	

checktime:
	var checktime 0
	#12:24:24 AM
	eval timenow replacere("$time", ":", "|")
	eval timenow replacere("%timenow", " AM", "|AM")
	eval timenow replacere("%timenow", " PM", "|PM")
	#put #echo It's %timenow(0) %timenow(3)
	if "$charactername" = "Calesti" then
	{
		if (((%timenow(0) = 08) && ($connected = 1) && ("%timenow(3)" = "AM")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	var checktime 1
return

quittime:
	var resonance runhide
	gosub returnhome
	gosub move %saferoom
	gosub emptyhands
	gosub clear
	put quit
	exit

notconnected:
if "$charactername" = "Calesti" then exit
if "$charactername" = "Calesti" then exit

RETURN:

return
	

include routineGMcheck.cmd
include routinemagic.cmd