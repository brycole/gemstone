## Favors

#include Base.cmd

#   debuglevel 5
## Start Menu ###############################

var city Crossing
var god Meraud
counter set 3

## Movement #######################
CROSSING.TO.GENALTAR:
   pause .2
   send #goto 172
   waitfor YOU HAVE ARRIVED
   send #goto 362
   waitforre \[Siergelde\, Stone Grotto\]
   goto GEN.SELECT
   
GENALTAR.TO.CROSSING:
   pause .2
   send #goto 14
   waitfor YOU HAVE ARRIVED
   goto GOT.EM.ALL
   
RIVERHAVEN.TO.GENALTAR:
   pause .2
   
GENALTAR.TO.RIVERHAVEN:
   pause .2

SHARD.TO.GENALTAR:
   if ("$zoneid" = "67") then
   {
      send #goto west
      waitfor YOU HAVE ARRIVED
   }
   if ("$zoneid" = "69") then
   {
      send #goto 368
      waitfor YOU HAVE ARRIVED
      waitforre \[Wyvern Mountain\, Cavern\]
      gosub FALLEN
      send #goto favor
      waitfor YOU HAVE ARRIVED
   }
   goto GEN.SELECT

GENALTAR.TO.SHARD:
   pause .2
   send #goto 367
   waitfor YOU HAVE ARRIVED
   waitforre \[Wyvern Trail\, Clearing\]
   gosub FALLEN
   gosub MOVE go trail
   send #goto shard
   waitfor YOU HAVE ARRIVED
   goto GOT.EM.ALL

## Misc ###########################
pause 1
send #goto 476

## General Altars #################
GEN.SELECT:
    
GEN.SELECT.NUMBER:

GEN.SET.COUNTER:

GEN.CONFIRM:

GEN.ORB:
KNEEL:
   pause .2
   matchre KNEEL ^\.\.\.wait|^Sorry
   matchre PRAY ^You kneel down upon the ground\.
   send kneel
   matchwait

PRAY:
   pause .2
   matchre PRAY ^\.\.\.wait|^Sorry
   matchre PRAY ^You close your eyes and pray\.|^As you continue to pray\,|^You (begin|continue) to pray
   matchre DECLARE ^As the world around you returns to normal, you hear a faint voice echo within you\.
   send pray
   matchwait

DECLARE:
   pause .2
   matchre DECLARE ^\.\.\.wait|^Sorry
   matchre STAND.FOR.ORB ^The voice speaks to you again saying\,
   send say Meraud
   matchwait

STAND.FOR.ORB:
   pause .2
   matchre STAND.FOR.ORB ^\.\.\.wait|^Sorry
   matchre GET.ORB.INIT ^(\[Siergelde, Labyrinth\]|\[Wyvern Mountain\, Black Altar\])
   send stand
   matchwait

GET.ORB.INIT:
   pause .2
   matchre GET.ORB.INIT ^\.\.\.wait|^Sorry
   matchre BEGIN.PUZZLE ^(You get a glowing .* orb from atop an altar|As you retrieve the orb from the altar\,)
   send get %god orb on altar
   matchwait

BEGIN.PUZZLE:
   pause .2
   matchre BEGIN.PUZZLE ^\.\.\.wait|^Sorry
   matchre LOOK ^You step through the .* arch\,|^What were you referring to\?|^I could not find what you were referring to\.
   send go arch
   matchwait

PUZZLE:
   matchre PLANT ^You are standing in a square room of smooth, stone walls\.
   matchre SPONGE You also see a granite altar with several candles on it, a granite font and a small sponge\.
   matchre JUG You also see a granite altar with several candles and a water jug on it, and a granite font\.
   matchre TINDERS You also see some tinders, several candles, a granite font and a granite altar\.
   matchre VASE You also see a vase on top of the altar\.
   matchre NEXT ^(\[Siergelde, Stone Grotto\]|\[Wyvern Mountain\, Raised Dais\])
   matchre LOOK ^That's difficult to do from the bottom| ^It would be difficult to go
   matchwait

LOOK:
   pause .2
   send look
   goto PUZZLE

NEXT:
   pause .2
   matchre NEXT ^\.\.\.wait|^Sorry
   matchre GEN.ORB shatter
   matchre DECREMENT ^You put your
   send stow my orb
   matchwait

DECREMENT:
   counter subtract 1
   if "%c" = "0" then goto ORB.DONE
   if contains ("1|2|3", "%c") then goto GEN.ORB
   
ORB.DONE:
   pause .2
   if "%city" = "Crossing" then goto GENALTAR.TO.CROSSING
   if "%city" = "Riverhaven" then goto GENALTAR.TO.RIVERHAVEN
   if "%city" = "Shard" then goto GENALTAR.TO.SHARD

PLANT:

	put drop orb   
	goto GEN.SELECT
   pause .2
   matchre PLANT ^\.\.\.wait|^Sorry
   matchre PLANT ^Judging the thickness of the paint which has sealed the window shut, you shimmy the frame of the glass to loosen it\.  After a few strong shakes, you notice a thin crack running along the painted edge\.
   matchre PLANT ^Shaking the frame of the glass once more, you manage to loosen it even further\.  As you grunt with effort, you feel the thick paint binding slip, and flakes of the stuff fall to the floor\.
   matchre OPEN ^A cool, swift breeze moves into the room, chasing the stifling heat from your skin\.
   send open window
   matchwait

OPEN:
pause .2
   matchre OPEN ^\.\.\.wait|^Sorry
   matchre PLANT ^You cannot go through a closed window\.
   matchre PUZZLE ^You hoist yourself off the floor and manage to swing yourself through the open window\.
   send go window
   matchwait

SPONGE:
   pause .2
   send clean altar
   pause .2
   send climb stair
   pause .2
   send go door
   goto PUZZLE

JUG:
   pause .2
   send fill font
   pause .2
   send climb stair
   pause .2
   send go door
   goto PUZZLE

TINDERS:
   pause .2
   send light candle
   pause .2
   send climb stair
   pause .2
   send go door
   goto PUZZLE

VASE:
   pause .2
   send get flower
   pause .2
   send go path
   goto PUZZLE