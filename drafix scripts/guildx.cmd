# guildx.Cmd Scripting done by Bladenight. With help from Swetelove and Severius.
# Alteration of an original script created by Delmax.
# Can contact me at Bladenight@aol.com
# use variable 1 if you know which guild you will be working in
# 1 is for Landing guild
# 2 is for Solhaven guild
# 3 is for Icemule guild
# 4 is for Teras guild
# 5 is for RR guild
# 6 is for Ta'Vaalor Guild
# 7 is for Ta'Illistim Guild
# 8 is for Zul Logoth (Travel only.  Guild not implemented)
#
# Great thanks to Torese for doing so many changes!
#
# Platinum portal travel added by Torese
# Two bugs fixed by Torese
# River Rest Guild travel added by Torese
# Icemule, River Rest, Ta'Vaalor, Ta'Illistim Guild Tasks completed by Torese
# Travel Section overhauled to accomodate ability to travel to
# different locations upon leaving Guild and GS Platinum's Portal System.
#
# Last Updated 11/30/2004
# Version 11302004A
# Old 11042004A
# Wizard Version

ECHO *** USE .guildx help - for HELP / instructions, and other things, regarding the script.
ECHO *** 6th variable does not work for help anymore.
guildstart:
IF_2 put gld StancE off
IF_2 GoTo guildstart%1
IF_1 GoTo guildstart%1
GoTo guildstart_wrong_syntax

guildstart1:
ECHO ** LANDING **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

guildstart2:
ECHO ** SOLHAVEN **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

guildstart3:
ECHO ** ICEMULE **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

guildstart4:
ECHO ** TERAS **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

guildstart5:
ECHO ** RIVER'S REST **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

guildstart6:
ECHO ** TA'VAALOR **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

guildstart7:
ECHO ** TA'ILLISTIM **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax

exit
# Need to switch towns around

#guildstart6:
ECHO ** TA'VAALOR **
ECHO
GoTo notdoneyet

#guildstart8:
ECHO ** Zul Logoth **
ECHO
GoTo notdoneyet

#guildstart8:
ECHO ** TA'ILLISTIM **
ECHO
IF_2 GoTo guildstart%2
GoTo guildstart_wrong_syntax


#New Things - Merge with others
guildstart_wrong_syntax:
ECHO ***
ECHO * You need TWO variables
ECHO * The second variable is the training you wish to do.
ECHO * Options:
ECHO * 1# - Sweep
ECHO * 2# - Subdue
ECHO * 3# - Stun Maneuvers
ECHO * 4# - LockMastery
ECHO * 5# - CheapShot
ECHO * 6# - Rogue Gambits
ECHO *
ECHO * 11 - Sweep Masters
ECHO * 12 - Sweep Dirt - Use for working on any skill (Need to have 1st variable correct)
ECHO * 13 - Dummy Work
ECHO * 14 - Windows Work - Use for working on any skill (Need to have 1st variable correct)
ECHO * 15 - Flower Work - Use for workign on any skill (Need to have 1st variable correct)
ECHO * 16 - Sweep Person
ECHO * 21 - Subdue with Masters
ECHO * 22 - Subdue Garlic
ECHO * 23 - Subdue Melons
ECHO * 31 - Stun Master Work
ECHO * 32 - Stun Slap Start
ECHO * 33 - Stun Arrow Start
ECHO * 34 - Stun Self Shield
ECHO * 35 - Stun Self Weapon
ECHO * 36 - Stun Self  Get
ECHO * 37 - Stun Self  Stand
ECHO * 38 - Stun Self Stance1
ECHO * 39 - Stun Self Attack
ECHO * 310- Stun Self Stance2
ECHO * 311- Stun Self Move
ECHO * 51 - Cheapshot on Masters
ECHO * 52 - Cheapshot on Partner
ECHO * 60 - Rogue Gambits STUDENT -<Being a Student>- New Section
ECHO * 61 - Rogue Gambits TEACH -<Teaching>- New Section
ECHO * 62 - Rogue Gambits SPEED -<Speed>- New Section
ECHO * 63 - Rogue Gambits AUDIENCE -<Audience>- New Section
ECHO * Example .guildx 1 12 - Would train you in Sweep, Sweep Dirt in the Landing Guild
ECHO *
ECHO * Please restart the script with the correct syntax.
ECHO ***
exit

notdoneyet:
ECHO **
ECHO ** This guild is not done yet, come back later **
ECHO **
EXIT

# ******************** SUBDUE ***********************
SUBDUEstartingpoint:
guildstart21:
#Subdue with Masters
ECHO *** Subdue with Masters
wait
ECHO *******************************
ECHO * Uses (% Weapon2) for weapon
ECHO *******************************
SUBDUEstartingpointa:
put GeT my %weapon2
match SUBDUEstartingpointx already have that
match SUBDUEstartingpointx You remove
match SUBDUEstartingpointy could not find
match SUBDUEstartingpointy I do not understand, please rephrase that
match SUBDUEstartingpointyy need a free hand
matchwait

SUBDUEstartingpointy:
ECHO ********************************************************
ECHO * You don't have a %weapon2 available
ECHO * Script uses variable (% weapon2) for the weapon type
ECHO * If you need help with variables, tyep .guildx help
ECHO * Restart once you have that fixed
ECHO ********************************************************
exit

SUBDUEstartingpointyy:
ECHO **********************************************
ECHO * You need a free hand
ECHO * Free up your right hand and GLANCE to start
ECHO **********************************************
waitfor You glance
GoTo SUBDUEstartingpointa

SUBDUEstartingpointx:
#counter set 100051
#GoTo locationfinder
put LooK
match SUBDUEsmile A Dark Corner
match SUBDUEsmile This dark corner is far enough away from the bustle
match SUBDUEogdin Master Footpad Ogdin
match SUBDUEvarant Master Footpad Varant
match SUBDUEtriaholly Master Footpad Triaholly
match SUBDUEsneck Master Footpad Sneck
match SUBDUEjimik Master Footpad Jimik
match SUBDUEfaldes Master Footpad Faldes
match SUBDUEherit Master Footpad Herit
match SUBDUEgludac Master Footpad Gludac
match SUBDUElagick Master Footpad Lagick
match SUBDUEzardak Master Footpad Zardak
match SUBDUEmiller Master Footpad Miller
match SUBDUEmurphy Master Footpad Murphy
match SUBDUEo'toole Master Footpad O'Toole
match SUBDUEreilly Master Footpad Reilly
match SUBDUEbean Master Footpad Bean
match SUBDUEhoulihan Master Footpad Houlihan
match SUBDUEharith Master Footpad Harith
match SUBDUEjafar Master Footpad Jafar
match SUBDUEmubarak Master Footpad Mubarak
match SUBDUEselima Master Footpad Selima
match SUBDUEritchie Master Footpad Ritchie
match SUBDUEpurkhiser Master Footpad Purkhiser
match SUBDUEcolvin Master Footpad Colvin
match SUBDUEvigil Master Footpad Vigil
match RIVERCourtyardSUBDUE Training Administrator Maliq
match SolhavenCourtyardSUBDUE Training Administrator Milgrew
match TerasCourtyardSUBDUE Training Administrator Runaire
match LandingCourtyardSUBDUE Training Administrator DeLuca
match Illistim_Courtyard_Subdue Training Administrator Boucher
matchwait


Illistim_Courtyard_Subdue:
move n
move e
move go staircase
move e
move e
move e
move s
move s
move s
put go staircase
GoTo MasterroomSUBDUE

RIVERCourtyardSUBDUE:
put ne
GoTo MasterroomSUBDUE

SolhavenCourtyardSUBDUE:
move w
move climb stairs
put e
GoTo MasterroomSUBDUE

TerasCourtyardSUBDUE:
move e
move sw
put w
GoTo MasterroomSUBDUE

LandingCourtyardSUBDUE:
put ne
GoTo MasterroomSUBDUE

MasterroomSUBDUE:
match SUBDUEogdin Master Footpad Ogdin
match SUBDUEvarant Master Footpad Varant
match SUBDUEtriaholly Master Footpad Triaholly
match SUBDUEsneck Master Footpad Sneck
match SUBDUEogdin Master Footpad Ogdin
match SUBDUEvarant Master Footpad Varant
match SUBDUEtriaholly Master Footpad Triaholly
match SUBDUEsneck Master Footpad Sneck
match SUBDUEjimik Master Footpad Jimik
match SUBDUEfaldes Master Footpad Faldes
match SUBDUEherit Master Footpad Herit
match SUBDUEgludac Master Footpad Gludac
match SUBDUElagick Master Footpad Lagick
match SUBDUEzardak Master Footpad Zardak
match SUBDUEmiller Miller
match SUBDUEmurphy Murphy
match SUBDUEo'toole O'Toole
match SUBDUEreilly Reilly
match SUBDUEbean Bean
match SUBDUEhoulihan Houlihan
match SUBDUEharith Master Footpad Harith
match SUBDUEjafar Master Footpad Jafar
match SUBDUEmubarak Master Footpad Mubarak
match SUBDUEselima Master Footpad Selima
match SUBDUEritchie Master Footpad Ritchie
match SUBDUEpurkhiser Master Footpad Purkhiser
match SUBDUEcolvin Master Footpad Colvin
match SUBDUEvigil Master Footpad Vigil
matchwait

SUBDUEvarant:
save Varant
put ask %s about train subdue
GoTo startsubdue

SUBDUEtriaholly:
save Triaholly
put ask %s about train subdue
GoTo startsubdue

SUBDUEsneck:
save Sneck
put ask %s about train subdue
GoTo startsubdue

SUBDUEogdin:
save Ogdin
put ask %s about train subdue
GoTo startsubdue

SUBDUEzardak:
save Zardak
put ask %s about train subdue
GoTo startsubdue

SUBDUElagick:
save Lagick
put ask %s about train subdue
GoTo startsubdue

SUBDUEgludac:
save Gludac
put ask %s about train subdue
GoTo startsubdue

SUBDUEherit:
save Herit
put ask %s about train subdue
GoTo startsubdue

SUBDUEfaldes:
save Faldes
put ask %s about train subdue
GoTo startsubdue

SUBDUEjimik:
save Jimik
put ask %s about train subdue
GoTo startsubdue

SUBDUEmiller:
save Miller
put ask %s about train subdue
GoTo startsubdue

SUBDUEmurphy:
save Murphy
put ask %s about train subdue
GoTo startsubdue

SUBDUEbean:
save Bean
put ask %s about train subdue
GoTo startsubdue

SUBDUEo'toole:
save O'toole
put ask %s about train subdue
GoTo startsubdue

SUBDUEReilly:
save Reilly
put ask %s about train subdue
GoTo startsubdue

SUBDUEHoulihan:
save Houlihan
put ask %s about train subdue
GoTo startsubdue

SUBDUEharith:
save Harith
put ask %s about train subdue
GoTo startsubdue

SUBDUEjafar:
save Jafar
put ask %s about train subdue
GoTo startsubdue

SUBDUEmubarak:
save Mubarak
put ask %s about train subdue
GoTo startsubdue

SUBDUEselima:
save Selima
put ask %s about train subdue
GoTo startsubdue

#*** Illistim Subdue Masters ***

SUBDUEritchie:
save Ritchie
put ask %s about train subdue
GoTo startsubdue

SUBDUEpurkhiser:
save Purkhiser
put ask %s about train subdue
GoTo startsubdue

SUBDUEcolvin:
save Colvin
put ask %s about train subdue
GoTo startsubdue

SUBDUEvigil:
save Vigil
put ask %s about train subdue
GoTo startsubdue

100051:
startsubdue:
SUBDUEsmile:
put stance off
wait
put nod %s
match SUBDUEmasterstart Type SUBDUE mannequin to begin
matchwait

SUBDUEmasterstart:
SUBDUEmannequinmore:
put hide
match SUBDUEmannequinstart You attempt to blend
match SUBDUEmannequinstart A tad paranoid
match SUBDUEmasterstartdoh fail
match SUBDUEmasterstartwait wait
matchwait

SUBDUEmasterstartwait:
SUBDUEmasterstartdoh:
pause
GoTo SUBDUEmasterstart

SUBDUEmannequinstart:
GoTo SUBDUEmannequinstart1

SUBDUEmannequinstart1:
put subdue mannequin
match SUBDUEmannequindone%1 You have completed
match SUBDUEmannequinmore repetition(s) remaining
match SUBDUEmannequinmore FUMBLE
match SUBDUEmannequinmore Rats!
match SUBDUEmannequinmore FAIL
match SUBDUEmannequinmorestand fall
matchwait

SUBDUEmannequinmorestand:
put stand
match SUBDUEmannequinmore You stand
match SUBDUEmannequinmorestand1 wait
match SUBDUEmannequinmorestand1 struggle
matchwait

SUBDUEmannequinmorestand1:
pause
GoTo match SUBDUEmannequinmorestand

SUBDUEmannequindone:
put nod %s
ECHO *** NOW YOU DONE IT!! ***
exit

SUBDUEmannequindone1:
put out
put sw
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

SUBDUEmannequindone2:
put out
move w
move climb stair
move e
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

SUBDUEmannequindone3:
put out
move w
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

SUBDUEmannequindone4:
put out
move e
move ne
move w
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

SUBDUEmannequindone5:
put out
move sw
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

# ******************** END SUBDUE ***********************

# ********************** GARLIC *************************

garlic:
#Subdue Garlic
guildstart22:
ECHO *** Subdue Garlic
wait
ECHO *******************************
ECHO * Uses (% Weapon2) for weapon *
ECHO *******************************
GarlicGettingWeapon:
put GeT my %weapon2
match GarlicAfterWeapon already have
match GarlicAfterWeapon You remove
match GarlicGettingWeaponx wait
match GarlicNoWeapon could not find
matchwait

GarlicGettingWeaponx:
pause
GoTo GarlicGettingWeapon

GarlicAfterWeapon:
put LooK
match LandingGarlic Training Administrator Deluca
match SolhavenGarlic Training Administrator Milgrew
match IcemuleGarlic Training Administrator Teagais
match TerasGarlic Training Administrator Runaire
match RiverRestGarlic Training Administrator Maliq
match Illistim_Garlic Training Administrator Boucher
match GarlicYard Rogue Guild, Kitchen
match GarlicRoom Guild kitchen
matchwait

LandingGarlic:
save 1
move s
move go door
move go kitchen
GoTo GarlicYard

SolhavenGarlic:
save 2
move go door
move sw
move sw
move go door
move go wide arch
move go kitchen
GoTo GarlicYard

IcemuleGarlic:
save 3
move go door
move go stair
move go kitchen
GoTo GarlicYard

TerasGarlic:
save 4
move n
move w
move go kitchen
GoTo GarlicYard

RiverRestGarlic:
save 5
move w
move w
move go kitchen
GoTo GarlicYard

Illistim_Garlic:
save 6
move n
move e
move e
move s
move go arch
move go kitchen
GoTo GarlicYard

GarlicRoom:
move go kitchen
GoTo GarlicYard

GarlicYard:
put LooK block
match GarlicNeedClove A pile of freshly peeled garlic cloves sits nearby
match GarlicGonaDie A fresh, ripe clove of garlic sits neatly
match GarlicFillPot A perfectly smashed clove of garlic lies lovingly
match GarlicNeedClean A horribly mangled clove of garlic
match GarlicYardx wait
matchwait

GarlicYard:
pause 1
GoTo GarlicYard

GarlicGonaDie:
put sub block
match GarlicFillPot It's perfect!
match GarlicCleanDone done with this task
match GarlicCleanDone You have completed
match GarlicGonaDie You manage to miss the clove completely.
match GarlicNeedClean Way too hard!
match GarlicNeedClean Too hard!
match GarlicNeedWeapon need to have a weapon
match GarlicNeedClean You rap the clove smartly
match GarlicFillPot repetition(s) remaining
match GarlicNeedClove You'll need to have a clove of garlic
match GarlicGonaDiex wait
matchwait

GarlicGonaDiex:
pause 1
GoTo GarlicGonaDie

GarlicNeedClean:
put clean block
match GarlicGonaDie There's a clove waiting for you.  Why waste food?
match GarlicNeedClove You clean off the garlic gore
match GarlicNeedCleanx wait
match GarlicNeedClove The block is clean already.
matchwait

GarlicNeedCleanx:
pause 1
GoTo GarlicNeedClean

GarlicFillPot:
put put block in pot
match GarlicNeedClove You tilt the block and the lovingly smashed clove of garlic
match GarlicNeedClove Are you CRAZY?!
match GarlicFillPotx wait
matchwait

GarlicFillPotx:
pause 1
GoTo GarlicFillPot

GarlicNeedClove:
put put clove on block
match GarlicNeedClean You're going to need to CLEAN the block
match GarlicGonaDie You pick out a nice clove
match GarlicGonaDie The block already has a clove on it
match GarlicNeedClovex wait
matchwait

GarlicNeedClovex:
pause 1
GoTo GarlicNeedClove

GarlicNeedWeapon:
put GeT my %weapon2
match GarlicSwap already have
match GarlicGonaDie You remove
match GarlicNeedWeaponx wait
match GarlicNoWeapon could not find
matchwait

GarlicNeedWeaponx:
pause 1
GoTo GarlicNeedWeapon

GarlicSwap:
ECHO *** Make sure your %weapon2 is in your right hand ***
put swap
wait
put glance
match GarlicGonaDie in your right
match GarlicSwap in your left hand
match GarlicSwapx wait
matchwait

GarlicSwapx:
pause 1
GoTo GarlicSwap

GarlicNoWeapon:
ECHO *************************
ECHO * Where is your weapon? *
ECHO * GLANCE when ready      *
ECHO *************************
match GarlicGonaDie You glance
matchwait

GarlicCleanDone:
put put block in pot
match GarlicDone%s You tilt the block and the lovingly smashed clove of garlic
match GarlicDone%s Are you CRAZY?!
match GarlicDoneX wait
matchwait

GarlicDoneX:
pause 1
GoTo GarlicCleanDone

GarlicDone:
put out
match GarlicDone1x A dark, windowless door is set into the stone wall
match GarlicDoneXX Obvious paths
matchwait

GarlicDoneXX:
exit

GarlicDone1:
move out
GarlicDone1x:
move go door
move n
GoTo %1RepCheck


GarlicDone2:
move out
GarlicDone2x:
move go w arch
move go door
move ne
move ne
move go door
GoTo %1RepCheck

GarlicDone3:
move out
GarlicDone3x:
move go stair
move go door
GoTo %1RepCheck

GarlicDone4:
move out
GarlicDone4x:
move e
move s
GoTo %1RepCheck

MannequinDone5:
move out
GarlicDone5x:
move e
move e
GoTo %1RepCheck

GarlicDone6:
move out
move go arch
move n
move w
move w
move s
GoTo Illistim_Rep_Check

# ********************** END GARLIC *************************

# ********************** MELONS *************************
melons:
#Subdue Melons
guildstart23:
ECHO *** Subdue Melons
wait
ECHO *******************************
ECHO * Uses (% Weapon2) for weapon *
ECHO *******************************

MelonNeedWeapon:
put GeT my %weapon2
match MelonAfterWeapon already have
match MelonAfterWeapon You remove
match MelonNoWeapon could not find
match MelonNeedWeaponx wait
match MelonVariable I do not understand, please rephrase that
matchwait

MelonVariable:
ECHO ***
ECHO * Your variable doesn't seem to be setup
ECHO * Please follow the instructions to setup your variables
ECHO *
GoTo guildstartvariables

MelonNeedWeaponx:
pause
GoTo MelonNeedWeapon

MelonAfterWeapon:
put LooK
match TerasMelon Training Administrator Runaire
match LandingMelon Training Administrator Deluca
match SolhavenMelon Training Administrator Milgrew
match IcemuleMelon Training Administrator Teagais
match RiverRestMelon Training Administrator Maliq
match Illistim_Melon Training Administrator Boucher
match MelonYard Rogue Guild, Subdue Training
match MelonRoom subdue training mannequins
matchwait

LandingMelon:
save 1
move nw
move go mannequin
GoTo MelonYard

SolhavenMelon:
save 2
move w
move go mannequin
GoTo MelonYard

IcemuleMelon:
save 3
move w
move go mannequin
GoTo MelonYard

TerasMelon:
save 4
move n
move ne
move go mannequin
GoTo MelonYard

RiverRestMelon:
save 5
move se
move go mannequin
GoTo MelonYard

Illistim_Melon:
save 6
move n
move e
move go staircase
move e
move e
move e
move s
move s
move s
move go staircase
move w
move go mannequin
GoTo MelonYard

exit

MelonRoom:
move go mannequin
GoTo MelonYard

MelonYard:
put LooK mann
match MannequinNeedMelon Bits of melon gore
match MannequinNeedClean Looks like it could use a new noggin.
match MannequinGonaDie Its placement begs for a good whacking
matchwait

MannequinGonaDie:
put sub mannequin
match MelonNoHide No need to ambush the mannequin.  It's not going anywhere.
match MelonNeedWeapon You need to have a weapon in hand to do that.
match MannequinGonaDie makes a nice percussion noise, but little else
match MannequinNeedClean You need to CLEAN the battered melon off of the mannequin, first.
match MannequinNeedClean repetition(s) remaining
match MannequinNeedClean Your blow causes a deep crack in the melon
match MannequinNeedMelon The mannequin needs a head before you can try to bop it.
match MannequinNeedMelon You're supposed to just DENT the melon
match MannequinKnockUsDown Way too hard!
match MannequinKnockUsDown You'll need to stand up, first
match MannequinNeedCleanDone You have completed
match MannequinGonaDieX wait
matchwait

MannequinGonaDieX:
pause 1
GoTo MannequinGonaDie

MannequinNeedCleanDone:
put clean mann
match MannequinDone%s You pull off the remaining melon bits
match MannequinDone%s The melon head is ready for you to continue training.
match MannequinNeedCleanDoneX wait
matchwait

MannequinNeedCleanDoneX:
pause 1
GoTo MannequinNeedCleanDone


MannequinNeedClean:
put clean mann
match MannequinNeedMelon You pull off the remaining melon bits
match MannequinNeedMelon The melon head is ready for you to continue training.
match MannequinNeedCleanX wait
matchwait

MannequinNeedCleanX:
pause 1
GoTo MannequinNeedClean

MannequinNeedMelon:
put put melon on mannequin
match MannequinNeedClean You're going to need to CLEAN the mannequin
match MannequinGonaDie pick out a nice melon and place it on the mannequin's spiked neck
match MannequinGonaDie The mannequin already has a head.
match MannequinNeedMelonX wait
matchwait

MannequinNeedMelonX:
pause 1
GoTo MannequinNeedMelon

MannequinKnockUsDown:
put stand
match MannequinNeedMelon You stand back up
match MannequinStance1 struggle
match MannequinKnockUsDownX wait
matchwait

MannequinKnockUsDownX:
pause 1
GoTo MannequinKnockUsDown

MannequinStance1:
put stance off
match MannequinKnockUsDown offensive stance
match MannequinStance1X wait
matchwait

MannequinStance1X:
pause 1
GoTo MannequinStance1

MelonNeedWeapon:
put GeT my %weapon2
match MelonSwap already have
match MannequinGonaDie You remove
match MelonNoWeapon could not find
matchwait

MelonNoHide:
ECHO * What are you doing in the shadows?? *
put unhide
GoTo MannequinGonaDie

MelonSwap:
ECHO *** Make sure your %weapon2 is in your right hand ***
put swap
wait
put glance
match MannequinGonaDie in your right
match MelonSwap in your left hand
matchwait

MelonNoWeapon:
ECHO *************************
ECHO * Where is your weapon? *
ECHO * GLANCE when ready      *
ECHO *************************
match MannequinGonaDie You glance
matchwait

MannequinDone:
put out
match MannequinDone1x An old fountain is set into the stone wall
match MannequinDoneX Obvious paths
matchwait

MannequinDoneX:
exit

MannequinDone1:
move out
MannequinDone1x:
move se
GoTo %1RepCheck


MannequinDone2:
move out
MannequinDone2x:
move e
GoTo %1RepCheck

MannequinDone3:
move out
MannequinDone3x:
move e
GoTo %1RepCheck

MannequinDone4:
move out
MannequinDone4x:
move sw
move s
GoTo %1RepCheck

MannequinDone5:
move out
MannequinDone5x:
move sw
GoTo %1RepCheck

MannequinDone6:
move out
move e
move go staircase
move n
move n
move n
move w
move w
move w
move go staircase
move w
move s
GoTo Illistim_Rep_Check

# ********************** END MELONS *************************

# ********************** SWEEP *************************

sweepmaster:
#Sweep Masters
guildstart11:
ECHO *** Sweep Master
put stance def
wait
GoTo SweepMaster%1
#Landing 1
SweepMaster1:
put LooK
match SweepMasterStance A Dark Corner
match LandingSweep Rogue Guild, Courtyard Center
match Sweepmiller Master Footpad Miller
match Sweepmurphy Master Footpad Murphy
match Sweepo'toole Master Footpad O'Toole
match Sweepreilly Master Footpad Reilly
match Sweepbean Master Footpad Bean
match Sweephoulihan Master Footpad Houlihan
matchwait

#Solhaven 2
SweepMaster2:
put LooK
match SweepMasterStance A Dark Corner
match SolhavenSweep Training Administrator Milgrew
match Sweepogdin Master Footpad Ogdin
match Sweepvarant Master Footpad Varant
match Sweeptriaholly Master Footpad Triaholly
match Sweepsneck Master Footpad Sneck
matchwait

#Icemule 3
SweepMaster3:
put LooK
match SweepMasterStance A Dark Corner
match IcemuleSweep Training Administrator Teagais
match Sweeptruaz Master Footpad Truaz
match Sweepcuip Master Footpad Cuip
match Sweepbuchara Master Footpad Buchara
#Icemule 3a
match SweepMasterStance A Dark Corner
match sweepDUCHEL Master Footpad Duchel
match sweepPALDER Master Footpad Palder
match sweepMEALLAN Master Footpad Meallan
matchwait

#Teras 4
SweepMaster4:
put LooK
match SweepMasterStance A Dark Corner
match TerasdSweep Training Administrator Runaire
match Sweepjimik Master Footpad Jimik
match Sweepfaldes Master Footpad Faldes
match Sweepherit Master Footpad Herit
match Sweepgludac Master Footpad Gludac
match Sweeplagick Master Footpad Lagick
match Sweepzardak Master Footpad Zardak
matchwait

#River Rest 5
#New
SweepMaster5:
put LooK
SweepMasterRest:
match SweepMasterStance A Dark Corner
match RiverRestSweep Training Administrator Maliq
match SweepMasterStance A Dark Corner
match SweepMubarak Master Footpad Mubarak
match Sweepjafar Master Foopad Jafar
match Sweepharith Master Foopad Harith
match Sweepselima Master Foopad Selima
matchwait

#Ta'Vaalor 6
SweepMaster6:
#New
put LooK
SweepMasterVaalor:
match VaalorSweep Training Administrator Flyndar
match SweepMasterStance A Dark Corner
match Sweeptamis Master Footpad Tamis
match Sweepdaranth Master Footpad Daranth
match Sweepsynelle Master Footpad Synelle
match Sweeppyll Master Footpad Pyll
match Sweepylldryll Master Footpad Ylldryll
match Sweeparynnor Master Footpad Arynnor
matchwait

#Ta'Illistim 7
SweepMaster7:
#New
put LooK
SweepMasterIllistim:
match IllistimSweep Training Administrator Boucher
match SweepMasterStance A Dark Corner
match SweepRitchie Master Footpad Ritchie
match SweepVigil Master Footpad Vigil
match SweepPurkhiser Master Footpad Purkhiser
match SweepColvin Master Footpad Colvin
matchwait

SweepMaster8:
GoTo notdoneyet

# **** End SweepMaster Start ***

#Ta'Illistim 7

IllistimSweep:
move north
move east
move go stair
move east
move east
move east
move south
move south
move south
move go stair
move north
GoTo SweepMasterIllistim

SweepRitchie:
save Ritchie
put ask %s about train sweep
GoTo SweepMasterStart

SweepVigil:
save Vigil
put ask %s about train sweep
GoTo SweepMasterStart

SweepPurkhiser:
save Purkhiser
put ask %s about train sweep
GoTo SweepMasterStart

SweepColvin:
save Colvin
put ask %s about train sweep
GoTo SweepMasterStart

#Ta'Vaalor 6
VaalorSweep:
move out
move west
move go panel
move southwest
move up
GoTo SweepMasterVaalor

Sweeptamis:
save Tamis
put ask %s about train sweep
GoTo SweepMasterStart

Sweepdaranth:
save Daranth
put ask %s about train sweep
GoTo SweepMasterStart

Sweepsynelle:
save Synelle
put ask %s about train sweep
GoTo SweepMasterStart

Sweeppyll:
save Pyll
put ask %s about train sweep
GoTo SweepMasterStart

Sweepylldryll:
save Ylldryll
put ask %s about train sweep
GoTo SweepMasterStart

Sweeparynnor:
save Arynnor
put ask %s about train sweep
GoTo SweepMasterStart


# River Rest 5
RiverRestSweep:
move northeast
GoTo SweepMasterRest

Sweepmubarak:
save Mubarak
put ask %s about train sweep
GoTo SweepMasterStart

Sweepjafar:
save Jafar
put ask %s about train sweep
GoTo SweepMasterStart

Sweepharith:
save Harith
put ask %s about train sweep
GoTo SweepMasterStart

Sweepselima:
save Selima
put ask %s about train sweep
GoTo SweepMasterStart

IcemuleSweep:
put w
GoTo sweepmasters

SolhavenSweep:
move w
move climb stairs
put e
GoTo MasterRoomSweep

TerasdSweep:
move e
move sw
put w
GoTo MasterRoomSweep

LandingSweep:
put ne
GoTo MasterRoomSweep

MasterRoomSweep:
#Landing 1
match Sweepmiller Master Footpad Miller
match Sweepmurphy Master Footpad Murphy
match Sweepo'toole Master Footpad O'Toole
match Sweepreilly Master Footpad Reilly
match Sweepbean Master Footpad Bean
match Sweephoulihan Master Footpad Houlihan
#Solhaven 2
match Sweepogdin Master Footpad Ogdin
match Sweepvarant Master Footpad Varant
match Sweeptriaholly Master Footpad Triaholly
match Sweepsneck Master Footpad Sneck
#????
match Sweeptruaz Master Footpad Truaz
match Sweepcuip Master Footpad Cuip
match Sweepbuchara Master Footpad Buchara
#Teras 4
match Sweepjimik Master Footpad Jimik
match Sweepfaldes Master Footpad Faldes
match Sweepherit Master Footpad Herit
match Sweepgludac Master Footpad Gludac
match Sweeplagick Master Footpad Lagick
match Sweepzardak Master Footpad Zardak
#Icemule 3
match sweepDUCHEL Master Footpad Duchel
match sweepPALDER Master Footpad Palder
match sweepMEALLAN Master Footpad Meallan
matchwait

#Landing 1
Sweepmiller:
save Miller
put ask %s about train sweep
GoTo SweepMasterStart

Sweepmurphy:
save Murphy
put ask %s about train sweep
GoTo SweepMasterStart

Sweepo'toole:
save O'Toole
put ask %s about train sweep
GoTo SweepMasterStart

Sweepreilly:
save Reilly
put ask %s about train sweep
GoTo SweepMasterStart

Sweepbean:
save Bean
put ask %s about train sweep
GoTo SweepMasterStart

Sweephoulihan:
save Houlihan
put ask %s about train sweep
GoTo SweepMasterStart

#Solhaven 2
Sweepogdin:
save Ogdin
put ask %s about train sweep
GoTo SweepMasterStart

Sweepvarant:
save Varant
put ask %s about train sweep
GoTo SweepMasterStart

Sweeptriaholly:
save Triaholly
put ask %s about train sweep
GoTo SweepMasterStart

Sweepsneck:
save Sneck
put ask %s about train sweep
GoTo SweepMasterStart

#Icemule 3
sweepDUCHEL:
save Duchel
put ask %s about train sweep
GoTo SweepMasterStart

sweepPALDER:
save Palder
put ask %s about train sweep
GoTo SweepMasterStart

sweepMEALLAN:
save Meallan
put ask %s about train sweep
GoTo SweepMasterStart


#????
Sweeptruaz:
save Truaz
put ask %s about train sweep
GoTo SweepMasterStart

Sweepcuip:
save Cuip
put ask %s about train sweep
GoTo SweepMasterStart

Sweepbuchara:
save Buchara
put ask %s about train sweep
GoTo SweepMasterStart

#Teras 4
Sweepjimik:
save Jimik
put ask %s about train sweep
GoTo SweepMasterStart

Sweepfaldes:
save Faldes
put ask %s about train sweep
GoTo SweepMasterStart

Sweepherit:
save Herit
put ask %s about train sweep
GoTo SweepMasterStart

Sweepgludac:
save Gludac
put ask %s about train sweep
GoTo SweepMasterStart

Sweeplagick:
save Lagick
put ask %s about train sweep
GoTo SweepMasterStart

Sweepzardak:
save Zardak
put ask %s about train sweep
GoTo SweepMasterStart

SweepMasterStart:
ECHO *****************************************************
ECHO *** Type GLANCE to start sweeping them if it hangs ***
ECHO *****************************************************
match SweepMasterPatience let me show you dis sweep thing
match SweepMasterStance you try on me
match SweepMasterStance You glance
match SweepMasterStance You do da sweep thing all right
match SweepMasterStance while I try to sweep you
match SweepMasterStance Now I won't hold back so much
matchwait

SweepMasterPatience:
put stance def
match SweepMasterPatience1 I'll show yas again
match SweepMasterPatiencex now you try on me
matchwait

SweepMasterPatience1:
put stance off
match SweepMasterWait wait
match SweepMasterPatience2 offensive stance
matchwait

SweepMasterWait:
pause 1
GoTo SweepMasterPatience1

SweepMasterPatience2:
put stand
match SweepMasterPatience2pause You struggle, but fail to stand
match SweepMasterPatience2pause .wait
match SweepMasterPatience are already standing
match SweepMasterPatience You stand back
match SweepMasterWait wait
matchwait

SweepMasterPatience2pause:
pause
goto SweepMasterPatience2

SweepMasterStance:
put stance off
match SweepMasterSweepThem offensive stance
match SweepMasterWait1 wait
matchwait

SweepMasterWait1:
pause 1
GoTo SweepMasterStance

SweepMasterSweepThem:
put sweep %s
match SweepMasterSweepThem Failed!
match SweepMasterSweepThem You stumble back on your feet.
match SweepMasterSweepThem repetition(s) remaining.
match SweepMasterProne is already prone.
match SweepMasterProne is not standing.
match SweepMasterStance crouch and sweep a leg at
match SweepMasterStand You might have better luck if you stood up.
match SweepMasterStand You might want to stand up first.
match SweepMasterDone You have completed your training task
match SweepMasterPatience hasn't instructed you to do that yet
match SweepMasterWait2 wait
matchwait

SweepMasterPatience:
ECHO ***
ECHO * Type GLANCE when it's your turn to sweep if the script doesn't auto do it.
ECHO ***
match SweepMasterSweepThem You glance
match SweepMasterSweepThem You glance
match SweepMasterSweepThem You glance
matchwait

SweepMasterProne:
ECHO ***
ECHO * Type GLANCE if the script hangs and you need to sweep the master.
ECHO ***
match SweepMasterStand You fall to the ground!
match SweepMasterSweepThem "Up, up, up!"
match SweepMasterSweepThem stands upright
match SweepMasterSweepThem stands back up.
match SweepMasterSweepThem swings a practice
match SweepMasterSweepThem You glance
matchwait


SweepMasterWait2:
pause 1
GoTo SweepMasterSweepThem

SweepMasterPatiencex:
put stance off
match SweepMasterStand offensive stance
match SweepMasterWait3 wait
matchwait

SweepMasterWait3:
pause 1
GoTo SweepMasterPatiencex

SweepMasterStand:
put stand
match SweepMasterStandpause You struggle, but fail to stand
match SweepMasterStandpause .wait
match SweepMasterSweepThem are already standing
match SweepMasterSweepThem You stand back
match SweepMasterWait4 wait
matchwait

SweepMasterStandpause:
pause
GoTo SweepMasterStand

SweepMasterWait4:
pause 1
GoTo SweepMasterStand

SweepMasterDone:
pause
move out
GoTo SweepMasterDone%1

SweepMasterDoneLanding:
SweepMasterDone1:
move southwest
GoTo %1RepCheck

SweepMasterDoneSolhaven:
SweepMasterDone2:
move west
move climb stairs
move east
GoTo %1RepCheck

SweepMasterDoneIcemule:
SweepMasterDone3:
put LooK
match SweepMasterDone3A West Courtyard
match SweepMasterDone3B East Courtyard
matchwait

SweepMasterDoneIcemule3A:
SweepMasterDone3A:
move east
GoTo %1RepCheck

SweepMasterDoneIcemule3B:
SweepMasterDone3B:
move west
GoTo %1RepCheck

SweepMasterDoneTeras:
SweepMasterDone4:
move east
move northeast
move west
GoTo %1RepCheck

SweepMasterDoneRest:
SweepMasterDone5:
move northwest
GoTo %1RepCheck

SweepMasterDoneVaalor:
SweepMasterDone6:
move down
move northeast
move climb ladder
move east
move north
GoTo %1RepCheck

SweepMasterDoneIllistim:
SweepMasterDone7:
move south
move go stair
move north
move north
move north
move west
move west
move west
move go stair
move west
move south
GoTo %1RepCheck

# ********************** END SWEEP *************************

# ********************** DUMMY *************************

# 1 Landing (done)
# 2 Solhaven (done)
# 3 Icemule
# 4 Teras
# 5 River Rest
# 6 Ta'Illistim

dummies:
ECHO *** Dummy Work
guildstart13:
put LooK
match DUMMYfix Rogue Guild, Sweep Training
#New Verbs
match LandingDummyStart Training Administrator DeLuca
match SolhavenDummyStart Training Administrator Milgrew
match IcemuleDummyStart Training Administrator Teagais
match TerasDummyStart Training Administrator Runaire
match RiverRestDummyStart Training Administrator Maliq
match VaalorDummyStart Training Administrator Flyndar
match IllistimDummyStart Training Administrator Boucher
match Dummy_False_Start obvious paths
match Dummy_False_Start Obvious exits
matchwait

Dummy_False_Start:
ECHO ***
ECHO * You need to be either at the courtyard or in the dummy training grounds
ECHO ***
exit

LandingDummyStart:
move nw
GoTo DUMMYstart

SolhavenDummyStart:
move w
move climb stair
GoTo DUMMYstart

IcemuleDummyStart:
move e
GoTo DUMMYstart

TerasDummyStart:
move e
GoTo DUMMYstart

RiverRestDummyStart:
move se
GoTo DUMMYstart

VaalorDummyStart:
move out
move west
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
GoTo DummyStart

IllistimDummyStart:
move n
move e
move go staircase
move e
move e
move e
move s
move s
move s
move go staircase
move s
GoTo DUMMYstart

DUMMYstart:
put go dumm
waitfor Sweep Training
GoTo DUMMYfix

DUMMYfix:
match kickdum back onto its post
match kickdum working condition
match dummyfix ...wait
match dummyfix Sorry,
put fix dummy
matchwait
kickdum:
put kick dummy
GoTo DUMMYmain

DUMMYpush:
put PusH dummy
GoTo DUMMYmain

DUMMYpull:
put pull dummy
GoTo DUMMYmain

DUMMYmain:
pause
put sweep dummy
match DUMMYdone You're done with this task for now
match DUMMYdone You have completed your training task
match DUMMYkick repetition(s) remaining
match DUMMYkick You crouch and sweep a leg
match DUMMYfix You used a bit too much force
match DUMMYpush The dummy is swinging back and forth
match DUMMYpull but fail to flip it over
matchwait


DUMMYkick:
pause
put kick dummy
GoTo DUMMYmain
# You reach out and stop the dummy from rocking

DUMMYdone:
pause
put kick dummy
wait
move out
GoTo DummyDone%1

DummyDoneLanding:
DummyDone1:
move se
GoTo %1RepCheck
exit

DummyDoneSolhaven:
DummyDone2:
move climb stair
move e
GoTo %1RepCheck

DummyDoneIcemule:
DummyDone3:
move w
GoTo %1RepCheck

DummyDoneTeras:
DummyDone4:
move w
GoTo %1RepCheck

DummyDoneRest:
DummyDone5:
move nw
GoTo %1RepCheck

DummyDoneVaalor:
DummyDone6:
move north
move north
move north
move go trapdoor
move down
move northeast
move climb ladder
move east
move north
GoTo %1RepCheck

DummyDoneIllistim:
DummyDone7:
move north
move go stair
move north
move north
move north
move west
move west
move west
move go stair
move west
move south
GoTo %1RepCheck

# ********************** END DUMMY *************************

# ******************** WINDOW ***********************
# 1, 2, 4, and 5 done.

#wINDOWS wORK
windows:
guildstart14:
ECHO *** Windows
GoTo Windows%1

WindowsLanding:
Windows1:
pause 2
put LooK
match LandingWindow Training Administrator DeLuca
match LandingWindowRack Rogue Guild, Basement Storage
matchwait

WindowsSolhaven:
Windows2:
wait
put LooK
match SolhavenWindow Training Administrator Milgrew
match SolhavenWindowRag Rogue Guild, Pantry
matchwait

WindowsIcemule:
Windows3:
wait
put LooK
match IcemuleWindow Training Administrator Teagais
match IcemuleWindowRag Rogue Guild, Storage Cellar
matchwait

WindowsTeras:
Windows4:
wait
put LooK
match TerasWindow Training Administrator Runaire
match TerasWindowRack Storage Room
matchwait

WindowsRest:
Windows5:
wait
put LooK
match RiverWindow Training Administrator Maliq
match RiverWindowRag Rogue Guild, Storage Closet
matchwait

WindowsVaalor:
Windows6:
wait
put LooK
match VaalorWindow Training Adminstrator Flyndar
match VaalorWindowRag Warehouse
matchwait

WindowsIllistim:
Windows7:
wait
put LooK
match IllistimWindow Training Administrator Boucher
match IllistimWindowRag Storage
matchwait

# *** 1 ***
LandingWindow:
move s
move go door
move w
move w
move climb stairs
move e
LandingWindowRack:
put GeT rag
waitfor You pick out a clean soft rag from a tool rack.
move w
move climb stairs
move e
move e
move go door
move w
move n
save Landingwindow
counter set 1
GoTo GuildRubWIndow

Landingwindownext1:
move s
counter set 2
GoTo GuildRubWIndow

Landingwindownext2:
move go pass
counter set 3
GoTo GuildRubWIndow

Landingwindownext3:
move n
counter set 4
GoTo GuildRubWIndow

Landingwindownext4:
move n
counter set 5
GoTo GuildRubWIndow

Landingwindowdone1:
move s
GoTo Landingwindowdone2

Landingwindowdone4:
move s

Landingwindowdone3:
move go pass
GoTo Landingwindowdone2

Landingwindownext5:
Landingwindowdone5:
move s
move s
move go pass
GoTo Landingwindowdone2

Landingwindowdone2:
move e
move go door
move w
move w
move climb stairs
move e
put put rag on rack
move w
move climb stairs
move e
move e
move go door
move n
GoTo %1RepCheck
exit

# *** END 1 ***

# *** 2 ***

SolhavenWindow:
move go door
move sw
move sw
move go door
move go wide arch
move go curtain
SolhavenWindowRag:
put GeT rag
waitfor You pick out a clean soft rag from a tool rack.
move go curtain
move go arch
move go carved arch
move s
move e
move go arch
move w
save SOLwindow
counter set 0
GoTo GuildRubWIndow

SOLwindownext0:
move e
move go arch
move w
move n
move go arch
move go doors
move e
counter set 1
GoTo GuildRubWIndow

SOLwindownext1:
pause 1
move nw
move nw
counter set 2
GoTo GuildRubWIndow

SOLwindownext2:
pause 1
move e
move go door
counter set 3
GoTo GuildRubWIndow

SOLwindownext3:
move w
move climb stair
counter set 4
GoTo GuildRubWIndow

SOLwindownext4:
SOLwindowdone4:
move climb stair
move e
GoTo SOLwindowdone4x

SOLwindowdone4x:
SOLwindowdone3:
move go door
move sw
move sw
GoTo SOLwindowdone3x

SOLwindowdone2:
move s
GoTo SOLwindowdone2X

SOLwindowdone0:
move e
move go arch
move w
move n
move go arch
GoTo SOLwindowdoneX

SOLwindowdone1:
move w
SOLwindowdone2x:
SOLwindowdone3x:
move go doors
SOLwindowdoneX:
move go wide arch
move go curtain
put put rag on rack
wait
move go curtain
move go wide arch
move go doors
move ne
move ne
move go door
GoTo %1RepCheck
exit

# *** END 2 ***

# *** 3 ***

IcemuleWindow:
move go door
move go stairs
IcemuleWindowRag:
put get rag from rack
waitfor You pick out a clean soft rag from a tool rack.
move go stair
move go door
move west
move go door
move north
move go curtain
save IcemuleWindow
counter set 0
GoTo GuildRubWIndow

IcemuleWindowNext0:
move go curtain
move south
counter set 1
GoTo GuildRubWIndow

IcemuleWindowNext1:
move go door
counter set 2
GoTo GuildRubWIndow

IcemuleWindowNext2:
move east
move east
counter set 3
GoTo GuildRubWIndow

IcemuleWindowNext3:
move south
counter set 4
GoTo GuildRubWIndow

IcemuleWindowNext4:
IcemuleWindowDone4:
move north
IcemuleWindowDone3:
move west
IcemuleWindowDone4:
move go door
move go stair
put put rag on rack
move go stair
move go door
GoTo %1RepCheck

IcemuleWindowDone0:
move go curtain
move south
IcemuleWindowDone1:
move go door
IcemuleWindowDone2:
move east
GoTo %1RepCheck

# *** END 3 ****

# *** 4 ***

# TERAS guild Windows Start

TerasWindow:
TerasWindows:
move n
move w
move sw
move nw
move w
move ne
move go door
TerasWindowRack:
put GeT rag
waitfor You pick out a clean soft rag from a tool rack.
save TERASwindow
counter set 0
GoTo GuildRubWIndow

TERASwindownext0:
move out
move e
counter set 1
GoTo GuildRubWIndow

TERASwindownext1:
move w
move sw
move s
move w
move nw
counter set 2
GoTo GuildRubWIndow

TERASwindownext2:
move se
move e
move n
move e
move se
move se
move s
counter set 3
GoTo GuildRubWIndow

TERASwindownext3:
move n
move e
move ne
move ne
move go arch
counter set 4
GoTo GuildRubWIndow

TERASwindownext4:
TERASwindowdone4:
move go arch
move nw
move sw
move w
move sw
GoTo TERASwindowdone3x

TERASwindowdone3:
move n
move nw
TERASwindowdone3x:
move nw
move w
GoTo TERASwindowdone2x

TERASwindowdone2:
move se
move e
move n
TERASwindowdone2x:
move ne
GoTo TERASwindowdone1x

TERASwindowdone1:
move w
TERASwindowdone1x:
move go door
TERASwindowdone0:
put put rag on rack
wait
move out
move sw
move e
move se
move ne
move e
move s
GoTo %1RepCheck


# *** END 4 WINDOW ***

# *** 5 WINDOW ***
RiverWindow:
move w
move w
move s
move w
RiverWindowRack:
put GeT rag
waitfor You pick out a clean soft rag from a tool rack.
move e
save RIVERwindow
counter set 1
GoTo GuildRubWIndow

RIVERwindownext1:
move s
counter set 2
GoTo GuildRubWIndow

RIVERwindownext2:
move n
move n
counter set 3
GoTo GuildRubWIndow

RIVERwindownext3:
move e
move n
counter set 4
GoTo GuildRubWIndow

RIVERwindownext4:
move e
counter set 5
GoTo GuildRubWIndow

RIVERwindownext5:
move go door
counter set 6
GoTo GuildRubWIndow

RIVERwindownext6:
RIVERwindowdone6:
move go door
GoTo RIVERwindowdone5

RIVERwindowdone5:
move w
GoTo RIVERwindowdone4

RIVERwindowdone4:
move s
move w
GoTo RIVERwindowdone3

RIVERwindowdone3:
move s
GoTo RIVERwindowdone1

RIVERwindowdone2:
move n
GoTo RIVERwindowdone1

RIVERwindowdone1:
move w
put put rag on rack
move e
move n
move e
move e
GoTo %1RepCheck

# *** END 5 WINDOW ***

# *** 6 windows ***

VaalorWindow:
move out
move west
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
move go staircase
move north
move west
VaalorWindowRag:
put get rag
waitfor You pick out a clean soft rag from a tool rack.
move east
move climb rope
move east
move east
move go plank
move south
move climb ladder
move north
move east
move east
move east
save VaalorWindow
counter set 0
GoTo GuildRubWIndow

VaalorWindowNext0:
move west
counter set 1
GoTo GuildRubWIndow

VaalorWindowNext1:
move west
move west
counter set 2
GoTo GuildRubWIndow

VaalorWindowNext2:
move east
move south
counter set 3
GoTo GuildRubWIndow

VaalorWindowNext3:
move south
counter set 4
GoTo GuildRubWIndow

VaalorWindowNext4:
move south
counter set 5
GoTo GuildRubWIndow

VaalorWindowNext5:
move south
counter set 6
GoTo GuildRubWIndow

VaalorWindowDone2:
move east
move south
GoTo VaalorWindowDone3

VaalorWindowDone0:
move west
VaalorWindowDone1:
move west
move south
GoTo VaalorWindowDone3

VaalorWindowDone6:
move north
VaalorWindowDone5:
move north
VaalorWindowDone4:
move north
VaalorWindowDone3:
move climb ladder
move north
move go plank
move west
move go trapdoor
move west
put put rag on rack
move east
move south
move go staircase
move down
move northeast
move climb ladder
move east
move north
GoTo %1RepCheck

# *** 6 END ****

IllistimWindow:
move n
move e
move go staircase
move e
move e
move e
move s
move s
move s
move go staircase
move w
IllistimWindowRag:
put GeT rag
waitfor You pick out a clean soft rag from a tool rack.
move e
move go staircase
move w
move s
Illistim_windows1:
save Illistim_windows
counter set 1
GoTo GuildRubWIndow

Illistim_windowsnext1:
move n
move w
Illistim_windows2:
counter set 2
GoTo GuildRubWIndow

Illistim_windowsnext2:
move e
move e
move n
Illistim_windows3:
counter set 3
GoTo GuildRubWIndow

Illistim_windowsnext3:
move n
move n
move w
Illistim_windows4:
counter set 4
GoTo GuildRubWIndow

Illistim_windowsnext4:
move w
move w
move w
Illistim_windows5:
counter set 5
GoTo GuildRubWIndow

Illistim_windowsnext5:
move w
Illistim_windows6:
counter set 6
GoTo GuildRubWIndow

Illistim_windowsnext6:
move e
move e
move go staircase
move e
move s
move s
move w
Illistim_windows7:
counter set 7
GoTo GuildRubWIndow

Illistim_windowsnext7:
save Illistim_windows_not_done
Illistim_windowsdone7:
move e
move n
move n
move w
move go staircase
GoTo Illistim_windowsdone52

Illistim_windowsdone6:
move e
Illistim_windowsdone5:
move e
Illistim_windowsdone52:
move e
move e
Illistim_windowsdone4:
move e
move s
move s
Illistim_windowsdone3:
move s
GoTo Illistim_windowsdone12

Illistim_windowsdone2:
move e
GoTo Illistim_windowsdone13

Illistim_windowsdone1:
move n
Illistim_windowsdone13:
move e
Illistim_windowsdone12:
move go staircase
move w
put put rag on rack
move e
move go staircase
move n
move n
move n
move w
move w
move w
move go staircase
move w
move s
ECHO ***
ECHO * Finished all the windows in the guild
ECHO *
GoTo %s

Illistim_windows_not_done:
ECHO * you are NOT done with your task
ECHO ***
exit

Illistim_windows_done:
ECHO * you are DONE with your task
ECHO ***
GoTo %1RepCheck

# *** end 7 windows ***

GuildRubWIndow:
put rub window
match GuildRubWIndowNext repetition(s) remaining
match GuildRubWIndowNext let someone
match GuildRubWIndowDone You have completed
match GuildRubWIndowDone You don't need to do that just now
match GuildRubWIndowWait wait
matchwait

GuildRubWIndowNext:
pause
GoTo %snext%c

GuildRubWIndowDone:
pause
GoTo %sdone%c



GuildRubWIndowWait:
pause
GoTo GuildRubWIndow


# ******************** END WINDOWS ***********************


# ******************** FLOWERS ***********************
# ******************** PLANTS ***********************

guildstart15:
Flowers:
ECHO *** Water Plants
GoTo Flowers%1

FlowersLanding:
Flowers1:
put LooK
match LandingFlowers Training Administrator DeLuca
match LandingFlowersRack Rogue Guild, Basement Storage
matchwait

FlowersSolhaven:
Flowers2:
put LooK
match SolhavenFlowers Training Administrator Milgrew
match SolhavenFlowersRack Rogue Guild, Pantry
matchwait

FlowersIcemule:
Flowers3:
put LooK
match IcemuleFlowers Training Administrator Teagais
match IcemuleFlowersRack Rogue Guild, Storage Cellar
matchwait

FlowersTeras:
Flowers4:
put LooK
match TerasFlowers Training Administrator Runaire
match TerasFlowersRack Storage Room
matchwait

FlowersRest:
Flowers5:
put LooK
match RiverFlowers Training Administrator Maliq
match RiverFlowersRack Rogue Guild, Storage Closet
matchwait

FlowersVaalor:
Flowers6:
put LooK
match VaalorFlowers Training Administrator Flyndar
match VaalorFlowersRack Warehouse
matchwait

FlowersIllistim:
Flowers7:
put LooK
match IllistimFlowers Training Administrator Boucher
match IllistimFlowersRack Storage
matchwait
# 1 2 and 4 done

# *** 1 Flowers ***

LandingFlowers:
move s
move go door
move w
move w
move climb stairs
move e
LandingFlowersRack:
put GeT can
move w
move climb stairs
waitfor Rogue Guild, Hallway
move e
move e
move go door
put kneel
put water wildflower
match LANDINGflower2  repetition(s) remaining.
match LANDINGflower2 That's enough watering for these wildflowers
match LANDINGstand1 completed
matchwait

LANDINGflower2:
put stand
match LANDINGstand2 You stand
match LANDINGstand2 already
match LANDINGflower2pause You struggle
match LANDINGflower2pause .wait
matchwait

LANDINGflower2pause:
pause
goto LANDINGflower2

LANDINGstand2:
move e
move n
put kneel
put water wildflower
match LANDINGflower3 repetition(s) remaining
match LANDINGflower3 That's enough watering for these wildflowers
match LANDINGdone2 completed
matchwait

LANDINGflower3:
put stand
match LANDINGstand3 You stand
match LANDINGstand3 already
match LANDINGflower3pause You struggle
match LANDINGflower3pause .wait
matchwait

LANDINGflower3pause:
pause
goto LANDINGflower3

LANDINGstand3:
move n
move w
put kneel
put water wildflower
match LANDINGflower4  repetition(s) remaining
match LANDINGflower4 That's enough watering for these wildflowers
match LANDINGdone3 completed
matchwait

LANDINGflower4:
put stand
match LANDINGstand4 You stand
match LANDINGstand4 already
match LANDINGflower4pause You struggle
match LANDINGflower4pause .wait
matchwait

LANDINGflower4pause:
pause
GoTo LANDINGflower4

LANDINGstand4:
move w
move s
put kneel
put water wildflower
match LANDINGflower5  repetition(s) remaining
match LANDINGflower5 That's enough watering for these wildflowers
match LANDINGdone4 completed
matchwait

LANDINGflower5:
put stand
match LANDINGstand5 You stand
match LANDINGstand5 already
match LANDINGflower5pause You struggle
match LANDINGflower5pause .wait
matchwait

LANDINGflower5pause:
pause
goto LANDINGflower5

LANDINGstand5:
move e
put kneel
put water wildflower
match LANDINGdone5 repetition(s) remaining
match LANDINGdone5 That's enough watering for these wildflowers
match LANDINGdone5 completed
matchwait

LANDINGdone2:
put stand
match LANDINGmove2 You stand
match LANDINGmove2 already
match LANDINGdone2pause You struggle
match LANDINGdone2pause .wait
matchwait

LANDINGdone2pause:
pause
GoTo LANDINGdone2

LANDINGmove2:
move s
move w
GoTo LANDINGdone1

LANDINGdone3:
put stand
match LANDINGmove3 You stand
match LANDINGmove3 already
match LANDINGdone3pause You struggle
match LANDINGdone3pause .wait
matchwait

LANDINGdone3pause:
pause
GoTo LANDINGdone3

LANDINGmove3:
move s
move s
GoTo LANDINGdone1

LANDINGdone4:
put stand
match LANDINGmove4 You stand
match LANDINGmove4 already
match LANDINGdone4pause You struggle
match LANDINGdone4pause .wait
matchwait

LANDINGdone4pause:
pause
goto LANDINGdone4

LANDINGmove4:
move s
move e
GoTo LANDINGdone1

LANDINGdone5:
put stand
match LANDINGmove5 You stand
match LANDINGmove5 already
match LANDINGdone5pause You struggle
match LANDINGdone5pause .wait
matchwait

LANDINGdone5pause:
pause
GoTo LANDINGdone5

LANDINGmove5:
move s
GoTo LANDINGdone1

LANDINGstand1:
put stand
match LANDINGdone1 You stand
match LANDINGdone1 already
match LANDINGstand1pause You struggle
match LANDINGstand1pause .wait
matchwait

LANDINGstand1pause:
pause
goto LANDINGstand1

LANDINGdone1:
move go door
move w
move w
put cli stair
move e
put put can on rack
move w
move climb stair
move e
move e
move go door
move n
GoTo %1RepCheck
exit
# flowerendland

# *** END 1 Flowers ***

# *** 2 Flowers ***

SolhavenFlowers:
move go door
wait
move sw
move sw
move go door
wait
move go wide arch
move go curtain
SolhavenFlowersRack:
put GeT can
wait
move go curtain
move go wide arch
move go door
wait
SOLflower:
put stance off
wait
put kneel
put water roses
match SOLflower1 repetition(s) remaining.
match SOLflower1 That's enough watering for these
match SOLflowerstand1 completed
matchwait

SOLflower1:
put stand
match SOLflower1x You stand
match SOLflower1x already
match SOLflower1pause .wait
match SOLflower1pause You struggle
matchwait

SOLflower1pause:
pause
goto SOLflower1

SOLflower1x:
move n
put kneel
put water irises
match SOLflower2 repetition(s) remaining.
match SOLflower2 That's enough watering for these
match SOLflowerstand2 completed
matchwait

SOLflower2:
put stand
match SOLflower2x You stand
match SOLflower2x already
match SOLflower2pause .wait
match SOLflower2pause You struggle
matchwait

SOLflower2pause:
pause
goto SOLflower2

SOLflower2x:
move se
move se
put kneel
put water wisteria
match SOLflower3 repetition(s) remaining.
match SOLflower3 That's enough watering for these
match SOLflowerstand3 completed
matchwait

SOLflower3:
put stand
match SOLflower3x You stand
match SOLflower3x already
match SOLflower3pause .wait
match SOLflower3pause You struggle
matchwait

SOLflower3pause:
pause
goto SOLflower3

SOLflower3x:
move n
move go door
wait
move w
move climb stair
wait
put kneel
put water begonias
match SOLflower4 repetition(s) remaining.
match SOLflower4 That's enough watering for these
match SOLflowerstand4 completed
matchwait

SOLflower4:
put stand
match SOLflower4x You stand
match SOLflower4x already
match SOLflower4pause .wait
match SOLflower4pause You struggle
matchwait

SOLflower4pause:
pause
goto SOLflower4

SOLflower4x:
move e
put climb tree
wait
move sw
put kneel
put water dandelions
match SOLflower5 repetition(s) remaining.
match SOLflower5 That's enough watering for these
match SOLflowerstand5 completed
matchwait

SOLflower5:
SOLflowerstand5:
put stand
match SOLflower5x You stand
match SOLflower5x already
match SOLflower5pause .wait
match SOLflower5pause You struggle
matchwait

SOLflower5pause:
pause
goto SOLflower5

SOLflower5x:
move ne
put climb tree
wait
move w
GoTo SOLflowerstand4x

SOLflowerstand4:
put stand
match SOLflowerstand4x You stand
match SOLflowerstand4x already
match SOLflowerstand4pause .wait
match SOLflowerstand4pause You struggle
matchwait

SOLflowerstand4pause:
pause
goto SOLflowerstand4

SOLflowerstand4x:
move climb stair
wait
move e
move go door
wait
move s
GoTo SOLflowerstand3x

SOLflowerstand3:
put stand
match SOLflowerstand3x You stand
match SOLflowerstand3x already
match SOLflowerstand3pause .wait
match SOLflowerstand3pause You struggle
matchwait

SOLflowerstand3pause:
pause
goto SOLflowerstand3

SOLflowerstand3x:
move w
GoTo SOLflowerstand1x

SOLflowerstand2:
put stand
match SOLflowerstand2x You stand
match SOLflowerstand2x already
match SOLflowerstand2pause .wait
match SOLflowerstand2pause You struggle
matchwait

SOLflowerstand2pause:
pause
goto SOLflowerstand2

SOLflowerstand2x:
move s
GoTo SOLflowerstand1x

SOLflowerstand1:
put stand
match SOLflowerstand1x You stand
match SOLflowerstand1x already
match SOLflowerstand1pause .wait
match SOLflowerstand1pause You struggle
matchwait

SOLflowerstand1pause:
pause
goto SOLflowerstand1

SOLflowerstand1x:
move go door
move go wide arch
move go curtain
put put my can on rack
wait
move go curtain
move go wide arch
move go door
move ne
move ne
move go door
put stance def
GoTo %1RepCheck
exit

# *** END 2 Flowers ***

# *** 3 ***

IcemuleFlowers:
IcemuleFlowersRack:
GoTo notdoneyet

# *** END ***

# *** 4 Flowers ***

# TERAS guild Flower Start

TerasFlowers:
move n
move w
move sw
move nw
move w
move ne
move go door
TerasFlowersRack:
put GeT can
wait
put stance off
wait
put kneel
put water wildflowers
match TERASflowernext repetition(s) remaining.
match TERASflowernext That's enough watering for these
match TERASflowerdone completed
matchwait

TERASflowernext:
put stand
match TERASflowernextx You stand
match TERASflowernextx already
match TERASflowernextpause .wait
match TERASflowernextpause You struggle
matchwait

TERASflowernextpause:
pause
goto TERASflowernext

TERASflowernextx:
move out
move sw
move e
move se
move se
move s
move se
put kneel
put water wildflowers
match TERASflowernext1 repetition(s) remaining.
match TERASflowernext1 That's enough watering for these
match TERASflowerdone1 completed
matchwait

TERASflowernext1:
put stand
match TERASflowernext1x You stand
match TERASflowernext1x already
match TERASflowernext1pause .wait
match TERASflowernext1pause You struggle
matchwait

TERASflowernext1pause:
pause
goto TERASflowernext1

TERASflowernext1x:
move nw
move n
move e
put kneel
put water wildflowers
match TERASflowernext2 repetition(s) remaining.
match TERASflowernext2 That's enough watering for these
match TERASflowerdone2 completed
matchwait

TERASflowernext2:
put stand
match TERASflowernext2x You stand
match TERASflowernext2x already
match TERASflowernext2pause .wait
match TERASflowernext2pause You struggle
matchwait

TERASflowernext2pause:
pause
goto TERASflowernext2

TERASflowernext2x:
move ne
move ne
move go arch
put kneel
put water wildflowers
match TERASflowernext3 repetition(s) remaining.
match TERASflowernext3 That's enough watering for these
match TERASflowerdone3 completed
matchwait

TERASflowernext3:
put stand
match TERASflowernext3x You stand
match TERASflowernext3x already
match TERASflowernext3pause .wait
match TERASflowernext3pause You struggle
matchwait

TERASflowernext3pause:
pause
goto TERASflowernext3

TERASflowernext3x:
move go arch
move nw
move sw
put kneel
put water wildflowers
match TERASflowernext4 repetition(s) remaining.
match TERASflowernext4 That's enough watering for these
match TERASflowerdone4 completed
matchwait

TERASflowernext4:
TERASflowerdone4:
GoTo TERASflowerdone3x

TERASflowerdone3:
move go arch
move nw
move sw
TERASflowerdone3x:
move w
move sw
GoTo TERASflowerdone1x

TERASflowerdone2:
move w
move nw
GoTo TERASflowerdone1x

TERASflowerdone1:
move nw
move n
move nw
TERASflowerdone1x:
move nw
move w
move ne
move go door
TERASflowerdone:
put put my can on rack
wait
move out
move sw
move e
move se
move ne
move e
move s
put stance def
exit

# *** END 4 Flowers ***

# *** 5 Flowers ***

RiverFlowers:
move west
move west
move south
move west
RiverFlowersRack:
put GeT can from rack
move east
move north
move east
move south
put kneel
match RiverFlowersStand repetition(s) remaining.
match RiverFlowersStand That's enough watering for these
match RiverFlowersDone completed
put water
matchwait

RiverFlowers1:
move east
match RiverFlowersStand1 repetition(s) remaining.
match RiverFlowersStand1 That's enough watering for these
match RiverFlowersDone1 completed
put water
matchwait

RiverFlowers2:
move east
match RiverFlowersStand2 repetition(s) remaining.
match RiverFlowersStand2 That's enough watering for these
match RiverFlowersDone2 completed
put water
matchwait

RiverFlowers3:
move east
match RiverFlowersStand3 repetition(s) remaining.
match RiverFlowersStand3 That's enough watering for these
match RiverFlowersDone3 completed
put water
matchwait

RiverFlowers4:
move east
match RiverFlowersDone4 repetition(s) remaining.
match RiverFlowersDone4 That's enough watering for these
match RiverFlowersDone4 completed
put water
matchwait

RiverFlowersStand:
match RiverFlowers1 You stand
match RiverFlowers1 You are
match RiverFlowersStand You struggle
put stand
matchwait

RiverFlowersStand1:
match RiverFlowers2 You stand
match RiverFlowers2 You are
match RiverFlowersStand1 You struggle
put stand
matchwait

RiverFlowersStand2:
match RiverFlowers3 You stand
match RiverFlowers3 You are
match RiverFlowersStand2 You struggle
put stand
matchwait

RiverFlowersStand3:
match RiverFlowers4 You stand
match RiverFlowers4 You are
match RiverFlowersStand3 You struggle
put stand
matchwait

RiverFlowersDone:
match RiverFlowersDoneA You stand
match RiverFlowersDoneA You are
match RiverFlowersDone You struggle
put stand
matchwait

RiverFlowers2:
match RiverFlowersDone2a You stand
match RiverFlowersDone2a You are
match RiverFlowersDone2 You struggle
put stand
matchwait

RiverFlowersDone3:
match RiverFlowersDone3a You stand
match RiverFlowersDone3a You are
match RiverFlowersDone3 You struggle
put stand
matchwait

RiverFlowersDone4:
match RiverFlowersDone4a You stand
match RiverFlowersDone4a You are
match RiverFlowersDone4 You struggle
put stand
matchwait

RiverFlowersDone2a:
move west
move west
GoTo RiverFlowersDone4a

RiverFlowersDone3a:
move south
GoTo RiverFlowersDone4a

RiverFlowersDone1a:
move west
RiverFlowersDoneA:
move north
RiverFlowersDone4a:
move west
move south
move west
put put my can on rack
move east
move north
move east
move east
GoTo %1RepCheck

# *** END 5 Flowers ***

# *** 6 Flowers ***

VaalorFlowers:
move out
move west
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
move go staircase
move north
move west
VaalorFlowersRack:
put GeT can from rack
move east
move south
move go trapdoor
move north
move north
move north
move go trapdoor
move down
move northeast
move climb ladder
move go door
put kneel
match VaalorFlowersStand repetition(s) remaining.
match VaalorFlowersStand That's enough watering for these
match VaalorFlowersDone completed
put water wildflowers
matchwait

VaalorFlowers1:
move out
match VaalorFlowersStand1 repetition(s) remaining.
match VaalorFlowersStand1 That's enough watering for these
match VaalorFlowersDone1 completed
put water wildflowers
matchwait

VaalorFlowers2:
move east
move north
match VaalorFlowersStand2 repetition(s) remaining.
match VaalorFlowersStand2 That's enough watering for these
match VaalorFlowersDone2 completed
put water wildflowers
matchwait

VaalorFlowers3:
move out
move south
match VaalorFlowersStand3 repetition(s) remaining.
match VaalorFlowersStand3 That's enough watering for these
match VaalorFlowersDone3 completed
put water wildflowers
matchwait

VaalorFlowers4:
move out
move east
move east
match VaalorFlowersDone4 repetition(s) remaining.
match VaalorFlowersDone4 That's enough watering for these
match VaalorFlowersDone4 completed
put water wildflowers
matchwait

VaalorFlowersStand:
match VaalorFlowers1 You stand
match VaalorFlowers1 You are
match VaalorFlowersStand You struggle
put stand
matchwait

VaalorFlowersStand1:
match VaalorFlowers2 You stand
match VaalorFlowers2 You are
match VaalorFlowersStand1 You struggle
put stand
matchwait

VaalorFlowersStand2:
match VaalorFlowers3 You stand
match VaalorFlowers3 You are
match VaalorFlowersStand2 You struggle
put stand
matchwait

VaalorFlowersStand3:
match VaalorFlowers4 You stand
match VaalorFlowers4 You are
match VaalorFlowersStand3 You struggle
put stand
matchwait

VaalorFlowersDone:
match VaalorFlowersDoneA You stand
match VaalorFlowersDoneA You are
match VaalorFlowersDone You struggle
put stand
matchwait

VaalorFlowers2:
match VaalorFlowersDone2a You stand
match VaalorFlowersDone2a You are
match VaalorFlowersDone2 You struggle
put stand
matchwait

VaalorFlowersDone3:
match VaalorFlowersDone3a You stand
match VaalorFlowersDone3a You are
match VaalorFlowersDone3 You struggle
put stand
matchwait

VaalorFlowersDone4:
match VaalorFlowersDone4a You stand
match VaalorFlowersDone4a You are
match VaalorFlowersDone4 You struggle
put stand
matchwait

VaalorFlowersDone2a:
move out
move west
GoTo VaalorFlowersDone1a

VaalorFlowersDone3a:
move out
move west
GoTo VaalorFlowersDone1a

VaalorFlowersDoneA:
move out
GoTo VaalorFlowersDone1a

VaalorFlowersDone4a:
move west
move west
move west
VaalorFlowersDone1a:
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
move go staircase
move north
move west
put put my can on rack
move east
move south
move go staircase
move north
move north
move north
move go trapdoor
move down
move northeast
move climb ladder
move east
move north
GoTo %1RepCheck

# *** END 6 Flowers ***

# *** 7 Flowers ***

IllistimFlowers:
move n
move e
move go staircase
move e
move e
move e
move s
move s
move s
move go staircase
move w
IllistimFlowersRack:
put GeT can
move e
move go staircase
move w
move w
move w
move w
move w
move w
Illistim_Flowers_Room0:
save Illistim_Flowers_Room0
GoTo Illistim_Flowers_Water

Illistim_Flowers_Room0_next:
move e
move e
move e
move e
move e
Illistim_Flowers_Room1:
save Illistim_Flowers_Room1
GoTo Illistim_Flowers_Water

Illistim_Flowers_Room1_Next:
move e
move n
move n
move n
Illistim_Flowers_Room2:
save Illistim_Flowers_Room2
GoTo Illistim_Flowers_Room2_Next

Illistim_Flowers_Room2_Next:
move w
save Illistim_Flowers_Room3
GoTo Illistim_Flowers_Water

Illistim_Flowers_Room3_Next:
move w
save Illistim_Flowers_Room4
GoTo Illistim_Flowers_Water

Illistim_Flowers_Room4_Next:
move w
move w
save Illistim_Flowers_Room5
GoTo Illistim_Flowers_Water

Illistim_Flowers_Room5_Next:
Illistim_Flowers_Room5_Done:
move e
move e
Illistim_Flowers_Room4_Done:
move e
Illistim_Flowers_Room3_Done:
move e
Illistim_Flowers_Room2_Done:
move s
move s
move s
GoTo Illistim_Flowers_Room1_Done1

Illistim_Flowers_Room0_Done:
move e
move e
move e
move e
move e
Illistim_Flowers_Room1_Done:
move e
Illistim_Flowers_Room1_Done1:
move go staircase
move w
put put can on rack
move e
move go staircase
move n
move n
move n
move w
move w
move w
move go staircase
move w
move s
GoTo %1RepCheck

Illistim_Flowers_Water:
put kneel
wait
put water wildflowers
match Illistim_Flowers_Stand repetition(s) remaining.
match Illistim_Flowers_Stand That's enough watering for these wildflowers
match Illistim_Flowers_Stand could not find
match Illistim_Flowers_Stand_Done completed
matchwait

Illistim_Flowers_Stand:
put stand
match %s_Next You stand
match Illistim_Flowers_Stand_Wait You struggle
match Illistim_Flowers_Stand_Wait .wait
matchwait

Illistim_Flowers_Stand_Wait:
pause
put stance off
GoTo Illistim_Flowers_Stand_Stance

Illistim_Flowers_Stand_Stance:
put stand
match Illistim_Flowers_Stand_Def You stand
match Illistim_Flowers_Stand_Stance You struggle
matchwait

Illistim_Flowers_Stand_Def:
put stance def
wait
GoTo %s_Next

Illistim_Flowers_StandX:
pause
put stance off
wait
GoTo Illistim_Flowers_Stand_Done

Illistim_Flowers_Stand_Done:
put stand
match %s_Done You stand
match Illistim_Flowers_StandX You struggle
matchwait

# *** End 6 Flowers ***

# ******************** END FLOWER ***********************

# ******************** DIRT ***********************

#Sweep Dirt
SweepDirt:
guildstart12:
ECHO *** Sweep Dirt
GoTo SweepDirt%1

End_Sweep_Dirt:
ECHO ***
ECHO * Finished sweeping dirt
ECHO ***
exit

# 1, 2, 4, 5, and 6 done

# *** 1 ***

SweepDirtLanding:
SweepDirt1:
put LooK
match LANDINGdirtroom0 Training Administrator DeLuca
match LANDINGdirtroom1start The courtyard before you is roughly square in shape
match LANDINGdirtroom2start Several sturdy wooden tables and benches stand
match LANDINGdirtroom3start A rusted metal ladder is fastened to the stone
match LANDINGdirtroom4start Most of the weeds and stones have been cleared
match LANDINGdirtroom5start The cracked flagstones to the north give way
match LANDINGdirtroom6start The second story of the building above overhangs
match LANDINGdirtrack Rogue Guild, Basement Storage
match LANDINGdirtroomodd1 Under the shadows of the overhanging branches
match LANDINGdirtroomodd2 An old fountain is set into the stone wall in
match LANDINGdirtroomodd3 A dark, windowless door is set into the stone wall at
match LANDINGdirtroomodd4 A slight draft from the west stirs the tapestries that
match LANDINGdirtroomodd5 A chill draft blows up from the narrow stairwell at the end of
match LANDINGdirtroomodd6 The heavy wooden boards of the floor are worn smooth
matchwait

LANDINGdirtroom1start:
save LANDINGdirtroom1
GoTo LANDINGdirtrestartx

LANDINGdirtroom2start:
save LANDINGdirtroom2
GoTo LANDINGdirtrestartx

LANDINGdirtroom3start:
save LANDINGdirtroom3
GoTo LANDINGdirtrestartx

LANDINGdirtroom4start:
save LANDINGdirtroom4
GoTo LANDINGdirtrestartx

LANDINGdirtroom5start:
save LANDINGdirtroom5
GoTo LANDINGdirtrestartx

LANDINGdirtroom6start:
save LANDINGdirtroom6
GoTo LANDINGdirtrestartx

LANDINGdirtrestartx:
GoTo dirtgetx
put LooK
GoTo dirtroomcheck

LANDINGdirtroom0:
put glance
match LANDINGcourtyardstart empty hands
match LANDINGcourtyarddone wooden broom
match Dirterror left hand
matchwait

LANDINGcourtyardstart:
move s
move go door
LANDINGdirtroomodd3:
move w
LANDINGdirtroomodd4:
move w
LANDINGdirtroomodd5:
move climb stairs
LANDINGdirtroomodd6:
move e
GoTo LANDINGdirtrack

LANDINGdirtrack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo LANDINGdirtrackx

LANDINGdirtrackx:
put put burlap bag in bin
match LANDINGdirtdone You have completed this
match LANDINGdirtmore repetition(s) remaining
match LANDINGdirtmore Your burlap bag isn't full yet
matchwait

LANDINGcourtyarddone:
put s
save LANDINGdirtroom1
GoTo dirtroomcheck

LANDINGdirtmore:
move w
move climb stairs
move e
move e
put go door
save LANDINGdirtroom1
GoTo dirtroomcheck

LANDINGdirtroom1next:
put e
save LANDINGdirtroom2
GoTo dirtroomcheck

LANDINGdirtroom2next:
put n
save LANDINGdirtroom3
GoTo dirtroomcheck

LANDINGdirtroom3next:
put n
save LANDINGdirtroom4
GoTo dirtroomcheck

LANDINGdirtroom4next:
move w
LANDINGdirtroomodd1:
move w
LANDINGdirtroomodd2:
put s
save LANDINGdirtroom5
GoTo dirtroomcheck

LANDINGdirtroom5next:
put s
save LANDINGdirtroom6
GoTo dirtroomcheck

LANDINGdirtroom4done:
move s
GoTo LANDINGdirtroom3done

LANDINGdirtroom3done:
move s
GoTo LANDINGdirtroom2done

LANDINGdirtroom2done:
move w
GoTo LANDINGdirtroom1done

LANDINGdirtroom5done:
move s
GoTo LANDINGdirtroom6done

LANDINGdirtroom6next:
LANDINGdirtroom6done:
move e
LANDINGdirtroom1done:
move go door
move w
move w
move clim stair
move e
GoTo LANDINGdirtrackx

LANDINGdirtdone:
put put my broom on rack
wait
put put my bag on rack
wait
move w
move climb stair
move e
move e
move go door
move n
GoTo %1RepCheck
exit

# *** END 1 ***

# *** 2 DIRT ***

SweepDirtSolhaven:
SweepDirt2:
put LooK
match SOLdirtcourtyard Training Administrator Milgrew
match SOLdirtrack Rogue Guild, Pantry
match SOLdirtroom1start The flagstones, though swept clean, are cracked
match SOLdirtroom2start The once well-tended flowerbeds surrounding the courtyard
match SOLdirtroom3start The large statue in the center of an overgrown flowerbed
match SOLdirtroom4start Weeds grow up through the cracked flagstones.
match SOLdirtroom5start The eastern wall is completely covered with vines.
match SOLdirtroom7start The marble floors of the former ballroom are covered
match SOLdirtroom8start Rodents and moths have diminished the beauty
match SOLdirtroom9start A long, polished mahogany table surrounded by
matchwait

SOLdirtroom1start:
save SOLdirtroom1
#GoTo SOLdirtrestartx
GoTo dirtgetx

SOLdirtroom2start:
save SOLdirtroom2
GoTo dirtgetx

SOLdirtroom3start:
save SOLdirtroom3
GoTo dirtgetx

SOLdirtroom4start:
save SOLdirtroom4
GoTo dirtgetx

SOLdirtroom5start:
save SOLdirtroom5
GoTo dirtgetx

SOLdirtroom7start:
save SOLdirtroom7
GoTo dirtgetx

SOLdirtroom8start:
move go door
GoTo dirtgetx

SOLdirtroom9start:
move go curtain
GoTo SOLdirtrackx

SOLdirtrestartx:
put LooK
GoTo dirtroomcheck

SOLdirtcourtyard:
put glance
match SOLdirtstart empty hands
match SOLdirtcourtyardstart broom
match Dirterror left hand
matchwait

SOLdirtcourtyardstart:
save SOLdirtroom6
GoTo dirtsweep

SOLdirtstart:
move go door
move sw
move sw
move go door
move go wide arch
move go curtain
GoTo SOLdirtrack

SOLdirtrack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo SOLdirtrackx

SOLdirtrackx:
put put burlap bag in bin
match SOLdirtdone You have completed this
match SOLdirtmore repetition(s) remaining
match SOLdirtmore Your burlap bag isn't full yet.
match SOLdirtrack could not find
matchwait

SOLdirtmore:
move go curtain
move go wide arch
pause
put go door
save SOLdirtroom1
GoTo dirtroomcheck

SOLdirtroom1next:
pause
put n
save SOLdirtroom2
GoTo dirtroomcheck

SOLdirtroom2next:
pause
put se
save SOLdirtroom3
GoTo dirtroomcheck

SOLdirtroom3next:
pause
put se
save SOLdirtroom4
GoTo dirtroomcheck

SOLdirtroom4next:
pause
put n
save SOLdirtroom5
GoTo dirtroomcheck

SOLdirtroom5next:
pause
put go door
save SOLdirtroom6
GoTo dirtroomcheck

SOLdirtroom6next:
pause
put w
save SOLdirtroom7
GoTo dirtroomcheck

SOLdirtroom7next:
SOLdirtroom7done:
move e
SOLdirtroom6done:
move go door
SOLdirtroom5done:
move sw
GoTo SOLdirtroom3done

SOLdirtroom4done:
move w
GoTo SOLdirtroom1done

SOLdirtroom3done:
move sw
GoTo SOLdirtroom1done

SOLdirtroom2done:
move s
GoTo SOLdirtroom1done

SOLdirtroom1done:
move go door
move go wide arch
move go curtain
GoTo SOLdirtrackx

SOLdirtdone:
put put my bag on rack
wait
put put my broom on rack
wait
move go curtain
move go wide arch
move go door
move ne
move ne
move go door
GoTo %1RepCheck
exit

# *** END 2 ***

# *** 3 DIRT ***

SweepDirtIcemule:
SweepDirt3:
put LooK
match ICEMULEdirtcourtyard Rogue Guild, Center Courtyard
match ICEMULEdirtroom2start Rogue Guild, East Courtyard
match ICEMULEdirtroom3start Rogue Guild, West Courtyard
match ICEMULEdirtodd1 The narrow, quiet hallway is carpeted in a runner of dark
match ICEMULEdirtodd2 Rogue Guild, Shop
match ICEMULEdirtodd3 Rogue Guild, Buyer
match ICEMULEdirtodd4 A single elaborately carved brass oil lamp
match ICEMULEdirtodd5 Rogue Guild, Master's Office
match ICEMULEdirtodd6 Contemplation Chamber
match ICEMULEdirtodd7 Rogue Guild, Masters' Garden
match ICEMULEdirtodd8 Icemule Trace, Rooftop
match ICEMULEdirtodd9 Silvermule, Back Alley
match ICEMULEdirtodd10 Rogue Guild, Warehouse
match ICEMULEdirtodd11 Rogue Guild, Workshop
match ICEMULEdirtodd12 Rogue Guild, Meeting Room
match ICEMULEdirtodd13 Rogue Guild, Bar
match ICEMULEdirtrackx Rogue Guild, Storage Cellar
matchwait

ICEMULEdirtodd13:
move s
GoTo ICEMULEdirtrackx

ICEMULEdirtodd12:
move n
GoTo ICEMULEdirtrackx

ICEMULEdirtodd11:
move e
GoTo ICEMULEdirtodd10

ICEMULEdirtodd10:
save ICEMULEdirtroom1
put go door
GoTo dirtroomcheck

ICEMULEdirtodd9:
save ICEMULEdirtroom2
put n
GoTo dirtroomcheck

ICEMULEdirtodd8:
save ICEMULEdirtroom2
put down
GoTo dirtroomcheck

ICEMULEdirtodd7:
move go curtain
GoTo ICEMULEdirtodd6

ICEMULEdirtodd6:
move go arch
GoTo ICEMULEdirtodd5

ICEMULEdirtodd5:
move go curtain
GoTo ICEMULEdirtodd4

ICEMULEdirtodd4:
move s
GoTo ICEMULEdirtodd1

ICEMULEdirtodd3:
move out
GoTo ICEMULEdirtodd2

ICEMULEdirtodd2:
move out
GoTo ICEMULEdirtodd1

ICEMULEdirtodd1:
save ICEMULEdirtroom3
pause
put go door
GoTo dirtroomcheck

ICEMULEdirtroom3start:
save ICEMULEdirtroom3
GoTo ICEMULEdirtrestartx

ICEMULEdirtroom2start:
save ICEMULEdirtroom2
GoTo ICEMULEdirtrestartx

ICEMULEdirtrestartx:
put LooK
GoTo dirtroomcheck


ICEMULEdirtcourtyard:
put glance
match ICEMULEcourtyardstart empty hands
match ICEMULEcourtyarddone wooden broom
match Dirterror left hand
matchwait

ICEMULEcourtyarddone:
put LooK
GoTo dirtroomcheck

ICEMULEcourtyardstart:
move go door
move go stairs
GoTo ICEMULEdirtrack

ICEMULEdirtrack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo ICEMULEdirtrackx

ICEMULEdirtrackx:
put put burlap bag in bin
match ICEMULEdirtdone You have completed this
match ICEMULEdirtmore repetition(s) remaining
match ICEMULEdirtmore Your burlap bag isn't full yet.
matchwait

ICEMULEdirtmore:
move go stairs
put go door
save ICEMULEdirtroom1
GoTo dirtroomcheck

ICEMULEdirtroom1next:
put e
save ICEMULEdirtroom2
GoTo dirtroomcheck

ICEMULEdirtroom2next:
move w
save ICEMULEdirtroom3
put w
GoTo dirtroomcheck

ICEMULEdirtroom1done:
move go door
move go stair
GoTo ICEMULEdirtrackx

ICEMULEdirtroom2done:
move w
GoTo ICEMULEdirtroom1done

ICEMULEdirtroom3next:
ICEMULEdirtroom3done:
move e
GoTo ICEMULEdirtroom1done

ICEMULEdirtdone:
put put my broom on rack
wait
put put my bag on rack
wait
move go stair
move go door
GoTo %1RepCheck
exit


# *** END 3 DIRT ***

# *** 4 DIRT ***

SweepDirtTeras:
SweepDirt4:
put LooK
match TERASdirtcourtyard Training Administrator Runaire
match TERASdirtrack Storage Room
match TERASdirtroom1start This narrow hall branches to the north, west and southeast
match TERASdirtroom2start A rat peeks out of a small hole in the wall
match TERASdirtroom3start Light filters in through the door, leaving
match TERASdirtroom4start Laughter spills into the room through an arch
match TERASdirtroom5start A number of crates and kegs have been stacked here
match TERASdirtodd1 Obvious exits: southeast, southwest.
match TERASdirtodd2 A trio of dwarves stands in the center of the area
match TERASdirtodd3 Obvious exits: west, northeast, southwest.
match TERASdirtodd4 Relatively bright lanterns spill dirty light over
match TERASdirtodd5 Obvious exits: south, east, northwest.
match TERASdirtodd6 Obvious exits: east.
match TERASdirtodd7 Obvious exits: northwest.
match TERASdirtodd8 Obvious exits: northeast, northwest, southeast.
match TERASdirtodd9 Dwarves wander through the room, walking easily but
match TERASdirtodd10 Heaps of boxes take up most of the floor in this tiny space
match TERASdirtodd11 Obvious exits: south, east, northeast.
match TERASdirtodd12 Walls of boxes labeled "Picks" and "Lantern Parts"
match TERASdirtodd13 A light sifting of dust rains down on your head
match TERASdirtodd14 The remains of a broken crate litter the floor, the rusty
match TERASdirtodd15 A trail of grain leads off to the east, along with a
match TERASdirtodd16 A large crate was murdered by a swarm of rats in this room,
matchwait

TERASdirtodd16:
move w
GoTo TERASdirtodd15

TERASdirtodd14:
move se
GoTo TERASdirtodd13

TERASdirtodd13:
move e
GoTo TERASdirtodd12

TERASdirtodd12:
move n
GoTo TERASdirtodd11

TERASdirtodd9:
move sw
GoTo TERASdirtodd8

TERASdirtodd7:
pause
put nw
save TERASdirtroom1
GoTo dirtroomcheck

TERASdirtodd6:
pause
put e
save TERASdirtroom1
GoTo dirtroomcheck

TERASdirtodd4:
pause
put n
save TERASdirtroom2
GoTo dirtroomcheck

TERASdirtodd3:
pause
put ne
save TERASdirtroom4
GoTo dirtroomcheck

TERASdirtodd2:
move ne
pause
put se
save TERASdirtroom4
GoTo dirtroomcheck

TERASdirtodd1:
pause
put se
save TERASdirtroom4
GoTo dirtroomcheck

TERASdirtroom1start:
save TERASdirtroom1
GoTo Terasdirtrestartx

TERASdirtroom2start:
save TERASdirtroom2
GoTo Terasdirtrestartx

TERASdirtroom3start:
save TERASdirtroom3
GoTo Terasdirtrestartx

TERASdirtroom4start:
save TERASdirtroom4
GoTo Terasdirtrestartx

TERASdirtroom5start:
save TERASdirtroom5
GoTo Terasdirtrestartx

Terasdirtrestartx:
put LooK
GoTo dirtroomcheck

TERASdirtcourtyard:
put glance
match TERASdirtstart empty hands
match TERASdirtcourtyardstart broom
match Dirterror left hand
matchwait

TERASdirtcourtyardstart:
move n
move w
move sw
move nw
move w
move ne
move go door
GoTo TERASdirtrackx

TERASdirtstart:
move n
move w
move sw
move nw
move w
move ne
move go door
GoTo TERASdirtrack

TERASdirtrack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo TERASdirtrackx

TERASdirtrackx:
put put burlap bag in bin
match TERASdirtdone You have completed this
match TERASdirtmore repetition(s) remaining
match TERASdirtmore Your burlap bag isn't full yet.
matchwait

TERASdirtmore:
move out
TERASdirtodd15:
move sw
TERASdirtodd11:
move e
TERASdirtodd10:
move se
TERASdirtodd8:
move se
pause
put s
save TERASdirtroom1
GoTo dirtroomcheck

TERASdirtroom1next:
move n
TERASdirtodd5:
pause
put e
save TERASdirtroom2
GoTo dirtroomcheck

TERASdirtroom2next:
move s
pause
put e
save TERASdirtroom3
GoTo dirtroomcheck

TERASdirtroom3next:
move w
move n
move ne
pause
put ne
save TERASdirtroom4
GoTo dirtroomcheck

TERASdirtroom4next:
pause
put go arch
save TERASdirtroom5
GoTo dirtroomcheck

TERASdirtroom5next:
TERASdirtroom5done:
move go arch
TERASdirtroom4done:
move sw
move sw
GoTo TERASdirtroom2done

TERASdirtroom3done:
move w
move n
TERASdirtroom2done:
move w
GoTo TERASdirtroom1donex

TERASdirtroom1done:
move n
TERASdirtroom1donex:
move nw
move nw
move w
move ne
move go door
GoTo TERASdirtrackx

TERASdirtdone:
put put my broom on rack
wait
put put my bag on rack
wait
move out
move sw
move e
move se
move ne
move e
move s
GoTo %1RepCheck
exit

# *** END 4 DIRT ***

# *** 5 DIRT ***

SweepDirtRest:
SweepDirt5:
put LooK
match RiverDirtCourtyard Training Administrator Maliq
match RiverToolRackStart Rogue Guild, Storage Closet
match RiverDirtRoom1Start To the east is a salmon
match RiverDirtRoom2Start To the southeast is a salmon
match RiverDirtRoom4Start To the west is a salmon
match RiverDirtRoom5Start To the northwest is a salmon
match RiverDirtRoom6Start To the northeast is a salmon
match RiverDirtRoom7Start To the north is a salmon
match RiverDirtRoom8Start The hallway continues south
match RiverDirtRoom9Start A small tapestry hangs on the wall
match RIVERdirtroom0 Training Administrator Maliq
match RIVERtoolrack Rogue Guild, Storage Closet
matchwait

RiverDirtRoom1Start:
save RiverDirtRoom1
GoTo RiverDirtRestartx

RiverDirtRoom2Start:
save RiverDirtRoom2
GoTo RiverDirtRestartx

RiverDirtRoom4Start:
save RiverDirtRoom4
GoTo RiverDirtRestartx

RiverDirtRoom5Start:
save RiverDirtRoom5
GoTo RiverDirtRestartx

RiverDirtRoom6Start:
save RiverDirtRoom6
GoTo RiverDirtRestartx

RiverDirtRoom7Start:
save RiverDirtRoom7
GoTo RiverDirtRestartx

RiverDirtRoom8Start:
save RiverDirtRoom8
GoTo RiverDirtRestartx

RiverDirtRoom9Start:
save RiverDirtRoom8
GoTo RiverDirtRestartx

RiverDirtRestartx:
GoTo DirtGetx

Riverdirtcourtyard:
put glance
match RIVERcourtyardstart empty hands
match RIVERcourtyarddone wooden broom
match Dirterror left hand
matchwait

RIVERcourtyardstart:
move w
move w
move s
move w
RIVERtoolrack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo RIVERtoolrackx

RIVERtoolrackx:
put put burlap bag in bin
match RIVERdirtdone You have completed this
match RIVERdirtmore repetition(s) remaining
match RIVERdirtmore Your burlap bag isn't full yet.
matchwait

RIVERdirtmore:
move e
move n
put e
save RIVERdirtroom1
GoTo dirtroomcheck

RIVERdirtroom1next:
put n
save RIVERdirtroom2
GoTo dirtroomcheck

RIVERdirtroom2next:
put se
save RIVERdirtroom3
GoTo dirtroomcheck

RIVERdirtroom3next:
put e
save RIVERdirtroom4
GoTo dirtroomcheck

RIVERdirtroom4next:
put s
save RIVERdirtroom5
GoTo dirtroomcheck

RIVERdirtroom5next:
move w
put w
save RIVERdirtroom6
GoTo dirtroomcheck

RIVERdirtroom2done:
move s
GoTo RIVERdirtroom1done

RIVERdirtroom3done:
move w
GoTo RIVERdirtroom1done

RIVERdirtroom4done:
move w
GoTo RIVERdirtroom3done

RIVERdirtroom5done:
move nw
GoTo RIVERdirtroom3done

RIVERdirtroom6next:
RIVERdirtroom6done:
move n
RIVERdirtroom1done:
move w
move s
move w
GoTo RIVERtoolrackx

RIVERdirtdone:
put put my broom on rack
wait
put put my bag on rack
wait
move e
move n
move e
move e
GoTo %1RepCheck
exit

# *** END 5 DIRT ***

# *** 6 DIRT ***

SweepDirtVaalor:
SweepDirt6:
match VaalorDirtCourtyard Training Administrator Flyndar
match VaalorToolRack Warehouse
match VaalorDirtRoom1Start A small child sits in one corner
match VaalorDirtRoom2Start You also see a frayed rope
match VaalorDirtRoom3Start A small rat sits atop
match VaalorDirtRoom4Start Training dummies
match VaalorDirtRoom5Start Training mannequins
match VaalorDirtRoom6Start There is nothing but dust
match VaalorDirtRoom7Start an occasional thud can be heard
put LooK
matchwait

VaalorDirtRoom1Start:
save VaalorDirtRoom1
GoTo VaalorDirtRestartx

VaalorDirtRoom2Start:
save VaalorDirtRoom2
GoTo VaalorDirtRestartx

VaalorDirtRoom3Start:
save VaalorDirtRoom3
GoTo VaalorDirtRestartx

VaalorDirtRoom4Start:
save VaalorDirtRoom4
GoTo VaalorDirtRestartx

VaalorDirtRoom5Start:
save VaalorDirtRoom5
GoTo VaalorDirtRestartx

VaalorDirtRoom6Start:
save VaalorDirtRoom6
GoTo VaalorDirtRestartx

VaalorDirtRoom7Start:
save VaalorDirtRoom7
GoTo VaalorDirtRestartx

VaalorDirtRestartx:
GoTo DirtGetx
put LooK
GoTo DirtRoomCheck

VaalorDirtCourtyard:
put glance
match VaalorCourtyardStart empty hands
match VaalorCourtyardDone wooden broom
match Dirterror left hand
matchwait

VaalorCourtyardDone:
move out
move west
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
move go staircase
move north
move north
GoTo VaalorDirtRoom1

VaalorCourtyardStart:
move out
move west
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
move go staircase
move north
move west
VaalorToolRack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo VaalorToolRackx

VaalorToolRackx:
put put burlap bag in bin
match Vaalordirtdone You have completed this
match Vaalordirtmore repetition(s) remaining
match Vaalordirtmore Your burlap bag isn't full yet.
matchwait

VaalorDirtMore:
move east
put north
save VaalorDirtRoom1
GoTo DirtRoomCheck

VaalorDirtRoom1next:
put south
save VaalorDirtRoom2
GoTo DirtRoomCheck

VaalorDirtRoom2next:
put south
save VaalorDirtRoom3
GoTo DirtRoomCheck

VaalorDirtRoom3next:
put go staircase
save VaalorDirtRoom4
GoTo DirtRoomCheck

VaalorDirtRoom4next:
put north
save VaalorDirtRoom5
GoTo DirtRoomCheck

VaalorDirtRoom5next:
put north
save VaalorDirtRoom6
GoTo DirtRoomCheck

VaalorDirtRoom6Next:
put north
save VaalorDirtRoom7
GoTo DirtRoomCheck

VaalorDirtRoom7Next:
move south
VaalorDirtRoom6done:
move south
VaalorDirtRoom5done:
move south
VaalorDirtRoom4done:
move go staircase
VaalorDirtRoom3done:
move north
VaalorDirtRoom2Done:
move west
GoTo VaalorToolRackx

VaalorDirtRoom1Done:
move south
GoTo VaalorDirtRoom2Done

VaalorDirtDone:
put put broom on rack
wait
put put burlap bag on rack
wait
move east
move south
move go staircase
move north
move north
move north
move go trapdoor
move down
move northeast
move climb ladder
move east
move north
GoTo %1RepCheck

# *** END 6 DIRT ***
# Thanks to Taz for the help

SweepDirtIllistim:
SweepDirt7:
put LooK
match IllistimDirtCourtyard Boucher
match IllistimDirtRack cleaning tools and supplies hangs from a wall rack
match IllistimDirtRoomOdd1 hand-woven cotton tapestry
match IllistimDirtRoomOdd2 staircase curves downward
match IllistimDirtRoomOdd3 grand entry and marble tiled floor
match IllistimDirtRoomOdd4 dark green runner carpet suppresses
match IllistimDirtRoomOdd5 boasts a window almost a dozen
match IllistimDirtRoomOdd6 Serving girls pass by
match IllistimDirtRoomOdd7 open arch to the east
match IllistimDirtRoomOdd8 southern half of the guild
match IllistimDirtRoomOdd9 staircase leading down to the cellar
match IllistimDirtRoomOdd10 Alcoves lead off in all directions
match IllistimDirtRoom1Start Courtyard, Rose Garden
match IllistimDirtRoom2Start Courtyard, Gazebo
match IllistimDirtRoom3Start Courtyard, Pond
match IllistimDirtRoom4Start Courtyard, Veranda
match IllistimDirtRoom5Start Courtyard, Shed
matchwait

IllistimDirtRoom1Start:
save IllistimDirtRoom1
GoTo IllistimDirtRestartx

IllistimDirtRoom2Start:
save IllistimDirtRoom2
GoTo IllistimDirtRestartx

IllistimDirtRoom3Start:
save IllistimDirtRoom3
GoTo IllistimDirtRestartx

IllistimDirtRoom4Start:
save IllistimDirtRoom4
GoTo IllistimDirtRestartx

IllistimDirtRoom5Start:
save IllistimDirtRoom5
GoTo IllistimDirtRestartx

IllistimDirtRestartx:
GoTo DirtGetx
put LooK
GoTo DirtRoomCheck

IllistimDirtCourtyard:
put glance
match IllistimDirtCourtyardStart empty hands
match IllistimDirtCourtyardDone wooden broom
match DirtError left hand
matchwait

IllistimDirtCourtyardStart:
move north
IllistimDirtRoomOdd1:
move east
IllistimDirtRoomOdd2:
move go stair
IllistimDirtRoomOdd3:
move east
IllistimDirtRoomOdd4:
move east
IllistimDirtRoomOdd5:
move east
IllistimDirtRoomOdd6:
move south
IllistimDirtRoomOdd7:
move south
IllistimDirtRoomOdd8:
move south
IllistimDirtRoomOdd9:
move go stair
IllistimDirtRoomOdd10:
move west
IllistimDirtRack:
put GeT broom
wait
put GeT burlap bag
wait
GoTo IllistimDirtRackx

IllistimDirtRackx:
put put my bag in bin
match IllistimDirtdone You have completed this
match IllistimDirtmore repetition(s) remaining
match IllistimDirtmore Your burlap bag isn't full yet.
matchwait

IllistimDirtCourtyarddone:
put s
save IllistimDirtRoom1
GoTo DirtRoomCheck

IllistimDirtmore:
move east
move go stair
move north
move north
move north
move west
move west
move west
put go door
save IllistimDirtRoom1
GoTo DirtRoomCheck

IllistimDirtRoom1next:
put s
save IllistimDirtRoom2
GoTo DirtRoomCheck

IllistimDirtRoom2next:
put w
save IllistimDirtRoom3
GoTo DirtRoomCheck

IllistimDirtRoom3next:
move east
put south
save IllistimDirtRoom4
GoTo DirtRoomCheck

IllistimDirtRoom4next:
move north
put east
save IllistimDirtRoom5
GoTo DirtRoomCheck

IllistimDirtRoom5Next:
IllistimDirtRoom5Done:
move west
GoTo IllistimDirtRoom2Done

IllistimDirtRoom4done:
move north
GoTo IllistimDirtRoom2done

IllistimDirtRoom3done:
move east
IllistimDirtRoom2done:
move north
IllistimDirtRoom1Done:
move go door
move east
move east
move east
move south
move south
move south
move go stair
move west
GoTo IllistimDirtRackx

IllistimDirtdone:
put put broom on rack
wait
put put burlap bag on rack
wait
move east
move go stair
move north
move north
move north
move west
move west
move west
move go stair
move west
move south
GoTo %1RepCheck

# *** END 7 ***

# ********* ROOM CHECK *********

dirtroomcheck:
match dirtroomchecknext Also here:
match dirtroomchecknext Also in the room:
match dirtsweep Obvious paths
match dirtsweep Obvious exits
matchwait

dirtroomchecknext:
pause
GoTo %snext

dirtsweep:
put PusH my broom
match dirtget You sweep up some dirt
match %snext There is no dirt
matchwait

dirtget:
dirtgetx:
pause
put GeT pile
wait
put LooK in my bag
match dirtsweep empty
match dirtsweep room
match %sdone full
matchwait

Dirterror:
ECHO ***
ECHO * You need empty hands to start *
ECHO * You can't sweep with that *
ECHO ***
exit

# ********************* END DIRT ***********************

# ********************** ARROW *************************

# 1, 2, and 4 done

Arrowstartingpoint:
#Stun Arrow Start
guildstart33:
ArrowStartingPoint:
ECHO *** Arrow - Stunman
wait
ECHO **
ECHO ** DODGE SOME ARROWS
ECHO **
GoTo ArrowStart%1

ArrowStartLanding:
ArrowStart1:
put LooK
match ArrowSmile A Dark Corner
match ArrowSmile This dark corner is far enough away from the bustle
match arrowmiller Master Footpad Miller
match arrowmurphy Master Footpad Murphy
match arrowo'toole Master Footpad O'Toole
match arrowreilly Master Footpad Reilly
match arrowbean Master Footpad Bean
match arrowhoulihan Master Footpad Houlihan
match LandingCourtyardarrowstart Training Administrator DeLuca
matchwait

ArrowStartSolhaven:
ArrowStart2:
put LooK
match SolhavenCourtyardArrow Training Administrator Milgrew
match arrowogdin Master Footpad Ogdin
match arrowvarant Master Footpad Varant
match arrowtriaholly Master Footpad Triaholly
match arrowsneck Master Footpad Sneck
match arrowsmile A Dark Corner
match arrowsmile This dark corner is far enough away from the bustle
matchwait

ArrowStartIcemule:
ArrowStart3:
put LooK
match IcemuleCourtyardArrowA Training Administrator Teagais
match ArrowSmile A Dark Corner
match ArrowSmile This dark corner is far enough away from the bustle
match ArrowPalder Master Footpad Palder
match ArrowDuchel Master Footpad Duchel
match ArrowMeallan Master Footpad Meallan
match ArrowCuip Master Footpad Cuip
match ArrowBuchara Master Footpad Buchara
match ArrowTruaz Master Footpad Truaz
match IcemuleCourtyardArrowB West Courtyard
matchwait

ArrowStartTeras:
ArrowStart4:
put LooK
match ArrowSmile A Dark Corner
match ArrowSmile This dark corner is far enough away from the bustle
match arrowjimik Master Footpad Jimik
match arrowfaldes Master Footpad Faldes
match arrowherit Master Footpad Herit
match arrowgludac Master Footpad Gludac
match arrowlagick Master Footpad Lagick
match arrowzardak Master Footpad Zardak
match TerasCourtyardArrow Training Administrator Runaire
matchwait

ArrowStartRest:
ArrowStart5:
put LooK
match ArrowSmile A Dark Corner
match ArrowSmile This dark corner is far enough away from the bustle
match arrowharith Master Footpad Harith
match arrowjafar Master Footpad Jafar
match arrowmubarak Master Footpad Mubarak
match arrowselima Master Footpad Selima
match RIVERCourtyardArrow Training Administrator Maliq
matchwait

ArrowStartVaalor:
ArrowStart6:
put LooK
match ArrowSmile A Dark Corner
match ArrowSmile This dark corner is far enough away from the bustle
match VaalorCourtyardArrow Training Administrator Flyndar
match ArrowTamis Master Footpad Tamis
match ArrowPyll Master Footpad Pyll
match ArrowDaranth Master Footpad Daranth
match ArrowSynelle Master Footpad Synelle
match ArrowYlldryll Master Footpad Ylldryll
match ArrowArynnor Master Footpad Arynnor
matchwait

ArrowStartIllistim:
ArrowStart7:
put LooK
match ArrowSmile A Dark Corner
match ArrowSmile This dark corner is far enough away from the bustle
match IllistimArrowCourtyard Training Administrator Boucher
match ArrowRitchie Master Footpad Ritchie
match ArrowVigil Master Footpad Vigil
match ArrowPurkhiser Master Footpad Purkhiser
match ArrowColvin Master Footpad Colvin
matchwait


IllistimArrowCourtyard:
move north
move east
move go stair
move east
move east
move east
move south
move south
move south
move go stair
move north
GoTo ArrowStartIllistim

IcemuleCourtyardArrowA:
move west
GoTo ArrowStartIcemule

IcemuleCourtyardArrowB:
move east
move east
GoTo ArrowStartIcemule

RiverCourtyardArrow:
put ne
GoTo ArrowStartRest

SolhavenCourtyardArrow:
move w
move climb stairs
put e
GoTo ArrowStartSolhaven

TerasCourtyardArrow:
move e
move sw
put w
GoTo ArrowStartTeras

VaalorCourtyardArrow:
move out
move west
move go panel
move up
GoTo ArrowStartVaalor

LandingCourtyardArrowStart:
put ne
GoTo ArrowStartLanding

ArrowRitchie:
save Ritchie
put ask %s about train stun
GoTo StartDodge

ArrowVigil:
save Vigil
put ask %s about train stun
GoTo StartDodge

ArrowPurkhiser:
save Purkhiser
put ask %s about train stun
GoTo StartDodge

ArrowColvin:
save Colvin
put ask %s about train stun
GoTo StartDodge

ArrowDaranth:
save Daranth
put ask %s about train stun
GoTo StartDodge

ArrowPyll:
save Pyll
put ask %s about train stun
GoTo StartDodge

ArrowSynelle:
save Synelle
put ask %s about train stun
GoTo StartDodge

ArrowYlldryll:
save Ylldryll
put ask %s about train stun
GoTo StartDodge

ArrowArynnor:
save Arynnor
put ask %s about train stun
GoTo StartDodge

ArrowTamis:
save Tamis
put ask %s about train stun
GoTo StartDodge

ArrowDuchel:
save Duchel
put ask %s about train stun
GoTo StartDodge

ArrowPalder:
save Palder
put ask %s about train stun
GoTo StartDodge

ArrowMeallan:
save Meallan
put ask %s about train stun
GoTo StartDodge

ArrowCuip:
save Cuip
put ask %s about train stun
GoTo StartDodge

ArrowBuchara:
save Buchara
put ask %s about train stun
GoTo StartDodge

ArrowTruaz:
save Truaz
put ask %s about train stun
GoTo StartDodge

ArrowVarant:
save Varant
put ask %s about train stun
GoTo StartDodge

ArrowTriaholly:
save Triaholly
put ask %s about train stun
GoTo StartDodge

ArrowSneck:
save Sneck
put ask %s about train stun
GoTo StartDodge

ArrowOgdin:
save Ogdin
put ask %s about train stun
GoTo StartDodge

ArrowZardak:
save Zardak
put ask %s about train stun
GoTo StartDodge

ArrowLagick:
save Lagick
put ask %s about train stun
GoTo StartDodge

ArrowGludac:
save Gludac
put ask %s about train stun
GoTo StartDodge

ArrowHerit:
save Herit
put ask %s about train stun
GoTo StartDodge

ArrowFaldes:
save Faldes
put ask %s about train stun
GoTo StartDodge

ArrowJimik:
save Jimik
put ask %s about train stun
GoTo StartDodge

ArrowMiller:
save Miller
put ask %s about train stun
GoTo StartDodge

ArrowMurphy:
save Murphy
put ask %s about train stun
GoTo StartDodge

ArrowBean:
save Bean
put ask %s about train stun
GoTo StartDodge

ArrowO'toole:
save O'toole
put ask %s about train stun
GoTo StartDodge

ArrowReilly:
save Reilly
put ask %s about train stun
GoTo StartDodge

ArrowHoulihan:
save Houlihan
put ask %s about train stun
GoTo StartDodge

ArrowHarith:
save Harith
put ask %s about train stun
GoTo StartDodge

ArrowJafar:
save Jafar
put ask %s about train stun
GoTo StartDodge

ArrowMubarak:
save Mubarak
put ask %s about train stun
GoTo StartDodge

ArrowSelima:
save Selima
put ask %s about train stun
GoTo StartDodge

startdodge:
waitfor %s says
GoTo arrowsmile

arrowsmile:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO
put nod %s
IF_3 GoTo arrowpattern2
GoTo arrowpattern1

arrowpattern1:
ECHO ******* ARROW PATTERN 1 **********
GoTo arrow1

arrow1:
match arrow1 wait
match arrowstand1 "It only hurts for an hour or so!
match arrowstand1 "Making it easy fer me, eh?"
match arrowstand1 "Oooh!  That's gotta hurt!"
match arrowstand1 "Now THAT'S funny!"
match arrowstand1 "Gotcha!"
match arrow2 You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
pause 1
put lean left
put lean right
matchwait

arrow2:
match arrow2 wait
match arrowstand2 "It only hurts for an hour or so!
match arrowstand2 "Making it easy fer me, eh?"
match arrowstand2 "Oooh!  That's gotta hurt!"
match arrowstand2 "Now THAT'S funny!"
match arrowstand2 "Gotcha!"
match arrow3 You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
pause 1
put lean right
put lean left
put jump
matchwait

arrow3:
match arrow3 wait
match arrowstand3 "It only hurts for an hour or so!
match arrowstand3 "Making it easy fer me, eh?"
match arrowstand3 "Oooh!  That's gotta hurt!"
match arrowstand3 "Now THAT'S funny!"
match arrowstand3 "Gotcha!"
match arrow4 You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
pause 1
put lean left
put jump
put duck
matchwait

arrow4:
match arrow4 wait
match arrowstand4 "It only hurts for an hour or so!
match arrowstand4 "Making it easy fer me, eh?"
match arrowstand4 "Oooh!  That's gotta hurt!"
match arrowstand4 "Now THAT'S funny!"
match arrowstand4 "Gotcha!"
match arrow5 You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
pause 1
put jump
put duck
put lean right
matchwait

arrow5:
match arrow5 wait
match arrowstand5 "It only hurts for an hour or so!
match arrowstand5 "Making it easy fer me, eh?"
match arrowstand5 "Oooh!  That's gotta hurt!"
match arrowstand5 "Now THAT'S funny!"
match arrowstand5 "Gotcha!"
match arrow6 You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
pause 1
put duck
put lean right
put lean left
matchwait

arrow6:
match arrow6 wait
match arrowstand6 "It only hurts for an hour or so!
match arrowstand6 "Making it easy fer me, eh?"
match arrowstand6 "Oooh!  That's gotta hurt!"
match arrowstand6 "Now THAT'S funny!"
match arrowstand6 "Gotcha!"
match arrow1 You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
pause 1
put lean right
put lean left
put jump
matchwait

arrowstand1:
put stand
match arrowstand1pause wait
match arrowstand1pause You struggle
match arrow2 You stand
match arrow2 already
matchwait

arrowstand1pause:
pause
goto arrowstand1

arrowstand2:
put stand
match arrowstand2pause wait
match arrowstand2pause You struggle
match arrow3 You stand
match arrow3 already
matchwait

arrowstand2pause:
pause
goto arrowstand2

arrowstand3:
put stand
match arrowstand3pause wait
match arrowstand3pause You struggle
match arrow4 You stand
match arrow4 already
matchwait

arrowstand3pause:
pause
goto arrowstand3

arrowstand4:
put stand
match arrowstand4pause wait
match arrowstand4pause You struggle
match arrow5 You stand
match arrow5 already
matchwait

arrowstand4pause:
pause
goto arrowstand4

arrowstand5:
put stand
match arrowstand5pause wait
match arrowstand5pause You struggle
match arrow6 You stand
match arrow6 already
matchwait

arrowstand5pause:
pause
goto arrowstand5

arrowstand6:
put stand
match arrowstand6pause wait
match arrowstand6pause You struggle
match arrow1 You stand
match arrow1 already
matchwait

arrowstand6pause:
pause
goto arrowstand6

arrowpattern2:
ECHO ******* ARROW PATTERN 2 **********
arrowLEFT:
pause 1
put lean left
match arrowLEFT wait
match arrowstandDUCK "It only hurts for an hour or so!
match arrowstandDUCK "Making it easy fer me, eh?"
match arrowstandDUCK "Oooh!  That's gotta hurt!"
match arrowstandDUCK "Now THAT'S funny!"
match arrowstandDUCK "Gotcha!"
match arrowRIGHT You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
matchwait

arrowRIGHT:
pause 1
put lean left
match arrowRIGHT wait
match arrowstandJUMP "It only hurts for an hour or so!
match arrowstandJUMP "Making it easy fer me, eh?"
match arrowstandJUMP "Oooh!  That's gotta hurt!"
match arrowstandJUMP "Now THAT'S funny!"
match arrowstandJUMP "Gotcha!"
match arrowDUCK You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
matchwait

arrowDUCK:
pause 1
put duck
match arrowDUCK wait
match arrowstandLEFT "It only hurts for an hour or so!
match arrowstandLEFT "Making it easy fer me, eh?"
match arrowstandLEFT "Oooh!  That's gotta hurt!"
match arrowstandLEFT "Now THAT'S funny!"
match arrowstandLEFT "Gotcha!"
match arrowJUMP You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
matchwait

arrowJUMP:
pause 1
put jump
match arrowJUMP wait
match arrowstandRIGHT "It only hurts for an hour or so!
match arrowstandRIGHT "Making it easy fer me, eh?"
match arrowstandRIGHT "Oooh!  That's gotta hurt!"
match arrowstandRIGHT "Now THAT'S funny!"
match arrowstandRIGHT "Gotcha!"
match arrowLEFT You have to dodge
match arrowdoneX repetition(s) remaining
match arrowdone%1 have completed
matchwait

arrowstandLEFT:
put stand
match arrowLEFT You stand
match arrowLEFT already
match arrowstandLEFTpause You struggle
match arrowstandLEFTpause wait
matchwait

arrowstandLEFTpause:
pause
goto arrowstandLEFT:

arrowstandRIGHT:
put stand
match arrowRIGHT You stand
match arrowRIGHT already
match arrowstandRIGHTpause You struggle
match arrowstandRIGHTpause wait
matchwait

arrowstandRIGHTpause:
pause
goto arrowstandRIGHT

arrowstandDUCK:
put stand
match arrowDUCK You stand
match arrowDUCK already
match arrowstandDUCKpause You struggle
match arrowstandDUCKpause wait
matchwait

arrowstandDUCKpause:
pause
goto arrowstandDUCK

arrowstandJUMP:
put stand
match arrowJUMP You stand
match arrowJUMP already
match arrowstandJUMPpause wait
match arrowstandJUMPpause You struggle
matchwait

arrowstandJUMPpause:
pause
goto arrowstandJUMP

arrowdone:
arrowdone6:
arrowdone8:
put nod %s
ECHO *** NOW YOU DONE IT!! ***
exit

arrowdone1:
put out
put sw
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

arrowdone2:
put out
move w
move climb stair
move e
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

arrowdone3:
put out
move w
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

arrowdone4:
put out
move e
move ne
move w
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

arrowdone5:
put out
move sw
ECHO *** NOW YOU DONE IT!! ***
GoTo %1RepCheck
exit

arrowdone7:
put out
move south
move go stair
move north
move north
move north
move west
move west
move west
move go stair
move west
move south
GoTo %1RepCheck
exit

arrowdoneX:
IF_4 ECHO ** Exiting for 4th variable **
IF_4 exit
ECHO ***
ECHO * START IT UP AGAIN!!
ECHO ***
put ask %s about train stun
GoTo startdodge

# ********************** END ARROW *************************

# ********************** SLAP *************************

#Stun Slap Start
StartSlapingpoint:
guildstart32:
ECHO *** Slap - Stunman
put stand
wait
GoTo StartSlap%1

StartSlapLanding:
StartSlap1:
put LooK
match SlapMiller Master Footpad Miller
match SlapMurphy Master Footpad Murphy
match SlapO'Toole Master Footpad O'Toole
match SlapReilly Master Footpad Reilly
match SlapBean Master Footpad Bean
match Slaphoulihan Master Footpad Houlihan
match LandingCourtyardSlap DeLuca
matchwait

StartSlapSolhaven:
StartSlap2:
put LooK
match SlapOgdin Master Footpad Ogdin
match SlapVarant Master Footpad Varant
match SlapTriaholly Master Footpad Triaholly
match SlapSneck Master Footpad Sneck
match SolhavenCourtyardSlap Training Administrator Milgrew
matchwait

StartSlapIcemule:
StartSlap3:
put LooK
match SlapDuchel Master Footpad Duchel
match SlapPalder Master Footpad Palder
match SlapMeallan Master Footpad Meallan
match IcemuleCourtyardSlap Training Administrator Teagais
matchwait

StartSlapTeras:
StartSlap4:
put LooK
match SlapJimik Master Footpad Jimik
match SlapFaldes Master Footpad Faldes
match SlapHerit Master Footpad Herit
match SlapGludac Master Footpad Gludac
match SlapLagick Master Footpad Lagick
match SlapZardak Master Footpad Zardak
match TerasCourtyardSlap Training Administrator Runaire
matchwait

StartSlapRest:
StartSlap5:
put LooK
match SlapHarith Master Footpad Harith
match SlapJafar Master Footpad Jafar
match SlapMubarak Master Footpad Mubarak
match SlapSelima Master Footpad Selima
match RiverCourtyardSlap Training Administrator Maliq
matchwait

StartSlapVaalor:
StartSlap6:
put LooK
match VaalorCourtyardSlap Training Administrator Flyndar
match SlapTamis Master Footpad Tamis
match SlapPyll Master Footpad Pyll
match SlapDaranth Master Footpad Daranth
match SlapSynelle Master Footpad Synelle
match SlapYlldryll Master Footpad Ylldryll
match SlapArynnor Master Footpad Arynnor
matchwait

StartSlapIllistim:
StartSlap7:
put LooK
match IllistimCourtyardSlap Training Administrator Boucher
match SlapRitchie Master Footpad Ritchie
match SlapVigil Master Footpad Vigil
match SlapPurkhiser Master Footpad Purkhiser
match SlapColvin Master Footpad Colvin
matchwait

IllistimCourtyardSlap:
move north
move east
move go stair
move east
move east
move east
move south
move south
move south
move go stair
move north
GoTo StartSlapIllistim

IcemuleCourtyardSlap:
move w
GoTo StartSlapIcemule

SolhavenCourtyardSlap:
move w
move climb stairs
put e
GoTo StartSlapSolhaven

TerasCourtyardSlap:
move e
move sw
move w
GoTo StartSlapTeras

LandingCourtyardSlap:
move ne
GoTo StartSlapLanding

VaalorCourtyardSlap:
move out
move west
move go panel
move southwest
move up
GoTo StartSlapVaalor

SlapRitchie:
save Ritchie
put ask %s about train stun
GoTo StartSlap

SlapVigil:
save Vigil
put ask %s about train stun
GoTo StartSlap

SlapPurkhiser:
save Purkhiser
put ask %s about train stun
GoTo StartSlap

SlapColvin:
save Colvin
put ask %s about train stun
GoTo StartSlap

SlapArynnor:
save Arynnor
put ask %s about train stun
GoTo StartSlap

SlapYlldryll:
save Ylldryll
put ask %s about train stun
GoTo StartSlap

SlapSynelle:
save Synelle
put ask %s about train stun
GoTo StartSlap

SlapDaranth:
save Daranth
put ask %s about train stun
GoTo StartSlap

SlapPyll:
save Pyll
put ask %s about train stun
GoTo StartSlap

SlapTamis:
save Tamis
put ask %s about train stun
GoTo StartSlap

SlapSelima:
save Selima
put ask %s about train stun
GoTo StartSlap

SlapMubarak:
save Mubarak
put ask %s about train stun
GoTo StartSlap

SlapJafar:
save Jafar
put ask %s about train stun
GoTo StartSlap

SlapHarith:
save Harith
put ask %s about train stun
GoTo StartSlap

SlapDuchel:
save Duchel
put ask %s about train stun
GoTo StartSlap

SlapPalder:
save Palder
put ask %s about train stun
GoTo StartSlap

SlapMeallan:
save Meallan
put ask %s about train stun
GoTo StartSlap

SlapOgdin:
save Ogdin
put ask %s about train stun
GoTo StartSlap

SlapVarant:
save Varant
put ask %s about train stun
GoTo StartSlap

SlapTriaholly:
save Triaholly
put ask %s about train stun
GoTo StartSlap

SlapSneck:
save Sneck
put ask %s about train stun
GoTo StartSlap

SlapZardak:
save Zardak
put ask %s about train stun
GoTo StartSlap

SlapLagick:
save Lagick
put ask %s about train stun
GoTo StartSlap

SlapGludac:
save Gludac
put ask %s about train stun
GoTo StartSlap

SlapHerit:
save Herit
put ask %s about train stun
GoTo StartSlap

SlapFaldes:
save Faldes
put ask %s about train stun
GoTo StartSlap

SlapJimik:
save Jimik
put ask %s about train stun
GoTo StartSlap

SlapMiller:
save Miller
put ask %s about train stun
GoTo StartSlap

SlapMurphy:
save Murphy
put ask %s about train stun
GoTo StartSlap

SlapBean:
save Bean
put ask %s about train stun
GoTo StartSlap

SlapO'Toole:
save O'toole
put ask %s about train stun
GoTo StartSlap

SlapReilly:
save Reilly
put ask %s about train stun
GoTo StartSlap

SlapHoulihan:
save Houlihan
put ask %s about train stun
GoTo StartSlap

StartSlap:
put nod %s
match StartSlapX "Come get some!"
match StartSlapX "When you're ready, just put your hands on mine by choosing SLAP, DUCK or STOP."
match StartSlapX SLAP, DUCK or STOP
match StartSlapX "My grandmother could hit harder than you!"
match StartSlapX Fraid you'll break a nail, Milly?  Let's go!
match StartSlapX "Come get some!"
matchwait

StartSlapX:
IF_5 GoTo GLDYstop
IF_4 GoTo GLDXslap
IF_3 GoTo GLDslap
GoTo slap1

# slap
gldslap1:
slap1:
	pause 1
	ECHO ******* SLAP PATTERN 1 **********
	put slap
	match slapstand2 you fall to your knees!
	match slapstand1 You probably
	match slapstand1 ungracefully to the ground!
	match slap1a Your point
	match slap1a You move with lightning
	match slap2 Point's mine
	match slap2 Point for me
	match slap2 My point
	match slapdone%1 Slap what?
	match slapdone%1 have completed
	matchwait

slap1a:
	pause 1
	put slap
	match slapstand2 you fall to your knees!
	match slapstand1 You probably
	match slapstand1 ungracefully to the ground!
	match slap2 Your point
	match slap2 You move with lightning
	match slap2 Point's mine
	match slap2 Point for me
	match slap2 My point
	match slapdone%1 Slap what?
	match slapdone%1 have completed
	matchwait

# duck
slap2:
	pause 1
	put duck
	match slapstand2 you fall to your knees!
	match slapstand2 You probably
	match slapstand2 You both
	match slap2a Tension seems to peak
	match slap2a something?
	match slap2a Your point
	match slap3 Point's mine
	match slap3 Point for me
	match slap3 My point
	match slapdone%1 You duck your head
	match slapdone%1 have completed
	matchwait

slap2a:
	pause 1
	put duck
	match slapstand2 you fall to your knees!
	match slapstand2 You probably
	match slapstand2 You both
	match slap3 Tension seems to peak
	match slap3 something?
	match slap3 Your point
	match slap3 Point's mine
	match slap3 Point for me
	match slap3 My point
	match slapdone%1 You duck your head
	match slapdone%1 have completed
	matchwait

# stop
slap3:
	pause 1
	put stop
	match slapstand1 *POW*
	match slapstand3 You probably
	match slapstand2 You both
	match slap3a You steady yourself when suddenly
	match slap3a Your point
	match slap3a You stare into
	match slap2 Tension seems
	match slap1 Point's mine
	match slap1 Point for me
	match slap1  My point
	match slapdone%1 USAGE:
	match slapdone%1 have completed
	matchwait

slap3a:
	pause 1
	put stop
	match slapstand1 *POW*
	match slapstand3 You probably
	match slapstand2 You both
	match slap1 You steady yourself when suddenly
	match slap1 Your point
	match slap1 You stare into
	match slap2 Tension seems
	match slap1 Point's mine
	match slap1 Point for me
	match slap1  My point
	match slapdone%1 USAGE:
	match slapdone%1 have completed
	matchwait

slapstand1:
	pause 1
	put stand
	match slap1 you stand
	match slapstand1 You struggle
	match slapstand1 wait
	matchwait

slapstand2:
	pause 1
	put stand
	match slap2 you stand
	match slapstand2 You struggle
	match slapstand2 wait
	matchwait

slapstand3:
	pause 1
	put stand
	match slap3 you stand
	match slapstand3 You struggle
	match slapstand3 wait
	matchwait

# slap
GLDslap:
	ECHO ******* SLAP PATTERN 2 **********
	pause 1
	save GLDslap
	put slap
	match GLDstand You probably
	match GLDDUCKstand you fall to your knees!
	match GLDSTOPstand ungracefully to the ground!
	match GLDduck Your point
	match GLDduck You move with lightning
	match GLDstop Point's mine
	match GLDstop Point for me
	match GLDstop My point
	match slapdone%1 Slap what?
	match slapdone%1 have completed
	matchwait

GLDduck:
	pause 1
	save GLDduck
	put duck
	match GLDstand You probably
	match GLDslap Tension seems to peak
	match GLDstop something?
	match GLDstop Your point
	match GLDslap Point's mine
	match GLDslap Point for me
	match GLDslap My point
	match slapdone%1 You duck your head
	match slapdone%1 have completed
	matchwait

# stop
GLDstop:
	pause 1
	save GLDstop
	put stop
	match GLDstand You probably
	match GLDDUCKstand *POW*
	match GLDslap You steady yourself when suddenly
	match GLDslap Your point
	match GLDduck You stare into
	match GLDduck Point's mine
	match GLDduck Point for me
	match GLDduck  My point
	match slapdone%1 USAGE:
	match slapdone%1 have completed
	matchwait

GLDSLAPstand:
	pause 1
	put stand
	match GLDslap you stand
	match GLDSLAPstand You struggle
	match GLDSLAPstand wait
	matchwait

GLDDUCKstand:
	pause 1
	put stand
	match GLDduck you stand
	match GLDDUCKstand You struggle
	match GLDDUCKstand wait
	matchwait

GLDSTOPstand:
	pause 1
	put stand
	match GLDstop you stand
	match GLDSTOPstand You struggle
	match GLDSTOPstand wait
	matchwait

GLDstand:
	pause 1
	put stand
	match %s you stand
	match GLDstand You struggle
	match GLDstand wait
	matchwait

# slap
GLDXslap:
	ECHO ******* SLAP PATTERN 3 **********
	pause 1
	save GLDXslap
	put slap
	match GLDXstand You probably
	match GLDXDUCKstand you fall to your knees!
	match GLDXSTOPstand ungracefully to the ground!
	match GLDXduck Your point
	match GLDXduck You move with lightning
	match GLDXslap2 Point's mine
	match GLDXslap2 Point for me
	match GLDXslap2 My point
	match slapdone%1 Slap what?
	match slapdone%1 have completed
	matchwait

GLDXslap2:
	pause 1
	save GLDXslap2
	put slap
	match GLDXstand You probably
	match GLDXDUCKstand you fall to your knees!
	match STOPstand ungracefully to the ground!
	match GLDXduck Your point
	match GLDXduck You move with lightning
	match GLDXstop Point's mine
	match GLDXstop Point for me
	match GLDXstop My point
	match slapdone%1 Slap what?
	match slapdone%1 have completed
	matchwait

GLDXduck:
	pause 1
	save GLDXduck
	put duck
	match GLDXstand You probably
	match GLDXslap Tension seems to peak
	match GLDXstop something?
	match GLDXstop Your point
	match GLDXduck2 Point's mine
	match GLDXduck2 Point for me
	match GLDXduck2 My point
	match slapdone%1 You duck your head
	match slapdone%1 have completed
	matchwait

GLDXduck2:
	pause 1
	save GLDXduck2
	put duck
	match GLDXstand You probably
	match GLDXslap Tension seems to peak
	match GLDXstop something?
	match GLDXstop Your point
	match GLDXslap Point's mine
	match GLDXslap Point for me
	match GLDXslap My point
	match slapdone%1 You duck your head
	match slapdone%1 have completed
	matchwait

# stop
GLDXstop:
	pause 1
	save GLDXstop
	put stop
	match GLDXstand You probably
	match GLDXDUCKstand *POW*
	match GLDXslap You steady yourself when suddenly
	match GLDXslap Your point
	match GLDXduck You stare into
	match GLDXstop2 Point's mine
	match GLDXstop2 Point for me
	match GLDXstop2  My point
	match slapdone%1 USAGE:
	match slapdone%1 have completed
	matchwait

GLDXstop2:
	pause 1
	save GLDXstop2
	put stop
	match GLDXstand You probably
	match GLDXDUCKstand *POW*
	match GLDXslap You steady yourself when suddenly
	match GLDXslap Your point
	match GLDXduck You stare into
	match GLDXduck Point's mine
	match GLDXduck Point for me
	match GLDXduck  My point
	match slapdone%1 USAGE:
	match slapdone%1 have completed
	matchwait

GLDXSLAPstand:
	pause 1
	put stand
	match GLDXslap you stand
	match GLDXSLAPstand You struggle
	match GLDXSLAPstand wait
	matchwait

GLDXDUCKstand:
	pause 1
	put stand
	match GLDXduck you stand
	match GLDXDUCKstand You struggle
	match GLDXDUCKstand wait
	matchwait

GLDXSTOPstand:
	pause 1
	put stand
	match GLDXstop you stand
	match GLDXSTOPstand You struggle
	match GLDXSTOPstand wait
	matchwait

GLDXstand:
	pause 1
	put stand
	match %s you stand
	match GLDXstand You struggle
	match GLDXstand wait
	matchwait

GLDYstop:
	ECHO ******* SLAP PATTERN 4 **********
	pause 1
	save GLDYstop
	put stop
	match GLDYstand You probably
	match GLDYDUCKstand *POW*
	match GLDYslap You steady yourself when suddenly
	match GLDYslap Your point
	match GLDYduck You stare into
	match GLDYduck Point's mine
	match GLDYslap Point for me
	match GLDYduck  My point
	match slapdone%1 USAGE:
	match slapdone%1 have completed
	matchwait

GLDYduck:
	pause 1
	save GLDYduck
	put duck
	match GLDYstand You probably
	match GLDYslap Tension seems to peak
	match GLDYstop something?
	match GLDYstop Your point
	match GLDYslap Point's mine
	match GLDYstop Point for me
	match GLDYslap My point
	match slapdone%1 You duck your head
	match slapdone%1 have completed
	matchwait

GLDYslap:
	pause 1
	save GLDYslap
	put slap
	match GLDYstand You probably
	match GLDYDUCKstand you fall to your knees!
	match GLDYSTOPstand ungracefully to the ground!
	match GLDYduck Your point
	match GLDYduck You move with lightning
	match GLDYstop Point's mine
	match GLDYduck Point for me
	match GLDYstop My point
	match slapdone%1 Slap what?
	match slapdone%1 have completed
	matchwait

GLDYSLAPstand:
	pause 1
	put stand
	match GLDYslap you stand
	match GLDYSLAPstand You struggle
	match GLDYSLAPstand wait
	matchwait

GLDYDUCKstand:
	pause 1
	put stand
	match GLDYduck you stand
	match GLDYDUCKstand You struggle
	match GLDYDUCKstand wait
	matchwait

GLDYSTOPstand:
	pause 1
	put stand
	match GLDYstop you stand
	match GLDYSTOPstand You struggle
	match GLDYSTOPstand wait
	matchwait

GLDYstand:
	pause 1
	put stand
	match %s you stand
	match GLDYstand You struggle
	match GLDYstand wait
	matchwait

slapdone:
slapdone0:
	put nod %s
	put out
	exit

slapdone1:
	put out
	put sw
	ECHO *** WAY TO GO SMARTY! ***
	GoTo %1RepCheck

slapdone2:
	put out
	move w
	move climb stair
	move e
	ECHO *** WAY TO GO SMARTY! ***
	GoTo %1RepCheck

slapdone3:
	put out
	move w
	ECHO *** WAY TO GO SMARTY! ***
	GoTo %1RepCheck

slapdone4:
	put out
	move e
	move ne
	move w
	ECHO *** WAY TO GO SMARTY! ***
	GoTo %1RepCheck

slapdone5:
	put out
	move sw
	ECHO *** WAY TO GO SMARTY! ***
	GoTo %1RepCheck

slapdone6:
     put out
     move down
     move northeast
     move climb ladder
     move east
     move north
     GoTo %1RepCheck

SlapDoneIllistim:
slapdone7:
    move out
    move south
    move go stair
    move north
    move north
    move north
    move west
    move west
    move west
    move go stair
    move west
    move south
    GoTo %1RepCheck


# ********************** END SLAP *************************

# ********************** STUNMAN *************************

startstunwork:
#Stun Master Work
guildstart31:
ECHO *** Stun Master Work
IF_3 GoTo startstunworkxxx
wait
ECHO ***
ECHO * You need a THIRD variable *
ECHO * The THIRD variable is your specific skill *
ECHO * SHIELD, WEAPON, etc *
ECHO * put exactly how it appears in the game *
ECHO * ex: (.guildx # # shield) *
ECHO ***
exit

startstunworkxxx:
wait
save %3
ECHO **************************************************
ECHO * Will work on STUN %s
GoTo startstunworkxxx%s

#ECHO * Uses (% user2) for stun technique
#ECHO * Uses (% user7) for ???

startstunworkxxxWEAPON:
ECHO * Uses (% weapon) as a variable for the weapon
ECHO * and (% sheath) as a variable for the container
ECHO **************************************************
ECHO
pause
GoTo StartStun%1

startstunworkxxxSHIELD:
ECHO * Uses (% shield) as a variable for the shield
ECHO **************************************************
ECHO
pause
GoTo StartStun%1

startstunworkxxxGET:
ECHO * Uses (% weapon2) as a variable for the item
ECHO * and (% sheath) as a variable for the container
ECHO **************************************************
ECHO
pause
GoTo StartStun%1

startstunworkxxxATTACK:
IF_4 ECHO * Will use the FOURTH variable to attack
IF_4 ECHO * This means the FOURTH variable has to be the master
IF_4 ECHO * you are working with. Which means it's probably
IF_4 ECHO * Best to start the script while in the dark corner.
IF_4 ECHO * Example: .guildx 1 ATTACK Sneck
IF_4 ECHO **************************************************
#IF_4 GoTo StunStart
IF_4 GoTo StartStun%1
ECHO * Will ATTACK the master you are working with
ECHO **************************************************
GoTo StartStun%1

startstunworkxxxSTAND:
startstunworkxxxSTANCE1:
startstunworkxxxSTANCE2:
startstunworkxxxMOVE:
ECHO * This is not verified, please post on the BBS or email me if any errors.
ECHO ***
ECHO
pause
GoTo StartStun%1

StartStunLanding:
StartStun1:
StunMasters1:
# Landing
put LooK
StunMastersLanding:
match StunMiller Master Footpad Miller
match StunMurphy Master Footpad Murphy
match StunO'Toole Master Footpad O'Toole
match StunReilly Master Footpad Reilly
match StunBean Master Footpad Bean
match StunHoulihan Master Footpad Houlihan
match LandingCourtyardStun Rogue Guild, Courtyard Center
match Stun1Stow%3 A Dark Corner
matchwait

StartStunTeras:
StartStun4:
StunMasters4:
StunMastersTeras:
# Teras
put LooK
match StunJimik Master Footpad Jimik
match StunFaldes Master Footpad Faldes
match StunHerit Master Footpad Herit
match StunGludac Master Footpad Gludac
match StunLagick Master Footpad Lagick
match StunZardak Master Footpad Zardak
match TerasCourtyardStun Training Administrator Runaire
match Stun1Stow%3 A Dark Corner
matchwait

StartStunSolhaven:
StartStun2:
StunMasters2:
# Solhaven
put LooK
StunMastersSolhaven:
match StunVarant Master Footpad Varant
match StunSneck Master Footpad Sneck
match StunOgdin Master Footpad Ogdin
match SolhavenCourtyardStun Milgrew
match StunTriaholly Master Footpad Triaholly
match Stun1Stow%3 A Dark Corner
matchwait

StartStunIcemule:
StartStun3:
StunMasters3:
StunMastersIcemule:
#Icemule
put LooK
match StunDuchel Master Footpad Duchel
match StunPalder Master Footpad Palder
match StunMeallan Master Footpad Meallan
#match StunTruaz Master Footpad Truaz
#match StunCuip Master Footpad Cuip
#match StunBuchara Master Footpad Buchara
match IcemuleCourtyardStun Training Administrator Teagais
match Stun1Stow%3 A Dark Corner
matchwait

StartStunRest:
StartStun5:
StunMasters5:
StunMastersRest:
put LooK
match StunHarith Master Footpad Harith
match StunJafar Master Footpad Jafar
match StunMubarak Master Footpad Mubarak
match StunSelima Master Footpad Selima
match RiverCourtyardStun Training Administrator Maliq
match Stun1Stow%3 A Dark Corner
matchwait

StunStartVaalor:
StartStun6:
StunStart6:
StunMasters6:
StunMastersVaalor:
put LooK
match VaalorCourtyardStun Training Administrator Flyndar
match StunTamis Master Footpad Tamis
match StunPyll Master Footpad Pyll
match StunDaranth Master Footpad Daranth
match StunSynelle Master Footpad Synelle
match StunYlldryll Master Footpad Ylldryll
match StunArynnor Master Footpad Arynnor
match Stun1Stow%3 A Dark Corner
matchwait

StunStartIllistim:
StartStun7:
StunStart7:
StunMasters7:
StunMastersIllistim:
put LooK
match IllistimCourtyardStun Training Administrator Boucher
match StunRitchie Master Footpad Ritchie
match StunVigil Master Footpad Vigil
match StunPurkhiser Master Footpad Purkhiser
match StunColvin Master Footpad Colvin
match Stun1Stow%3 A Dark Corner
matchwait


IllistimCourtyardStun:
move north
move east
move go stair
move east
move east
move east
move south
move south
move south
move go stair
move north
GoTo StunMastersIllistim

VaalorCourtyardStun:
move out
move west
move go panel
move southwest
move up
GoTo StunMastersVaalor

IcemuleCourtyardStun:
move west
GoTo StunMastersIcemule

SolhavenCourtyardStun:
move w
move climb stairs
put e
GoTo StunMastersSolhaven

TerasCourtyardStun:
move e
move sw
put w
GoTo StunMastersTeras

LandingCourtyardStun:
put ne
GoTo StunMastersLanding

RiverCourtyardStun:
move northeast
GoTo StunMastersRest

StunRitchie:
save Ritchie
put ask %s about train stun
GoTo StunStart

StunVigil:
save Vigil
put ask %s about train stun
GoTo StunStart

StunPurkhiser:
save Purkhiser
put ask %s about train stun
GoTo StunStart

StunColvin:
save Colvin
put ask %s about train stun
GoTo StunStart

StunArynnor:
save Arynnor
put ask %s about train stun
GoTo StunStart

StunYlldryll:
save Ylldryll
put ask %s about train stun
GoTo StunStart

StunSynelle:
save Synelle
put ask %s about train stun
GoTo StunStart

StunDaranth:
save Daranth
put ask %s about train stun
GoTo StunStart

StunPyll:
save Pyll
put ask %s about train stun
GoTo StunStart

StunTamis:
save Tamis
put ask %s about train stun
GoTo StunStart

StunSelima:
save Selima
put ask %s about train stun
GoTo StunStart

StunMubarak:
save Mubarak
put ask %s about train stun
GoTo StunStart

StunJafar:
save Jafar
put ask %s about train stun
GoTo StunStart

StunHarith:
save Harith
put ask %s about train stun
GoTo StunStart

stunDUCHEL:
save Duchel
put ask %s about train stun
GoTo stunstart

stunPALDER:
save Palder
put ask %s about train stun
GoTo stunstart

stunMEALLAN:
save Meallan
put ask %s about train stun
GoTo stunstart

stuntriaholly:
save Triaholly
put ask %s about train stun
GoTo stunstart

stunogdin:
save Ogdin
put ask %s about train stun
GoTo stunstart

stunsneck:
save Sneck
put ask %s about train stun
GoTo stunstart

stunvarant:
save Varant
put ask %s about train stun
GoTo stunstart

stunzardak:
save Zardak
put ask %s about train stun
GoTo stunstart

stunlagick:
save Lagick
put ask %s about train stun
GoTo stunstart

stungludac:
save Gludac
put ask %s about train stun
GoTo stunstart

stunherit:
save Herit
put ask %s about train stun
GoTo stunstart

stunfaldes:
save Faldes
put ask %s about train stun
GoTo stunstart

stunjimik:
save Jimik
put ask %s about train stun
GoTo stunstart

stunmiller:
save Miller
put ask %s about train stun
GoTo stunstart

stunmurphy:
save Murphy
put ask %s about train stun
GoTo stunstart

stunbean:
save Bean
put ask %s about train stun
GoTo stunstart

stuno'toole:
save O'toole
put ask %s about train stun
GoTo stunstart

stunReilly:
save Reilly
put ask %s about train stun
GoTo stunstart

stunHoulihan:
save Houlihan
put ask %s about train stun
GoTo stunstart

stunstart:
IF_4 save %3
IF_4 wait
IF_4 put unstun
IF_4 wait
IF_4 GoTo SELFstun1stow%s
put grin %s
match stun1pause25 You are stunned!
match stun1stow%3 chuckles and says
match stun1stow%3 says triumphantly
match stun1stow%3 Type NOD to begin
match NoGuildWorkAssigned Da Trainin' Administrator must tell yas to work wit' me here
match NoGuildWorkAssigned gives you a strange look
matchwait

stun1stowSHIELD:
ECHO *****
ECHO * Need to have variable (% shield) specified as your "shield". Or ERROR could occur ****
ECHO *****
put glance
match STUNSHIELDstowshield %shield
match stun1 empty hands
match stun1 left hand
match stun1 right hand
matchwait

STUNSHIELDstowshield:
put wear my %shield
match stun1 You sling
match stun1 already wearing
match stun1 You put
match STUNSHIELDstowshieldWear Wear what?
match SSHIELDstshieldstunned stunned
match SSHIELDstshieldwait wait
matchwait

STUNSHIELDstowshieldWear:
pause
ECHO *** No shield found to put away
ECHO *** Attempting to continue
goto stun1


SSHIELDstshieldstunned:
waitfor are able to move
GoTo STUNSHIELDstowshield

SSHIELDstshieldwait:
pause 1
GoTo STUNSHIELDstowshield


stun1stowWEAPON:
ECHO ****
ECHO * Need to have variable (% weapon) specified as your "weapon". Or ERROR could occur **
ECHO ****
put glance
match STUNWEAPONstow %weapon
match stun1 empty hands
match stun1 left hand
match stun1 right hand
matchwait

STUNWEAPONstow:
put put %weapon in my %sheath
match stun1 could not find what you were referring to
match stun1 You put
match stun1 You slide your
match STUNWEAPONstowstunned stunned
match STUNWEAPONstowwait wait
matchwait

STUNWEAPONstowstunned:
waitfor are able to move
GoTo STUNWEAPONstow

STUNWEAPONstowwait:
pause 1
GoTo STUNWEAPONstow

stun1stowGET:
STUNGETstow:
put put my %weapon2 in my %sheath
match stun1 You put
match stun1 You slide your
match stun1 could not
match stun1stowGETstunned stunned
matchwait

stun1stowGETstunned:
waitfor are able to move again.
GoTo stun1stowGET

stun1stowSTAND:
STUNSTANDstow:
put lay
match stun1 You lie down
match stun1 and lie down
match stun1 already lying
match STUNSTANDstowstunned stunned
match STUNSTANDstowwait wait
matchwait

STUNSTANDstowstunned:
waitfor are able to move
GoTo STUNSTANDstow

STUNSTANDstowwait:
pause 2
GoTo GoTo STUNSTANDstow

stun1stowSTANCE1:
STUNSTANCE1stow:
put stance off
match stun1 are now in an offensive stance
match STUNSTANCE1stowstunned stunned
match STUNSTANCE1stowwait wait
matchwait

STUNSTANCE1stowstunned:
waitfor are able to move
GoTo stun1stowSTANCE1

STUNSTANCE1stowwait:
pause 2
GoTo stun1stowSTANCE1


stun1stowSTANCE2:
STUNSTANCE2stow:
put stance off
match stun1 are now in an offensive stance
match STUNSTANCE2stowstunned stunned
match STUNSTANCE2stowwait wait
matchwait

STUNSTANCE2stowstunned:
waitfor are able to move
GoTo stun1stowSTANCE2

STUNSTANCE2stowwait:
pause 2
GoTo stun1stowSTANCE2

STUNATTACKerror:
ECHO ************************************************************
ECHO * Sorry but we aren't allowed to actually kill the masters.
ECHO * Put your weapon away again and start the script over
ECHO ************************************************************
exit

stun1stowATTACK:
# This is already done previously
goto stun1
# will this need to be used???
match ATTACKjimik Master Footpad Jimik
match ATTACKfaldes Master Footpad Faldes
match ATTACKherit Master Footpad Herit
match ATTACKgludac Master Footpad Gludac
match ATTACKlagick Master Footpad Lagick
match ATTACKzardak Master Footpad Zardak
match ATTACKmiller Master Footpad Miller
match ATTACKmurphy Master Footpad Murphy
match ATTACKo'toole Master Footpad O'Toole
match ATTACKreilly Master Footpad Reilly
match ATTACKbean Master Footpad Bean
match ATTACKhoulihan Master Footpad Houlihan
match ATTACKvarant Master Footpad Varant
match ATTACKsneck Master Footpad Sneck
match ATTACKogdin Master Footpad Ogdin
match ATTACKtriaholly Master Footpad Triaholly
match ATTACKDuchel Master Footpad Duchel
match ATTACKPalder Master Footpad Palder
match ATTACKMeallan Master Footpad Meallan
match ATTACKHarith Master Footpad Harith
match ATTACKJafar Master Footpad Jafar
match ATTACKMubarak Master Footpad Mubarak
match ATTACKSelima Master Footpad Selima
match ATTACKTamis Master Footpad Tamis
match ATTACKPyll Master Footpad Pyll
match ATTACKDaranth Master Footpad Daranth
match ATTACKSynelle Master Footpad Synelle
match ATTACKYlldryll Master Footpad Ylldryll
match ATTACKArynnor Master Footpad Arynnor
matchwait
# 29/32 matches used

ATTACKDuchel:
save Duchel
GoTo stun1

ATTACKPalder:
save Palder
GoTo stun1

ATTACKMeallan:
save Meallan
GoTo stun1

ATTACKHarith:
save Harith
GoTo stun1

ATTACKJafar:
save Jafar
GoTo stun1

ATTACKMubarak:
save Mubarak
GoTo stun1

ATTACKSelima:
save Selima
GoTo stun1

ATTACKTamis:
save Tamis
GoTo stun1

ATTACKPyll:
save Pyll
GoTo stun1

ATTACKDaranth:
save Daranth
GoTo stun1

ATTACKSynelle:
save Synelle
GoTo stun1

ATTACKYlldryll:
save Ylldryll
GoTo stun1

ATTACKArynnor:
save Arynnor
GoTo stun1

ATTACKjimik:
save Jimik
GoTo stun1

ATTACKfaldes:
save Faldes
GoTo stun1

ATTACKherit:
save Herit
GoTo stun1

ATTACKgludac:
save Gludac
GoTo stun1

ATTACKlagick:
save Lagick
GoTo stun1

ATTACKzardak:
save Zardak
GoTo stun1

ATTACKmiller:
save Miller
GoTo stun1

ATTACKmurphy:
save Murphy
GoTo stun1

ATTACKo'toole:
save O'Toole
GoTo stun1

ATTACKreilly:
save Reilly
GoTo stun1

ATTACKbean:
save Bean
GoTo stun1

ATTACKhoulihan:
save Houlihan
GoTo stun1

ATTACKvarant:
save Varant
GoTo stun1

ATTACKsneck:
save Sneck
GoTo stun1

ATTACKogdin:
save Ogdin
GoTo stun1

ATTACKtriaholly:
save Triaholly
GoTo stun1


STUNATTACKstow:
ECHO *********************************************************************
ECHO * Something went wrong and the Master did not get saved
ECHO * Start the script again from the room where all the masters are
ECHO * If the problem persist, email me
ECHO *
ECHO *********************************************************************
put out
exit


#stun1stowMOVE
stun1:
	IF_4 save %3
	IF_4 GoTo SELFstun1stow%s
	put nod
	match stun1pause25 You are stunned!
#	match stun1waitfor You are still stunned
	match stun1%3 You are still stunned
	match stun1pause wait
	matchwait

stun1waitfor:
	waitfor able to move
	GoTo stun1

stun1pause:
	pause 5
	GoTo stun1

stun1pause25:
	pause 2
	GoTo stun1%3

stun1SHIELD:
	put StuN shield
	put unstun
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNSHIELDstowshield You already
	match STUNSHIELDstowshield repetition(s) remaining
	matchwait

stun1WEAPON:
	put StuN weapon
	put unstun
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNWEAPONstow You already
	match STUNWEAPONstow repetition(s) remaining
	matchwait

stun1GET:
	put StuN get %weapon2
	put unstun
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNGETstow You already
	match STUNGETstow repetition(s) remaining
	matchwait

stun1STAND:
	put StuN stand
	put unstun
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNSTANDstow You already
	match STUNSTANDstow You are already
	match STUNSTANDstow repetition(s) remaining
	matchwait

stun1STANCE1:
	put StuN stance1
	put unstun
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNSTANCE1stow You already
	match STUNSTANCE1stow repetition(s) remaining
	matchwait


stun1ATTACK:
	put StuN AttacK %s
	put unstun
	match stun1 dodges your attack easily
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNATTACKerror Wait a minute!  This is just a training exercise
	match STUNATTACKstow Attack what?
	match STUN1stowATTACK repetition(s) remaining
	matchwait

stun1STANCE2:
	put StuN stance2
	put unstun
	match stun1 You're not stunned
	match stun1 try to command
	match stundone have completed
	match STUNSTANCE2stow You already
	match STUNSTANCE2stow repetition(s) remaining
	matchwait



#stun1MOVE

#NOT USED??
stunput:
	pause
	put %user7
	#put put my %weapon2 in my %sheath
	put smirk
	match stun1 lie down
	match stun1 fall over
	match stun1 You put
	match stun1 You slide your
	match stun1 could not find
	match stunput You are still
	match stunput wait
	matchwait

stundone:
	put nod %s
	put out
	GoTo stundone%1

stundone1:
stundonelanding:
move sw
GoTo %1RepCheck

stundone2:
stundonesolhaven:
move w
move clim stair
move e
GoTo %1RepCheck

stundone3:
stundoneicemule:
move e
GoTo %1RepCheck

stundone4:
stundoneteras:
move e
move ne
move w
GoTo %1RepCheck

StunDoneRest:
stundone5:
stundoneriverrest:
move sw
GoTo %1RepCheck

stundone6:
stundonevaalor:
move down
move climb ladder
move east
move north
GoTo %1RepCheck

stundone7:
stundoneillistim:
move south
move go stair
move north
move north
move north
move west
move west
move west
move go stair
move west
move south
GoTo %1RepCheck

stundonexit:
	ECHO ************************
	ECHO * Good job. Now what?? *
	ECHO ************************
	exit

stunmis:
	ECHO *** Fix it!! ***
	put out
	exit

# ********************** END STUNMAN *************************

# ********************** SELF STUNMAN *************************

SELFSTUNsaveSHIELD:
#Stun Self Shield
guildstart34:
ECHO *** Shield - Self Stunman
counter set 1
save SHIELD
GoTo SELFstun1stow%s

SELFSTUNsaveWEAPON:
#Stun Self Weapon
guildstart35:
ECHO *** Weapon - Self Stunman
counter set 1
save WEAPON
GoTo SELFstun1stow%s

SELFSTUNsaveGET:
#Stun Self  Get
guildstart36:
ECHO *** Get - Self Stunman
ECHO *** Will use variables % weapon2 and % sheath
pause
counter set 1
save GET
GoTo SELFstun1stow%s

SELFSTUNsaveSTAND:
#Stun Self  Stand
guildstart37:
ECHO *** Stand - Self Stunman
counter set 1
save STAND
GoTo SELFstun1stow%s

SELFSTUNsaveSTANCE1:
#Stun Self Stance1
guildstart38:
ECHO *** Stance 1 - Self Stunman
counter set 1
save STANCE1
GoTo SELFstun1stow%s

SELFSTUNsaveSTANCE2:
#SELFSTUNsaveSTANCE2
guildstart310:
save %2
ECHO *** Stance 2 - Self Stunman
#GoTo Guild_Stamina
GoTo GLD_Stam_310

Gld_Stam_310:
counter set 1
save STANCE2
GoTo SELFstun1stow%s

SELFSTUNsaveATTACK:
#Stun Self Attack
guildstart39:
ECHO *** Attack - Self Stunman
save %2
#GoTo Guild_Stamina
GoTo Gld_Stam_39

Gld_Stam_39:
counter set 1
save ATTACK
GoTo SELFstun1stow%s

#SELFSTUNsaveMOVE
#Stun Self Move
guildstart311:
ECHO *** Move - Self Stunman
ECHO ***
ECHO * NOT DONE YET
ECHO ***
exit

# ***** SELF SHIELD STUN ****

SELFstun1stowSHIELD:
ECHO *****
ECHO * Need to have variable (% shield) specified as your "shield". Or ERROR could occur     ****
ECHO * If you have variable (% shield) empty, you will get the "No Match String" found error ****
ECHO * If you need instructions on variables, Exit the script and start .guildx variables    ****
ECHO *****
put glance
match SSSHIELDstowshield %shield
match SELFstun1 empty hands
match SELFstun1 left hand
match SELFstun1 right hand
matchwait

SSSHIELDstowshield:
put wear my %shield
match SELFstun1%c You sling
match SELFstun1%c already wearing
match SELFstun1%c You put
match SSSHIELDstowshieldWear Wear what?
match SSSHIELDstshieldstunned stunned
match SSSHIELDstowshieldwait wait
matchwait

SSSHIELDstowshieldWear:
pause
ECHO *** No shield found to put away
ECHO *** Attempting to continue
goto SELFstun1%c


SSSHIELDstshieldstunned:
pause 2
GoTo SSSHIELDstowshield

SSSHIELDstowshieldwait:
pause 1
GoTo SSSHIELDstowshield

# ***** SELF WEAPON STUN ****

SELFstun1stowWEAPON:
ECHO ****
ECHO * Need to have variable (% weapon) specified as your "weapon". Or ERROR could occur **
ECHO ****
put glance
match SELFSTUNWEAPONstow %weapon
match SELFstun1 empty hands
match SELFstun1 left hand
match SELFstun1 right hand
matchwait

SELFSTUNWEAPONstow:
put put %weapon in my %sheath
match SELFstun1%c You put
match SELFstun1%c You slide your
match SELFSTUNWEAPONstowstunned stunned
match SELFSTUNWEAPONstowwait wait
matchwait

SELFSTUNWEAPONstowstunned:
pause 2
GoTo SELFSTUNWEAPONstow

SELFSTUNWEAPONstowwait:
pause 1
GoTo SELFSTUNWEAPONstow

# ***** SELF GET STUN ****

SELFstun1stowGET:
SELFSTUNGETstow:
put put my %weapon2 in my %sheath
match SELFstun1%c You put
match SELFstun1%c You slide your
match SELFstun1%c could not
match SELFstun1stowGETstunned stunned
matchwait

SELFstun1stowGETstunned:
pause 2 again.
GoTo SELFstun1stowGET

# ***** SELF STAND STUN ****

SELFstun1stowSTAND:
put lay
match SELFstun1 You lie down
match SELFstun1 and lie down
match SELFstun1 already lying
match SELFSTUNSTANDstowstunned stunned
match SELFSTUNSTANDstowwait wait
matchwait

SELFSTUNSTANDstow:
put lay
match SELFstun1%c You lie down
match SELFstun1%c and lie down
match SELFstun1%c already lying
match SELFSTUNSTANDstowstunned stunned
match SELFSTUNSTANDstowwait wait
matchwait

SELFSTUNSTANDstowstunned:
put LooK
match SELFSTUNSTANDstowstunned1st A Dark Corner
match SELFSTUNSTANDstowstunned2nd Obvious paths:
matchwait

SELFSTUNSTANDstowstunned1st:
waitfor You are able to move again
put stand
put out
GoTo Stunmasters

SELFSTUNSTANDstowstunned2nd:
pause 2
GoTo SELFSTUNSTANDstow

SELFSTUNSTANDstowwait:
pause 2
GoTo SELFSTUNSTANDstow

# ***** SELF STANCE1 STUN ****

SELFstun1stowSTANCE1:
put stance off
match SELFstun1 are now in an offensive stance
match SELFSTUNSTANCE1stowstunned stunned
match SELFSTUNSTANCE1stowwait wait
matchwait

SELFSTUNSTANCE1stowstunned:
pause 2
GoTo stun1stowSTANCE1

SELFSTUNSTANCE1stowwait:
pause 2
GoTo stun1stowSTANCE1

SELFstun1STANCE1:
	put StuN stance1
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNSTANCE1stow You already
	match SELFSTUNSTANCE1stow repetition(s) remaining
	matchwait

SELFSTUNSTANCE1stow:
	put stance off
	match SELFstun1%c are now in an offensive stance
	match SELFSTUNroomcheck stunned
	match SELFSTUNSTANCE1stowwait wait
	matchwait

SELFSTUNSTANCE1stowwait:
pause 2
GoTo SELFSTUNSTANCE1stow:

# ***** SELF ATTACK STUN ****

SELFstun1stowATTACK:
#IF_4 GoTo SELFstun1
IF_3 GoTo SELFstun1
wait
ECHO *******************************************
ECHO * Uses the THIRD variable as the target
ECHO * Usage: .guildx # 39 <target>
ECHO * Example: .guildx # 39 Bladenight
ECHO *******************************************
exit

SELFstun1ATTACK:
	IF_5 goto SELFstun1ATTACK3
	IF_4 goto SELFstun1ATTACK2
	put StuN AttacK %3
	match SELFSTUNATTACKerror Attack what?
	match SELFSTUNATTACKerror not around here
	match SELFSTUNATTACKerror could not find
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNATTACKstow You already
	match SELFSTUNATTACKstow repetition(s) remaining
	matchwait

SELFstun1ATTACK2:
	put StuN AttacK %4
	match SELFSTUNATTACKerror Attack what?
	match SELFSTUNATTACKerror not around here
	match SELFSTUNATTACKerror could not find
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNATTACKstow You already
	match SELFSTUNATTACKstow repetition(s) remaining
	matchwait

SELFstun1ATTACK3:
	put StuN AttacK %5
	match SELFSTUNATTACKerror Attack what?
	match SELFSTUNATTACKerror not around here
	match SELFSTUNATTACKerror could not find
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNATTACKstow You already
	match SELFSTUNATTACKstow repetition(s) remaining
	matchwait


SELFSTUNATTACKstow:
	GoTo SELFstun1%c

SELFSTUNATTACKerror:
ECHO ************************************************
ECHO * What are you trying to attack?
ECHO * Your THIRD variable has to be a valid target
ECHO ************************************************
exit


# ***** SELF STANCE2 STUN ****

SELFstun1stowSTANCE2:
put stance off
match SELFstun1 are now in an offensive stance
match SELFSTUNSTANCE2stowwait stunned
match SELFSTUNSTANCE2stowwait wait
matchwait

SELFSTUNSTANCE2stowwait:
pause 2
GoTo SELFstun1stowSTANCE2

SELFstun1STANCE2:
	put StuN stance2
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNSTANCE2stow You already
	match SELFSTUNSTANCE2stow repetition(s) remaining
	matchwait

SELFSTUNSTANCE2stow:
	put stance off
	match SELFstun1%c are now in an offensive stance
	match SELFSTUNroomcheck stunned
	match SELFSTUNSTANCE2stowwait wait
	matchwait

SELFSTUNSTANCE2stowwait:
pause 2
GoTo SELFSTUNSTANCE2stow:


# ***** SELF MOVE STUN ****

# SELFstun1stowMOVE

SELFSTUNroomcheck:
put LooK
match SELFSTUNroomcheck1st A Dark Corner
match SELFSTUNroomcheck2nd Obvious paths:
matchwait

SELFSTUNroomcheck1st:
waitfor You are able to move again
put stand
put out
GoTo Stunmasters

SELFSTUNroomcheck2nd:
pause 2
GoTo SELFSTUN%sstow

#Implement badelaire section
SELFstun1:
	IF_4 goto SELFstunSPECIAL
	IF_4 save %3
	put glance
	match SELFstun1pause still stunned
	match SELFgetrumstun empty hands
	match SELFstun1skull skull
	match SELFstun1badelaire badelaire
	match SELFstun1drink rum in your left hand
	match SELFstun1drink rum in your right hand
	matchwait

SELFstunSPECIAL:
#CPOREMOVE
ECHO ***
ECHO * NOTICE!!!
ECHO * This requires variable 4 to be either
ECHO * ANKLET or CHAIN or SKULL or RUM or SPECIAL (Special not completed yet) (exactly)
ECHO * or BRIG or CUIRASS or ARMOR or KATAR (exactly)
ECHO * For instructiosn to remove this notice use REMOVE on the 4th variable
ECHO ***
#CPOREMOVE
goto SELFstun1%4
goto ExitGuildx

SELFstun14wait:
pause
GoTo SELFstun1%4

SELFstun17:
SELFstun1BRIG:
SELFstun1CUIRASS:
SELFstun1ARMOR:
counter set 7
put poke my %4
match SELFstun17 ..wait
match SELFstun17 You rap a finger hard
match SELFstun1pause That hurt!
match SELFstun1pause still stunned
matchwait

SELFstun16:
SELFstun1CHAIN:
	counter set 5
	put remove my chain
	match SELFstun1pause still stunned
	match SELFstun1pauseSPECIAL You struggle to remove your
	match SELFstun16wait wait
	match SELFstun1SPECIALget could not find
	matchwait

SELFstun15:
SELFstun1ANKLET:
	counter set 5
	put remove my anklet
	match SELFstun1pause still stunned
	match SELFstun1pauseSPECIAL You struggle to remove your gold anklet
	match SELFstun15wait wait
	match SELFstun1SPECIALget could not find
	matchwait

SELFstun15wait:
SELFstun16wait:
	pause 2
	GoTo SELFstun1%c

SELFstun1pauseSPECIAL:
	pause 29
	GoTo SELFstun1%s

SELFstun1SPECIALget:
	ECHO ***
	ECHO * You are not wearing the appropriate item
	ECHO * Script can not continue
	ECHO ***
	goto ExitGuildx


SELFstun18:
SELFstun1KATAR:
	counter set 8
	put PokE my badelaire
	match SELFstun1pause still stunned
	match SELFstun1pauseKATAR As you poke your
	match SELFstun14wait ..wait
	match SELFstun1KATARget could not find
	matchwait

SELFstun14:
	put PokE my badelaire
	match SELFstun1pause still stunned
	match SELFstun1pauseBADELAIRE As you poke your badelaire
	match SELFstun14wait wait
	match SELFstun1BADELAIREget could not find
	matchwait

SELFstun14wait:
	pause 2
	GoTo SELFstun1%c

SELFstun1KATARget:
	IF_4 put UNSTUN
	put GeT my katar
	match SELFnoitemtoget could not find
	match SELFstun1pauseKATAR stunned
	match SELFstun1KATARget ..wait
	match SELFstun1Katar already have
	match SELFstun1Katar You get
	match SELFstun1Katar You remove
	matchwait


SELFstun1BADELAIREget:
	IF_4 put UNSTUN
	put GeT my badelaire
	match SELFnoitemtoget could not find
	match SELFstun1pauseBADELAIRE stunned
	match SELFstun1BADELAIREgetwait wait
	match SELFstun1%c already have
	match SELFstun1%c You get
	match SELFstun1%c You remove
	matchwait

SELFstun1BADELAIREgetwait:
	pause
	GoTo SELFstun1BADELAIREget

SELFstun13:
	IF_4 put UNSTUN
	IF_4 put lick my skull
	IF_4 match SELFstun13wait ...wait
	IF_4 match SELFstun1pauseSKULL You stick out your tongue to lick
	IF_4 match SELFstun1pauseSKULL stunned
	IF_4 match SELFstun1skullget could not find
	IF_4 matchwait
	put RuB my skull
	match SELFstun13wait ...wait
	match SELFstun1pauseSKULL and then the vision ends
	match SELFstun1pauseSKULL stunned
	match SELFstun1skullget could not find
	matchwait

SELFstun13wait:
	pause 2
	GoTo SELFstun13

SELFstungetskull:
SELFstun1skullget:
	put GeT my skull
	match SELFnoitemtoget could not find
	match SELFstun1skull already have
	match SELFstun1skull You get
	match SELFstun1skull You remove
	match SELFstun1pauseSKULL stunned
	match SELFstun1skullgetwait wait
	matchwait

SELFstun1skullgetwait:
	pause 2
	GoTo SELFstun1skullget

SELFstun1badelaire:
	counter set 4
	GoTo SELFstun1%c


SELFstun1skull:
	counter set 3
	GoTo SELFstun1%c

SELFstun12:
SELFstun1RUM:
SELFgetrumstun:
	counter set 1
	put GeT rum
	put swap
	match SELFstun1drink refreshing rum
	match SELFstun1drink You remove
	match SELFstun1drink already
	match SELFstun1norum could not find
	match SELFstun1norum Get what?
	match SELFstun1freehand need a free hand
	match SELFstun1wait wait
	match SELFstun1wait stunned
	matchwait

SELFstun1freehand:
ECHO ***
ECHO * Need to get rid of something you are holding *
ECHO ***
exit

SELFstun1wait:
pause 1
GoTo SELFgetrumstun

SELFstun1norum:
ECHO ***
ECHO * NO MORE RUM!!!! RUN!!! **
ECHO ***
pause
ECHO ***
ECHO * Will try to get skull
ECHO ***
GoTo SELFstungetskull

SELFstun1NOITEM:
ECHO ***
ECHO * Choose an item to use or go get some rum/special!
ECHO * Skull - 001
ECHO * ANKLET - 002
ECHO * CHAIN - 003
ECHO * RUM - 004
ECHO * SPECIAL - 005
ECHO * BRIG - 006
ECHO * CUIRASS - 007
ECHO * ARMOR - 008
match SELFstun1SKULL 001
match SELFstun1ANKLET 002
match SELFstun1CHAIN 003
match SELFstun1RUM 004
match SELFstun1SPECIAL 005
match SELFstun1BRIG 006
match SELFstun1CUIRASS 007
match SELFstun1ARMOR 008
matchwait

SELFnoitemtoget:
ECHO ***
ECHO * YOU DON'T HAVE THE REQUIRED ITEM!
ECHO ***
exit

SELFstun11:
SELFstun1drink:
	IF_4 put UNSTUN
	put drink my rum
	match SELFgetrumstun not holding some
	match SELFgetrumstun could not find
	match SELFgetrumstun What were you referring to?
	match SELFstun1pauselstdrp That was the last drop.
	match SELFstun1pause are stunned
	match SELFstun1pause are still stunned
	match SELFstun1drinkwait wait
	matchwait

	SELFstun1drinkwait:
	pause 1
	GoTo SELFstun1drink


SELFstun1pauseKATAR:
	#KATAR_PAUSE_TIME
	pause 25
	GoTo SELFstun1%s


SELFstun1pauseBADELAIRE:
	#BADELAIRE_PAUSE_TIME
	pause 12
	GoTo SELFstun1%s

SELFstun1pauseSKULL:
	IF_4 ECHO ** 13 **
	IF_4 pause 12
	IF_4 GoTo SELFstun1%s
	pause 12
	GoTo SELFstun1%s

SELFstun1pauselstdrp:
	counter set 2
	pause 3
	GoTo SELFstun1%s

SELFstun1pause:
	pause 3
	GoTo SELFstun1%s

SELFstun1pause:
	pause 3
	GoTo SELFstun1%s

SELFstun1SHIELD:
	put StuN shield
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SSSHIELDstowshield You already
	match SSSHIELDstowshield repetition(s) remaining
	matchwait

SELFstun1WEAPON:
	put StuN weapon
	match SELFstun1WEAPONswap You can't do that now!
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNWEAPONstow You already
	match SELFSTUNWEAPONstow repetition(s) remaining
	matchwait

SELFstun1WEAPONswap:
	put swap
	match SELFstun1WEAPON You swap
	match SELFstun1WEAPONswapPause ..wait
	match SELFstun1WEAPONswapPause stunned
	matchwait

SELFstun1WEAPONswappause:
pause 2
goto SELFstun1WEAPONswap
SELFstun1GET:
	put StuN get %weapon2
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNGETstow You already
	match SELFSTUNGETstow repetition(s) remaining
	matchwait

SELFstun1STAND:
	put StuN stand
	match SELFstun1%c You're not stunned
	match SELFstun1%c try to command
	match SELFstundone have completed
	match SELFSTUNSTANDstow You already
	match SELFSTUNSTANDstow repetition(s) remaining
	matchwait

#SELFstun1STANCE1
#SELFstun1STANCE2
#SELFstun1ATTACK
#SELFstun1MOVE


SELFstundone:
	ECHO
	ECHO Good job. Now what??
	ECHO
	put out
	exit

# ********************** END SELF STUNMAN *************************

# ********************** CHEAPSHOT *************************

cheapmasterstart:
#Cheapshot on Masters
guildstart51:
ECHO *** Cheapshot
ECHO ***
ECHO * CHEAPSHOT WITH A MASTER
ECHO ***
GoTo CheapMasterStart%1

CheapMasterStartLanding:
CheapMasterStart1:
put LooK
match CheapMasterMiller Master Footpad Miller
match CheapMasterMurphy Master Footpad Murphy
match CheapMasterO'Toole Master Footpad O'Toole
match CheapMasterReilly Master Footpad Reilly
match CheapMasterBean Master Footpad Bean
match CheapMasterHoulihan Master Footpad Houlihan
match LandingCheapMasterStart Training Administrator DeLuca
matchwait

CheapMasterStartSolhaven:
CheapMasterStart2:
put LooK
match CheapMasterOgdin Master Footpad Ogdin
match CheapMasterVarant Master Footpad Varant
match CheapMasterTriaholly Master Footpad Triaholly
match CheapMasterSneck Master Footpad Sneck
match SolhavenCheapMasterStart Training Administrator Milgrew
matchwait

CheapMasterStartIcemule:
CheapMasterStart3:
put LooK
match IcemuleCheapMasterStart Training Administrator Teagais
match CheapMasterDuchel Master Footpad Duchel
match CheapMasterPalder Master Footpad Palder
match CheapMasterMeallan Master Footpad Meallan
matchwait

CheapMasterStartTeras:
CheapMasterStart4:
put LooK
match CheapMasterJimik Master Footpad Jimik
match CheapMasterFaldes Master Footpad Faldes
match CheapMasterHerit Master Footpad Herit
match CheapMasterGludac Master Footpad Gludac
match CheapMasterLagick Master Footpad Lagick
match CheapMasterZardak Master Footpad Zardak
match TerasCheapMasterStart Training Administrator Runaire
matchwait

CheapMasterStartRest:
CheapMasterStart5:
match CheapMasterHarith Master Footpad Harith
match CheapMasterJafar Master Footpad Jafar
match CheapMasterMubarak Master Footpad Mubarak
match CheapMasterSelima Master Footpad Selima
match RiverCheapMasterStart Training Administrator Maliq
matchwait

CheapMasterStartVaalor:
CheapMasterStart6:
put LooK
match VaalorCheapMasterStart Training Administrator Flyndar
match CheapMasterTamis Master Footpad Tamis
match CheapMasterPyll Master Footpad Pyll
match CheapMasterDaranth Master Footpad Daranth
match CheapMasterSynelle Master Footpad Synelle
match CheapMasterYlldryll Master Footpad Ylldryll
match CheapMasterArynnor Master Footpad Arynnor
matchwait

CheapMasterStartIllistim:
CheapMasterStart7:
put LooK
match IllistimCheapMasterStart Training Administrator Boucher
match CheapMasterRitchie Master Footpad Ritchie
match CheapMasterVigil Master Footpad Vigil
match CheapMasterPurkhiser Master Footpad Purkhiser
match CheapMasterColvin Master Footpad Colvin
matchwait

IllistimCheapMasterStart:
move north
move east
move go stair
move east
move east
move east
move south
move south
move south
move go stair
move north
GoTo CheapMasterStartIllistim

IcemuleCheapMasterStart:
put w
GoTo CheapMasterStartIcemule

SolhavenCheapMasterStart:
move w
move climb stairs
put e
GoTo CheapMasterStartSolhaven

TerasCheapMasterStart:
move e
move sw
put w
GoTo CheapMasterStartTeras

LandingCheapMasterStart:
put ne
GoTo CheapMasterStartLanding

RiverCheapMasterStart:
move northeast
GoTo CheapMasterStartRest

VaalorCheapMasterStart:
move out
move west
move go panel
move southwest
move up
GoTo CheapMasterStartVaalor

CheapMasterRitchie:
save Ritchie
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterVigil:
save Vigil
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterPurkhiser:
save Purkhiser
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterColvin:
save Colvin
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterHarith:
save Harith
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterJafar:
save Jafar
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterMubarak:
save Mubarak
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterSelima:
save Selima
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterTamis:
save Tamis
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterPyll:
save Pyll
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterDaranth:
save Daranth
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterSynelle:
save Synelle
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterYlldryll:
save Ylldryll
put ask %s about train cheapshots
GoTo StartCheapMaster

CheapMasterArynnor:
save Arynnor
put ask %s about train cheapshots
GoTo StartCheapMaster

cheapmasterDUCHEL:
save Duchel
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterPALDER:
save Palder
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterMEALLAN:
save Meallan
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastervarant:
save Varant
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastertriaholly:
save Triaholly
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastersneck:
save Sneck
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterogdin:
save Ogdin
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterzardak:
save Zardak
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterlagick:
save Lagick
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastergludac:
save Gludac
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterherit:
save Herit
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterfaldes:
save Faldes
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterjimik:
save Jimik
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastermiller:
save Miller
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastermurphy:
save Murphy
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterbean:
save Bean
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmastero'toole:
save O'toole
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterReilly:
save Reilly
put ask %s about train cheapshots
GoTo startcheapmaster

cheapmasterHoulihan:
save Houlihan
put ask %s about train cheapshots
GoTo startcheapmaster

startcheapmaster:
ECHO ***
ECHO * Waiting for type of CheapShot
ECHO ***
match startcheapmasterFOOT Type CHEAPSHOT FOOTSTOMP
match startcheapmasterNOSE Type CHEAPSHOT NOSETWEAK
match startcheapmasterTEMPLE Type CHEAPSHOT TEMPLESHOT
match startcheapmasterKNEE Type CHEAPSHOT KNEEBASH
match startcheapmasterEYE Type CHEAPSHOT EYEPOKE
match startcheapmasterTHROAT Type CHEAPSHOT THROATCHOP
match startcheapmasterSWIFT Type CHEAPSHOT SWIFTKICK
matchwait

# ********************** FOOTSTOMP *************************

startcheapmasterFOOT:
cheapmastersmile:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO
put nod %s
WAIT
put stance off
waitfor offensive stance
GoTo cheapmastermasterFOOT

cheapmastermasterFOOT:
put CheapshoT FOOTSTOMP %s
match cheapmastermasterFOOT Failed!
match cheapmasterdone You have completed
match cheapmastermasterFOOT repetition(s) remaining.
match cheapmastermasterwaitFOOT ...wait
match cheapmastermasterstandFOOT Maybe if you stood up
match startcheapmaster Better wait for instructions
matchwait

cheapmastermasterwaitFOOT:
pause 2
GoTo cheapmastermasterFOOT

cheapmastermasterstandFOOT:
put stand
GoTo cheapmastermasterFOOT

# ********************** END FOOTSTOMP *************************

# ********************** NOSETWEAK *************************

startcheapmasterNOSE:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO
put nod %s
WAIT
put stance off
waitfor offensive stance
GoTo cheapmastermasterNOSE

cheapmastermasterNOSE:
cheapmasterweapon2:
put CheapshoT NOSETWEAK %s
match cheapmastermasterNOSE Failed!
match cheapmastermasterweaponNOSE hands are full
match cheapmasterdone You have completed
match cheapmastermasterNOSE repetition(s) remaining.
match cheapmastermasterwaitNOSE ...wait
match cheapmastermasterstandNOSE Maybe if you stood up
match startcheapmaster Better wait for instructions
matchwait

cheapmastermasterwaitNOSE:
pause 2
GoTo cheapmastermasterNOSE

cheapmastermasterstandNOSE:
put stand
GoTo cheapmastermasterNOSE

cheapmastermasterweaponNOSE:
counter set 2
GoTo cheapshotnohand

# ********************** END NOSETWEAK *************************

# ********************** TEMPLESHOT *************************

startcheapmasterTEMPLE:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO
put nod %s
WAIT
put stance off
waitfor offensive stance
GoTo cheapmastermasterTEMPLE

cheapmastermasterTEMPLE:
cheapmasterweapon3:
put CheapshoT TEMPLESHOT %s
match cheapmastermasterTEMPLE Failed!
match cheapmasterdone You have completed
match cheapmastermasterTEMPLE repetition(s) remaining.
match cheapmastermasterwaitTEMPLE ...wait
match cheapmastermasterweaponTEMPLE bare hand
match cheapmastermasterstandTEMPLE Maybe if you stood up
match startcheapmaster Better wait for instructions
matchwait

cheapmastermasterwaitTEMPLE:
pause 2
GoTo cheapmastermasterTEMPLE

cheapmastermasterstandTEMPLE:
put stand
GoTo cheapmastermasterTEMPLE

cheapmastermasterweaponTEMPLE:
counter set 3
GoTo cheapshotnoweapon

# ********************** TEMPLESHOT *************************

# ********************** KNEEBASH *************************

startcheapmasterKNEE:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO
put nod %s
WAIT
put stand
WAIT
put stance off
waitfor offensive stance
GoTo cheapmastermasterKNEE

cheapmastermasterKNEE:
cheapmasterweapon4:
put CheapshoT KNEEBASH %s
match cheapmasterweaponKNEE bare hands!
match cheapmastermasterKNEE Failed!
match cheapmasterdone You have completed
match cheapmastermasterKNEE repetition(s) remaining.
match cheapmastermasterwaitKNEE ...wait
match cheapmastermasterstandKNEE Maybe if you stood up
match startcheapmaster Better wait for instructions
match cheapmastermasterstandKNEE needs to be standing to
matchwait

cheapmastermasterstandKNEE:
waitfor stands up
GoTo cheapmastermasterKNEE

cheapmastermasterwaitKNEE:
pause 2
GoTo cheapmastermasterKNEE

cheapmastermasterstandKNEE:
put stand
GoTo cheapmastermasterKNEE

cheapmasterweaponKNEE:
counter set 4
GoTo cheapshotnoweapon

# ********************** END KNEEBASH *************************

# ********************** EYEPOKE *************************

startcheapmasterEYE:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO

put nod %s

put stance off
waitfor offensive stance
GoTo cheapmastermasterEYE

cheapmastermasterEYE:
put CheapshoT EYEPOKE %s
match cheapmastermasterEYE Failed!
match cheapmasterdone You have completed
match cheapmastermasterwaitEYE best wait a bit before trying it again
match cheapmastermasterEYE repetition(s) remaining.
match cheapmastermasterwaitEYE ...wait
match cheapmastermasterstandEYE Maybe if you stood up
match startcheapmaster Better wait for instructions
matchwait

cheapmastermasterwaitEYE:
pause 2
GoTo cheapmastermasterEYE

cheapmastermasterstandEYE:
put stand
GoTo cheapmastermasterEYE

# ********************** END EYEPOKE *************************

# ********************** THROATCHOP *************************

startcheapmasterTHROAT:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO
put nod %s
WAIT
put stance off
waitfor offensive stance
GoTo cheapmastermasterTHROAT

cheapmastermasterTHROAT:
put CheapshoT THROATCHOP %s
match cheapmastermasterTHROAT Failed!
match cheapmastermasterTHROAT repetition(s) remaining.
match cheapmasterdone You have completed
match cheapmastermasterwaitTHROAT ...wait
match cheapmastermasterweaponTHROAT weapon
match cheapmastermasterstandTHROAT Maybe if you stood up
match startcheapmaster Better wait for instructions
matchwait

cheapmastermasterwaitTHROAT:
pause 2
GoTo cheapmastermasterTHROAT

cheapmastermasterstandTHROAT:
put stand
GoTo cheapmastermasterTHROAT

cheapmastermasterweaponTHROAT:
ECHO
ECHO ** YOU NEED A WEAPON READY **
ECHO ** RESTART ONCE YOU ARE READY **
ECHO
EXIT

# ********************** END THROATCHOP *************************

# ********************** SWIFT *************************

startcheapmasterSWIFT:
ECHO
ECHO NOD TO THE PRETTY MASTER
ECHO

put nod %s

put stance off
waitfor offensive stance
GoTo cheapmastermasterSWIFT

cheapmastermasterSWIFT:
put CheapshoT SWIFTKICK %s
match cheapmastermasterSWIFT Failed!
match cheapmasterdone You have completed
match cheapmastermasterSWIFT repetition(s) remaining.
match cheapmastermasterwaitSWIFT ...wait
match cheapmastermasterstandSWIFT Maybe if you stood up
match startcheapmaster Better wait for instructions
matchwait

cheapmastermasterwaitSWIFT:
pause 2
GoTo cheapmastermasterSWIFT

cheapmastermasterstandSWIFT:
put stand
GoTo cheapmastermasterSWIFT

# ********************** END SWIFTKICK *************************


cheapshotnoweapon:
put GeT my %weapon
match cheapmasterweapon%c You remove
match cheapmasterweapon%c You get
match cheapmasterweapon%c You pick up
match cheapmasterweaponswap already have
match cheapmasterweaponnoweapon could not find
matchwait

cheapmasterweaponswap:
put swap
GoTo cheapmasterweapon%c

cheapmasterweaponnoweapon:
ECHO ***
ECHO * NO %WEAPON WEAPON AVAILABLE *
ECHO * GLANCE WHEN YOU HAVE A VALID WEAPON
ECHO ***
waitfor You glance
GoTo cheapmasterweapon%c

cheapshotnohand:
put put my %weapon in my %sheath
match cheapmasterweapon%c You put
match cheapmasterweapon%c You slide your
match cheapshotnohandopen closed
match cheapshotnohandshield could not find
matchwait

cheapshotnohandopen:
put open my %sheath
wait
put put my %weapon in my %sheath
match cheapmasterweapon%c You put
match cheapmasterweapon%c You slide your
match cheapshotnohandopen2 closed
match cheapshotnohandshield could not find
matchwait

cheapshotnohandopen2:
ECHO ***
ECHO * CAN'T OPEN CONTAINER *
ECHO * CLEAR UP HANDS, THAN TYPE GLANCE *
ECHO ***
waitfor You glance
GoTo cheapmasterweapon%c

cheapshotnohandshield:
put wear my shield
match cheapmasterweapon%c You sling
match cheapmasterweapon%c You put
match cheapshotnohandshield2 already
match cheapshotnohandshield2 could not find
matchwait

cheapshotnohandshield2:
ECHO ***
ECHO * CLEAR UP HANDS, THAN TYPE GLANCE *
ECHO ****
waitfor You glance
GoTo cheapmasterweapon%c


# ********************** ENDING CHEAPSHOT *************************

cheapmasterdone:
put nod %s
pause 1
put out
GoTo CheapShotMasterDone%1

CheapShotMasterDoneLanding:
CheapShotMasterDone1:
move sw
GoTo %1RepCheck

CheapShotMasterDoneSolhaven:
CheapShotMasterDone2:
move w
move climb stair
move e
GoTo %1RepCheck

CheapShotMasterDoneIcemule:
CheapShotMasterDone3:
move east
GoTo %1RepCheck

CheapShotMasterDoneTeras:
CheapShotMasterDone4:
move east
move northeast
move west
GoTo %1RepCheck

CheapShotMasterDoneRest:
CheapShotMasterDone5:
move southwest
GoTo %1RepCheck

CheapShotMasterDoneVaalor:
CheapShotMasterDone6:
move down
move northeast
move climb ladder
move east
move north
GoTo %1RepCheck

CheapShotMasterDoneIllistim:
CheapShotMasterDone7:
move south
move go stair
move north
move north
move north
move west
move west
move west
move go stair
move west
move south
GoTo %1RepCheck

cheapshotexit:
exit

# ********************** END CHEAPSHOT *************************

# ********************** PARTNER CHEAPSHOT *************************


gldcheapshotpersonstart:
#Cheapshot on Partner
guildstart52:
ECHO *** Cheapshot with Partners
ECHO ***
ECHO * Please Restart the script with this syntax
GoTo guildstartcheap_syntax



guildstartcheap:
shift
IF_2 counter set %2
IF_1 put stance off
IF_1 wait
IF_1 ECHO *** Will stomp %1 ***
IF_2 ECHO *** %2 time(s) ***
IF_1 GoTo GLDcheapshotpersonx
ECHO *********************************************
ECHO * PROPER USAGE
guildstartcheap_syntax:
ECHO * .guildx cheap <name> <#optional>
ECHO * cheap =  just needed
ECHO * <name>= Person you stomping
ECHO * <#> = for when you have # of reps. 30 max
ECHO *********************************************
exit

gldcheapshotpersonx:
ECHO *
ECHO * Switch guild stance now if you want to
ECHO * Switch normal stance now if you want to
ECHO * GLANCE when you are ready to start
ECHO *
waitfor You glance
gldcheapshotperson:
put CheapshoT footstomp %1
IF_2 match gldcheapshotpersonsuccess%c Success!
IF_2 match gldcheapshotpersonsuccess%c %1 howls in pain,
match gldcheapshotpersondone You have completed
match gldcheapshotpersonpause just fell for a footstomp not long ago
match gldcheapshotpersonpause wait
match gldcheapshotpersonpause repetition(s) remaining
match gldcheapshotpersonpause Roundtime:
match gldcheapshotpersonstand Maybe if you stood up first
match gldcheapshotpersonnuts Footstomp what?
match gldcheapshotperson Failed!
matchwait

gldcheapshotpersonpausex:
pause 1
GoTo gldcheapshotperson

gldcheapshotpersonpause:
pause 5
GoTo gldcheapshotperson

gldcheapshotpersonstand:
put stance off
waitfor offensive stance
put stand
match gldcheapshotperson You stand back up
match gldcheapshotpersonstand struggle
match gldcheapshotpersonstand wait
matchwait

gldcheapshotpersonsuccess30:
gldcheapshotpersonsuccess29:
gldcheapshotpersonsuccess28:
gldcheapshotpersonsuccess27:
gldcheapshotpersonsuccess26:
gldcheapshotpersonsuccess25:
gldcheapshotpersonsuccess24:
gldcheapshotpersonsuccess23:
gldcheapshotpersonsuccess22:
gldcheapshotpersonsuccess21:
gldcheapshotpersonsuccess20:
gldcheapshotpersonsuccess19:
gldcheapshotpersonsuccess18:
gldcheapshotpersonsuccess17:
gldcheapshotpersonsuccess16:
gldcheapshotpersonsuccess15:
gldcheapshotpersonsuccess14:
gldcheapshotpersonsuccess13:
gldcheapshotpersonsuccess12:
gldcheapshotpersonsuccess11:
gldcheapshotpersonsuccess10:
gldcheapshotpersonsuccess9:
gldcheapshotpersonsuccess8:
gldcheapshotpersonsuccess6:
gldcheapshotpersonsuccess7:
gldcheapshotpersonsuccess5:
gldcheapshotpersonsuccess4:
gldcheapshotpersonsuccess3:
gldcheapshotpersonsuccess2:
counter add -1
ECHO *** %c time(s) left ***
GoTo gldcheapshotperson

gldcheapshotpersonnuts:
ECHO *****************************************
ECHO * Who you trying to footstomp?
ECHO * Restart once your head is on straight
ECHO *****************************************
exit

gldcheapshotpersonsuccess1:
gldcheapshotpersondone:
ECHO ********
ECHO * DONE *
ECHO ********
exit


# ********************** END PARTNER CHEAPSHOT *************************

# ********************** PARTNER SWEEP *************************

guildstart16:
ECHO *** Partner Sweep
ECHO ***
ECHO * Please restart the script with the following syntax:
GoTo guildstartsweep_syntax

gldsweeppersonstart:
guildstartsweep:
shift
IF_2 counter set %2
IF_1 put stance off
IF_1 wait
IF_1 GoTo GLDsweepperson
ECHO ***************************************************************************
ECHO * PROPER USAGE
guildstartsweep_syntax:
ECHO * .guildx <sweep> <name> <# - 30 max> <pull>
ECHO * <sweep> =  just needed
ECHO * <name>= Person you stomping <full name needed>
ECHO * <#> = Optional, # of times to sweep person <put 0 if wishing to bypass>
ECHO * <pull> = will attemp to pull the person up <I don't advice pulling>
ECHO ***************************************************************************
exit


GLDsweepperson:
put stance off
ECHO *
ECHO * Switch guild stance now if you want to
ECHO * Switch normal stance now if you want to
ECHO * GLANCE when you are ready to start
ECHO *
waitfor You glance
GoTo GLDsweep
IF_3 GoTo GLDsweep1
IF_1 GoTo GLDsweep
goto ExitGuildx


GLDsweep:
	put sweep %1
	match GLDsweepdone have completed
	IF_2 match GLsweepsuccess%c %1 falls
	match GLDsweep %1 falls
	match GLDsweepmiss You fail to regain your footing
	match GLDsweep You whack
	match GLDsweepwait wait
	match GLDsweepmore %1 is already prone
	match GLDsweepmore %1 is not standing
	match GLDsweepmiss must be
	match GLDsweepmiss might have better luck
	match GLDsweepwhoops could not
	matchwait

GLDsweepwait:
	pause
	GoTo GLDsweep

GLDsweepmore:
	IF_3 put pull %1
	match GLDsweeppullwait is too heavy
	match GLDsweeppullwait You try to pull
	match GLDsweep towards you
	match GLDsweep %1 stands up
	match GLDsweep pulls %1 to his feet
	match GLDsweep pulls %1 to her feet
	match GLDsweep You pull %1
	match GLDsweep %1 tucks his chin towards his chest
	matchwait

GLDsweeppullwait:
	wait
	GoTo GLDsweepmore

GLDsweepmiss:
	put stand
	match GLDsweep You stand
	match GLDsweepmiss struggle
	match GLDsweepmisswait wait
	matchwait

GLDsweepmisswait:
	pause
	GoTo GLDsweepmiss

GLDsweepwhoops:
	ECHO ****************************************
	ECHO * Wha are you doing bafoon??
	ECHO * Incase you missed it, %1 is not here
	ECHO ****************************************
	exit

GLsweepsuccess30:
GLsweepsuccess29:
GLsweepsuccess28:
GLsweepsuccess27:
GLsweepsuccess26:
GLsweepsuccess25:
GLsweepsuccess24:
GLsweepsuccess23:
GLsweepsuccess22:
GLsweepsuccess21:
GLsweepsuccess20:
GLsweepsuccess19:
GLsweepsuccess18:
GLsweepsuccess17:
GLsweepsuccess16:
GLsweepsuccess15:
GLsweepsuccess14:
GLsweepsuccess13:
GLsweepsuccess12:
GLsweepsuccess11:
GLsweepsuccess10:
GLsweepsuccess9:
GLsweepsuccess8:
GLsweepsuccess7:
GLsweepsuccess6:
GLsweepsuccess5:
GLsweepsuccess4:
GLsweepsuccess3:
GLsweepsuccess2:
	counter add -1
	GoTo GLDsweep

GLsweepsuccess0:
	GoTo GLDsweep

GLsweepsuccess1:
GLDsweepdone:
	ECHO ***********************
	ECHO * Your done, GO HOME!
	ECHO ***********************
	exit


# ********************** END PARTNER SWEEP *************************

# ********************** Gambits *************************
# Work Needed

guildstartgambit:
ECHO ***
ECHO * Not a valid start variable
ECHO * Restart with syntax
ECHO * .guildx # ##
ECHO * 60 - Rogue Gambits STUDENT -<Being a Student>- New Section
ECHO * 61 - Rogue Gambits TEACH -<Teaching>- New Section
ECHO * 62 - Rogue Gambits SPEED -<Speed>- New Section
ECHO * 63 - Rogue Gambits AUDIENCE -<Audience>- New Section
ECHO ***
goto ExitGuildx

#Usage:
#RGAMBIT  {skill}  {style}
#62          TUMBLE  [left | right | forward | backward | multiple]
#63      CARTWHEEL  [left | right | forward | backward | multiple]
#64            FLIP  [left | right | forward | backward | multiple]
#65          DAGGER  [balance | toss | game]
#66         DISPLAY  [hands | ear | pocket | person] {item}
#67             GET  [hands | mouth | air | silent] {item} FROM {container}
#68         VANISH  [hands | mouth | air] {item} [IN|ON|UNDER|BEHIND] {container}

#cpoxx
#
#told you to teach a fellow guildmember something about rogue gambits.
#told you to get a partner to teach you your latest trick.
#told you to practice your latest trick in front of an audience.
#told you to see how many times you can do your current gambit in one minute.

guildstart60:
ECHO *** Currently works with <Being a Student> <%3> <%4>
GoTo RGStudent

guildstart61:
ECHO *** Currently works with <Teaching> <%4> <%5>
IF_6 counter set %6
GoTo GambitTeach

guildstart62:
#62 speed
#.guildx 1 62 vanish silent coin pack
ECHO *** Currently works with <Speed> <%3> <%4>
IF_3 GoTo RGSpeed%3
GoTo RogueGambitSyntax

guildstart63:
#63 Audience
#.guildx 1 63 silent coin pack
ECHO *** Currently works with <Audience> <%3> <%4>
IF_3 GoTo RGAudience%3
GoTo RogueGambitSyntax

RGSpeed:
RGSpeedTUMBLE:
RGSpeedDAGGER:
RGSpeedDISPLAY:
RGAudience:
RGAudienceTUMBLE:
RGAudienceCARTWHEEL:
RGAudienceFLIP:
RGAudienceDAGGER:
RGAudienceDISPLAY:
pause
ECHO ***
ECHO * Error with choosing the gambit of your choice.
ECHO * Check your syntax and try again
ECHO * If syntax is correct, the skill you are choosing may not be done yet.
ECHO ***
GoTo ExitGuildx


GambitVanishEnd:
GambitTeachDone:
GambitDone:
ECHO *** Done
GoTo ExitGuildx

RogueGambitSyntax:
ECHO ***
ECHO * Usage is:
ECHO * .guildx <#> 6# SKILL TYPE ITEM CONTAINER
ECHO * Example:
ECHO * .guildx 1 64 vanish silent coin pack
ECHO * For a list of all the 6#, type .guildx alone
ECHO * Please restart script with proper syntax
ECHO ***
goto ExitGuildx

# --- Rogue Gambit Speed FLIP ---
RGSpeedFLIP:
IF_3 GoTo RGSpeedFLIPStart
GoTo RogueGambitSyntax

RGSpeedFLIPStart:
put rgambit %3 %4
match RGSpeedFLIPStart repetitions remaining.
match RGSpeedFLIPStart repetition remaining.
match RGSpeedFLIPStart You must succeed
match GambitFLIPEnd You have completed
match GambitFLIPNoItem could not find
match RGSpeedFLIPStow Somehow you manage to land on your feet.
match RGSpeedFLIPStow You must stand first
match RGSpeedFLIPPause ..wait
matchwait

RGSpeedFLIPPause:
pause
GoTo RGSpeedFLIPStart

RGSpeedFLIPStow:
put stand
#match GambitFLIPNoItem could not find
match RGSpeedFLIP You stand back up
match RGSpeedFLIP You are already standing
match RGSpeedFLIPStowPause You struggle
match RGSpeedFLIPStowPause ..wait
matchwait

RGSpeedFLIPStowPause:
pause
GoTo RGSpeedFLIPStow

# --- Rogue Gambit Speed FLIP ---

# --- Rogue Gambit Speed Cartwheel ---
RGSpeedCARTWHEEL:
IF_3 GoTo RGSpeedCARTWHEELStart
GoTo RogueGambitSyntax

RGSpeedCARTWHEELStart:
put rgambit %3 %4
match RGSpeedCARTWHEELStart repetitions remaining.
match RGSpeedCARTWHEELStart repetition remaining.
match RGSpeedCARTWHEELStart You must succeed
match GambitCartwheelEnd You have completed
match GambitCartwheelNoItem could not find
match RGSpeedCartwheelStow You fall back into a crouch and stand up with a sigh.
match RGSpeedCartwheelStow You must stand first
match RGSpeedCartwheelPause ..wait
matchwait

RGSpeedCartwheelPause:
pause
GoTo RGSpeedCARTWHEELStart

RGSpeedCartwheelStow:
put stand
#match GambitCartwheelNoItem could not find
match RGSpeedCartwheel You stand back up
match RGSpeedCartwheel You are already standing
match RGSpeedCartwheelStowPause You struggle
match RGSpeedCartwheelStowPause ..wait
matchwait

RGSpeedCartwheelStowPause:
pause
GoTo RGSpeedCartwheelStow


# --- Rogue Gambit Speed Cartwheel ---

# --- Rogue Gambit Audience Get ---

RGAudienceGet:
IF_5 GoTo RGAudienceGetStart
GoTo RogueGambitSyntax

RGAudienceGetStart:
put rg %3 %4 %5 from my %6
match RGAudienceGetStow You need a hand free to do that.
match RGAudienceGetStowRep repetitions remaining.
match RGAudienceGetStowRep repetition remaining.
match RGAudienceGetStow but do not feel confident
match GambitGetEnd You have completed
match GambitGetNoItem could not find
match RGAudienceGetPause ..wait
match RGAudienceNoRep Roundtime:
matchwait

RGAudienceGetStowRep:
put put my %5 in my %6
match RGAudienceGetRep You put
match RGAudienceGetStowRepPause ..wait
matchwait

RGAudienceGetRep:
pause 30
GoTo RGAudienceGet

RGAudienceGetStowRepPause:
pause
GoTo RGAudienceGetStowRep

RGAudienceGetStow:
put put my %5 in my %6
match RGAudienceGet You put
match RGAudienceGetStowPause ..wait
matchwait

RGAudienceGetPause:
pause
GoTo RGAudienceGet

RGAudienceNoRep:
put put my %5 in my %6
ECHO ***
ECHO * You did not get a rep
ECHO * Pauseing for 10
ECHO ***
pause 10
GoTo RGAudienceGet

# --- End Rogue Gambit Audience Get ---

# --- Rogue Gambit Speed Get ---
RGSpeedGet:
IF_5 GoTo RGSpeedGetStart
GoTo RogueGambitSyntax

RGSpeedGetStart:
put rg %3 %4 %5 from my %6
match RGSpeedGetStow You need a hand free to do that.
match RGSpeedGetStow repetitions remaining.
match RGSpeedGetStow repetition remaining.
match RGSpeedGetStow You must succeed
match RGSpeedGetStow but do not feel confident
match GambitGetEnd You have completed
match GambitGetNoItem could not find
match RGSpeedGetPause ..wait
matchwait

RGSpeedGetPause:
pause
GoTo RGSpeedGet

RGSpeedGetStow:
put put my %5 in my %6
match RGSpeedGet You put
match RGSpeedGetStowPause ..wait
matchwait

RGSpeedGetStowPause:
pause
GoTo RGSpeedGetStow

GambitGetNoItem:
ECHO ***
ECHO * The item you are trying to get (%4) is not in the container you are specifying (%5)
ECHO ***
goto ExitGuildx

GambitGetEnd:
ECHO *** Done
put put my %5 in my %6
match ExitGuildx You put
match GambitGetEndPause ..wait
matchwait

GambitGetEndPause:
pause
goto GambitGetEnd

# --- End Rogue Gambit Speed Get ---

# --- Rogue Gambit Audience Vanish ---

RGAudienceVanish:
IF_5 GoTo RGAudienceVanishStart
GoTo RogueGambitSyntax

RGAudienceVanishStart:
put rg %3 %4 %5 in my %6
match RGAudienceVanishStow You need to be holding something first.
match RGAudienceVanishStowRep repetitions remaining.
match RGAudienceVanishStowRep repetition remaining.
match RGAudienceVanishStow but do not feel confident
match GambitVanishEnd You have completed
match GambitVanishNoItem could not find
match RGAudienceVanishPause ..wait
match RGAudienceVanishNoRep Roundtime:
matchwait

RGAudienceVanishStowRep:
put rg get silent my %5 from my %6
#put get my %5 from my %6
match RGAudienceVanishRep You remove
match RGAudienceVanishStowRepPause ..wait
matchwait

RGAudienceVanishRep:
pause 30
GoTo RGAudienceVanish

RGAudienceVanishStowRepPause:
pause
GoTo RGAudienceVanishStowRep

RGAudienceVanishStow:
put rg get silent my %5 from my %6
#put get my %5 from my %6
match RGAudienceVanish You remove
match RGAudienceVanishStowPause ..wait
matchwait

RGAudienceVanishPause:
pause
GoTo RGAudienceVanish

RGAudienceVanishNoRep:
put rg get silent my %5 from my %6
#put get my %5 from my %6
ECHO ***
ECHO * You did not get a Vanish rep
ECHO * Pauseing for 10 and trying again
ECHO ***
pause 10
GoTo RGAudienceVanish

# --- End Rogue Gambit Audience Vanish ---

# --- Rogue Gambit Audience Stealth ---
RGAudienceStealth:
IF_4 GoTo RGAudienceStealthStart
GoTo RogueGambitSyntax

RGAudienceStealthStart:
GoTo RGAudienceStealth%4

RGAudienceStealthPUT:
pause
ECHO *** Not supported at this time
GoTo ExitGuildx

RGAudienceStealthPause1:
ECHO ***
ECHO * Pauseing for 25 to try again
ECHO ***
pause 25
GoTo RGAudienceStealthStart

RGAudienceStealthPause2:
ECHO ***
ECHO * Pauseing for 5 and trying again
ECHO ***
pause 5
GoTo RGAudienceStealthStart

RGAudienceStealthPause3:
RGAudienceStealthPause:
RGAudienceStealthPause:
pause
GoTo RGAudienceStealthStart

# --- GET AUDIENCE ---

RGAudienceStealthGET:
put rg %3 %4 my %5
match RGAudienceStealthStow1%4 You need a hand free to do that.

match RGAudienceStealthStow1%4 repetitions remaining.
match RGAudienceStealthStow1%4 repetition remaining.

#match RGAudienceStealthPause1 repetitions remaining.
#match RGAudienceStealthPause1 repetition remaining.

match RGAudienceStealthStow2%4 Roundtime:
match RGAudienceStealthStow3%4 but do not feel confident
match RGAudienceStealthStow3%4 You're already holding that.
match RGAudienceStealthStow3%4 your actions have revealed your location.
match RGAudienceStealthStow3%4 but have revealed yourself
match RGAudienceStealthStow3%4 You're not even hidden!

match RGAudienceStealthStart but realize that doing so would
match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGAudienceStealthPause ..wait
matchwait

RGAudienceStealthStow3GET:
counter set 3
GoTo RGAudienceStealthStowGET

RGAudienceStealthStow2GET:
counter set 2
GoTo RGAudienceStealthStowGET

RGAudienceStealthStow1GET:
counter set 1
GoTo RGAudienceStealthStowGET

RGAudienceStealthStowGET:
put unhide
put put my %5 in my %6
match RGAudienceStealthStowHide You put
match RGAudienceStealthStowHide could not find
match RGAudienceStealthStowHide You secretly place your
match RGAudienceStealthStowGETPse ..wait
matchwait

RGAudienceStealthStowGETPse:
pause
GoTo RGAudienceStealthStowGET

# --- END GET AUDIENCE ---

# --- STAND AUDIENCE ---

RGAudienceStealthSTAND:
put rg %3 %4
match RGAudienceStealthStow1%4 You need a hand free to do that.

match RGAudienceStealthStow1%4 repetitions remaining.
match RGAudienceStealthStow1%4 repetition remaining.

#match RGAudienceStealthPause1 repetitions remaining.
#match RGAudienceStealthPause1 repetition remaining.

match RGAudienceStealthStow2%4 Roundtime:
match RGAudienceStealthStow3%4 but do not feel confident
match RGAudienceStealthStow3%4 You're already
match RGAudienceStealthStow3%4 your actions have revealed your location.
match RGAudienceStealthStow3%4 You're not even hidden!

match RGAudienceStealthStart but realize that doing so would
match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGAudienceStealthPause ..wait
matchwait

RGAudienceStealthStow3STAND:
counter set 3
GoTo RGAudienceStealthStowSTAND

RGAudienceStealthStow2STAND:
counter set 2
GoTo RGAudienceStealthStowSTAND

RGAudienceStealthStow1STAND:
counter set 1
GoTo RGAudienceStealthStowSTAND

RGAudienceStealthStowSTAND:
put unhide
put sit
match RGAudienceStealthStowHide You sit down.
match RGAudienceStealthStowHide You are already
match RGAudienceStealthStowSTANDPse struggle
match RGAudienceStealthStowSTANDPse ..wait
matchwait

RGAudienceStealthStowSTANDPse:
pause
GoTo RGAudienceStealthStowSTAND

# --- END STAND AUDIENCE ---

# --- SIT/KNEEL AUDIENCE ---

RGAudienceStealthKNEEL:
RGAudienceStealthSIT:
put rg %3 %4
match RGAudienceStealthStow1%4 You need a hand free to do that.
match RGAudienceStealthStow1%4 repetitions remaining.
match RGAudienceStealthStow1%4 repetition remaining.
match RGAudienceStealthStow2%4 Roundtime:
match RGAudienceStealthStow3%4 but do not feel confident
match RGAudienceStealthStow3%4 You're already
match RGAudienceStealthStow3%4 your actions have revealed your location.
match RGAudienceStealthStow3%4 You're not even hidden!

match RGAudienceStealthStart but realize that doing so would
match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGAudienceStealthPause ..wait
matchwait

RGAudienceStealthStow3SIT:
RGAudienceStealthStow3KNEEL:
counter set 3
GoTo RGAudienceStealthStowSIT

RGAudienceStealthStow2SIT:
RGAudienceStealthStow2KNEEL:
counter set 2
GoTo RGAudienceStealthStowSIT

RGAudienceStealthStow1SIT:
RGAudienceStealthStow1KNEEL:
counter set 1
GoTo RGAudienceStealthStowSIT

RGAudienceStealthStowKNEEL:
RGAudienceStealthStowSIT:
put unhide
put stand
match RGAudienceStealthStowHide You stand
match RGAudienceStealthStowHide You are already standing.
match RGAudienceStealthStowSITPause struggle
match RGAudienceStealthStowSITPause ..wait
matchwait

RGAudienceStealthStowSITPause:
pause
GoTo RGAudienceStealthStowSIT

# --- END SIT/KNEEL ---

RGAudienceStealthStowHide:
put hide
match RGAudienceStealthPause%c You attempt to blend
match RGAudienceStealthPause%c A tad paranoid, aren't we?
match RGAudienceStealthStowHidePause You fail to slip into hiding.
match RGAudienceStealthStowHidePause ..wait
matchwait

RGAudienceStealthStowHidePause:
pause
GoTo RGAudienceStealthStowHide

GambitStealthEnd:
ECHO *** Done
GoTo ExitGuildx

# --- End Rogue Gambit Audience Stealth ---

# --- Rogue Gambit Speed Vanish ---
RGSpeedVanish:
IF_5 GoTo RGSpeedVanishStart
GoTo RogueGambitSyntax

RGSpeedVanishStart:
put rg %3 %4 %5 in my %6
match RGSpeedVanishStow You need to be holding something first.
match RGSpeedVanishStow repetitions remaining.
match RGSpeedVanishStow repetition remaining.
match RGSpeedVanishStow You must succeed
match RGSpeedVanishStow but do not feel confident
match GambitVanishEnd You have completed
match GambitVanishNoItem could not find
match RGSpeedVanishPause ..wait
matchwait

RGSpeedVanishPause:
pause
GoTo RGSpeedVanish

RGSpeedVanishStow:
put get my %5 from my %6
match GambitVanishNoItem could not find
match RGSpeedVanish You remove
match RGSpeedVanishStowPause ..wait
matchwait

RGSpeedVanishStowPause:
pause
GoTo RGSpeedVanishStow

GambitVanishNoItem:
ECHO ***
ECHO * The item you are trying to Vanish (%4) is not in the container you are specifying (%5)
ECHO ***
goto ExitGuildx

# --- Rogue Gambit Speed Vanish ---

# --- Rogue Gambit Speed Stealth ---
RGSpeedStealth:
IF_4 GoTo RGSpeedStealthStart
GoTo RogueGambitSyntax

RGSpeedStealthStart:
GoTo RGSpeedStealth%4

RGSpeedStealthPUT:
pause
ECHO *** Not supported at this time
GoTo ExitGuildx

RGSpeedStealthPause:
pause
GoTo RGSpeedStealthStart

# --- GET SPEED ---

RGSpeedStealthGET:
put rg %3 %4 my %5
match RGSpeedStealthStow%4 repetitions remaining.
match RGSpeedStealthStow%4 repetition remaining.
match RGSpeedStealthStow%4 You must succeed

match RGSpeedStealthStow%4 but do not feel confident
match RGSpeedStealthStow%4 You're not even hidden!
match RGSpeedStealthStow%4 You're already holding that.

match RGSpeedStealthStow%4 your actions have revealed your location.
match RGSpeedStealthStow%4 but have revealed yourself
match RGSpeedStealthStow%4 but realize that doing so would

match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match GambitStealthNoItem What are you trying to get?
match RGSpeedStealthPause ..wait
matchwait

RGSpeedStealthStowGET:
put put my %5 in my %6
match RGSpeedStealthStowHide You put
match RGSpeedStealthStowHide could not find
match RGSpeedStealthStowHide You secretly place your
match RGSpeedStealthStowGETPause ..wait
matchwait

RGSpeedStealthStowGETPause:
pause
GoTo RGSpeedStealthStowGET

# --- STAND SPEED ---

RGSpeedStealthSTAND:
put rg %3 %4
match RGSpeedStealthStow%4 repetitions remaining.
match RGSpeedStealthStow%4 repetition remaining.
match RGSpeedStealthStow%4 You must succeed

match RGSpeedStealthStow%4 but do not feel confident
match RGSpeedStealthStow%4 You're not even hidden!
match RGSpeedStealthStow%4 You're already
match RGSpeedStealthStow%4 your actions have revealed your location.
match RGSpeedStealthStow%4 but realize that doing so would

match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGSpeedStealthPause ..wait
matchwait

RGSpeedStealthStowSTAND:
put sit
match RGSpeedStealthStowHide You sit down.
match RGSpeedStealthStowHide You are already
match RGSpeedStealthStowSTANDPause struggle
match RGSpeedStealthStowSTANDPause ..wait
matchwait

RGSpeedStealthStowSTANDPause:
pause
GoTo RGSpeedStealthStowSTAND

# --- SIT SPEED ---

RGSpeedStealthKNEEL:
RGSpeedStealthSIT:
put rg %3 %4
match RGSpeedStealthStow%4 You need a hand free to do that.
match RGSpeedStealthStow%4 repetitions remaining.
match RGSpeedStealthStow%4 repetition remaining.
match RGSpeedStealthStow%4 You must succeed

match RGSpeedStealthStow%4 but do not feel confident
match RGSpeedStealthStow%4 You're not even hidden!
match RGSpeedStealthStow%4 You're already
match RGSpeedStealthStow%4 your actions have revealed your location.
match RGSpeedStealthStow%4 but realize that doing so would

match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGSpeedStealthPause ..wait
matchwait

RGSpeedStealthStowKNEEL:
RGSpeedStealthStowSIT:
put stand
match RGSpeedStealthStowHide You stand
match RGSpeedStealthStowHide You are already standing.
match RGSpeedStealthStowSITPause struggle
match RGSpeedStealthStowSITPause ..wait
matchwait

RGSpeedStealthStowSITPause:
pause
GoTo RGSpeedStealthStowSIT

RGSpeedStealthStowHide:
put hide
match RGSpeedStealthStart You crawl under
match RGSpeedStealthStart You attempt to blend
match RGSpeedStealthStart A tad paranoid, aren't we? 
match RGSpeedStealthStowHide You fail to slip into hiding.
match RGSpeedStealthStowHide ..wait
matchwait

RGSpeedStealthStowHidePause:
pause
GoTo RGSpeedStealthStowHide

GambitStealthEnd:
ECHO *** Done
GoTo ExitGuildx

# --- End Rogue Gambit Speed Stealth ---

# ---- Rogue Gambit Teach ----

GambitTeach:
IF_4 GoTo GambitTeachA
echo *******************************************
echo * You need more variables
echo * Usage:
echo * .guildx # 61 PERSON SKILL TYPE
ECHO * Use variable 4 and 5 for gambit to teach
echo *******************************************
goto ExitGuildx

GambitTeachTooHard:
ECHO ***
ECHO * Your student can not learn the skill you chose.
ECHO * Teach something easier than %4 %5
ECHO ***
goto ExitGuildx

GambitTeachA:
ECHO *** Use Mana to force re-teach
put rgambit teach %3 %4 %5
GambitTeachW:
match GambitTeachAgain repetitions remaining
match GambitTeachAgain repetition remaining
match GambitTeachDone completed your training task
match GambitTeachWX You are already teaching
match GambitTeachAgain ...wait
match GambitTeachProblem who are you trying to teach?
match GambitTeachTooHard You may only teach skills with which your student is familiar.
match GambitTeachAgain Mana Points:
IF_6 match GambitTeachAgainX You then repeat the trick in slow motion,
IF_6 match GambitTeachAgainX You spend a few moments instructing
IF_6 match GambitTeachAgainX You spend a few moments instructing
IF_6 match GambitTeachAgainX You spend a few moments instructing
matchwait

GambitTeachWX:
pause
ECHO *** Already teaching target, if this hangs, type MANA
GoTo GambitTeachW

GambitTeachAgainX0:
GoTo GambitTeachDone


GambitTeachAgainX:
counter add -1
ECHO *** %c teach attempts left
GoTo GambitTeachAgainX%c

GambitTeachAgainX30:
GambitTeachAgainX29:
GambitTeachAgainX28:
GambitTeachAgainX27:
GambitTeachAgainX26:
GambitTeachAgainX25:
GambitTeachAgainX24:
GambitTeachAgainX23:
GambitTeachAgainX22:
GambitTeachAgainX21:
GambitTeachAgainX20:
GambitTeachAgainX19:
GambitTeachAgainX18:
GambitTeachAgainX17:
GambitTeachAgainX16:
GambitTeachAgainX15:
GambitTeachAgainX14:
GambitTeachAgainX13:
GambitTeachAgainX12:
GambitTeachAgainX11:
GambitTeachAgainX10:
GambitTeachAgainX9:
GambitTeachAgainX8:
GambitTeachAgainX7:
GambitTeachAgainX6:
GambitTeachAgainX5:
GambitTeachAgainX4:
GambitTeachAgainX3:
GambitTeachAgainX2:
GambitTeachAgainX1:
pause 5
GambitTeachAgain:
pause 2
GoTo GambitTeachA

GambitTeachProblem:
IF_4 GoTo GambitTeachProblem%4

GambitTeachProblemSTEALTH:
IF_6 GoTo GambitTeachAgainX%c

GambitTeachProblemTUMBLE:
GambitTeachProblemCARTWHEEL:
GambitTeachProblemFLIP:
GambitTeachProblemDAGGER:
GambitTeachProblemDISPLAY:
GambitTeachProblemGET:
GambitTeachProblemVANISH:
GambitTeachProblem:
ECHO ***
ECHO * No Such Student Present.
ECHO * Glance when ready to try again
ECHO ***
waitfor You glance
GoTo GambitTeachA

# ---- Rogue Gambit Student ----

RGStudent:
IF_3 goto RGStudentStart
goto RGStudentSyntax

RGStudentSyntax:
ECHO ***
ECHO * Syntax for Rogue Gambit Student
ECHO * .guildx # 60 SKILL STYLE
ECHO * For DISPLAY / GET / VANISH
ECHO * .guildx # 60 SKILL STYLE ITEM CONTAINER
ECHO * For DISPLAY use STYLE variable for PERSON if applicable
ECHO * STYLE variable is the FOURTH variable
ECHO ***
GoTo ExitGuildx

RGStudentStart:
ECHO *** Waiting for lesson
ECHO *** Use MANA if hanging to force start
match RGStudentWait shows you how to
match RGStudentWait gives you some pointers on how
match RGStudentWait repeats the trick in slow motion,
match RGStudentWait explains to you
match RGStudentWait As you watch
match RGStudentWait Mana Points:
matchwait

RGStudentWait:
goto RGStudentWait_%3

RGSTudentStand:
pause
put stand
match RGStudentWait You stand
match RGStudentWait You are already standing.
match RGSTudentStand ...wait
match RGSTudentStand struggle
matchwait

RGStudentNOPerson:
ECHO ***
ECHO * The skill %3 requires a person
ECHO * The person %4 is not there
ECHO ***
GoTo ExitGuildx

RGStudentWait_TUMBLE:
RGStudentWait_CARTWHEEL:
RGStudentWait_FLIP:
RGStudentWait_DAGGER:
pause
put rgambit %3 %4
match RGStudentStow repetitions remaining
match RGStudentStow repetition remaining
match RGSTudentStand You must stand first.
match GambitDone completed your training
match RGStudentWait ...wait
match RGStudentStart need to have someone teaching you
match RGStudentStart You flip expertly into the air and land with nary a sound.
match RGStudentStart and spring to your feet, ready for action!
match RGStudentStart confidently into the air,
match RGStudentStart You perform a simple yet perfect cartwheel.
match RGStudentStart You glance down
matchwait

RGStudentWait_DISPLAY:
pause
put rgambit %3 %4 %5
match RGStudentStart repetitions remaining
match RGStudentStart repetition remaining
match RGStudentStowDISPLAY You need to be holding something first.
match RGStudentPersonDisplay TEACH  [LIST | person {skill} | HELP]
match GambitDone completed your training
match RGStudentWait ...wait
match RGStudentStart need to have someone teaching you
matchwait

RGStudentWait_GET:
pause
put rgambit %3 %4 %5 from my %6
match RGStudentStowGET repetitions remaining
match RGStudentStowGET repetition remaining
match GambitDone completed your training
match RGStudentWait ...wait
match RGStudentStart need to have someone teaching you
matchwait

RGStudentWait_VANISH:
pause
put rgambit %3 %4 %5 in my %6
match RGStudentStowVANISH repetitions remaining
match RGStudentStowVANISH repetition remaining
match RGStudentWaitVANISH You need to be holding something first.
match GambitDone completed your training
match RGStudentWait ...wait
match RGStudentStart need to have someone teaching you
matchwait

RGStudentWaitVANISH:
put get my %5 from my %6
match RGStudentWait You remove
match RGStudentWaitVANISH ...wait
matchwait

RGStudentWait_STEALTH:
pause
GoTo RGStudentSTEALTH%4

RGStudentSTEALTHPUT:
ECHO *** NOT DONE YET
GoTo ExitGuildx

# --- GET STUDENT ---

RGStudentStealthGET:
put put my %5 in my %6
match RGStudentStealthHide You put
match RGStudentStealthHide could not find
match RGStudentStealthHide You secretly place your
match RGStudentStealthGET ...wait
matchwait

RGStudentStealthGETPause:
pause
GoTo RGStudentStealthGET:

RGStudentStealthHide:
put hide
match RGStudentStealthDo%4 You attempt to blend
match RGStudentStealthDo%4 A tad paranoid, aren't we?
match RGStudentStealthHide You fail to slip into hiding.
match RGStudentStealthHidePause ..wait
matchwait

RGStudentStealthHidePause:
pause
GoTo RGStudentStealthHide

#You begin to move to a sitting position,
#but suddenly become aware that your actions have revealed your location.

RGStudentStealthDoKNEEL:
RGStudentStealthDoGET:
put rg %3 %4 my %5
match RGStudentStealthDone%4 repetitions remaining.
match RGStudentStealthDone%4 repetition remaining.
match RGStudentStealth%4 You're not even hidden!

match RGStudentStealth%4 You're already holding that.

match RGStudentStealth%4 your actions have revealed your location.
match RGStudentStealth%4 but have revealed yourself
match RGStudentStealthDoPause%4 but do not feel confident
match RGStudentStealthDoPause%4 but realize that doing so would
match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGStudentStealthDoPause%4 ..wait
matchwait

RGStudentStealthDoPauseKNEEL:
RGStudentStealthDoPauseGET:
pause
GoTo RGStudentStealthDo%4

RGStudentStealthDoneKNEEL:
RGStudentStealthDoneGET:
put put my %5 in my %6
match RGStudentStart You put
match RGStudentStart could not find
match RGStudentStart You secretly place your
match RGStudentStealthDoneGETPause ...wait
matchwait

RGStudentStealthDoneGETPause:
pause
GoTo RGStudentStealthDoneGET

# --- STAND STUDENT ---

RGStudentStealthSTAND:
put sit
match RGStudentStealthHide You sit down.
match RGStudentStealthHide You are already
match RGStudentStealthSTAND ...wait
matchwait

RGStudentStealthSTANDPause:
pause
GoTo RGStudentStealthSTAND:

RGStudentStealthHide:
put hide
match RGStudentStealthDo%4 You attempt to blend
match RGStudentStealthDo%4 A tad paranoid, aren't we? 
match RGStudentStealthHidePause You fail to slip into hiding.
match RGStudentStealthHidePause ..wait
matchwait

RGStudentStealthHidePause:
pause
GoTo RGStudentStealthHide

#You begin to move to a sitting position,
#but suddenly become aware that your actions have revealed your location.

RGStudentStealthDoKNEEL:
RGStudentStealthDoSTAND:
put rg %3 %4
match RGStudentStealthDone%4 repetitions remaining.
match RGStudentStealthDone%4 repetition remaining.
match RGStudentStealth%4 You're not even hidden!
match RGStudentStealth%4 You're already
match RGStudentStealth%4 your actions have revealed your location.
match RGStudentStealthDoPause%4 but do not feel confident
match RGStudentStealthDoPause%4 but realize that doing so would
match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGStudentStealthDoPause%4 ..wait
matchwait

RGStudentStealthDoPauseKNEEL:
RGStudentStealthDoPauseSTAND:
pause
GoTo RGStudentStealthDo%4

RGStudentStealthDoneKNEEL:
RGStudentStealthDoneSTAND:
put sit
match RGStudentStart You sit down
match RGStudentStart You are already
match RGStudentStealthDoneSTANDPause ...wait
matchwait

RGStudentStealthDoneSTANDPause:
pause
GoTo RGStudentStealthDoneSTAND

# --- SIT ---

RGStudentStealthKNEEL:
RGStudentStealthSIT:
put stand
match RGStudentStealthHide You stand up.
match RGStudentStealthHide You stand back up.
match RGStudentStealthHide You are already standing.
match RGStudentStealthSIT ...wait
matchwait

RGStudentStealthSITPause:
pause
GoTo RGStudentStealthSIT

RGStudentStealthHide:
put hide
match RGStudentStealthDo%4 You attempt to blend
match RGStudentStealthDo%4 A tad paranoid, aren't we? 
match RGStudentStealthHidePause You fail to slip into hiding.
match RGStudentStealthHidePause ..wait
matchwait

RGStudentStealthHidePause:
pause
GoTo RGStudentStealthHide

#You begin to move to a sitting position,
#but suddenly become aware that your actions have revealed your location.

RGStudentStealthDoKNEEL:
RGStudentStealthDoSIT:
put rg %3 %4
match RGStudentStealthDone%4 repetitions remaining.
match RGStudentStealthDone%4 repetition remaining.
match RGStudentStealth%4 You're not even hidden!
match RGStudentStealth%4 You're already
match RGStudentStealth%4 your actions have revealed your location.
match RGStudentStealthDoPause%4 but do not feel confident
match RGStudentStealthDoPause%4 but realize that doing so would
match GambitStealthEnd You have completed
match GambitStealthNoItem could not find
match RGStudentStealthDoPause%4 ..wait
matchwait

RGStudentStealthDoPauseKNEEL:
RGStudentStealthDoPauseSIT:
pause
GoTo RGStudentStealthDo%4

RGStudentStealthDoneKNEEL:
RGStudentStealthDoneSIT:
put stand
match RGStudentStart You stand up.
match RGStudentStart You stand back up.
match RGStudentStart You are already standing.
match RGStudentStealthDoneSITPause ...wait
matchwait

RGStudentStealthDoneSITPause:
pause
GoTo RGStudentStealthDoneSIT

# --- SIT ---

RGStudentPersonDisplay:
ECHO ***
ECHO * The skill %3 requires a person
ECHO * The person %4 is not there
ECHO *
GoTo RGStudentSyntax

RGStudentStowGET:
pause
put put my %5 in my %6
match RGStudentStart You put
match RGStudentStowGET ...wait
matchwait

RGStudentStowVANISH:
RGStudentStowDISPLAY:
pause
put get my %5 from my %6
match RGStudentStart You remove
match RGStudentStowVANISH ...wait
matchwait

RGStudentStow:
goto RGStudentStow_%3

RGStudentStow_TUMBLE:
RGStudentStow_CARTWHEEL:
RGStudentStow_FLIP:
RGStudentStow_DAGGER:

GoTo RGStudentStart
#match
#matchwait


# ********************** END Gambits *************************

# ********************** Stand Up *************************
guildstartstand:
pause
put stand
match guildstartstandwait You stand back up.
match guildstartstandwait You are already standing.
match guildstartstand ..wait
match guildstartstand struggle
matchwait

guildstartstandwait:
ECHO *** Waiting to fall
match guildstartstand You fall to the ground!
matchwait

# ********************** Stand Up End *************************

# ********************** No Guild Work *************************

NoGuildWork:
pause
ECHO ***
ECHO * !!!ERROR!!!
ECHO * Your GLD Menu does not require you to work on what you selected in the script.
ECHO * Please try again, if this problem persist, contact me.
ECHO ***
GoTo ExitGuildx

NoGuildWorkAssigned:
pause
ECHO ***
ECHO * !!!ERROR!!!
ECHO * You are not assigned to work on the task you are trying to work on.
ECHO * Please try again, if this problem persist, contact me.
ECHO ***
GoTo ExitGuildx


# ********************** REP CHECK *************************

GuildStartRepCheck:

LandingRepCheck:
SolhavenRepCheck:
IcemuleRepCheck:
TerasRepCheck:
RiverRestRepCheck:
VaalorRepCheck:
IllistimRepCheck:
LogothRepCheck:
1RepCheck:
2RepCheck:
3RepCheck:
4RepCheck:
5RepCheck:
6RepCheck:
7RepCheck:
8RepCheck:
GuildStartReps:
#pause
#ECHO ***
#ECHO *           !!!!!WANRING!!!!!!
#ECHO * Rep Check Scrolls your screen a page or two
#ECHO * To disable Rep Check hit ESC now!
#ECHO * Rep check will start in 3 seconds
#pause 1
#ECHO * !!!Warning Starting in 2 Seconds!!!
#pause 1
#ECHO * !!!Warning Starting in 1 Seconds!!!
#pause 1
IF_2 shift
#GoTo RepCheck
GoTo ExitGuildX
ECHO ***
ECHO * Rep Check is temporarely disabled
ECHO * Check your own stuff!!
ECHO ***
GoTo ExitGuildX

SweepRepCheck:
RepCheck:
counter set 2
put gld
match RepCheckSweep ranks in the Sweep skill
match RepCheckSubdue ranks in the Subdue skill
match RepCheckStun ranks in the Stun Maneuvers skill
match RepCheckLockMastery ranks in the Lock Mastery skill
match RepCheckCheapShots ranks in the Cheap Shot skill
match RepCheckGambits ranks in the Rogue Gambits skill
match RepCheckEnd Type GLD MENU for additional commands.
matchwait

RepCheck2:
#SubdueRepCheck
counter set 3
put gld
match RepCheckSubdue ranks in the Subdue skill
match RepCheckStun ranks in the Stun Maneuvers skill
match RepCheckLockMastery ranks in the Lock Mastery skill
match RepCheckCheapShots ranks in the Cheap Shot skill
match RepCheckGambits ranks in the Rogue Gambits skill
match RepCheckEnd Type GLD MENU for additional commands.
matchwait

RepCheck3:
#StunRepCheck
counter set 4
put gld
match RepCheckStun ranks in the Stun Maneuvers skill
match RepCheckLockMastery ranks in the Lock Mastery skill
match RepCheckCheapShots ranks in the Cheap Shot skill
match RepCheckGambits ranks in the Rogue Gambits skill
match RepCheckEnd Type GLD MENU for additional commands.
matchwait

RepCheck4:
#LockRepCheck
counter set 5
put gld
match RepCheckLockMastery ranks in the Lock Mastery skill
match RepCheckCheapShots ranks in the Cheap Shot skill
match RepCheckGambits ranks in the Rogue Gambits skill
match RepCheckEnd Type GLD MENU for additional commands.
matchwait

RepCheck5:
#CheapRepCheck
counter set 6
put gld
match RepCheckCheapShots ranks in the Cheap Shot skill
match RepCheckGambits ranks in the Rogue Gambits skill
match RepCheckEnd Type GLD MENU for additional commands.
matchwait

RepCheck6:
#GambitRepCheck
counter set 0
put gld
match RepCheckGambits ranks in the Rogue Gambits skill
match RepCheckEnd Type GLD MENU for additional commands.
matchwait

#You have no repetitions remaining for this task.
#You are not currently training in this skill.
#You have 10 repetitions remaining to complete this task.

RepCheckSweep:
match RepCheckYes%1 You have no repetitions
match RepCheckYes%1 You are not currently
match RepCheckNo repetitions remaining to complete this task
matchwait

save Sweep
GoTo RepCheckCheck

RepCheckSubdue:
save Subdue
GoTo RepCheckCheck

RepCheckStun:
save Stun
GoTo RepCheckCheck

RepCheckLockMastery:
save Lock
GoTo RepCheckCheck

RepCheckCheapShots:
save Cheap
GoTo RepCheckCheck

RepCheckGambits:
save Gambit
GoTo RepCheckCheck

RepCheckCheck:
match RepCheckYes%1 You have no repetitions
match RepCheckYes%1 You are not currently
match RepCheckNo repetitions remaining to complete this task
matchwait

RepCheckYes:
pause
ECHO ** Got a %s Rank
GoTo RepCheck%c

RepCheckNo:
GoTo RepCheck%c

RepCheckYes1:
put ask deluca about %s train
GoTo RepCheckYes

RepCheckYes2:
put ask milgrew about %s train
GoTo RepCheckYes

RepCheckYes3:
put ask teagais about %s train
GoTo RepCheckYes

RepCheckYes4:
put ask runaire about %s train
GoTo RepCheckYes

RepCheckYes5:
put ask maliq about %s train
GoTo RepCheckYes

RepCheckYes6:
put ask Flyndar about %s train
GoTo RepCheckYes

RepCheckYes7:
# *** NOT DONE YET ***
GoTo notdoneyet
put ask <> about %s train
GoTo RepCheckYes

RepCheckYes8:
put ask Boucher about %s train
GoTo RepCheckYes

RepCheck0:
RepCheckEnd:
pause
ECHO ** Finished getting reps ***
GoTo ExitGuildx


# ********************** END REP CHECK *************************

# ********************** KEEP CHECK *************************
dummykeep:
windowskeep:
dirtkeep:
flowerskeep:
guilds:
ECHO ********************************************
ECHO * You must choose which guild you are in
ECHO * 1 is for Landing guild
ECHO * 2 is for Solhaven guild
ECHO * 3 is for Icemule guild (only partially done)
ECHO * 4 is for Teras guild
ECHO * 5 is for RiverRest guild (only partially done)
ECHO * 6 is for Ta'Vaalor (only partically done)
ECHO * 7 is for Ta'Illistim (only partially done)
ECHO * So restart and type .guildx #
ECHO * If you continue to get this message, make sure
ECHO * You are the the guild courtyard.
ECHO * Also, the guild you are in might not be done.
ECHO ********************************************
exit

# ********************** MASTERS *************************
#Landing1:
#
#match miller Master Footpad Miller
#match murphy Master Footpad Murphy
#match o'toole Master Footpad O'Toole
#match reilly Master Footpad Reilly
# match bean Master Footpad Bean
# match houlihan Master Footpad Houlihan

# Solhaven2:

# match ogdin Master Footpad Ogdin
# match varant Master Footpad Varant
# match triaholly Master Footpad Triaholly
# match sneck Master Footpad Sneck

# Icemule3:

# match truaz Master Footpad Truaz
# match cuip Master Footpad Cuip
# match buchara Master Footpad Buchara

# Teras4:

# match jimik Master Footpad Jimik
# match faldes Master Footpad Faldes
# match herit Master Footpad Herit
# match gludac Master Footpad Gludac
# match lagick Master Footpad Lagick
# match zardak Master Footpad Zardak

# RiversRest5:
# Training Administrator Maliq
# match harith Master Footpad Harith
# match jafar Master Footpad Jafar
# match mubarak Master Footpad Mubarak
# match selima Master Footpad Selima
#
#Ta'Illistim6:
#Training Administrator Boucher
#match ritchie Master Footpad Ritchie
#match purkhiser Master Footpad Purkhiser
#match colvin Master Footpad Colvin
#match vigil Master Footpad Vigil

# ********************** END MASTERS *************************

# ********************** PROMOTE *************************
# Syntax
# .guildx # promote
# .guildx # promote <person> <skill>

guildstartpromote:
IF_4 goto GuildxPromotePerson
GoTo GuildxPromote%1

GuildxPromotePerson:
put gld promote %3 in %4
GoTo ExitGuildx

GuildxPromote1:
GuildxPromote2:
GuildxPromote3:
GuildxPromote4:
GuildxPromote5:
GuildxPromote6:
GuildxPromote7:
GuildxPromote8:
ECHO ***
ECHO * Promote for this guild is not done yet
ECHO * Please check back later
ECHO ***
Goto ExitGuildx



# ********************** END PROMOTE *************************

# ********************** LABELERROR *************************

labelerror:
pause 2
ECHO *************************************************
ECHO * The script has encountered a label error
ECHO * Please report this issue by emailing me
ECHO * Or posting on the boards
ECHO * Or try again if you think it was user error
ECHO *
ECHO * Usage: .guildx travel # <name> (only to enter guild)
ECHO *        .guildx travel #
ECHO *        .guildx # ##
ECHO *
ECHO * # is for guild location
ECHO * ## is for current guild skill
ECHO * For Help
ECHO *        .guildx help
ECHO *************************************************
Goto ExitGuildx

# ********************** END LABELERROR *************************

# ********************** HELP MENU *************************

guildstartVERSION:
ECHO ***
ECHO * Last Updated 11/30/2004
ECHO * Version 11302004A
ECHO ***
exit

guildstarthelp:
wait
ECHO ************************************************
ECHO * Version 11302004A
ECHO * 1 Instructions............type GLDONE
ECHO * 2 Skills..................type GLDTWO
ECHO * 3 Variables...............type GLDTHREE
ECHO * 4 Starting Points.........type GLDFOUR
ECHO * 5 Travel Starting Points..type GLDFIVE
ECHO * 6 Travel Help.............type GLDSIX
ECHO * 7 Website Info............type GLDSEVEN
ECHO * Exit......................type GLDEIGHT (or ESC)
ECHO ************************************************
match guildstartINSTRUCTIONS GLDONE
match guildstartSKILLS GLDTWO
match guildstartVARIABLES GLDTHREE
match guildstartSTARTINGPOINTS GLDFOUR
match guildstartTRVPOINTS GLDFIVE
match guildstartTRVHELP GLDSIX
match guildstartWEBSITE GLDSEVEN
match guildstartEND GLDEIGHT
match guildstartEND ESC
matchwait

guildstartHELPRESTART:
ECHO * Back to Main menu......type GLDONE
ECHO * Exit...................type GLDTWO (or ESC)
ECHO ************************************************
match guildstarthelp GLDONE
match guildstartEND GLDTWO
match guildstartEND ESC
matchwait

guildstartEND:
exit

# ********************** END HELP MENU *************************

# ********************** INSTRUCTIONS *************************

guildstartinstructions:
instructions:
wait
ECHO **************************************************************************
ECHO * Here we go. This script is used for Rogue Guild practice. Eventually
ECHO * it will work with any task done in the guild. It will also work in
ECHO * any of the active guilds.
ECHO *
ECHO * In most cases it will recognize the guild you are in, but if not:
ECHO * Use the first command line variable for the guild you are in
ECHO * #'s = 1 = Landing, 2 = Solhaven, 3 = Icemule, 4 = Teras, 5 = RR
ECHO * Also, try to always start the script from the courtyard
ECHO *
ECHO * More command line variables are used through out the script
ECHO * There are always instructions around the skill, and the script will
ECHO * stop if you are not doing it right.
ECHO *
ECHO * Parts of the script require the first variable to work correctly
ECHO * Other parts don't. It will stop and tell you if it is required
ECHO * Other parts have added features that use the first variable
ECHO * If you experience any problems, or you find bugs, or have questions
ECHO * Please email me at bladenight@aol.com
ECHO *
ECHO **************************************************************************
GoTo guildstartHELPRESTART

# ********************** END INSTRUCTIONS *************************

# ********************** SKILL *************************

guildstartSkills:
guildstartSkill:
Skill:
wait
ECHO ************************************
ECHO * List of Skills Covered by script
ECHO *
ECHO * 1 Stunman...........type GLDONE
ECHO * 2 Dirt/Sweep........type GLDTWO
ECHO * 3 Sweep Masters.....type GLDTHREE
ECHO * 4 Windows...........type GLDFOUR
ECHO * 5 Water Plants......type GLDFIVE
ECHO * 6 Cheapshot (all)...type GLDSIX
ECHO * 7 Sweep Partners....type GLDSEVEN
ECHO * 8 Mannequins........type GLDEIGHT
ECHO * 9 Garlic............type GLDNINE
ECHO ************************************
match guildstartSTUNMAN GLDONE
match guildstartSWEEPDIRT GLDTWO
match guildstartSWEEPMASTER GLDTHREE
match guildstartWINDOWS GLDFOUR
match guildstartPLANTS GLDFIVE
match guildstartCHEAPSHOT GLDSIX
match guildstartSWEEPPARTNER GLDSEVEN
match guildstartMANNEQUINS GLDEIGHT
match guildstartGARLIC GLDNINE
matchwait

guildstartSKILLRESTART:
ECHO * Back to Main menu......type GLDONE
ECHO * Back to Skill menu.....type GLDTWO
ECHO * Exit...................type GLDTHREE (or ESC)
ECHO **********************************************
match guildstarthelp GLDONE
match guildstartSkill GLDTWO
match guildstartEND GLDTHREE
match guildstartEND ESC
matchwait

guildstartSTUNMAN:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Stunman With Masters: - .guildx # <current_skill> -
ECHO * 	<current_skill> = shield, get, stand, stance1, etc..
ECHO *	The skill MUST be spelled out comletely!
ECHO *	For the 6th skill it will be a bit different. I've added
ECHO *	instructions that you will see if you have to do the 6th skill.
ECHO * Stunman Self Reps: - .guildx - Unless otherwise noted
ECHO *	I only have it to use with skull or rum. Searches for rum first
ECHO *	If using a skull the base pause RT is 12 seconds, however
ECHO *	If you type (.guildx 4 x x x )(needs 4 variables)
ECHO *	 you will switch to 13 seconds.
ECHO *	Depending on lag, one might work better than the other.
ECHO * Stunman arrow/slap: usage - .guildx # x x - depending on pattern
ECHO *	Example of Landing guild work:
ECHO *	  For pattern 1 type .guildx # #
ECHO *	  For pattern 2 type .guildx # # x
ECHO *	  For pattern 3 type .guildx # # x x
ECHO *	  For pattern 4 type .guildx # # x x x
ECHO * This will allow you to try different patterns for SLAP and ARROWS
ECHO * Currently I have 4 patterns for SLAP and 2 for ARROWS
ECHO * I might add another pattern for arrows soon too.
ECHO * The script can be restarted while working with the masters.
ECHO * Restart command is same as first start command.
ECHO **************************************************************************
ECHO * Back to Main menu......type GLDONE
ECHO * Back to Skill menu.....type GLDTWO
ECHO * Exit...................type GLDTHREE (or ESC)
ECHO **********************************************
match guildstarthelp GLDONE
match guildstartSkill GLDTWO
match guildstartEND GLDTHREE
match guildstartEND ESC
matchwait

guildstartSWEEPDIRT:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Sweep dirt: type .guildx - Should recognize the courtyard
ECHO *	Start from courtyard, or some of the rack rooms.
ECHO * 	Restarting after a timer, or hitting escape requires the town #
ECHO *	usage: type .guildx 1 - for Landing/Wehnimers
ECHO *	usage: type .guildx 2 - for Solhaven
ECHO *	usage: type .guildx 3 - for Icemule (not done)
ECHO *	usage: type .guildx 4 - for Teras
ECHO *	usage: type .guildx 5 - for River Rest
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartSWEEPMASTER:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Sweeping With Masters: type .guildx
ECHO * 	Start this from the courtyard, masters room, or dark corner
ECHO *	This part of the script is still being worked on. I will update
ECHO *	as I get more information
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartWINDOWS:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Window Cleaning: type .guildx
ECHO * 	Windows is not set to restart. However, if the script timer
ECHO *	cuts out during windows, get a new connection because yours
ECHO *	is way to slow.! Or you might want to get the timer removal.
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartPLANTS:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Watering Plants and Wildflowers: type .guildx
ECHO * 	Plants is not set to restart. However, if the script timer
ECHO *	cuts out during watering, get a new connection because yours
ECHO *	is way to slow.! Or you might want to get the timer removal.
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartCHEAPSHOT:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Cheapshot With Masters: type .guildx - or - .guildx # -
ECHO *      All cheapshots should work, send me an email if any don't
ECHO *
ECHO * Cheapshot Partner Reps: type .guildx cheap <partner>
ECHO * Also, you can use the script to stomp someone, it will either stomp
ECHO * until the timer hits, until you escape the script, or you can set
ECHO * the script to stomp a certain number of times
ECHO * 	Usage: - .guildx cheap <target> # (1-30)
ECHO *
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartSWEEPPARTNER:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Sweep Partner or People: type .guildx <sweep> <partner> <#> <pull>
ECHO * 	<sweep> =  Tells the script what you are doing.
ECHO * 	<partner> = Person you are sweeping <full name needed>
ECHO * 	<#> = Optional, # of times to sweep person max 30
ECHO *		<put 0 if wishing to bypass>
ECHO * 	<pull> = Optional , attemp to pull the partner up <I don't advice pulling>
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartMANNEQUINS:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Mannequin sweep training: type .guildx - or - .guildx #
ECHO *	This can be started from the courtyard, or inside the training
ECHO *	room. The script should recognize the guild you are in.
ECHO *	The script will not change your stance for this skill.
ECHO **************************************************************************
GoTo guildstartSKILLRESTART

guildstartGARLIC:
wait
ECHO **************************************************************************
ECHO * Usage For:
ECHO * Garlic training: type .guildx - or - .guildx #
ECHO *	This can be started from the courtyard, or inside the training
ECHO *	room. The script should recognize the guild you are in.
ECHO *	The script will not change your stance for this skill.
ECHO **************************************************************************
GoTo guildstartSKILLRESTART


# ********************** END SKILL *************************

# ********************** VARIABLES *************************

guildstartvariables:
wait
ECHO ***************************************************************************
ECHO * From the menu bar at the top of Wizard FE
ECHO * GoTo CONFIGURATION Menu
ECHO * 	GoTo OPTIONS
ECHO *	GoTo The tab VARIABLES
ECHO * That is where you will find the different variables used in this script
ECHO * Like % shield, % weapon, % sheath, etc.
ECHO ***************************************************************************
GoTo guildstartHELPRESTART

# ********************** END VARIABLES *************************

# ********************** TOWNS * EXTRAS *************************

guildstartSTARTINGPOINTS:
wait
ECHO **************************************************************************
ECHO * 1 is for Landing guild
ECHO * 2 is for Solhaven guild
ECHO * 3 is for Icemule guild
ECHO * 4 is for Teras guild
ECHO * 5 is for RiverRest guild
ECHO * 6 is for Ta'Vaalor guild
ECHO * 7 is for Ta'Illistim guild
ECHO *
ECHO * All reps done with masters can be started from the courtyard, or the
ECHO * room in which masters are in, or from the dark corner where you work
ECHO * with the masters, unless otherwise stated by script.
ECHO *
ECHO * If script hangs at the masters, then it is likely that the work
ECHO * for that section is not completed.
ECHO *
ECHO **************************************************************************
GoTo guildstartHELPRESTART

guildstartWEBSITE:
guildstartWEB:
guildstartURL:
guildstartSITE:
guildstartNET:
pause
ECHO **************************************************************************
ECHO * I will update this as frequently as I can
ECHO * Check often for updates, will note on site when last updated was done
ECHO * Link for updates:
ECHO * http://www.geocities.com/bladenight95/scripts.html
ECHO **************************************************************************
GoTo guildstartHELPRESTART

guildstartTRVPOINTS:
pause
ECHO **************************************************************************
ECHO * Usage: type .guildx travel - or - .guildx travel (name)
ECHO *	To learn how to use (name) go to the Travel Help section
ECHO *
ECHO * Wehnimers Landing:
ECHO *	- Voln Courtyard
ECHO *	- North Gate - Wehnimer's, Outside Gate
ECHO *	- Caravansary - Northern Caravansary, Green
ECHO *	- Park - Town Square, Small Park
ECHO *	- Ocoma Valley - Room Desc - An odd greyish rock sits directly in the path,
ECHO *	- AI - Abandoned Inn, Entry - Or outside
ECHO *	- Frith's Inn - Frith's Inn, Parlour (Outside the tables)
ECHO *	- Dunphy - If you have the password intergrated
ECHO *	- Deluca - back to North gate
ECHO * Teras Isle:
ECHO *	- Gates - Kharam-Dzu, Town Gates
ECHO *	- Statue - Dragonspine and Krodera
ECHO *	- Path north of Wiz Guild - Rough Path, Canyon Wall
ECHO *	- Voln - Temple, Eonak's Chapel
ECHO *	- Cariov - If you have the password intergrated
ECHO *	- Runaire - back to the Statue
ECHO * Solhaven:
ECHO *	- North of North Market - Solhaven, Bayside Road
ECHO *	- Voln - where "return" drops you off - Solhaven, Liabo Plaza
ECHO *	- Milgrew - back to North of North Market
ECHO * Icemule:
ECHO *	- TC - Icemule Trace, Town Center
ECHO *	- Well (picking well?) - Room Desc - A stucco well attracts a group of children
ECHO *	- South Gate - Room Desc - South Gate.
ECHO *	- North Gate - Icemule Trace, North Gate
ECHO *	- West Gate - Room Desc - The cobblestone road ends at the large western gate here.
ECHO *	- East Gate Icemule Trace, East Gate
ECHO *	- Garden - Abandoned Farm, Garden - Hunting Ground out the South Gate.
ECHO *	- Behren - If you have the password intergrated
ECHO *	- Teagais - back to TC
ECHO *
ECHO * More to come as I travel
ECHO **************************************************************************
GoTo guildstartHELPRESTART

guildstartTRVHELP:
pause
ECHO **************************************************************************
ECHO * Traveling to the guild from various points in and around the towns.
ECHO * Usage: type .guildx travel
ECHO *	or type .guildx travel (name) - if you have your password integrated.
ECHO * Tod add your GUILD password to the script you must open up the script.
ECHO * Than go towards the end of it.
ECHO * It will show you how to edit the script in order to add your password.
ECHO *
ECHO **************************************************************************
GoTo guildstartHELPRESTART


# ********************** END EXTRAS *************************

# ********************** TRAVEL *************************

guildstartTRAVEL:
shift
IF_1 save %1
IF_1 GoTo GuildTravel%s
echo ***************************************
echo *  Please choose a guild.
echo *  Proper usage:
echo *  .guildx travel # name # (# needs to be put in a second time for rep check)
echo *  # = 1 for Landing
echo *  # = 2 for Solhaven
echo *  # = 3 for Icemule
echo *  # = 4 for Teras Isle
echo *  # = 5 for River Rest
echo *  # = 6 for Ta'Vaalor
echo *  # = 7 for Ta'Illistim
echo *  # = 8 for Zul Logoth (Plat Only)
echo ***************************************
exit

GuildStartTravel1:
GuildStartTravelLanding:
GuildTravel1:
shift
match LandingPark Town Square, Small Park
match LandingChoose Rogue Guild, Courtyard Center
match LandingDunphy Dunphy
match LandingPortal Nexus, Central
match LandingNGate Wehnimer's, Land's End Rd.
match LandingNGateOut Wehnimer's, Outside Gate
match LandingVoln Courtyard
match LandingTower Land Tower East, Office
put LooK
matchwait

GuildStartTravel2:
GuildStartTravelSolhaven:
GuildTravel2:
shift
match SOLLiabo Solhaven, Liabo Plaza
match SOLNMarket Solhaven, North Market
match SOLGuildChoose Training Administrator Milgrew
match SOLDunleevy Dunleevy
match SOLPortal path may have once been paved.
put LooK
matchwait

GuildStartTravel3:
GuildStartTravelIcemule:
GuildTravelIcemule:
GuildTravel3:
shift
match IcemuleTC Icemule Trace, Town Center
match IcemuleBehren Behren
match IcemuleGuildChoose Training Administrator Teagais
match IcemuleSGate past you on their way through the South Gate.
match IcemuleNGate Icemule Trace, North Gate
match IcemuleWGate The cobblestone road ends at the large western gate here.
match IcemuleEGate Icemule Trace, East Gate
match IcemulePortal A warm mist gathers around you like a cloud on a mountain top.
put LooK
matchwait

GuildStartTravel4:
GuildStartTravelTeras:
GuildTravelTeras:
GuildTravel4:
shift
match TerasStatue Dragonspine and Krodera
match TerasGate Kharam-Dzu, Town Gates
match TerasCariov Cariov
match TerasGuildChoose Training Administrator Runaire
match TerasPortal  sits on a rock, basking in the moonlight
put LooK
matchwait

GuildStartTravel5:
GuildStartTravelRest:
GuildTravelRest:
GuildTravel5:
shift
match RiverGuildKhanduhar Khanduhar
match RiverGuildChoose Training Administrator Maliq
match RiverPortal less than willing to stay here much longer.
put LooK
matchwait

GuildStartTravel6:
GuildStartTravelVaalor:
GuildTravelVaalor:
GuildTravel6:
shift
match VaalorCourt Several elven guards stand beneath a nearby tree
match VaalorGuildChoose Training Administrator Flyndar
match VaalorGuildMalahar Malahar
match VaalorPortal Slippery stone steps sopped in a clear brackish ooze lead
match VaalorGuildShed You also see a small stone shed
match VaalorGuildInsideShed A few rusty tools hang on one wall
match VaalorShind2 Shind
match VaalorVicGate the Victory Gate
match VaalorAnaGate through the Annatto Gate
match VaalorVerGate the Vermilion Gate
match VaalorAmaGate towering gate looms above
put LooK
matchwait

GuildStartTravel7:
GuildStartTravelIllistim:
GuildTravelIllistim:
GuildTravel7:
shift
match IllistimMadansky Madansky
match IllistimChoose Boucher
match IllistimDais2Guild Ta'Illistim, Hanging Gardens
match IllistimPortal2Guild rigors of the journey.
match IllistimPostern2Guild thick ironwork gate
match IllistimSkull2Guild You also see a dense beech grove.
put LooK
matchwait

#For future Guild releases
GuildStartTravel8:
GuildStartTravelLogoth:
GuildTravelLogoth:
GuildTravel8:
shift
match LogothPortal The acrid smell of mildew rises from several canvas bags
match LogothGuildPortal Splashed water covers the floor around the pool
put LooK
matchwait

#*********************Landing Travel Section********************

LandingPortal:
move out
move southeast
move southeast
move south
move southeast
move go crevice
move climb rope
move south
move northeast
GoTo LandingPark2

LandingDunphy:
counter set 1
#IF_2 shift
IF_1 put lean door
IF_1 wait
IF_1 GoTo %1
GoTo nodoor

LandingPark:
move n
move ne
move ne
GoTo LandingPark2

LandingChoose:
match LandingGuildNGate NGate
match LandingGuildPortal Portal
match LandingGuildWGate WGate
match LandingGuildPark Park
match LandingGuildVoln Voln
echo *****************************
echo *  Choose your destination: *
echo *         Portal(Plat Only) *
echo *         NGate             *
echo *         Park              *
echo *         WGate             *
echo *         Voln              *
echo *****************************
matchwait

LandingGuildPortal:
save Portal
ECHO * Heading to Landing Portal Nexus *
GoTo LandingGuildOut

LandingGuildNGate:
save NGate
echo * Heading to Landing North Gate *
GoTo LandingGuildOut

LandingGuildPark:
save Park
echo * Heading to Small Park *
GoTo LandingGuildOut

LandingGuildWGate:
save WGate
echo * Heading to Landing West Gate *
GoTo LandingGuildOut

LandingGuildVoln:
save Voln
echo * Heading to Voln Monastary *
GoTo LandingGuildout

LandingGuildOut:
move s
move go door
move s
move s
move go door
move out
move go door
move out
GoTo LandingGuild2%s

LandingGuild2Voln:
move south
move west
move west
move northwest
move north
move west
move west
move south
move west
move west
move west
move southwest
move west
move west
move north
move go gate
move south
move south
move south
move southeast
move east
move east
move go bridge
move east
move northeast
move north
move north
move go trail
move east
move east
move east
exit

LandingGuild2Portal:
move south
move west
move west
move northwest
move north
move west
move west
move south
move west
move west
move west
move go well
move climb rope
move go crevice
move northwest
move north
move northwest
move northwest
move go hole
exit

LandingGuild2NGate:
move n
move n
move n
move w
move n
move n
move w
move w
move w
move w
move w
move w
move w
move n
exit

LandingGuild2Park:
move south
move west
move west
move northwest
move north
move west
move west
move south
move west
move west
move west
move southwest
move south
exit

LandingGuild2WGate:
move south
move west
move west
move northwest
move north
move west
move west
move south
move west
move west
move west
move west
move west
move west
move south
exit

LandingTower:
move out
goto LandingNGate

LandingNGateOut:
move go gate
goto LandingNGate

LandingNGate:
move s
move w
move s
move s
move e
LandingPark2:
move e
move e
move e
move e
move e
move s
move e
move n
move e
move s
move s
move s
move go hall
closeddoor:
put go black door
match opendoor BONK! You smash your nose
match LandingPanel Obvious exits
matchwait

opendoor:
put open door
GoTo closeddoor

LandingPanel:
move go panel
counter set 1
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

Trainer1:
move go hall
put north
move go door
move n
GoTo LandingRepCheck

LandingVoln:
move west
move west
move west
move go trail
move south
move south
move southwest
move west
move go bridge
move west
move west
move northwest
move north
move north
move north
move north
move north
move northeast
move go gate
GoTo LandingNGate

#*****************End Landing Travel Section********************

#*********************Solhaven Travel Section*******************

SOLPortal:
move south
move south
move south
move go brush
move down
move climb path
move southeast
move east
move east
move southeast
move south
move east
move go bridge
move up
move southeast
move southeast
move southeast
move southeast
move south
GoTo SOLNMarket

SOLLiabo:
move n
move ne
move ne
move ne
move s
GoTo SOLNMarket

SOLNMarket:
move e
move e
move e
move go doors
move climb stair
move go step
SOLDunleevy:
counter set 2
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

SOLGuildChoose:
match SOLGuildMarket Market
match SOLGuildPortal Portal
match SOLGuildLiabo Liabo
pause 1
echo ******************************
echo *  Choose your destination:  *
echo *         Portal (Plat Only) *
echo *         Market             *
echo *         Liabo (Ring/Fog)   *
echo ******************************
matchwait

SOLGuildMarket:
save Market
echo * Heading to Solhaven North Market *
GoTo SOLGuildOut

SOLGuildPortal:
save Portal
echo * Heading to Solhaven Portal *
GoTo SOLGuildOut

SOLGuildLiabo:
save Liabo
echo * Heading to Liabo Plaza *
GoTo SOLGuildOut

SOLGuildOut:
move go door
move sw
move sw
move go door
move go carved arch
move s
move e
move go trap
move go door
move go step
move climb stair
move out
GoTo SOLGuild2%s

SOLGuild2Market:
move w
move w
move w
exit

SOLGuild2Portal:
move w
move w
move w
move n
move northwest
move up
move northwest
move northwest
move northwest
move northwest
move west
move north
move northwest
move west
move west
move northwest
move climb path
move up
move go brush
move north
move north
move north
exit

SOLGuild2Liabo:
move w
move w
move w
move w
move sw
move sw
move s
exit

Trainer2:
move go trap
move w
move n
move go arch
IF_3 move go wide arch
IF_3 move go curtain
IF_3 exit
move go door
move ne
move ne
move go door
GoTo SolhavenRepCheck

#*****************End Solhaven Travel Section*******************

#*********************Icemule Travel Section********************

IcemulePortal:
move up
move up
move climb limb
move up
move climb lip
move north
move northeast
move south
move south
move east
GoTo IcemuleHall

IcemuleSGate:
move n
move n
move w
GoTo IcemuleHall

IcemuleNGate:
move s
move s
move s
move s
move s
GoTo IcemuleTC

IcemuleWGate:
move e
move e
move e
move s
move s
move s
move e
GoTo IcemuleHall

IcemuleEGate:
move w
move w
move w
move w
move w
GoTo IcemuleTC

IcemuleGuildChoose:
match IcemuleGuildTC TCenter
match IcemuleGuildPortal Portal
match IcemuleGuildNGate NGate
match IcemuleGuildEGate EGate
match IcemuleGuildWGate WGate
match IcemuleGuildSGate SGate
pause 1
echo *****************************
echo *  Choose your destination: *
echo *        Portal (Plat Only) *
echo *        TCenter         *
echo *        NGate              *
echo *        EGate              *
echo *        WGate              *
echo *        SGate              *
echo *****************************
matchwait

IcemuleGuildOut:
move e
move s
move go door
move go tapestry
move out
GoTo IcemuleGuild2%s

IcemuleGuildTC:
save TC
echo * Heading to Icemule Town Center *
GoTo IcemuleGuildOut

IcemuleGuildPortal:
save Portal
echo * Heading to Icemule Portal *
GoTo IcemuleGuildOut

IcemuleGuildNGate:
save NGate
echo * Heading to Icemule North Gate *
GoTo IcemuleGuildOut

IcemuleGuildEGate:
save EGate
echo * Heading to Icemule East Gate *
GoTo IcemuleGuildOut

IcemuleGuildWGate:
save WGate
echo * Heading to Icemule West Gate *
GoTo IcemuleGuildOut

IcemuleGuildSGate:
save SGate
echo * Heading to Icemule South Gate *
GoTo IcemuleGuildOut

IcemuleGuild2NGate:
move n
move e
move n
move n
move n
move n
move n
move n
exit

IcemuleGuild2EGate:
move n
move e
move n
move e
move e
move e
move e
move e
exit

IcemuleGuild2WGate:
move n
move w
move n
move w
move w
move w
exit

IcemuleGuild2SGate:
move s
move e
move s
move s
exit

IcemuleGuild2TC:
move n
move e
move n
exit

IcemuleGuild2Portal:
move south
move west
move north
move north
move southwest
move south
move climb well
move down
move go limb
move down
move down
exit

IcemuleTC:
move s
move s
move s
move w
IcemuleHall:
move go entry
move e
move go tape
IcemuleBehren:
counter set 3
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

Trainer3:
move n
move w
GoTo IcemuleRepCheck

#*****************End Icemule Travel Section********************

#*********************Teras Isle Travel Section*****************

TerasPortal:
move go path
move north
move north
GoTo Teras2a

Teras2:
move go path
move n
TerasVoln2:
move n
GoTo Teras2a

TerasGuildChoose:
match TerasGuildStatue Statue
match TerasGuildPortal Portal
match TerasGuildGate Gate
pause 1
echo *****************************
echo *  Choose your destination: *
echo *        Portal (Plat Only) *
echo *        Statue             *
echo *        Gate               *
echo *****************************
matchwait

TerasGuildOut:
move n
move w
move sw
move nw
move w
move s
move w
move nw
move go door
move w
move out
move e
move e
move n
move n
move e
move go bridge
move e
move go bridge
move e
GoTo TerasGuild2%s

TerasGuildStatue:
save Statue
ECHO ** To the Statue, Krodera **
GoTo Terasguildout

TerasGuildPortal:
save Portal
ECHO ** To the Teras Isle Portal **
GoTo Terasguildout

TerasGuildGate:
save Gate
echo * Heading to Teras Isle Town Gate *
GoTo TerasGuildOut

TerasGuild2Statue:
move n
move n
move n
exit

TerasGuild2Portal:
move south
move south
move go path
exit

TerasGuild2Gate:
move n
move n
move n
move n
move n
move n
move n
exit

TerasCariov:
counter set 4
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

TerasGate:
move s
move s
move s
move s
move s
move s
move s
GoTo Teras2a

TerasStatue:
move s
move s
move s
Teras2a:
move w
move go bridge
move w
move go bridge
move w
move s
move w
move s
move w
move go warehouse
move e
counter set 4
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

Trainer4:
move se
move e
move n
IF_3 move ne
IF_3 move go door
IF_3 exit
move e
move se
move ne
move e
move s
GoTo TerasRepCheck

#*****************End Teras Isle Travel Section*****************

#*********************River Rest Travel Section*****************

RiverPortal:
move south
move west
move northwest
move northeast
move north
move go boulder
move northeast
move east
move southeast
move south
move south
RiverInn:
move go inn
move north
move go small door
move south
move go bags
RiverguildKhanduhar:
counter set 5
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

RiverGuildChoose:
match RiverGuildSanctuary Sanctuary
match RiverGuildPortal Portal
match RiverGuildTC TCommon
pause 1
echo
echo *******************************
echo * Choose your destination:    *
echo *        Portal (Plat Only)   *
echo *        Sanctuary            *
echo *        TCommon              *
echo *******************************
matchwait

RiverGuildOut:
move north
move go door
move climb ladder
move go bridge
move climb shaft
move out
move go bags
move north
move go small door
move south
move out
GoTo RiverGuild2%s

RiverGuildTC:
save TC
echo * Heading to River Rest Town Commons *
GoTo RiverGuildOut

RiverGuildPortal:
save Portal
echo * Heading to River Rest Portal *
GoTo Riverguildout

RiverGuildSanctuary:
save Sanctuary
echo * Heading to River Rest Sanctuary *
GoTo Riverguildout

RiverGuild2TC:
move west
move northwest
move go walkway
exit

RiverGuild2Portal:
move north
move north
move northwest
move west
move southwest
move go boulder
move south
move southwest
move southeast
move east
move north
exit

RiverGuild2Sanctuary:
move west
move northwest
move southwest
move west
move go pillars
exit

Trainer5:
move climb shaft
move go bridge
move climb ladder
move go door
move south
GoTo RiverRestRepCheck

#*****************End River Rest Travel Section*****************


#*********************Ta'Vaalor Travel Section******************

VaalorCourt:
move west
move west
move west
VaalorVicGate:
move north
move west
move west
move west
GoTo VaalorGuildShed

VaalorAnaGate:
move west
move west
move west
GoTo VaalorCourt

VaalorVerGate:
move west
move west
move west
move west
move west
move west
VaalorAmaGate:
move south
move west
move south
move west
move west
move south
move south
move south
move south
move south
GoTo VaalorGuildShed

VaalorShind:
match VaalorShind It appears to be locked
match VaalorEnterShed3 opened
move north
move north
move north
move north
move north
move go shop
VaalorShind2:
put ask Shind about guild
waitfor just went and picked the shed
move out
move south
move south
move south
move south
move south
put open shed
matchwait

VaalorEnterShed3:
move go shed
GoTo VaalorGuildInsideShed

VaalorPortal:
move climb steps
move southwest
move south
move east
move east
move east
move east
move east
move south
move south
move south
move south
move south
move south
move south
move climb ladder
move west
move go door
move west
move go door
move north
move north
move go hatch
move climb grate
move south
move south
move south
move south
VaalorGuildShed:
match VaalorGuildShed2 lockpick
match VaalorShind could not find
put GeT my lockpick from my %user0
matchwait

VaalorGuildShed2:
match VaalorEnterShed CLICK!
match VaalorOops You must have your other hand free
match VaalorOops *SNAP*
match VaalorOops broken
#match VaalorGuildShed2 You settle into the difficult
match VaalorGuildShed2 Roundtime:
match VaalorGuildShed2 You are not able to pick the lock
put pick shed with my lockpick
matchwait

# Every 90 seconds the room resets and relocks the door
# It actually caught me just after I unlocked it
# This is setup in case that happens
VaalorEnterShed:
match VaalorGuildShed BONK! You smash your nose
match VaalorGuildShed It appears to be locked
match VaalorEnterShed2 opened
put put lockpick in my %user0
put open shed
matchwait

VaalorEnterShed2:
put go shed
match VaalorGuildShed BONK! You smash your nose
match VaalorGuildInsideShed A few rusty tools hang on one wall
matchwait

VaalorGuildInsideShed:
put pull hoe
pause 4
put pull rake
pause 4
put pull shovel
pause 4
put go panel
VaalorGuildMalahar:
counter set 6
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

VaalorOops:
ECHO ************************************
ECHO * Please empty both of your hands  *
ECHO * or discard the broken lockpick   *
ECHO * if one just broke.               *
ECHO ************************************
exit

NeedLockpick:
ECHO **************************************
ECHO * No lockpick found.  Define %user0  *
ECHO * under Configuration/Options menu   *
ECHO * to point to lockpick container.    *
ECHO **************************************
exit

VaalorGuildChoose:
match VaalorGuildCourt Court
match VaalorGuildPortal Portal
match VaalorGuildVictory Victory
match VaalorGuildVermillion Vermillion
match VaalorGuildAmaranth Amaranth
match VaalorGuildAnnatto Annatto
pause 1
echo
echo *******************************
echo * Choose your destination:    *
echo *       Court (Victory Court) *
echo *       Portal (Plat Only)    *
echo *       Victory (Gate)        *
echo *       Vermillion (Gate)     *
echo *       Amaranth (Gate)       *
echo *       Annatto (Gate)        *
echo *******************************
matchwait

VaalorGuildVictory:
save Victory
GoTo VaalorGuildOut

VaalorGuildVermillion:
save Vermillion
GoTo VaalorGuildOut

VaalorGuildAmaranth:
save Amaranth
GoTo VaalorGuildOut

VaalorGuildAnnatto:
save Annatto
GoTo VaalorGuildOut

VaalorGuildCourt:
save Court
GoTo VaalorGuildOut

VaalorGuildPortal:
save Portal
GoTo VaalorGuildOut

VaalorGuildOut:
move out
move west
move go panel
move southwest
move up
move go trapdoor
move south
move south
move south
move go staircase
move north
move climb rope
move east
move go plank
move south
move climb ladder
move north
move east
move go chute
move out
GoTo VaalorGuild2%s

VaalorGuild2Victory:
move south
move south
move south
move south
move south
move east
move east
move east
move south
exit

VaalorGuild2Vermillion:
move east
move east
move north
move east
move north
move east
move east
move east
move east
move east
move east
exit

VaalorGuild2Amaranth:
move east
move east
move north
move east
move north
exit

VaalorGuild2Annatto:
move south
move south
move south
move south
move south
move east
move east
move east
move south
move east
move east
move east
move east
move east
move east
exit

VaalorGuild2Court:
move south
move south
move south
move south
move south
move east
move east
move east
move south
move east
move east
move east
exit

VaalorGuild2Portal:
move south
put climb grate
move go hatch
move south
move south
move go door
move east
move go door
move east
move climb ladder
move north
move north
move north
move north
move north
move north
move north
move west
move west
move west
move west
move west
move north
move northeast
move climb steps
exit

Trainer6:
move north
move north
move north
move climb ladder
move north
move go plank
move west
move go trapdoor
move south
move go staircase
move north
move north
move north
move go trapdoor
move down
move northeast
move climb ladder
move east
move north
GoTo VaalorRepCheck

#*****************End Ta'Vaalor Travel Section******************

#*********************Zul Logoth Travel Section*****************

LogothPortal:
move southeast
move go door
move up
move up
move go blocks
move out
move southeast
move south
move south
move southeast
move northeast
move northeast
move east
# Ends outside Bank
exit

LogothGuildPortal:
# Starts outside Bank
move west
move southwest
move southwest
move northwest
move north
move north
move northwest
move go tunnel
move go blocks
move down
move down
move go door
move northwest
exit

#******************End Zul Logoth Travel Section*****************

#*********************Ta'Illistim Travel Section****************

IllistimSkull2Guild:
move east
move northeast
move east
move north
move north
move northeast
move east
move northwest
move north
move northeast
move climb wall
move northeast
move go bridge
move northeast
move go steps
move north
move north
move northeast
move east
move southeast
move east
move northeast
move northeast
move north
move north
move northwest
move north
move northeast
move northeast
move north
move northwest
move east
move northeast
move north
move north
move north
move northeast
move northwest
move northeast
GoTo IllistimPortal2GuildB

IllistimPostern2Guild:
move east
move east
move east
move northeast
move northeast
move northeast
move south
move south
move east
move east
move east
move east
move east
move east
move east
move northeast
move southeast
GoTo IllistimFount2Guild

IllistimFount2Guild:
move northeast
move northeast
move northeast
move southeast
move northeast
move north
move go arbor
move go gold door
IllistimMadansky:
counter set 8
#IF_2 shift
IF_1 GoTo %1
GoTo nodoor

IllistimPortal2Guild:
move northwest
move north
move northwest
move west
IllistimPortal2GuildB:
move northeast
move north
move east
move east
move northeast
move go gate
move north
move north
move go portcullis
move northwest
move northeast
move go gate
move southwest
move west
move northeast
move north
move northwest
move northwest
move southwest
GoTo IllistimDais2GuildB

IllistimDais2Guild:
move out
move southeast
move southeast
move southwest
move southwest
IllistimDais2GuildB:
move southwest
move west
move west
move northwest
move north
move north
move north
GoTo IllistimFount2Guild

IllistimChoose:
pause
match IllistimPortal Portal
match IllistimDais Dais
match IllistimPostern Postern
match IllistimSkull Skull
ECHO ****************************
ECHO * Choose your destination: *
ECHO *                          *
ECHO *       Portal (Plat Only) *
ECHO *       Dais               *
ECHO *       Postern (Gate)     *
ECHO *       Skull   (Hunting)  *
ECHO ****************************
matchwait

IllistimSkull:
save Skull
GoTo IllistimGuildOut

IllistimPostern:
save Postern
GoTo IllistimGuildOut

IllistimPortal:
save Portal
GoTo IllistimGuildOut

IllistimDais:
save Dais
GoTo IllistimGuildOut

IllistimGuildOut:
move north
move east
move go stair
move out
move out
move out
move south
move southwest
move northwest
move southwest
move southwest
move southwest
GoTo IllistimGuild2%s

IllistimGuild2Postern:
move northwest
move southwest
move west
move west
move west
move west
move west
move west
move west
move north
move north
move southwest
move southwest
move southwest
move west
move west
move west
exit

IllistimGuild2Skull:
IllistimGuild2Portal:
IllistimGuild2Dais:
move south
move south
move south
move southeast
move east
move east
move northeast
GoTo IllistimGuild2%sB

IllistimGuild2DaisB:
move go dais
exit

IllistimGuild2SkullB:
IllistimGuild2PortalB:
move northeast
move southeast
move southeast
move south
move southwest
move east
move northeast
move go gate
move southwest
move southeast
move go portcullis
move south
move south
move out
move southwest
move west
move west
move south
move southwest
GoTo IllistimGuild2%sC

IllistimGuild2PortalC:
move east
move southeast
move south
move southeast
exit

IllistimGuild2SkullC:
move southwest
move southeast
move southwest
move south
move south
move south
move southwest
move west
move southeast
move south
move southwest
move southwest
move south
move southeast
move south
move south
move southwest
move southwest
move west
move northwest
move west
move southwest
move south
move go bridge
move go steps
move go bridge
move southwest
move southwest
move climb wall
move southwest
move south
move southeast
move west
move southwest
move south
move south
move west
move southwest
move west
exit

Trainer8:
move go stair
move west
move south
GoTo IllistimRepCheck

#*****************End Ta'Illistim Travel Section****************

#***************** Travel Between City ****************

#**************** To Landing ***************
GuildTravelLanding:
save Landing
GoTo GuildTravelToGuild

GuildTravelToLanding:
put LooK
match GTTSolhaven4SolhavenGuild Training Administrator Milgrew
match GTTSolhaven4SolhavenGuildP Rogue Guild, Pantry
match GTTSolhaven4SolhavenBayside Bayside Road widens here, as throngs of people head southward
match GTTSolhaven4SolhavenNM Solhaven, North Market
match GTTSolhaven4SolhavenLiaboPlaza Solhaven, Liabo Plaza
matchwait

GTTSolhaven4SolhavenBayside:
move nw
move up
move nw
move nw
move nw
move nw
move ne
move n
move n
move ne
move up
move n
move go ramp
move e
move se
move e
move e
move e
move e
move e
move ne
move n
move n
move ne
move ne
move ne
move ne
move ne
move n
move n
move n
move n
move ne
move ne
move ne
move ne
move ne
move n
move n
move ne
move go bridge
move ne
move ne
move ne
move ne
move nw
move up
move up
move up
move up
move up
move up
move up
move nw
move n
move n
move n
move n
move w
move w
move nw
move n
move down
move go col
move w
move nw
move n
move nw
move w
move w
move n
move n
move n
move n
move n
move n
move e
move go road
move n
move n
move ne
move ne
move e
move e
move e
move e
move e
move e
move e
move go ramp
move n
move up
move n
move ne
move n
move down
move nw
move ne
move n
move n
move ne
move ne
move n
move ne
move ne
move nw
move nw
move n
move n
move n
move n
move go ford
move ne
move n
move n
move ne
move ne
move ne
move go stream
move n
move nw
move nw
move nw
move nw
move w
move ne
move e
move ne
move nw
move w
move ne
move ne
move w
move n
move n
move n
move n
move ne
move n
move n
move w
move n
move nw
move n
move nw
move go bri
move w
move w
move sw
move sw
move nw
move nw
move n
move n
move n
move n
move e
move ne
move nw
move nw
move n
move go pat
move ne
move n
move n
move n
move nw
move n
move nw
move n
move ne
move n
move n
move n
move n
move n
move ne
move go gate
GoTo LandingNGate

GTTSolhaven4SolhavenNM:
move n
GoTo GTTSolhaven4SolhavenBayside

GTTSolhaven4SolhavenLiaboPlaza:
move n
move ne
move ne
move ne
GoTo GTTSolhaven4SolhavenBayside


GTTSolhaven4SolhavenGuild:
move go door
move sw
move sw
move go door
GoTo GTTSolhaven4SolhavenGuildP2

GTTSolhaven4SolhavenGuildP:
move go curt
move go arch
GoTo GTTSolhaven4SolhavenGuildP2

GTTSolhaven4SolhavenGuildP2:
move go carved arch
move s
move e
move go trap
move go door
move go step
move climb stair
put out
move w
move w
move w
move n
GoTo GTTSolhaven4SolhavenBayside


#**************** To Solhaven ***************
GuildTravelSolhaven:
save Solhaven
GoTo GuildTravelToGuild

GuildTravelToSolhaven:
GTTSolhaven:
put LooK
match GTTSolhaven4LandingGuild Training Administrator DeLuca
match GTTSolhaven4LandingGate Wehnimer's, Outside Gate
match GTTSolhaven4Caravan Northern Caravansary, Green
matchwait

GTTSolhaven4LandingGuild:
move s
move go door
move s
move s
move go door
move out
move go door
move out
move n
move n
move n
move w
move n
move n
move w
move w
move w
move w
move w
move w
move w
move n
move go ga
GoTo GTTSolhaven4LandingGate

GTTSolhaven4LandingGate:
move sw
move s
move s
move s
move s
move s
move sw
move s
move se
move s
move se
move s
move s
move s
move sw
move s
move s
move se
move se
move sw
move w
move s
move s
move s
move s
move se
move se
move ne
move ne
move e
move e
move go bri
move se
move s
move se
move s
move e
move s
move s
GoTo GTTSolhaven4Caravan2

GTTSolhaven4Caravan:
move n
move ne
GoTo GTTSolhaven4Caravan2

GTTSolhaven4Caravan2:
move sw
move s
move s
move s
move s
move e
move sw
move sw
move e
move se
move sw
move w
move sw
move e
move se
move se
move se
move se
move s
move go stream
move sw
move sw
move sw
move s
move s
move sw
move go ford
move s
move s
move s
move s
move se
move se
move sw
move sw
move s
move sw
move sw
move s
move s
move sw
move se
move up
move s
move sw
move s
move down
move s
move go ramp
move w
move w
move w
move w
move w
move w
move w
move sw
move sw
move s
move s
move go road
move w
move s
move s
move s
move s
move s
move s
move e
move e
move se
move s
move se
move e
move go col
move up
move s
move se
move e
move e
move s
move s
move s
move s
move se
move down
move down
move down
move down
move down
move down
move down
move se
move sw
move sw
move sw
move go bri
move sw
move sw
move s
move s
move sw
move sw
move sw
move sw
move sw
move s
move s
move s
move s
move sw
move sw
move sw
move sw
move sw
move s
move s
move sw
move w
move w
move w
move w
move w
move nw
move w
move go rav
move s
move down
move sw
move s
move s
move sw
move go bri
move up
move se
move se
move se
move se
move se
move sw
GoTo SOLNMarket

GuildTravelToGuild:
ECHO ***
ECHO * Will take you to %s
ECHO * Travel start in 3 seconds, hit ESC if you wish to cancel
ECHO ***
pause 3
GoTo GuildTravelTo%s

#***************** End Travel Between City ****************

#***************** Special Section ****************

SELFstunREMOVE:
ECHO ***
ECHO * Open the script in Notepad
ECHO * Fine the text #CPOREMOVE
ECHO * Delete everything between the two #CPOREMOVE's, including #CPOREMOVE
ECHO * You are done
ECHO * Save and close the script
ECHO ***
goto ExitGuildx

#***************** End Special Section ****************

Character:
#password
move go door
GoTo Trainer%c

nodoor:
goto Leechess
pause
ECHO *********************************************************
ECHO * You do not have your password intergrated
ECHO *
ECHO * Type GLDPASS for instructions on how to add your password to the script.
ECHO *
ECHO *********************************************************
match guildstartpassword GLDPASS
matchwait


guildstartpassword:
pause
ECHO # If you want to add your password just do the fallowing
ECHO # Open the script
ECHO # Find the label Jack: and replace Jack with your character  name.
ECHO # Follow the steps below
ECHO # For each action type into the script "put (action)" and on the next line type "wait"
ECHO # Replaceing the movements typed in for Jack
ECHO # Should look something like this
ECHO # Name:
ECHO # put kick door
ECHO # wait
ECHO # put slap door
ECHO # wait
ECHO # put knock door
ECHO # wait
ECHO # etc.
ECHO # At the end type in "move go door" than after that "GoTo Trainer%c"
ECHO # Should look like this
ECHO # move go door
ECHO # GoTo Trainer%c
ECHO # This will take you all the way up to the trainer.
ECHO # Look at the example below
ECHO #
ECHO # Usage would be .guildx travel # Name # (# needs to be put in a second time for rep check)
GoTo ExitGuildx

# ********************** END TRAVEL *************************

# ********************** CHARACTER PASS WORD EXAMPLE *************************

Jack:
put turn door
wait
put slap door
wait
put kick door
wait
put pull door
wait
put turn door
wait
put PusH door
move go door
GoTo Trainer%c

Leechess:
put lean door
waitfor You press
put kiss door
waitfor You kiss
put kiss door
waitfor You kiss
put kiss door
waitfor You kiss
put pull door
waitfor You pull
put turn door
waitfor You turn
put slap door
move go door
GoTo Trainer%c
# ********************** Guild Stamin Checker *********************************

Guild_Stamina:
ECHO ***
ECHO * Will Attempt to check your Stamina
put stamina
match Guild_Stamina_bad remaining: -
match Guild_Stamina_bad remaining: 14
match Guild_Stamina_bad remaining: 13
match Guild_Stamina_bad remaining: 12
match Guild_Stamina_bad remaining: 11
match Guild_Stamina_bad remaining: 10
match Guild_Stamina_bad remaining: 0
match Guild_Stamina_bad_check9 remaining: 9
match Guild_Stamina_bad_check8 remaining: 8
match Guild_Stamina_bad_check7 remaining: 7
match Guild_Stamina_bad_check6 remaining: 6
match Guild_Stamina_bad_check5 remaining: 5
match Guild_Stamina_bad_check4 remaining: 4
match Guild_Stamina_bad_check3 remaining: 3
match Guild_Stamina_bad_check2 remaining: 2
match Guild_Stamina_bad_check1 remaining: 1
match Guild_Stamina_good remaining: 
matchwait

Guild_Stamina_bad_check9:
	counter set 9
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check8:
	counter set 8
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check7:
	counter set 7
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check6:
	counter set 6
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check5:
	counter set 5
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check4:
	counter set 4
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check3:
	counter set 3
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check2:
	counter set 2
	GoTo Guild_Stamina_bad_check
Guild_Stamina_bad_check1:
	counter set 1
	GoTo Guild_Stamina_bad_check

Guild_Stamina_bad_check:
echo *** remaining: %c
pause
put stamina
match Guild_Stamina_good remaining: %c0
match Guild_Stamina_good remaining: %c9
match Guild_Stamina_good remaining: %c8
match Guild_Stamina_good remaining: %c7
match Guild_Stamina_good remaining: %c6
match Guild_Stamina_good remaining: %c5
match Guild_Stamina_good remaining: %c4
match Guild_Stamina_good remaining: %c3
match Guild_Stamina_good remaining: %c2
match Guild_Stamina_good remaining: %c1
match Guild_Stamina_bad remaining: 
matchwait

Guild_Stamina_good:
ECHO * Stamin is good, moving on
ECHO ***
GoTo Gld_Stam_%s

Guild_Stamina_bad:
ECHO * Stamin is bad, exiting script
ECHO ***
GoTo ExitGuildx

# ********************** END ALL *********************************

ExitGuildx:
exit

# ********************** LockMastery *********************************

guildstart70:
ECHO ***
ECHO * Lock Mastery Work
ECHO * 71 = Sense with masters
ECHO * 72 = Sense trap with master
ECHO * 73 = Sense lock with master
ECHO * 74 = Calipers with master
ECHO * 75 = Calibrate with master
ECHO * 76 = Make Wedges
ECHO * 77 = Contest with masters
ECHO * 78 = Appraise lockpicks
ECHO *
ECHO * Some of them require multiple variables
ECHO ***
GoTo ExitGuildx

LockMasteryDone:
ECHO ***
ECHO * Done
ECHO ***
GoTo ExitGuildx

guildstart71:
LockMasterySense:
put lm sense
match LockMasterySense1 pretty average lighting
match LockMasterySense2 quite dark
match LockMasterySense3 pretty average lighting
match LockMasterySense4 pretty average lighting
match LockMasterySense5 pretty average lighting
match LockMasteryDone You have completed your training task.
matchwait

LockMasterySense1:
save "pretty average lighting"
GoTo LockMasterySenseSay

LockMasterySense2:
save "quite dark"
GoTo LockMasterySenseSay

LockMasterySense3:
save "
GoTo LockMasterySenseSay

LockMasterySense4:
save "
GoTo LockMasterySenseSay

LockMasterySense5:
save "
GoTo LockMasterySenseSay

LockMasterySenseSay:
put '%s
match LockMasterySense repetitions remaining
match LockMasterySense repetition remaining
match LockMasterySense repetitions remaining
match LockMasterySense Try sensing again.
matchwait

guildstart72:
LockMasterySenseTrap:
pause
put lm sense
match LockMasterySenseTrap1 Fairly Simple
match LockMasterySenseTrap2 Somewhat Difficult
match LockMasterySenseTrap3 Moderately Difficult
match LockMasterySenseTrap5 Rudimentary
match LockMasterySenseTrap6 Very difficult
match LockMasterySenseTrap7 Extremely Difficult
match LockMasterySenseTrap8 Intricate
match LockMasterySenseTrap9 Very Basic
match LockMasterySenseTrap10 Very Complex
match LockMasterySenseTrap11 Incredibly Hard
match LockMasterySenseTrap12 Easy
match LockMasterySenseTrap13 Simple
match LockMasterySenseTrap4 Difficult
match LockMasterySenseTrap14 jack
matchwait

LockMasterySenseTrap1:
save "Fairly Simple"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap2:
save "Somewhat Difficult"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap3:
save "Moderately Difficult"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap4:
save "Difficult"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap5:
save "Rudimentary"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap6:
save "Very difficult"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap7:
save "Extremely Difficult"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap8:
save "Intricate"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap9:
save "Very Basic"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap10:
save "Very Complex
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap11:
save "Incredibly Hard"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap12:
save "Easy"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap13:
save "Simple"
GoTo LockMasterySenseTrapSay

LockMasterySenseTrap14:
save "
GoTo LockMasterySenseTrapSay


LockMasterySenseTrapSay:
put '%s
match LockMasterySenseTrap repetitions remaining
match LockMasterySenseTrap repetition remaining
match LockMasterySenseTrap repetitions remaining
match LockMasterySenseTrap Try sensing again.
match LockMasteryDone You have completed your training task.
matchwait


guildstart73:
LockMasterySenseLock:
pause
put lm sense
match LockMasterySenseLock1 a Primitive Lock
match LockMasterySenseLock2 a Rudimentary Lock
match LockMasterySenseLock3 an Extremely Easy Lock
match LockMasterySenseLock4 a Very Easy Lock
match LockMasterySenseLock5 an Easy Lock
match LockMasterySenseLock6 a Very Basic Lock
match LockMasterySenseLock7 a Fairly Easy Lock
match LockMasterySenseLock8 a Simple Lock
match LockMasterySenseLock9 a Fairly Simple Lock
match LockMasterySenseLock10 a Fairly Plain Lock
match LockMasterySenseLock11 a Moderately Well-Crafted Lock
match LockMasterySenseLock12 a Well-Crafted Lock
match LockMasterySenseLock13 a Tricky Lock
match LockMasterySenseLock14 a Somewhat Difficult Lock
match LockMasterySenseLock15 a Moderately Difficult Lock
match LockMasterySenseLock16 a Very Well-Crafted Lock
match LockMasterySenseLock17 a Difficult Lock
match LockMasterySenseLock18 an Extremely Well-Crafted Lock
match LockMasterySenseLock19 a Very Difficult Lock
match LockMasterySenseLock20 a Fairly Complicated Lock
match LockMasterySenseLock21 an Intricate Lock
match LockMasterySenseLock22 an Amazingly Well-Crafted Lock
match LockMasterySenseLock23 a Very Complex Lock
match LockMasterySenseLock24 an Impressively Complicated Lock
match LockMasterySenseLock25 an Amazingly Intricate Lock
match LockMasterySenseLock26 an Extremely Difficult Lock
match LockMasterySenseLock27 a Not defined Lock
match LockMasterySenseLock28 a Not defined Lock
match LockMasterySenseLock29 a Not defined Lock
match LockMasterySenseLock30 a Not defined Lock
matchwait

LockMasterySenseLock1:
save "Primitive"
GoTo LockMasterySenseLockSay

LockMasterySenseLock2:
save "Rudimentary"
GoTo LockMasterySenseLockSay

LockMasterySenseLock3:
save "Extremely Easy"
GoTo LockMasterySenseLockSay

LockMasterySenseLock4:
save "Very Easy"
GoTo LockMasterySenseLockSay

LockMasterySenseLock5:
save "Easy"
GoTo LockMasterySenseLockSay

LockMasterySenseLock6:
save "Very Basic"
GoTo LockMasterySenseLockSay

LockMasterySenseLock7:
save "Fairly Easy"
GoTo LockMasterySenseLockSay

LockMasterySenseLock8:
save "Simple"
GoTo LockMasterySenseLockSay

LockMasterySenseLock9:
save "Fairly Simple"
GoTo LockMasterySenseLockSay

LockMasterySenseLock10:
save "Fairly Plain"
GoTo LockMasterySenseLockSay

LockMasterySenseLock11:
save "Moderately Well-Crafted"
GoTo LockMasterySenseLockSay

LockMasterySenseLock12:
save "Well-Crafted"
GoTo LockMasterySenseLockSay

LockMasterySenseLock13:
save "Tricky"
GoTo LockMasterySenseLockSay

LockMasterySenseLock14:
save "Somewhat Difficult"
GoTo LockMasterySenseLockSay

LockMasterySenseLock15:
save "Moderately Difficult"
GoTo LockMasterySenseLockSay

LockMasterySenseLock16:
save "Very Well-Crafted"
GoTo LockMasterySenseLockSay

LockMasterySenseLock17:
save "Difficult"
GoTo LockMasterySenseLockSay

LockMasterySenseLock18:
save "Extremely Well-Crafted"
GoTo LockMasterySenseLockSay

LockMasterySenseLock19:
save "Very Difficult"
GoTo LockMasterySenseLockSay

LockMasterySenseLock20:
save "Fairly Complicated"
GoTo LockMasterySenseLockSay

LockMasterySenseLock21:
save "Intricate"
GoTo LockMasterySenseLockSay

LockMasterySenseLock22:
save "Amazingly Well-Crafted"
GoTo LockMasterySenseLockSay

LockMasterySenseLock23:
save "Very Complex"
GoTo LockMasterySenseLockSay

LockMasterySenseLock24:
save "Impressively Complicated"
GoTo LockMasterySenseLockSay

LockMasterySenseLock25:
save "Amazingly Intricate"
GoTo LockMasterySenseLockSay

LockMasterySenseLock26:
save "Extremely Difficult"
GoTo LockMasterySenseLockSay

LockMasterySenseLock27:
save "Not Yet Defined"
GoTo LockMasterySenseLockSay

LockMasterySenseLock28:
save "Not Yet Defined"
GoTo LockMasterySenseLockSay

LockMasterySenseLock29:
save "Not Yet Defined"
GoTo LockMasterySenseLockSay

LockMasterySenseLock30:
save "Not Yet Defined"
GoTo LockMasterySenseLockSay

LockMasterySenseLockSay:
pause
put '%s
match LockMasterySenseLock repetitions remaining
match LockMasterySenseLock repetition remaining
match LockMasterySenseLock repetitions remaining
match LockMasterySenseLock Try sensing again.
match LockMasterySenseLock try to sense again.
match LockMasterySenseLock Sorry...try again.
match LockMasterySenseLock I don't think that's what ya really sensed,
match LockMasteryDone You have completed your training task.
matchwait


guildstart74:
LockMasteryCalipers:
pause
put lm measure %3
match LockMasteryCalipers1 a Primitive Lock
match LockMasteryCalipers2 a Rudimentary Lock
match LockMasteryCalipers3 an Extremely Easy Lock
match LockMasteryCalipers4 a Very Easy Lock
match LockMasteryCalipers5 an Easy Lock
match LockMasteryCalipers6 a Very Basic Lock
match LockMasteryCalipers7 a Fairly Easy Lock
match LockMasteryCalipers8 a Simple Lock
match LockMasteryCalipers9 a Fairly Simple Lock
match LockMasteryCalipers10 a Fairly Plain Lock
match LockMasteryCalipers11 a Moderately Well-Crafted Lock
match LockMasteryCalipers12 a Well-Crafted Lock
match LockMasteryCalipers13 a Tricky Lock
match LockMasteryCalipers14 a Somewhat Difficult Lock
match LockMasteryCalipers15 a Moderately Difficult Lock
match LockMasteryCalipers16 a Very Well-Crafted Lock
match LockMasteryCalipers17 a Difficult Lock
match LockMasteryCalipers18 an Extremely Well-Crafted Lock
match LockMasteryCalipers19 a Very Difficult Lock
match LockMasteryCalipers20 a Fairly Complicated Lock
match LockMasteryCalipers21 an Intricate Lock
match LockMasteryCalipers22 an Amazingly Well-Crafted Lock
match LockMasteryCalipers23 a Very Complex Lock
match LockMasteryCalipers24 an Impressively Complicated Lock
match LockMasteryCalipers25 an Amazingly Intricate Lock
match LockMasteryCalipers26 an Extremely Difficult Lock
match LockMasteryCalipers27 a Not defined Lock
match LockMasteryCalipers28 a Not defined Lock
match LockMasteryCalipers29 a Not defined Lock
match LockMasteryCalipers30 a Not defined Lock
matchwait

LockMasteryCalipers1:
save "Primitive"
GoTo LockMasteryCalipersSay

LockMasteryCalipers2:
save "Rudimentary"
GoTo LockMasteryCalipersSay

LockMasteryCalipers3:
save "Extremely Easy"
GoTo LockMasteryCalipersSay

LockMasteryCalipers4:
save "Very Easy"
GoTo LockMasteryCalipersSay

LockMasteryCalipers5:
save "Easy"
GoTo LockMasteryCalipersSay

LockMasteryCalipers6:
save "Very Basic"
GoTo LockMasteryCalipersSay

LockMasteryCalipers7:
save "Fairly Easy"
GoTo LockMasteryCalipersSay

LockMasteryCalipers8:
save "Simple"
GoTo LockMasteryCalipersSay

LockMasteryCalipers9:
save "Fairly Simple"
GoTo LockMasteryCalipersSay

LockMasteryCalipers10:
save "Fairly Plain"
GoTo LockMasteryCalipersSay

LockMasteryCalipers11:
save "Moderately Well-Crafted"
GoTo LockMasteryCalipersSay

LockMasteryCalipers12:
save "Well-Crafted"
GoTo LockMasteryCalipersSay

LockMasteryCalipers13:
save "Tricky"
GoTo LockMasteryCalipersSay

LockMasteryCalipers14:
save "Somewhat Difficult"
GoTo LockMasteryCalipersSay

LockMasteryCalipers15:
save "Moderately Difficult"
GoTo LockMasteryCalipersSay

LockMasteryCalipers16:
save "Very Well-Crafted"
GoTo LockMasteryCalipersSay

LockMasteryCalipers17:
save "Difficult"
GoTo LockMasteryCalipersSay

LockMasteryCalipers18:
save "Extremely Well-Crafted"
GoTo LockMasteryCalipersSay

LockMasteryCalipers19:
save "Very Difficult"
GoTo LockMasteryCalipersSay

LockMasteryCalipers20:
save "Fairly Complicated"
GoTo LockMasteryCalipersSay

LockMasteryCalipers21:
save "Intricate"
GoTo LockMasteryCalipersSay

LockMasteryCalipers22:
save "Amazingly Well-Crafted"
GoTo LockMasteryCalipersSay

LockMasteryCalipers23:
save "Very Complex"
GoTo LockMasteryCalipersSay

LockMasteryCalipers24:
save "Impressively Complicated"
GoTo LockMasteryCalipersSay

LockMasteryCalipers25:
save "Amazingly Intricate"
GoTo LockMasteryCalipersSay

LockMasteryCalipers26:
save "Extremely Difficult"
GoTo LockMasteryCalipersSay

LockMasteryCalipers27:
save "Not Yet Defined"
GoTo LockMasteryCalipersSay

LockMasteryCalipers28:
save "Not Yet Defined"
GoTo LockMasteryCalipersSay

LockMasteryCalipers29:
save "Not Yet Defined"
GoTo LockMasteryCalipersSay

LockMasteryCalipers30:
save "Not Yet Defined"
GoTo LockMasteryCalipersSay

LockMasteryCalipersSay:
pause 1
put '%s
match LockMasteryCalipersRep1 1 repetition remaining.
match LockMasteryCalipersRep2 2 repetitions remaining.
match LockMasteryCalipersRep3 3 repetitions remaining.
match LockMasteryCalipersRep4 4 repetitions remaining.
match LockMasteryCalipersRep5 5 repetitions remaining.
match LockMasteryCalipersRep6 6 repetitions remaining.
match LockMasteryCalipersRep7 7 repetitions remaining.
match LockMasteryCalipersRep8 8 repetitions remaining.
match LockMasteryCalipersRep9 9 repetitions remaining.
match LockMasteryCalipers Give it another shot
match LockMasteryCalipers Try again.
match LockMasteryCalipers try to sense again.
match LockMasteryCalipers Sorry...try again.
match LockMasteryCalipers I don't think that's what ya really
match LockMasteryCalipersRepDone You have completed your training task.
matchwait

LockMasteryCalipersRepDone:
pause
put 'Wooozah!
pause
GoTo LockMasteryDone

LockMasteryCalipersRep1:
pause
put "Hooot! Only 1 to go
GoTo LockMasteryCalipers

LockMasteryCalipersRep2:
pause
put "…
GoTo LockMasteryCalipers

LockMasteryCalipersRep3:
pause
put "That was an easy one.
GoTo LockMasteryCalipers

LockMasteryCalipersRep4:
pause
put "I'm gaining, Think I can do it?
GoTo LockMasteryCalipers

LockMasteryCalipersRep5:
pause
put "Bah, you are no fun.
GoTo LockMasteryCalipers

LockMasteryCalipersRep6:
pause
put "I give you this here gold lockpick if you make this the last rep.
GoTo LockMasteryCalipers

LockMasteryCalipersRep7:
pause
put "Holy moly you gave me a lot of reps this time!
GoTo LockMasteryCalipers

LockMasteryCalipersRep8:
pause
put "Heh, you are kidding me right? 8!!!?
GoTo LockMasteryCalipers

LockMasteryCalipersRep9:
pause
put "Who the hell do I have to kill to get less reps?
GoTo LockMasteryCalipers


# **** Rank um 10 an stuff, yeeehaw! ***

#(Take the calipers from the table and LMASTER CALIBRATE
#them once to attune them to you.  
#LMASTER MEASURE box, pick the lock, then LMASTER CALIBRATE the calipers to refine their tuning.
#When you can calibrate the calipers no further, which may require picking the box several times, return them to Houlihan.)


guildstart75:
put look
GoTo LMCalibrateMaster

LockMasteryCalibrate:
match LockMasteryCalibrateGet Take the calipers from the table
match LockMasteryCalibrateGet "How 'bout you concentrate on yer trainin'?"
matchwait

LockMasteryCalibrateGet:
LMCalibrateGet:
put get calipers from table
match LMCalibrateCalibrate You remove a set
match LMCalibrateCheck Get what?
matchwait

LMCalibrateGet2:
put get calipers from table
match LMCalibrateCalibrate You remove a set
match LMCalibrateCheck Get what?
matchwait

LMCalibrateGet3:
put get calipers from table
match LMCalibrateMeasure You remove a set
match LMCalibrateCheck Get what?
matchwait

LMCalibrateCheck:
pause 2
put glance
match LMCalibrateCalipers worn calipers
match LMCalibrateError empty hands
matchwait

LMCalibrateCalibrate:
pause
put lmaster calibrate my calipers
match LMCalibrateMeasure You begin attuning the calipers to your personal needs,
#match LMCalibrateMeasure You're good, but you're not that good.
match LMCalibrateHand You're good, but you're not that good.
match LMCalibrateAssess2 You make some effort to fine-tune the worn calipers.
#match LMCalibrateHand You make some effort to fine-tune the worn calipers.
matchwait

LMCalibrateAssess:
pause
put assess my calipers
match LMCalibrateMeasure The worn calipers appear
matchwait

LMCalibrateMeasure2:
pause 
put put calipers on table
match LMCalibrateGet3 calmly reaches over and relocks
match LMCalibrateMeasure2 ...wait
matchwait

LMCalibrateMeasure:
pause
put lmaster measure box on table
match LMCalibratePut you carefully begin to measure the lock...
matchwait

LMCalibratePut:
pause
put put my calipers on table
match LMCalibratePickGet You place your
match LMCalibratePickGet You put a
matchwait

LMCalibratePickGet:
pause
put get lockpick from table
match LMCalibratePickBox You remove
match LMCalibratePickBox Get what?
matchwait

LMCalibratePickBox:
pause
put pick box on table with my lockpick
match LMCalibratePickBox You make a fumbling attempt (d100=1).
match LMCalibratePickBox calmly reaches over and relocks
match LMCalibratePickPut Then...CLICK!  It opens!
matchwait

LMCalibratePickPut:
pause 2
put put lockpick on table
match LMCalibrateGet2 You place
match LMCalibrateGet2 You put
matchwait

LMCalibrateAssess2:
pause
#put asses my calipers
#GoTo LMCalibrateAssess3
#LMCalibrateAssess3:
#pause
put asses my calipers
match LMCalibrateHand The worn calipers appear to be in incredible condition.
match LMCalibrateHand The worn calipers appear to be in superb condition
match LMCalibrateHand The worn calipers appear to be in excellent condition.
#match LMCalibrateHand The worn calipers appear to be in very good condition.
#match LMCalibrateHand The worn calipers appear to be in fine condition
#match LMCalibrateHand The worn calipers appear to be in mediocre condition
#match LMCalibrateHand The worn calipers appear to be in 
match LMCalibrateMeasure2 The worn calipers appear to be in
match LMCalibrateAssess3 ...wait
matchwait

LMCalibrateHand:
pause 2
put give calipers to %s
match LMCalibrateGet repetitions remaining
match LMCalibrateGet repetition remaining
match LMCalibrateGet repetitions remaining
match LMCalibrateGet3 Give it another shot
matchwait

LMCalibrateError:
ECHO ***
ECHO * Error with script
ECHO ***
GoTo ExitGuildx:

LMCalibrateMaster:
MasterroomLMCalibrate:
match LMCalibrateogdin Master Footpad Ogdin
match LMCalibratevarant Master Footpad Varant
match LMCalibratetriaholly Master Footpad Triaholly
match LMCalibratesneck Master Footpad Sneck
match LMCalibrateogdin Master Footpad Ogdin
match LMCalibratevarant Master Footpad Varant
match LMCalibratetriaholly Master Footpad Triaholly
match LMCalibratesneck Master Footpad Sneck
match LMCalibratejimik Master Footpad Jimik
match LMCalibratefaldes Master Footpad Faldes
match LMCalibrateherit Master Footpad Herit
match LMCalibrategludac Master Footpad Gludac
match LMCalibratelagick Master Footpad Lagick
match LMCalibratezardak Master Footpad Zardak
match LMCalibratemiller Miller
match LMCalibratemurphy Murphy
match LMCalibrateo'toole O'Toole
match LMCalibratereilly Reilly
match LMCalibratebean Bean
match LMCalibratehoulihan Houlihan
match LMCalibrateharith Master Footpad Harith
match LMCalibratejafar Master Footpad Jafar
match LMCalibratemubarak Master Footpad Mubarak
match LMCalibrateselima Master Footpad Selima
match LMCalibrateritchie Master Footpad Ritchie
match LMCalibratepurkhiser Master Footpad Purkhiser
match LMCalibratecolvin Master Footpad Colvin
match LMCalibratevigil Master Footpad Vigil
matchwait

LMCalibratevarant:
save Varant
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratetriaholly:
save Triaholly
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratesneck:
save Sneck
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateogdin:
save Ogdin
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratezardak:
save Zardak
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratelagick:
save Lagick
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrategludac:
save Gludac
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateherit:
save Herit
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratefaldes:
save Faldes
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratejimik:
save Jimik
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratemiller:
save Miller
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratemurphy:
save Murphy
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratebean:
save Bean
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateo'toole:
save O'toole
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateReilly:
save Reilly
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateHoulihan:
save Houlihan
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateharith:
save Harith
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratejafar:
save Jafar
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratemubarak:
save Mubarak
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibrateselima:
save Selima
put ask %s about train in lock
GoTo LockMasteryCalibrate

#*** Illistim LMCalibrate Masters ***

LMCalibrateritchie:
save Ritchie
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratepurkhiser:
save Purkhiser
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratecolvin:
save Colvin
put ask %s about train in lock
GoTo LockMasteryCalibrate

LMCalibratevigil:
save Vigil
put ask %s about train in lock
GoTo LockMasteryCalibrate



guildstart76:
guildstartwedge:
ECHO *** LM Wedge Making
IF_2 GoTo LMWedgeStartTown%1
GoTo LMWedgeSyntax

LMWedgeSyntax:
ECHO *** 
ECHO * Need 2 variables
ECHO ***
exit

LMWedgeStartTown2:
LMWedgeStartTown3:
LMWedgeStartTown4:
LMWedgeStartTown5:
LMWedgeStartTown6:
LMWedgeStartTown7:
put look
match LMWedgeTools Rows of cluttered toolbenches
match LMWedgeTools a workshop attendant
match LMWedgeStartFirst [Rogue Guild, Workshop Toolbench]
matchwait


LMWedgeStartTown1:
put look
match LMWedgeTools Rows of cluttered toolbenches
match LMWedgeTools a workshop attendant
match LMWedgeDeLuca Training Administrator DeLuca
match LMWedgeStartFirst [Rogue Guild, Workshop Toolbench]
matchwait

LMWedgeDeLuca:
move s
move go door
move w
move w
move climb stair
move s
LMWedgeTools:
put go toolbench
GoTo LMWedgeStartFirst

LMWedgeStartFirst:
ECHO *** Creating Wedges
IF_3 counter set %3
IF_3 ECHO *** Will create %c wedges
IF_3 counter add -1
IF_6 ECHO *** Will stop only when a %6 or %5 or %4 wedge is created
IF_6 goto LMWedgeStart
IF_5 ECHO *** Will stop only when a %5 or %4 wedge is created
IF_5 goto LMWedgeStart
IF_4 ECHO *** Will stop only when a %4 wedge is created
IF_4 goto LMWedgeStart

LMWedgeStart:
pause
put order 1
IF_4 counter add 1
IF_4 ECHO *** %c Wedge's left to make
IF_4 counter add -1
waitfor You can BUY
put buy
waitfor attendant hands you 
LMWedgeCarve:
pause
put carve my block
match LMWedgeCarve but is nowhere near done
match LMWedgeCarve Keep it up!
match LMWedgeCarveWedge You can't carve that!
match LMWedgeCarve ...wait
matchwait

LMWedgeCarveWedge:
pause
put carve my wedge
match LMWedgeCarveWedge need some more carving
match LMWedgeCarveWedge A little more should do it
match LMWedgeRub You should RUB the wedge now.
match LMWedgeCarveWedge ...wait
matchwait

LMWedgeRub:
pause
put rub my wedge
IF_7 match LMWedgeStartX Your %7 wooden wedge is ready for use!
IF_6 match LMWedgeStartX Your %6 wooden wedge is ready for use!
IF_5 match LMWedgeStartX Your %5 wooden wedge is ready for use!
IF_4 match LMWedgeStartX Your %4 wooden wedge is ready for use!
match LMWedgeEnd Your solid wooden wedge is ready for use!
match LMWedgeEnd Your warped wooden wedge is ready for use!
match LMWedgeEnd wedge is ready for use!
match LMWedgeEnd You rub a solid wooden wedge.
match LMWedgeRub ...wait
matchwait

LMWedgeEnd:
pause
put put my wedge in my pack
match LMWedgeEnd ...wait
IF_4 match LMWedgeStart You put
IF_3 match LMWedgeStart%c You put
match LMWedgeStart0 You put
matchwait

LMWedgeStartX:
pause
put put my wedge in my pack
match LMWedgeStartX ...wait
match LMWedgeStart%c You put
matchwait

LMWedgeStart0:
ECHO ***
ECHO * Done creating wedge
ECHO ***
GoTo ExitGuildx

LMWedgeStart20:
LMWedgeStart19:
LMWedgeStart18:
LMWedgeStart17:
LMWedgeStart16:
LMWedgeStart15:
LMWedgeStart14:
LMWedgeStart13:
LMWedgeStart12:
LMWedgeStart11:
LMWedgeStart10:
LMWedgeStart9:
LMWedgeStart8:
LMWedgeStart7:
LMWedgeStart6:
LMWedgeStart5:
LMWedgeStart4:
LMWedgeStart3:
LMWedgeStart2:
LMWedgeStart1:
IF_4 ECHO * Created one of the desired Wedges
ECHO *** %c Wedge's left to make
counter add -1
pause
GoTo LMWedgeStart


#------

guildstart77:
guildstartpick:
IF_2 ECHO *** Working on LockMastery Contest Reps
IF_2 GoTo LMPickStart%1
GoTo LMPickSyntax

LMPickSyntax:
ECHO *** 
ECHO * Need 2 variables
ECHO * .guildx #1 #2
ECHO * #1 = Town #
ECHO * #2 = 77 for lockpicking with master speed stuff
ECHO * <box> = type of box on table
ECHO ***
exit

LMPickStart1:
# Add the master stuff here
# For now start from within the master room
IF_4 GoTo LMPickStart1x
ECHO *** Waiting to start
GoTo LMPickStart2

LMPickStart1x:
match LMPickStart2 As an apprentice goes about setting
match LMPickStart2 You glance down
matchwait


LMPickStart2:
IF_4 pause
IF_4 put nod %3
match LMPickStartNew Allright, it's on!
match LMPickStartNew You glance down
matchwait

LMPickStartNew:
counter set 1
IF_5 counter set %5
GoTo LMPickContainer%c

LMPickContainer1:
save first
GoTo LMPickContainerDisarm

LMPickContainer2:
save second
GoTo LMPickContainerDisarm

LMPickContainer3:
save third
GoTo LMPickContainerDisarm

LMPickContainer4:
save fourth
GoTo LMPickContainerDisarm

LMPickContainer5:
save fifth
GoTo LMPickContainerDisarm

LMPickContainer0:
LMPickContainer6:
ECHO ** Should be done
IF_3 GoTo LMPickContainerRestart
GoTo ExitGuildx

LMPickContainerRestart:
ECHO ** Waiting for Master to Finish.
#match LMPickStartRestart Game's over!
match LMPickStartRestart repetitions remaining.
match LMPickStartRestart repetition remaining.
match LMPickStartRestart Mana Points:
match LMPickEnd You have completed your training task.
matchwait

LMPickEnd:
put out
GoTo ExitGuildx

LMPickStartRestart:
pause
put ask %3 about lock train
GoTo LMPickStart1

LMPickContainerDisarmWait:
pause
GoTo LMPickContainerDisarm

LMPickContainerDisarm5:
ECHO *** Lock: 400-435 Moderately Well-Crafted
ECHO *** Should use a Ora Lockpick
pause
GoTo LMPickContainerDisarmTwo

LMPickContainerDisarm6:
ECHO *** 
GoTo LMPickContainerDisarmTwo

LMPickContainerDisarm:
put disarm %s box
match LMPickContainerDisarm It looks like

#match LMPickContainerDisarm1 Rudimentary
#match LMPickContainerDisarm2 Very Basic
#match LMPickContainerDisarm3 Easy
#match LMPickContainerDisarm4 Simple
match LMPickContainerDisarm5 Fairly Simple
#match LMPickContainerDisarm6 Somewhat Difficult
#match LMPickContainerDisarm7 Moderately Difficult
#match LMPickContainerDisarm8 Difficult
#match LMPickContainerDisarm9 Very difficult
#match LMPickContainerDisarm10 Extremely Difficult
#match LMPickContainerDisarm11 Intricate
#match LMPickContainerDisarm12 Very Complex
#match LMPickContainerDisarm13 Incredibly Hard
#match LMPickContainerDisarm14 Amazingly Difficult

match LMPickContainerPick You discover no traps
match LMPickContainerDisarm The darn thing is built too tightly
match LMPickContainerDisarm not able to DisarM the
match LMPickContainerDisarmWait ..wait
match LMPickContainerPickTrap Reaching inside the hole with the tip of your lockpick,
match LMPickContainerPickTrap but parts of the mechanism have been ground
match LMPickContainerPickTrap tiny hammer device which has been bent from striking range of the vial.
match LMPickContainerPickTrap The lock appears to be free of all obstructions.
match LMPickContainerPickTrap been completely plugged.
match LMPickContainerPickTrap but some of the markings have been altered
match LMPickContainerPickTrap With great care you nudge the
match LMPickContainerPickTrap With a little ingenuity
match LMPickContainerPickTrap With a little force applied
match LMPickContainerPickTrap You carefully use
match LMPickContainerPickTrap You carefully push
match LMPickContainerPickTrap You manage to
match LMPickContainerPickTrap Using the end of a twig you
match LMPickContainerPickTrap Using the metal grips
match LMPickContainerPickTrap Using a bit of putty from
match LMPickContainerPickTrap Knowing how delicate magical glyphs can be
match LMPickContainerPickTrap Taking a lump of putty
match LMPickContainerPickTrap A small section of the casing has been scraped clean of the strange substance.
match LMPickContainerPickTrap you notice a pair of small metal rods that have been bent
matchwait

LMPickContainerDisarmTwo:
put disarm %s box
match LMPickContainerPick You discover no traps
match LMPickContainerDisarm The darn thing is built too tightly
match LMPickContainerDisarm not able to DisarM the
match LMPickContainerDisarmWait ..wait
match LMPickContainerPickTrap Reaching inside the hole with the tip of your lockpick,
match LMPickContainerPickTrap but parts of the mechanism have been ground
match LMPickContainerPickTrap tiny hammer device which has been bent from striking range of the vial.
match LMPickContainerPickTrap The lock appears to be free of all obstructions.
match LMPickContainerPickTrap been completely plugged.
match LMPickContainerPickTrap but some of the markings have been altered
match LMPickContainerPickTrap With great care you nudge the
match LMPickContainerPickTrap With a little ingenuity
match LMPickContainerPickTrap With a little force applied
match LMPickContainerPickTrap You carefully use
match LMPickContainerPickTrap You carefully push
match LMPickContainerPickTrap You manage to
match LMPickContainerPickTrap Using the end of a twig you
match LMPickContainerPickTrap Using the metal grips
match LMPickContainerPickTrap Using a bit of putty from
match LMPickContainerPickTrap Knowing how delicate magical glyphs can be
match LMPickContainerPickTrap Taking a lump of putty
match LMPickContainerPickTrap A small section of the casing has been scraped clean of the strange substance.
match LMPickContainerPickTrap you notice a pair of small metal rods that have been bent
matchwait

LMPickContainerPickx:
pause
GoTo LMPickContainerPick

LMPickContainerPickTrap:
ECHO *** Pausing 2 seconds for you to get appropriate lockpick
ECHO *** Will auto get a Rolaren lockpick if you don't get one.
pause 2
GoTo LMPickContainerPick


LMPickContainerPick:
put glance
match LMPickContainerPickGet You glance down at your empty hands.
match LMPickContainerPick1 lockpick in your
matchwait

LMPickContainerPickGet:
put get rolaren lockpick
match LMPickContainerPickx ..wait
match LMPickContainerPick1 You remove
match LMPickContainerPick1 You already
matchwait

LMPickContainerPick1x:
pause
GoTo LMPickContainerPick1

LMPickContainerPick1:
put pick %s box with my lockpick
match LMPickContainerEnd difficulty ranking).  Then...CLICK!
match LMPickContainerPick2y but end up bending the tip!
match LMPickContainerPick2y weakened by the stress.
match LMPickContainerPick1x ...wait
match LMPickContainerPick1 you get a sense that 
match LMPickContainerPick2y but you get a feeling that it is within your abilities
match LMPickContainerPick2y and learn little about it.

match LMPickContainerPick2y been weakened by the stress
match LMPickContainerPick2y You make a fumbling attempt
match LMPickContainerPick2y * SNAP *  Crud!
match LMPickContainerPick2y before you realize you are using a broken lockpick.
match LMPickContainerEnd is actually already unlocked.
match LMPickContainerEnd It does not appear to be locked.
match LMPickContainerEnd Um, but it's open.
match LMPickContainerEnd could not find
match LMPickContainerEnd But you are not holding
matchwait

LMPickContainerPick2x:
pause
GoTo LMPickContainerPick2y

LMPickContainerPick2y:
put put my rolaren lockpick on table
match LMPickContainerPick2y ..wait
match LMPickContainerPick2yb You put
match LMPickContainerPick2yb could not find
matchwait

LMPickContainerPick2yb:
put glance
match LMPickContainerPick2Get You glance down at your empty hands.
match LMPickContainerPick2y a rolaren lockpick in your
match LMPickContainerPick2 lockpick in your
matchwait

LMPickContainerPick2Get:
put get golvern lockpick
match LMPickContainerPick2x ..wait
match LMPickContainerPick2 You remove
match LMPickContainerPick2 You already
matchwait

LMPickContainerPick2pause:
pause
GoTo LMPickContainerPick2

LMPickContainerPick2:
put pick %s box with my lockpick
match LMPickContainerEnd difficulty ranking).  Then...CLICK!
match LMPickContainerPick3y but end up bending the tip!
match LMPickContainerPick3y weakened by the stress.
match LMPickContainerPick2pause ...wait
match LMPickContainerPick2 you get a sense that
match LMPickContainerPick3y but you get a feeling that it is within your abilities
match LMPickContainerPick3y and learn little about it.

match LMPickContainerPick3y been weakened by the stress
match LMPickContainerPick3y You make a fumbling attempt
match LMPickContainerPick3y * SNAP *  Crud!
match LMPickContainerPick3y before you realize you are using a broken lockpick.
match LMPickContainerEnd is actually already unlocked.
match LMPickContainerEnd It does not appear to be locked.
match LMPickContainerEnd Um, but it's open.
match LMPickContainerEnd could not find
match LMPickContainerEnd But you are not holding
matchwait

LMPickContainerPick3x:
pause
GoTo LMPickContainerPick3y

LMPickContainerPick3y:
put put my golvern lockpick on table
match LMPickContainerPick3y ..wait
match LMPickContainerPick3yb You put
match LMPickContainerPick3yb could not find
matchwait

LMPickContainerPick3yb:
put glance
match LMPickContainerPick3Get You glance down at your empty hands.
match LMPickContainerPick3y a golvern lockpick in your
match LMPickContainerPick3 lockpick in your
matchwait

LMPickContainerPick3Get:
put get vaalin lockpick
match LMPickContainerPick3x ..wait
match LMPickContainerPick3 You remove
match LMPickContainerPick3 You already
matchwait

LMPickContainerPick3pause:
pause
GoTo LMPickContainerPick3

LMPickContainerPick3:
put pick %s box with my lockpick
match LMPickContainerEnd difficulty ranking).  Then...CLICK!
match LMPickContainerPick3 but end up bending the tip!
match LMPickContainerPick3 weakened by the stress.
match LMPickContainerPick3pause ...wait
match LMPickContainerPick3 you get a sense that
match LMPickContainerPick3 but you get a feeling that it is within your abilities
match LMPickContainerPick3 and learn little about it.
match LMPickContainerPick3 been weakened by the stress
match LMPickContainerPick3 You make a fumbling attempt
match LMPickContainerPick3 * SNAP *  Crud!
match LMPickContainerPick3y before you realize you are using a broken lockpick.
match LMPickContainerEnd is actually already unlocked.
match LMPickContainerEnd It does not appear to be locked.
match LMPickContainerEnd Um, but it's open.
match LMPickContainerEnd could not find
match LMPickContainerEnd But you are not holding
matchwait

LMPickContainerEndx:
pause
GoTo LMPickContainerEnd

LMPickContainerEnd:
put put my lockpick on table
match LMPickContainerEndx ...wait
match LMPickContainerEndFin You put a
match LMPickContainerEndFin could not find
matchwait

LMPickContainerEndFin:
counter add 1
GoTo LMPickContainer%c


#----

guildstart78:
guildstartappraise:
IF_3 ECHO *** Working on LockMastery Appraise Lockpick Reps
IF_3 GoTo LMAppraiseStart%1
GoTo LMAppraiseSyntax

LMAppraiseSyntax:
ECHO ***
ECHO * 3 variables
ECHO * 1 # city
ECHO * 2 # 78
ECHO * 3 Name - Master
ECHO ***
GoTo ExitGuildx

LMAppraiseStart1:
LMAppraiseStart:
save LockpickInfo- 
counter set 1
#IF_4 counter add 1
GoTo LMAppraiseGet%c

LMAppraiseGet1:
put get first lockpick from table
match LMAppraiseAppraise You remove
match LMAppraiseDone could not find
matchwait

LMAppraiseGet2:
put get second lockpick from table
match LMAppraiseAppraise You remove
match LMAppraiseDone could not find
matchwait

LMAppraiseGet3:
put get third lockpick from table
match LMAppraiseAppraise You remove
match LMAppraiseDone could not find
matchwait

LMAppraiseGet4:
put get fourth lockpick from table
match LMAppraiseAppraise You remove
match LMAppraiseDone could not find
matchwait

LMAppraiseGet5:
put get fifth lockpick from table
match LMAppraiseAppraise You remove
match LMAppraiseDone could not find
matchwait

LMAppraiseGet6:
LMAppraiseDone:
ECHO ***
ECHO %s
ECHO * One Two Three Four or Five
pause
ECHO * Choose the best lockpick
match LMAppraiseFinal5 One
match LMAppraiseFinal4 Two
match LMAppraiseFinal3 Three
match LMAppraiseFinal2 Four
match LMAppraiseFinal1 Five
matchwait

LMAppraiseFinal1:
put get first lockpick from table
GoTo LMAppraiseGive

LMAppraiseFinal2:
put get second lockpick from table
GoTo LMAppraiseGive

LMAppraiseFinal3:
put get third lockpick from table
GoTo LMAppraiseGive

LMAppraiseFinal4:
put get fourth lockpick from table
GoTo LMAppraiseGive

LMAppraiseFinal5:
put get fifth lockpick from table
GoTo LMAppraiseGive

LMAppraiseGiveWait:
pause
GoTo LMAppraiseGive

LMAppraiseGive:
put give my lockpick to %3
match LMAppraiseGivewait ...wait
match LMAppraiseStart Mana Points:
match LMAppraiseStart Try one more.
match LMAppraiseStart removes the previous set of lockpicks from the table
match LMAppraiseStart You didn't even appraise it.
match LMAppraiseStart repetitions remaining.
match LMAppraiseStart repetition remaining.
match LMAppraiseEnd You have completed your training task.
match LMAppraiseStart Something else
matchwait

LMAppraiseEnd:
ECHO *** Done
move out
GoTo ExitGuildx


LMAppraiseGet:
put get %s lockpick from table
match LMAppraiseAppraise You remove
match LMAppraiseDone could not find
matchwait

LMAppraiseAppraise:
put lm appraise my lockpick
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraiseGood It appears to be in good condition.
match LMAppraiseDamaged It appears to be noticeably damaged.
match LMAppraiseNeglected It appears to be in a neglected state.
match LMAppraisePoor It appears to be in poor condition.
match LMAppraiseMiserable It appears to be in miserable condition.
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraiseExcellent It appears to be in excellent condition.
match LMAppraisePut It appears to be broken.
match LMAppraiseNoMatch Roundtime:
matchwait

LMAppraiseNoMatch:
pause
ECHO ***
ECHO * Condition not matched
ECHO * Add condition and hit MANA to re-appraise
ECHO ***
waitfor Mana Points:
GoTo LMAppraiseAppraise

LMAppraiseMiserable:
save %s-->%c=Miserable
GoTo LMAppraisePut

LMAppraisePoor:
save %s-->%c=Poor
GoTo LMAppraisePut

LMAppraiseNeglected:
save %s-->%c=Neglected
GoTo LMAppraisePut

LMAppraiseDamaged:
save %s-->%c=Damaged
GoTo LMAppraisePut

LMAppraiseGood:
save %s-->%c=Good
GoTo LMAppraisePut

LMAppraiseExcellent:
save %s-->%c=Excellent
GoTo LMAppraisePut

LMAppraisePut:
IF_4 GoTo LMAppraiseGive
put put my lockpick on table
match LMAppraisePutWait ...wait
match LMAppraiseNext You place your
matchwait

LMAppraisePutWait:
pause
GoTo LMAppraisePut

LMAppraiseNext:
pause
counter add 1
GoTo LMAppraiseGet%c


#----

guildstart79:
guildstartrepair:
ECHO *** Working on LockMastery Repair Lockpick Reps
IF_3 GoTo LMRepairStart
GoTo LMRepairSyntax

LMRepairStart:
IF_8 GoTo LMRepairGive
IF_7 counter set %7
IF_7 ECHO *** Will repair %c lockpicks
put glance
match LMRepairStep1 lockpick
match LMRepairGet empty hands
match LMRepairGet left
match LMRepairGet right
matchwait

LMRepairGive:
pause
put get my lockpick from my %4
match LMRepairGive2 You remove
matchwait

LMRepairGive2:
pause
put give my lockpick to %3
match LMRepariGive3 repetitions remaining.
match LMRepariGive3 repetition remaining.
match LMRepariGiveDone completed
matchwait

LMRepariGive3:
pause
put put my lockpick in my %5
match LMRepairGive You put
matchwait

LMRepariGiveDone:
ECHO *** Done
GoTo ExitGuildx

LMRepairGet10:
LMRepairGet9:
LMRepairGet8:
LMRepairGet7:
LMRepairGet6:
LMRepairGet5:
LMRepairGet4:
LMRepairGet3:
LMRepairGet2:
LMRepairGet1:
LMRepairGet:
put get lockpick from %3
match LMRepairStep1 You remove
match LMRepairNoLockpick could not find
matchwait

LMRepairGet0:
ECHO *** Finished
GoTo ExitGuildx

LMRepairStep1:
put lm repair my lockpick
match LMRepairNotBroken pretty good condition already.
match LMRepairMore You carefully go about reshaping
match LMRepairSkill out of your league yet.
match LMRepairBroken is completely broken
match LMRepairStep1Pause ...wait
matchwait

LMRepairBroken:
pause
ECHO *** Completely broken, not dealing with that right now
put put my lockpick in my %6
match LMRepairGet You put
matchwait

LMRepairSkill:
pause
ECHO *** This lockpick is over your skill level
put put my lockpick in my %6
match LMRepairGet You put
matchwait

LMRepairStep1Pause:
pause
GoTo LMRepairStep1

LMRepairMore:
put lm repair my lockpick
match LMRepairDone pretty good condition already
match LMRepairMore You carefully go about reshaping
match LMRepairMorePause ...wait
matchwait

LMRepairMorePause:
pause
GoTo LMRepairMore

LMRepairDone:
counter subtract 1
ECHO *** Fixed - %c to go
put put my lockpick in my %4
match LMRepairGet%c You put
matchwait

LMRepairNotBroken:
pause
ECHO *** Lockpick not broken
put put lockpick in my %3
wait
GoTo LMRepairGet

LMRepairNoLockpick:
ECHO ***
ECHO * No lockpick found
ECHO ***
GoTo ExitGuildx

#>lm repair my lockpick
#You carefully go about reshaping the copper lockpick, taking great care to provide the proper #curvature to the tip.
#Roundtime: 14 sec.

#>lm repair my lockpick
#The lockpick appears to be in pretty good condition already.

LMRepairSyntax:
ECHO *** Syntax
ECHO * % 3 - Container with broken lockpicks
ECHO * % 4 - Container for repaired lockpicks
ECHO * % 5 - Container for non broken lockpicks
ECHO * % 6 - Container non repairable lockpicks
ECHO * % 7 - # of lockpicks to repair
ECHO * % 8 - Give lockpicks to Master (% 3) from Container (% 4) stow in (% 5)
ECHO ***
GoTo ExitGuildx

#5 lockpicks
#Start with 1

#You are not able to pick the lock, and learn little about it.
#Suddenly, a tiny flag pops out of a hole next to the lockplate with a metallic CLICK!  The flag vibrates there for a moment, then unfurls slowly, revealing a bright red starburst pattern on a white background.  Written in big black letters inside the starburst is the word "BOOM!"

