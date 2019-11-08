#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinemoonbuffs
	gosub astro.initialize
	
initialize: 
	put #log >ExpLog *********
	put #log >ExpLog $datetime
	var monitor atk
	var monitor no
	var resonance 2
	var ignorerooms 2

	var baseprep 1
	var lowmana 50
	var saferoom 107
	var globalexp 10
	var killmob wolf
	#var killmob1 scout ogre
	var stance DEF
	var gloves gloves

	gosub put.1 "power" "^Roundtime:"
	gosub put stance set 100 0 100 0
	gosub put dodge	
	#goto bypass
	
	gosub ss playtrain vocals stop

goto $charactername

#*********        *********
#*********  Stoh  *********
#*********        *********

Stoh:

# Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book
	gosub endskill Scholarship

# Mech training - $1 braid mat, $2 g = garbage, $3 garbage name
	gosub startskill Mechanical_Lore
	var astrobraid 1
	var tool bones
	#gosub m.inputraid grass dgd bin
	gosub astrotrain
	var astrobraid 0
	var origami silverfish
	#gosub origami 1000000
	gosub endskill Mechanical_Lore

# Forage & Perception training	
	gosub startskill Perception
	var collect rock
	gosub collect 9999999
	gosub endskill Perception
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Stoh

exit
include routinecommon.cmd 
include routinemoonbuffs.cmd
include astro.cmd