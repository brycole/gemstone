routinemagebuffs:
	action var Ease off when ^You feel a weight settle over you
	action var Ease on when ^Pale yellow sparks begin to flicker
	action var Manifest on when ^The air around you .+\.  The scintillating light writhes
	action var Manifest off when silent cascade of glassy fragments that vanish before reaching the ground\.$|^The air around you shimmers with .+ that quickly
	action var Zephyr on; put #event 170 {#parse With a final, swirling whisper,} when ^A (faint|gentle|delicate) (pleasant|warm) breeze begins
	action var Zephyr off when ^With a final, swirling whisper,
	action var Sure on when ^You feel steadier
	action var Sure off when ^You feel less steady
	action var Swirling on when ^You harness the currents of air
	action var swirling off when ^You feel the winds surrounding
	action var Fissure on when ^The spherical ellipse of vivid blue|^The fissure's spell matrix looks too unstable
	action var Fissure off when ^The aqueous fissure collapses
	action var Aether on when ^Everything seems to darken, and you feel
	action var Aether off when ^The dark mantle of aether
	action var Substratum on when ^Focusing on the aethereal plane
	action var Substratum off when ^The grid of thin lines slides away
	action var Aegis on when ^You draw forth a pulse of dusky green Earth
	action var Aegis off when ^The Earth energy flows from your body
	action var Y'ntrel on when ^A stiff breeze surrounds you,
	action var Y'ntrel off when ^You hear a low whistling
	
	## ** Sorcery
	action var Minor on when ^You are bathed in a soft
	action var Minor off when ^The soft silver glow fades
	action var Shield on when ^A fiery blaze covers
	action var Shield off when ^Your latent shield
	action var $1 on when ^You sense the (\S+)
	
	action math keywords subtract 1 when ^You whisper the final word of your spell
	
	var Ease off
	var Manifest off
	var Zephyr off
	var Sure off
	var Swirling off
	var Fissure off
	var Minor off
	var Aether off
	var Substratum off
	var Shield off
	var Aegis off
	var Y'ntrel off
	
	var spell_factor 4.5
	var util_factor 5
	var sorc_factor 5.8
	
	#var Warding Manifest Force|5|%warding_mana|20|Warding
	#var Augmentation Sure Footing|5|%augmentation_mana|20|Augmentation
	#var Utility Air Bubble|1|%utility_mana|20|Utility
	#var Debilitation Ice Patch|5|5|9|Debilitation
	var Warding Manifest Force|20|35|21|Warding
	var Augmentation Sure Footing|20|35|21|Augmentation
	var Utility Air Bubble|20|35|21|Utility
	var Debilitation Frostbite|16|16|10|Debilitation
	var Sorcery Minor Physical Protection|10|15|21|Sorcery
	
	var targetspells
	var sorc_list Minor Physical Protection|Shield of Light
	
	#gosub spellfactor_check
	
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
	#var docharge 10
	#if $spelltime > 21 then gosub castrequest
	#if "%Instinct" = "off" then gosub castbuff Instinct 1 5 20
	#if "%Manifest" = "off" then gosub castbuff "Manifest Force" 15 15 5
	#if "%Substratum" = "off" then gosub castbuff "Substratum" 15 55 21
	#if "%Fissure" = "off" then gosub castbuff "Ethereal Fissure" 15 30 21
	#if "%Minor" = "off" then gosub castbuff "Minor Physical Protection" 10 15 21
	#if "%Sure" = "off" then gosub castbuff "Sure Footing" 15 35 21
	#if "%Swirling" = "off" then gosub castbuff "Swirling Winds" 15 35 21
	#if "%Aegis" = "off" then gosub aegis
	#if "%Y'ntrel" = "off" then gosub castbuff "Y'ntrel Sechra" 15 45 21
	#if "%Shield" = "off" then gosub castbuff "Shield of Light" 16 16 21
	#if %Ease = off then gosub castbuff Ease 10 20
	#var docharge 5
return

magetrain:
return
	gosub pause 1
	if $spelltime > 21 then gosub castrequest
	if $Augmentation.LearningRate < 33 then
	{
		gosub castbuff "Y'ntrel Sechra" 25 25 20
		if $monstercount < 1 then gosub castbuff "Y'ntrel Sechra" 25 25 20
	}
		else
		{
			if $Utility.LearningRate < 33 then
			{
				gosub castbuff "Magnetic Ballista" 25 25 20
				if $monstercount < 1 then gosub castbuff "Magnetic Ballista" 25 25 20
			}
			else
			{
				if $Sorcery.LearningRate < 33 then
				{
					gosub castbuff "Minor Physical Protection" 10 15 21
					if $monstercount < 1 then gosub castbuff "Minor Physical Protection" 10 15 21
				}
			}
		}
	return
	
fissurecheck:
return
	if (("%Fissure" = "off") && ("$preparedspell" != "Ethereal Fissure")) then 
	{
		if $spelltime > 20 then gosub castrequest
			else gosub release
		gosub castbuff "Ethereal Fissure" 15 30 21
		gosub spelldelay
	}
	return
	
aethercheck:
	if "%Aether" = "off" then
	{
		gosub castbuff "Aether Cloak" 6 6 7
		gosub spelldelay
		var invoke 0
		gosub put.1 "invoke %cambarray(%arrayloc) cyclic" "^Roundtime"
	}
	return
	
fillcamb:
	var cambarray king arm|camb arm|wrist|thigh bag
	var arrayloc 0
	
	gosub chargecamb wristband 32
	gosub chargecamb "king arm" 32
	gosub chargecamb "camb arm" 32
	gosub chargecamb bag 25
return
	
aegis:
	if $roomid != 331 then 
	{
		var oldroom $roomid
		gosub throwcheck
		gosub move 331
	}
	gosub put.1 "summon admittance" "^Roundtime|^You so"
	action var invokestaff 1 when ^You direct
	var spellup no
	if %spelluproom = 1 then var spellup yes
	var spelluproom 0
	
	if $spelltime > 5 then gosub spelldelay
	gosub emptyhands
	gosub put.1 "remove staff" "^You sling"
	if "$preparedspell" != "None" then gosub release
invokeloop:
	var invokestaff 0
	if "$preparedspell" != "Aegis of Granite" then gosub castbuff "Aegis of Granite" 290 290 33
	gosub put.1 "invoke staff" "^Roundtime"
	if %invokestaff = 0 then goto invokeloop
	if "$preparedspell" != "Aegis of Granite" then goto invokeloop
	gosub put.1 "path focus power" "^You focus|^You lack|^You are"
	gosub spelldelay
	gosub put.1 "wear staff" "^You sling"
	gosub put.1 "path stop" "^You gently"
conloop:
	gosub startcollect 1
	if $concentration < 85 then goto conloop
	
	action remove ^You direct
	if "%spellup" = "yes" then var spelluproom 1
		else gosub returncombat
	return
	
quick.frostbite:
	evalmath frosttemp ($gametime - $last.frost)
	if %frosttemp < 30 then return
	if $spelltime > 5 then gosub spelldelay
	put #var last.frost $gametime
	if ("$preparedspell" != "None") then gosub release
	gosub prep frostbite
	gosub pause 5
	gosub cast
return

summon.start:
	gosub startskill Summoning
	
	action (summon) var summon impedance when ^You so heavily embody|^Finishing your meditation, you feel that you have reached your limit\.$
	action (summon) var summon admittance when ^Try though you might|^You lack the
	
	action (summon) on
	var summon admittance

summon.loop:
	if $Summoning.LearningRate > 33 then goto summon.exit
	if "$guild" = "mage" then
	{
		gosub fissurecheck
		gosub magetrain
	}
	if "%summon" = "impedance" then goto summonweapon
	gosub put.1 "summon admittance" "^Roundtime|^You so"
	goto summon.loop

pathfocus:
	gosub put.1 "path focus power" "^You focus|^You lack"
	if "%summon" = "admittance" then goto summon.loop
	gosub put.1 "path stop" "^You gently"
	goto summon.loop

summonweapon:
	gosub put.1 "summon weapon" "^Roundtime|^You lack"
	gosub put.1 "drop scim" "^You drop"
	waitevail

summon.exit:
	action (summon) off
	
	gosub endskill Summoning
return