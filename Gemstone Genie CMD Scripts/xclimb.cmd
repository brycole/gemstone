#debuglevel 10

gosub routinecommon 

initialize: 
var monitor atk
var resonance roomrecovery
var monitor no

#ECHO
#ECHO *** START IN CROSSING WHERE DIR IS ACCESSIBLE ***
#ECHO

put .to barbarian
waitfor [Barbarian Guild, Main Hall]
move out
move n
move e
move n
move n
move e
move e
move go stair
move s


CRO.CLIMB:
if $Climbing.LearningRate > 33 then goto QUIT
counter set 0

CLIMB.EXP:
        if $Climbing.LearningRate > 33 then goto QUIT
        else
        goto CLIMB

CLIMB:
startclimb:

#This Script created by the player of Kraelyst
#Climb Crossing Walls

counter add 1
ECHO
ECHO *** STARTING CLIMBING SESSION %c ***
ECHO

CLIMB-001:
SAVE FAIL-001
        if ($stamina < 70) then gosub FATIGUE_WAIT
                matchre CLIMB-001 /\.\.\.wait|type ahead/i
                match PASS-001 [Outside East Wall, Footpath]
                matchre FAIL-001 This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb break
        matchwait

PASS-001:
gosub walk n
gosub walk go gate
gosub walk w
gosub walk go stair
gosub walk s
goto CLIMB-002

FAIL-001:
pause 0.5
goto CLIMB-002

CLIMB-002:
SAVE FAIL-002
        if ($stamina < 70) then gosub FATIGUE_WAIT
                matchre CLIMB-002 /\.\.\.wait|type ahead/i
                match PASS-002 [Northeast Wilds, Outside Northeast Gate]
                matchre FAIL-002 This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb embrasure
        matchwait

FAIL-002:
        pause 0.1
        gosub walk n
        gosub walk go stair
        gosub walk e
        gosub walk go gate
PASS-002:
        gosub walk go footpath
        goto CLIMB-01

CLIMB-01:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 60) then gosub FATIGUE_WAIT
        SAVE FAIL-01
                matchre CLIMB-01 /\.\.\.wait|type ahead/i
                match PASS-01 [Crossing,
                matchre FAIL-01 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put app wall quick
        pause
        pause
        put climb wall
        matchwait

PASS-01:
        gosub walk n
        gosub walk go stair
        gosub walk e
        gosub walk go gate
        gosub walk go footpath
        goto FAIL-01

FAIL-01:
        gosub walk s
        gosub walk down
        gosub walk s
        gosub walk s
        gosub walk sw
        goto CLIMB-02

CLIMB-02:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 60) then gosub FATIGUE_WAIT
        SAVE FAIL-02
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-02 /\.\.\.wait|type ahead/i
                match PASS-02 [Crossing,
                matchre FAIL-02 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb wall
        matchwait

PASS-02:
        gosub walk s
        gosub walk go stair
        gosub walk go gate
        gosub walk go bush
        gosub walk n
        goto CLIMB-03

FAIL-02:
        gosub walk s
        goto CLIMB-03

CLIMB-03:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 60) then gosub FATIGUE_WAIT
        SAVE FAIL-03
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-03 /\.\.\.wait|type ahead/i
                match PASS-041 [Crossing, East Wall Battlements]
                match PASS-03 [Crossing,
                matchre FAIL-03 You continue|This climb is|You finish practicing|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet      
        put climb wall
        matchwait

PASS-03:
        gosub stand
        gosub walk s
        gosub walk go stair
        gosub walk go gate
        goto CLIMB-04

FAIL-03:
        gosub walk s
        goto CLIMB-04

CLIMB-04:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 60) then gosub FATIGUE_WAIT
        SAVE FAIL-04
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-04 /\.\.\.wait|type ahead/i
                matchre FAIL-04 You finish|You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                matchre PASS-041 [Crossing, East Gate Battlements]
                matchre PASS-04 [Crossing, East Gate Battlements]
                match FALLEN slip after a few feet
        put climb wall
        matchwait

PASS-041:
        gosub walk s
        goto CLIMB-05

PASS-04:
        goto CLIMB-05

FAIL-04:
        gosub walk s
        gosub walk go gate
        gosub walk go stair
        goto CLIMB-05

CLIMB-05:
if $Climbing.LearningRate > 33 then goto endearly
if ($stamina < 50) then gosub FATIGUE_WAIT
SAVE FAIL-05
match PASS-05 [Eastern Tier, Outside Gate]
match PASS-052 [Outside East Wall, Footpath]
matchre FAIL-05 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
match FALLEN slip after a few feet
put climb embrasure
matchwait

PASS-052:
gosub walk s
gosub walk s

PASS-05:
gosub walk go gate
gosub walk go stair
FAIL-05:
gosub walk n
goto CLIMB-06

CLIMB-06:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-06
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-06 /\.\.\.wait|type ahead/i
                match PASS-06 [Outside Eastern Wall, Footpath]
                matchre FAIL-06 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb break
        matchwait

PASS-06:
        gosub walk s
        gosub walk go gate
        gosub walk go stair
        gosub walk n
        goto CLIMB-07

FAIL-06:
        goto CLIMB-07

CLIMB-07:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-07
                matchre RETREAT You are engraged|You cannot
                matchre CLIMB-07 /\.\.\.wait|type ahead/i
                match PASS-07 [Outside Eastern Wall, Footpath]
                matchre FAIL-07 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put app emb quick
        pause
        pause
        put climb embrasure
        matchwait

PASS-07:
        gosub walk s
        gosub walk s
        gosub walk go gate
        goto TRAVEL-08

FAIL-07:
        gosub walk s
        gosub walk go stair
        goto TRAVEL-08

TRAVEL-08:
        put hum %hum
        wait
        gosub walk w
        gosub walk w
        gosub walk w
        gosub walk w

        gosub walk nw
        gosub walk n
        gosub walk n
        gosub walk n
        gosub walk n
        gosub walk n
        gosub walk n
        gosub walk w
        gosub walk w
        gosub walk w
        gosub walk w
        gosub walk go bridge
        gosub walk w
        gosub walk w
        gosub walk w
        gosub walk w
        gosub walk go stair
        gosub walk s

CLIMB-08:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-08
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-08 /\.\.\.wait|type ahead/i
                match PASS-08 [Mycthengelde, Flatlands]
                matchre FAIL-08 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb embrasure
        matchwait

PASS-08:
        goto CLIMB-09

FAIL-08:
        gosub walk n
        gosub walk go stair
        gosub walk go gate
        gosub walk nw
        goto CLIMB-09

CLIMB-09:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-09
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-09 /\.\.\.wait|type ahead/i
                match PASS-09 [Crossing, West Wall Battlements]
                matchre FAIL-09 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb wall
        matchwait

PASS-09:
        gosub walk n
        goto CLIMB-10

FAIL-09:
        gosub walk se
        gosub walk go gate
        gosub walk go stair
        goto CLIMB-10

CLIMB-10:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-10
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-10 /\.\.\.wait|type ahead/i
                match PASS-10 [Mycthengelde, Flatlands]
                matchre FAIL-10 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb embrasure
        matchwait

PASS-10:
        gosub walk go gate
        gosub walk go stair
        FAIL-10:
        gosub walk e
        goto CLIMB-11

CLIMB-11:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-11
                matchre RETREAT You are engaged|You cannot      
                matchre CLIMB-11 /\.\.\.wait|type ahead/i
                match PASS-11 [nwall Trail, Wooded Grove]
                matchre FAIL-11 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb break
        matchwait

PASS-11:
        gosub walk s
        gosub walk go gate
        gosub walk go stair
        gosub walk e
        goto CLIMB-12

FAIL-11:
        pause
        goto CLIMB-12

CLIMB-12:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-12
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-12 /\.\.\.wait|type ahead/i
                match PASS-12 [nwall Trail, Wooded Grove]
                matchre FAIL-12 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet      
        put climb embrasure
        matchwait

PASS-12:
        goto CLIMB-13

FAIL-12:
        gosub walk w
        gosub walk go stair
        gosub walk go gate
        gosub walk go trail
        gosub walk ne
        goto CLIMB-13

CLIMB-13:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-13
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-13 /\.\.\.wait|type ahead/i
                match PASS-13 [Crossing, n Wall Battlements]
                matchre FAIL-13 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb wall
        matchwait

PASS-13:
        gosub walk w
        gosub walk go stair
        gosub walk go gate
        gosub walk go trail
        goto CLIMB-14

FAIL-13:
        gosub walk sw
        goto CLIMB-14

CLIMB-14:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-14
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-14 /\.\.\.wait|type ahead/i
                match PASS-14 [Crossing, n Wall Battlements]
                matchre FAIL-14 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb wall
        matchwait

PASS-14:
        gosub walk w
        gosub walk go stair
        gosub walk go gate
        goto CLIMB-15

FAIL-14:
        gosub walk s
        goto CLIMB-15

CLIMB-15:
if $Climbing.LearningRate > 33 then goto endearly
        if ($stamina < 50) then gosub FATIGUE_WAIT
        SAVE FAIL-15
                matchre RETREAT You are engaged|You cannot
                matchre CLIMB-15 /\.\.\.wait|type ahead/i
                match PASS-15 [Crossing, w Gate Battlements]
                matchre FAIL-15 You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
                match FALLEN slip after a few feet
        put climb wall
        matchwait

PASS-15:
        gosub walk go stair
        goto TRAVEL-15

FAIL-15:
        gosub walk go gate
        goto TRAVEL-15

TRAVEL-15:
pause 0.5
gosub walk e
gosub walk e
gosub walk e
gosub walk e
gosub walk e
gosub walk e
gosub walk e
gosub walk e
gosub walk e
gosub walk s
gosub walk s
gosub walk s
gosub walk s
gosub walk s
gosub walk s
gosub walk se
goto CLIMB.EXP

WTF.WAIT:
echo
echo *** YOU ARE GOING TOO FAST!
echo *** ADD A FEW APPRAISALS IN TO BREAK UP YOUR CLIMBING
echo 
pause 6
goto %s

FATIGUE_WAIT:
echo
echo *** PAUSING TO RESTORE FATIGUE... ***
echo
        if ($stamina >= 95) then return
        pause 5
        goto FATIGUE_WAIT
        
#======================
 
stand:
        if $standing = 0 then put stand
        if $standing = 0 then put dance
        return

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
        echo 
        echo *** DONE! ***
        echo
        pause 0.5
        echo
        echo
        put #echo >Log Lime *** Climbed Xing walls %c times to $Climbing.LearningRate / 34***
        pause 
        put #parse DONE CLIMBING
        put #parse CLIMBING DONE
        put #parse CLIMBING LOCKED
        pause 0.5
        put glance
    exit

RETURN:
pause 0.1
RETURN

 endearly:
 pause 1
 if $zoneid = 1 then
 {
 goto quit
 }
 if $zoneid = 8 then
 {
 put #goto 43
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 6 then
 {
 put #goto 116
 waitfor YOU HAVE ARRIVED
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 4 then
 {
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 3 then
 {
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 goto quit
 
 include routinecommon.cmd 
