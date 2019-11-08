include base.cmd
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action var Eluned Closed when The waters of Eluned
action var Tasmine Closed when You have been recently enlightened
action var Truffenyi Closed when You are still captivated by
action var Conduit Closed when You will not be able to open another divine conduit
action var Devotion Low when You feel unclean and
action var Devotion Low when parched and thirsting for nourishment
action var Devotion Low when You call out to your
action var Devotion Low when You sense that your god is barely aware of
action var Devotion Low when You sense that your efforts have not gone
action var Devotion Low when You sense a distinct link between you
action var Deovtion Low when After a moment, you sense that your god is pleased with your devotion.
action var Deovtion Low when After a moment, you sense that your god knows your name.
action var Devotion Low when After a moment, you see a vision of your god, though the visage is cloudy and impossible to make out clearly.
action var Devotion Low when After a moment, you sense a slight pressure on your shoulder, leaving the feeling that your efforts have been acknowledged.
action var Devotion Low when After a moment, you see a silent vision of your god, radiating forth with a powerful divine brillian
action var Devotion Low when After a moment, you see a vision of your god who calls to you by name, "Come here my child
action var Devotion Low when After a moment, you see a vision of your god who calls to you by name, "My child, though you may not
#action var Devotion Low when  After a moment, you see a crystal-clear vision of your god who speaks slowly and deliberately
 
var blockcounter = 0
 
 
move e
move w
pause 2
gosub automove well
send stow right
pause .5
send stow left
pause .5
goto MAIN

MAIN:
gosub ALTAR1
gosub ALTAR
gosub TOWELL
gosub REZZ
gosub PPERC
gosub TOCLIMB
gosub GETFLUTE
gosub FLUTE
gosub CLIMB
gosub FLUTE
gosub CLIMB
gosub FLUTE
gosub CLIMB
gosub CLIMB
gosub PUTFLUTE
gosub TOWELL1
gosub THEURGY
gosub TOALTAR
gosub ALTAR
gosub TOWELL
gosub GHS
gosub GETFLUTE
gosub FLUTE
gosub COLLECT
gosub PUTFLUTE
gosub ARCANA
gosub TOALTAR
gosub ALTAR
gosub TOWELL2
gosub LIMB
gosub BLOCK
gosub LIMB
gosub BLOCK
gosub LIMB
gosub BLOCK
gosub REMOVE
gosub CARACALS
gosub BABYWEAPONS
gosub STEALTH
gosub WEAR

gosub BENE
gosub THEURGY
goto MAIN


ALTAR1:
pause 2
gosub automove favor

badge:
pause 1
send rem badge
pause 1
send pray badge
pause 10
send wear badge
pause 1

Chain:
put get my owl bead
pause .5
put get my prayer chain
pause .5
put put bead on prayer chain
pause .5
put kneel
pause .5
put meditate my prayer chain
pause 45
send exp
pause 45
put stow prayer chain
pause 2
send stand
pause 1
send stow right
pause 1
send stow left
pause 1
 
WATER:
send get my water
match eluned2 What were you referring to?
match wash You get some holy water
matchwait
 
WASH:
SEND Recite May Everild steel your honor\;and help you do right\;and Kuniyo help you in battle\;as you wander the wilderness\;For if Trothfang findes you Chaos and creulty\;will be your fate.
pause 18
SEND wash altar with my water
pause 10
SEND Stow right
pause .5
SEND stow left
pause .5
RETURN
 
ELUNED2:
put put stow right
pause .5
put put stow left
pause .5
put get my vial
pause .5
move down
pause .5
put forage dirt
pause .5
move up
put commune elun
pause .5
put get water from vial
pause .5
put stow left
pause .5
put stow right
pause .5
goto water
 
 
ALTAR:
gosub automove favor
timer clear
timer start
pause 2
SEND PRAY DAMARIS
pause 10
KISS:
send kneel
pause .5
send Kiss altar
pause .5
send stand
match wine You stand back up.
match stand You are so unbalanced you cannot manage to stand.
match stand You are overburdened and cannot manage to stand.
match stand You are too imbalanced
match stand You are still stunned
matchwait
 
stand:
SEND STAND
RETURN
 
WINE:
SEND PRAISE Damaris!
SEND Recite May Damaris watch over your children\;and your dreams\;and may Phelim help you do as you mean\;And pray to Dergati when darkness prevails\;and your world turns into a nightmare.  May his panther's eye protect\;you through the night.
SEND Recite May Chadatru remind you\;to be just and true\;and may Rutilor help you\;to always defend the weak\;Guard your heart when Botolf\;dwells in your midst, lest you become corrupt.
PAUSE 15
send get wine
pause .5
send pour wine on altar
pause .5
send stow right
pause .5
send stow left
pause .5
 
DANCE:
send dance
pause 10
send dance
pause 10
send dance
pause 10
 
goto INCENSE
INCENSE:
send get inc
pause .5
send get Fae
pause .5
send point Fae at inc
pause .5
send stow Fae
pause .5
send wave inc at altar
pause .5
send snuff inc
pause .5
send stow inc
pause .5
send pow
pause 8
gosub automove well
RETURN
 
TOWELL:
gosub automove well
ECHO ****%t****
RETURN
 
REZZ:
 
SEND RELEASE
pause .5
SEND Prepare rezz 25
waitfor You feel fully prepared
SEND CAST
RETURN
 
 
PPERC:
move west
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
send go path
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move south
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
move south
send pow
waitfor Roundtime
move south
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move north
SEND Recite May Faenella inspire you\;in both poetry and song\;and Murrula help you find beauty\;when all hope is gone\;Yet if you only see beauty within\;Idon may keep you closer than kin.
pause 18
send pow
waitfor Roundtime
move down
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move east
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move down
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move southwest
send pow
waitfor Roundtime
move down
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move west
send pow
waitfor Roundtime
move down
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move southeast
send pow
waitfor Roundtime
move east
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move northwest
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
move north
send pow
waitfor Roundtime
move northeast
send pow
waitfor Roundtime
RETURN
 
 
TOCLIMB:
gosub automove piling
RETURN
 
GETFLUTE:
SEND open flute case
pause .5
SEND get flute from flute case
pause .5
RETURN
 
FLUTE:
SEND play folk confident on flute for damaris
pause 1
RETURN
 
PUTFLUTE:
SEND put flute in case
pause .5
SEND close flute case
pause .5
RETURN
 
CLIMB:
SEND climb prac piling
waitfor You finish practicing your climbing skill and take a well-earned break.
RETURN
 
 
TOWELL1:
gosub automove well
ECHO ******%t*****
RETURN
 
TOALTAR:
gosub automove favor
RETURN
 
 
GHS:
timer clear
timer start
send listen lukretia
pause .5
SEND Listen Charise
pause .5
SEND Listen Lliselle
pause .5
SEND Listen Darmisk
pause .5
send listen Vandyl
pause .5
put teach debilitation to llis
pause .5
SEND Release
pause .1
SEND PREPARE GHS 25
waitfor You feel fully prepared to cast
SEND Cast
RETURN
 
COLLECT:
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
SEND collect yew limb
waitfor Roundtime
pause .5
send kick pile
pause .5
 
 
ECHO *****%t*****
RETURN
 
ARCANA:
put get camb orb
wait
charge:
pause 1
put charge camb orb 11
match charge The cambrinth orb absorbs
match charge ...wait
match cast you strain,
match cast The cambrinth orb resists,
match cast The cambrinth orb is already
matchwait
 
cast:
put prep pfe 10
wait
put invoke camb orb
waitfor You feel fully prepared
put cast
goto charge2
 
charge2:
pause 1
put charge camb orb 11
match charge2 The cambrinth orb absorbs
match charge2 ...wait
match cast2 you strain,
match cast2 The cambrinth orb resists,
match cast2 The cambrinth orb is already
matchwait
 
cast2:
put prep mpp 10
wait
put invoke camb orb
waitfor You feel fully prepared
put cast
pause
 
charge3:
pause 1
put charge camb orb 11
match charge3 The cambrinth orb absorbs
match charge3 ...wait
match cast3 you strain,
match cast3 The cambrinth orb resists,
match cast3 The cambrinth orb is already
matchwait
 
cast3:
put prep BENE 10
wait
put invoke camb orb
waitfor You feel fully prepared
put cast Damaris
pause
goto charge4
 
charge4:
pause 1
put charge camb orb 11
match charge4 The cambrinth orb absorbs
match charge4 ...wait
match cast4 you strain,
match cast4 The cambrinth orb resists,
match cast4 The cambrinth orb is already
matchwait
 
cast4:
put prep auspice 20
pause 1
put invoke camb orb
waitfor You feel fully prepared
put cast
pause 1
goto charge5
 
charge5:
pause 1
put charge camb orb 11
match charge5 The cambrinth orb absorbs
match charge5 ...wait
match cast5 you strain,
match cast5 The cambrinth orb resists,
match cast5 The cambrinth orb is already
matchwait
 
cast5:
put prep gg 20
pause 1
put invoke cambrinth orb
waitfor You feel fully prepared
put cast
pause 1
goto charge6
 
charge6:
pause 1
put charge camb orb 11
match charge6 The cambrinth orb absorbs
match charge6 ...wait
match cast6 you strain,
match cast6 The cambrinth orb resists,
match cast6 The cambrinth orb is already
matchwait
 
cast6:
put prep bene 10
wait
put invoke camb orb
waitfor You feel fully prepared
put cast damaris
goto charge7
 
charge7:
pause 1
put charge camb orb 11
match charge7 The cambrinth orb absorbs
match charge7 ...wait
match cast7 you strain,
match cast7 The cambrinth orb resists,
match cast7 The cambrinth orb is already
matchwait
 
cast7:
put prep mapp 10
wait
put invoke camb orb
waitfor You feel fully prepared
put cast
pause
goto charge8
 
charge8:
pause 1
put charge camb orb 11
match charge8 The cambrinth orb absorbs
match charge8 ...wait
match cast8 you strain,
match cast8 The cambrinth orb resists,
match cast8 The cambrinth orb is already
matchwait
 
cast8:
put prep BENE 10
wait
put invoke camb orb
waitfor You feel fully prepared
put cast Damaris
pause
goto charge9
 
charge9:
pause 1
put charge camb orb 11
match charge9 The cambrinth orb absorbs
match charge9 ...wait
match cast9 you strain,
match cast9 The cambrinth orb resists,
match cast9 The cambrinth orb is already
matchwait
 
cast9:
put prep auspice 20
pause 1
put invoke camb orb
waitfor You feel fully prepared
put cast
pause 1
goto charge10
 
charge10:
pause 1
put charge camb orb 11
match charge10 The cambrinth orb absorbs
match charge10 ...wait
match cast10 you strain,
match cast10 The cambrinth orb resists,
match cast10 The cambrinth orb is already
matchwait
 
cast10:
put prep gg 20
pause 1
put invoke cambrinth orb
waitfor You feel fully prepared
put cast
pause 1
send stow orb
ECHO ******%t*******
RETURN
 
TOWELL2:
gosub automove well
ECHO ****%t****
RETURN
 
 
LIMB:
timer clear
timer start
forage:
put put stow right
pause .5
put put stow left
pause .5
put forage yew limb
match forageerror You wander around and
match forageerror You begin to forage around
match forageerror You forage around and believe you
match getwater You manage to find a yew limb.
matchwait
 
forageerror:
echo ##Can not find this type of wood.  Leave out wood type, or move to an area that has this wood.RETURN
 
getwater:
SEND get my water
match sprinkle You get some holy water
match sprinkle You are already holding that.
match commune2 What were you
matchwait
 
Commune2:
put stow limb
pause .5
put get vial
pause .5
put forage dirt
pause .5
put commune elun
pause .5
send get water from vial
pause .5
send stow vial
pause .5
send get my limb
pause .5
goto sprinkle
 
sprinkle:
SEND sprinkle water on my limb
pause 1
put stow water
pause 1
goto bless
 
bless:
put prep bless 10
waitfor You feel fully prepared
put cast my limb
 
match sprinkle but nothing else seems to happen.
match knife and is slowly absorbed.
matchwait
 
knife:
put get my cere knife
pause 1
RETURN
 
BLOCK:
put carve my limb with my knife
match block Roundtime
match stowknife You need to hold the
match stowknife With a final deep cut the rest
match stowknife What were you referring to?
match stowknife It would be better to find a
matchwait
 
stowknife:
put stow knife
pause 1
put get my shaper
pause 1
 
CARVE:
put Shape block to owl
match carve Roundtime
match stowbead Your spirit soars with pride as you place
matchwait
 
 
Stowbead:
put stow bead
pause 2
put stow shaper
pause 2
echo *****%t*****
RETURN
 
REMOVE:
SEND rem bala
pause .5
SEND stow bala
pause .5
SEND rem shirt
pause .5
SEND stow shirt
pause .5
SEND rem glove
pause .5
SEND stow glov
pause .5
SEND rem buckler
pause .5
SEND stow buckler
pause .5
SEND rem greav
pause .5
SEND stow greav
pause 5
RETURN
 
CARACALS:
gosub automove 303
RETURN
 
 
STEALTH:
send release
timer clear
timer start
Send get my bread
pause 2
put look
match face You see a caracal
matCh face You also see a caracal.
match face Obvious paths
match move 219 Also here:
matchwait
 
MOVE303:
gosub automove 305
timer clear
timer start
goto Stealth
 
FACE:
pause 5
put face first caracal
  Match FACE Face what?
  MATCH FACE You aren't close enough to attack.
  MATCH assess You are already facing
  MATCH assess You turn to face
  MATCH assess You are too closely engaged
  MATCH assess What's the point
  MATCH assess ...wait 1 seconds.
  MATCHWAIT
 
 
 
assess:
   put eng
   pause 2
   put assess
   match hide at melee range.
   match hide closes to melee range on you!
   match hide has spotted you!
   match hide at pole weapon range.
 
   match hide at missile range.
   match face ...wait
   match hide You must be hidden first!
matchwait
 
retrtohide:
pause 3
put retr
pause
goto hide
 
hide:
   put hide
   match retrtohide You are too close to
   match assess From your place of hiding you can see
   match assess ...wait
   match hidden You melt into the background
   match hide You must be hidden first!
   match hide has spotted you!
   match hide notices your
   match hidden But you're already hidden!
   matchwait
 
hidden:
   pause .5
   put eng
   pause .5
   put stalk
   match hide The caracal alerts others of your attempt to slip behind the peccary!
   match hide The caracal discovers you, ruining your hiding place!
   match ambush You're already
   match hide Stalking is an inherently stealthy
   match hidden You fail to position yourself well enough
   match ambush You are already stalking
   match assess ...wait
   match assess From your place of hiding you can see
   match hide You must be hidden first!
   match hide notices you trying to stalk it.
   match hide has spotted you!
   match hide discovers your hiding place
   match ambush You move into position
   matchwait
   
eng:
put eng
pause .5
goto ambush
 
ambush:
 
  put ambush
  match hide You must be hidden or invisible to ambush!
  match hide The Caracals alerts others of your attempt to slip behind the caracal!
  match hide You must be hidden or invisible to ambush!
  match hide has spotted you!
  match hide You must be hidden first!
  match assess From your place of hiding you can see
  MATCH eng You aren't close enough to attack.
  match assess ...wait  
  MATCH search balanced]
  MATCH search balance]
  MATCH search There is nothing else to face!
  MATCH assess aren't close enough
  MATCH assess ...wait
  MATCH assess Roundtime
  MATCH retreat You are still stunned
  MATCHWAIT
 
SEARCH:
pause .5
put arr cara
pause .5
put arr cara
pause .5
put arr cara
pause .5
put arr cara
pause .5
put skin cara
pause 2
put search cara
pause .5
put stow left
pause .5
goto expstealth
 
EXPSTEALTH:
put exp stealth
match ENDSTEALTH mind lock
match ENDSTEALTH nearly locked
match face EXP HELP for more information
matchwait
 
ENDSTEALTH:
send retr
pause .1
send retr
pause .1
send stow bread
pause .1
 
BABYWEAPONS:
 
 
 
TOWELL:
gosub automove well
SEND Listen Charise
pause .5
SEND Listen Lliselle
pause .5
SEND Listen Darmisk
pause .5
SEND Listen Vandyl
pause .5
SEND teach tm to lliselle
RETURN
 
WEAR:
gosub automove well
SEND STOW sword
pause .5
SEND get bala
pause .5
SEND wear bala
pause .5
SEND get shirt
pause .5
SEND wear shirt
pause .5
SEND get glove
pause .5
SEND wear glov
pause .5
SEND get buckler
pause .5
SEND wear buckler
pause .5
SEND get greav
pause .5
SEND wear greav
pause .5
gosub automove 158

BENE:
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
send prep bene 25
waitfor You feel fully prepared
send cast
 
goto Theurgy
 
 
THEURGY:
put stow right
pause .5
put stow left
pause 5
 
CommuneSense:
var Conduit Ready
var Eluned Ready
var Tasmine Ready
var Truffenyi Ready
var Devotion Normal
send COMMUNE
pause .5
send COMMUNE SENSE
pause 3
if %Devotion = Low then goto LowDevotion
if %Conduit = Closed then goto ConduitClosed
if %Eluned = Ready then goto Eluned
if %Tasmine = Ready then goto Tasmine
if %Truffenyi = Ready then goto Truffenyi
goto CommuneDone
 
Eluned:
if $Theurgy.LearningRate > 25 then goto TheurgyEXP
put stow right
pause .5
put stow left
pause .5
send GET MY VIAL
pause .5
send FORAGE DIRT
pause 5
send GET MY DIRT
waitforre You draw out|You get|You pick up|You are already|What were you
send COMMUNE ELUNED
pause .5
send GET WATER FROM MY VIAL
waitforre You draw out|You get|You pick up|You are already|What were you
put stow right
pause .5
put stow left
pause .5
echo **
echo ** ELUNED DONE
echo **
goto CommuneSense
 
Tasmine:
if $Theurgy.LearningRate > 25 then goto TheurgyEXP
send stow right
pause .5
send stow left
pause .5
send GET MY WATER
waitforre You draw out|You get|You pick up|You are already
pause .5
send SPRINKLE WATER ON Dyminica
pause .5
send COMMUNE tamsine
pause 1
put stow right
pause .5
echo **
echo ** TASMINE DONE
echo **
goto CommuneSense
 
Truffenyi:
if $Theurgy.LearningRate > 16 then goto TheurgyEXP
echo **
echo ** PAUSING 60 SECONDS FOR COMMUNE DELAY
echo **
pause 60
send stow right
pause 1
send stow left
pause 1
send GET MY owl BEAD
waitforre You draw out|You get|You pick up|You are already|What were you
send COMMUNE TRUFF
pause 2
put stow right
pause .5
echo **
echo ** TRUFFENYI DONE
echo **
goto CommuneSense
 
TheurgyEXP:
echo **
echo ** THEURGY FIELD EXP IS TOO HIGH TO DO COMMUNE
echo **
goto CommuneDone
 
ConduitClosed:
echo **
echo ** PLEASE WAIT FOR ANOTHER CONDUIT TO OPEN
echo **
goto CommuneDone
 
LowDevotion:
echo **
echo ** YOUR DEVOTION IS TOO LOW TO CONTINUE
echo **
goto CommuneDone
 
CommuneDone:
RETURN