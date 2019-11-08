routinemagic:


	#action math arrayloc add 1;var invoke 1 when ^Your .+ thrums softly as it discharges all its|^The .+ is dim, almost magically null
	#action var invoke 1 when ^You begin to lose focus on your
	## ** Sorcery spell actions
	action (life_sorc) var Vigor on when ^You close your eyes, drawing on the vitality of your surroundings
	action (life_sorc) var Vigor off when ^You sense the Vigor spell fade away
	action (ele_sorc) var Zephyr on; put #event 170 {#parse With a final, swirling whisper,} when ^A (faint|gentle|delicate) (pleasant|warm) breeze begins
	action (ele_sorc) var Zephyr off when ^With a final, swirling whisper,
	
	action var Gauge on when ^A distracting flurry of
	action var Gauge off when ^Your eyes briefly darken\.  When you
	action var Manifest on when ^The air around you .+\.  The scintillating light writhes
	action var Manifest off when silent cascade of glassy fragments that vanish before reaching the ground\.$|^The air around you shimmers with .+ that quickly
	action var Ease off when ^You feel a weight settle over you
	action var Ease on when ^Pale yellow sparks begin to flicker
	
	## ** Spell research
	action var startresearch 1 when ^You make definite progress|^Breakthrough\!|^You decide to stop researching|^You have abandoned|^As time passes|^Distracted by (your|combat)|^You lose your focus on your research
	action put #var newfocus 1 when ^Your focused insight
	action put #var newresearch 1 when ^Breakthrough\!
	action if %startresearch = 0 then var startresearch 1 when ^Your eyes briefly darken
	
	var invokeswitch 0
	var trainmagic 0
	var usedcamb 0
	var invoke 0
	action (life_sorc) off
	action (ele_sorc) off

magicspelloff:	
	var Vigor off
	var Zephyr off
	var Gauge off
	var Manifest off
	var Ease off

return


castbuff:
	var temp1 $1
	var temp2 $2
	var temp3 $3
	var temp4 $4
	var delay $4
	if matchre("$preparedspell", "%targetspells") then gosub release spell
	if matchre(("$preparedspell", %debilspells") && !matchre("%temp1", %debilspells")) then gosub release spell
	if (("$preparedspell" != "%temp1") && ("$preparedspell" != "None")) then return
	gosub shortspells
	if $spelltime > %delay then gosub castrequest "%temp1" %temp2 %temp3 %temp4
		else gosub preprequest "%temp1" %temp2 %temp3 %temp4
	if ((%docamb = 1) && ("$preparedspell" != "None") && (%usedcamb = 0)) then gosub castcamb "%temp1" %temp2 %temp3 %temp4
	if %spelluproom = 1 then gosub spelldelay
	#if ((%harness_spell = 1) && (%harness_done = 1) && ("$preparedspell" != "None")) then gosub castharness "%temp1" %temp2 %temp3 %temp4
	#if (("$preparedspell" = "%targetspell") && ($spelltime < 5)) then gosub release spell
	#	elseif ("$preparedspell" = "%targetspell") then return
	#evalmath delay (%delay + .5)
	#if %harness_spell = 1 then evalmath delay (%delay - 5)
return

castcamb:
	var temp1 $1
	var temp2 $2
	var temp3 $3
	var temp4 $4
	var usedcamb 1
	evalmath totalcharge (%temp3 - %temp2)
	if %totalcharge < 0 then var totalcharge 0
	if %totalcharge = 0 then return
	#if (("$righthandnoun" != "%camb") && ("$lefthandnoun" != "%camb") && ("$lefthand" != "Empty")) then gosub stow left
	#if (("$righthandnoun" != "%camb") && ("$lefthandnoun" != "%camb") && ("%camb" != "orb")) then gosub put.1 "rem my %camb" "%wear.msg"
	#if (("$righthandnoun" != "%camb") && ("$lefthandnoun" != "%camb") && ("%camb" != "orb")) then gosub put.1 "get my %camb" "%get.msg"
	#if (("$righthandnoun" != "%camb") && ("$lefthandnoun" != "%camb") && ("%camb" = "orb")) then gosub get my %camb
	var invoke 1
castcamb.loop:
	pause .1
	var chargecamb %totalcharge
	if %totalcharge > %docharge then var chargecamb %docharge
	gosub put.1 "charge my %camb %chargecamb" "^Roundtime|^Try though"
	evalmath totalcharge (%totalcharge - %chargecamb)
	if %totalcharge > 0 then goto castcamb.loop
	gosub put.1 "invoke %camb spell" "^Roundtime"
	var invoke 0
	#if %incombat = 1 then gosub put.1 "wear %camb" "%wear.msg"
	if matchre("$preparedspell", "%sorc_list") then
	{
		#if "%camb" != "orb" then gosub put.1 "wear %camb" "%wear.msg"
		#if ((("$lefthandnoun" = "orb") || ("$righthandnoun" = "orb")) && (%trainmagic = 0)) then gosub stow orb
	}
return

casttarget:
 	var temp1 $1
	var temp2 $2
	var temp3 $3
	var delay $4
	#if (("$preparedspell" != "%temp1") && ("$preparedspell" != "None")) then return
	gosub shortspells
	if $spelltime > %delay then gosub castrequest "%temp1" %temp2 %temp3 %delay
		else gosub preprequest target "%temp1" %temp2
return

preprequest:
	var temp1 $1
	var temp2 $2
	var temp3 $3
	var temp4 $4
	var delay $4
	var fullprep 0
	if "$preparedspell" != "None" then return
	if ((matchre("%training_spell_list", "%temp1") && (%chaos = 1)) then gosub put.1 "prepare symb" "^You recall the exact|^But you've"
	#{
		#if %incombat = 1 then if "%temp1" != "Manifest Force" then gosub put.1 "prepare symb" "^You recall the exact|^But you've"
		#if %incombat = 0 then gosub put.1 "prepare symb" "^You recall the exact|^But you've"
	#}
	if "%temp1" = "target" then 
	{
		if "%temp2" = "fou" then 
		{
			gosub put.1 "prep %temp2 %temp3" "%prep.msg"
			gosub put.1 "target all" "^You begin"
		}
			else gosub put.1 "target %temp2 %temp3" "%prep.msg"
	}
	else gosub put.1 "prep %temp1 %temp2" "%prep.msg"
return

castrequest:
	var temp1 $1
	var temp2 $2
	var temp3 $3
	var temp4 $4
	var releasespells Shear|Eyes of the Blind|Shadowling|Shadow Servant
	if %releasetrain = 1 then
	{
	if matchre("%releasespells", "$preparedspell") then 
	{
		var releasenow 1
		var temp1 $preparedspell
		gosub shortspells
	}
	}
	if %temp3 != "" then evalmath totalharness (%temp3 - %temp2)
	if ((%harness_spell = 1) && (%totalharness > 1.999)) then
	{
		evalmath totalharness (%temp3 - %temp2)
		evalmath harnessnow (%totalharness / 2)
		gosub put.1 "harness %harnessnow" "^Roundtime"
		gosub put.1 "harness %harnessnow" "^Roundtime"
	}
castmanaloop:	
	if $mana < 15 then
	{
		delay 1
		goto castmanaloop
	}
	if (("$righthandnoun" != "") || ("$lefthandnoun" != "")) then if matchre("$preparedspell", "%sorc_list") then gosub emptyhands
	if (("%camb" = "orb") && ("$preparedspell" = "%moon_sorc") && (("$lefthandnoun" = "%camb") || ("$righthandnoun" = "orb"))) then gosub stow orb
castnow:
	var usedcamb 0
	if "%Shear" = "on" then gosub release shear
	if "$preparedspell" = "Ethereal Fissure" then gosub put.1 "cast water" "%cast.msg"
	if "$preparedspell" = "Locate" then gosub put.1 "cast Stoh" "%cast.msg"
	if "$preparedspell" = "Sanctify Pattern" then gosub put.1 "cast warding" "%cast.msg"
	if "$preparedspell" = "Malediction" then
	{
		if $monstercount > 0 then gosub put.1 "cast defense" "%cast.msg"
			else 
			{
				put release spell
				pause 1
			}
	}
	if "$preparedspell" = "Hydra Hex" then gosub put.1 "cast male offense" "%cast.msg"
	if "$preparedspell" = "Phelim's Sanction" then if matchre("$roomobjs", "that appears stunned") then gosub pause 3
	if matchre("$preparedspell", "%sorc_list") then if (("$righthand" != "Empty") || ("$lefthand" != "Empty")) then gosub emptyhands
	if "$preparedspell" != "None" then gosub put.1 "cast" "%cast.msg"
	if ((%releasenow = 1) && (%releasetrain = 1)) then
	{
		var releasenow 0
		eval temp1 tolower(%temp1)
		if "%temp1" = "shadow servant" then gosub release servant
			else gosub release %temp1
	}
	if "$preparedspell" != "None" then gosub release spell
	if %doresearch = 1 then var startresearch 1
	var castnow 0
return

spelltrain:
	if "$preparedspell" != "None" then 
	{
		if $spelltime > 21 then gosub castrequest 1 1 1 1
		return
	}
	var spelltrain %$1
	var delay %spelltrain(3)
	if "$charactername" = "Kaislan" then if $%spelltrain(4).LearningRate > 31 then return
	if "$charactername" = "Stoh" then if $%spelltrain(4).LearningRate > %globalexp then return
	if (("$roomplayers" != "Also here: Luminary Stoh.") && ("$roomplayers" != "") && (matchre("%spelltrain(0)", "%necromancer_spell_list"))) then
	{
		gosub pause 1
		return
	}
	gosub castbuff "%spelltrain(0)" %spelltrain(1) %spelltrain(2) %delay
	if $spelltime != 0 then
	{
		evalmath delaytime (%delay - $spelltime)
		if (($Perception.LearningRate < 34) && (%delaytime > 10)) then gosub startcollect 1
		evalmath delaytime (%delay - $spelltime)
		if "$charactername" = "Vayek" then if %delaytime > 8 then gosub huntcheck
		evalmath delaytime (%delay - $spelltime)
		if %delaytime > 8 then gosub ppcheck
		evalmath delaytime (%delay - $spelltime)
		#if %delaytime > 9 then gosub appcritter
		#evalmath delaytime (%delay - $spelltime)
		if ("$preparedspell" != "None") then delay %delaytime
		gosub castrequest
	}
	
	gosub ppcheck
return

spelldelay:
	if $spelltime != 0 then
	{
		evalmath delaytime (%delay - $spelltime)
		delay %delaytime
	}
	if !matchre("$preparedspell", "(Consume Flesh|Bless)") then gosub castrequest
return

shortspells:
necroshort:
	if "%temp1" = "Rite of Contrition" then var temp1 roc
	if "%temp1" = "Eyes of the Blind" then var temp1 eotb
	if "%temp1" = "Acid Splash" then var temp1 acs
	if "%temp1" = "Siphon Vitality" then var temp1 sv
	if "%temp1" = "Quicken the Earth" then var temp1 qe
	if "%temp1" = "Rite of Contrition" then var temp1 roc
	if "%temp1" = "Sense of the Tiger" then var temp1 sott
moonshort:
	if "%temp1" = "Steps of Vuan" then var temp1 sov
	if "%temp1" = "Aura Sight" then var temp1 aus
	if "%temp1" = "Telekinetic Throw" then var temp1 tkt
mageshort:
	if "%temp1" = "Mark of Arhat" then var temp1 moa
	if "%temp1" = "Stone Strike" then var temp1 sts
	if "%temp1" = "Aegis of Granite" then var temp1 aeg
clericshort:
	if "%temp1" = "Shield of Light" then var temp1 sol
	if "%temp1" = "Phelim's Sanction" then var temp1 ps
	if "%temp1" = "Hand of Tenemlor" then var temp1 hot
	if "%temp1" = "Fists of Faenella" then var temp1 ff
	if "%temp1" = "Fire of Ushnish" then var temp1 fou
	if "%temp1" = "Horn of the Black Unicorn" then var temp1 horn
	if "%temp1" = "Persistence of Mana" then var temp1 pom
return

chargecamb:
	action var totalcharge 0 when resists, only absorbing part|is already holding as much power
	var camb_item $1 
	var totalcharge $2
	var charge_now 11
	if "%camb_item" = "orb" then gosub get orb
	#gosub put.1 "remove %camb_item" "^You"
chargecamb.loop:
	var chargecamb %totalcharge
	if %totalcharge > %charge_now then var chargecamb %charge_now
	gosub put.1 "charge my %camb_item %chargecamb" "^Roundtime|^Try though"
	evalmath totalcharge (%totalcharge - %chargecamb)
	if %totalcharge > 0 then goto chargecamb.loop

	action remove resists, only absorbing part|is already holding as much power
	#if (("$lefthandnoun" = "orb") || ("$righthandnoun" = "orb")) then gosub stow orb
	#gosub put.1 "wear %camb_item" "^You"
return
	
quickspelltrain:
	#if %docamb = 1 then if (("$righthand" != "Empty") && ("$lefthand" != "Empty")) then return
	gosub ppcheck
	if "$guild" = "Cleric" then if $spelltime > 27 then gosub castrequest
	if "$guild" != "Cleric" then if $spelltime > 21 then gosub castrequest
	gosub sortskill Sorcery|Utility|Augmentation|Warding 4
	gosub castbuff "%%sort(0)(0)" %%sort(0)(1) %%sort(0)(2) %%sort(0)(3)
	if (($monstercount < 1) && (%swimmingnow != 1)) then gosub castbuff "%%sort(0)(0)" %%sort(0)(1) %%sort(0)(2) %%sort(0)(3)
return

cyclic_check:
	if "$guild" = "mage" then gosub magetrain
	if "$guild" = "Necromancer" then gosub roccheck
	if "$guild" = "Cleric" then gosub shroudcheck
return

researchcheck:
	#if "%resonance" = "moving" then return
	if %startresearch = 0 then return
	if "%playsong" = "on" then return
	if "%Gauge" = "off" then 
	{
		if "%resonance" = "moving" then goto researchexit
		gosub gauge
		gosub spelldelay
	}
	if $newresearch = 1 then
	{
	put #var researchtemp %1research
		if $%third.research.LearningRate < 17 then put #var researchtemp %3research
		if $%second.research.LearningRate < 17 then put #var researchtemp %2research
		if $%first.research.LearningRate < 17 then put #var researchtemp %1research
		put #var newresearch 0
	}
	if "$preparedspell" = "None" then
	{
		if "$charactername" = "Stoh" then gosub put.1 "research $researchtemp 300" "^You tentatively reach out|^You are already busy|^You realize that preparing|^You confidently begin"
		if "$charactername" = "Kaislan" then gosub put.1 "research $researchtemp 300" "^You tentatively reach out|^You are already busy|^You realize that preparing|^You confidently begin"
	}
	var startresearch 0
researchexit:
	var researchloop 1
return

invokenow:
	var invokeswitch 1
	if "%cambarray(%arrayloc)" = "orb" then gosub get orb
	gosub put.1 "invoke %cambarray(%arrayloc) cyclic" "^Roundtime"
	if (("$lefthandnoun" = "orb") || ("$righthandnoun" = "orb")) then gosub stow orb
	var invokeswitch 0
	var invoke 0
	
	## *** old camb items
	#gosub put.1 "remove %cambarray(%arrayloc)" "^You"
	#gosub put.1 "wear %cambarray(%arrayloc)" "^You"
return

prep:
	var do1 $1
	var do2 $2
	gosub put.1 "prep %do1 %do2" "%prep.msg"
return

cast:
	if matchre("$preparedspell", "%sorc_list") then if (("$righthand" != "Empty") || ("$lefthand" != "Empty")) then gosub emptyhands
	var do1 $0
	gosub put.1 "cast %do1" "%cast.msg"
return

release:
	var temprelease $1
	if matchre("$preparedspell", "%targetspells") && $spelltime > 10 && $monstercount > 0 then gosub castnow
		else gosub put.1 "release %temprelease" "^A looming|^The shimmering|^You let your|^RELEASE|^You don't|^You aren't|^Your corruption fades"
return

clearcamb:
	gosub put.1 "invoke %camb spell" "^Roundtime"
	gosub castbuff "Shear" 1 1 10
return
	
spellstance:
	gosub put.1 "spell stance $1 $2 $3" "^Your spell Integrity|^The total of the spell"
return

perc:
	gosub put.1 "perc $1" "^Roundtime"
return

start.magiclearn:
	gosub loreroom
	
	var cycliccast 0
	var trainmagic 1
	var releasetrain 1
	var doresearch 0
	var magiclearn.exp %globalexp
	if "$charactername" = "Kaislan" then 
	{
		var magiclearn.exp 31
		var docharge 10
		gosub release
		gosub pomcast
	}
	var skillexit magiclearn.exit
		
	if "%Rite" = "on" then gosub release roc
	
	put #var magic.start $gametime
	
	if "$guild" = "mage" then 
	{
		gosub castbuff "Steps of Vuan" 10 10 10
		gosub spelldelay
		gosub block
	}
	if %collectmagic = 1 then var castcamb 0
magiclearn.loop:
	evalmath magictemp ($gametime - $magic.start)
	echo %magictemp seconds training.
	if %magictemp > 3600 then goto magiclearn.exit
	gosub cyclic_check
	
	if %collectmagic = 1 then if $Perception.LearningRate > %magiclearn.exp then goto magiclearn.exit
		else if (("$charactername" = "Raelok") && ($Warding.LearningRate > %magiclearn.exp) && ($Utility.LearningRate > %magiclearn.exp) && ($Sorcery.LearningRate > %magiclearn.exp) && ($Augmentation.LearningRate > %magiclearn.exp)) then goto magiclearn.exit
	if (("$charactername" = "Stoh") && ($Augmentation.LearningRate > %magiclearn.exp) && ($Utility.LearningRate > %magiclearn.exp) && ($Sorcery.LearningRate > %magiclearn.exp)) then goto magiclearn.exit
	if (("$charactername" = "Kaislan") && ($Warding.LearningRate > %magiclearn.exp) && ($Sorcery.LearningRate > %magiclearn.exp) && ($Utility.LearningRate > %magiclearn.exp) && ($Augmentation.LearningRate > %magiclearn.exp)) then goto magiclearn.exit
	if "$guild" = "Necromancer" then
	{
		#if "%Philosopher" = "off" then gosub castbuff "Philosopher's Preservation" 10 35 20
		#if "%Calcified" = "off" then gosub castbuff "Calcified Hide" 15 25 20
		#if "%Kura" = "off" then gosub castbuff Kura-Silma 15 35 20
	}
	#if "$guild" = "Cleric" then gosub buffcheck
	if "$guild" = "Moon" then
	{
		if "%Aura" = "off" then
		{
			gosub castbuff "Aura Sight" 30 99 20
			gosub release spell
			gosub clearcamb
		}
	}
	#if $monstercount > 0 then gosub spelltrain Debilitation
	if "$charactername" = "Stoh" then
	{
		gosub spelltrain Utility
		#gosub spelltrain Warding
		gosub spelltrain Sorcery
		if $Sorcery.LearningRate > %globalexp then gosub spelltrain Augmentation1
			else gosub spelltrain Augmentation
	}
	if "$charactername" = "Raelok" then
	{
		gosub spelltrain Utility
		gosub spelltrain Warding
		gosub spelltrain Sorcery
		gosub spelltrain Augmentation
	}
	if "$charactername" = "Kaislan" then
	{
		#gosub cyclic_check
		gosub spelltrain Augmentation
		gosub spelltrain Utility
		gosub spelltrain Warding
		gosub spelltrain Sorcery
	}
	
	#gosub pause 1
	gosub ppcheck
	goto magiclearn.loop

magiclearn.exit:
	var releasetrain 0
	var trainmagic 0
	var docharge %start.docharge
	if %collectmagic = 1 then
	{
		var collectmagic 0
		var castcamb 1
	}	
	if %usedcamb = 1 then gosub spelldelay
	else gosub release spell
	gosub emptyhands
	gosub stealcheck
return

sorcerylearn:
	if $Sorcery.Ranks > 65 then return
	gosub emptyhands
	gosub get asketine rune
	gosub swap
	
sorcery.loop:
	gosub quickspelltrain
	gosub put.1 "focus my rune" "^Roundtime"
	if $Sorcery.LearningRate < 33 then goto sorcery.loop
	
	gosub emptyhands
	#gosub lock
	return

combat.spellup:
if "$guild" = "mage" then
	{
		gosub put.1 "summon admittance" "^Roundtime|^You so"
		gosub put.1 "summon admittance" "^Roundtime|^You so"
		gosub put.1 "path focus power" "^You focus|^You lack|^You are"
		var spelluproom 1
		var docharge 10
		if "%Aegis" = "off" then gosub aegis
		gosub put.1 "path focus power" "^You focus|^You lack|^You are"
		if "%Fissure" = "off" then gosub castbuff "Ethereal Fissure" 15 35 21
		if "%Manifest" = "off" then gosub castbuff "Manifest Force" 15 15 5
		if "%Minor" = "off" then gosub castbuff "Minor Physical Protection" 10 15 21
		if "%Sure" = "off" then gosub castbuff "Sure Footing" 15 55 21
		if "%Swirling" = "off" then gosub castbuff "Swirling Winds" 15 55 21
		if "%Y'ntrel" = "off" then gosub castbuff "Y'ntrel Sechra" 15 45 21
		if "%Substratum" = "off" then gosub castbuff "Substratum" 15 55 21
		gosub put.1 "path stop" "^You gently"
		var docharge 5
		var spelluproom 0
	}
	if "$guild" = "necromancer" then
	{
		var spelluproom 1
		var docharge 10
		#if "%Obfuscation" = "off" then gosub castbuff Obfuscation 10 35 20
		#if "%Philosopher" = "off" then gosub castbuff "Philosopher's Preservation" 10 35 20
		#if "%Calcified" = "off" then gosub castbuff "Calcified Hide" 15 25 20
		#if "%Instinct" = "off" then gosub castbuff Instinct 20 20 20
		if "%Manifest" = "off" then gosub castbuff "Manifest Force" 10 35 20
		#if "%Sense" = "off" then gosub castbuff "Sense of the Tiger" 20 20 20
		var docharge %start.docharge
		var spelluproom 0
	}
	#if $zoneid = 7 then
	#{
	#	gosub move 394
	#	gosub vipertrail enter
	#}
	#if $zoneid = 90 then gosub move 663
	if "$guild" = "Cleric" then
	{
		#gosub move %altarroom
		#gosub ritualaltar
		var spelluproom 1
		gosub pomcast
		gosub buffcheck
		var spelluproom 0
	}
return
