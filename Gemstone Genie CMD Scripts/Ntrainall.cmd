debuglevel 10	
	
	gosub routinecommon
	gosub routinemoonbuffs 

initialize: 
var monitor atk
var monitor no
var resonance 2
var ignorerooms 2

var baseprep 1
var lowmana 50
goto bypass

	gosub put dodge
	gosub ss playtrain vocals stop

goto $charactername

#*********        *********
#*********  Stoh  *********
#*********        *********

Stoh:
#goto bypass
# non combats
gosub ss learnteach
#gosub ss magic

# PM Training, $1 spell name, $2 prep mana, $3 wait time
gosub pmtrain sod 12 7

#gosub ss observe1

# First aid training
	gosub put get my cloth comp
	gosub compendium 10
	gosub put stow my comp
	gosub put get my red comp
	gosub compendium 7
	gosub put stow my comp

# Scholarship training
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book

# Mech training
	gosub m.inputraid grass g bin

bypass:	
# Forage & Perception training	
	var collect rock
	gosub collect 9999999

## move to climbing
put #script abort gmcheck

gosub rfwalk
gosub move 348


# Climb training
	action goto stopclimb when eval $Climbing.LearningRate = 34

	gosub put climb practice wall
	gosub pause 900
stopclimb:
	action remove eval $Climbing.LearningRate = 34
	
	gosub put stop climb

gosub rfwalk
gosub move 53
gosub move 277	

goto Stoh

exit
include routinecommon.cmd 
include routinemoonbuffs.cmd