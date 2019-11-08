#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	gosub routinemoonbuffs 
	gosub astro.initialize
	
initialize: 
	put #log >ExpLog *********
	put #log >ExpLog $datetime
	#var monitor atk
	#var monitor no
	#var resonance 2
	#var ignorerooms 2

	var baseprep 1
	var lowmana 50
	var globalexp 10
	var killmob wolf
	#var killmob1 scout ogre
	var stance DEF

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
	#gosub ss learnteach

# Move to noncombats
	#gosub rfwalk
	#gosub move 289
	#put #var mapper search
	#var trainroom 284
	#gosub move %trainroom
	#put #var mapper defense

# Move to climbing location.

	#gosub aesryclimb

	goto climb.bypass	
# Climb training
# $1 right hand item, $2 left hand item, 0 for none, $3 for room exception
	gosub startskill Climbing
	var resonance climbing
	action math keywords subtract 1 when \".*\"
climb.main:	
	gosub climb fan dira adfadfds
	action goto stopclimb when eval $Climbing.LearningRate > %globalexp
	#gosub put climb face
	pause .1
	pause .1
	if $standing != 1 then put dance silly
	gosub move 220
	gosub put climb practice wall
	gosub pause 60
	waitforre ^You continue
	gosub put stop climb
	action remove eval $Climbing.LearningRate > %globalexp
	gosub move 286
	goto climb.main
stopclimb:
	action remove eval $Climbing.LearningRate > %globalexp
	gosub put stop climb
	gosub endskill Climbing
	gosub emptyhands
	var resonance none
	action remove when \".*\"

climb.bypass:		
	gosub rfwalk
	gosub move 199
	if "%Seer" = "off" then gosub seer

	put #var mapper search
	gosub move 337
	put #var mapper defense
	if $invisible = 1 then put release
bypass:		
# Arcana training
	var camb orb
	var charge_mana 16
	var tempmana 16
	var low.cap 9
	var fullprep 0
	var train.spell ease
	var combtrain 0
	#var checkharness 1
	if "%Aus" = "off" then gosub aus
	#gosub checkharness
	var charge_mana %tempmana
	gosub put stance set 100 0 100 0
	var stance DEF
	gosub startskill Arcana
	gosub arcana
	gosub endskill Arcana
	var combtrain 0

# PM Training, $1 spell name, $2 prep mana, $3 wait time
	var combtrain 0
	var checktime 0
	var combthrow 1
	var mblast 0
	#var checkharness 1
	var prepspell 16
	if "%Aus" = "off" then gosub aus
	#gosub checkharness
	#var prepspell %tempmana
	gosub startskill Primary_Magic
	gosub pmtrain sod %prepspell 8
	gosub endskill Primary_Magic
	var combtrain 0
	gosub throwcheck
	var checktime 1

	# aesry climb
	gosub toaesryclimb
	
	gosub rfwalk
	gosub move 15
	put #var mapper search
	gosub move 12
	put #var mapper defense
	
	if $invisible = 1 then put release
	
# Astronomy training
	var tool bones
	gosub put release
	gosub startskill Astrology
	gosub astrotrain
	gosub endskill Astrology
	if $kneeling = 1 then put dance silly

	## aesry climb
	gosub fromaesryclimb
	
	gosub move 235
	put #var mapper search
	gosub move 240
	put #var mapper defense
	
	
# First aid training
	gosub startskill First_Aid
	gosub put get my cloth comp
	gosub compendium 10
	gosub put get my red comp
	gosub compendium 7
	gosub endskill First_Aid
	
	gosub toaesryclimb
	
	gosub rfwalk
	gosub move 15
	put #var mapper search
	gosub move 12
	put #var mapper defense
	
# Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book
	gosub endskill Scholarship

## aesry climb
	gosub fromaesryclimb
	
	gosub move 234
	if contains("$roomplayers", "Also here") then gosub move 287
	if contains("$roomplayers", "Also here") then goto mechbyass
	if $invisible = 1 then put release

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

mechbypass:
	gosub toaesryclimb
	gosub move 15
	put #var mapper search
	gosub move 12
	put #var mapper defense
	if $invisible = 1 then put release

# Forage & Perception training	
	gosub startskill Perception
	var collect rock
	gosub collect 9999999
	gosub endskill Perception
	
	gosub fromaesryclimb

	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Stoh

exit
include routinecommon.cmd 
include routinemoonbuffs.cmd
include astro.cmd