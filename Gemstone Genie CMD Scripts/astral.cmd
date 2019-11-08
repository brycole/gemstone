##debuglevel 10

include base.cmd

var pillar 0
var shard 0
var go center

ECHO 

ECHO ==================================================================

ECHO *** Welcome to Genie3 astral travel! 
echo ****
echo *** Created by Kurav. 
echo *** 
echo *** 
ECHO *** Rolagi - Crossing
ECHO *** Asharshpar'i - Oshu'errhsk manor
ECHO *** Emalerje - Lesser Fist
ECHO *** Taniendar - Riverhaven
ECHO *** Dinegavren - Therenborough
ECHO *** Mintais - Throne City
ECHO *** Marendin - Shard
ECHO *** Auilusi - Aesry
ECHO *** Tabelrem - Muspar'i
ECHO *** Erekinzil - Taisgath
ECHO *** Tamigen - Dragon Priests Spire
ECHO *** Dor'na'torna - Hibarnhvidar
ECHO ===================================================

ECHO

if_1 then
else 
{	
	ECHO Please enter start location.
	exit
}
## shard start locations
action setvar focus Auilusi when Aesry Surlaenis'a, Peri'el Prayer Gate
action setvar focus Rolagi when Observatory, Foyer
action setvar focus Asharshpari when Telpengi'hhs Sara'a, Embalming Chamber
action setvar focus Tabelrem when World Dragon Temple
action setvar focus Emalerje when Inside the Fortress, Stone Garden
action setvar focus Taniendar when Obsidian Spire, Roof
action setvar focus Dinegavren when Gealeranendae College, Tear of Grazhir Exhibit
action setvar focus Mintais when Phelim's Sanctum, Tear of Grazhir
action setvar focus Erekinzil when Taisgath Guildhouse, Walk of the Winds
action setvar focus Marendin when Moon Mage Guild, Atrium
action setvar focus Tamigen when Cragstone Vale, Shrine of the Shell
action setvar focus Dornatorna when The Spire, Chamber of Contemplation

## astral movement actions
action goto movement when You end up walking in circles.
action setvar center $1 when You believe the center of the microcosm is to the (\w+).
action setvar end $1 when You believe the end of the conduit lies (\w+).
action setvar pillar 1 when Astral Plane, Pillar|Obvious exits: east, west, up, down
action setvar shard 1 when silvery-white shard %1
action setvar harness 1 when You carefully maintain
action setvar movereset 1 when A wave of rippling air sweeps through the conduit!  The streams of mana twist and writhe violently before settling into new patterns.

## start
put look
delay 1
put prep moongate
put focus %focus
pause
harness:
pause
match heldloop You tap
match harness ...wait
put harness 10
matchwait
heldloop:
if $heldMana < 45 then goto harness
delay 2
put cast %focus

movement:
var movereset 0
if %harness = 1 then
{
	put harness 20
	pause
	var harness 0
}
put power
pause
if %movereset = 1 then goto movement
if %go = end then gosub walk %end
if %go = center then gosub walk %center
##waitfor Obvious
if %pillar = 1 then goto pillar
if %shard = 1 then goto endshard
goto movement

pillar:
action var cond 1 when You move into the chaotic tides of energy
gosub put.1 "focus %1" "You reach"
if %cond = 1 then goto shard
gosub walk east
goto pillar

shard:
var pillar 0
var go end
goto movement

endshard:
put prep moongate
put focus %1
pause
pause 2
evalmath mana1 ($heldMana - 50)
put release %mana1 mana
put cast %1
pause 1
put release
exit


