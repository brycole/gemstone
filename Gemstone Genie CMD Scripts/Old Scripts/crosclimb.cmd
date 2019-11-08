include base.cmd

put #script abort afkk

CRO.CLIMB:
if $Climbing.LearningRate >= 20 then goto QUIT
counter add 1

CLIMB:
startclimb:
#This Script created by the player of Kraelyst
#Climb Crossing Walls
#debuglevel 5
ECHO
ECHO *** STARTING CLIMBING SESSION #%c ***
ECHO
pause 2

put set roomname

CLIMBGO:
	move NORTHWEST
	move NORTH
	move NORTH
	move NORTH
	move NORTH
	move NORTH
	move NORTH
	move EAST
	move EAST
	move NORTH
	move EAST
	move EAST
	move NORTH
	move NORTH
	move EAST
	move go stair
	move SOUTH

CLIMB-001:
	if ($stamina < 70) then gosub FATIGUE_WAIT
		matchre CLIMB-001 /\.\.\.wait|type ahead/i
		match PASS-001 [Outside East Wall, Footpath]
		matchre FAIL-001 This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb break
	matchwait

PASS-001:
pause
move NORTH
move go gate
move WEST
move go stair
move SOUTH
goto CLIMB-002

FAIL-001:
pause
goto CLIMB-002

CLIMB-002:
	if ($stamina < 70) then gosub FATIGUE_WAIT
		matchre CLIMB-002 /\.\.\.wait|type ahead/i
		match PASS-002 [Northeast Wilds, Outside Northeast Gate]
		matchre FAIL-002 This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

FAIL-002:
	pause
	move n
	move go stair
	move e
	move go gate
PASS-002:
	move go footpath
	goto CLIMB-01

CLIMB-01:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-01
		matchre CLIMB-01 /\.\.\.wait|type ahead/i
		match PASS-01 [Crossing,
		matchre FAIL-01 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-01:
	pause
	move n
	move go stair
	move e
	move go gate
	move go footpath
	goto FAIL-01

FAIL-01:
	pause 0.5
	move s
	move down
	move s
	move s
	move sw
	goto CLIMB-02

CLIMB-02:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-02
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-02 /\.\.\.wait|type ahead/i
		match PASS-02 [Crossing,
		matchre FAIL-02 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-02:
	pause
	move s
	move go stair
	move go gate
	move go bush
	move n
	goto CLIMB-03

FAIL-02:
	pause
	move s
	goto CLIMB-03

CLIMB-03:
	pause 0.5
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-03
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-03 /\.\.\.wait|type ahead/i
		match PASS-03 [Crossing,
		matchre FAIL-03 You continue|This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-03:
	pause 0.5
	move s
	move go stair
	move go gate
	goto CLIMB-04

FAIL-03:
	pause 0.5
	move s
	goto CLIMB-04

CLIMB-04:
	pause .5
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-04
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-04 /\.\.\.wait|type ahead/i
		match PASS-04 [Crossing, East Gate Battlements]
		match PASS-041 [Crossing, East Wall Battlements]
		matchre FAIL-04 You finish|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-041:
	pause
	move s
	goto CLIMB-05

PASS-04:
	pause
	goto CLIMB-05

FAIL-04:
	pause 0.5
	move go gate
	move go stair
	goto CLIMB-05

CLIMB-05:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-05
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-05 /\.\.\.wait|type ahead/i
		match PASS-05 [Eastern Tier, Outside Gate]
		matchre FAIL-05 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-05:
	pause 0.5
	move go gate
	move go stair
FAIL-05:
	pause 0.5
	move n
	goto CLIMB-06

CLIMB-06:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-06
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-06 /\.\.\.wait|type ahead/i
		match PASS-06 [Outside East Wall, Footpath]
		matchre FAIL-06 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb break
	matchwait

PASS-06:
	pause 0.5
	move s
	move go gate
	move go stair
	move n
	goto CLIMB-07

FAIL-06:
	pause
	goto CLIMB-07

CLIMB-07:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-07
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-07 /\.\.\.wait|type ahead/i
		match PASS-07 [Outside East Wall, Footpath]
		matchre FAIL-07 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-07:
	pause 0.5
	move s
	move s
	move go gate
	goto TRAVEL-08

FAIL-07:
	pause 0.5
	move s
	move go stair
	goto TRAVEL-08

TRAVEL-08:
	pause 0.5
	move w
	move w
	move w
	move w
	move nw
	move n
	move n
	move n
	move n
	move n
	move n
	move w
	move w
	move w
	move w
	move go bridge
	move w
	move w
	move w
	move w
	move go stair
	move s

CLIMB-08:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-08
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-08 /\.\.\.wait|type ahead/i
		match PASS-08 [Mycthengelde, Flatlands]
		matchre FAIL-08 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-08:
	pause
	goto CLIMB-09

FAIL-08:
	pause
	move n
	move go stair
	move go gate
	move nw
	goto CLIMB-09

CLIMB-09:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-09
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-09 /\.\.\.wait|type ahead/i
		match PASS-09 [Crossing, West Wall Battlements]
		matchre FAIL-09 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-09:
	pause
	move n
	goto CLIMB-10

FAIL-09:
	pause
	move se
	move go gate
	move go stair
	goto CLIMB-10

CLIMB-10:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-10
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-10 /\.\.\.wait|type ahead/i
		match PASS-10 [Mycthengelde, Flatlands]
		matchre FAIL-10 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-10:
	pause
	move go gate
	move go stair
	FAIL-10:
	move e
	goto CLIMB-11

CLIMB-11:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-11
		matchre RETREAT You are engraged|You cannot	
		matchre CLIMB-11 /\.\.\.wait|type ahead/i
		match PASS-11 [Northwall Trail, Wooded Grove]
		matchre FAIL-11 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb break
	matchwait

PASS-11:
	pause
	move s
	move go gate
	move go stair
	move e
	goto CLIMB-12

FAIL-11:
	pause
	goto CLIMB-12

CLIMB-12:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-12
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-12 /\.\.\.wait|type ahead/i
		match PASS-12 [Northwall Trail, Wooded Grove]
		matchre FAIL-12 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb embrasure
	matchwait

PASS-12:
	pause
	goto CLIMB-13

FAIL-12:
	pause
	move w
	move go stair
	move go gate
	move go trail
	move ne
	goto CLIMB-13

CLIMB-13:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-13
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-13 /\.\.\.wait|type ahead/i
		match PASS-13 [Crossing, North Wall Battlements]
		matchre FAIL-13 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-13:
	pause
	move w
	move go stair
	move go gate
	move go trail
	goto CLIMB-14

FAIL-13:
	pause
	move sw
	goto CLIMB-14

CLIMB-14:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-14
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-14 /\.\.\.wait|type ahead/i
		match PASS-14 [Crossing, North Wall Battlements]
		matchre FAIL-14 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-14:
	pause
	move w
	move go stair
	move go gate
	goto CLIMB-15

FAIL-14:
	pause
	move s
	goto CLIMB-15

CLIMB-15:
	if ($stamina < 70) then gosub FATIGUE_WAIT
	SAVE FAIL-15
		matchre RETREAT You are engraged|You cannot
		matchre CLIMB-15 /\.\.\.wait|type ahead/i
		match PASS-15 [Crossing, West Gate Battlements]
		matchre FAIL-15 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
		match FALLEN slip after a few feet
	put climb wall
	matchwait

PASS-15:
	move go stair
	goto TRAVEL-15

FAIL-15:
	move go gate
	goto TRAVEL-15

TRAVEL-15:
pause 0.5
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
if $invisible != 1 then
{
	gosub m.input release
	gosub m.input rf
}
move s
move s
move s
move s
move se
goto CRO.CLIMB


FATIGUE_WAIT:
echo
echo *** PAUSING TO RESTORE FATIGUE... ***
echo
	if ($stamina = 100) then return
	pause 5
	goto FATIGUE_WAIT
	
#======================


FALLEN:
	pause
		matchre STOOD You stand|You are already standing
		matchre FALLEN cannot manage to stand|The weight of all your possessions
		matchre FALLEN ^\.\.\.wait|^Sorry, you may only type
	put stand
	matchwait

STOOD:
	goto %s

QUIT:
	pause 1
	put #parse DONE CLIMBING
	put #parse CLIMBING LOCKED
	put glance
	send .afkk
	put #parse crosclimb.cmd done.
        exit

RETREAT:
put ret
put ret
pause
goto %S

RETURN:
pause 0.1
RETURN