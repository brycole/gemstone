move southwest
move southwest
move southwest
move southwest
move southwest
move southwest
move southwest
move go gate
move southwest
move s
move sw
move sw
move w
move w
move sw
move sw
move s
move nw
move sw
move w
move sw
move w
move n
move go trail
move ne
move climb sinkhole
move sw
move n
goto dig

dig:
match dig ...wait
match continue roots to freedom.
match dig only succeed in bringing handfuls
put dig grave
matchwait

continue:
put stand
pause 1
put retreat
pause 1
put retreat
pause 1
move sw
move w
move s
goto manor_script

manor_script:
put push statue 
waitfor You push
pause 0
put retreat
pause 1
put retreat
pause 1 
move w 
move w 
move sw 
move go house 
move s 
goto 0

0: 
match 0 ...wait
match hand_up0 points at the word "Fire."
match 0 Roundtime
match try_again doesn't budge
match hand_up0 points at the word "Fire."
match error flame and blazing sparks
put turn head
matchwait

hand_up0:
match hand_up0 ...wait
match push_head0 The gargoyle claw is already pushed up as far as it will go.
match push_head0 You push the gargoyle claw up and it clicks into place.
match error flame and blazing sparks
put push claw
matchwait

push_head0:
match 1 The gargoyle head shudders as something inside grinds into motion, then silence.
match 1 The gargoyle head shudders as something inside grinds into motion, followed by a moment's worth of odd clicking noises.
match error flame and blazing sparks
put push head
matchwait

error:
put south
pause 1
put pull lever
pause 1
move n
move go door
move ne
move e
move e
goto manor_script

1:
match 1 ...wait
match hand_down1 points at the word "Exchange."
match 1 Roundtime
match hand_down1 points at the word "Exchange."
put turn head
matchwait

hand_down1:
match hand_down1 ...wait
match push_head1 The gargoyle claw is already pulled down as far as it will go.
match push_head1 You pull the gargoyle claw down and it clicks into place.
put pull claw
matchwait

push_head1:
match 2 The gargoyle head shudders as something inside grinds into motion, then silence.
match 2 The gargoyle head shudders as something inside grinds into motion, followed by a moment's worth of odd clicking noises.
put push head
matchwait

2:
match 2 ...wait
match hand_up2 points at the word "Poison."
match 2 Roundtime
match hand_up2 points at the word "Poison."
put turn head
matchwait

hand_up2:
match hand_up2 ...wait
match push_head2 The gargoyle claw is already pushed up as far as it will go.
match push_head2 You push the gargoyle claw up and it clicks into place.
put push claw
matchwait 

push_head2:
match 3 The gargoyle head shudders as something inside grinds into motion, then silence.
match 3 The gargoyle head shudders as something inside grinds into motion, followed by a moment's worth of odd clicking noises.
put push head
matchwait

try_again:
put pull lever
pause 1
move n
move go door
move ne
move e
move nw
move e
move go door
goto continue2

3:
put pull lever
move n 
move go door 
move ne 
move n 
move e 
move go door 
goto continue2

continue2:
move go arch
put look on shelving
pause 1
put study grimoire
ECHO STUDY THE GRIMOIRE UNTIL YOU GOT THE SPELL
ECHO STUDY THE GRIMOIRE UNTIL YOU GOT THE SPELL
ECHO STUDY THE GRIMOIRE UNTIL YOU GOT THE SPELL
ECHO WHEN YOU ARE READY TO GO HOME TYPE glance
ECHO WHEN YOU ARE READY TO GO HOME TYPE glance
ECHO WHEN YOU ARE READY TO GO HOME TYPE glance
waitfor glance down
goto go_home

go_home:
move go arch
move e
move go arch
move climb hole
move s
move e
move e
move ne
move climb slope
move sw
move go trail
move s
move e
move ne
move e
move ne
move se
move n
move ne
move ne
move e
move e
move ne
move ne
move n
move ne
move go gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
ECHO TADA