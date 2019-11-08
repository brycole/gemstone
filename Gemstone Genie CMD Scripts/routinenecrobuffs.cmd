routinenecrobuffs:
	action var Ease off when ^You feel a weight settle over you
	action var Ease on when ^Pale yellow sparks begin to flicker
	action var Manifest on when ^The air around you .+\.  The scintillating light writhes
	action var Manifest off when silent cascade of glassy fragments that vanish before reaching the ground\.$|^The air around you shimmers with .+ that quickly
	
	action var Obfuscation on when ^You project around yourself a field that suggests
	action var Obfuscation off when ^You sense the obfuscating field around you vanish.
	
	action var Eyes on when ^Your spell subtly alters|^You feel an unsteady|^Your spell injects more
	action var Eyes off when ^Your corruption fades
	
	action var Philosopher on when ^Swirls of reddish-black energy erupt|^Whorls of reddish-black
	action var Philosopher off when ^An unpleasant sensation jolts through
	
	action var Petrifying on when ^Your malefic assault
	action var Petrifying off when ^The .+ no longer seems petrified
	
	action var Calcified on when ^You shudder involuntarily as streams
	action var Calcified off when ^Your body rumbles, sending several short
	
	action var Instinct on when ^Your muscles twitch with nervous energy|^You feel momentarily befuddled
	action var Instinct off when ^You feel safer and more calm
	
	action var Butcher on when ^You feel slight discomfort and an odd tingling sensation|^Your eye twitches and trembles as your mutative magic 
	action var Butcher off when ^There's an odd jolting sensation
	
	action var Ivory on when ^Color leeches from the skin|^Your face itches briefly as the skin shifts
	action var Ivory off when ^A brief urge to sick up
	
	action var Heighten on when ^Your wracking curse surrounds
	action var Heighten off when ^You search
	
	action var Quicken on when ^Disregarding the pain, you grind the dirt brutally into
	action var Quicken off when ^You sense your Quicken the Earth spell
	
	action var Kura on when ^Your eye feels swollen|^An infinitesimal eddy of mutation
	action var Kura off when ^Your lesser, Elothean sight
	
	action var Rite on when ^You weave a field of sublime
	action var Rite off when ^The Rite of Contrition matrix loses
	
	##** Sorcery messages
	action var Sense on when ^Your senses sharpen
	action var Sense off when ^Your sharpened senses
	
	action var $1 on when ^You sense the (\w+)
	
	action math keywords subtract 1 when ^You whisper the final word of your spell
	
	action (life_sorc) on
	action (ele_sorc) on
	
	var spell_factor 4.5
	var util_factor 5.5
	var sorc_factor 5.8
	
	gosub spellfactor_check
	
	var Warding Manifest Force|15|30|21|Warding
	#var Augmentation Ease Burden|10|40|20|Augmentation
	var Augmentation Obfuscation|15|35|21|Augmentation
	#var Augmentation Instinct|10|22|20|Augmentation
	#var Utility Rite of Contrition|5|5|Utility
	var Utility Gauge Flow|15|40|21|Utility
	#var Utility Eyes of the Blind|15|39|20|Utility
	#var Debilitation Viscous Solution|14|14|10|Debilitation
	var Sorcery Vigor|12|12|21|Sorcery
	#var Sorcery Zephyr|9|10|13|Sorcery
	
	var sorc_list Zephyr|Vigor
	var targetspells Energy Bolt|Acid Splash|Siphon Vitality
	var DO_spell_list Ivory Mask|Butcher's Eye|Calcified Hide|Philosopher's Preservation|Instinct|Sense of the Tiger|Kura-Silma
	var notDO_spell_list Acid Splash|Siphon Vitality|Obfuscation
	var necromancer_spell_list %DO_spell_list|%notDO_spell_list

necrospelloff:

	var Ease off
	var Eyes off
	var Obfuscation off
	var Philosopher off
	var Calcified off
	var Instinct off
	var Manifest off
	var Butcher off
	var Ivory off
	var Heighten off
	var Quicken off
	var Kura off
	var Rite off
	var Sense off
	var Petrifying off
	gosub magicspelloff
	
return

spellfactor_check:
	var wardtemp $Warding.Ranks
	var augtemp $Augmentation.Ranks
	var utiltemp $Utility.Ranks
	var sorctemp $Sorcery.Ranks
	
	evalmath wardtemp (%wardtemp / %util_factor)
	evalmath wardtemp floor(%wardtemp)
	var warding_mana %wardtemp
	
	evalmath augtemp (%augtemp / %spell_factor)
	evalmath augtemp floor(%augtemp)
	var augmentation_mana %augtemp
		
	evalmath utiltemp (%utiltemp / %spell_factor)
	evalmath utiltemp floor(%utiltemp)
	var utility_mana %utiltemp
	
	evalmath sorctemp (%sorctemp / %sorc_factor)
	evalmath sorctemp floor(%sorctemp)
	var sorcery_mana %sorctemp

return

buffcheck:
	#return
	var docharge 10
	#if "$roomplayers" != "" then return
	#if "%Obfuscation" = "off" then gosub castbuff Obfuscation 10 35 20
	#if "%Philosopher" = "off" then gosub castbuff "Philosopher's Preservation" 10 35 20
	#if "%Calcified" = "off" then gosub castbuff "Calcified Hide" 15 25 20
	#if "%Instinct" = "off" then gosub castbuff Instinct 20 20 20
	#if "%Sense" = "off" then gosub castbuff "Sense of the Tiger" 20 20 20
	if "%Manifest" = "off" then gosub castbuff "Manifest Force" 10 20 20
	#if "%Vigor" = "off" then gosub castbuff Vigor 10 10 20
	#if %Ease = off then gosub castbuff Ease 10 20
	var docharge %start.docharge
return

eotb:
	if "$guild" != "Necromancer" then return
	if $invisible = 1 then return
	if %noinvis = 1 then return
	if "$1" != "" then var temp1 $1
	if (("%Eyes" = "on") && ($invisible = 0)) then 
	{
		matchre eotb ^Your spell subtly|^Your corruptive mutation fades
		matchwait 30
		put #log >SkillLog $time
		put #log >SkillLog EOTB match timed out.
	}
	if $invisible = 1 then return
	if $stamina < 50 then return
	if "$preparedspell" != "None" then gosub release
	if "%temp1" = "snap" then gosub castbuff eotb 8 8 2
		else gosub castbuff eotb 15 30 21
	gosub spelldelay
return

qe:
	gosub emptyhands
	if "$preparedspell" != "None" then gosub release
	gosub castbuff "Quicken the Earth" 10 25 20
	gosub put.1 "perform cut" "^Roundtime"
	if $monstercount > 0 then gosub retreat.missile
	gosub put.1 "forage dirt" "^Roundtime"
	if (("$righthandnoun" != "dirt") && ("$lefthandnoun" != "dirt")) then gosub get dirt
	var returnforage $roomid
	if (("$righthandnoun" != "dirt") && ("$lefthandnoun" != "dirt")) then gosub foragedirt
	gosub spelldelay
return

gauge:
	gosub castbuff "Gauge Flow" 15 40 20
	gosub spelldelay
return

foragedirt:
	var getdirt 1
	gosub move 20
	gosub put.1 "forage dirt" "^Roundtime"
	gosub stow dirt
	gosub put.1 "forage dirt" "^Roundtime"
	gosub stow dirt
	gosub put.1 "forage dirt" "^Roundtime"
	gosub stow dirt
	gosub move %returnforage
	var getdirt 0
	gosub get dirt
	return

necrotrain:
	gosub pause 1
	if $spelltime > 21 then gosub castrequest
	if $Augmentation.LearningRate < %globalexp then
	{
		gosub castbuff "Vigor" 12 12 20
		if $monstercount < 1 then gosub castbuff "Vigor" 12 12 20
	}
		else
		{
			if $Warding.LearningRate < %globalexp then
			{
				gosub castbuff "Manifest Force" 10 30 20
				if $monstercount < 1 then gosub castbuff "Manifest Force" 20 20 20
			}
			else
			{
				if $Sorcery.LearningRate < %globalexp then
				{
					gosub castbuff "Vigor" 12 12 20
					if $monstercount < 1 then gosub castbuff "Vigor" 12 12 20
				}
			}
		}
return

fillcamb:
	var cambarray medallion|orb|camb arm
	var arrayloc 0
	
	gosub chargecamb medallion 48
	gosub chargecamb "orb" 50
	gosub chargecamb "camb arm" 32
return

roccheck:
	if "%Rite" = "off" then
	{
		if "%Rite" = "off" then gosub castbuff "Rite of Contrition" 8 8 20
		gosub spelldelay
		#var invoke 0
		#gosub put.1 "invoke %cambarray(%arrayloc) cyclic" "^Roundtime"
	}
	return
	
ritual:
	var temp1 $0
	if ((($Thanatology.LearningRate > 33) || if ($Skinning.LearningRate < 33)) && ("$roomplayers" = "")) then gosub put.1 "perform preserve on $0" "%ritual.msg"
	if ("%dokill" = "skinning") then
	{
		var doarise 0
		var doritual $Thanatology.LearningRate
		math doritual add 5
		if %doritual > 33 then var doritual 33
		if ($Skinning.LearningRate > %doritual) then var doarise 1
		if $Thanatology.LearningRate > 33 then var doarise 0
	}
	if ("%dokill" = "arise") then
	{
		var doarise 1
		var doskin $Skinning.LearningRate
		math doskin add 5
		if %doskin > 33 then var doskin 33
		if %doskin < $Thanatology.LearningRate then var doarise 0
	}
	if ((%doarise = 1) && ($Thanatology.LearningRate < 34)) then
	{	
		var arise 1
		var dokill arise
		if "$roomplayers" = "" then 
		{
			gosub arrange
			if "$lefthand" != "Empty" then gosub stow left
			gosub put.1 "perform arise on %temp1" "%ritual.msg"
			if (("$righthandnoun" = "material") || ("$lefthandnoun" = "material")) then gosub put.1 "drop material" "%drop.msg"
		}
	} 
return
