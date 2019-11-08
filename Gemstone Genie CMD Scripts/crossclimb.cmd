#Climb Crossing Walls
# If roundtime wasn't up try sending the last command again.
action (Retry) pause, put $lastcommand when ...wait
action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait|that while entangled in a web\.$
 
 
ECHO
ECHO *** START INSIDE CROSSING PAWNSHOP ***
ECHO
 
put set roomname
put awake
 
pause .25
move out
pause .25
move n
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move se
 
CLIMB:
pause .25
move NoRTHWEST
pause .25
move NoRTH
pause .25
move NoRTH
pause .25
move NoRTH
pause .25
move NoRTH
pause .25
move NoRTH
pause .25
move NoRTH
pause .25
move EaST
pause .25
move EaST
pause .25
move NoRTH
pause .25
move EaST
pause .25
move EaST
pause .25
move NoRTH
pause .25
move NoRTH
pause .25
move EaST
pause .25
move gO stair
pause .25
move SoUTH
 
CLIMB-001:
pause .25
match PASS-001 [Outside East Wall, Footpath]
match FAIL-001 You must be standing
match FAIL-001 steepness is intimidating
match FAIL-001 can't seem to find purchase
match FAIL-001 find it hard going.
match FAIL-001 your footing is questionable
match FAIL-001 slip after a few feet
match FAIL-001 A wave of dizziness hits you
match FAIL-001 Struck by vertigo
put climb break
matchwait
 
PASS-001:
pause .25
pause .25
move NoRTH
pause .25
move gO gate
pause .25
move WeST
pause .25
move gO stair
pause .25
move SoUTH
goto CLIMB-002
 
FAIL-001:
pause .25
goto CLIMB-002
 
CLIMB-002:
pause .25
match PASS-002 [Northeast Wilds, Outside Northeast Gate]
match FAIL-002 You must be standing
match FAIL-002 steepness is intimidating
match FAIL-002 can't seem to find purchase
match FAIL-002 find it hard going.
match FAIL-002 your footing is questionable
match FAIL-002 slip after a few feet
match FAIL-002 A wave of dizziness hits you
match FAIL-002 Struck by vertigo
put ClIMB embrasure
matchwait
 
FAIL-002:
pause .25
pause .25
move n
pause .25
move go stair
pause .25
move e
pause .25
move go gate
PASS-002:
pause .25
move gO footpath
goto CLIMB-01
 
CLIMB-01:
pause .25
SAVE FAIL-01
match PASS-01 [Crossing, East Wall Battlements]
match FAIL-01 You must be standing
match FAIL-01 steepness is intimidating
match FAIL-01 can't seem to find purchase
match FAIL-01 find it hard going.
match FAIL-01 your footing is questionable
match FALLEN slip after a few feet
match FAIL-01 A wave of dizziness hits you
match FAIL-01 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-01:
pause .25
pause .25
move n
pause .25
move gO stair
pause .25
move e
pause .25
move gO gate
pause .25
move gO footpath
goto FAIL-01
 
FAIL-01:
pause .25
pause .25
move s
pause .25
move down
pause .25
move s
pause .25
move s
pause .25
move sw
goto CLIMB-02
 
CLIMB-02:
pause .25
SAVE FAIL-02
match PASS-02 [Crossing, East Wall Battlements]
match FAIL-02 You must be standing
match FAIL-02 steepness is intimidating
match FAIL-02 can't seem to find purchase
match FAIL-02 find it hard going.
match FAIL-02 your footing is questionable
match FALLEN slip after a few feet
match FAIL-02 A wave of dizziness hits you
match FAIL-02 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-02:
pause .25
move s
pause .25
move gO stair
pause .25
move gO gate
pause .25
move gO bush
pause .25
move n
goto CLIMB-03
 
FAIL-02:
pause .25
move s
goto CLIMB-03
 
CLIMB-03:
pause .25
SAVE FAIL-03
match PASS-03 [Crossing, East Wall Battlements]
match FAIL-03 You must be standing
match FAIL-03 steepness is intimidating
match FAIL-03 can't seem to find purchase
match FAIL-03 find it hard going.
match FAIL-03 your footing is questionable
match FALLEN slip after a few feet
match FAIL-03 A wave of dizziness hits you
match FAIL-03 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-03:
pause .25
move s
pause .25
move gO stair
pause .25
move gO gate
goto CLIMB-04
 
FAIL-03:
pause .25
move s
goto CLIMB-04
 
CLIMB-04:
pause .25
SAVE FAIL-04
match PASS-04 [Crossing, East Gate Battlements]
match FAIL-04 You must be standing
match FAIL-04 steepness is intimidating
match FAIL-04 can't seem to find purchase
match FAIL-04 find it hard going.
match FAIL-04 your footing is questionable
match FALLEN slip after a few feet
match FAIL-04 A wave of dizziness hits you
match FAIL-04 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-04:
pause .25
goto CLIMB-05
 
FAIL-04:
pause .25
move gO gate
pause .25
move gO stair
goto CLIMB-05
 
CLIMB-05:
pause .25
SAVE FAIL-05
match PASS-05 [Eastern Tier, Outside Gate]
match FAIL-05 You must be standing
match FAIL-05 steepness is intimidating
match FAIL-05 can't seem to find purchase
match FAIL-05 find it hard going.
match FAIL-05 your footing is questionable
match FALLEN slip after a few feet
match FAIL-05 A wave of dizziness hits you
match FAIL-05 Struck by vertigo
put ClIMB embrasure
matchwait
 
PASS-05:
pause .25
move gO gate
pause .25
move gO stair
 
FAIL-05:
pause .25
move n
goto CLIMB-06
 
CLIMB-06:
pause .25
SAVE FAIL-06
match PASS-06 [Outside East Wall, Footpath]
match FAIL-06 You must be standing
match FAIL-06 steepness is intimidating
match FAIL-06 can't seem to find purchase
match FAIL-06 find it hard going.
match FAIL-06 your footing is questionable
match FALLEN slip after a few feet
match FAIL-06 A wave of dizziness hits you
match FAIL-06 Struck by vertigo
put ClIMB break
matchwait
 
PASS-06:
pause .25
move s
pause .25
move gO gate
pause .25
move gO stair
pause .25
move n
goto CLIMB-07
 
FAIL-06:
pause .25
goto CLIMB-07
 
CLIMB-07:
pause .25
SAVE FAIL-07
match PASS-07 [Outside East Wall, Footpath]
match FAIL-07 You must be standing
match FAIL-07 steepness is intimidating
match FAIL-07 can't seem to find purchase
match FAIL-07 find it hard going.
match FAIL-07 your footing is questionable
match FALLEN slip after a few feet
match FAIL-07 A wave of dizziness hits you
match FAIL-07 Struck by vertigo
put ClIMB embrasure
matchwait
 
PASS-07:
pause .25
move s
pause .25
move s
pause .25
move gO gate
goto TRAVEL-08
 
FAIL-07:
pause .25
move s
pause .25
move gO stair
goto TRAVEL-08
 
TRAVEL-08:
pause .25
move w
pause .25
move w
pause .25
move w
pause .25
move w
pause .25
move nw
pause .25
move n
pause .25
move n
pause .25
move n
pause .25
move n
pause .25
move n
pause .25
move n
pause .25
move w
pause .25
move w
pause .25
move w
pause .25
move w
pause .25
move gO bridge
pause .25
move w
pause .25
move w
pause .25
move w
pause .25
move w
pause .25
move gO stair
pause .25
move s
 
CLIMB-08:
pause .25
SAVE FAIL-08
match PASS-08 [Mycthengelde, Flatlands]
match FAIL-08 You must be standing
match FAIL-08 steepness is intimidating
match FAIL-08 can't seem to find purchase
match FAIL-08 find it hard going.
match FAIL-08 your footing is questionable
match FALLEN slip after a few feet
match FAIL-08 A wave of dizziness hits you
match FAIL-08 Struck by vertigo
put ClIMB embrasure
matchwait
 
PASS-08:
pause .25
goto CLIMB-09
 
FAIL-08:
pause .25
move n
pause .25
move go stair
pause .25
move go gate
pause .25
move nw
goto CLIMB-09
 
CLIMB-09:
pause .25
SAVE FAIL-09
match PASS-09 [Crossing, West Wall Battlements]
match FAIL-09 You must be standing
match FAIL-09 steepness is intimidating
match FAIL-09 can't seem to find purchase
match FAIL-09 find it hard going.
match FAIL-09 your footing is questionable
match FALLEN slip after a few feet
match FAIL-09 A wave of dizziness hits you
match FAIL-09 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-09:
pause .25
move n
goto CLIMB-10
 
FAIL-09:
pause .25
move se
pause .25
move gO gate
pause .25
move gO stair
goto CLIMB-10
 
CLIMB-10:
pause .25
SAVE FAIL-10
match PASS-10 [Mycthengelde, Flatlands]
match FAIL-10 You must be standing
match FAIL-10 steepness is intimidating
match FAIL-10 can't seem to find purchase
match FAIL-10 find it hard going.
match FAIL-10 your footing is questionable
match FALLEN slip after a few feet
match FAIL-10 A wave of dizziness hits you
match FAIL-10 Struck by vertigo
put ClIMB embrasure
matchwait
 
PASS-10:
pause .25
move gO gate
pause .25
move gO stair
FAIL-10:
pause .25
move e
goto CLIMB-11
 
CLIMB-11:
pause .25
SAVE FAIL-11
match PASS-11 [Northwall Trail, Wooded Grove]
match FAIL-11 You must be standing
match FAIL-11 steepness is intimidating
match FAIL-11 can't seem to find purchase
match FAIL-11 find it hard going.
match FAIL-11 your footing is questionable
match FALLEN slip after a few feet
match FAIL-11 A wave of dizziness hits you
match FAIL-11 Struck by vertigo
put ClIMB break
matchwait
 
PASS-11:
pause .25
move s
pause .25
move gO gate
pause .25
move gO stair
pause .25
move e
goto CLIMB-12
 
FAIL-11:
pause .25
goto CLIMB-12
 
CLIMB-12:
pause .25
SAVE FAIL-12
match PASS-12 [Northwall Trail, Wooded Grove]
match FAIL-12 You must be standing
match FAIL-12 steepness is intimidating
match FAIL-12 can't seem to find purchase
match FAIL-12 find it hard going.
match FAIL-12 your footing is questionable
match FALLEN slip after a few feet
match FAIL-12 A wave of dizziness hits you
match FAIL-12 Struck by vertigo
put ClIMB embrasure
matchwait
 
PASS-12:
pause .25
goto CLIMB-13
 
FAIL-12:
pause .25
move w
pause .25
move gO stair
pause .25
move gO gate
pause .25
move gO trail
pause .25
move ne
goto CLIMB-13
 
CLIMB-13:
pause .25
SAVE FAIL-13
match PASS-13 [Crossing, North Wall Battlements]
match FAIL-13 You must be standing
match FAIL-13 steepness is intimidating
match FAIL-13 can't seem to find purchase
match FAIL-13 find it hard going.
match FAIL-13 your footing is questionable
match FALLEN slip after a few feet
match FAIL-13 A wave of dizziness hits you
match FAIL-13 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-13:
pause .25
move w
pause .25
move gO stair
pause .25
move gO gate
pause .25
move gO trail
goto CLIMB-14
 
FAIL-13:
pause .25
move sw
goto CLIMB-14
 
CLIMB-14:
pause .25
SAVE FAIL-14
match PASS-14 [Crossing, North Wall Battlements]
match FAIL-14 You must be standing
match FAIL-14 steepness is intimidating
match FAIL-14 can't seem to find purchase
match FAIL-14 find it hard going.
match FAIL-14 your footing is questionable
match FALLEN slip after a few feet
match FAIL-14 A wave of dizziness hits you
match FAIL-14 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-14:
pause .25
move w
pause .25
move gO stair
pause .25
move gO gate
goto CLIMB-15
 
FAIL-14:
pause .25
move s
goto CLIMB-15
 
CLIMB-15:
pause .25
SAVE FAIL-15
match PASS-15 [Crossing, West Gate Battlements]
match FAIL-15 You must be standing
match FAIL-15 steepness is intimidating
match FAIL-15 can't seem to find purchase
match FAIL-15 find it hard going.
match FAIL-15 your footing is questionable
match FALLEN slip after a few feet
match FAIL-15 A wave of dizziness hits you
match FAIL-15 Struck by vertigo
put ClIMB wall
matchwait
 
PASS-15:
pause .25
move gO stair
goto TRAVEL-15
 
FAIL-15:
pause .25
move gO gate
goto TRAVEL-15
 
TRAVEL-15:
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move e
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move s
pause .25
move se
pause .25
put sk athletics
match climb EXP HELP
match quit mind lock
matchwait
 
 
 
FALLEN:
pause .25
match STOOD You stand
match STOOD You are already standing
match FALLEN cannot manage to stand.
match FALLEN The weight of all your possessions
match FALLEN ...wait
put StAND
matchwait
 
STOOD:
goto %s
 
QUIT:
put stow left
wait
put stow right
wait
put hide
wait
pause .25
 
if_9 put %1 %2 %3 %4 %5 %6 %7 %8 %9
if_9 exit
if_8 put %1 %2 %3 %4 %5 %6 %7 %8
if_8 exit
if_7 put %1 %2 %3 %4 %5 %6 %7
if_7 exit
if_6 put %1 %2 %3 %4 %5 %6
if_6 exit
if_5 put %1 %2 %3 %4 %5
if_5 exit
if_4 put %1 %2 %3 %4
if_4 exit
if_3 put %1 %2 %3
if_3 exit
if_2 put %1 %2
if_2 exit
if_1 put %1
exit