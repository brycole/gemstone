#Forging - Weapons

gosub routinecommon

var container1 rucksack
var container2 rucksack

top:
	gosub get my weapon book
	gosub put.1 "study my book" "^Roundtime"
	gosub stow book
	gosub get my ball hammer
	gosub get my tongs
	
PoundIngot:
	put pound ingot on anvil with my hammer
	matchre Tongs1 along the horn|would benefit from some soft reworking.
	match Bellows1 is unable to consume its fuel.|^As you finish working the fire dims and produces
	match Shovel1 fire dies down
	match Pound1 Roundtime
	matchre PoundIngot %rtwait
	matchwait

Pound1:
	save Pound
	goto StowIngot
Tongs1:
	save Tongs
	goto StowIngot
Bellows1:
	save Bellows
	goto StowIngot
Shovel1:
	save Shovel
	goto StowIngot

StowIngot:
	gosub stow my hammer
StowIngot1:	
	put stow ingot
	matchre StowIngot1 %rtwait
	match Stow2 You put
	matchwait
Stow2:
	gosub get my ball hammer
	goto %s

Pound:
pause 1
put pound %1 on anvil with my hammer
match Pound ...wait
match Pound Roundtime
match Tongs could use some straighting along the horn
match Tongs could use some straightening along the horn
match Tongs would benefit from some soft reworking.
match Tub ready for a quench hardening in the slack tub.
match Bellows As you finish working the fire dims and produces
match Bellows is unable to consume its fuel.
match Shovel fire dies down and needs more fuel.
match Shovel fire dies down and appears to need some more fuel.
matchwait

Tongs:
pause 1
put turn %1 on anvil with my tongs
match Pound Roundtime
match Tub ready for a quench hardening in the slack tub.
match Tongs ...wait
matchwait

Tub:
pause 1
put stow right
put stow left
waitfor You put
put push tub
match Tub ...wait
match Hilt You need another finished wooden hilt
match Haft You need another finished wooden haft 
match ShortCord You need another finished short leather cord
match LongPole You need another finished long wooden pole
match NoAssemble The knuckles now appears ready for grinding
match NoAssemble The quarterstaff now appears ready for grinding
match NoAssemble The mace now appears ready for grinding
match NoAssemble The sha-tai now appears ready
match NoAssemble The cane now appears ready for grinding
matchwait

Bellows:
pause 1
put put my tongs in my %container1
put get my bellows
waitfor You get
put push bellows
match Tub ready for a quench hardening in the slack tub.
match StowBellow Roundtime
matchwait

Shovel:
pause 1
put put my tongs in my %container1
put get my shovel in my %container1
waitfor You get
put push fuel with my shovel
match Tub ready for a quench hardening in the slack tub.
match StowShovel Roundtime
matchwait

StowBellow:
pause 1
put put my bellow in my %container1
put get my tongs in my %container1
waitfor You get
goto Pound

StowShovel:
pause 1
put put my shovel in my %container1
put get my tongs in my %container1
waitfor You get
goto Pound

NoAssemble:
pause 1
put get %1 on anvil
goto Turn

Hilt:
pause 1
put get %1 on anvil
waitfor You get
put get my hilt in %container2
waitfor You get
put assemble my Hilt with my %1
goto Turn

Haft:
pause 1
put get %1 on anvil
waitfor You get
put get my haft in %container2
waitfor You get
put assemble my Haft with my %1
goto Turn

ShortCord:
pause 1
put get %1 on anvil
waitfor You get 
put get my short cord in %container2
waitfor You get
put assem my cord with my %1
goto Turn

LongPole:
pause 1
put get %1 on anvil
waitfor You get 
put get my long pole in %container2
waitfor You get
put assem my pole with my %1
goto Turn


Turn:
pause 1
put turn grindstone
Turn2:
match Grind keeping it spinning
match Turn ...wait
match Turn Roundtime
match NoGrind Turn what?
matchwait

Grind:
put push grindstone with %1
match Push ...wait
match Oil Roundtime
matchwait

Oil:
pause 1
put get oil
put pour oil on my %1
waitfor Roundtime
pause 1
put stow oil
ECHO ***************************************************************
ECHO **If you want to mark items, delete the next line "GOTO DONE"
ECHO ***************************************************************
goto Done
put get my stamp
waitfor You get
put mark my %1 with my stamp
pause 1
pause 1
put stow stamp

Done:
if_2 goto continue
exit

continue:
put put my %1 in my %2
put get my ingot
stand:
pause 1
put stand
match stand ...wait
match stand Roundtime
match putingot You stand 
match putingot You are already standing
matchwait

putingot:
put put my ingot on anvil
pause 1
goto top

NoGrind:
ECHO *************************
ECHO ** No grindstone here
ECHO **
ECHO ** move to grindturn and turn once
ECHO ** script will resume
ECHO **
ECHO *************************
goto Turn2
