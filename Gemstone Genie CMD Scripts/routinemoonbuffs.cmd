routinemoonbuffs:
	action var Aura on when ^The auras in your vision blur|^Your color vision blossoms
	action var Aura off when ^Your color vision returns to normal
	action var Seer on when ^You feel oddly in tune
	action var Seer off when ^You no longer feel as strong a connection to the webs of fate
	action var mblast 1 when ^You .+ Mental Blast spell\.$
	action var Refractive on when ^Strands of refractive light
	action var Refractive off when ^The refractive field surrounding you|^You reveal yourself\.$
	action var Shadows on when ^You notice the shadows about you briefly|^There is a subtle change in the
	action var Shadows off when ^You notice the shadows about you lightening
	action var Clear on when ^You feel more aware|^You briefly feel less aware
	action var Clear off when ^You feel less aware
	action var Piercing on when ^The center of your vision|^The world around you wavers
	action var Piercing off when ^The world around you returns
	action var Shear on when ^A globe of shimmering blue fire
	action var Shear off when ^The shimmering globe of blue
	action var located 1 when ^You get an odd feeling
	
	action var $1 on when ^You sense the (\w+)

	var Aura off
	var Seer off
	var Refractive off
	var Shadows off
	var Clear off
	var Piercing off
	var Shear off
	var chaos 1
	var located 0
	var backtrace 1
	
	var sorc_list Centering|Sanctify Pattern|Soul Shield|Divine Radiance|Protection from Evil|Substratum
	var DO_spell_list Centering|Sanctify Pattern|Soul Shield|Divine Radiance|Substratum

	## ** 2% - spell prep, 3% - total spell cast, 4% - wait time until spell, 5% - type of spell
	## ** These spells are using the chaos symbiosis
	
	var training_spell_list Shear|Seer's Sense|Shadow Servant|Centering|Protection from Evil|Substratum
	
	#var Warding Protection from Evil|25|25|26|Warding
	var Utility Shadow Servant|20|45|21|Utility
	var Augmentation Protection from Evil|30|30|27|Augmentation
	#var Augmentation Pro|5|5|21|Augmentation
	var Augmentation1 Shadow Servant|20|45|21|Augmentation
	##var Sorcery Substratum|5|5|21|Sorcery
	var Sorcery Protection from Evil|30|30|27|Sorcery
	##var Sorcery Centering|25|25|21|Sorcery
	##var Utility Divine Radiance|15|15|21|Utility
	##var Augmentation Seer's Sense|20|58|21|Augmentation
	##var Debilitation Viscous Solution|14|22|21|Debilitation
	
	
return

buffcheck:
	var pvpbuffs 1
	if "%Manifest" = "off" then gosub castbuff "Manifest Force" 30 101 20
	if "$preparedspell" != "None" then gosub spelldelay
	var pvpbuffs 0
return

rfwalk:
	var harnessmana $1
	if "$preparedspell" != "None" then gosub release
	if (("%Refractive" = "on") && ($invisible = 0)) then
	{
		matchre rfwalk ^You are confident
		matchwait 30
		put #log >SkillLog $time
		put #log >SkillLog RFwalk match timed out.
	}
	if $invisible = 1 then return
	if $stamina < 50 then return	
	gosub prep rf
	if (($2 < 10) && ("$2" != "")) then delay $2
		else delay 10
	gosub put.1 "harness %harnessmana" "^Roundtime"
	gosub castrequest 1 1 1 1
return

OLDAUS:
	gosub prep aus 15
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub put.1 "harness 15" "^Roundtime"
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub put.1 "harness 15" "^Roundtime"
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub put.1 "harness 15" "^Roundtime"
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
delayaus:
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	delay .5
	if $spelltime > 20 then gosub cast
		else goto delayaus
	#gosub manacheck
return

AUS:
	if "%Aura" = "off" then 
	{
		gosub castbuff "Aura Sight" 30 99 20
		gosub spelldelay
	}
return

gauge:
	gosub castbuff "Gauge Flow" 40 100 20
	gosub spelldelay
	if (("$lefthandnoun" = "orb") || ("$righthandnoun" = "orb")) then gosub stow orb
	if (("$righthandnoun" = "%camb") || ("$lefthandnoun" = "%camb") && ("%camb" != "orb")) then gosub put.1 "wear %camb" "%wear.msg"
return

seer:
	gosub prep seer 15
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub put.1 "harness 15" "^Roundtime"
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub put.1 "harness 15" "^Roundtime"
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub put.1 "harness 15" "^Roundtime"
delayseer:
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	delay .5
	if $spelltime > 15 then gosub cast
		else goto delayseer
	#gosub manacheck
return

shadows:
	gosub prep shadows 15
	gosub put.1 "harness 15" "^Roundtime"
	gosub put.1 "harness 15" "^Roundtime"
	gosub put.1 "harness 15" "^Roundtime"
delayshadows:
	delay 1
	if $spelltime > 15 then gosub cast
		else goto delayshadows
return

moontrain:
	var releasetrain 1
	gosub ppcheck
	if $spelltime > 21 then gosub castrequest
	if $Augmentation.LearningRate < 33 then
	{
		gosub castbuff "Centering" 20 20 21
		if $monstercount < 1 then gosub castbuff "Centering" 20 20 21
	}
		else
		{
			if $Utility.LearningRate < 33 then
			{
				gosub castbuff "Shadow Servant" 40 40 21
				if $monstercount < 1 then gosub castbuff "Shadow Servant" 40 40 21
			}
			else
			{
				if (($Sorcery.LearningRate < 33) && ($monstercount < 1)) then
				{
					gosub castbuff "Centering" 20 20 21
					gosub castbuff "Centering" 20 20 21
				}
				else
				{
					if $Warding.LearningRate < 33 then
					{
						gosub castbuff "Shear" 40 40 21
						if $monstercount < 1 then gosub castbuff "Shear" 40 40 21
					}
					else gosub pause 1
				}
			}
		}
	var releasetrain 0
	return