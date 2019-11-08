#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	#gosub routinecombat
	gosub routinepvpalerts
	gosub routinemoonbuffs
	#gosub routinesteal
	gosub astro.initialize
	
initialize: 
	action var teaching 0 when ^All of your students have left|^You stop trying to teach
	action if %keywords > 0 then math keywords subtract 1 when ^Your mind hears
	action put quit when Raikage|Khras
	action math keywords subtract 2 when ^Aayveia
	action math keywords subtract 2 when ^You say
	action put release sov when ^But that would give away your hiding
	put #log >ExpLog *********
	put #log >ExpLog $datetime
	put #var monitor ""
	var resonance
	#var ignorerooms 2

	var baseprep 1
	var teaching 0
	var teachskill app
	var maxcreature 4
	var exitnow 0
	var lowmana 50
	var saferoom 478
	var globalexp 15
	var killmob wolf
	#var killmob1 scout ogre
	var gloves gloves
	var maxmonster 3
	var camb manacle
	var docamb 1
	var docharge 25
	var start.docharge 25
	var spelluproom 1
	var loreroom 471
	var doskill_stoh 1
	if "$zoneid" = "8a" then 
	{
		var loreroom 93
		var saferoom 13
		var doskill_stoh 0
	}
	var steal.yes 0
	var startresearch 1
	var researchloop 1
	var first.research Arcana
	var second.research Warding
	var third.research Augmentation
	var 1research fundamental
	var 2research warding
	var 3research Augmentation
	put #var pvpalert yes
	var incombat 0
	
	gosub put.1 "power" "^Roundtime:"
	gosub put.1 "stance set 100 3 100 0" "^Setting"
	gosub put.1 "dodge" "^Roundtime|^But you are"
	#goto bypass
	
#goto bypass
goto $charactername

#*********        *********
#*********  Stoh  *********
#*********        *********

Stoh:
	gosub emptyhands
	
## ** Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	if %doskill_stoh = 1 then
	{
	var garbage 0
	var doresearch 1
	gosub startskill Mechanical_Lore
	gosub braid vine
	gosub endskill Mechanical_Lore
	gosub release
	var garbage 0
	var doresearch 0
	}
	
# Arcana training
	gosub castbuff "Steps of Vuan" 20 20 21
	gosub spelldelay
	gosub start.magiclearn
	gosub emptyhands
	gosub release shear
	gosub release
	
# Astronomy training
	var tool mirror
	var doresearch 1
	gosub release
	gosub startskill Astrology
	gosub astrotrain
	gosub endskill Astrology
	if $kneeling = 1 then put dance silly
	var doresearch 0

	#bypass:
#goto bypass_sch	
## ** Scholarship training - $1 first chapter, $2 last chapter
	var doresearch 0
	gosub books "weapon book" 1 9
	gosub books "armor book" 1 4
	

bypass_sch:

## ** Assess training
	var doresearch 1
	gosub castbuff "Steps of Vuan" 20 20 21
	gosub spelldelay
	gosub assess
	gosub release

	gosub castbuff "Steps of Vuan" 20 20 21
	gosub spelldelay
	
	#goto collectbypass
## ** Forage & Perception training	
	if %doskill_stoh = 1 then
	{
		var doresearch 1
		var collect rock
		gosub startcollect 9999999
		gosub release
	}
	collectbypass:
	#goto climbbypass
mechbypass:
	var doresearch 0
	math globalexp add 10
	if %globalexp > 25 then var globalexp 33
	goto Stoh

exit
include routinecommon.cmd 
#include routinecombat.cmd
#include routinesteal.cmd
include routinemoonbuffs.cmd
include astro.cmd
include routinepvpalerts.cmd