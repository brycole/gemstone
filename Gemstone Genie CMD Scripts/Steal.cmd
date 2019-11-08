#debuglevel 5
#########################################################################################################
#  ULTIMATE GENIE3 PROGRESSIVE STEALING SCRIPT v5.5 for Dragonrealms. Updated 7/19/15
#  By Shroom of TF. With code contributions from Pelic/Rubinium.
#  © 2005 Chris Sansalone, all rights reserved. Not for resale or distribution without author's consent.
#  Send any bug reports/feedback to: skultamaphon@gmail.com / Shroomismschism @ AIM
#########################################################################################################
# ********************* IMPORTANT INFO / PREREQUISITES ***********************************************************
# - Script requires the latest updated Automapper maps for Genie! See this thread for instructions:
# - http://www.genieclient.com/bulletin/topic/3592-how-to-use-the-genie-map-repository/
#
# - REQUIRES Automapper latest updated maps
# - MAY require using my modified Automapper script (IF you have problems with the default script moving properly) - http://pastebin.com/wx1cM7ty
# - REQUIRES modified travel script. LATEST VERSION HERE - http://pastebin.com/tVwTjDQP ) - This script is for city to city travel
# - REQUIRES ExpTracker Plugin (Find on the Genie forums)
# - (OPTIONAL) Uses Time Plugin
#
# #######################################################################################################
# ********************* SCRIPT NOTES AND FUNCTIONALITY ***********************************************************
#   SUPPORTED CITIES: (Can start in any location in these cities)
# - Therenborough, Riverhaven, Arthe Dale, Crossing, Leth Deriel, Shard, Hib, Ratha, Aesry
#  (This script does not support clan stealing and likely never will - the clan justice is just a pain to deal with) 
#
# - STEALS from every shop in every supported city, moving from city to city until mind locked
# - Automatically determines what items to steal based on your skill level. NEVER change item variables!
# - As you progress in Thievery ranks, the script progressively steals harder items. Trains from 20 ranks to 1200+
#
# - If you go to JAIL, script will RECOVER, pay your fine, retrieve your items and continue where it left off.
#
# - It will remove all your ARMOR before the stealing run, put it in a safe container, and put it all back on when the script finishes.
#
#  AUTOMATICALLY HIDES/STASHES YOUR IMPORTANT ITEMS - Never lose items!
# - IF any items in your bags match names with items you will steal, it will store those in your SAFE.CONTAINER and close it!
# - This will prevent ever accidentally binning or pawning ANY of your important items or armor!!
#
# - THIEVES: Will mark ALL items before stealing, leave shop if there is too much heat.
# - THIEVES will Bin 50% and Pawn 50% by default. Or Bin 100% by setting var PAWN OFF
# - THIEVES Will also make use of Khris and Thief passages for travel to Leth and contacts for finding haven guild.
# - Thieves MUST use THREE (3) separate bags if you are both binning and pawning items. 2 for bin and pawn and 1 for your safe items. 
# - Non-Thieves: Will only steal 1-5 times per shop and will PAWN ALL items and dump those that cant sell.
#
#  CITY TRAVEL LOGIC:
# - If you start in Theren it will go Theren > Haven > Arthe > Xing > Leth > Shard (or stop when locked)
# - If you start in Hib it will go Hib > Shard > Leth > Arthe > Xing > Haven 
# - If you start in Aesry or Ratha, it will stop after it finishes that city, for obvious reasons. 
# - If you Start in Xing or Leth it will head north to Haven. If you start in Haven it will head south. Start in Shard it will head north. 
# - Currently, the script will NOT END in Hib or Theren, mainly due to limitations for many people (out of the way and a hassle) 
# - But if you START the script in Hib or Theren it will steal from there and move on. 
# -(Ice road to Hib being a pain.. shortcut to Theren requiring high levels of Athletics)
#
# SCRIPT USAGE - 
# 1  .steal   
# Default (no variables) - loads the script from the beginning
#
# 2  .steal  LABEL.TO.SKIP.TO  
# (ONE variable) - The usage of a first variable will skip directly to that particular label in a script  (It must be a valid label)
#
# 3  .steal  LABEL.TO.SKIP.TO   TYPEANYTHING  
# (TWO variables) -  A SECOND variable after the first, will SKIP THE BAG CHECK SECTION and then go to the specified label. 
# This will SKIP the bag check section, so it doesn't stash items into your safe container that you have already stolen
# THIS IS USEFUL FOR RESTARTING THE SCRIPT MIDWAY THROUGH  AND SKIPPING TO A CERTAIN  LABEL, 
# WITHOUT THE SCRIPT PUTTING ALREADY STOLEN ITEMS INTO YOUR SAFE CONTAINER
# OR FOR TROUBLESHOOTING PURPOSES. THIS WILL ALSO TURN DEBUGMODE 10 ON. 
# A SECOND VARIABLE  SHOULD ~ONLY~ BE USED  IF THE SCRIPT HAS ALREADY STASHED YOUR ITEMS FROM THE BEGINNING CHECK
# YOU RISK LOSING YOUR ITEMS  IF YOU USE A SECOND VARIABLE  WITHOUT FIRST HAVING ALREADY STASHED YOUR ITEMS
# STARTING THE SCRIPT WITH VARIABLES SHOULD ONLY REALLY BE USED FOR TROUBLESHOOTING OR TESTING PURPOSES
#
######################################## DISCLAIMER #############################################################################################
# ~~ I AM NOT RESPONSIBLE FOR ANY LOST ITEMS. IT IS **HIGHLY RECOMMENDED** TO REGISTER YOUR MOST VALUABLE ITEMS.
# ~~ ALTHOUGH THIS SCRIPT DOES ~EVERYTHING POSSIBLE~ TO MAKE SURE IT DOESN'T LOSE YOUR ITEMS..
# ~~ THERE IS ALWAYS A TINY CHANCE (HOWEVER SMALL) THAT SOMETHING MAY GO WRONG.
# ~~ IF YOU WANT TO BE 100% SURE, PUT YOUR MOST IMPORTANT ITEMS IN YOUR VAULT, OR A CLOSED CONTAINER,
# ~~ THIS SCRIPT AUTOMATICALLY STASHES YOUR VULNERABLE ITEMS IN YOUR SAFE CONTAINER! THIS IS A SPECIAL FEATURE THAT TOOK A WHILE TO PERFECT!
# ~~ I TEST THIS SCRIPT WITH MULTIPLE SUPER RARE ITEMS~ I HAVE ONLY EVER LOST 1 or 2 ITEMS IN THOUSANDS OF RUNS,
# ~~ DUE TO A BUG WHICH I FIXED YEARS AGO, ~BEFORE~ I HAD THIS AUTO-STASH FEATURE 
# ~~ NEVERTHELESS - REGISTER YOUR MOST IMPORTANT STUFF TO BE SURE. BETTER TO BE SAFE THEN SORRY!
#################################################################################################################################################

#####################################
#        USER VARIABLES                             #
# YOU MUST SET THESE VARIABLES!   #
####################################
## IF you are a THIEF and BINNING ~AND~ PAWNING - BIN.CONTAINER and PAWN.CONTAINER ~MUST~ BE TWO DIFFERENT CONTAINERS!
## IF you are a NON-THIEF, JUST pawning, or JUST binning - then these SHOULD be the SAME container.
     var PAWN.CONTAINER backpack
     var BIN.CONTAINER backpack

## WARNING!! SAFE.CONTAINER IS *MANDATORY* AND ~MUST~ BE A DIFFERENT CLOSABLE CONTAINER THEN BOTH BIN AND PAWN. 
## IF NOT YOU COULD LOSE YOUR ITEMS! IDEALLY THIS SHOULD BE YOUR LARGEST CONTAINER! 
     var SAFE.CONTAINER baldric

## IMPORTANT.ITEMS is for ~DOUBLE CHECKING~ your most priceless items to ENSURE you don't lose them
## Script will already scan your bags and stash any vulnerable items in your safe container. 
## This is just a secondary layer of protection! Not necessary but good for peace of mind. 
     var IMPORTANT.ITEMS \btarge\b|basilisk arrow|crossbow bolt|shield|\bbuckler\b|mirror blade|katana|crossbow|mirror flail|quadrello|orb|throwing hammer
     
## SINGLE.RUN - ON WILL STOP STEALING AFTER A SINGLE CITY RUN. 
## OFF WILL RUN UNTIL MIND LOCKED, MOVING FROM CITY TO CITY
     var SINGLE.RUN ON

## RETURN.HOME - YES returns you to your original starting city at the end of script. 
## NO stays at whatever city you finish in.
     var RETURN.HOME YES

## PLEAD INNOCENT OR GUILTY
     var PLEAD innocent

## MY CUSTOM TRAVEL SCRIPT NAME (if you want to use a separate script named travel)
## YOU CAN RENAME IT ANYTHING YOU WANT, JUST CHANGE THE VARIABLE HERE IF IT IS DIFFERENT THAN .TRAVEL
     var TRAVEL.SCRIPT travel
     
## ARE YOU A PREMIUM MEMBER AND WANT TO USE THE PREMIUM BANK WHEN EXCHANGING CURRENCIES?
## IF SO SET THIS VARIABLE TO ON
     var PREMIUM OFF

## STEALTH - ON continues stealing until both Thievery AND Stealth is locked 
## (Only works in Crossings - This is for noobs only)
     var STEALTH ON
     
## SNEAK ON WILL SNEAK FROM SHOP TO SHOP (Not recommended)
##(THIS WILL INCREASE TOTAL TIME SIGNIFICANTLY!)
     var SNEAK OFF
     
## HEALTH CHECK - Will check for wounds before script, will exit script if you have significant injuries. 
## Recommend leaving ON or else you risk getting caught much more often.
## You can turn this off if you want to script with bleeders..
     var HEALTH.CHECK ON
     
###########################################
#       THIEF ONLY VARIABLES                               #
# THIEVES MUST SET YOUR PASSWORDS!     #
##########################################
     var HAVEN.PW neavusteanu
     var SHARD.PW avrendom
     var khri1 plunder
     var khri2 focus
## WARNING!! IT IS ~NOT~ RECOMMEND TO TURN BIN OFF!
## NOT BINNING ITEMS FOR A LONG TIME CAN DESTROY YOUR THIEF REP - AND YOU RUN A VERY HIGH CHANCE OF BEING THUGGED!
## WHICH MOST LIKELY MEANS INSTANT DEATH FROM USING THIEF PASSAGES OR ENTERING THE THIEF GUILD. 
## IF DESIRED, YOU CAN TURN PAWN OFF FOR MAXIMUM REP. 
     var BIN ON
     var PAWN ON
     
## MARK.ALL ON TO MARK EVERY ITEM YOU STEAL.  * RECOMMENDED FOR HIGHER LEVEL THIEVES
## OFF TO SKIP THE SECOND AND FOURTH MARK  * RECOMMENDED FOR LOW LEVEL THIEVES  WHO CANNOT MARK  MORE THAN TWO TIMES 
## STEALCOUNT IS THE MAX NUMBER OF TIMES YOU WILL STEAL FROM A SHOP - REGARDLESS OF MARK. 
## 5 IS THE ABSOLUTE MAX FOR STEALCOUNT! ANY HIGHER AND YOU WILL BE CAUGHT. 
     var MARK.ALL ON
     var STEALCOUNT 5
     
###############################
# NECROMANCER VARIABLES     #
###############################
## FOR EOTB AND ROC CHOOSE EITHER OFF or ON
## CHOOSE YOUR MANA AMOUNT AND CAST TIME (OR SET TO 0 TO WAIT FOR FULL CAST)
     var EOTB ON
     var eotbMana 34
     var ROC ON
     var rocMana 8
     var castPause 20
## Enter any "room titles" where you do NOT want to cast. Several have been added as an example.  
## Note, all banks should already be accounted for.
     var donotcastlist The Crossing, Western Gate|The Crossing, Hodierna Way|Northeast Wilds, Outside Northeast Gate

###############################
# EMPATH ONLY VARIABLES       #
###############################
## POWER (Perceive), PERC.HEALTH and GUARDIAN.SPIRIT can be OFF or ON
## CHOOSE ONE IF DESIRED TO PERCEIVE BEFORE EACH SHOP
## POWER IS FOR NOOB EMPATHS WHILE PERC IS FOR HIGHER LEVEL EMPATHS
## CHOOSE YOUR MANA AMOUNT AND CAST TIME (OR SET TO 0 TO WAIT FOR FULL CAST)
     var POWER OFF
     var PERC.HEALTH OFF
     var GUARDIAN.SPIRIT OFF
     var gsMana 15
     var E.castPause 20
     
###############################
##       TF VARIABLES         #
## IGNORE THESE IF NOT IN TF  #
###############################
     var CLANITEM NO
     var CLAN.ITEM.NAME human skull
     var MAIN.SCRIPT prime
################################################
#          !!! END USER VARIABLES !!!          #
#         DO NOT TOUCH ANYTHING BELOW!         #
################################################
### DEFAULT VARIABLES
     var runTime 0
     var Banked 0
     var Profit 0
     var Plat 0
     var Gold 0
     var Silver 0
     var Bronze 0-
     var Copper 0
     var Plats 0
     var Golds 0
     var Silvers 0
     var Bronzes 0
     var Coppers 0
     put #tvar Plat 0
     put #tvar Gold 0
     put #tvar Silver 0
     put #tvar Bronze 0
     put #tvar Copper 0
     var Jailed 0
     var Charges 0
     var Binned 0
     var Pawned 0
     var SECOND.ITEM 0
     var SECOND.PAWN OFF
     var marking OFF
     var currency kronar
     var itemLocation
     var noLearn OFF
     var Rite OFF
     var Eyes OFF
     var nosell null
     var armor null
     var armor1 null
     var armor2 null
     var armor3 null
     var armor4 null
     var armor5 null
     var armor6 null
     var armor7 null
     var armor8 null
     var armor9 null
     var armor10 null
     var total.armor 0
#############################################################################################################################################
     put #var save
ACTION.INIT:
     var LAST ACTION.INIT
     action math Pawned add 1 when You sell your
     action math Binned add 1 when Nice work, $charactername
     action math Charges add 1 when begins to shout for help|begins to shout loudly for help
     action var Eyes ON when ^Your spell subtly alters|^You feel an unsteady|^Your spell injects more psychic corruption
     action var Eyes OFF when ^Your corruptive mutation fades|^Your corruption fades
     action var Rite ON when ^You weave a field of sublime|^The Rite of Contrition matrix redoubles
     action var Rite OFF when ^The Rite of Contrition matrix loses
     action var nosell $1 when ^\w+ shakes his head (.+)$  
     action goto TOO.MANY.FINES when ^You think about stealing for a moment
     action instant goto JAIL.CHECK when a sound not unlike that of a tomb|binds you in chains|firmly off to jail|drag you off to jail|brings you to the jail|Dwarves burst out from everywhere
     action instant goto JAIL.CHECK when your belongings have been stripped|in a jail cell wearing a set of heavy manacles|strip you of all your possessions|binds your hands behind your back
     action instant goto JAIL.CHECK when the last thing you see before you black out|your possessions have been stripped|Do not resist, for your crimes must be answered for
     action instant goto JAIL.CHECK when Your silence shall be taken as an indication of your guilt|The eyes of the court are upon you|Your silence can only be taken as evidence of your guilt
     action instant goto JAIL.CHECK when all your belongings have been stripped|^The guard brings you to the jail
     action var noLearn ON; put #echo >log Orange *** Not learning from %item in %SHOP @ $Thievery.Ranks ranks when You don't feel you learned anything useful
     action put #echo >log Red *** Caught in %SHOP stealing: %item @ $Thievery.Ranks ranks when notices you attempting|Guards\! Guards\!|begins to shout
     action put #echo >log Purple *** Stealing Mind Locked! Not learning anymore when You feel that for the moment you've learned all you can   
     # action send exit when eval $health < 50
     # action goto CLAN.HEAL when I now pronounce sentence
     if ("%PREMIUM" = "ON") then gosub PREMIUM.CHECK
	gosub GUILD.CHECK
     if ("$guild" = "Necromancer") then gosub NECROSTART
     gosub CITY.CHECK
     gosub HEALTH.CHECK
     gosub SKILLCHECK
     gosub WELCOME
######################################################################################################################################
     var STEAL.LIST.THEREN %T.Tarsha|%T.Rose|%T.Music|%T.Hats|%T.Arm|%T.Gift|%T.Sweet|%T.Cupcake|%T.Gen|%T.Krrish|%T.Lense|%T.Cleric|%T.Men|%T.Women|%T.Cloth|%T.Armory|%T.Forge
     var STEAL.LIST.HAVEN %RH.Herb|%RH.Iron|%RH.Naph|%RH.Flow|%RH.Seli|%RH.Arms|%RH.Gen|%RH.Cloth|%RH.Artif|%RH.Joy|%RH.Smoke|%RH.Weap|%RH.Bard|%RH.Bard2|%RH.Cleric|%RH.Cleric2|%RH.Lock|%RH.Tog|%RH.Tog2|%RH.Mirg
     var STEAL.LIST.ARTHE %AD.Feta|%AD.Thread|%AD.Fash|%AD.Odds|%AD.Bard|%AD.Map|%AD.Arm|%AD.Tart.E|%KA.Grek|%AD.Smoke|%KA.Grek
     var STEAL.LIST.CROSS %C.Alch|%C.Artif|%C.Bath|%C.Card|%C.Gen|%C.Weap|%C.Arm|%C.Music|%C.Music2|%C.Lock|%C.Empath|%C.Empath2|%C.Empath3|%C.Cler|%C.Haber|%C.Script|%C.Tann|%C.Jewel|%C.Stitch|%C.Cobb|%C.Herb|%C.Flow
     var STEAL.LIST.LETH %L.Skin|%L.Bow|%L.Orig|%L.Weap|%L.Wick|%L.Bard|%L.Bard2|%L.Cloth|%L.Wood|%L.Gen|%L.Gen.Alt|%L.Perf
     var STEAL.LIST.SHARD %S.Gen|%S.Weap|%S.Cleric|%S.Stitch|%S.Alch|%S.Herb|%S.Artif|%S.Music|%S.Armor|%S.Reed|%S.Bow|%S.Lock|%S.Coin|%S.Frill|%S.Herald|%S.Gift|%S.Spire|%S.Toy|%S.Memory|%S.Token|%S.Museum|%S.Barber|%S.Tanner|%S.Surv|%S.Surv.Alt|%S.Surv2|%S.Surv2.Alt
     var STEAL.LIST.HIB %SC.Weap|%H.Shield|%H.Jewel|%H.Tog|%H.Herb|%H.Sund|%H.Lamp|%H.Music|%H.Alch|%H.Forge|%RP.Gen|%RP.Tobac
     var STEAL.LIST.RATHA %R.Bait|%R.Gen|%R.Herb|%R.Forge|%R.Tailor|%R.Hair|%R.Leather|%R.Music|%R.Magic|%R.Origami|%R.Jewelry|%R.Ring
     var STEAL.LIST.AESRY %A.Herb|%A.Tanner|%A.Clothing|%A.Script|%A.Cleric|%A.Origami|%A.Jewelry|%A.Magic|%A.Slings|%A.Puzzle|%A.Footwear|%A.Shields|%A.Weapon|%A.Armor|%A.Gen|%A.Flower|%A.Music
     var STEAL.LIST.MISC cigar|scroll|naphtha|sling|mining helm|tobacco|bagpipes|cowl|dwarven hammer|lamp|robe|string
######################################################################################################################################
     var STEAL.LIST %STEAL.LIST.THEREN|%STEAL.LIST.HAVEN|%STEAL.LIST.ARTHE|%STEAL.LIST.CROSS|%STEAL.LIST.LETH|%STEAL.LIST.SHARD|%STEAL.LIST.HIB|%STEAL.LIST.RATHA|%STEAL.LIST.AESRY|%STEAL.LIST.MISC
     var large.items cauldron|stove|spear|wayerd pyramid
######################################################################################################################################
ARMOR.INIT:
     var LAST ARMOR.INIT
     echo
     echo **** CHECKING WORN ARMOR...
     echo
     pause 0.2
     gosub STOWING
     gosub ARMOR.CHECK
     if_2 then
          {
               echo
               echo *** YOU STARTED SCRIPT WITH A SECOND VARIABLE
               echo *** THIS IS FOR TROUBLESHOOTING/TESTING PURPOSES ONLY!!!
               echo ( FOR STARTING SCRIPT MIDWAY AND JUMPING TO A LABEL, WHILE SKIPPING THE BAG CHECK ) 
               echo
               pause 3
               echo !!!! WARNING !!! WARNING !!!!! 
               echo !!!! SKIPPING BAG CHECK !!!!
               echo !!!! YOU MAY LOSE YOUR ITEMS IF YOU DID NOT ALREADY MOVE ITEMS TO YOUR SAFE CONTAINER!!
               echo !!!! ABORT SCRIPT ~NOW~ AND RESTART WITH NO OPTIONS (.steal) IF YOU ARE NOT DOING THIS ON PURPOSE !!
               echo !!!! CONTINUING IN 10 SECONDS...
               pause 7
               echo
               echo *** ~~~~ DEBUG MODE ENABLED ~~~~
               echo *** STARTING SCRIPT FROM %1 LABEL...
               echo
               pause 3
               debuglevel 10
               goto START
          }
CHECKING.BAGS:
     var LAST CHECKING.BAGS
     echo
     echo ****** CHECKING YOUR CURRENT BAG CONTENTS TO AVOID PAWNING/BINNING YOUR ITEMS....
     echo ****** WILL STASH ALL VULNERABLE ITEMS IN YOUR: %SAFE.CONTAINER
     echo
     pause 0.2
     gosub BAG.CHECK %PAWN.CONTAINER
     gosub BAG.CHECK %BIN.CONTAINER

START:
     var LAST START
     echo
     echo *** THIEVERY SKILL RANGE - %skillrange
     echo
     pause
     if ("%BIN" = "OFF") then
          {
               echo
               echo *** PAWNING ALL ITEMS FOR MAX PROFIT...
               echo
               pause
          }
     timer start
     gosub CITY.CHECK
     if_1 then goto %1
############################################################################################
############################################################################################
####                         BEGIN STEALING SECTION                                    #####
############################################################################################
############################################################################################
MAINLOOP:
STEALING.RUN:
     var LAST STEALING.RUN
     gosub STOWING
STEAL.BEGIN:
     put #echo >Log SkyBlue ** Starting Stealing Run from: %CITY
     pause 0.5
     goto %CITY.STEAL
######################################################
#  THERENGIA STEALING (THEREN/ROSSMAN/RIVERHAVEN     #
######################################################
### THERENBOROUGH
THEREN.STEAL:
     var CURRENT.CITY THEREN
     var LAST THEREN.STEAL
     if ("%POWER" = "ON") || ("%PERC.HEALTH" = "ON") || ("%GUARDIAN.SPIRIT" = "ON") || ("ROC" = "ON") || ("EOTB" = "ON") then
          {
               echo *** NOT CASTING ANY SPELLS WHILE IN THEREN!
               echo *** TOO MANY MAGICALLY INERT ROOMS! THEREN SUCKS!
               pause 3
          }
     if matchre("$roomobjs","(Baronial guardsman)") then put surrender guard
     pause 0.5
     pause 0.1
     gosub COOKIE
THEREN.EXP.CHECK.0:
     if $Thievery.Ranks < 50 then goto THEREN.NOSTEAL
     if $Thievery.Ranks >= 690 then goto THEREN.TO.ROSE
THEREN.TO.TARSHA:
     var LAST THEREN.TO.ROSE
     gosub AUTOMOVE tarsha
THEREN.TARSHA:
     var shopcode T.Tarsha
     var SHOP Tarsha's Emporium
     gosub STEAL %T.Tarsha
THEREN.TO.ROSE:
     var LAST THEREN.TO.MUSIC
     gosub AUTOMOVE theatre
THEREN.ROSE:
     var shopcode T.Rose
     var SHOP Rose of the Theater - Attire
     gosub STEAL %T.Rose
THEREN.TO.MUSIC:
     var LAST THEREN.EXP.CHECK.1:
     gosub AUTOMOVE rose of the theatre
THEREN.MUSIC:
     var shopcode T.Music
     var SHOP Rose of the Theater - Instruments
     gosub STEAL %T.Music.Num %T.Music
THEREN.EXP.CHECK.1:
     if $Thievery.Ranks >= 590 then goto THEREN.TO.ARMOR
THEREN.TO.HATS:
     var LAST THEREN.EXP.CHECK.2
     gosub AUTOMOVE hats
THEREN.HATS:
     var shopcode T.Hats
     var SHOP Theren Hats
     gosub STEAL %T.Hats
THEREN.EXP.CHECK.2:
     if $Thievery.Ranks >= 300 then goto THEREN.TO.ARMOR
THEREN.TO.SWEET:
     var LAST THEREN.TO.CUPCAKE
     gosub AUTOMOVE sweet
THEREN.SWEET:
     var shopcode T.Sweet
     var SHOP Theren Sweet Delights
     gosub STEAL %T.Sweet
THEREN.TO.CUPCAKE:
     var LAST THEREN.TO.ARMOR
     gosub AUTOMOVE cup
THEREN.CUPCAKE:
     var shopcode T.Cupcake
     var SHOP Theren Cupcake
     gosub STEAL %T.Cupcake
THEREN.TO.ARMOR:
     var LAST THEREN.TO.GIFT
     gosub AUTOMOVE armor
THEREN.ARMOR:
     var shopcode T.Arm
     var SHOP Theren Armor
     gosub STEAL %T.Arm
THEREN.TO.GIFT:
     var LAST THEREN.EXP.CHECK.3
     gosub AUTOMOVE gift
THEREN.GIFT:
     var shopcode T.Gift
     var SHOP Theren Gift Shop
     gosub STEAL %T.Gift
THEREN.EXP.CHECK.3:
     if $Thievery.Ranks >= 700 then goto THEREN.TO.KRRISH
THEREN.TO.GENERAL:
     var LAST THEREN.TO.KRRISH
     gosub AUTOMOVE general
THEREN.GENERAL:
     var shopcode T.Gen
     var SHOP Theren General Store
     gosub STEAL %T.Gen
THEREN.TO.KRRISH:
     var LAST THEREN.TO.LENSE
     gosub AUTOMOVE Krrish's home
THEREN.KRRISH:
     var shopcode T.Krrish
     var SHOP Theren Krissh
     gosub STEAL %T.Krrish
THEREN.TO.LENSE:
     var LAST THEREN.EXP.CHECK.4
     gosub AUTOMOVE lense
THEREN.LENSE:
     var shopcode T.Lense
     var SHOP Theren Konezu's Lenses
     gosub STEAL %T.Lense
THEREN.EXP.CHECK.4:
     if $Thievery.Ranks >= 460 then goto THEREN.TO.MEN
THEREN.TO.CLERIC:
     var LAST THEREN.TO.MEN
     gosub AUTOMOVE cleric
THEREN.CLERIC:
     var shopcode T.Cleric
     var SHOP Theren Cleric Shop
     gosub STEAL %T.Cleric
THEREN.TO.MEN:
     var LAST THEREN.TO.WOMEN
     gosub AUTOMOVE men's
THEREN.MEN:
     var shopcode T.Men
     var SHOP Theren Courtly Men's Study
     gosub STEAL %T.Men
THEREN.TO.WOMEN:
     var LAST THEREN.TO.CLOTHING
     gosub AUTOMOVE women's
THEREN.WOMEN:
     var shopcode T.Women
     var SHOP Theren Courtly Women's Parlor
     gosub STEAL %T.Women
THEREN.TO.CLOTHING:
     var LAST THEREN.TO.ARMORY
     gosub AUTOMOVE clothing
THEREN.CLOTHING:
     var shopcode T.Cloth
     var SHOP Theren Courtly Clothing
     gosub STEAL %T.Cloth
THEREN.TO.ARMORY:
     var LAST THEREN.TO.ARMORY
     gosub AUTOMOVE 103
     gosub AUTOMOVE moat
     gosub AUTOMOVE 146
THEREN.TO.DUNG:
     gosub AUTOMOVE dungeon
THEREN.TO.ARMORY.CONT:
     gosub AUTOMOVE armory
THEREN.ARMORY:
     var shopcode T.Armory
     var SHOP Theren Keep Armory
     gosub STEAL %T.Armory
THEREN.LEAVE:
     var LAST THEREN.LEAVE
     gosub AUTOMOVE 69
     send jump moat
     echo *** STUNNED!! Pausing to recover....
     pause 12
THEREN.STUNNED:
     var LAST THEREN.STUNNED
     pause 11
     if $stunned = 1 then goto THEREN.STUNNED
     gosub STAND
     pause 0.5
     gosub AUTOMOVE 1
     put go gate
TRAVEL.HAVEN:
TO.RIVERHAVEN:
     pause 0.5
     echo *** TRAVELLING TO HAVEN.....
     send .%TRAVEL.SCRIPT haven
     waitforre ^YOU HAVE ARRIVED
     pause 0.1
############################################
#  RIVERHAVEN STEALING
############################################
RIVERHAVEN.STEAL:
HAVEN.STEAL:
     var LAST HAVEN.STEAL
     var CURRENT.CITY RIVERHAVEN
     if matchre("$roomobjs","(Riverhaven Warden)") then put surrender warden
     pause 0.5
     pause 0.1
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub TIME.CHECK
HAVEN.TO.TOG:
     var LAST HAVEN.EXP.CHECK.0
     gosub AUTOMOVE city tog
HAVEN.TOG:
     var shopcode RH.Tog
     var SHOP Riverhaven Togs
     gosub STEAL %RH.Tog
HAVEN.EXP.CHECK.0:
     if $Thievery.Ranks >= 340 then goto HAVEN.EXP.CHECK.1
     if $Thievery.LearningRate > 31 then goto GO.PAWN.HAVEN
HAVEN.TO.HERB:
     var LAST HAVEN.EXP.CHECK.1
     gosub AUTOMOVE herb
HAVEN.HERB:
     var shopcode RH.Herb
     var SHOP Riverhaven Herbs
     gosub STEAL %RH.Herb
HAVEN.EXP.CHECK.1:
     if $Thievery.Ranks >= 385 then goto HAVEN.EXP.CHECK.2
HAVEN.TO.NAPHTHA:
     var LAST HAVEN.EXP.CHECK.2
     gosub AUTOMOVE Naptha
HAVEN.NAPHTHA:
     var shopcode RH.Naph
     var SHOP Riverhaven Naptha Cart
     var itemLocation %RH.Naph.Loc
     gosub STEAL %RH.Naph
HAVEN.EXP.CHECK.2:
     var itemLocation 
     if $Thievery.Ranks >= 600 then goto HAVEN.TO.ARMS
HAVEN.TO.FLOWER:
     var LAST HAVEN.TO.ARMS
     gosub AUTOMOVE cecel
HAVEN.FLOWER:
     var shopcode RH.Flow
     var SHOP Riverhaven Florist
     gosub STEAL %RH.Flow
HAVEN.TO.ARMS:
     var LAST HAVEN.EXP.CHECK.3
     gosub AUTOMOVE noel
HAVEN.ARMS:
     var shopcode RH.Arms
     var SHOP Riverhaven Noel's Arms
     gosub STEAL %RH.Arms
HAVEN.EXP.CHECK.3:
     if $Thievery.Ranks >= 650 then goto HAVEN.EXP.CHECK.4
     if $Thievery.LearningRate > 33 then goto GO.PAWN.HAVEN
HAVEN.TO.GENERAL:
     var LAST HAVEN.EXP.CHECK.4
     gosub AUTOMOVE general
HAVEN.GENERAL:
     var shopcode RH.Gen
     var SHOP Riverhaven General Store
     gosub STEAL %RH.Gen
HAVEN.EXP.CHECK.4:
     if $Thievery.Ranks >= 600 then goto HAVEN.EXP.CHECK.5
HAVEN.TO.CLOTH:
     var LAST HAVEN.EXP.CHECK.5
     gosub AUTOMOVE cloth
HAVEN.CLOTH:
     var shopcode RH.Cloth
     var SHOP Riverhaven Clothiers
     gosub STEAL %RH.Cloth
HAVEN.EXP.CHECK.5:
     # if $Thievery.Ranks >= 1200 then goto HAVEN.TO.JOY
HAVEN.TO.ARTIFICER:
     var LAST HAVEN.EXP.CHECK.6
     gosub AUTOMOVE artif
HAVEN.ARTIFICER:
     var shopcode RH.Artif
     var SHOP Riverhaven Artificer
     gosub STEAL %RH.Artif
HAVEN.EXP.CHECK.6:
     if $Thievery.Ranks >= 138 then goto HAVEN.EXP.CHECK.7
HAVEN.TO.LOCKSMITH:
     var LAST HAVEN.EXP.CHECK.7
     gosub AUTOMOVE locks
HAVEN.LOCKSMITH:
     var shopcode RH.Lock
     var SHOP Riverhaven Locksmith
     gosub STEAL %RH.Lock
HAVEN.EXP.CHECK.7:
     if $Thievery.LearningRate > 33 then goto GO.PAWN.HAVEN
     if $Thievery.Ranks >= 414 then goto HAVEN.EXP.CHECK.8
HAVEN.TO.JOY:
     var LAST HAVEN.EXP.CHECK.8
     gosub AUTOMOVE smara
HAVEN.JOY:
     var shopcode RH.Joy
     var SHOP Riverhaven Joy Shop
     gosub STEAL %RH.Joy
     gosub MOVE out
     pause 0.5
HAVEN.EXP.CHECK.8:
     if $Thievery.Ranks >= 238 then goto HAVEN.TO.MIRG
HAVEN.TIME.0:
     gosub TIME.CHECK
     if ("%TIME" = "DAY") then goto HAVEN.TO.SMOKE
     goto HAVEN.TO.MIRG
HAVEN.TO.SMOKE:
     var LAST HAVEN.TO.MIRG
     gosub AUTOMOVE 42
     send kneel
     send go shop
HAVEN.SMOKE:
     var shopcode RH.Smoke
     var SHOP Riverhaven Smoke Shop
     gosub STEAL %RH.Smoke
     send out
     pause
     gosub STAND
     gosub HIDE
HAVEN.TO.MIRG:
     var LAST HAVEN.TO.WEAPON
     gosub AUTOMOVE jewel
HAVEN.MIRG:
     var shopcode RH.Mirg
     var SHOP Riverhaven Goldsmiths
     gosub STEAL %RH.Mirg
HAVEN.EXP.CHECK.9:
     if $Thievery.LearningRate > 33 then goto GO.PAWN.HAVEN
HAVEN.TO.WEAPON:
     var LAST HAVEN.TO.BARD
     gosub AUTOMOVE weapon
HAVEN.WEAPON:
     var shopcode RH.Weap
     var SHOP Riverhaven Weapon Shop
     gosub STEAL %RH.Weap
HAVEN.TO.BARD:
     var LAST HAVEN.TO.BARD2
     gosub AUTOMOVE bard
HAVEN.BARD:
     var shopcode RH.Bard
     var SHOP Riverhaven Bard Shop
     gosub STEAL %RH.Bard
HAVEN.TO.BARD2:
     var LAST HAVEN.EXP.CHECK.10
     gosub AUTOMOVE bard
     gosub MOVE go curt
HAVEN.BARD2:
     var shopcode RH.Bard2
     var SHOP Riverhaven Bard2 Shop
     gosub STEAL %RH.Bard2
HAVEN.EXP.CHECK.10:
     if $Thievery.LearningRate > 33 then goto GO.PAWN.HAVEN
HAVEN.TO.IRON:
     var LAST HAVEN.TO.CLERIC
     gosub AUTOMOVE iron
HAVEN.IRONWORKS:
     var shopcode RH.Iron
     var SHOP Riverhaven Ironworks
     gosub STEAL %RH.Iron
HAVEN.TO.CLERIC:
     var LAST HAVEN.TO.CLERIC2
     gosub AUTOMOVE cleric shop
HAVEN.EXP.CHECK.11:
     if $Thievery.Ranks >= 465 then goto HAVEN.TO.CLERIC2
HAVEN.CLERIC:
     var shopcode RH.Cleric
     var SHOP Riverhaven Cleric Shop
     gosub STEAL %RH.Cleric
HAVEN.TO.CLERIC2:
     var LAST GO.PAWN.HAVEN
     if !matchre("%guild","(Thief|Empath|Cleric)") then goto GO.PAWN.HAVEN
     gosub MOVE go curt
HAVEN.CLERIC2:
     var shopcode RH.Cleric2
     var SHOP Riverhaven Cleric2 Shop
     gosub STEAL %RH.Cleric2
GO.PAWN.HAVEN:
     var CURRENT.CITY RIVERHAVEN
     var LAST GO.PAWN.HAVEN
     if ("%PAWN" = "OFF") then goto HAVEN.TO.BANK
     gosub AUTOMOVE PAWN
     pause 0.5
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub PAWN.GOODS
HAVEN.TO.BANK:
     var LAST HAVEN.TO.BANK
     if ("%guild" = "Thief") then send khri stop
     if ("%guild" = "Necromancer") then goto HAVEN.TELLER
     if ("%PREMIUM" = "ON") then goto HAVEN.PREMIUM
     gosub AUTOMOVE exchange
     gosub LIRUMS
     goto HAVEN.TELLER
HAVEN.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub LIRUMS
HAVEN.TELLER:
     gosub AUTOMOVE teller
     var Banked 1
     gosub BANK
     if ("%guild" = "Thief") then gosub PUT with 4 silver
     gosub MOVE go arch
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub MOVE out
     if ("%BIN" = "OFF") then goto DONE.STEALING.HAVEN
GO.BIN.HAVEN:
HAVEN.GO.BIN:
HAVEN.FIND.GUILD:
     var LAST HAVEN.FIND.GUILD
     var BIN.HAVEN 0
     pause 0.5
     match hole1 selling off some stolen goods
     match hole2 Crescent Way
     match hole3 Silvermoon Road
     match hole4 the boss is with his own kind
     match hole5 cooped up
     match hole6 around the rookery
     matchre NO.CONTACTS Apparently there are too many eyes on you|USAGE|walks off|look of disgust
     send contact guild
     matchwait 7
     goto NO.CONTACTS
NO.CONTACTS:
     var LOCATION LOST
hole1:
     var LAST hole1
     gosub AUTOMOVE 33
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN.PW
     gosub MOVE climb stair
     gosub MOVE ne
     gosub MOVE go corner
athole1:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN.HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE sw
     send climb stair
     pause 0.5
     send go door
     pause 0.5
     if ("%LOCATION" = "LOST") && ("%BIN.HAVEN" = "0") then goto hole2
     goto HAVEN.DONE.ASSESS
hole2:
     var LAST hole2
     gosub AUTOMOVE 47
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN.PW
     gosub PUT look shadow
     gosub PUT search shadow
     pause 0.5
     gosub MOVE go open
     gosub MOVE go cor
athole2:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN.HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE out
     gosub MOVE go door
     if ("%LOCATION" = "LOST") && ("%BIN.HAVEN" = "0") then goto hole3
     goto HAVEN.DONE.ASSESS
hole3:
     var LAST hole3
     gosub AUTOMOVE 36
     gosub SEARCH
     pause $roundtime
     gosub PUT knock door
     gosub PUT whisper door %HAVEN.PW
     gosub PUT look floor
     gosub MOVE go door
     gosub MOVE go cor
athole3:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN.HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     send climb door
     pause 0.5
     gosub MOVE out
     if ("%LOCATION" = "LOST") && ("%BIN.HAVEN" = "0") then goto hole4
     goto HAVEN.DONE.ASSESS
hole4:
     var LAST hole4
     gosub AUTOMOVE 302
     gosub SEARCH
     pause $roundtime
     gosub PUT knock grat
     gosub PUT whisper grat %HAVEN.PW
     gosub MOVE go door
     gosub MOVE ne
     gosub MOVE go nook
athole4:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN.HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE sw
     gosub MOVE go door
     gosub MOVE go grate
     gosub MOVE out
     if ("%LOCATION" = "LOST") && ("%BIN.HAVEN" = "0") then goto hole5
     goto HAVEN.DONE.ASSESS
hole5:
     var LAST hole5
     gosub AUTOMOVE 41
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN.PW
     gosub MOVE n
     gosub MOVE go corn
athole5:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN.HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE s
     gosub MOVE go door
     if ("%LOCATION" = "LOST") && ("%BIN.HAVEN" = "0") then goto hole6
     goto HAVEN.DONE.ASSESS
hole6:
     var LAST hole6
     gosub AUTOMOVE 305
     gosub SEARCH
     pause $roundtime
     gosub PUT knock door
     gosub PUT whisper door %HAVEN.PW
     gosub MOVE go arch
     gosub MOVE climb st
     gosub MOVE go cor
athole6:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN.HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE climb sta
     gosub MOVE go arc
     gosub MOVE go door
     goto HAVEN.DONE.ASSESS
HAVEN.DONE.ASSESS:
     var LAST HAVEN.DONE.ASSESS
     math RunsCompleted add 1
     send exp
     waitforre ^EXP HELP for more information
DONE.STEALING.HAVEN:
     var LAST DONE.STEALING.HAVEN
     gosub AUTOMOVE town
     if ("%SINGLE.RUN" = "ON") then goto FINISHED.SCRIPT
     if ($Thievery.LearningRate >= 30) then goto FINISHED.SCRIPT
     if ("%CITY" = "SHARD") || ("%CITY" = "CROSSING") || ("%CITY" = "HIB") || ("%CITY" = "LETH") then goto FINISHED.SCRIPT
     if ("%CITY" = "RIVERHAVEN") || ("%CITY" = "ROSSMAN") || ("%CITY" = "THEREN") && ($Thievery.LearningRate < 30) then goto TO.ARTHE
     goto TO.ARTHE
############################################################################
## ZOLUREN STEALING SECTION (ARTHE / CROSSING / LETH  )                   ##
############################################################################
# ARTHE DALE
CROSSING.STEAL:
ARTHE.STEAL:
TO.ARTHE:
     var CURRENT.CITY ARTHE
     var LAST TO.ARTHE
     if ($zoneid = 30) && ($roomid != 8) then gosub AUTOMOVE 8
     if ($zoneid = 1) && ($roomid != 42) then gosub AUTOMOVE 42
     if ($zoneid = 7) then goto ARTHE
     send .%TRAVEL.SCRIPT arthe
     waitforre ^YOU HAVE ARRIVED
     pause
ARTHE:
     var LAST CROSSING
     gosub AUTOMOVE glaysker
     pause 0.5
     echo
     echo *** STEALING FROM ARTHE DALE!
     echo
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
ARTHE.EXP.CHECK.0:
     if $Thievery.Ranks >= 460 then goto ARTHE.TO.ODDS
ARTHE.TO.PATTERN:
     var LAST ARTHE.TO.FASHION
     gosub AUTOMOVE embroid
ARTHE.THREADS:
     var shopcode AD.Thread
     var SHOP Arthe Dale Thread Shop
     gosub STEAL %AD.Thread
ARTHE.TO.FASHION:
     var LAST ARTHE.TO.ODDS
     gosub AUTOMOVE clothing
ARTHE.FASHION:
     var shopcode AD.Fash
     var SHOP Arthe Dale Fashion Shop
     gosub STEAL %AD.Fash
ARTHE.TO.ODDS:
     var LAST ARTHE.EXP.CHECK.1
     gosub AUTOMOVE Odds
ARTHE.ODDS:
     var shopcode AD.Odds
     var SHOP Arthe Dale Odds'n'Ends Shop
     gosub STEAL %AD.Odds
     if $hidden then gosub unhide
     gosub MOVE out
ARTHE.EXP.CHECK.1:
     if $Thievery.Ranks >= 600 then goto ARTHE.TIME.0
ARTHE.TO.BARD:
     var LAST ARTHE.TIME.0
     gosub AUTOMOVE music
ARTHE.BARD:
     var shopcode AD.Bard
     var SHOP Arthe Dale Bard Shop
     gosub STEAL %AD.Bard
     gosub MOVE out
ARTHE.TIME.0:
     if ($Time.isDay = 1) then goto ARTHE.TO.ARMOR
     if ($Time.isDay = 0) then goto ARTHE.EXP.CHECK.2
     gosub TIME.CHECK
     if ("%TIME" = "NIGHT") then goto ARTHE.EXP.CHECK.2
ARTHE.TO.ARMOR:
     var LAST ARTHE.EXP.CHECK.2
     gosub AUTOMOVE Armor
ARTHE.ARMOR:
     var shopcode AD.Arm
     var SHOP Arthe Dale Armor Shop
     gosub STEAL %AD.Arm
ARTHE.EXP.CHECK.2:
     if $Thievery.Ranks >= 300 then goto ARTHE.TO.YULUGRI
ARTHE.TO.FETA:
     var LAST ARTHE.TO.YULUGRI
     gosub AUTOMOVE feta
ARTHE.FETA:
     var shopcode AD.Feta
     var itemLocation %AD.FETA.Loc
     var SHOP Arthe Dale Feta's Kitchen
     gosub STEAL %AD.Feta
ARTHE.TO.YULUGRI:
     var LAST ARTHE.EXP.CHECK.3
     gosub AUTOMOVE Yulugri
ARTHE.YULUGRI:
     var shopcode AD.Map
     var SHOP Arthe Dale Yulugri
     gosub STEAL %AD.Map
ARTHE.EXP.CHECK.3:
     if $Thievery.Ranks >= 300 then goto LEAVE.ARTHE
ARTHE.TO.SMOKE:
     var LAST ARTHE.EXP.CHECK.4
     gosub AUTOMOVE smoking
ARTHE.SMOKE:
     var shopcode AD.Smoke
     var SHOP Arthe Dale Smoke Shop
     gosub STEAL %AD.Smoke
ARTHE.EXP.CHECK.4:
     if $Thievery.Ranks >= 260 then goto LEAVE.ARTHE
     if $Thievery.Ranks >= 220 then goto ARTHE.EXP.CHECK.7
ARTHE.TO.TART:
     var LAST ARTHE.EXP.CHECK.5
     gosub AUTOMOVE 631
ARTHE.TART:
     var shopcode AD.Tart.E
     var SHOP Arthe Dale TART E
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.5:
     if $Thievery.Ranks >= 195 then goto ARTHE.EXP.CHECK.6
ARTHE.TO.TART.C:
     var LAST ARTHE.EXP.CHECK.6
     gosub AUTOMOVE 630
ARTHE.TART.C:
     var shopcode AD.Tart.C
     var SHOP Arthe Dale TART C
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.6:
     if $Thievery.Ranks >= 212 then goto ARTHE.EXP.CHECK.7
ARTHE.TO.TART.M:
     var LAST ARTHE.EXP.CHECK.7
     gosub AUTOMOVE 629
ARTHE.TART.M:
     var shopcode AD.Tart.M
     var SHOP Arthe Dale TART M
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.7:
     if $Thievery.Ranks >= 230 then goto LEAVE.ARTHE
ARTHE.TO.TART.L:
     var LAST ARTHE.EXP.CHECK.8
     gosub AUTOMOVE 628
ARTHE.TART.L:
     var shopcode AD.Tart.L
     var SHOP Arthe Dale TART L
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.8:
     if $Thievery.Ranks >= 181 then goto LEAVE.ARTHE
ARTHE.TO.TART.F:
     gosub AUTOMOVE 627
ARTHE.TART.F:
     var shopcode AD.Tart.F
     var SHOP Arthe Dale TART F
     gosub STEAL %AD.Tart.E
LEAVE.ARTHE:
     var LAST ARTHE.EXP.CHECK.9
     if $hidden = 1 then gosub unhide
     pause 0.1
ARTHE.EXP.CHECK.9:
     if $Thievery.Ranks >= 890 then goto DONE.KAERNA
ARTHE.TO.KAERNA:
     var LAST DONE.KAERNA
     gosub AUTOMOVE grek
KAERNA.GENERAL:
     var shopcode KA.Grek
     var SHOP Kaerna General
     gosub STEAL %KA.Grek
DONE.KAERNA:
     if $hidden = 1 then gosub unhide
     if ("%guild" = "Thief") then
          {
               gosub COOKIE.START meditate
          }
     pause 0.5
     goto TO.CROSSING
##################################
#### CROSSINGS
##################################
TO.CROSSING:
     var CURRENT.CITY CROSSING
     var LAST CROSSING
     gosub AUTOMOVE crossing
     gosub AUTOMOVE 152
     goto WARRANT.CHECK.CROSS
XING:
CROSS:
CROSSING:
CROSSINGS:
WARRANT.CHECK.CROSS:
     var LAST CROSSINGS
     var CURRENT.CITY CROSSING
     echo
     echo *** STEALING FROM CROSSING!
     echo
     if matchre("$roomobjs","(town guard)") then put surrender guard
     pause 0.5
CROSSING.EXP.CHECK.0:
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 30) then goto GO.CROSS.PAWN
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
     pause 0.2
CROSSING.TO.SCRIPT:
     var CURRENT.CITY CROSSING
     var LAST CROSSING.EXP.CHECK.1
     gosub AUTOMOVE Temple
     gosub AUTOMOVE Script
CROSSING.SCRIPTORIUM:
     var shopcode C.Script
     var SHOP Crossing Scriptorium
     gosub STEAL %C.Script.Num %C.Script
     if $hidden then gosub unhide
     gosub AUTOMOVE cross
     gosub MOVE ne
     gosub MOVE nw
CROSSING.EXP.CHECK.1:
     if $Thievery.Ranks >= 487 then goto CROSSING.EXP.CHECK.2
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.CARD:
     var LAST CROSSING.EXP.CHECK.2
     gosub AUTOMOVE Card shop
CROSSING.CARD:
     var shopcode C.Card
     var SHOP Crossing Card Shop
     gosub STEAL %C.Card
CROSSING.EXP.CHECK.2:
     if $Thievery.Ranks >= 400 then goto CROSSING.EXP.CHECK.3
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.CLOTHING:
     var LAST CROSSING.EXP.CHECK.3
     if $Thievery.LearningRate > 33 then goto GO.CROSS.PAWN
     gosub AUTOMOVE clothing
CROSSING.CLOTHING:
     var shopcode C.Stitch
     var SHOP Crossing Clothing Shop
     gosub STEAL %C.Stitch
CROSSING.EXP.CHECK.3:
     if $Thievery.Ranks >= 655 then goto CROSSING.EXP.CHECK.4
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.JEWELRY:
     var LAST CROSSING.EXP.CHECK.4
     gosub AUTOMOVE jewel
CROSSING.JEWELRY:
     var shopcode C.Jewel
     var SHOP Crossing Jewelry Shop
     gosub STEAL %C.Jewel
CROSSING.EXP.CHECK.4:
     if $Thievery.Ranks >= 750 then goto CROSSING.EXP.CHECK.5
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.GENERAL:
     var LAST CROSSING.EXP.CHECK.5
     gosub AUTOMOVE General
CROSSING.GENERAL:
     var shopcode C.Gen
     var SHOP Crossing General Store
     gosub STEAL %C.Gen
CROSSING.EXP.CHECK.5:
     if $Thievery.Ranks >= 481 then goto CROSSING.EXP.CHECK.6
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.CLERIC:
     var LAST CROSSING.EXP.CHECK.6
     gosub AUTOMOVE duran
CROSSING.CLERIC:
     var shopcode C.Cler
     var SHOP Crossing Cleric Shop
     gosub STEAL %C.Cler
CROSSING.EXP.CHECK.6:
     if matchre("%guild","Cleric") && ($Thievery.Ranks >= 487) then goto CROSSING.TO.CLERIC2
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
     goto CROSSING.EXP.CHECK.7
CROSSING.TO.CLERIC2:
     var LAST CROSSING.EXP.CHECK.7
     gosub AUTOMOVE 957
CROSSING.CLERIC2:
     var shopcode C.Cler2
     var SHOP Crossing Cleric2 Shop
     gosub STEAL %C.Cler2
CROSSING.EXP.CHECK.7:
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
     if $Thievery.Ranks >= 520 then goto CROSSING.TO.MUSIC
CROSSING.TO.BATH:
     var LAST CROSSING.TO.LOCK
     gosub AUTOMOVE bathhouse
CROSSING.BATHHOUSE:
     var shopcode C.Bath
     var SHOP Crossing Bathhouse
     var itemLocation %C.Bath.Loc
     gosub STEAL %C.Bath.Num %C.Bath
CROSSING.TO.LOCK:
     var itemLocation
     var LAST CROSSING.TO.MUSIC
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 250 then goto CROSSING.TO.MUSIC
     gosub AUTOMOVE locks
CROSSING.LOCKSMITH:
     var shopcode C.Lock
     var SHOP Crossing Locksmith
     gosub STEAL %C.Lock
CROSSING.TO.MUSIC:
     var LAST CROSSING.TO.MUSIC.BACKROOM
     gosub AUTOMOVE Music
CROSSING.EXP.CHECK.8:
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
     if $Thievery.Ranks >= 600 then goto CROSSING.TO.MUSIC.BACKROOM
CROSSING.MUSIC:
     var shopcode C.Music
     var SHOP Crossing Music Shop
     gosub STEAL %C.Music
CROSSING.TO.MUSIC.BACKROOM:
     var LAST CROSSING.TO.ARMOR
     if $hidden then gosub unhide
     gosub MOVE go curtain
CROSSING.MUSIC.BACKROOM:
     var shopcode C.Music2
     var SHOP Xing music shop backroom
     var LAST CROSSING.TO.ARMOR
     gosub STEAL %C.Music2
     gosub MOVE go curtain
CROSSING.TO.ARMOR:
     var LAST CROSSING.TO.WEAPON
     gosub AUTOMOVE Armor
CROSSING.ARMOR:
     var shopcode C.Arm
     var SHOP Crossing Armor Shop
     gosub STEAL %C.Arm
CROSSING.TO.WEAPON:
     var LAST CROSSING.EXP.CHECK.9
     gosub AUTOMOVE Weapon
CROSSING.WEAPON:
     var shopcode C.Weap
     var SHOP Crossing Weapon Shop
     gosub STEAL %C.Weap
CROSSING.EXP.CHECK.9:
     if $Thievery.Ranks >= 350 then goto CROSSING.EXP.CHECK.10
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.FLORIST:
     var LAST CROSSING.EXP.CHECK.10
     gosub AUTOMOVE Florist
CROSSING.FLORIST:
     var shopcode C.Flow
     var SHOP Crossing Florist
     gosub STEAL %C.Flow
CROSSING.EXP.CHECK.10:
     if $Thievery.Ranks >= 300 then goto CROSSING.TO.EMPATH
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.SHOE:
     var LAST CROSSING.TO.EMPATH
     gosub AUTOMOVE Shoe
CROSSING.SHOES:
     var shopcode C.Cobb
     var SHOP Crossing Shoe Shop
     gosub STEAL %C.Cobb
CROSSING.TO.EMPATH:
     var LAST CROSSING.TO.EMPATH2
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
     if !matchre("%guild","(Thief|Empath|Trader)") then goto CROSSING.EXP.CHECK.11
     gosub AUTOMOVE Emmiline
CROSSING.EMPATH:
     var shopcode C.Empath
     var SHOP Crossing Empath Shop
     var SECOND.ITEM 1
     var secondary %C.Empath.Alt
     gosub STEAL %C.Empath
CROSSING.TO.EMPATH2:
     var LAST CROSSING.TO.EMPATH3
     gosub MOVE w
CROSSING.EMPATH2:
     var shopcode C.Empath2
     var SHOP Crossing Empath Shop 2
     gosub STEAL %C.Empath2
CROSSING.TO.EMPATH3:
     var LAST CROSSING.EXP.CHECK.11
     gosub MOVE e
     gosub MOVE go arch
CROSSING.EMPATH3:
     var shopcode C.Empath3
     var SHOP Crossing Empath Shop 3
     var SECOND.ITEM 1
     var itemLocation %C.Empath3.Loc
     var secondary %C.Empath3.Alt
     gosub STEAL %C.Empath3
     gosub MOVE go arch
     gosub MOVE go door
     gosub MOVE go step
CROSSING.EXP.CHECK.11:
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
     if $Thievery.Ranks >= 334 then goto CROSSING.TO.ALCHEMY
CROSSING.TO.HERBS:
     var LAST CROSSING.TO.ALCHEMY
     gosub AUTOMOVE Herb
CROSSING.HERBS:
     var shopcode C.Herb
     var SHOP Crossing Herb Shop
     gosub STEAL %C.Herb
CROSSING.TO.ALCHEMY:
     if $Thievery.Ranks >= 1050 then goto CROSSING.EXP.CHECK.13
     var LAST CROSSING.EXP.CHECK.12
     gosub AUTOMOVE Chizil
CROSSING.ALCHEMY:
     var shopcode C.Alch
     var SHOP Crossing Alchemy Shop
     gosub STEAL %C.Alch
CROSSING.EXP.CHECK.12:
     if $Thievery.Ranks >= 640 then goto CROSSING.EXP.CHECK.13
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.TANNER:
     var LAST CROSSING.EXP.CHECK.13
     if $hidden then gosub unhide
     gosub AUTOMOVE tanner
CROSSING.TANNER:
     var shopcode C.Tann
     var SHOP Crossing Tanner
     var itemLocation %C.Tann.Loc
     gosub STEAL %C.Tann
CROSSING.EXP.CHECK.13:
     if $Thievery.Ranks >= 670 then goto CROSSING.TO.ARTIFICE
     if ($Thievery.LearningRate > 33) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 33) && ($Stealth.LearningRate > 25) then goto GO.CROSS.PAWN
CROSSING.TO.HABER:
     var LAST CROSSING.TO.ARTIFICE
     gosub AUTOMOVE haber
CROSSING.HABERDASHERY:
     var shopcode C.Haber
     var SHOP Crossing Haberdashery
     gosub STEAL %C.Haber
CROSSING.TO.ARTIFICE:
     var LAST GO.CROSS.PAWN
     if $Thievery.Ranks >= 975 then goto GO.CROSS.PAWN
     gosub AUTOMOVE magic
CROSSING.ARTIFICER:
     var shopcode C.Artif
     var SHOP Crossing Artificer
     gosub STEAL %C.Artif
GO.PAWN.CROSS:
GO.CROSS.PAWN:
     var CURRENT.CITY CROSSING
     var LAST GO.CROSS.PAWN
     if $hidden then gosub unhide
     if ("%guild" = "Thief") then send khri stop
     if ("%PAWN" = "OFF") && ("%guild" = "Thief") then goto GO.CROSS.BIN
     gosub AUTOMOVE pawn
     gosub PAWN.GOODS
     if ("%BIN" = "OFF") then goto DONE.STEALING.CROSS2
## TO THIEF GUILD
GO.CROSS.BIN:
     var LAST GO.CROSS.BIN
     gosub AUTOMOVE 78
     goto GO.BIN.CONT

##OLD SAND SPIT METHOD
     #gosub AUTOMOVE sand spit tavern
     #gosub MOVE go back area
     #gosub MOVE climb ladder
     #if matchre("$roomobjs" , "^You also see a witchclaw door with a large stone archway, a dark yew door, some old barrels, a rickety ladder and an old barrel with a thieves guild sign carved into the side") then
          {
               gosub MOVE go other barrel
               goto GO.BIN.CONT
          }
     #if matchre("$roomobjs" , "^You also see some old barrels") then
          {
               gosub MOVE go other barrel
               goto GO.BIN.CONT
          }
     #if matchre("$roomobjs" , "^You also see an old barrel with a thieves guild sign") then
          {
               gosub MOVE go barrel
               goto GO.BIN.CONT
          }
GO.BIN.CONT:
     gosub AUTOMOVE bin
     gosub BIN.GOODS
DONE.STEALING.CROSS:
     var LAST DONE.STEALING.CROSS
     gosub MOVE go door
     gosub CIRCLE.CHECK
     pause 0.5
     gosub MOVE go door
# Leaving the THIEF GUILD
DONE.STEALING.CROSS2:
     var LAST DONE.STEALING.CROSS2
     if ("%PREMIUM" = "ON") then goto CROSS.PREMIUM
     gosub AUTOMOVE exchange
     gosub KRONARS
     goto CROSS.TELLER
CROSS.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub KRONARS
CROSS.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     send with 10 silver
     gosub MOVE out
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub MOVE out
CROSSING.DECIDE:
     if ($roomid != 42) then gosub AUTOMOVE 42
     if ("%SINGLE.RUN" = "ON") then goto FINISHED.SCRIPT
     if ($Thievery.LearningRate >= 30) then goto FINISHED.SCRIPT
     if ("%CITY" = "SHARD") || ("%CITY" = "HIB") || ("%CITY" = "CROSSING") || ("%CITY" = "LETH") && ($Thievery.LearningRate < 30) then goto TRAVEL.HAVEN
     if ("%CITY" = "RIVERHAVEN") || ("%CITY" = "ROSSMAN") || ("%CITY" = "THEREN") && ($Thievery.LearningRate < 30) then goto HEAD.TO.LETH
     goto HEAD.TO.LETH
#####################################
## LETH DERIEL
#####################################
HEAD.TO.LETH:
     var CURRENT.CITY LETH
     var LAST HEAD.TO.LETH
     if ($zoneid = 1) && ($roomid != 42) then gosub AUTOMOVE 42
     send .%TRAVEL.SCRIPT leth
     waitforre ^YOU HAVE ARRIVED
LETH.STEAL:
WARRANT.CHECK.LETH:
     var LAST WARRANT.CHECK.LETH
     if matchre("$roomobjs","(Elven Warden)") then put surrender warden
     pause 0.5
     echo
     echo *** STEALING FROM LETH DERIEL!
     echo
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
LETH.EXP.CHECK.0:
     if $Thievery.LearningRate > 33 then goto DONE.STEALING.LETH
     if $Thievery.Ranks >= 520 then goto LETH.TO.BOWYER
LETH.TO.SKIN:
     var LAST LETH.TO.BOWYER
     gosub AUTOMOVE morik
LETH.SKIN.SHOP:
     var shopcode L.Skin
     var SHOP Leth Skin Shop
     gosub STEAL %L.Skin
LETH.TO.BOWYER:
     var LAST LETH.TO.ORIGAMI
     gosub AUTOMOVE Bow
LETH.BOWYER:
     var shopcode L.Bow
     var SHOP Leth Bowyer
     gosub STEAL %L.Bow
LETH.TO.ORIGAMI:
     var LAST LETH.EXP.CHECK.1
     gosub AUTOMOVE Origami
LETH.ORIGAMI.SHOP:
     var shopcode L.Orig
     var SHOP Leth Origami
     gosub STEAL %L.Orig.Num %L.Orig
LETH.EXP.CHECK.1:
     if $Thievery.LearningRate > 33 then goto DONE.STEALING.LETH
     if ($Thievery.Ranks > 400) then goto LETH.TO.WEAPON
     goto LETH.EXP.CHECK.2
LETH.TO.WEAPON:
     var LAST LETH.EXP.CHECK.2
     if $hidden then gosub unhide
     gosub AUTOMOVE weapon
LETH.WEAPON.SHOP:
     var shopcode L.Weap
     var SHOP Leth Weapon Shop
     gosub STEAL %L.Weap
LETH.EXP.CHECK.2:
     if $Thievery.Ranks >= 487 then goto LETH.TO.BARD2
LETH.TO.WICKER:
     var LAST LETH.EXP.CHECK.3
     gosub AUTOMOVE Wicker
LETH.WICKER.SHOP:
     var shopcode L.Wick
     var SHOP Leth Wicker Shop
     gosub STEAL %L.Wick
LETH.EXP.CHECK.3:
     if $Thievery.LearningRate > 33 then goto DONE.STEALING.LETH
     if $Thievery.Ranks >= 300 then goto LETH.TO.BARD2
LETH.TO.BARD:
     var LAST LETH.TO.BARD2
     gosub AUTOMOVE music
LETH.BARD.SHOP:
     var shopcode L.Bard
     var SHOP Leth Bard Shop
     gosub STEAL %L.Bard
LETH.TO.BARD2:
     var LAST LETH.EXP.CHECK.4
     if $Thievery.Ranks > 980 then goto LETH.EXP.CHECK.4
     gosub AUTOMOVE siny
LETH.BARD.SHOP2:
     var shopcode L.Bard2
     var SHOP Leth Bard2 Shop
     gosub STEAL %L.Bard2
LETH.EXP.CHECK.4:
     if $Thievery.LearningRate > 33 then goto DONE.STEALING.LETH
     if $Thievery.Ranks >= 700 then goto LETH.TO.WOOD
LETH.TO.CLOTHES:
     var LAST LETH.TO.WOOD
     gosub AUTOMOVE Clothing
LETH.CLOTHES.SHOP:
     var shopcode L.Cloth
     var SHOP Leth Clothes Shop
     gosub STEAL %L.Cloth
     if $hidden then gosub unhide
LETH.TO.WOOD:
     var LAST LETH.TO.GENERAL
     if $hidden then gosub unhide
     gosub AUTOMOVE wood
LETH.WOOD.SHOP:
     var shopcode L.Wood
     var SHOP Leth Wood Shop
     gosub STEAL %L.Wood
LETH.TO.GENERAL:
     var LAST LETH.EXP.CHECK.5
     gosub AUTOMOVE General
LETH.GENERAL.STORE:
     var shopcode L.Gen
     var SHOP Leth General Store
     var SECOND.ITEM 1
     var secondary %L.Gen.Alt
     gosub STEAL %L.Gen
LETH.EXP.CHECK.5:
     if $Thievery.LearningRate > 33 then goto DONE.STEALING.LETH
     if $Thievery.Ranks >= 465 then goto DONE.STEALING.LETH
LETH.TO.PERFUME:
     var LAST DONE.STEALING.LETH
     gosub AUTOMOVE Perfume
LETH.PERFUME.SHOP:
     var shopcode L.Perf
     var SHOP Leth Perfume Shop
     gosub STEAL %L.Perf
DONE.STEALING.LETH:
DONE.STEALING.LETH.BANK:
     var LAST DONE.STEALING.LETH
     gosub AUTOMOVE exchange
     gosub KRONARS
LETH.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     gosub AUTOMOVE portal
PAWN.LETH:
     send .%TRAVEL.SCRIPT cross
     waitforre ^YOU HAVE ARRIVED
GO.LETH.PAWN:
     var CURRENT.CITY LETH
     var LAST GO.LETH.PAWN
     if $hidden then gosub unhide
     if ("%guild" = "Thief") then send khri stop
     pause 0.5
     if ("%PAWN" = "OFF") then goto GO.LETH.BIN
     gosub AUTOMOVE PAWN
     gosub PAWN.GOODS
     if ("%BIN" = "OFF") then goto DONE.STEALING.LETH3
     if ("%guild" != "Thief") then goto DONE.STEALING.LETH3
GO.LETH.BIN:
     var LAST GO.LETH.BIN
     gosub AUTOMOVE sand spit tavern
     gosub MOVE go back area
     gosub MOVE climb ladder
     if matchre("$roomobjs" , "^You also see some old barrels") then gosub MOVE go other barrel
     else gosub MOVE go barrel
     gosub AUTOMOVE bin
     gosub BIN.GOODS
DONE.STEALING.LETH2:
     var LAST DONE.STEALING.LETH2
     # Leaving the THIEF GUILD
     gosub MOVE go door
     send ask kalag about experience
     pause 0.5
     gosub MOVE go door
DONE.STEALING.LETH3:
     var LAST DONE.STEALING.LETH3
     gosub AUTOMOVE exchange
     gosub KRONARS
LETH3.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
LETH.DECIDE:
     if ($zoneid = 1) && ($roomid != 42) then gosub AUTOMOVE 42
     if ("%SINGLE.RUN" = "ON") then goto FINISHED.SCRIPT
     if $Thievery.LearningRate > 32 then goto FINISHED.SCRIPT
     if ("%CITY" = "CROSSING") || ("%CITY" = "RIVERHAVEN") || ("%CITY" = "ROSSMAN") || ("%CITY" = "THEREN") && ($Thievery.LearningRate < 30) then goto TO.SHARD
     if ("%CITY" = "SHARD") || ("%CITY" = "LETH") || ("%CITY" = "HIB") && ($Thievery.LearningRate < 30) then goto ARTHE.STEAL
     goto FINISHED.SCRIPT
############################################################################
## ILLITHI STEALING SECTION (SHARD / HIB / BOAR CLAN ETC                  ##
############################################################################
TO.SHARD:
     var LAST TO.SHARD
     if ("%guild" = "Thief") then send khri stop
     pause 0.5
     if ($zoneid = 61) && ($roomid != 18) then gosub AUTOMOVE 18
     send .%TRAVEL.SCRIPT shard
     waitforre ^YOU HAVE ARRIVED
OUTSIDE.SHARD:
     var LAST OUTSIDE.SHARD
     gosub AUTOMOVE east
     pause 0.5
     if ($zoneid = 66) then send go gate
SHARD.STEAL:
SHARD.STEALING:
WARRANT.CHECK.SHARD:
     var LAST SHARD.STEAL
     var CURRENT.CITY SHARD
     if matchre("$roomobjs","(Shard sentinel)") then put surrender sentin
     pause 0.5
     echo
     echo *** STEALING FROM SHARD!
     echo
     pause 0.5
     gosub TIME.CHECK
     if ("%TIME" = "NIGHT") then put #echo >Log Yellow *** Night time! Many shops closed. Reduced stealing. Much doh!
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
SHARD.TO.GENERAL:
     var LAST SHARD.TIME.0
     gosub AUTOMOVE general
SHARD.GENERAL:
     var shopcode S.Gen
     var SHOP Shard General Store
     gosub STEAL %S.Gen
	gosub PUT go door
SHARD.TIME.0:
     if ($Time.isDay = 0) then goto SHARD.TO.CLERIC
     if ($Time.isDay = 1) then goto SHARD.TO.WEAPON
     if ("%TIME" = "NIGHT") then goto SHARD.TO.CLERIC
SHARD.TO.WEAPON:
     var LAST SHARD.EXP.CHECK.0
     gosub AUTOMOVE fiona
SHARD.WEAPON:
     var shopcode S.Weap
     var SHOP Shard Weapon Shop
     gosub STEAL %S.Weap
SHARD.EXP.CHECK.0:
     if $Thievery.Ranks >= 555 then goto SHARD.TO.CLERIC
SHARD.TO.CLOTHING:
     var LAST SHARD.TO.CLERIC
     gosub AUTOMOVE stitchery
SHARD.CLOTHING:
     var shopcode S.Stitch
     var SHOP Shard Stitchery
     gosub STEAL %S.Stitch
SHARD.TO.CLERIC:
     var LAST SHARD.TO.ALCHEMIST
     if $Thievery.Ranks >= 400 then goto SHARD.TO.ALCHEMIST
     gosub AUTOMOVE cleric shop
SHARD.CLERIC:
     var shopcode S.Cleric
     var SHOP Shard Cleric Shop
     gosub STEAL %S.Cleric
SHARD.TO.ALCHEMIST:
     if $Thievery.Ranks >= 1050 then goto SHARD.EXP.CHECK.1
     var LAST SHARD.TO.SHARD.EXP.CHECK.1
     gosub AUTOMOVE zieq
SHARD.ALCHEMIST:
     var shopcode S.Alch
     var SHOP Shard Alchemist
     gosub STEAL %S.Alch
SHARD.EXP.CHECK.1:
     if $Thievery.Ranks >= 334 then goto SHARD.TIME.1
     if $Thievery.LearningRate > 33 then goto GO.PAWN.SHARD
SHARD.TO.HERB:
     var LAST SHARD.TIME.1
     gosub AUTOMOVE herb
SHARD.HERB:
     var shopcode S.Herb
     var SHOP Shard Herb
     gosub STEAL %S.Herb
     gosub MOVE out
SHARD.TIME.1:
     if ($Time.isDay = 0) then goto SHARD.TO.REED
     if ($Time.isDay = 1) then goto SHARD.TO.ARTIFICER
     if ("%TIME" = "NIGHT") then goto SHARD.TO.REED
SHARD.TO.ARTIFICER:
     var LAST SHARD.TIME.2
     gosub AUTOMOVE magic
SHARD.ARTIFICER:
     var shopcode S.Artif
     var SHOP Shard Artificer
     gosub STEAL %S.Artif
     send out
     pause 0.5
SHARD.TIME.2:
     if ("%TIME" = "NIGHT") then goto SHARD.TO.ARMORY
SHARD.TO.MUSIC:
     var LAST SHARD.TO.LOCK
     gosub AUTOMOVE music
SHARD.MUSIC:
     var shopcode S.Music
     var SHOP Shard Music Shop
     gosub STEAL %S.Music
SHARD.TO.LOCK:
     var LAST SHARD.TIME.3
     if ($invisible = 1) then gosub stopinvis
	pause 0.1
	if ($invisible = 1) then gosub stopinvis
     gosub PUT ask malik about thieves
     gosub PUT order pick
     pause 0.001
     gosub PUT offer 999999999
     gosub PUT offer 999999999
     pause 0.5
	pause 0.1
     gosub STAND
SHARD.LOCK:
     var shopcode S.Lock
     var SHOP Shard Lockpick Shop
     gosub STEAL %S.Lock
     gosub PUT go trap
     pause 0.5
SHARD.TIME.3:
     if ("%TIME" = "NIGHT") then goto SHARD.TO.REED
SHARD.TO.ARMORY:
     var LAST SHARD.TO.REED
     gosub AUTOMOVE armor
SHARD.ARMORY:
     var shopcode S.Armor
     var SHOP Shard Armory
     gosub STEAL %S.Armor
SHARD.TO.REED:
     var LAST SHARD.TO.SCHOLAR
     gosub AUTOMOVE 593
SHARD.REED:
     var shopcode S.Reed
     var SHOP Shard Reed
     gosub STEAL %S.Reed.Num %S.Reed
SHARD.TO.SCHOLAR:
     var LAST SHARD.TIME.4
     gosub AUTOMOVE scholar
SHARD.SCHOLAR:
     var shopcode S.Museum
     var SHOP Shard Scholar's Museum Gift Shop
     gosub STEAL %S.Museum
SHARD.TIME.4:
     if ("%TIME" = "NIGHT") then goto SHARD.EXP.CHECK.2
SHARD.TO.BOWS:
     var LAST SHARD.EXP.CHECK.2
     gosub AUTOMOVE bows
SHARD.BOWS:
     var shopcode S.Bow
     var SHOP Shard Bowyer
     gosub STEAL %S.Bow
     gosub MOVE out
SHARD.EXP.CHECK.2:
     if $Thievery.Ranks < 200 then goto SHARD.TO.COIN
     if $Thievery.LearningRate > 33 then goto GO.PAWN.SHARD
SHARD.TO.SPIRE:
     var LAST SHARD.TO.COIN
     gosub AUTOMOVE spire
SHARD.SPIRE:
     var shopcode S.Spire
     var SHOP Spires of Glory
     gosub STEAL %S.Spire
SHARD.TO.COIN:
     if $Thievery.Ranks > 500 then goto SHARD.TO.TOKEN
     var LAST SHARD.TO.TOKEN
     gosub AUTOMOVE coin
SHARD.COIN:
     var shopcode S.Coin
     var SHOP Coin of the Realm
     var itemLocation %S.Coin.Loc
     gosub STEAL %S.Coin
SHARD.TO.TOKEN:
     var LAST SHARD.TO.BARBER
     gosub AUTOMOVE token
SHARD.TOKEN:
     var shopcode S.Token
     var SHOP Token Shop
     gosub STEAL %S.Token
SHARD.TO.BARBER:
     if $Thievery.Ranks > 950 then goto SHARD.TO.FRILLS
     var LAST SHARD.TO.FRILLS
     gosub AUTOMOVE barber
SHARD.BARBER:
     var shopcode S.Barber
     var SHOP Shard Barber Shop
     gosub STEAL %S.Barber
SHARD.TO.FRILLS:
     if $Thievery.Ranks >= 1050 then goto SHARD.TO.HERALDRY
     var LAST SHARD.TO.HERALDRY
     gosub AUTOMOVE Little
SHARD.FRILLS:
     var shopcode S.Frill
     var SHOP Shard Little Frills
     gosub STEAL %S.Frill
SHARD.TO.HERALDRY:
     var LAST SHARD.TO.GIFT
     gosub AUTOMOVE herald
SHARD.HERALDRY:
     var shopcode S.Herald
     var SHOP Shard Heraldry Shop
     var itemLocation %S.Herald.Loc
     gosub STEAL %S.Herald
SHARD.TO.GIFT:
     var LAST SHARD.TO.TOY
     gosub AUTOMOVE gift
SHARD.GIFT:
     var shopcode S.Gift
     var SHOP Shard Gift Shop
     var itemLocation %S.Gift.Loc
     gosub STEAL %S.Gift
SHARD.TO.TOY:
     if $Thievery.Ranks >= 1050 then goto SHARD.TO.MEMORY
     var LAST SHARD.TO.MEMORY
     gosub AUTOMOVE toy
SHARD.TOY:
     var shopcode S.Toy
     var SHOP Shard Toy Shop
     var itemLocation %S.Toy.Loc
     gosub STEAL %S.Toy
SHARD.TO.MEMORY:
     var LAST SHARD.TO.EASTGATE
     gosub AUTOMOVE 629
SHARD.MEMORY:
     var shopcode S.Memory
     var SHOP Shard Memories
     gosub STEAL S.Memory.Num %S.Memory
SHARD.TO.EASTGATE:
     var LAST SHARD.TO.EASTGATE
     if $Thievery.LearningRate > 33 then goto GO.PAWN.SHARD
     if $hidden then gosub unhide
     gosub AUTOMOVE East Gate
SHARD.EXP.CHECK.3:
     if $Thievery.Ranks >= 600 then goto SHARD.TO.SURVIVAL
EASTGATE.TO.TANNER:
     gosub AUTOMOVE tanner
SHARD.TANNER:
     var shopcode S.Tanner
     var SHOP Shard Tanner
     gosub STEAL %S.Tanner
SHARD.TO.SURVIVAL:
     var LAST GO.PAWN.SHARD
     if $hidden then gosub unhide
     gosub AUTOMOVE survival
SHARD.SURVIVAL:
     var shopcode S.Surv
     var SHOP Shard Survival
     var itemLocation %S.Surv.Loc
     var SECOND.ITEM 1
     var secondary %S.Surv.Alt
     gosub STEAL %S.Surv
SHARD.TO.SURVIVAL2:
     gosub AUTOMOVE 33
SHARD.SURVIVAL2:
     var shopcode S.Surv2
     var SHOP Shard Survivalist Shop (Back room)
     var itemLocation %S.Surv2.Loc
     var SECOND.ITEM 1
     var secondary %S.Surv2.Alt
     gosub STEAL %S.Surv2
     goto DONE.STEAL.SHARD
TO.STEELCLAW.WEAPON:
     if $hidden then gosub unhide
     pause 0.5
     gosub AUTOMOVE weapon
STEELCLAW.WEAPON:
     var shopcode SC.Weap
     var SHOP SteelClaw Clan Weapons
     gosub STEAL %SC.Weap
DONE.STEAL.SHARD:
var LAST GO.PAWN.SHARD
     if $hidden then gosub unhide
     if ("%guild" = "Thief") then send khri stop
     pause 0.5
     gosub AUTOMOVE East
GO.PAWN.SHARD:
     var CURRENT.CITY SHARD
     var LAST GO.PAWN.SHARD
     if ("%PAWN" = "OFF") then goto GO.BIN.SHARD
     gosub AUTOMOVE PAWN
     gosub PAWN.GOODS
SHARD.BIN.DECIDE:
     if ("%BIN" = "OFF") then goto SHARD.TO.BANK
GO.BIN.SHARD:
     var LAST GO.BIN.SHARD
     gosub AUTOMOVE 93
     gosub MOVE go well
     gosub MOVE climb ladder
     gosub MOVE w
     gosub MOVE out
     gosub MOVE w
     gosub MOVE se
     gosub MOVE go gap
     send knock door
     pause 0.5
     send '%SHARD.PW
     pause 0.5
     gosub MOVE go door
     gosub MOVE go arch
     gosub MOVE s
AT.SHARD.BIN:
     gosub BIN.GOODS
DONE.STEALING.SHARD:
     var LAST DONE.STEALING.SHARD
     gosub CIRCLE.CHECK
     pause 0.5
     gosub MOVE n
     gosub MOVE go arch
     gosub MOVE go door
     gosub MOVE n
     gosub MOVE nw
     gosub MOVE e
     gosub MOVE go fiss
     gosub MOVE e
     gosub MOVE climb ladder
     gosub MOVE up
SHARD.TO.BANK:
     var LAST SHARD.TO.BANK
     gosub AUTOMOVE exchange
     gosub DOKORAS
SHARD.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     send with 5 silver
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub AUTOMOVE exchange
     send exch all dok for kro
DONE.SHARD:
     if ("%CITY" = "CROSSING") || ("%CITY" = "RIVERHAVEN") || ("%CITY" = "ROSSMAN") || ("%CITY" = "THEREN") then goto FINISHED.SCRIPT
     if ($Thievery.LearningRate > 30) then goto FINISHED.SCRIPT
     if ("%SINGLE.RUN" = "ON") then goto FINISHED.SCRIPT
SHARD.TO.CROSS:
     var LAST SHARD.TO.CROSS
     if ("%CITY" = "SHARD") || ("%CITY" = "HIB") then
          {
               gosub AUTOMOVE E Gate
               gosub AUTOMOVE 65
          }
     goto HEAD.TO.LETH
GO.TO.CROSS:
     var LAST GO.TO.CROSS
     var BIN.CROSS 1
     var CITY CROSS
     gosub AUTOMOVE E Gate
     gosub AUTOMOVE 65
     pause 0.5
     send .%TRAVEL.SCRIPT cross
     waitforre ^YOU HAVE ARRIVED
     pause
     if ("%CITY" = "CROSSING") || ("%CITY" = "RIVERHAVEN") || ("%CITY" = "ROSSMAN") || ("%CITY" = "THEREN") then goto FINISHED.SCRIPT
     goto TO.ARTHE
GO.TO.HIB:
     var LAST GO.TO.HIB
     var BIN.HIB 1
     var CITY HIB
     gosub AUTOMOVE E Gate
     gosub AUTOMOVE 65
     pause 0.5
     send .%TRAVEL.SCRIPT hib
     waitforre ^YOU HAVE ARRIVED
####################################
# Hibarnhvidar
####################################
HIB.STEAL:
HIB.TO.SHIELD:
     var CURRENT.CITY HIB
     var LAST HIB.EXP.CHECK.0
     echo
     echo **** STEALING FROM HIB! ****
     echo
     pause 0.5
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub AUTOMOVE shield
HIB.SHIELD:
     var shopcode H.Shield
     var SHOP Hib Shield Shop
     gosub STEAL %H.Shield
HIB.EXP.CHECK.0:
     if $Thievery.Ranks < 600 then goto HIB.TO.TOGGERY
HIB.TO.JEWELRY:
     var LAST HIB.TO.TOGGERY
     gosub AUTOMOVE jewelry
HIB.JEWELRY:
     var shopcode H.Jewel
     var SHOP Hib Jewelry
     gosub STEAL %H.Jewel
HIB.TO.TOGGERY:
     var LAST HIB.TO.SUNDRIES
     gosub AUTOMOVE togger
HIB.TOGGERY:
     var shopcode H.Tog
     var SHOP Hib Toggery
     gosub STEAL %H.Tog
HIB.TO.SUNDRIES:
     var LAST HIB.TO.LAMPS
     gosub AUTOMOVE general
HIB.SUNDRIES:
     var shopcode H.Sund
     var SHOP Hib Sundries
     gosub STEAL %H.Sund
     gosub MOVE OUT
HIB.TO.LAMPS:
     var LAST HIB.EXP.CHECK.1
     gosub AUTOMOVE lamp
HIB.LAMPS:
     var shopcode H.Lamp
     var SHOP Hib Lamps
     gosub STEAL %H.Lamp
HIB.EXP.CHECK.1:
     if $Thievery.Ranks >= 460 then goto HIB.TO.MUSIC
HIB.TO.HERBS:
     var LAST HIB.TO.MUSIC
     gosub AUTOMOVE herb
HIB.HERBS:
     var shopcode H.Herb
     var SHOP Hib Herbs
     gosub STEAL %H.Herb
HIB.TO.MUSIC:
     var LAST HIB.TO.ALCHEMY
     gosub AUTOMOVE music
HIB.MUSIC:
     var shopcode H.Music
     var SHOP Hib Music Store
     gosub STEAL %H.Music
HIB.TO.ALCHEMY:
     var LAST HIB.EXP.CHECK.2
     gosub AUTOMOVE alchemy
HIB.ALCHEMY:
     var shopcode H.Alch
     var SHOP Hib Alchemist
     gosub STEAL %H.Alch
HIB.EXP.CHECK.2:
     if $Thievery.Ranks >= 430 then goto LEAVE.HIB
HIB.TO.FORGE:
     var LAST LEAVE.HIB
     gosub AUTOMOVE forge
HIB.FORGE:
     var shopcode H.Forge
     var SHOP Hib Forge
     var itemLocation %H.Forge.Loc
     gosub STEAL %H.Forge
LEAVE.HIB:
     var LAST LEAVE.HIB
     gosub AUTOMOVE 75
     pause 0.5
     send .%TRAVEL.SCRIPT raven
     waitforre ^YOU HAVE ARRIVED
     pause 0.5
RAVEN.STEAL:
     var LAST RAVEN.EXP.CHECK.0
     gosub AUTOMOVE 179
RAVEN.GENERAL:
     var shopcode RP.Gen
     var SHOP Raven's Point General
     gosub STEAL %RP.Gen
RAVEN.EXP.CHECK.0:
     if $Thievery.Ranks >= 530 then goto RETURN.TO.SHARD
RAVEN.TO.TOBACCO:
     var LAST RETURN.TO.SHARD
     gosub AUTOMOVE 144
RAVEN.TOBACCO:
     var shopcode RP.Tobac
     var SHOP Raven's Point Tobacco
     gosub STEAL %RP.Tobac
RETURN.TO.SHARD:
     var LAST RETURN.TO.SHARD
     if $hidden then gosub unhide
     if ("%guild" = "Thief") then send khri stop
     pause 0.5
     gosub AUTOMOVE 133
     send .%TRAVEL.SCRIPT shard
     waitforre ^YOU HAVE ARRIVED
BACKINSHARD:
     var LAST BACKINSHARD
     gosub AUTOMOVE east
     goto SHARD.STEAL

####################################
# RATHA STEALING
####################################
RATHA.STEAL:
     var CURRENT.CITY RATHA
     echo
     echo **** STEALING FROM RATHA! ****
     echo
     pause 0.5
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
RATHA.EXP.CHECK.0:
     if $Thievery.Ranks < 500 then goto RATHA.TO.GENERAL
RATHA.TO.BAIT:
     var LAST RATHA.TO.GENERAL
     gosub AUTOMOVE bait
RATHA.BAIT:
     var shopcode R.Bait
     var SHOP Ratha Bait Shop
     gosub STEAL %R.Bait
RATHA.TO.GENERAL:
     var LAST RATHA.TO.HERB
     gosub AUTOMOVE general
RATHA.GENERAL:
     var shopcode R.Gen
     var SHOP Ratha General Store
     gosub STEAL %R.Gen
RATHA.TO.HERB:
     var LAST RATHA.TO.FORGE
     gosub AUTOMOVE herbalist
RATHA.HERB:
     var shopcode R.Herb
     var SHOP Ratha Herbalist
     gosub STEAL %R.Herb
RATHA.TO.FORGE:
     var LAST RATHA.TO.TAILOR
     gosub AUTOMOVE weapon
RATHA.FORGE:
     var shopcode R.Forge
     var SHOP Ratha Krrikt'k's Forge
     gosub STEAL %R.Forge
     gosub MOVE OUT
RATHA.TO.TAILOR:
     var LAST RATHA.TO.LEATHER
     gosub AUTOMOVE tailor
RATHA.TAILOR:
     var shopcode R.Tailor
     var SHOP Ratha Tailor
     gosub STEAL %R.Tailor
RATHA.TO.LEATHER:
     var LAST RATHA.TO.HAIR
     gosub AUTOMOVE leather
RATHA.LEATHER:
     var shopcode R.Leather
     var SHOP Ratha Leather
     gosub STEAL %R.Leather
RATHA.EXP.CHECK.1:
     #if $Thievery.Ranks >= 200 then goto RATHA.TO.MUSIC
RATHA.TO.HAIR:
     var LAST RATHA.TO.MUSIC
     gosub AUTOMOVE hair
RATHA.HAIR:
     var shopcode R.Hair
     var SHOP Ratha Hair Care
     gosub STEAL %R.Hair
RATHA.TO.MUSIC:
     var LAST RATHA.TO.MAGIC
     gosub AUTOMOVE music
RATHA.MUSIC:
     var shopcode R.Music
     var SHOP Ratha Music Shop
     gosub STEAL %R.Music
RATHA.TO.MAGIC:
     var LAST RATHA.TO.ORIGAMI
     gosub AUTOMOVE magic
RATHA.MAGIC:
     var shopcode R.Magic
     var SHOP Ratha Magic Supplies
     gosub STEAL %R.Magic
RATHA.TO.ORIGAMI:
     var LAST RATHA.TO.JEWELRY
     gosub AUTOMOVE origami
RATHA.ORIGAMI:
     var shopcode R.Origami
     var SHOP Ratha Origami Shop
     var itemLocation %R.Origami.LOC
     gosub STEAL %R.Origami
RATHA.TO.JEWELRY:
     var LAST RATHA.EXP.CHECK.2
     gosub AUTOMOVE jewelry
RATHA.JEWELRY:
     var shopcode R.Jewelry
     var SHOP Ratha Jewelry Shop
     gosub STEAL %R.Jewelry
RATHA.EXP.CHECK.2:
     #if $Thievery.Ranks >= 430 then goto RATHA.TO.RING
RATHA.TO.CLERIC:
     var LAST RATHA.TO.CLERIC2
     gosub AUTOMOVE divine
RATHA.CLERIC:
     var shopcode R.Cleric
     var SHOP Ratha Cleric Shop
     gosub STEAL %R.Cleric
RATHA.TO.CLERIC2:
     var LAST RATHA.TO.RING
     gosub AUTOMOVE odds
RATHA.CLERIC2:
     var shopcode R.Cleric2
     var SHOP Ratha Cleric Shop
     gosub STEAL %R.Cleric2
RATHA.TO.RING:
     var LAST GO.PAWN.RATHA
     gosub AUTOMOVE chabalu
RATHA.RING:
     var shopcode R.Ring
     var SHOP Ratha Ring Shop
     gosub STEAL %R.Ring
GO.PAWN.RATHA:
GO.RATHA.PAWN:
     var CURRENT.CITY RATHA
     var LAST GO.RATHA.PAWN
     if $hidden then gosub unhide
     if ("%guild" = "Thief") then send khri stop
     pause 0.5
     if ("%PAWN" = "OFF") then goto GO.RATHA.BIN
     gosub AUTOMOVE pawn
     gosub PAWN.GOODS
     if ("%BIN" = "OFF") then goto DONE.STEALING.RATHA2
GO.RATHA.BIN:
     var LAST GO.RATHA.BIN
     gosub AUTOMOVE chabalu
     pause 0.5
     send ask chabalu about cellar
     wait
     pause 0.5
     gosub MOVE trap door
     gosub MOVE go tunnel
     gosub MOVE west
     gosub AUTOMOVE bin
     pause 0.5
     gosub BIN.GOODS
DONE.STEALING.RATHA:
     var LAST DONE.STEALING.RATHA
     # Leaving the THIEF GUILD
     gosub CIRCLE.CHECK
     pause
DONE.STEALING.RATHA2:
     var LAST DONE.STEALING.CROSS2
     if ("%PREMIUM" = "ON") then goto RATHA.PREMIUM
     gosub AUTOMOVE 1exchange
     gosub LIRUMS
     goto RATHA.TELLER
RATHA.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub LIRUMS
RATHA.TELLER:
     gosub AUTOMOVE 1teller
     gosub BANK
     #send with 10 silver
#RATHA.SURRENDER:
     #var LAST RATHA.SURRENDER
     #gosub AUTOMOVE 1guard
     #if matchre("$roomobjs","(high guard)") then put surrender guard
     #pause 0.5
     #pause 0.5
     #gosub AUTOMOVE 252
     goto FINISHED.SCRIPT

####################################
# AESRY STEALING
####################################
AESRY.STEAL:
AESRY.TO.HERB:
     var CURRENT.CITY AESRY
     var LAST AESRY.EXP.CHECK.0
     echo
     echo **** STEALING FROM AESRY! ****
     echo
     pause 0.5
     gosub COOKIE
     if ("%guild" = "Necromancer") then gosub NECROPREP
     gosub AUTOMOVE herb
AESRY.HERB:
     var shopcode A.Herb
     var SHOP Aesry Herb Shop
     gosub STEAL %A.Herb
AESRY.EXP.CHECK.0:
     if $Thievery.Ranks < 600 then goto AESRY.TO.CLOTHING
AESRY.TO.TANNER:
     var LAST AESRY.EXP.CHECK.1
     gosub AUTOMOVE tanning
AESRY.TANNER:
     var shopcode A.Tanner
     var SHOP Aesry Tanning Supplies
     gosub STEAL %A.Tanner
AESRY.EXP.CHECK.1:
     #if $Thievery.Ranks >= 700 then goto AESRY.TO.SCRIPT
AESRY.TO.CLOTHING:
     var LAST AESRY.TO.SCRIPT
     gosub AUTOMOVE clothing
AESRY.CLOTHING:
     var shopcode A.Clothing
     var SHOP Aesry Clothing Shop
     gosub STEAL %A.Clothing
AESRY.TO.SCRIPT:
     var LAST AESRY.TO.CLERIC
     gosub AUTOMOVE script
AESRY.SCRIPT:
     var shopcode A.Script
     var SHOP Aesry Scriptorium
     gosub STEAL %A.Script
AESRY.TO.CLERIC:
     var LAST AESRY.TO.ORIGAMI
     gosub AUTOMOVE clerical
AESRY.CLERIC:
     var shopcode A.Cleric
     var SHOP Aesry Clerical Supplies
     gosub STEAL %A.Cleric
AESRY.TO.ORIGAMI:
     var LAST AESRY.TO.JEWELRY
     gosub AUTOMOVE origami
AESRY.ORIGAMI:
     var shopcode A.Origami
     var SHOP Aesry Origami Shop
     gosub STEAL %A.Origami
AESRY.TO.JEWELRY:
     var LAST AESRY.TO.MAGIC
     gosub AUTOMOVE jewelry
AESRY.JEWELRY:
     var shopcode A.Jewelry
     var SHOP Aesry Jewelry Shop
     gosub STEAL %A.Jewelry
AESRY.TO.MAGIC:
     var LAST AESRY.TO.SLINGS
     gosub AUTOMOVE magic
AESRY.MAGIC:
     var shopcode A.Magic
     var SHOP Aesry Magic Supplies
     gosub STEAL %A.Magic
AESRY.TO.SLINGS:
     var LAST AESRY.TO.PUZZLE
     gosub AUTOMOVE bowyer
AESRY.SLINGS:
     var shopcode A.Slings
     var SHOP Aesry Slings and Arrows
     gosub STEAL %A.Slings
AESRY.TO.PUZZLE:
     var LAST AESRY.TO.FOOTWEAR
     gosub AUTOMOVE puzzle
AESRY.EXP.CHECK.2:
     #if $Thievery.Ranks >= 430 then goto AESRY.TO.SHIELDS
AESRY.PUZZLE:
     var shopcode A.Puzzle
     var SHOP Aesy Puzzle Shop
     gosub STEAL %A.Puzzle
AESRY.TO.FOOTWEAR:
     var LAST AESRY.TO.SHIELDS
     gosub AUTOMOVE footwear
AESRY.FOOTWEAR:
     var shopcode A.Footwear
     var SHOP Aesry Footwear
     gosub STEAL %A.Footwear
AESRY.TO.SHIELDS:
     var LAST AESRY.TO.WEAPON
     gosub AUTOMOVE shield
AESRY.SHIELDS:
     var shopcode A.Shields
     var SHOP Aesry Shields
     gosub STEAL %A.Shields
AESRY.TO.WEAPON:
     var LAST AESRY.TO.ARMOR
     gosub AUTOMOVE weapon
AESRY.WEAPON:
     var shopcode A.Weapon
     var SHOP Aesry Weapon Shop
     gosub STEAL %A.Weapon
AESRY.TO.ARMOR:
     var LAST AESRY.TO.GENERAL
     gosub AUTOMOVE armor
AESRY.ARMOR:
     var shopcode A.Armor
     var SHOP Aesry Armor Shop
     gosub STEAL %A.Armor
AESRY.TO.GENERAL:
     var LAST AESRY.TO.FLOWER
     gosub AUTOMOVE general
AESRY.GENERAL:
     var shopcode A.General
     var SHOP Aesry General Store
     gosub STEAL %A.Gen
AESRY.TO.FLOWER:
     var LAST AESRY.TO.MUSIC
     gosub AUTOMOVE flower
AESRY.FLOWER:
     var shopcode A.Flower
     var SHOP Aesry Flower Shop
     gosub STEAL %A.Flower
AESRY.TO.MUSIC:
     var LAST GO.PAWN.AESRY
     gosub AUTOMOVE bardic
AESRY.MUSIC:
     var shopcode A.Music
     var SHOP Aesry Music Shop
     gosub STEAL %A.Music
GO.PAWN.AESRY:
GO.AESRY.PAWN:
     var CURRENT.CITY AESRY
     var LAST GO.AESRY.PAWN
     if $hidden then gosub unhide
     if ("%guild" = "Thief") then send khri stop
     pause 0.5
     gosub AUTOMOVE pawn
     gosub PAWN.GOODS
DONE.STEALING.AESRY:
     var LAST DONE.STEALING.AESRY
     if ("%PREMIUM" = "ON") then goto AESRY.PREMIUM
     gosub AUTOMOVE exchange
     gosub LIRUMS
     goto AESRY.TELLER
AESRY.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub LIRUMS
AESRY.TELLER:
     gosub AUTOMOVE 1teller
     gosub BANK
     goto FINISHED.SCRIPT

############################################################################################
############################################################################################
FINISHED.SCRIPT:
     timer stop
     gosub TIME.CALC
     gosub COMBINE.BANK
     echo
     echo *** DONE STEALING!
     echo
     pause 0.1
     send open my %SAFE.CONTAINER
     pause 0.5
     put #echo >Log Lime ***************** FINAL STEALING REPORT ******************
     put #echo >Log Lime *** Thievery Ranks: $Thievery.Ranks -- $Thievery.LearningRate/34
     put #echo >Log Lime *** Total Time: %runTime minutes
     put #echo >Log Lime *** Start City: %CITY | End City: %CURRENT.CITY
     put #echo >Log Lime *** %Charges Stealing Charge(s). %Jailed trip(s) to jail
     put #echo >Log Lime *** Binned: %Binned Items  | Pawned: %Pawned Items
     put #echo >Log Lime *** Profit: %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze and %Coppers Copper
     put #echo >Log Lime ********************** END REPORT ***************************
     echo ********************* FINAL STEALING REPORT ****************************
     echo **** Thievery Ranks: $Thievery.Ranks -- $Thievery.LearningRate/34
     echo **** Total Time: %runTime minutes
     echo **** Start City: %CITY | End City: %CURRENT.CITY
     echo **** %Charges Stealing Charge(s). %Jailed trip(s) to jail
     echo **** Binned: %Binned Items  | Pawned: %Pawned Items
     echo **** Profit: %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze and %Coppers Copper
     echo ***********************************************************************
     pause 5
     if ("%ARMOR.STOW" = "ON") then gosub WEAR.ARMOR
     if ("%RETURN.HOME" != "YES") then goto COMPLETE
TRAVEL.HOME:
     echo **************************************
     echo * Travelling back to starting city!!
     echo **************************************
     pause
     if ($zoneid = 1) then 
          {
               if ("%CITY" != "CROSSING") then 
                    {
                         gosub AUTOMOVE 42
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ($zoneid = 30) then
          {
               if ("%CITY" != "RIVERHAVEN") then 
                    {
                         gosub AUTOMOVE town
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ($zoneid = 42) then
          {
               if ("%CITY" != "THEREN") then 
                    {
                         gosub AUTOMOVE portal
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ($zoneid = 61) then
          {
               if ("%CITY" != "LETH") then 
                    {
                         gosub AUTOMOVE portal
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ($zoneid = 67) then
          {
               if ("%CITY" != "SHARD") then 
                    {
                         gosub AUTOMOVE east
                         gosub AUTOMOVE 65
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY    
          }
     if ($zoneid = 116) then
          {
               if ("%CITY" != "HIB") then 
                    {
                         gosub AUTOMOVE 75
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ($zoneid = 99) then goto ALREADY.THERE
     if ($zoneid = 90) then goto ALREADY.THERE
     pause 0.5
     goto COMPLETE
ALREADY.THERE:
     echo
     echo *** YOU ARE ON AN ISLAND! THIS IS YOUR STARTING CITY DOOFUS!
     echo
     goto COMPLETE
AT.STARTING.CITY:
	echo
	echo *** ALREADY AT YOUR STARTING CITY! 
	echo
	goto COMPLETE
TRAVEL:
     pause 0.5
     send .%TRAVEL.SCRIPT %CITY
     waitforre YOU HAVE ARRIVED
TRAVEL.COMPLETE:
     put #echo >Log Chartreuse *** Returned you to Starting City: %CITY
COMPLETE:
     echo
     echo **** DONE STEALING!!
     echo
     pause 0.5
     put #parse DONE PAWNING
     put #parse DONE STEALING
	 put #script resume raeloktrain
     exit
############################################################################################
## CLAN DEVELOPMENT
############################################################################################
CLAN.HEAL:
     put #echo >Log Red Your hands were cut off! Looking for healer!
     action goto CLAN.HEAL1 when eval $stunned = 1
     pause 3
CLAN.HEAL1:
     pause 10
     if $stunned = 1 then goto CLAN.HEAL
     action remove eval $stunned = 1
     gosub stand
CLAN.TO.EMPATH:
     gosub AUTOMOVE portal
     gosub MOVE go meeting portal
     send lean gwyd
     send lean bedlam
     pause 40
     gosub MOVE go exit portal
     pause
     goto %LAST
############################################################################################
#              END OF STEALING RUN TRAINING
############################################################################################

############################################################################################
############################################################################################
############################################################################################
###             ~~~ SCRIPT ENGINE BEGIN  ~~~ 
############################################################################################
############################################################################################
############################################################################################

################################
# STEALING SUB-ROUTINE       #
################################
STEAL:
     var item $0
     if ("%guild" != "Thief") then var STEALCOUNT %%shopcodeQuant
     if ("%guild" = "Empath") && ("%POWER" = "ON") then gosub POWER.CHECK.NOOB
     if ("%guild" = "Empath") && ("%PERC.HEALTH" = "ON") then gosub PERC.HEALTH
STEAL.1:
     if contains("%item" , "nothing") then goto STEAL.RETURN
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then gosub stowing
MARKING:
	if ("%guild" != "Thief") then goto STEALING
	if ("%marking" = "OFF") then goto STEALING
    if !$hidden then gosub HIDE
    matchre MARKING ^\.\.\.wait|^Sorry\,
    matchre MARK.LAST to take unwanted notice of you|You manage to avoid the shopkeep's notice this time|You trace an X across your chest
    matchre SECONDARY.CHECK Mark what\?|^Something appears different
    matchre STEAL.LAST perhaps it's a little risky|troublesome to be unnoticed|troublesome to lift|about even odds
    matchre TOO.HOT you are being watched|looking for a reason to call the guards|beyond foolish|pretty sure you'll be caught
    matchre TOO.HOT it would likely be futile|judge's gavel echoes through your mind|feel the taste of bitter failure|paying far too much attention to it
    matchre TOO.HOT somewhat of a long shot|don't think well of your chances to lift it|may be quite the struggle to nab|Guards! Guards!
    matchre TOO.HOT miracles occasionally happen|you'll be spotted pretty easily|maybe you shouldn't try it
    matchre STEALING Roundtime|^You can not make marks on|it should be possible
    send mark %item %itemLocation
    matchwait
MARK.LAST:
     var marking OFF
     goto STEALING
STEAL.LAST:
     var stolen 5
     goto STEALING
STEALING:
     math stolen add 1
STEALING.RETRY:
     if !$hidden then gosub HIDE
     matchre STEALING.RETRY ^\.\.\.wait|^Sorry\,
     matchre STEAL.1 ^You need at least one hand free
     matchre STEAL.RETURN You haven't picked something|You can't steal
     matchre TOO.HOT for help\.|realize that you are being watched
     matchre STEAL.CHECK Roundtime
     put steal %item %itemLocation
     matchwait
STEAL.CHECK:
     if ("%noLearn" = "ON") then goto STEAL.RETURN
     if (%stolen >= %STEALCOUNT) then goto STEAL.RETURN
     if (%stolen = 1) then
          {
          if ("%MARK.ALL" = "ON") then
               {
                    goto MARKING
               }
          else goto STEALING
          }
     if (%stolen = 2) then
          {
               gosub stow
               goto MARKING
          }
     if (%stolen = 3) then goto MARKING
     if (%stolen = 4) then 
          { 
          if ("%MARK.ALL" = "ON") then 
               { 
                    gosub STOW 
                    goto MARKING 
               }
          else gosub STOW 
          goto STEALING 
          }
     if (%stolen = 5) then goto MARKING
     if (%stolen >= 6) then
          {
               gosub stow
               goto STEAL.RETURN
          }
     goto STEAL.RETURN
TOO.HOT:
     var LEAVE.SHOP YES
     put #echo >log Orchid Leaving: %SHOP...  TOO HOT!
STEAL.RETURN:
     action remove You don't feel you learned anything useful from this trivial theft
     action remove notices you attempting to make the grab and begins to shout for help.
     var stolen 0
     var noLearn OFF
     var itemLocation 
     if ("%guild" = "Thief") then var marking ON
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then gosub stow
     if $hidden then if ("%SNEAK" = "OFF") then gosub unhide
     if ("%guild" = "Necromancer") && (%ROC = 0) then gosub NECROPREP
     RETURN
SECONDARY.CHECK:
     if (%SECOND.ITEM = 0) then goto STEAL.RETURN
     echo
     echo *** OUT OF STOCK! CHECKING FOR SECONDARY ITEMS..
     echo
     var item %secondary
     var SECOND.ITEM 0
     goto STEAL.1
#######################
#   PAWNING ROUTINE   #
#######################
PAWN:
     var PAWN.ITEM $0
PAWN.GET:
     if %c < 1 then RETURN
     pause 0.001
     pause 0.001
     matchre PAWN.GET ^\.\.\.wait|^Sorry\,
     matchre PAWN.BIN ^You need a free hand
     matchre PAWN.SELL ^You get
     matchre PAWN.SELL ^You are already
     matchre PAWN.SELL ^You pick up
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You aren't holding that\.
     matchre RETURN ^Please rephrase that command\.|^I could not
     send get my %PAWN.ITEM in my %bag
     matchwait
PAWN.SELL:
     counter subtract 1
     if ($invisible = 1) then gosub stopinvis
     if ((matchre("%nosell", "$righthand")) || (matchre("%nosell", "$lefthand")) then goto PAWN.BIN
     matchre PAWN.SELL ^\.\.\.wait|^Sorry\,
     matchre PAWN.GET ^You sell your
     matchre PAWN.BIN ^You can't pawn
     matchre PAWN.BIN slit a throat for this|isn't worth my time|shakes his head
     matchre BUCKET You'll want to empty that first
     send sell my %PAWN.ITEM
     matchwait 5
PAWN.BIN:
     if ("%BIN" = "OFF") then goto BUCKET
     matchre PAWN.BIN ^\.\.\.wait|^Sorry\,
     matchre PAWN.GET ^You put
     matchre PAWN.GET ^What were you referring to\?
     matchre PAWN.GET ^You aren't holding that\.
     matchre PAWN.GET ^Please rephrase that command\.
     matchre BUCKET ^That's too heavy to go in there\!
     matchre BUCKET ^You can't put that in there\!
     matchre BUCKET ^There is no more room|too long to fit
     matchre BUCKET ^But that's closed\.
     matchre BUCKET ^What were you|^You can't do that
     matchre BUCKET ^There isn't enough room .* for your .* to fit\.
     if ("$lefthand" != "Empty") then send put $lefthandnoun in my %BIN.CONTAINER
     if ("$righthand" != "Empty") then send put $righthandnoun in my %BIN.CONTAINER
     matchwait 5
BUCKET:
     if "$zoneid" = "30" then 
          {
               gosub EMPTY.HANDS
               goto PAWN.GET
          }
     pause 0.1
     matchre BUCKET ^\.\.\.wait|^Sorry\,
     matchre PAWN.GET ^You put
     matchre PAWN.GET ^You drop
     matchre PAWN.GET ^You toss
     if ("$lefthand" != "Empty") then send put $lefthandnoun in bucket
     if ("$righthand" != "Empty") then send put $righthandnoun in bucket
     matchwait 1
     gosub EMPTY.HANDS
     goto PAWN.GET
#######################
#   BINNING ROUTINE   #
#######################
BIN:
     var BIN.ITEM $0
BIN.GET:
     if %c < 1 then RETURN
     pause 0.001
     matchre BIN.GET ^\.\.\.wait|^Sorry\,
     matchre BIN.DROP ^You need a free hand
     matchre BIN.ITEM ^You get
     matchre BIN.ITEM ^You are already
     matchre BIN.ITEM ^You pick up
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You aren't holding that\.
     matchre RETURN ^Please rephrase that command\.
     send get my %BIN.ITEM in my %bag
     matchwait 5
BIN.ITEM:
     counter subtract 1
     matchre BIN.ITEM ^\.\.\.wait|^Sorry\,
     matchre BIN.DROP \"You're not fooling anyone\, $charactername\.
     matchre BIN.DROP ^Swan raises an eyebrow
     matchre BIN.GET \"Nice work\, $charactername\.\"
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You aren't holding that\.
     matchre RETURN ^Please rephrase that command\.
     send put my %BIN.ITEM in bin
     matchwait 5
BIN.DROP:
     gosub STOW.BIN
     gosub EMPTY.HANDS
     goto BIN.GET
################################
#  PAWNING / BINNING LOGIC     #
################################
PAWN.GOODS:
     echo
     echo #### GETTING SOME COIN!  ####
     echo #### PAWNING %CURRENT.CITY HAUL! ####
     echo
     pause 0.2
     var BINORPAWN PAWN
     gosub BAG.EMPTY %PAWN.CONTAINER
     pause 0.001
     if ("%BIN" = "OFF") then gosub BAG.EMPTY %BIN.CONTAINER
     gosub STOW
     gosub STOWING
     RETURN
BIN.GOODS:
     echo
     echo ########  Binning %CURRENT.CITY Haul!  ########
     echo
     pause 0.2
     var BINORPAWN BIN
     gosub BAG.EMPTY %BIN.CONTAINER
     pause 0.001
     gosub BAG.EMPTY %PAWN.CONTAINER
     pause 0.5
     # send dump junk
     gosub STOW
     gosub STOWING
     RETURN
#############################
#       STOW ROUTINE        #
#############################
STOW:
     if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then return
     math STOW.LOOP add 1
     if contains("$lefthand" "$righthand" , "%large.items") then gosub EMPTY.HANDS
     if matchre("%item","(%BIN.CONTAINER|%PAWN.CONTAINER)") then gosub EMPTY.HANDS
     if %STOW.LOOP > 1 then goto SECOND.BAG
     matchre STOW ^\.\.\.wait|^Sorry\,
     matchre SECOND.BAG /You just can't get|no matter how you arrange|^There isn't any more room|too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.RETURN /You put|What were you|You can't do|I could not|Perhaps you|Stow what/i
    if ("$righthand" != "Empty") then put put my $righthandnoun in my %BIN.CONTAINER
    if ("$lefthand" != "Empty") then put put my $lefthandnoun in my %PAWN.CONTAINER
	#if (("$righthand" != "Empty") && ("$lefthand" != "Empty")) then RETURN
     matchwait 7
     RETURN
SECOND.BAG:
     matchre SECOND.BAG ^\.\.\.wait|^Sorry\,
     matchre DROP.ITEM /You just can't get|You can't do|no matter how you arrange|^There isn't any more room||too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then put put my $righthandnoun in my %PAWN.CONTAINER
     if ("$lefthand" != "Empty") then put put my $lefthandnoun in my %BIN.CONTAINER
     matchwait 7
     RETURN
STOW.RETURN:
     var STOW.LOOP 0
     RETURN
DROP.ITEM:
     var STOW.LOOP 0
     gosub EMPTY.HANDS
     RETURN    
STOW.BIN:
     put open my %SAFE.CONTAINER
     wait
     matchre SECOND.BAG ^\.\.\.wait|^Sorry\,
     matchre DROP.ITEM /You just can't get|You can't do|no matter how you arrange|^There isn't any more room||too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.BIN.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then put put my $righthandnoun in my %SAFE.CONTAINER
     if ("$lefthand" != "Empty") then put put my $lefthandnoun in my %SAFE.CONTAINER
     matchwait 7
STOW.BIN.RETURN:
     put close my %SAFE.CONTAINER
     RETURN
############################################################################################
# ARMOR REMOVAL
############################################################################################
ARMOR.CHECK:
     counter set 0
ARMOR.CHECK.1:
     pause 0.1
     pause 0.1
     matchre REMOVE.AND.STOW (gauntlet|gloves|steel mail gloves|parry stick|handwraps|hand claws|jacket|footwraps|aegis|buckler|hood|\bheater|pavise|scutum|shield|sipar|\btarge\b|aventail|backplate|balaclava|barbute|bascinet|breastplate|\bcap\b|coat|cowl|cuirass|fauld|greaves|hauberk|helm|\bhood\b|jerkin|leathers|lorica|mantle|mask|morion|pants|(?<=(field|fluted|full|half) )\bplate\b|handguards|robe|sallet|shirt|sleeves|tabard|tasset|thorakes|vambraces|vest|collar|coif|mitt|steel mail)
     matchre ARMOR.NONE You have nothing of that sort|You are wearing nothing of that sort|You aren't wearing anything like that
     send inv armor
     matchwait 5
     goto ARMOR.WARN
ARMOR.CHECK.2:
     pause 0.1
     pause 0.1
     matchre REMOVE.AND.STOW (gauntlet|gloves|steel mail gloves|parry stick|handwraps|hand claws|jacket|footwraps|aegis|buckler|hood|\bheater|pavise|scutum|shield|sipar|\btarge\b|aventail|backplate|balaclava|barbute|bascinet|breastplate|\bcap\b|coat|cowl|cuirass|fauld|greaves|hauberk|helm|\bhood\b|jerkin|leathers|lorica|mantle|mask|morion|pants|(?<=(field|fluted|full|half) )\bplate\b|handguards|robe|sallet|shirt|sleeves|tabard|tasset|thorakes|vambraces|vest|collar|coif|mitt|steel mail)
     matchre ARMOR.COMPLETE You have nothing of that sort|You are wearing nothing of that sort|You aren't wearing anything like that
     send inv armor
     matchwait 5
     goto ARMOR.WARN
REMOVE.AND.STOW:
     var armor $0
REMOVE.ARMOR:
     pause 0.1
     pause 0.1
     var LAST REMOVE.ARMOR
     matchre REMOVE.ARMOR ^\.\.\.wait|^Sorry\,
     matchre STOW.ARMOR ^You remove|^You loosen the straps securing|^You take|^You slide
     matchre STOW.ARMOR ^You sling|^You work your way out of|^You pull|^You slip|^You aren't
     send remove %armor
     matchwait 5
STOW.ARMOR:
     pause 0.1
     pause 0.1
     var LAST STOW.ARMOR
     matchre STOW.ARMOR ^\.\.\.wait|^Sorry\,
     matchre ARMOR.DONE ^You put|^You slip|^What were you
     matchre NO.MORE.STOWING any more room in|closed|no matter how you arrange|too heavy|too long
     send put %armor in my %SAFE.CONTAINER
     matchwait 5
ARMOR.DONE:
     counter add 1
     pause 0.5
     var total.armor %c
     var armor%c %armor
     goto ARMOR.CHECK.2
ARMOR.NONE:
     echo **** NO ARMOR FOUND!
     var ARMOR.STOW OFF
     RETURN
NO.MORE.STOWING:
     echo ***  YOU HAVE NO MORE FREE BAG SPACE FOR ARMOR! MAKE SOME ROOM OR GET BIGGER BAGS!
     echo ***  GONNA JUST GO FOR IT ANYWAY, YOU WILL BE HINDERED! QUIT SCRIPT IF YOU WANT TO ABORT
     put wear %armor
     wait
     pause 3
     goto ARMOR.COMPLETE
ARMOR.COMPLETE:
     var ARMOR.STOW ON
     echo #######################################
     echo # Saved Armor Count: %total.armor
     if %total.armor < 1 then RETURN
     echo # Armor1: %armor1
     if %total.armor < 2 then RETURN
     echo # Armor2: %armor2
     if %total.armor < 3 then RETURN
     echo # Armor3: %armor3
     if %total.armor < 4 then RETURN
     echo # Armor4: %armor4
     if %total.armor < 5 then RETURN
     echo # Armor5: %armor5
     if %total.armor < 6 then RETURN
     echo # Armor6: %armor6
     if %total.armor < 7 then RETURN
     echo # Armor7: %armor7
     if %total.armor < 8 then RETURN
     echo # Armor8: %armor8
     if %total.armor < 9 then RETURN
     echo # Armor9: %armor9
     if %total.armor < 10 then RETURN
     echo # Armor10: %armor10
     echo #######################################
     echo
     pause 1
     RETURN
############################################################################################
WEAR.ARMOR:
     echo **** PUTTING YOUR ARMOR BACK ON! ****
     send open my %SAFE.CONTAINER
     pause
     if %total.armor = 0 then RETURN
     if "%armor1" != "null" then
          {
               send get my %armor1 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor1 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor2" != "null" then
          {
               gosub stowing
               send get my %armor2 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor2 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor3" != "null" then
          {
               gosub stowing
               send get my %armor3 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor3 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor4" != "null" then
          {
               gosub stowing
               send get my %armor4 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor4 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor5" != "null" then
          {
               gosub stowing
               send get my %armor5 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor5 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor6" != "null" then
          {
               gosub stowing
               send get my %armor6 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor6 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor7" != "null" then
          {
               send get my %armor7 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor7 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor8" != "null" then
          {
               send get my %armor8 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor8 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor9" != "null" then
          {
               send get my %armor9 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor9 from my %SAFE.CONTAINER
               pause 0.5
          }
     if "%armor10" != "null" then
          {
               send get my %armor10 from my %SAFE.CONTAINER
               pause 0.5
               send wear my %armor10 from my %SAFE.CONTAINER
               pause 0.5
          }
     RETURN
############################################################################################
############################################################################################
# GOSUBS 
############################################################################################
############################################################################################
BAG.EMPTY:
     var bag $0
     pause .0001
     var contents null
     action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.|^You rummage
     action remove ^In the .* you see (.*)\.|^You rummage through .+ and see (.*)\.
     if "%contents" = "null" then RETURN
     pause .0001
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     var contents |%contents|
     eval total count("%contents", "|")
BAG.EMPTY.Loop:
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub BAG.EMPTY.RemoveLoop
     action setvariable item $1 when ^@(?:an?|some).* (\S+)$
     put #parse @%item
     counter set %count
     if contains("%STEAL.LIST", "%item") then gosub BAG.EMPTY.itemAction
     # if contains("%STEAL.LIST", "%item") then gosub %BINORPAWN %item
     if "%contents" != "|" then goto BAG.EMPTY.Loop
     RETURN
BAG.EMPTY.RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents" , "|%item|" , "|")
     eval contents replace("%contents" , "||" , "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto BAG.EMPTY.RemoveLoop
BAG.EMPTY.itemAction:
     gosub %BINORPAWN %item
     #counter subtract 1
     if %c < 1 then RETURN
     goto BAG.EMPTY.itemAction
############################################################################################
###############################################################################################
# UB3R 1337 CONTAINER CHECK
###############################################################################################
BAG.CHECK:
     var bag $0
     #var count 0
     pause 0.1
     var contents null
     send open my %SAFE.CONTAINER
     wait
     pause 0.001
     pause 0.001
     # action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.
     action remove ^In the .* you see (.*)\.|^There is nothing in there\.
     pause 0.001
     pause 0.001
     if "%contents" = "null" then
          {
               send close my %SAFE.CONTAINER
               pause 0.5
               RETURN
          }
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     var contents |%contents|
     eval total count("%contents", "|")
Loop:
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub RemoveLoop
     action var item $1 when ^@(?:an?|some) .* (\S+)$
     put #parse @%item
     counter set %count
     if contains("%IMPORTANT.ITEMS", "%item") then gosub storeitem
     if contains("%STEAL.LIST", "%item") then gosub storeitem
     if %contents != "|" then goto Loop
     send close my %SAFE.CONTAINER
     wait
     pause 0.001
     pause 0.001
     echo **** DONE STASHING ITEMS FROM %bag
     RETURN
RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents", "|%item|", "|")
     eval contents replace("%contents", "||" "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto RemoveLoop
storeitem:
     counter subtract 1
     gosub GET %item from my %bag
     gosub PUT_IT my %item in my %SAFE.CONTAINER
     if %c < 1 then RETURN
     goto storeitem

#####################################
# THIEF BUFFS
#####################################
COOKIE:
     if ("%guild" = "Barbarian") then goto DANCE
     if ("%guild" != "Thief") then RETURN
     echo *** PUTTING UP KHRI ***
     if ($concentration < 50) then goto COOKIE.BREAK
     gosub COOKIE.START %khri1
     gosub COOKIE.START %khri2
     RETURN
COOKIE.START:
     var khri $0
COOKIE.START.CONTINUE:
     matchre COOKIE.START.CONTINUE ^\.\.\.wait|^Sorry\,
     matchre COOKIE.KNEEL ^Your mind and body are willing|Sitting, kneeling, or lying
     matchre COOKIE.START.CONTINUE ^\.\.\.wait|^Sorry\,
     matchre COOKIE.RETURN ^You're already using the .* meditation\.
     matchre COOKIE.RETURN ^You already
     matchre COOKIE.RETURN ^Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?
     matchre COOKIE.RETURN ^\[Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\]
     matchre COOKIE.RETURN ^\(Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\)
     matchre COOKIE.RETURN ^Focusing|^With intense focus|^You carefully relax your mind|You are not|Your mind|valid khri
     matchre COOKIE.BREAK You strain, but cannot focus|You have not recovered from|Your mind is already focused
     send khri %khri
     matchwait
COOKIE.BREAK:
     send khri stop
COOKIE.WAIT:
     pause
     if ($concentration > 50) then goto COOKIE
     put khri meditate
     echo
     echo *** WAITING FOR CONCENTRATION TO RECOVER.........
     echo
     pause 25
WAIT.DONE:
     if ($concentration < 50) then goto COOKIE.BREAK
COOKIE.BREAK.DONE:
     gosub EMPTY.HANDS
     goto COOKIE
COOKIE.KNEEL:
     gosub PUT kneel
     gosub PUT khri %khri
     pause $roundtime
     pause 0.5
     gosub stand
     RETURN
COOKIE.RETURN:
     pause $roundtime
     pause .001
     pause .001
     RETURN
#####################################
# BARB BUFFS
#####################################
DANCE:
     echo *** BARB DANCE ***
     gosub PUT form monkey
     pause $roundtime
     pause 0.5
     gosub PUT form panther
     pause $roundtime
     pause 0.5
     gosub PUT berserk wildfire
     pause 0.5
     RETURN
#####################################
# EMPATH BUFFS
#####################################
POWER.CHECK.NOOB:
     if ($Attunement.LearningRate > 30) then RETURN
     pause 0.5
     gosub PUT power
     pause
     pause
POWER.STUN.CHECK:
     if ($stunned = 1) then
          {
               echo *** STUNNED! PAUSING...
               pause 5
               goto POWER.STUN.CHECK
          }
     RETURN

PERC.HEALTH:
     if ($Empathy.LearningRate > 32) then RETURN
     if ($Attunement.LearningRate > 32) then RETURN
     if ("%GUARDIAN.SPIRIT" = "ON") then GOSUB POWER.CHECK
     if ($zoneid = 42) then RETURN
     echo *** PERCEIVING HEALTH ***
     pause 0.001
     pause 0.001
     gosub PUT perceive health
     pause
     POWER.STUN.CHECK2:
     if $stunned = 1 then
          {
               echo *** STUNNED! PAUSING...
               pause 5
               goto POWER.STUN.CHECK2
          }
     pause 0.001
     pause 0.001
     RETURN

POWER.CHECK:
     if ($Attunement.LearningRate > 30) then RETURN
     if ($zoneid = 42) then RETURN
     pause 0.001
     pause 0.001
     matchre RETURN ^You sense the Guardian Spirit spell upon you
     matchre GUARDIAN.SPIRIT ^Roundtime
     send power
     matchwait 3
     GOTO GUARDIAN.SPIRIT
GS1:
pause 5
GUARDIAN.SPIRIT:
     if (*"%GUARDIAN.SPIRIT" != "ON") then RETURN
     if ($zoneid = 42) then RETURN
          if ($Empathy.Ranks < 75) && ($Attunement.Ranks < 75) || ($Empathy.Ranks < 50) && ($Attunement.Ranks < 100) || ($Empathy.Ranks < 100) && ($Attunement.Ranks < 50) then
          {
               echo
               echo *** You do not appear to have enough combined Empathy or Attunement for Guardian Spirit ***
               echo *** If this is an error, please email/IM me with your Empathy and Attunement Ranks
               echo *** Turning Guardian Spirit OFF for now.
               pause 5
               var GUARDIAN.SPIRIT OFF
               RETURN
          }
     echo *** GUARDIAN SPIRIT ***
     pause 0.5
     gosub PREPARE gs %gsMana
     if (%E.castPause > 0) then gosub SPELL_WAIT
     else pause %E.castPause
     gosub SPELL_CAST
     RETURN
#####################################
# NECRO BUFFS
#####################################
NECROSTART:
     var Rite OFF
     var Eyes OFF
     action var $1 ON when ^You sense the (\w+)
     gosub PUT power
     pause 0.5
     pause 0.1
     action remove ^You sense the (\w+)

NECROPREP:
     if ("$guild" != "Necromancer") then RETURN
     var cast $0
     pause 0.1
     gosub ROC
     gosub EOTB
     RETURN
     
ROC:
     if ("%Rite" = "ON") then goto NECRO.DONE
     if ("%ROC" != "ON") then goto NECRO.DONE
     echo **** Checking ROC ****
     if ("$preparedspell" != "None") then gosub RELEASE
     if (((matchre("$roomobjs", "exchange board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) then RETURN
     gosub NECRO.CHECKROOM
     gosub PREPARE roc %rocMana
     if (%castPause > 0) then gosub SPELL_WAIT
     else 
          {    
               pause %castPause
               if ((!("$roomplayers" = "")) && (matchre("$preparedspell", "(Rite of Contrition|Eyes of the Blind)")) then gosub MOVE.RANDOM
               gosub SPELL_CAST
          }
     RETURN
     
EOTB:
     if ("%EOTB" != "ON") then goto NECRO.DONE
     if (("%Eyes" = "ON") && ($invisible = 1)) then goto NECRO.DONE
     echo  **** Checking EOTB ****
     if ("$preparedspell" != "None") then gosub RELEASE
## ** Waits for invis pulse or casts the spell if invisible is off..
     if (("%Eyes" = "ON") && ($invisible = 0)) then
          {
## ** This return is slightly different, it will not wait for pulse inside the exchange. 
## ** It will also not wait for a pulse if destination = exchange, account or any teller trips to the exchange when moving areas. 
## ** It should wait for a pulse inside the teller if going anywhere else.
          if (((matchre("$roomobjs", "exchange rate board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) && ((matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) && (matchre("%Destination", "(teller|exchange)")))) then RETURN
          matchre EOTB ^Your spell subtly|^Your corruptive mutation fades
          matchwait 30
          put #echo >log Red *** Error with EOTB not pulsing invis. Attempting to recast.
          }
    if ($invisible = 1) then RETURN
     
## ** If script made it to this section then EOTB must be recast.  
## ** This will not cast while inside the bank or any other unapproved rooms.
     if (((matchre("$roomobjs", "exchange rate board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) then RETURN
     if ($stamina < 50) then RETURN
     gosub NECRO.CHECKROOM
     gosub PREPARE eotb %eotbMana
     if (%castPause > 0) then gosub SPELL_WAIT
     else 
          {    
               pause %castPause
               if ((!("$roomplayers" = "")) && (matchre("$preparedspell", "(Rite of Contrition|Eyes of the Blind)")) then gosub MOVE.RANDOM
               gosub SPELL_CAST
          }
    RETURN
NECRO.DONE:
     delay 0.0001
     RETURN

NECRO.CHECKROOM:
     if !("$roomplayers" = "") then gosub MOVE.RANDOM
     send search
     waitforre ^Roundtime|^You scan the
     pause $roundtime
     pause 0.5
     if !("$roomplayers" = "") then gosub MOVE.RANDOM
     echo **** FOUND EMPTY ROOM! ***
RETURN    

stopinvis:
     gosub PUT hum scale
     pause 0.1
     pause 0.1
     gosub PUT stop hum
     RETURN
##############################################################################################
#        UBER PROFIT TRACKING / BANK EXCHANGE V.9000    W/ CROSS SCRIPT INJECTION                  #
##############################################################################################
BANK:
     send wealth
     waitforre ^Wealth|^I could|^\.\.\.wait|^Sorry\,
     pause 0.001
     action (balancecheck) var Plat $1 when ^.*\s(\d+)\splatinum\,?
     action (balancecheck) var Gold $1 when ^.*\s(\d+)\sgold\,?
     action (balancecheck) var Silver $1 when ^.*\s(\d+)\ssilver\,?
     action (balancecheck) var Bronze $1 when ^.*\s(\d+)\sbronze\,?
     action (balancecheck) var Copper $1 when ^.*\s(\d+)\scopper
     action (balancecheck) off
     action (profitparse) var Plat $1 when ^PROFITPARSE\s(\d+)\d\d\d\d\sPROFITPARSE
     action (profitparse) var Gold $1 when ^PROFITPARSE\s\d+(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Gold $1 when ^PROFITPARSE\s(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s\d+\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s(\d)\d\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d+\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s(\d)\d\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d+\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s(\d)\sPROFITPARSE
     action (profitparse) off
     var preDeposit 0
     var postDeposit 0
     var profit 0
     gosub BANK.COIN.CLEAR
     action (balancecheck) on
     pause 0.01
     if ($invisible = 1) then gosub stopinvis
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.01
     action (balancecheck) off
     gosub BANK.COIN.MATH
     gosub BANK.PREDEP.MATH
     pause 0.01
     if ($invisible = 1) then gosub stopinvis
     put -deposit all;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.01
     gosub BANK.COIN.CLEAR
     action (balancecheck) on
     pause 0.01
     if ($invisible = 1) then gosub stopinvis
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.01
     action (balancecheck) off
     gosub BANK.COIN.MATH
     gosub BANK.POSTDEP.MATH
     evalmath profit (%postDeposit - %preDeposit)
     math Profit add %profit
     pause 0.01
     gosub BANK.COIN.CLEAR
     action (profitparse) on
     put #parse PROFITPARSE %Profit PROFITPARSE
     action (profitparse) off

## Multiple Bank Deposit Adding
     if (%Banked > 0) then 
          { 
               put #tvar Plat 0
               put #tvar Gold 0
               put #tvar Silver 0
               put #tvar Bronze 0
               put #tvar Copper 0
          }
     math Banked add 1

SAVE.PROFIT:
## Saves your profit from each bank deposit in temp global variables for use in other scripts and for multiple city deposits 
     put #tvar Plat %Plat
     put #tvar Gold %Gold
     put #tvar Silver %Silver
     put #tvar Bronze %Bronze
     put #tvar Copper %Copper
     pause 0.1
     put #statusbar 1 Stealing Profit: %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze and %Copper Copper
     put #parse MONEY DONE
     RETURN
#############################################
# BANK GOSUBS
#############################################
COMBINE.BANK:
     math Plats add $Plat
     math Golds add $Gold
     math Silvers add $Silver
     math Bronzes add $Bronze
     math Coppers add $Copper
     RETURN
BANK.COIN.CLEAR:
     var Copper 0
     var Bronze 0
     var Silver 0
     var Gold 0
     var Plat 0
     RETURN
BANK.COIN.MATH:
     math Bronze multiply 10
     math Silver multiply 100
     math Gold multiply 1000
     math Plat multiply 10000
     RETURN
BANK.PREDEP.MATH:
     math preDeposit add %Copper
     math preDeposit add %Bronze
     math preDeposit add %Silver
     math preDeposit add %Gold
     math preDeposit add %Plat
     RETURN
BANK.POSTDEP.MATH:
     math postDeposit add %Copper
     math postDeposit add %Bronze
     math postDeposit add %Silver
     math postDeposit add %Gold
     math postDeposit add %Plat
     RETURN
#############################################
## EXCHANGE
#############################################
LIRUMS:
     var Target.Currency LIRUMS
     gosub EXCHANGE KRONARS
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
KRONARS:
     var Target.Currency KRONARS
     gosub EXCHANGE LIRUMS
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
DOKORAS:
     var Target.Currency DOKORAS
     gosub EXCHANGE KRONARS
     gosub EXCHANGE LIRUMS
     goto EXCHANGE.FINISH
EXCHANGE:
     var Coin $0
EXCHANGE.CONTINUE:
     if ($invisible = 1) then gosub stopinvis
     pause 0.1
     matchre EXCHANGE.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre RETURN ^You hand your money to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre RETURN ^But you don't have any .*\.
     matchre FINISH ^There is no money-changer here\.
     put EXCHANGE ALL %Coin FOR %Target.Currency
     matchwait
EXCHANGE.FINISH:
     put #parse EXCHANGE DONE!
     RETURN
############################################################################################
############################################################################################
# JAILED / DEBT PAYING ROUTINE         #
#  ROBUST AS A MOTHERFUCKER            #
############################################################################################
############################################################################################
JAIL.CHECK:
     action instant goto PLEAD when ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead|Shouldn't you be worrying about something else
     put #parse TAKING CARE OF BUSINESS
     put #script pause %MAIN.SCRIPT
     if ($zoneid = 1) then goto CROSSING.JAIL
     if ($zoneid = 30) then goto HAVEN.JAIL
     if ($zoneid = 42) then goto THEREN.JAIL
     if ($zoneid = 61) then goto LETH.JAIL
     if ($zoneid = 116) then goto HIB.JAIL
     if ($zoneid = 67) then goto SHARD.JAIL
     if ($zoneid = 99) then goto AESRY.JAIL
     if ($zoneid = 90) then goto RATHA.JAIL
     pause 0.5
     goto JAILED

AESRY.JAIL:
JAIL.AESRY:
     var CURRENT.CITY Aesry
     echo Aesry JAIL
     put #parse Aesry JAIL
     goto JAILED
RATHA.JAIL:
JAIL.RATHA:
     var CURRENT.CITY Ratha
     echo Ratha JAIL
     put #parse Ratha JAIL
     goto JAILED
THEREN.JAIL:
JAIL.THEREN:
     var CURRENT.CITY Theren
     echo Theren JAIL
     put #parse Theren JAIL
     goto JAILED
HAVEN.JAIL:
JAIL.HAVEN:
     var CURRENT.CITY Riverhaven
     echo RIVERHAVEN JAIL
     put #parse RIVERHAVEN JAIL
     goto JAILED
LETH.JAIL:
JAIL.LETH:
     var CURRENT.CITY Leth
     echo LETH JAIL
     put #parse LETH JAIL
     goto JAILED
CROSSING.JAIL:
CROSS.JAIL:
JAIL.CROSS:
     var CURRENT.CITY Crossing
     echo CROSSING JAIL
     put #parse CROSS JAIL
     goto JAILED
HIB.JAIL:
JAIL.HIB:
     var CURRENT.CITY Hib
     echo HIB JAIL
     put #parse HIB JAIL
     goto JAILED
SHARD.JAIL:
JAIL.SHARD:
     var CURRENT.CITY Shard
     echo SHARD JAIL
     put #parse SHARD JAIL
     goto JAILED

JAILED:
     math Jailed add 1
     echo *** YOU'VE BEEN JAILED! ***
     echo *** WAITING FOR SENTENCE! ***
     put #echo >log Red **** ARRESTED IN %CURRENT.CITY!! *****
     put #beep
     matchre PLEAD ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|plead
     matchwait 220
     goto JAILED
PLEAD:
     action remove ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead|Shouldn't you be worrying about something else
     send plead %PLEAD
     wait
     pause 0.5
     pause 0.1
     if ($roomid = 23) then goto STOCKS
GET.SACK:
GET_SACK:
     pause 0.1
     pause 0.1
     match DEBT You glance down at your empty hands
     match SACK sack
     send glance
     matchwait
DEBT:
     gosub STAND
     echo
     echo **** Getting some coin to pay fine  ****
     echo
     if ($zoneid = 42) then goto THEREN.JAIL.GET.FINE
     gosub clear
     if ("%guild" = "Necromancer") then gosub NECROPREP
     if ($zoneid = 90) then
          {
               var GUARD 1guard
               if ($roomid = 349) then var GUARD 1guard
               if ($roomid = 581) then var GUARD 3guard
          }
     pause 0.1
TO.TELLER:
     var plat 20
     if ($zoneid = 116) then
          {
               gosub automove 2teller
               goto FINECHECK.DOKORAS
          }
     if ($zoneid = 90) then 
          {
               gosub AUTOMOVE 1teller
               goto FINECHECK.LIRUMS
          }
     gosub AUTOMOVE teller
     if ($zoneid = 67) then goto FINECHECK.DOKORAS
     if ($zoneid = 116) then goto FINECHECK.DOKORAS
     if ($zoneid = 61) then goto FINE.CHECK.KRONARS
     if ($zoneid = 1) then goto FINE.CHECK.KRONARS
     if ($zoneid = 30) then goto FINECHECK.LIRUMS
     if ($zoneid = 99) then goto FINECHECK.LIRUMS
     if ($zoneid = 34a) then goto FINECHECK.LIRUMS
     if ($zoneid = 42) then goto FINECHECK.LIRUMS
     pause
     echo
     echo *** UKNOWN JAIL LOCATION!!
     echo *** CRITICAL ERROR!
     echo
     put #echo >Log Red ***CRITICAL ERROR!!!!
     put #echo >Log Red ***UNKOWN JAIL LOCATION: Zone- $zoneid Room- $roomid
     pause 0.1
FINECHECK:
FINE.CHECK.KRONARS:
     matchre SET_FINE \((\d+) copper Kronars\)$
     match NO_FINE Wealth:
     send wealth
     matchwait
FINECHECK.LIRUMS:
     matchre SET_FINE_LIRUM \((\d+) copper Lirums\)$
     match NO_FINE Wealth:
     send wealth
     matchwait
FINECHECK.DOKORAS:
     matchre SET_FINE_DOKORAS \((\d+) copper Dokoras\)$
     match NO_FINE Wealth:
     send wealth
     matchwait
SET_FINE_LIRUM:
     pause 0.1
     var fine $1
     var currency lirum
     if (%fine > 250000) then goto BIGGER_FINE
     if (%fine > 100000) then goto BIG_FINE
     goto WITHDRAW
SET_FINE_DOKORAS:
     pause 0.1
     var fine $1
     var currency dokora
     if (%fine > 250000) then goto BIGGER_FINE
     if (%fine > 100000) then goto BIG_FINE
     goto WITHDRAW
SET_FINE:
     pause 0.1
     var fine $1
     var currency kronar
     if (%fine > 200000) then goto BIGGER_FINE
     if (%fine > 100000) then goto BIG_FINE
     goto WITHDRAW
WITHDRAW:
     if ($invisible = 1) then gosub stopinvis
     pause 0.2
     pause 0.1
     matchre TO.TELLER ^You must be at a bank teller's window
     matchre PAY_DEBT ^The clerk counts out
     matchre NO.FUNDS we are not lending money|You don't have that much
     send withdraw %fine copper
     matchwait
BIG_FINE: 
     if ($invisible = 1) then gosub stopinvis
     pause 0.2
     pause 0.1
     matchre TO.TELLER ^You must be at a bank teller's window
     matchre PAY_DEBT ^The clerk counts out
     matchre NO.FUNDS we are not lending money|You don't have that much
     send withdraw %plat plat
     matchwait
BIGGER_FINE:
     if (%fine >= 2000000) then var plat 300
     if (%fine >= 1500000) then var plat 200
     if (%fine >= 1200000) then var plat 150
     if (%fine >= 900000) then var plat 120
     if (%fine >= 500000) then var plat 90
     if (%fine >= 450000) then var plat 50
     if (%fine >= 400000) then var plat 45
     if (%fine >= 350000) then var plat 40
     if (%fine >= 250000) then var plat 35
     if (%fine >= 200000) then var plat 25
     goto BIG_FINE
NO_FINE:
     echo
     echo *** You have no fine
     echo
     goto RETURN_TO_JAIL
PAY_DEBT:
     echo
     echo **** Paying off your debt! ***
     echo
     pause
     pause 0.5
     # Walking to pay off the debt
     gosub AUTOMOVE debt
     if ($invisible = 1) then gosub stopinvis
     send pay %fine
     pause
     if ($zoneid = 116) then
          {
               gosub automove 2teller
               goto DONE_DEBT
          }
     if ($zoneid = 90) then 
          {
               gosub AUTOMOVE 1teller
               goto DONE_DEBT
          }
     gosub AUTOMOVE teller
DONE_DEBT:
     pause 0.1
     if ($invisible = 1) then gosub stopinvis
     send dep all
     pause 0.1
RETURN_TO_JAIL:
     echo
     echo **** Heading back to jail now ****
     echo
     if ($zoneid = 42) then goto THEREN.KEEP.JAIL
     if ($zoneid = 90) then goto RATHA.JAIL.RETURN
     if ($zoneid = 67) then goto SHARD.JAIL.RETURN
     if ($zoneid = 116) then goto HIB.JAIL.RETURN
     # Walking to the Guard House
     gosub AUTOMOVE Guard
     goto CLAN
RATHA.JAIL.RETURN:
     gosub AUTOMOVE %GUARD
     goto CLAN
HIB.JAIL.RETURN:
     gosub AUTOMOVE 200
     goto CLAN
     SHARD.JAIL.RETURN:
     gosub AUTOMOVE sentin
CLAN:
     if ("$gamename" = "DRF") && ("%CLANITEM" != "NO") then goto CLAN_ITEM
     else goto THE_SACK
CLAN_ITEM_PAUSE:
     pause 8
CLAN_ITEM:
     if ("%CLANITEM" = "NO") then goto THE_SACK
     if ("$gamename" = "DRF") then send remove %CLAN.ITEM.NAME
     pause
THE_SACK:
     if ($invisible = 1) then gosub stopinvis
     pause 0.5
     matchre THE_SACK ^\.\.\.wait|^Sorry, you may only|What were you|I could not|Please rephrase
     matchre SACK_PRE ^You reach for your sack and retrieve the equipment
     matchre CLAN_ITEM_PAUSE ^You'll need to not be wearing anything
     matchre DEBT paid off your debt to society
     matchre SACK ^Realizing you're wearing too much
     send get $charactername sack
     matchwait
     goto GET_SACK
STOCKS:
echo
echo *** You got the stocks! Wait it out!
echo
waitforre ^You accept a sack and retrieve the equipment
SACK_PRE:
     if ("%CLANITEM" = "YES") then put wear %CLAN.ITEM.NAME
     if ("%CLANITEM" = "YES") then put rub %CLAN.ITEM.NAME
     pause 0.5
     send open my small sack
     wait
     pause 0.5
SACK:
     pause 0.5
     pause 0.5
     matchre STOW.IT mining cowl|mining cap|mining helm
     matchre ITEM khuj|quarterstaff|quarter staff|halberd|toad
     match OPEN_SACK That is closed.
     matchre GET_SACK_ITEM (\S+)(\.)
     matchre NO_MORE_ITEMS ^There is nothing in there|^I could not find
     send look in my small sack
     matchwait
STOW.IT:
     var item $0
     send get %item from my sack
     pause 0.5
     pause 0.2
     send stow %item in my %BIN.CONTAINER
     pause 0.5
     send stow %item in my %PAWN.CONTAINER
     goto SACK
ITEM:
     var item $0
     gosub GET %item from my sack
     pause 0.5
     send wear %item
     pause 0.5
     send stow %item
     goto SACK
OPEN_SACK:
     send wear %CLAN.ITEM.NAME
     pause 0.5
     send open my sack
     wait
     goto SACK
GET_SACK_ITEM:
     pause
     if $1 = there then goto NO_MORE_ITEMS
     send get $1 from my sack
     pause 0.5
     if (("$1" = "backpack")||("$1" = "cauldron")) then
          {
               pause 0.5
               goto SACK
          }
     if ("$1" = ("obsidian")||("$1" = "toad")) then
          {
           send wear my $1
           send stow my $1
          }
     else
          {
           send stow my $1
           send wear my $1
          }
     pause 0.5
     goto SACK
NO_MORE_ITEMS:
     send drop sack
     pause
     echo
     echo **** Returning to what you were doing ****
     echo
     if ($standing = 0) then gosub stand
     if contains("$lefthand" "$righthand" , "%large.items") then gosub EMPTY.HANDS
CHECKLOC:
     if ($zoneid = 67) then goto SHARDJAIL
     if ($zoneid = 116) then goto HIBJAIL
     if ($zoneid = 61) then goto LETHJAIL
     if ($zoneid = 1) then goto CROSSJAIL
     if ($zoneid = 30) then goto HAVENJAIL
     if ($zoneid = 42) then goto THEREN.JAIL.LEAVE
     if ($zoneid = 90) then goto RATHAJAIL
     if ($zoneid = 99) then goto AESRYJAIL
RATHAJAIL:
     gosub AUTOMOVE 51
     put #script resume %MAIN.SCRIPT
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
AESRYJAIL:
     gosub AUTOMOVE 76
     put #script resume %MAIN.SCRIPT
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
CROSSJAIL:
     gosub AUTOMOVE 42
     put #script resume %MAIN.SCRIPT
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
LETHJAIL:
     gosub AUTOMOVE portal
     put #script resume %MAIN.SCRIPT
     pause 0.5
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
HAVENJAIL:
     gosub AUTOMOVE town
     put #script resume %MAIN.SCRIPT
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
SHARDJAIL:
     gosub AUTOMOVE 57
     put #script resume %MAIN.SCRIPT
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
HIBJAIL:
     gosub AUTOMOVE 75
     put #script resume %MAIN.SCRIPT
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
THEREN.JAIL.LEAVE:
     save THEREN.JAIL.END
     goto THEREN.KEEP.ESCAPE
THEREN.JAIL.GET.FINE:
     save TO.TELLER
     goto THEREN.KEEP.ESCAPE
THEREN.KEEP.ESCAPE:
     gosub AUTOMOVE 69
     send jump moat
     pause 12
THEREN.STUNNED.WAIT:
     pause 10
     if $stunned = 1 then goto THEREN.STUNNED.WAIT
     pause 0.5
     gosub STAND
     pause 0.5
     goto THEREN.MOAT.LEAVE
THEREN.MOAT.LEAVE:
     var location THEREN.MOAT.LEAVE
     gosub MOVE s
     pause 2
     goto %s
THEREN.KEEP.JAIL:
     var location THEREN.KEEP.JAIL
     gosub AUTOMOVE 103
     gosub AUTOMOVE moat
     gosub AUTOMOVE 146
     gosub AUTOMOVE dungeon
     gosub STAND
     goto CLAN_ITEM
THEREN.JAIL.END:
     gosub AUTOMOVE 1
     pause 2
END:
     put #script resume %MAIN.SCRIPT
     put #script abort jail
     put #parse FREE FROM JAIL
     put #echo >Log SkyBlue *** RECOVERED FROM JAIL VIA STEALING SCRIPT
     put #echo >Log SkyBlue *** CONTINUING SCRIPT FROM LAST CHECKPOINT..
     echo
     echo *** FREE FROM JAIL!
     pause 0.5
     pause
     goto %LAST
FREE.CROSSING:
     goto %LAST
FREE.LETH:
     goto GO.LETH.PAWN
FREE.HAVEN:
FREE.THEREN:
     goto %LAST
     goto GO.PAWN.STUFF.HAVEN
##########################################################################################################################################
##########################################################################################################################################
# LOCATION CHECKING LOGIC 
##########################################################################################################################################
##########################################################################################################################################
CITY.CHECK:
     if $zoneid = 42 then gosub AUTOMOVE quad
     #if $zoneid = 30 then gosub AUTOMOVE town
     if $zoneid = 7 then gosub AUTOMOVE arthe
     if $zoneid = 61 then gosub AUTOMOVE portal
     if $zoneid = 67 then gosub AUTOMOVE 1
     if $zoneid = 116 then gosub AUTOMOVE 75
     if $zoneid = 99 then var CITY AESRY
     if $zoneid = 90 then var CITY RATHA
     if $zoneid = 42 then var CITY THEREN
     if $zoneid = 30 then var CITY RIVERHAVEN
     if $zoneid = 7 then var CITY ARTHE
     if $zoneid = 1 then var CITY CROSSING
     if $zoneid = 61 then var CITY LETH
     if $zoneid = 67 then var CITY SHARD
     if $zoneid = 116 then var CITY HIB
     if !matchre("$zoneid","(1|7|42|30|61|67|90|99|116)") then goto ERROR.UNKNOWN
     echo
     echo *** STARTING CITY: %CITY
     echo
     pause 0.5
     RETURN

ERROR.UNKNOWN:
     put #beep
     echo
     echo **** ERROR: UNKNOWN LOCATION!
     echo **** SCRIPT ONLY SUPPORTS THE FOLLOWING CITIES:
     echo **** THEREN / RIVERHAVEN
     echo **** CROSSINGS / ARTHE DALE
     echo **** LETH DERIEL / SHARD / HIBARNHVIDAR 
     echo **** RATHA / AESRY
     echo *** MOVE TO VALID CITY AND RESTART SCRIPT
     echo
     put #beep
     put #beep
     pause 3
     echo **** ERROR: UNKNOWN LOCATION!
     echo **** ABORTING SCRIPT
     put #beep
     put #beep
     put #beep
     put #parse DONE STEALING
     put #parse STEALING DONE
	 put #script resume raeloktrain
     exit
############################################################################################
##########################
# MOVEMENT ENGINE
##########################
##### AUTOMOVE SUBROUTINE #####
AUTOMOVE:
     pause 0.1
     pause 0.1
	pause 0.1
     var Destination $0
     if ("%guild" = "Necromancer") then gosub EOTB
     if !$standing then gosub STAND
     if $roomid = %Destination then RETURN
AUTOMOVE_GO:
     matchre AUTOMOVE_RETURN ^SHOP CLOSED\!|SHOP CLOSED
     matchre AUTOMOVE_FAILED ^AUTOMAPPER MOVEMENT FAILED|^MOVE FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED
     send #goto %Destination
     matchwait
AUTOMOVE_STAND:
     send STAND
     pause 0.5
     if $standing then RETURN
     goto AUTOMOVE_STAND
AUTOMOVE_FAILED:
     pause 0.5
     pause 0.5
     pause 0.5
     goto AUTOMOVE_GO
AUTOMOVE_RETURN:
     if matchre("%Destination", "teller|exchange|debt|PAWN") then if $invisible = 1 then gosub stopinvis
     pause 0.2
     pause 0.1
	pause 0.1
     RETURN
######################
# Random Movement Subroutine
######################
MOVE.RANDOM:
     random 1 8
     if %r = 1 and $north = 0 then goto MOVE.RANDOM
     if %r = 2 and $northeast = 0 then goto MOVE.RANDOM
     if %r = 3 and $east = 0 then goto MOVE.RANDOM
     if %r = 4 and $southeast = 0 then goto MOVE.RANDOM
     if %r = 5 and $south = 0 then goto MOVE.RANDOM
     if %r = 6 and $southwest = 0 then goto MOVE.RANDOM
     if %r = 7 and $west = 0 then goto MOVE.RANDOM
     if %r = 8 and $northwest = 0 then goto MOVE.RANDOM
     #
     if %r = 1 then var Direction NORTH
     if %r = 2 then var Direction NORTHEAST
     if %r = 3 then var Direction EAST
     if %r = 4 then var Direction SOUTHEAST
     if %r = 5 then var Direction SOUTH
     if %r = 6 then var Direction SOUTHWEST
     if %r = 7 then var Direction WEST
     if %r = 8 then var Direction NORTHWEST
     #
     if %r = 1 then var Reverse.Direction SOUTH
     if %r = 2 then var Reverse.Direction SOUTHWEST
     if %r = 3 then var Reverse.Direction WEST
     if %r = 4 then var Reverse.Direction NORTHWEST
     if %r = 5 then var Reverse.Direction NORTH
     if %r = 6 then var Reverse.Direction NORTHEAST
     if %r = 7 then var Reverse.Direction EAST
     if %r = 8 then var Reverse.Direction SOUTHEAST
     #
     var Exits 0
     if $north = 1 then math Exits add 1
     if $northeast = 1 then math Exits add 1
     if $east = 1 then math Exits add 1
     if $southeast = 1 then math Exits add 1
     if $south = 1 then math Exits add 1
     if $southwest = 1 then math Exits add 1
     if $west = 1 then math Exits add 1
     if $northwest = 1 then math Exits add 1
     #
     # don't move "back" on a path unless we hit a dead end
     if %Exits > 1 and "%Last.Direction" = "%Reverse.Direction" then goto MOVE.RANDOM
     #
     var Last.Direction %Direction
     gosub MOVE.RESUME
     RETURN
MOVE:
    var Direction $0
    pause 0.1
    pause 0.1
MOVE.RESUME:
     matchre MOVE.RESUME ^\.\.\.wait|^Sorry\,
     matchre MOVE.RETREAT ^You are engaged to .*\!
     matchre MOVE.STAND ^You can't do that while lying down\.
     matchre MOVE.STAND ^You must be standing to do that\.
     matchre MOVE.STAND ^You must stand first\.
     matchre MOVE.STAND ^Stand up first\.
     matchre MOVE.FAILED ^You can't go there\.
     matchre MOVE.FAILED ^I could not find what you were referring to\.
     matchre MOVE.FAILED ^What were you referring to\?
     matchre MOVE.RETURN ^It's pitch dark|^Obvious
     send %Direction
     matchwait
MOVE.RETREAT:
     matchre MOVE.RETREAT ^\.\.\.wait|^Sorry\,
     matchre MOVE.RETREAT ^You retreat back to pole range.
     matchre MOVE.RETREAT ^You try to back away
     matchre MOVE.STAND ^You must stand first\.
     matchre MOVE.RESUME ^You retreat from combat\.
     matchre MOVE.RESUME ^You are already as far away as you can get\!
     send RETREAT
     matchwait
MOVE.STAND:
     matchre MOVE.STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE.STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE.STAND ^The weight
     matchre MOVE.STAND ^You try
     matchre MOVE.RESUME ^You are already standing\.
     matchre MOVE.RESUME ^You stand back up\.
     matchre MOVE.RESUME ^You stand up\.
     send STAND
     matchwait
MOVE.FAILED:
     gosub clear
     goto MOVE.RANDOM
MOVE.RETURN:
     RETURN

##########################################
#  UTILITY GOSUBS                                        #
##########################################
############################################################################################
SKILLCHECK:
     send skill thievery
     echo
     echo **** Checking Your Skills.............
     echo
     pause 0.5
     if $Thievery.Ranks < 20 then goto NOOB
     if $Thievery.Ranks >= 20 && $Thievery.Ranks < 40 then goto CLASS1
     if $Thievery.Ranks >= 40 && $Thievery.Ranks < 60 then goto CLASS2
     if $Thievery.Ranks >= 60 && $Thievery.Ranks < 100 then goto CLASS3
     if $Thievery.Ranks >= 100 && $Thievery.Ranks < 150 then goto CLASS4
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 200 then goto CLASS5
     if $Thievery.Ranks >= 200 && $Thievery.Ranks < 250 then goto CLASS6
     if $Thievery.Ranks >= 250 && $Thievery.Ranks < 300 then goto CLASS7
     if $Thievery.Ranks >= 300 && $Thievery.Ranks < 400 then goto CLASS8
     if $Thievery.Ranks >= 400 && $Thievery.Ranks < 500 then goto CLASS9
     if $Thievery.Ranks >= 500 && $Thievery.Ranks < 600 then goto CLASS10
     if $Thievery.Ranks >= 600 && $Thievery.Ranks < 700 then goto CLASS11
     if $Thievery.Ranks >= 700 && $Thievery.Ranks < 800 then goto CLASS12
     if $Thievery.Ranks >= 800 && $Thievery.Ranks < 900 then goto CLASS13
     if $Thievery.Ranks >= 900 && $Thievery.Ranks < 1000 then goto CLASS14
     if $Thievery.Ranks >= 1000 && $Thievery.Ranks < 1200 then goto CLASS15
     if $Thievery.Ranks >= 1200 then goto CLASS16
     pause 0.1
     goto SKILLCHECK
############################################################################################
EMPTY.HANDS:
     if ("$lefthand" != "Empty") then gosub empty left
     if ("$righthand" != "Empty") then gosub empty right
     RETURN
EMPTY:
var hand $0
EMPTY.IT:
          matchre EMPTY.IT ^\.\.\.wait|^Sorry\,
          matchre LOWER.HAND Whoah\!
          matchre LOWER.HAND If you still wish to drop it
          matchre WEBBED ^You can't do that while entangled in a web
          matchre IMMOBILE ^You don't seem to be able to move to do that
          matchre RETURN ^You drop
          matchre RETURN already empty
          matchre RETURN ^What were you referring to\?
          matchre RETURN ^Please rephrase that command\.
          matchre RETURN ^What were you referring to\?
          matchre RETURN ^But you aren't holding that\.
          matchre RETURN ^Roundtime
          matchre RETURN ^Having no further use for .*\, you discard it\.
          matchre RETURN ^I could not find what you were referring to\.
          matchre RETURN shatters
     put empty %hand
     matchwait
LOWER.HAND:
     if "$righthand" != "Empty" then put lower $righthandnoun
     if "$lefthand" != "Empty" then put lower $lefthandnoun
     RETURN
#CIRCLE
CIRCLE.CHECK:
     if $zoneid = 1 then var GL kalag
     if $zoneid = 30 then var GL crow
     if $zoneid = 67 then var GL saishla
     if $zoneid = 90 then var GL dwillig
     pause 0.5
     matchre CIRCLE.UP Excellent work, $charactername|Congrats, $charactername|$charactername, you made it to the next rank|I'll let it be known you've moved up in the underworld|You're ready to train for your next rank|You are ready to train for your next level
     matchre CIRCLE.RETURN You have some work to do|you should work on
     put ask %GL about exp
     matchwait 9
     RETURN
CIRCLE.UP:
     pause 0.1
     pause 0.1
     action var circle $1;put #var circle $1 when Circle: (\d+)
     send info;encum
     waitforre ^\s*Encumbrance\s*\:
     action remove Circle: (\d+)
     pause 0.1
     pause 0.1
     put #echo >Log Chartreuse *** DING!!! CIRCLE $circle ! **** 
     goto CIRCLE.CHECK
CIRCLE.RETURN:
     RETURN
############################################################################################
GUILD.CHECK:
     echo
     echo **** CHECKING GUILD...................
     echo
     action var guild $1;put #var guild $1 when Guild: (\S+)
     action var circle $1;put #var circle $1 when Circle: (\d+)
     send info;encum
     waitforre ^\s*Encumbrance\s*\:
     action remove Guild: (\S+)
     action remove Circle: (\d+)
     pause 0.1
     echo **** Guild: %guild  ****
     echo **** Circle: %circle ****
     if ("%guild" = "Thief") then
        {
            var marking ON
            if ("%HAVEN.PW" = "null") || ("%SHARD.PW" = "null") then goto NO.PASSWORD
            if ("%BIN" = "ON") && ("%PAWN" = "ON") && ("%BIN.CONTAINER" = "%PAWN.CONTAINER") then goto BAG.ALERT
            #if (%STEALCOUNT = 5) && ($Thievery.Ranks < 120) then var STEALCOUNT 4
        }
     if ("%guild" != "Thief") then
        {
            var BIN OFF
            var marking OFF
        }
     if $gamename != DRF then var CLANITEM NO
     put #var save
     RETURN
############################################################################################
TIME.CALC:
     evalmath runTime (%t / 60)
     evalmath runTime round(%runTime,2)
     RETURN
TIME.CHECK:
     echo **** CHECKING TIME....
     matchre NIGHT.TIME early evening|mid-evening|late evening|evening|midnight|night|dawn|sunset|approaching sunrise|sunrise|you can't tell
     matchre DAY.TIME early morning|mid-morning|midday|late morning|noon|early afternoon|mid-afternoon|late afternoon|dusk
     send time
     matchwait 5
     goto NIGHT.TIME
DAY.TIME:
     put #var TIME DAY
     var TIME DAY
     send observe weather
     pause 0.5
     RETURN
NO.TIME:
NIGHT.TIME:
     put #var TIME NIGHT
     var TIME NIGHT
     send observe weather
     pause 0.5
     RETURN
##############################################################################################
PREMIUM.CHECK:
     matchre PREMIUM.NO ^You are not currently a Premium
     matchre PREMIUM.YES ^Your premium service has been continuous
     put ltb info
     matchwait 5
     goto PREMIUM.NO
PREMIUM.NO:
     var PREMIUM OFF
     echo *** PREMIUM ACCOUNT NOT ACTIVE
     echo *** USING REGULAR BANK TO EXCHANGE COINS
     pause
     RETURN
PREMIUM.YES:
     var PREMIUM ON
     echo *** PREMIUM ACCOUNT ENABLED
     echo *** USING PREMIUM BANK TO EXCHANGE COINS
     pause
     RETURN
##############################################################################################
PAUSE:
     if ($roundtime > 0) then pause $roundtime
     pause 0.5
     pause 0.1
     RETURN
STAND:
     pause 0.2
     matchre STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre STAND ^\.\.\.wait|^Sorry\,
     matchre STAND ^You are so unbalanced you cannot manage to stand\.
     matchre STAND ^The weight of all your possessions prevents you from standing\.
     matchre STAND ^You are overburdened and cannot manage to stand\.
     matchre STAND ^You are still stunned
     matchre STAND ^You try
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You are already standing\.
     matchre RETURN ^You stand back up\.
     matchre RETURN ^You stand up\.
     matchre RETURN ^There doesn't seem to be anything to stand on here
     matchre RETURN ^You swim back up
     matchre RETURN ^You are already standing\.
     matchre RETURN ^You're unconscious
     send STAND
     matchwait
RET.HIDE:
     put stop hum
     wait
     pause 0.1
     pause 0.1
     put ret
     put ret
     pause 0.5
     pause 0.2
HIDE:
     matchre HIDE ^\.\.\.wait|^Sorry\,
     matchre RET.HIDE You are too close|^You are a bit|^You are too busy
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^.* notices your attempt to hide\!
     matchre RETURN ^.* reveals you, ruining your hiding attempt\!|
     matchre RETURN ^.* discovers you, ruining your hiding place\!
     matchre RETURN ^You melt|^You blend|^Eh\?|^You slip|^Roundtime|You look around
     put hide
     matchwait 5
     RETURN
SNEAK:
     var direction $0
     if (("%guild" = "Thief") && (%circle < 50)) then goto SNEAK.HIDE
SNEAKING:
     pause 0.1
     matchre SNEAK.PAUSE ^\.\.\.wait|^Sorry\,
     matchre RETURN Roundtime|You sneak|You duck|You quickly slip
     send sneak %direction
     matchwait 5
SNEAK.PAUSE:
     pause
     goto SNEAKING
SNEAK.HIDE:
     pause 0.2
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SNEAK.HIDE notices your attempt|reveals you|ruining your hiding place|discovers you
     matchre SNEAKING ^You melt|^You blend|^Eh\?|^You slip|^Roundtime|You look around
     send hide
     matchwait
UNHIDE:
     pause 0.1
     matchre UNHIDE ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are not hidden\!
     matchre RETURN ^You come out of hiding\.
     send UNHIDE
     matchwait 5
     RETURN
STOWING:
     var location STOWING
     pause 0.1
     if "$righthandnoun" = "rope" then put coil my rope
     if "$righthand" = "bundle" || "$lefthand" = "bundle" then put wear bund;drop bun
     if matchre("$righthandnoun","(crossbow|bow|short bow)") then gosub unload
     if matchre("$righthand","(partisan|shield|buckler|crossbow|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(partisan|shield|buckler|crossbow|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(longbow|khuj)") then gosub stow my $1 in my %SHEATH
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     RETURN
STOWIT:
     var location stow1
     var todo $0
stow1:
     pause 0.1
     pause 0.1
     if matchre("$righthand","longbow") then goto stow4
     matchre stow2 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^You stop as you realize
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^That can't be picked up
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo
     send stow %todo
     goto retry
stow2:
     pause 0.3
     pause 0.1
     var location stow2
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^But that is already in your inventory\.
     matchre stow3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo in my %PAWN.CONTAINER
     goto retry
stow3:
     pause 0.3
     pause 0.1
     var location stow3
     if "$lefthandnoun" = "bundle" then send drop bun
     if "$righthandnoun" = "bundle" then send drop bun
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^But that is already in your inventory\.
     matchre stow4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo in my %BIN.CONTAINER
     send stow %todo in my %BIN.CONTAINER
     goto retry
stow4:
     pause 0.5
     pause 0.1
     var location stow4
     if "$lefthandnoun" = "bundle" then send drop bun
     if "$righthandnoun" = "bundle" then send drop bun
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^But that is already in your inventory\.
     matchre STOW.DROP any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo in my %PAWN.CONTAINER
     send stow %todo in my %SAFE.CONTAINER
     goto retry

REM.WEAR:
     put rem bund
     put drop bund
     wait
     pause 0.5
     goto wear1
#### WEAR SUB
WEAR:
     delay 0.0001
     var stow $0
     var LOCATION WEAR_1
     WEAR_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW_1 ^You can't wear that\!
     matchre STOW_1 ^You can't wear any more items like that\.
     matchre STOW_1 ^You need at least one free hand for that\.
     matchre STOW_1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:sling|put|slide|slip|attach|work|strap) .*\.
     matchre RETURN ^You are already wearing that\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     send wear %stow
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN WEAR! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %stow
     put #log $datetime MISSING MATCH IN WEAR (utility.inc)
     return
search:
     var todo $0
     var location search
     matchre RETURN ^Success\!
     matchre RETURN ^Roundtime
     matchre RETURN ^You search around for a moment
     put search %todo
	matchwait 5
     goto retry
retry:
     matchre location ^\.\.\.wait
     matchre location ^Sorry, you may
     matchre location ^Sorry, system is slow
     matchre location ^You don't seem to be able to move to do that
     matchre location.p ^It's all a blur
     matchre location.p ^You're unconscious\!
     matchre location.p ^You are still stunned
     matchre location.p There is no need for violence here\.
     matchre location.p ^You can't do that while entangled in a web
     matchre location.p ^You struggle against the shadowy webs to no avail\.
     matchre location.p ^You attempt that, but end up getting caught in an invisible box\.
     matchre location1 ^You should stop playing before you do that\.
     matchre location1 ^You are a bit too busy performing to do that\.
     matchre location1 ^You are concentrating too much upon your performance to do that\.
     matchwait
location.unload:
     gosub unload
     var location stow1
     gosub stow1
     goto %location
location.unload1:
     gosub unload
     var location wear1
     gosub wear1
     goto %location
location1:
     gosub stop.humming1
     goto %location
location.p:
     pause
location:
     pause 0.3
     goto %location
RETURN.p:
     pause 0.1
unload:
     var location unload
     matchre RETURN ^You unload the
     matchre RETURN ^You remain concealed by your surroundings, convinced that your unloading
     matchre RETURN ^Roundtime:
     matchre RETURN ^But your
     matchre RETURN ^You don't have a
     matchre RETURN ^You can't unload such a weapon\.
     matchre RETURN ^Your
     send unload
     goto retry
     
#### PUT SUB
PUT:
     delay 0.0001
     var command $0
     var LOCATION PUT_1
     PUT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^You (?:hand|push|move|put|whisper|lean|tap|stop|drop|place|knock|fade|toss|set|add|offer|search|circle|fake|slip|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN_CLEAR ^USAGE\:
     matchre RETURN_CLEAR ^Your (?:actions|dance).*\.
     matchre RETURN_CLEAR ^You.*analyze
     matchre RETURN_CLEAR ^Having no further use for .*\, you discard it\.
     matchre RETURN_CLEAR ^You don't have a .* coin on you\!\s*The .* spider looks at you in forlorn disappointment\.
     matchre RETURN_CLEAR ^The .* spider turns away\, looking like it's not hungry for what you're offering\.
     matchre RETURN_CLEAR ^Brother Durantine nods slowly\.
     matchre RETURN_CLEAR ^Durantine waves a small censer over a neatly-wrapped package and intones a short prayer before he hands it to you\.
     matchre RETURN_CLEAR ^After a moment\, .*\.
     matchre RETURN_CLEAR ^Quietly touching your lips with the tips of your fingers as you kneel\, you make the Cleric's sign with your hand\.
     matchre RETURN_CLEAR ^Maybe you should stand up\.
     matchre RETURN_CLEAR ^The clerk counts out .*\.
     matchre RETURN_CLEAR ^The .* is not damaged enough to warrant repair\.
     matchre RETURN_CLEAR ^There is no more room in .*\.
     matchre RETURN_CLEAR ^There is nothing in there\.
     matchre RETURN_CLEAR ^In the .* you see .*\.
     matchre RETURN_CLEAR ^This spell cannot be targeted\.
     matchre RETURN_CLEAR ^You cannot figure out how to do that\.
     matchre RETURN_CLEAR ^You will now store .* in your .*\.
     matchre RETURN_CLEAR ^That tool does not seem suitable for that task\.
     matchre RETURN_CLEAR ^There isn't any more room in .* for that\.
     matchre RETURN_CLEAR ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN_CLEAR ^\s*LINK ALL CANCEL\s*\- Breaks all links
     matchre RETURN_CLEAR ^This ritual may only be performed on a corpse\.
     matchre RETURN_CLEAR ^There is nothing else to face\!
     matchre RETURN_CLEAR ^You're already stalking
	matchre RETURN_CLEAR ^An offer
	matchre RETURN_CLEAR ^Malik nods
	matchre RETURN_CLEAR ^Obvious exits
	matchre RETURN_CLEAR ^Obvious paths
     matchre RETURN_CLEAR ^But the merchant can't see you|are invisible
     matchre STAND ^You should stand up first\.
     # matchre RETURN_CLEAR ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %command
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >$Log Crimson $datetime Command = %command
     put #log $datetime MISSING MATCH IN PUT 
     RETURN
    
PUT_STOW:
     gosub stow
     goto PUT_1

#### GET SUB
GET:
     delay 0.0001
     var get $0
     var LOCATION GET_1
     GET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     # matchre RETURN ^\s*You get .*\.
     matchre RETURN ^You pick up .*\.
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^Get what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You (?:get|grab) .*(?:\.|\!|\?)
     matchre RETURN ^As best it can\, .* moves in your direction\.
     send get %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN GET
     RETURN

#### DOUBLE PUT SUB
PUT_IT:
     delay 0.0001
     var putit $0
     var LOCATION PUT_IT_1
     PUT_IT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:hand|push|move|put|tap|drop|place|knock|toss|set|add|search|circle|fake|slip|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^.* what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     send put %putit
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT_IT!  ***
     put #echo >$Log Crimson $datetime PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT_IT 
     RETURN

#### SPELL CASTING
PREPARE:
     delay 0.0001
     var prepare $0
     var LOCATION PREPARE_1
     PREPARE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_RETURN ^You are already preparing the .* spell\!
     matchre SPELL_CAST_RETURN ^You begin chanting .* to invoke the .* spell\.
     matchre SPELL_CAST_RETURN ^You mutter .* to yourself while preparing the .* spell\.
     matchre SPELL_CAST_RETURN ^With .* movements you prepare your body for the .* spell\.
     matchre SPELL_CAST_RETURN ^You raise your .* skyward\, chanting the .* of the .* spell\.
     matchre SPELL_CAST_RETURN ^You trace .* sigil in the air\, shaping the pattern of the .* spell\.
     matchre SPELL_CAST_RETURN ^You rock back and forth\, humming tunelessly as you invoke the .* spell\.
     matchre SPELL_CAST_RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You close your eyes and breathe deeply, gathering energy for the .* spell\.
     matchre SPELL_CAST_RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^A soft breeze surrounds your body as you confidently prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Tiny tendrils of lightning jolt between your hands as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Heatless orange flames blaze between your fingertips as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Entering a trance-like state\, your hands begin to tremble as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You adeptly sing the incantations for the .* spell\, setting the words to a favorite tune\.
     matchre SPELL_CAST_RETURN ^You bring your hand slowly to your forehead as you begin chanting the words of the .* spell\.
     matchre SPELL_CAST_RETURN ^Icy blue frost crackles up your arms with the ferocity of a blizzard as you begin to prepare the .* spell\!
     matchre SPELL_CAST_RETURN ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL_CAST_RETURN ^You giggle to yourself as you move through the syncopated gestures that accompany the preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^Darkly gleaming motes of sanguine light swirl briefly about your fingertips as you gesture while uttering the .* spell\.
     matchre SPELL_CAST_RETURN ^As you begin to solemnly intone the .* spell a blue glow swirls about forming a nimbus that surrounds your entire being\.
     matchre SPELL_CAST_RETURN ^Your skin briefly withers and tightens\, becoming gaunt as the energies of the .* spell begin to build up through your body\.
     matchre SPELL_CAST_RETURN ^You trace an intricate rune in the air with your finger\, illusory lines lingering several seconds as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You begin reciting a solemn incantation\, causing familiar patterns of geometric shapes to circle your hand as the .* spell forms\.
     matchre SPELL_CAST_RETURN ^You take up a handful of dirt in your palm to prepare the .* spell\.  As you whisper arcane words\, you gently blow the dust away and watch as it becomes swirling motes of glittering light that veil your hands in a pale aura\.
     matchre SPELL_CAST_RETURN ^You recall the exact details of the .* symbiosis\, preparing to integrate it with the next spell you cast\.
     matchre SPELL_CAST_RETURN ^But you've already prepared the .* symbiosis\!
     matchre SPELL_CAST_DONE ^What do you want to prepare\?
     matchre SPELL_CAST_DONE ^That is not a spell you can cast\.
     matchre SPELL_CAST_DONE ^You wouldn't have the first clue how to do that\.
     matchre SPELL_CAST_DONE ^You stop\, convinced that there's no way to control that much mana\.
     matchre SPELL_CAST_FAIL ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL_CAST_FAIL ^You feel intense strain as you try to manipulate the mana streams to form this pattern\, and you are not certain that you will have enough mental stamina to complete it\.
     send prepare %prepare
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PREPARE! (utility.inc) ***
     put #echo >$Log Crimson $datetime Prepare = %prepare
     put #log $datetime MISSING MATCH IN PREPARE! (utility.inc)
     goto SPELL_CAST_RETURN
SPELL_WAIT:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     matchre SPELL_CAST ^You feel fully prepared to cast your spell\.
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     matchwait
SPELL_CAST:
     delay 0.0001
     var LOCATION SPELL_CAST_1
     if ((!("$roomplayers" = "")) && (matchre("$preparedspell", "(Rite of Contrition|Eyes of the Blind)")) then gosub MOVE.RANDOM
     SPELL_CAST_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL_CAST_DONE ^You wave your hand\.
     matchre SPELL_CAST_DONE ^You gesture\.
     matchre SPELL_CAST_DONE ^Focus the power of justice on whom\?
     matchre SPELL_CAST_DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL_CAST_FAIL ^You don't have a spell prepared\!
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast;-2 gesture
     matchwait
SPELL_WAIT_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     matchre RETURN ^You feel fully prepared to cast your spell\.
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Your target pattern dissipates because the creature is dead\, but the main spell remains intact
     matchwait
SPELL_CAST_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     var target $0
     var LOCATION SPELL_CAST_TARGET_1
     SPELL_CAST_TARGET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL_CAST_DONE ^You gesture\.
     matchre SPELL_CAST_DONE ^Focus the power of justice on whom\?
     matchre SPELL_CAST_DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL_CAST_FAIL ^You don't have a spell prepared\!
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast %target;-2 gesture
     matchwait
SPELL_CAST_DONE:
     delay 0.0001
     put #queue clear
     return
SPELL_CAST_FAIL:
     delay 0.0001
     gosub RELEASE
SPELL_CAST_RETURN:
     delay 0.0001
     return
RELEASE_MANA:
     delay 0.0001
     if ("$preparedspell" != "None") then gosub RELEASE spell
     gosub RELEASE mana
     put #echo Crimson *****************************************************
     put #echo Crimson ***** ATTUNEMENT IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson *****************************************************
     if ($mana < 80) then waiteval ($mana > 79)
CHECK_MANA:
     delay 0.0001
     if ($mana < 25) then goto RELEASE_MANA
     return
RELEASE:
     delay 0.0001
     var release $0
     var LOCATION RELEASE_1
     RELEASE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^\s*Encumbrance\s*\:
     put -release %release;-encumbrance
     matchwait
HARNESS:
     delay 0.0001
     var harness $0
     var LOCATION HARNESS_1
     HARNESS_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RELEASE ^You strain\, but cannot harness that much power\.
     matchre RETURN ^You tap into the mana from .* of the surrounding streams and
     send harness %harness
     matchwait
     
#### HEALTH CHECKING
HEALTH.CHECK:
     if ("%HEALTH.CHECK" = "ON") then RETURN
     delay 0.0001
     put #tvar needHealing 0
     delay 0.5
     matchre HEALTH.GOOD ^You have no significant injuries\.
     matchre HEALTH.BAD ^hand
     matchre HEALTH.BAD ^\s*Encumbrance\s+\:
     put -health;-2 encumbrance
     matchwait 15
     goto HEALTH.CHECK
HEALTH.BAD:
     delay 0.0001
     put #tvar needHealing 1
     delay 0.5
     goto TOO.HURT
HEALTH.GOOD:
     delay 0.0001
     put #queue clear
     put #tvar needHealing 0
     delay 0.5
     RETURN
     
#### CATCH AND RETRY SUBS
WAIT:
     delay 0.0001
     pause 0.1
     if (!$standing) then gosub STAND
     goto %LOCATION
WEBBED:
     delay 0.0001
     if ($webbed) then waiteval (!$webbed)
     if (!$standing) then gosub STAND
     goto %LOCATION
IMMOBILE:
     delay 0.0001
     if contains("$prompt" , "I") then pause 20
     if (!$standing) then gosub STAND
     goto %LOCATION
STUNNED:
     delay 0.0001
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
#### RETURNS
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return
#########################################################

#########################################################################################
# PROGRESSIVE ITEM VARIABLE SECTION
#
# Please report any bugs, or items updates to skultamaphon at gmail.com
# If an item is too hard or stops teaching too early please let me know!
###########################################################################################
###########################
# SKILLS 20-39
###########################
CLASS1:
     ## THEREN
     var skillrange 20-39
     var T.Tarsha canons
     var T.Rose <nothing>
     var T.Music <nothing>
          var T.Music.Num
     var T.Hats <nothing>
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen charcoal
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric block
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
     var skillrange 20-39
     var RH.Herb water
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli <nothing>
     var RH.Arms <nothing>
     var RH.Gen purse
     var RH.Cloth <nothing>
     var RH.Artif <nothing>
     var RH.Joy chocolate
     var RH.Smoke <nothing>
     var RH.Weap <nothing>
     var RH.Bard pick
     var RH.Bard2 <nothing>
     var RH.Cleric grey-brown feather
     var RH.Cleric2  <nothing>
     var RH.Lock ordinary lockpick
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     ## ARTHE DALE
     var skillrange 20-39
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Thread <nothing>
     var AD.Fash <nothing>
     var AD.Odds <nothing>
     var AD.Bard <nothing>
     var AD.Map <nothing>
     var AD.Arm <nothing>
     var AD.Smoke <nothing>
     var AD.Tart.E <nothing>
     var AD.Tart.C <nothing>
     var AD.Tart.M <nothing>
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek cheese
     ## CROSSINGS
     var skillrange 20-39
     var C.Alch water
     var C.Artif <nothing>
     var C.Bath reed
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen bark
     var C.Weap <nothing>
     var C.Arm gloves
     var C.Music pick
     var C.Music2 <nothing>
     var C.Lock <nothing>
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 <nothing>
     var C.Empath3 <nothing>
          var C.Empath3.Loc
          var C.Empath3.Alt <nothing>
     var C.Cler chamomile
     var C.Haber <nothing>
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel <nothing>
     var C.Stitch <nothing>
     var C.Cobb <nothing>
     var C.Herb <nothing>
     var C.Flow rose
     ## LETH
     var skillrange 20-39
     var L.Skin <nothing>
     var L.Bow flights
     var L.Orig <nothing>
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard <nothing>
     var L.Bard2 <nothing>
     var L.Cloth <nothing>
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     ## SHARD
     var skillrange 20-39
     var S.Gen charcoal
     var S.Weap <nothing>
     var S.Cleric chamomile
     var S.Stitch gloves
     var S.Alch water
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music pick
     var S.Armor leather gloves
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow flights
     var S.Lock <nothing>
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill <nothing>
     var S.Herald <nothing>
          var S.Herald.Loc
     var S.Gift <nothing>
          var S.Gift.Loc
     var S.Toy <nothing>
          var S.Toy.Loc
     var S.Memory <nothing>
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber razor
     var S.Tanner <nothing>
     var S.Surv <nothing>
          var S.Surv.Loc
          var S.Surv.Alt <nothing>
     var S.Surv2 chicken flights
          var S.Surv2.Loc
          var S.Surv2.Alt hawk flights
     var S.Spire <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 20-39
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog <nothing>
     var H.Herb <nothing>
     var H.Sund incense
     var H.Lamp charcoal
     var H.Music <nothing>
     var H.Alch <nothing>
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen flights
     var RP.Tobac <nothing>
     # RATHA
     var skillrange 20-39
     var R.Bait worms
     var R.Gen rope
     var R.Herb water
     var R.Forge <nothing>
     var R.Tailor stockings
     var R.Leather <nothing>
     var R.Hair unguent
     var R.Music <nothing>
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.LOC
     var R.Jewelry <nothing>
     var R.Cleric chamomile
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 20-39
     var A.Herb water
     var A.Tanner <nothing>
     var A.Clothing <nothing>
     var A.Script <nothing>
     var A.Cleric pao
     var A.Origami <nothing>
     var A.Jewelry <nothing>
     var A.Magic <nothing>
     var A.Slings flights
     var A.Puzzle <nothing>
     var A.Footwear <nothing>
     var A.Shields <nothing>
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen charcoal
     var A.Flower <nothing>
     var A.Music pick
     pause 0.1
     gosub ITEM.COUNT0
     RETURN
##################################
# SKILLS 40-59
##################################
CLASS2:
     ## THEREN
     var skillrange 40-59
     var T.Tarsha canons
     var T.Rose socks
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen charcoal
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric incense
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
     var skillrange 40-59
     var RH.Herb mixing stick
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli <nothing>
     var RH.Arms dart
     var RH.Gen flint
     var RH.Cloth gown
     var RH.Artif <nothing>
     var RH.Joy truffle
     var RH.Smoke pouch
     var RH.Weap <nothing>
     var RH.Bard pick
     var RH.Bard2 hairpin
     var RH.Cleric incense
     var RH.Cleric2  <nothing>
     var RH.Lock ordinary lockpick
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 40-59
     var AD.Feta milk
          var AD.FETA.Loc on counter
     var AD.Thread pouch
     var AD.Fash <nothing>
     var AD.Odds <nothing>
     var AD.Bard <nothing>
     var AD.Map <nothing>
     var AD.Arm smooth rocks
     var AD.Smoke <nothing>
     var AD.Tart.E <nothing>
     var AD.Tart.C <nothing>
     var AD.Tart.M <nothing>
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek socks
     # CROSSINGS
     var skillrange 40-59
     var C.Alch alcohol
     var C.Artif <nothing>
     var C.Bath reed
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen small box
     var C.Weap sling
     var C.Arm gloves
     var C.Music pick
     var C.Music2 <nothing>
     var C.Lock slim lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 <nothing>
     var C.Empath3 <nothing>
          var C.Empath3.Loc on hook
          var C.Empath3.Alt
     var C.Cler lavender
     var C.Haber hood
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel <nothing>
     var C.Stitch hair bow
     var C.Cobb <nothing>
     var C.Herb <nothing>
     var C.Flow rose
     # LETH DERIEL
     var skillrange 40-59
     var L.Skin <nothing>
     var L.Bow arrowhead
     var L.Orig <nothing>
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard <nothing>
     var L.Bard2 cloth
     var L.Cloth <nothing>
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 40-59
     var S.Gen hairbrush
     var S.Weap <nothing>
     var S.Cleric sirese flower
     var S.Stitch gloves
     var S.Alch mixing stick
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music rag
     var S.Armor leather gloves
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow glue
     var S.Lock iron keyblank
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill gloves
     var S.Herald <nothing>
          var S.Herald.Loc
     var S.Gift <nothing>
          var S.Gift.Loc
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber oil
     var S.Tanner <nothing>
     var S.Surv oil
          var S.Surv.Loc
          var S.Surv.Alt <nothing>
     var S.Surv2 glue
          var S.Surv2.Loc
          var S.Surv2.Alt hawk flights
      var S.Spire <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 40-59
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog toothpicks
     var H.Herb <nothing>
     var H.Sund incense
     var H.Lamp torch
     var H.Music cloth
     var H.Alch mixing stick
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
     var RP.Tobac pine pipe
     # RATHA
     var skillrange 40-59
     var R.Bait cheese
     var R.Gen biscuit
     var R.Herb alcohol
     var R.Forge <nothing>
     var R.Tailor stockings
     var R.Leather <nothing>
     var R.Hair unguent
     var R.Music rag
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.LOC
     var R.Jewelry <nothing>
     var R.Cleric plume feather
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 40-59
     var A.Herb stick
     var A.Tanner thread
     var A.Clothing <nothing>
     var A.Script <nothing>
     var A.Cleric sage
     var A.Origami paper
     var A.Jewelry <nothing>
     var A.Magic <nothing>
     var A.Slings fishtail arrowhead
     var A.Puzzle beanbags
     var A.Footwear socks
     var A.Shields <nothing>
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen flint
     var A.Flower <nothing>
     var A.Music pick
     pause 0.1
     gosub ITEM.COUNT1
     RETURN
##################################
# SKILLS 60-99
##################################
CLASS3:
     ## THEREN
     var skillrange 60-99
     var T.Tarsha canons
     var T.Rose socks
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen carving knife
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric incense
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
      var skillrange 60-99
     var RH.Herb oil
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli claw gloves
     var RH.Arms bolts
     var RH.Gen bark
     var RH.Cloth sash
     var RH.Artif <nothing>
     var RH.Joy water
     var RH.Smoke sungrown cigar
     var RH.Weap club
     var RH.Bard pick
     var RH.Bard2 hairpin
     var RH.Cleric candle
     var RH.Cleric2  <nothing>
     var RH.Lock stout lockpick
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 60-99
     var AD.Feta yogurt
          var AD.FETA.Loc
     var AD.Thread pouch
     var AD.Fash snood
     var AD.Odds <nothing>
     var AD.Bard <nothing>
     var AD.Map <nothing>
     var AD.Arm hood
     var AD.Smoke sungrown cigar
     var AD.Tart.E <nothing>
     var AD.Tart.C <nothing>
     var AD.Tart.M tart
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek boots
     # CROSSINGS
     var skillrange 60-99
     var C.Alch pestle
     var C.Artif <nothing>
     var C.Bath soap
          var C.Bath.Num
          var C.Bath.Loc in basin
     var C.Card <nothing>
     var C.Gen flint
     var C.Weap sling
     var C.Arm leather aventail
     var C.Music rag
     var C.Music2 drum stick
     var C.Lock stout lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 <nothing>
     var C.Empath3 <nothing>
          var C.Empath3.Loc on hook
          var C.Empath3.Alt <nothing>
     var C.Cler incense
     var C.Haber skullcap
     var C.Script <nothing>
     var C.Tann thread
          var C.Tann.Loc
     var C.Jewel hairpin
     var C.Stitch cloche
     var C.Cobb moccasins
     var C.Herb <nothing>
     var C.Flow <nothing>
     # LETH DERIEL
     var skillrange 60-99
     var L.Skin <nothing>
     var L.Bow arrowhead
     var L.Orig white paper
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard recorder
     var L.Bard2 cloth
     var L.Cloth <nothing>
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 60-99
     var S.Gen unguent
     var S.Weap <nothing>
     var S.Cleric incense
     var S.Stitch hood
     var S.Alch pestle
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music cloth
     var S.Armor collar
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow shears
     var S.Lock iron keyblank
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill straw hat
     var S.Herald <nothing>
          var S.Herald.Loc
     var S.Gift <nothing>
          var S.Gift.Loc
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber oil
     var S.Tanner thread
     var S.Surv wood pestle
          var S.Surv.Alt stone pestle
          var S.Surv.Loc
     var S.Surv2 falcon flights
          var S.Surv2.Alt wood shaper
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 60-99
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog white soap
     var H.Herb <nothing>
     var H.Sund bone comb
     var H.Lamp lamp oil
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
     var RP.Tobac pipe
     # RATHA
     var skillrange 60-99
     var R.Bait pole
     var R.Gen lobscouse stew
     var R.Herb pestle
     var R.Forge <nothing>
     var R.Tailor shirt
     var R.Leather <nothing>
     var R.Hair hairbrush
     var R.Music pick
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.LOC
     var R.Jewelry chain
     var R.Cleric wine
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 60-99
     var A.Herb pestle
     var A.Tanner thread
     var A.Clothing britches
     var A.Script <nothing>
     var A.Cleric incense
     var A.Origami <nothing>
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings shaper
     var A.Puzzle beanbags
     var A.Footwear socks
     var A.Shields <nothing>
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen trowel
     var A.Flower wristlet
     var A.Music bow
     pause 0.1
     gosub ITEM.COUNT1
     RETURN
##################################
# SKILLS 100-149
##################################
CLASS4:
     ## THEREN
     var skillrange 100-149
     var T.Tarsha gorget 
     var T.Rose kilt
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen satchel
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric mortar
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 100-149
     var RH.Herb yelith root
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow <nothing>
     var RH.Seli studded helm
     var RH.Arms kris
     var RH.Gen knapsack
     var RH.Cloth robes
     var RH.Artif simple talisman
     var RH.Joy perfume
     var RH.Smoke apple pipe
     var RH.Weap club
     var RH.Bard tipper
     var RH.Bard2 beaded earrings
     var RH.Cleric pomander
     var RH.Cleric2 bottle
     var RH.Lock stout lockpick
     var RH.Tog beaded slippers
     var RH.Tog2 <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 100-149
     var AD.Feta wayfarer cheese
          var AD.FETA.Loc
     var AD.Thread pouch
     var AD.Fash neckerchief
     var AD.Odds fan
     var AD.Bard rag
     var AD.Map <nothing>
     var AD.Arm bodkin
     var AD.Smoke telgi cigar
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek boots
     # CROSSINGS
     var skillrange 100-149
     var C.Alch pestle
     var C.Artif <nothing>
     var C.Bath towel
          var C.Bath.Num
          var C.Bath.Loc on stand
     var C.Card <nothing>
     var C.Gen knapsack
     var C.Weap dagger
     var C.Arm reinforced gloves
     var C.Music cloth
     var C.Music2 maple guiro
     var C.Lock slim lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 scalpel
     var C.Empath3 button
          var C.Empath3.Loc on case
          var C.Empath3.Alt <nothing>
     var C.Cler wine
     var C.Haber tam
     var C.Script <nothing>
     var C.Tann thread
          var C.Tann.Loc
     var C.Jewel pin
     var C.Stitch sash
     var C.Cobb sandals
     var C.Herb jadice flower
     var C.Flow <nothing>
     # LETH DERIEL
     var skillrange 100-149
     var L.Skin buckskin pelt
     var L.Bow bolts
     var L.Orig silver paper
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick wicker quiver
     var L.Bard ocarina
     var L.Bard2 cloth
     var L.Cloth moufles
     var L.Wood <nothing>
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 100-149
     var S.Gen short sword
     var S.Weap targe
     var S.Cleric candle
     var S.Stitch cloak
     var S.Alch large bowl
     var S.Herb riolur leaf
     var S.Artif <nothing>
     var S.Music tipper
     var S.Armor reinforced greaves
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow arrows
     var S.Lock bronze lockpick
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill willow fan
     var S.Herald <nothing>
          var S.Herald.Loc
     var S.Gift doll
          var S.Gift.Loc on shelf
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber clippers
     var S.Tanner hide scraper
     var S.Surv wood pestle
          var S.Surv.Alt stone pestle
          var S.Surv.Loc
     var S.Surv2 wood shaper
          var S.Surv2.Alt steel shaper
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 100-149
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog white soap
     var H.Herb <nothing>
     var H.Sund bone comb
     var H.Lamp lamp oil
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
     var RP.Tobac pipe
CLASS4.ISLAND:
     # RATHA
     var skillrange 100-149
     var R.Bait pole
     var R.Gen polish
     var R.Herb large jar
     var R.Forge dagger
     var R.Tailor sash
     var R.Leather <nothing>
     var R.Hair clippers
     var R.Music tambourine
     var R.Magic talisman
     var R.Origami white paper
          var R.Origami.LOC
     var R.Jewelry bangle
     var R.Cleric candle
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 100-149
     var A.Herb pestle
     var A.Tanner shears
     var A.Clothing britches
     var A.Script trimmed scroll
     var A.Cleric candle
     var A.Origami <nothing>
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings canvas sling
     var A.Puzzle basic puzzle
     var A.Footwear pouch
     var A.Shields <nothing>
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen tinderbox
     var A.Flower wristlet
     var A.Music cloth
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 150-199
##################################
CLASS5:
     ## THEREN
     var skillrange 150-199
     var T.Tarsha canons
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen carving knife
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric pestle
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth suspenders
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 150-199
     var RH.Herb riolur leaf
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow <nothing>
     var RH.Seli studded helm
     var RH.Arms rapier
     var RH.Gen razor
     var RH.Cloth jerkin
     var RH.Artif simple talisman
     var RH.Joy troll
     var RH.Smoke lanival pipe
     var RH.Weap <nothing>
     var RH.Bard tipper
     var RH.Bard2 earrings
     var RH.Cleric pomander
     var RH.Cleric2 bottle
     var RH.Lock slim lockpick
     var RH.Tog beaded slippers
     var RH.Tog2 <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 150-199
     var AD.Feta anlibues cheese
          var AD.FETA.Loc
     var AD.Thread bobbin
     var AD.Fash shawl
     var AD.Odds fan
     var AD.Bard four strings
     var AD.Map <nothing>
     var AD.Arm sword
     var AD.Smoke cigarillo
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek skinning knife
     # CROSSINGS
     var skillrange 150-199
     var C.Alch dracon crystals
     var C.Artif talisman
     var C.Bath bathrobe
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen sheath
     var C.Weap gauntlet
     var C.Arm cloak
     var C.Music ocarina
     var C.Music2 ebony guiro
     var C.Lock lockpick ring
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 garland
     var C.Empath3 button
          var C.Empath3.Loc on case
          var C.Empath3.Alt <nothing>
     var C.Cler silver vial
     var C.Haber jerkin
     var C.Script <nothing>
     var C.Tann bodkin
          var C.Tann.Loc
     var C.Jewel engagement ring
     var C.Stitch cloak
     var C.Cobb snowshoes
     var C.Herb junliar stem
     var C.Flow <nothing>
     # LETH DERIEL
     var skillrange 150-199
     var L.Skin deer skin
     var L.Bow long arrows
     var L.Orig case
          var L.Orig.Num fourth
     var L.Weap <nothing>
          var L.Weap.Loc in catalog
     var L.Wick wicker quiver
     var L.Bard flute
     var L.Bard2 four strings
     var L.Cloth tunic
     var L.Wood log
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 150-199
     var S.Gen clippers
     var S.Weap targe
     var S.Cleric armband
     var S.Stitch blouse
     var S.Alch tukai stones
     var S.Herb riolur leaf
     var S.Artif talisman
     var S.Music bow
     var S.Armor mail gauntlets
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow crossbow bolts
     var S.Lock bronze keyblank
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill lace fan
     var S.Herald <nothing>
          var S.Herald.Loc
     var S.Gift boggle doll
          var S.Gift.Loc in black basket
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber oil
     var S.Tanner scraper
     var S.Surv stone pestle
          var S.Surv.Alt wood pestle
          var S.Surv.Loc
     var S.Surv2 steel shaper
          var S.Surv2.Alt pine box
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 150-199
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog white soap
     var H.Herb <nothing>
     var H.Sund bone comb
     var H.Lamp <nothing>
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen pestle
		var RP.Gen.Loc on table
     var RP.Tobac pipe
     # RATHA
     var skillrange 150-199
     var R.Bait pole
     var R.Gen breaker
     var R.Herb cebi root
     var R.Forge dagger
     var R.Tailor tunic
     var R.Leather <nothing>
     var R.Hair clippers
     var R.Music flute
     var R.Magic <nothing>
     var R.Origami white paper
          var R.Origami.LOC
     var R.Jewelry clasp
     var R.Cleric vial
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 150-199
     var A.Herb cebi root
     var A.Tanner bodkin
     var A.Clothing tunic
     var A.Script trimmed scroll
     var A.Cleric wine
     var A.Origami plain paper
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings rocks
     var A.Puzzle intermediate puzzle
     var A.Footwear woolen tights
     var A.Shields kite shield
     var A.Weapon telek
     var A.Armor <nothing>
     var A.Gen razor
     var A.Flower necklace
     var A.Music bow
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 200-249
##################################
CLASS6:
     ## THEREN
     var skillrange 200-249
     var T.Tarsha greques
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen carving knife
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric pestle
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth suspenders
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 200-249
     var RH.Herb muljin sap
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli aventail
     var RH.Arms sword
     var RH.Gen shears
     var RH.Cloth doublet
     var RH.Artif simple talisman
     var RH.Joy bunny
     var RH.Smoke baron tobacco
     var RH.Weap mace
     var RH.Bard lyre
     var RH.Bard2 wristlet
     var RH.Cleric chalice
     var RH.Cleric2 black bottle
     var RH.Lock slim lockpick
     var RH.Tog ivory shirt
     var RH.Tog2 <nothing>
     var RH.Mirg anklet
     # ARTHE DALE
     var skillrange 200-249
     var AD.Feta butter cheese
          var AD.FETA.Loc
     var AD.Thread pattern
     var AD.Fash trousers
     var AD.Odds earring
     var AD.Bard itharr's
     var AD.Map pipe
     var AD.Arm wooden shield
     var AD.Smoke cigarillo
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek charm
     # CROSSINGS
     var skillrange 200-249
     var C.Alch tincture jar
     var C.Artif talisman
     var C.Bath bathrobe
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card case
     var C.Gen backpack
     var C.Weap rapier
     var C.Arm chain aventail
     var C.Music bodhran skin
     var C.Music2 ebony guiro
     var C.Lock slim lockpick
     var C.Empath scalpel
          var C.Empath.Alt <nothing>
     var C.Empath2 garland
     var C.Empath3 oak stylus
          var C.Empath3.Loc on box
          var C.Empath3.Alt <nothing>
     var C.Cler basin
     var C.Haber trousers
     var C.Script satchel
          var C.Script.Num second
     var C.Tann shears
          var C.Tann.Loc
     var C.Jewel coral hairpin
     var C.Stitch blouse
     var C.Cobb thigh boots
     var C.Herb riolur leaf
     var C.Flow corsage
     # LETH DERIEL
     var skillrange 200-249
     var L.Skin sluagh hide
     var L.Bow long arrows
     var L.Orig case
          var L.Orig.Num third
     var L.Weap <nothing>
          var L.Weap.Loc in catalog
     var L.Wick mesh sack
     var L.Bard woodwind case
     var L.Bard2 four strings
     var L.Cloth doublet
     var L.Wood applewood log
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf panther perfume
     # SHARD
     var skillrange 200-249
     var S.Gen short sword
     var S.Weap targe
     var S.Cleric armband
     var S.Stitch cloak
     var S.Alch seol weed
     var S.Herb genich stem
     var S.Artif simple talisman
     var S.Music four strings
     var S.Armor choker
     var S.Reed thigh bag
          var S.Reed.Num second
     var S.Bow crossbow bolts
     var S.Lock wrist sheath
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill sandals
     var S.Herald target shield
          var S.Herald.Loc
     var S.Gift boggle doll
          var S.Gift.Loc in black basket
     var S.Toy beard
          var S.Toy.Loc
     var S.Memory <nothing>
     var S.Token <nothing>
     var S.Museum black slippers
     var S.Barber tincture jar
     var S.Tanner shears
     var S.Surv stone pestle
          var S.Surv.Alt wood pestle
          var S.Surv.Loc
     var S.Surv2 steel shaper
          var S.Surv2.Alt stone-tipped arrows
          var S.Surv2.Loc
      var S.Spire pouch
     # HIB AND RAVEN'S POINT
     var skillrange 200-249
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog towel
     var H.Herb yelith root
     var H.Sund bone comb
     var H.Lamp serpent lamp
     var H.Music scroll
     var H.Alch stone pestle
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen stone mortar
     var RP.Tobac pipe
     # RATHA
     var skillrange 200-249
     var R.Bait pole
     var R.Gen strap
     var R.Herb riolur leaf
     var R.Forge sap
     var R.Tailor trousers
     var R.Leather gauntlets
     var R.Hair <nothing>
     var R.Music six strings
     var R.Magic talisman
     var R.Origami white paper
          var R.Origami.LOC
     var R.Jewelry silver chain
     var R.Cleric censer
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 200-249
     var A.Herb nemoih root
     var A.Tanner scraper
     var A.Clothing shirt
     var A.Script painted scroll
     var A.Cleric sandals
     var A.Origami plain paper
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings rocks
     var A.Puzzle bunny
     var A.Footwear lace stockings
     var A.Shields kite shield
     var A.Weapon telek
     var A.Armor <nothing>
     var A.Gen razor
     var A.Flower circlet
     var A.Music four strings
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 250-299
##################################
CLASS7:
     ## THEREN
     var skillrange 250-299
     var T.Tarsha greques
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen reed torch
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric pestle
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth suspenders
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 250-299
     var RH.Herb riolur leaf
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow wreath
     var RH.Seli bronze gauntlets
     var RH.Arms composite bow
     var RH.Gen shears
     var RH.Cloth houpelande
     var RH.Artif cambrinth ring
     var RH.Joy bunny
     var RH.Smoke riverhaven tobacco
     var RH.Weap thorny mace
     var RH.Bard refill
     var RH.Bard2 necklace
     var RH.Cleric chalice
     var RH.Cleric2 black bottle
     var RH.Lock slim lockpick
     var RH.Tog ivory shirt
     var RH.Tog2 <nothing>
     var RH.Mirg anklet
     # ARTHE DALE
     var skillrange 250-299
     var AD.Feta kirm cheese
          var AD.FETA.Loc
     var AD.Thread pattern
     var AD.Fash trousers
     var AD.Odds earring
     var AD.Bard silverlock
     var AD.Map pipe
     var AD.Arm vest
     var AD.Smoke baron tobacco
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek shirt
     # CROSSINGS
     var skillrange 250-299
     var C.Alch tincture jar
     var C.Artif talisman
     var C.Bath bathrobe
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card case
     var C.Gen backpack
     var C.Weap war club
     var C.Arm scale aventail
     var C.Music refill
     var C.Music2 violin bow
     var C.Lock lockpick ring
     var C.Empath slippers
          var C.Empath.Alt <nothing>
     var C.Empath2 mortar
     var C.Empath3 oak stylus
          var C.Empath3.Loc from box
          var C.Empath3.Alt <nothing>
     var C.Cler coffer
     var C.Haber doublet
     var C.Script satchel
          var C.Script.Num second
     var C.Tann pattern
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Stitch leggings
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow corsage
     # LETH DERIEL
     var skillrange 250-299
     var L.Skin cougar pelt
     var L.Bow leather quiver
     var L.Orig case
          var L.Orig.Num third
     var L.Weap <nothing>
          var L.Weap.Loc in catalog
     var L.Wick mesh sack
     var L.Bard mirliton
     var L.Bard2 refill
     var L.Cloth jerkin
     var L.Wood hazelwood log
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf panther perfume
     # SHARD
     var skillrange 250-299
     var S.Gen chain helm
     var S.Weap stiletto
     var S.Cleric oil
     var S.Stitch tunic
     var S.Alch seolarn weed
     var S.Herb hisan salve
     var S.Artif elbaite runestone
     var S.Music refill
     var S.Lock wrist sheath
     var S.Armor mesh handguards
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill doll
     var S.Herald medium buckler
          var S.Herald.Loc
     var S.Gift badge
          var S.Gift.Loc on stand
     var S.Toy book
          var S.Toy.Loc
     var S.Reed thigh bag
          var S.Reed.Num second
     var S.Memory pin
     var S.Token <nothing>
     var S.Museum black slippers
     var S.Barber tincture jar
     var S.Bow barbed arrows
     var S.Tanner pattern
     var S.Surv marble pestle
          var S.Surv.Alt stone pestle
          var S.Surv.Loc
     var S.Surv2 stone-tipped arrows
          var S.Surv2.Alt steel shaper
          var S.Surv2.Loc
      var S.Spire pouch
     # HIB AND RAVEN'S POINT
     var skillrange 250-299
     var SC.Weap <nothing>
     var H.Shield <nothing>
     var H.Jewel <nothing>
     var H.Tog slippers
     var H.Herb nemoih root
     var H.Sund clippers
     var H.Lamp serpent lamp
     var H.Music drum skin
     var H.Alch stone mortar
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen stone mortar
     var RP.Tobac tobacco
     # RATHA
     var skillrange 250-299
     var R.Bait pole
     var R.Gen ditty bag
     var R.Herb ithor potion
     var R.Forge sap
     var R.Tailor vest
     var R.Leather gauntlets
     var R.Hair razor
     var R.Music refill
     var R.Magic talisman
     var R.Origami blue paper
          var R.Origami.LOC
     var R.Jewelry collar
     var R.Cleric censer
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 250-299
     var A.Herb ithor potion
     var A.Tanner shears
     var A.Clothing trousers
     var A.Script canvas scroll
     var A.Cleric armband
     var A.Origami white paper
     var A.Jewelry earcuff
     var A.Magic marble
     var A.Slings canvas sling
     var A.Puzzle wand
     var A.Footwear lace stockings
     var A.Shields kite shield
     var A.Weapon telek
     var A.Armor chausses
     var A.Gen mirror
     var A.Flower wreath
     var A.Music seven strings
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 300-399
##################################
CLASS8:
     ## THEREN
     var skillrange 300-399
     var T.Tarsha greques
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen reed torch
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric pestle
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth suspenders
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 300-399
     var RH.Herb ithor potion
     var RH.Iron chain greaves
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow silk orchid
     var RH.Seli aventail
     var RH.Arms sword
     var RH.Gen stove
     var RH.Cloth dress
     var RH.Artif cambrinth ring
     var RH.Joy bunny
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard mandolin
     var RH.Bard2 amulet
     var RH.Cleric pomander
     var RH.Cleric2 wood shaper
     var RH.Lock lockpick ring
     var RH.Tog linen shirt
     var RH.Tog2 <nothing>
     var RH.Mirg toe-bells
     # ARTHE DALE
     var skillrange 300-399
     var AD.Feta anlibues cheese
          var AD.FETA.Loc
     var AD.Thread pattern
     var AD.Fash frock
     var AD.Odds doll
     var AD.Bard peri'el's
     var AD.Map pipe
     var AD.Arm cuirass
     var AD.Smoke whiskey cigar
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 300-399
     var C.Alch tincture jar
     var C.Artif talisman
     var C.Bath bath towel
          var C.Bath.Num
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen stove
     var C.Weap longsword
     var C.Arm chain helm
     var C.Music repair kit
     var C.Music2 violin bow
     var C.Lock lockpick ring
     var C.Empath scalpel
          var C.Empath.Alt slippers
     var C.Empath2 mortar
     var C.Empath3 journal
          var C.Empath3.Loc on shelf
          var C.Empath3.Alt button
     var C.Cler habit
     var C.Haber tabard
     var C.Script satchel
          var C.Script.Num second
     var C.Tann pattern
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Stitch shirt
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow boutonniere
     # LETH DERIEL
     var skillrange 300-399
     var L.Skin reaver pelt
     var L.Bow composite bow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap wolf-tail shield
     var L.Wick pannier
     var L.Bard keyed flute
     var L.Bard2 twelve strings
     var L.Cloth mantle
     var L.Wood ironwood log
     var L.Gen dice ankle sheath 
          var L.Gen.Alt <nothing>
     var L.Perf spice perfume
     # SHARD
     var skillrange 300-399
     var S.Gen backtube
     var S.Weap stiletto
     var S.Cleric golden bell
     var S.Stitch coat
     var S.Alch cauldron
     var S.Herb ithor potion
     var S.Artif elbaite runestone
     var S.Music gilded mandolin
     var S.Lock ivory lockpick
     var S.Armor helmet
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill doll
     var S.Herald ordinary shield
          var S.Herald.Loc
     var S.Gift sack
          var S.Gift.Loc
     var S.Toy black book
          var S.Toy.Loc
     var S.Reed thigh bag
          var S.Reed.Num second
     var S.Memory pin
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber brass razor
     var S.Bow composite bow
     var S.Tanner pattern
     var S.Surv stone mortar
          var S.Surv.Alt stone pestle
          var S.Surv.Loc
     var S.Surv2 razor-tipped arrows
          var S.Surv2.Alt broad-barbed arrows
          var S.Surv2.Loc
      var S.Spire backpack
     # HIB AND RAVEN'S POINT
     var skillrange 300-399
     var SC.Weap <nothing>
     var H.Shield ordinary shield
     var H.Jewel earrings
     var H.Tog shirt
     var H.Herb nemoih root
     var H.Sund lamp
     var H.Lamp serpent lamp
     var H.Music horn
     var H.Alch granite mortar
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen stone mortar
     var RP.Tobac tobacco
     # RATHA
     var skillrange 300-399
     var R.Bait pole
     var R.Gen quiver
     var R.Herb tincture jar
     var R.Forge sap
     var R.Tailor kilt
     var R.Leather gauntlets
     var R.Hair razor
     var R.Music lyre
     var R.Magic cambrinth ring
     var R.Origami bird instructions
          var R.Origami.LOC
     var R.Jewelry collar
     var R.Cleric oil
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 300-399
     var A.Herb seolarn weed
     var A.Tanner potion
     var A.Clothing doublet
     var A.Script canvas scroll
     var A.Cleric armband
     var A.Origami blue paper
     var A.Jewelry haedor
     var A.Magic cube
     var A.Slings needle arrows
     var A.Puzzle rings
     var A.Footwear spidersilk stockings
     var A.Shields kite shield
     var A.Weapon garz
     var A.Armor chausses
     var A.Gen lantern
     var A.Flower pillow
     var A.Music drum pouch
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 400-499
##################################
CLASS9:
     ## THEREN
     var skillrange 400-499
     var T.Tarsha houppelande
     var T.Rose cloak
     var T.Music harp case
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift throwing dagger
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen backsheath
     var T.Krrish bone
     var T.Lense bone ring
     var T.Cleric mobar blood
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth suspenders
     var T.Armory quiver
     var T.Forge hilt
     ## HAVEN
     var skillrange 400-499
     var RH.Herb ithor potion
     var RH.Iron steel greaves
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli aventail
     var RH.Arms sword
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif cambrinth ring
     var RH.Joy troll
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard boots
     var RH.Bard2 amulet
     var RH.Cleric pomander
     var RH.Cleric2 wood shaper
     var RH.Lock slim lockpick
     var RH.Tog linen shirt
     var RH.Tog2 <nothing>
     var RH.Mirg toe-bells
     # ARTHE DALE
     var skillrange 400-499
     var AD.Smoke whiskey cigar
     var AD.Thread pattern
     var AD.Fash overall
     var AD.Odds monocle
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm breastplate
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 400-499
     var C.Alch stove
     var C.Arm bascinet helm
     var C.Artif orb
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap light crossbow
     var C.Music case of silver
     var C.Music2 bohdran
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 silver chart
     var C.Empath3 petal
          var C.Empath3.Loc on case
          var C.Empath3.Alt bandage
     var C.Cler silver bell
     var C.Cler2 burlap sack
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num second
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond engagement ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow boutonniere
     # LETH DERIEL
     var skillrange 400-499
     var L.Skin blood wolf pelt
     var L.Bow composite bow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood apple
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 400-499
     var S.Gen backtube
     var S.Weap oben
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch stove
     var S.Herb ithor potion
     var S.Artif belradi potion
     var S.Music gittern
     var S.Armor balaclava
     var S.Reed thigh bag
          var S.Reed.Num
     var S.Museum black slippers
     var S.Bow composite bow
     var S.Lock signet ring
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald ordinary shield
          var S.Herald.Loc on rack
     var S.Gift doll
          var S.Gift.Loc
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
     var S.Token token
     var S.Barber razor
     var S.Tanner potion
     var S.Surv poncho
          var S.Surv.Loc
          var S.Surv.Alt steel dagger
     var S.Surv2 razor-tipped arrows
          var S.Surv2.Loc
          var S.Surv2.Alt broad-barbed arrows
     var S.Spire tabard
     # HIB AND RAVEN'S POINT
     var skillrange 400-499
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund broadsword
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 400-499
     var R.Bait <nothing>
     var R.Gen quiver
     var R.Herb portable stove
     var R.Forge poignard
     var R.Tailor tunic
     var R.Leather gloves
     var R.Hair razor
     var R.Music repair kit
     var R.Magic naphtha
     var R.Origami primer
          var R.Origami.LOC
     var R.Jewelry wedding band
     var R.Cleric mobar blood
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 400-499
     var A.Herb ithor potion
     var A.Tanner pattern
     var A.Clothing trousers
     var A.Script parchment
     var A.Cleric mobar blood
     var A.Origami yak instructions
     var A.Jewelry ring
     var A.Magic marble
     var A.Slings wool sling
     var A.Puzzle bunny
     var A.Footwear clogs
     var A.Shields kite shield
     var A.Weapon telek
     var A.Armor chausses
     var A.Gen lantern
     var A.Flower pillow
     var A.Music syrinx
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 500-599
##################################
CLASS10:
     ## THEREN
     var skillrange 500-599
     var T.Tarsha houppelande
     var T.Rose cloak
     var T.Music harp case
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift throwing dagger
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen backsheath
     var T.Krrish bone
     var T.Lense bone ring
     var T.Cleric mobar blood
     var T.Men trousers
     var T.Women dark veil
     var T.Cloth suspenders
     var T.Armory quiver
     var T.Forge hilt
     ## HAVEN
     var skillrange 500-599
     var RH.Herb ithor potion
     var RH.Iron chain helm
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli skull helm
     var RH.Arms longsword
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif potion
     var RH.Joy troll
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard silk trews
     var RH.Bard2 spirit earrings
     var RH.Cleric pomander
     var RH.Cleric2 pendant
     var RH.Lock slim lockpick
     var RH.Tog slippers
     var RH.Tog2 leggings
     var RH.Mirg silk fan
     # ARTHE DALE
     var skillrange 500-599
     var AD.Smoke whiskey cigar
     var AD.Thread pattern
     var AD.Fash overall
     var AD.Odds monocle
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm leather coat
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 500-599
     var C.Alch bucket
     var C.Arm chain lorica
     var C.Artif urn
     var C.Bath towel
          var C.Bath.Num fourth
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap heavy crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt targe
     var C.Empath2 silver chart
     var C.Empath3 journal
          var C.Empath3.Loc on shelf
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num first
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond engagement ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow boutonniere
     # LETH DERIEL
     var skillrange 500-599
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 500-599
     var S.Gen light crossbow
     var S.Weap oben
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch stove
     var S.Herb ithor potion
     var S.Artif belradi potion
     var S.Music gittern
     var S.Armor balaclava
     var S.Reed skirt
          var S.Reed.Num sixth
     var S.Museum black slippers
     var S.Bow composite bow
     var S.Lock signet ring
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald ordinary shield
          var S.Herald.Loc on rack
     var S.Gift doll
          var S.Gift.Loc
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
     var S.Token token
     var S.Barber razor
     var S.Tanner potion
     var S.Surv wool poncho
          var S.Surv.Loc
          var S.Surv.Alt thigh quiver
     var S.Surv2 chunenguti
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
      var S.Spire tabard
     # HIB AND RAVEN'S POINT
     var skillrange 500-599
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund envelope
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac <nothing>
     # RATHA
     var skillrange 500-599
     var R.Bait <nothing>
     var R.Gen quiver
     var R.Herb bucket
     var R.Forge handaxe
     var R.Tailor tartan skirt
     var R.Leather boots
     var R.Hair razor
     var R.Music repair kit
     var R.Magic potion
     var R.Origami case
          var R.Origami.LOC
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 crystal vial
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 500-599
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric thumb ring
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear harness
     var A.Shields oval shield
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower pillow
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 600-699
##################################
CLASS11:
     ## THEREN
     var skillrange 600-699
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift pyramid
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen towel
     var T.Krrish bones
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men vest
     var T.Women dark veil
     var T.Cloth cane
     var T.Armory longsword
     var T.Forge hilt
     ## HAVEN
     var skillrange 600-699
     var RH.Herb ithor potion
     var RH.Iron ring mail
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli skull helm
     var RH.Arms longsword
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif potion
     var RH.Joy troll
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard silk trews
     var RH.Bard2 spirit earrings
     var RH.Cleric pomander
     var RH.Cleric2 wood shaper
     var RH.Lock slim lockpick
     var RH.Tog gown
     var RH.Tog2 leggings
     var RH.Mirg belt
     # ARTHE DALE
     var skillrange 600-699
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds monocle
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm leather coat
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 600-699
     var C.Alch bucket
     var C.Arm ring mail
     var C.Artif urn
     var C.Bath towel
          var C.Bath.Num fourth
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap heavy crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath leather boots
          var C.Empath.Alt targe
     var C.Empath2 silver chart
     var C.Empath3 band
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num first
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond wedding ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 600-699
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 600-699
     var S.Gen great helm
     var S.Weap cutlass
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch stove
     var S.Herb ithor potion
     var S.Artif cambrinth ring
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed skirt
          var S.Reed.Num fourth
     var S.Museum blouse
     var S.Bow composite bow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald medium buckler
          var S.Herald.Loc on rack
     var S.Gift earring
          var S.Gift.Loc
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
     var S.Token token
     var S.Barber razor
     var S.Tanner potion
     var S.Surv thigh quiver
          var S.Surv.Loc
          var S.Surv.Alt canvas pack
     var S.Surv2 longbow
          var S.Surv2.Loc on stand
          var S.Surv2.Alt chunenguti
      var S.Spire tabard
     # HIB AND RAVEN'S POINT
     var skillrange 600-699
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund envelope
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 600-699
     var R.Bait <nothing>
     var R.Gen quiver
     var R.Herb bucket
     var R.Forge handaxe
     var R.Tailor tartan skirt
     var R.Leather boots
     var R.Hair razor
     var R.Music repair kit
     var R.Magic potion
     var R.Origami case
          var R.Origami.LOC
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 crystal vial
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 600-699
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric thumb ring
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear harness
     var A.Shields oval shield
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower flask
     var A.Music drum
     gosub ITEM.COUNT4
     RETURN
##################################
# SKILLS 700-799
##################################
CLASS12:
     # THEREN
     var skillrange 700-799
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift pyramid
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen towel
     var T.Krrish bones
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men vest
     var T.Women dark veil
     var T.Cloth cane
     var T.Armory longsword
     var T.Forge hilt
     # HAVEN
     var skillrange 700-799
     var RH.Herb ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli skull helm
     var RH.Arms spear
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Smoke barons choice
     var RH.Weap mattock
     var RH.Bard mantle
     var RH.Bard2 spirit earrings
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Lock slim lockpick
     var RH.Tog gown
     var RH.Tog2 thumb ring
     var RH.Mirg chain anklet
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 700-799
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds ribbon
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 700-799
     var C.Alch bucket
     var C.Arm ring mail
     var C.Artif urn
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap heavy crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 silver chart
     var C.Empath3 band
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num first
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond wedding ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 700-799
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 700-799
     var S.Gen leather armor
     var S.Weap blade
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif celestite runestone
     var S.Music case
     var S.Armor great helm
     var S.Reed skirt
          var S.Reed.Num fourth
     var S.Museum earring
     var S.Bow silverwillow crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Gift doll
          var S.Gift.Loc
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
     var S.Token token
     var S.Barber razor
     var S.Tanner pelt potion
     var S.Surv cap
          var S.Surv.Loc
          var S.Surv.Alt cowl
     var S.Surv2 chunenguti
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
      var S.Spire armband
     # HIB AND RAVEN'S POINT
     var skillrange 700-799
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund envelope
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 700-799
     var R.Bait <nothing>
     var R.Gen broadsword
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor tartan skirt
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.LOC
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 crystal vial
     var R.Ring ironwood ring
     # AESRY SURLAENIS'A
     var skillrange 700-799
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT4
     RETURN
##################################
# SKILLS 800-899
##################################
CLASS13:
     # THEREN
     var skillrange 800-899
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men vest
     var T.Women dark veil
     var T.Cloth cane
     var T.Armory longsword
     var T.Forge hilt
     # HAVEN
     var skillrange 800-899
     var RH.Herb ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms spear
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Smoke barons choice
     var RH.Weap mattock
     var RH.Bard mantle
     var RH.Bard2 spirit tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog gown
     var RH.Tog2 thumb ring
     var RH.Mirg chain anklet
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 800-899
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds ribbon
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 800-899
     var C.Alch bucket
     var C.Arm ring mail
     var C.Artif urn
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap heavy crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 silver chart
     var C.Empath3 cebi root
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num fourth
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond wedding ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 800-899
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 800-899
     var S.Gen leather armor
     var S.Weap blade
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif celestite runestone
     var S.Music case
     var S.Armor great helm
     var S.Reed skirt
          var S.Reed.Num fourth
     var S.Museum earrings
     var S.Bow silverwillow crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Gift doll
          var S.Gift.Loc
     var S.Toy doll
          var S.Toy.Loc
     var S.Memory wrap
     var S.Token token
     var S.Barber razor
     var S.Tanner pelt potion
     var S.Surv cap
          var S.Surv.Loc
          var S.Surv.Alt cowl
     var S.Surv2 chunenguti
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HIB AND RAVEN'S POINT
     var skillrange 800-899
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund broadsword
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 800-899
     var R.Bait <nothing>
     var R.Gen broadsword
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor tartan skirt
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.LOC
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 prayer beads
     var R.Ring ironwood ring
     # AESRY SURLAENIS'A
     var skillrange 800-899
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT5
     RETURN
##################################
# SKILLS 900-999
##################################
CLASS14:
     # THEREN
     var skillrange 900-999
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men tunic
     var T.Women dark veil
     var T.Cloth gold cufflinks
     var T.Armory pick
     var T.Forge hilt
     # HAVEN
     var skillrange 900-999
     var RH.Herb ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms flamberge
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Smoke barons choice
     var RH.Weap lucerne hammer
     var RH.Bard mantle
     var RH.Bard2 spirit tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog gown
     var RH.Tog2 thumb ring
     var RH.Mirg chainmail belt
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 900-999
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds ribbon
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 900-999
     var C.Alch bucket
     var C.Arm ring mail
     var C.Artif urn
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap heavy crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 rock chart
     var C.Empath3 cebi root
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num third
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond wedding ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 900-999
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 900-999
     var S.Gen leather armor
     var S.Weap blade
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif celestite runestone
     var S.Music case
     var S.Armor great helm
     var S.Reed skirt
          var S.Reed.Num fourth
     var S.Museum earrings
     var S.Bow silverwillow crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Gift doll
          var S.Gift.Loc
     var S.Toy museum globe
          var S.Toy.Loc on lion
     var S.Memory wrap
     var S.Token token
     var S.Barber razor
     var S.Tanner pelt potion
     var S.Surv mining cap
          var S.Surv.Loc
          var S.Surv.Alt mining helm
     var S.Surv2 chunenguti
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HIB AND RAVEN'S POINT
     var skillrange 900-999
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund broadsword
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 900-999
     var R.Bait <nothing>
     var R.Gen broadsword
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor tartan skirt
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.LOC
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 prayer beads
     var R.Ring garnet ring
     # AESRY SURLAENIS'A
     var skillrange 900-999
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT5
     RETURN
##################################
# SKILLS 1000-1200
##################################
CLASS15:
CLASS16:
CLASS17:
     var skillrange 1000-1200+
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music bagpipe
          var T.Music.Num third
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men tunic
     var T.Women dark veil
     var T.Cloth cane
     var T.Armory longsword
     var T.Forge hilt
     var skillrange 1000-1200
     var RH.Herb  ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms flamberge
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Smoke barons choice
     var RH.Weap lucerne hammer
     var RH.Bard silk mantle
     var RH.Bard2 knot tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog diadem
     var RH.Tog2 slippers
     var RH.Mirg charm
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 1000-1200+
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds scarf
     var AD.Bard peri'el's song
     var AD.Map map
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 1000-1200+
     var C.Alch bucket
     var C.Arm ring mail
     var C.Artif bottle
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Weap heavy crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 rock chart
     var C.Empath3 cebi root
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num third
     var C.Tann potion
          var C.Tann.Loc in catalog
     var C.Jewel diamond wedding ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 1000-1200+
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 leather songbook
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh tunic
          var L.Gen.Alt mesh backpack
     var L.Perf venom oil
     # SHARD
     var skillrange 1000-1200
     var S.Gen leather armor
     var S.Weap blade
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif celestite runestone
     var S.Music case
     var S.Armor great helm
     var S.Reed skirt
          var S.Reed.Num
     var S.Museum globe
     var S.Bow ironwood crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Gift doll
          var S.Gift.Loc
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
            var S.Memory.Num
     var S.Token token
     var S.Barber razor
            var S.Barber.Num second
     var S.Tanner potion
     var S.Surv cap
          var S.Surv.Loc
          var S.Surv.Alt cowl
     var S.Surv2 chunenguti
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HIB AND RAVEN'S POINT
     var skillrange 1000-1200+
     var SC.Weap adze
     var H.Shield medium shield
     var H.Jewel necklace
     var H.Tog robe
     var H.Herb lujeakave elixir
     var H.Sund broadsword
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 1000-1200+
     var R.Bait <nothing>
     var R.Gen broadsword
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor tartan skirt
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.LOC
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 gold vial
     var R.Ring garnet ring
     # AESRY SURLAENIS'A
     var skillrange 1000-1200+
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT5
     RETURN
###############################################
###############################################
# ITEM QUANTITY
###############################################
###############################################
########################
# 20-49
########################
ITEM.COUNT0:
     var T.TarshaQuant 1
     var T.RoseQuant 1
     var T.MusicQuant 1
     var T.HatsQuant 1
     var T.ArmQuant 1
     var T.GiftQuant 1
     var T.SweetQuant 1
     var T.CupcakeQuant 1
     var T.GenQuant 1
     var T.KrrishQuant 1
     var T.LenseQuant 1
     var T.ClericQuant 1
     var T.MenQuant 1
     var T.WomenQuant 1
     var T.ClothQuant 1
     var T.ArmoryQuant 1
     var T.ForgeQuant 1

     var RH.HerbQuant 1
     var RH.IronQuant 1
     var RH.NaphQuant 1
     var RH.FlowQuant 3
     var RH.SeliQuant 1
     var RH.ArmsQuant 1
     var RH.GenQuant 1
     var RH.ClothQuant 1
     var RH.ArtifQuant 1
     var RH.JoyQuant 2
     var RH.SmokeQuant 1
     var RH.WeapQuant 1
     var RH.BardQuant 1
     var RH.Bard2Quant 1
     var RH.ClericQuant 1
     var RH.Cleric2Quant 1
     var RH.LockQuant 1
     var RH.TogQuant 1
     var RH.Tog2Quant 1
     var RH.MirgQuant 1

     var AD.FetaQuant 1
     var AD.ThreadQuant 1
     var AD.FashQuant 1
     var AD.OddsQuant 1
     var AD.BardQuant 1
     var AD.MapQuant 1
     var AD.ArmQuant 1
     var AD.SmokeQuant 1
     var AD.Tart.EQuant 1
     var AD.Tart.CQuant 1
     var AD.Tart.MQuant 1
     var AD.Tart.LQuant 1
     var AD.Tart.FQuant 1
     var KA.GrekQuant 1

     var C.AlchQuant 5
     var C.ArtifQuant 1
     var C.BathQuant 1
     var C.CardQuant 1
     var C.GenQuant 4
     var C.WeapQuant 1
     var C.ArmQuant 1
     var C.MusicQuant 1
     var C.Music2Quant 1
     var C.LockQuant 1
     var C.EmpathQuant 1
     var C.Empath2Quant 1
     var C.Empath3Quant 1
     var C.ClerQuant 1
     var C.HaberQuant 1
     var C.ScriptQuant 1
     var C.TannQuant 1
     var C.JewelQuant 1
     var C.StitchQuant 1
     var C.CobbQuant 1
     var C.HerbQuant 1
     var C.FlowQuant 3

     var L.SkinQuant 1
     var L.BowQuant 1
     var L.OrigQuant 1
     var L.WeapQuant 1
     var L.WickQuant 1
     var L.BardQuant 1
     var L.Bard2Quant 1
     var L.ClothQuant 1
     var L.WoodQuant 1
     var L.GenQuant 1
     var L.PerfQuant 1

     var S.GenQuant 1
     var S.WeapQuant 1
     var S.ClericQuant 1
     var S.StitchQuant 1
     var S.AlchQuant 1
     var S.HerbQuant 1
     var S.ArtifQuant 1
     var S.MusicQuant 1
     var S.ArmorQuant 1
     var S.ReedQuant 1
     var S.MuseumQuant 1
     var S.BowQuant 1
     var S.SpireQuant 1
     var S.LockQuant 1
     var S.CoinQuant 1
     var S.FrillQuant 1
     var S.HeraldQuant 1
     var S.GiftQuant 1
     var S.ToyQuant 1
     var S.MemoryQuant 1
     var S.TokenQuant 1
     var S.BarberQuant 1
     var S.TannerQuant 1
     var S.SurvQuant 1
     var S.Surv2Quant 1
     var RP.GenQuant 1
     var RP.TobacQuant 1

     var SC.WeapQuant 1
     var H.ShieldQuant 1
     var H.JewelQuant 1
     var H.TogQuant 1
     var H.HerbQuant 1
     var H.SundQuant 1
     var H.LampQuant 1
     var H.MusicQuant 1
     var H.AlchQuant 1
     var H.ForgeQuant 1
     var H.GenQuant 1
     var H.TobacQuant 1

     var R.BaitQuant 2
     var R.GenQuant 3
     var R.HerbQuant 5
     var R.ForgeQuant 1
     var R.TailorQuant 1
     var R.LeatherQuant 1
     var R.HairQuant 1
     var R.MusicQuant 1
     var R.MagicQuant 1
     var R.OrigamiQuant 1
     var R.JewelryQuant 1
     var R.ClericQuant 1
     var R.RingQuant 1

     var A.HerbQuant 5
     var A.TannerQuant 1
     var A.ClothingQuant 1
     var A.ScriptQuant 1
     var A.ClericQuant 1
     var A.OrigamiQuant 1
     var A.JewelryQuant 1
     var A.MagicQuant 1
     var A.SlingsQuant 1
     var A.PuzzleQuant 1
     var A.FootwearQuant 1
     var A.ShieldsQuant 1
     var A.WeaponQuant 1
     var A.ArmorQuant 1
     var A.GenQuant 3
     var A.FlowerQuant 1
     var A.MusicQuant 1
     RETURN
########################
# 50-99
########################
ITEM.COUNT1:
     var T.TarshaQuant 1
     var T.RoseQuant 1
     var T.MusicQuant 1
     var T.HatsQuant 1
     var T.ArmQuant 1
     var T.GiftQuant 1
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 2
     var T.KrrishQuant 1
     var T.LenseQuant 1
     var T.ClericQuant 1
     var T.MenQuant 1
     var T.WomenQuant 1
     var T.ClothQuant 1
     var T.ArmoryQuant 1
     var T.ForgeQuant 1

     var RH.HerbQuant 2
     var RH.IronQuant 1
     var RH.NaphQuant 1
     var RH.FlowQuant 3
     var RH.SeliQuant 1
     var RH.ArmsQuant 2
     var RH.GenQuant 2
     var RH.ClothQuant 2
     var RH.ArtifQuant 1
     var RH.JoyQuant 2
     var RH.SmokeQuant 2
     var RH.WeapQuant 1
     var RH.BardQuant 1
     var RH.Bard2Quant 1
     var RH.ClericQuant 2
     var RH.Cleric2Quant 1
     var RH.LockQuant 1
     var RH.TogQuant 1
     var RH.Tog2Quant 1
     var RH.MirgQuant 1

     var AD.FetaQuant 2
     var AD.ThreadQuant 2
     var AD.FashQuant 2
     var AD.OddsQuant 2
     var AD.BardQuant 1
     var AD.MapQuant 1
     var AD.ArmQuant 1
     var AD.SmokeQuant 2
     var AD.Tart.EQuant 1
     var AD.Tart.CQuant 2
     var AD.Tart.MQuant 2
     var AD.Tart.LQuant 2
     var AD.Tart.FQuant 1
     var KA.GrekQuant 1

     var C.AlchQuant 4
     var C.ArtifQuant 2
     var C.BathQuant 2
     var C.CardQuant 2
     var C.GenQuant 2
     var C.WeapQuant 2
     var C.ArmQuant 2
     var C.MusicQuant 2
     var C.Music2Quant 1
     var C.LockQuant 2
     var C.EmpathQuant 2
     var C.Empath2Quant 1
     var C.Empath3Quant 1
     var C.ClerQuant 2
     var C.HaberQuant 2
     var C.ScriptQuant 2
     var C.TannQuant 2
     var C.JewelQuant 2
     var C.StitchQuant 2
     var C.CobbQuant 2
     var C.HerbQuant 2
     var C.FlowQuant 2

     var L.SkinQuant 2
     var L.BowQuant 2
     var L.OrigQuant 2
     var L.WeapQuant 2
     var L.WickQuant 2
     var L.BardQuant 2
     var L.Bard2Quant 2
     var L.ClothQuant 2
     var L.WoodQuant 2
     var L.GenQuant 2
     var L.PerfQuant 2

     var S.GenQuant 2
     var S.WeapQuant 2
     var S.ClericQuant 2
     var S.StitchQuant 2
     var S.AlchQuant 2
     var S.HerbQuant 2
     var S.ArtifQuant 2
     var S.MusicQuant 2
     var S.ArmorQuant 2
     var S.ReedQuant 2
     var S.MuseumQuant 2
     var S.BowQuant 2
     var S.LockQuant 2
     var S.CoinQuant 2
     var S.FrillQuant 2
     var S.HeraldQuant 2
      var S.SpireQuant 1
     var S.GiftQuant 2
     var S.ToyQuant 2
     var S.MemoryQuant 2
     var S.TokenQuant 2
     var S.BarberQuant 2
     var S.TannerQuant 2
     var S.SurvQuant 2
     var S.Surv2Quant 2
     var RP.GenQuant 1
     var RP.TobacQuant 1

     var SC.WeapQuant 2
     var H.ShieldQuant 2
     var H.JewelQuant 2
     var H.TogQuant 2
     var H.HerbQuant 2
     var H.SundQuant 2
     var H.LampQuant 2
     var H.MusicQuant 2
     var H.AlchQuant 2
     var H.ForgeQuant 2
     var H.GenQuant 2
     var H.TobacQuant 2

     var R.BaitQuant 3
     var R.GenQuant 3
     var R.HerbQuant 2
     var R.ForgeQuant 1
     var R.TailorQuant 2
     var R.LeatherQuant 2
     var R.HairQuant 2
     var R.MusicQuant 2
     var R.MagicQuant 1
     var R.OrigamiQuant 2
     var R.JewelryQuant 1
     var R.ClericQuant 2
     var R.RingQuant 1

     var A.HerbQuant 2
     var A.TannerQuant 2
     var A.ClothingQuant 2
     var A.ScriptQuant 2
     var A.ClericQuant 2
     var A.OrigamiQuant 2
     var A.JewelryQuant 2
     var A.MagicQuant 2
     var A.SlingsQuant 2
     var A.PuzzleQuant 2
     var A.FootwearQuant 2
     var A.ShieldsQuant 2
     var A.WeaponQuant 2
     var A.ArmorQuant 2
     var A.GenQuant 2
     var A.FlowerQuant 3
     var A.MusicQuant 2
     RETURN
########################
# 100-299
########################
ITEM.COUNT2:
     var T.TarshaQuant 2
     var T.RoseQuant 2
     var T.MusicQuant 2
     var T.HatsQuant 2
     var T.ArmQuant 2
     var T.GiftQuant 2
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 2
     var T.KrrishQuant 2
     var T.LenseQuant 2
     var T.ClericQuant 2
     var T.MenQuant 2
     var T.WomenQuant 2
     var T.ClothQuant 2
     var T.ArmoryQuant 2
     var T.ForgeQuant 2

     var RH.HerbQuant 3
     var RH.IronQuant 2
     var RH.NaphQuant 2
     var RH.FlowQuant 3
     var RH.SeliQuant 2
     var RH.ArmsQuant 2
     var RH.GenQuant 2
     var RH.ClothQuant 2
     var RH.ArtifQuant 2
     var RH.JoyQuant 2
     var RH.SmokeQuant 2
     var RH.WeapQuant 2
     var RH.BardQuant 2
     var RH.Bard2Quant 2
     var RH.ClericQuant 2
     var RH.Cleric2Quant 2
     var RH.LockQuant 2
     var RH.TogQuant 2
     var RH.Tog2Quant 2
     var RH.MirgQuant 2

     var AD.FetaQuant 3
     var AD.ThreadQuant 3
     var AD.FashQuant 2
     var AD.OddsQuant 2
     var AD.BardQuant 3
     var AD.MapQuant 2
     var AD.ArmQuant 2
     var AD.SmokeQuant 2
     var AD.Tart.EQuant 2
     var AD.Tart.CQuant 2
     var AD.Tart.MQuant 3
     var AD.Tart.LQuant 2
     var AD.Tart.FQuant 3
     var KA.GrekQuant 2

     var C.AlchQuant 4
     var C.ArtifQuant 2
     var C.BathQuant 3
     var C.CardQuant 2
     var C.GenQuant 4
     var C.WeapQuant 3
     var C.ArmQuant 3
     var C.MusicQuant 3
     var C.Music2Quant 2
     var C.LockQuant 3
     var C.EmpathQuant 2
     var C.Empath2Quant 2
     var C.Empath3Quant 2
     var C.ClerQuant 3
     var C.HaberQuant 4
     var C.ScriptQuant 2
     var C.TannQuant 3
     var C.JewelQuant 3
     var C.StitchQuant 3
     var C.CobbQuant 3
     var C.HerbQuant 3
     var C.FlowQuant 3

     var L.SkinQuant 2
     var L.BowQuant 2
     var L.OrigQuant 2
     var L.WeapQuant 2
     var L.WickQuant 2
     var L.BardQuant 2
     var L.Bard2Quant 2
     var L.ClothQuant 2
     var L.WoodQuant 2
     var L.GenQuant 2
     var L.PerfQuant 2

     var S.GenQuant 3
     var S.WeapQuant 2
     var S.ClericQuant 3
     var S.StitchQuant 3
     var S.AlchQuant 2
     var S.HerbQuant 1
     var S.ArtifQuant 1
     var S.MusicQuant 2
     var S.ArmorQuant 2
     var S.ReedQuant 2
     var S.MuseumQuant 1
     var S.BowQuant 2
     var S.LockQuant 2
     var S.CoinQuant 1
     var S.SpireQuant 2
     var S.FrillQuant 2
     var S.HeraldQuant 2
     var S.GiftQuant 1
     var S.ToyQuant 2
     var S.MemoryQuant 2
     var S.TokenQuant 2
     var S.BarberQuant 1
     var S.TannerQuant 2
     var S.SurvQuant 2
     var S.Surv2Quant 2
     var RP.GenQuant 2
     var RP.TobacQuant 1

     var SC.WeapQuant 2
     var H.ShieldQuant 2
     var H.JewelQuant 2
     var H.TogQuant 1
     var H.HerbQuant 2
     var H.SundQuant 2
     var H.LampQuant 1
     var H.MusicQuant 2
     var H.AlchQuant 2
     var H.ForgeQuant 1
     var H.GenQuant 2
     var H.TobacQuant 2

     var R.BaitQuant 4
     var R.GenQuant 4
     var R.HerbQuant 2
     var R.ForgeQuant 2
     var R.TailorQuant 3
     var R.LeatherQuant 3
     var R.HairQuant 3
     var R.MusicQuant 3
     var R.MagicQuant 2
     var R.OrigamiQuant 3
     var R.JewelryQuant 2
     var R.ClericQuant 2
     var R.RingQuant 1

     var A.HerbQuant 2
     var A.TannerQuant 2
     var A.ClothingQuant 2
     var A.ScriptQuant 2
     var A.ClericQuant 2
     var A.OrigamiQuant 2
     var A.JewelryQuant 2
     var A.MagicQuant 2
     var A.SlingsQuant 2
     var A.PuzzleQuant 2
     var A.FootwearQuant 2
     var A.ShieldsQuant 1
     var A.WeaponQuant 2
     var A.ArmorQuant 2
     var A.GenQuant 2
     var A.FlowerQuant 3
     var A.MusicQuant 2
     RETURN
########################
# 300-599
########################
ITEM.COUNT3:
     var T.TarshaQuant 2
     var T.RoseQuant 2
     var T.MusicQuant 2
     var T.HatsQuant 2
     var T.ArmQuant 2
     var T.GiftQuant 2
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 2
     var T.KrrishQuant 2
     var T.LenseQuant 2
     var T.ClericQuant 2
     var T.MenQuant 2
     var T.WomenQuant 2
     var T.ClothQuant 2
     var T.ArmoryQuant 2
     var T.ForgeQuant 2

     var RH.HerbQuant 3
     var RH.IronQuant 3
     var RH.NaphQuant 3
     var RH.FlowQuant 3
     var RH.SeliQuant 3
     var RH.ArmsQuant 3
     var RH.GenQuant 3
     var RH.ClothQuant 3
     var RH.ArtifQuant 3
     var RH.JoyQuant 3
     var RH.SmokeQuant 3
     var RH.WeapQuant 3
     var RH.BardQuant 3
     var RH.Bard2Quant 3
     var RH.ClericQuant 3
     var RH.Cleric2Quant 3
     var RH.LockQuant 3
     var RH.TogQuant 3
     var RH.Tog2Quant 3
     var RH.MirgQuant 3

     var AD.FetaQuant 4
     var AD.ThreadQuant 4
     var AD.FashQuant 4
     var AD.OddsQuant 2
     var AD.BardQuant 4
     var AD.MapQuant 3
     var AD.ArmQuant 3
     var AD.SmokeQuant 3
     var AD.Tart.EQuant 4
     var AD.Tart.CQuant 4
     var AD.Tart.MQuant 3
     var AD.Tart.LQuant 4
     var AD.Tart.FQuant 3
     var KA.GrekQuant 3

     var C.AlchQuant 4
     var C.ArtifQuant 2
     var C.BathQuant 3
     var C.CardQuant 3
     var C.GenQuant 4
     var C.WeapQuant 4
     var C.ArmQuant 3
     var C.MusicQuant 4
     var C.Music2Quant 2
     var C.LockQuant 3
     var C.EmpathQuant 3
     var C.Empath2Quant 2
     var C.Empath3Quant 2
     var C.ClerQuant 4
     var C.HaberQuant 3
     var C.ScriptQuant 3
     var C.TannQuant 4
     var C.JewelQuant 3
     var C.StitchQuant 3
     var C.CobbQuant 3
     var C.HerbQuant 3
     var C.FlowQuant 4

     var L.SkinQuant 4
     var L.BowQuant 3
     var L.OrigQuant 3
     var L.WeapQuant 3
     var L.WickQuant 4
     var L.BardQuant 3
     var L.Bard2Quant 2
     var L.ClothQuant 3
     var L.WoodQuant 3
     var L.GenQuant 4
     var L.PerfQuant 3

     var S.GenQuant 4
     var S.WeapQuant 3
     var S.ClericQuant 4
     var S.StitchQuant 3
     var S.AlchQuant 4
     var S.HerbQuant 3
     var S.ArtifQuant 2
     var S.MusicQuant 4
     var S.ArmorQuant 3
     var S.ReedQuant 3
     var S.MuseumQuant 3
     var S.BowQuant 4
     var S.SpireQuant 2
     var S.LockQuant 4
     var S.CoinQuant 3
     var S.FrillQuant 3
     var S.HeraldQuant 3
     var S.GiftQuant 3
     var S.ToyQuant 3
     var S.MemoryQuant 2
     var S.TokenQuant 3
     var S.BarberQuant 3
     var S.TannerQuant 2
     var S.SurvQuant 3
     var S.Surv2Quant 2
     var RP.GenQuant 2
     var RP.TobacQuant 2

     var SC.WeapQuant 2
     var H.ShieldQuant 2
     var H.JewelQuant 3
     var H.TogQuant 3
     var H.HerbQuant 4
     var H.SundQuant 3
     var H.LampQuant 3
     var H.MusicQuant 3
     var H.AlchQuant 3
     var H.ForgeQuant 3
     var H.GenQuant 4
     var H.TobacQuant 3

     var R.BaitQuant 4
     var R.GenQuant 3
     var R.HerbQuant 3
     var R.ForgeQuant 2
     var R.TailorQuant 3
     var R.LeatherQuant 3
     var R.HairQuant 3
     var R.MusicQuant 3
     var R.MagicQuant 2
     var R.OrigamiQuant 3
     var R.JewelryQuant 3
     var R.ClericQuant 3
     var R.RingQuant 2

     var A.HerbQuant 4
     var A.TannerQuant 3
     var A.ClothingQuant 4
     var A.ScriptQuant 3
     var A.ClericQuant 3
     var A.OrigamiQuant 3
     var A.JewelryQuant 3
     var A.MagicQuant 2
     var A.SlingsQuant 3
     var A.PuzzleQuant 3
     var A.FootwearQuant 3
     var A.ShieldsQuant 3
     var A.WeaponQuant 3
     var A.ArmorQuant 3
     var A.GenQuant 3
     var A.FlowerQuant 3
     var A.MusicQuant 3
     RETURN
########################
# 600-799
########################
ITEM.COUNT4:
     var T.TarshaQuant 3
     var T.RoseQuant 2
     var T.MusicQuant 3
     var T.HatsQuant 3
     var T.ArmQuant 3
     var T.GiftQuant 3
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 3
     var T.KrrishQuant 3
     var T.LenseQuant 3
     var T.ClericQuant 3
     var T.MenQuant 3
     var T.WomenQuant 3
     var T.ClothQuant 3
     var T.ArmoryQuant 3
     var T.ForgeQuant 3

     var RH.HerbQuant 4
     var RH.IronQuant 3
     var RH.NaphQuant 3
     var RH.FlowQuant 3
     var RH.SeliQuant 3
     var RH.ArmsQuant 4
     var RH.GenQuant 3
     var RH.ClothQuant 4
     var RH.ArtifQuant 3
     var RH.JoyQuant 3
     var RH.SmokeQuant 3
     var RH.WeapQuant 3
     var RH.BardQuant 4
     var RH.Bard2Quant 2
     var RH.ClericQuant 4
     var RH.Cleric2Quant 2
     var RH.LockQuant 3
     var RH.TogQuant 3
     var RH.Tog2Quant 2
     var RH.MirgQuant 2

     var AD.FetaQuant 3
     var AD.ThreadQuant 4
     var AD.FashQuant 3
     var AD.OddsQuant 3
     var AD.BardQuant 3
     var AD.MapQuant 3
     var AD.ArmQuant 3
     var AD.SmokeQuant 3
     var AD.Tart.EQuant 3
     var AD.Tart.CQuant 3
     var AD.Tart.MQuant 3
     var AD.Tart.LQuant 3
     var AD.Tart.FQuant 3
     var KA.GrekQuant 3

     var C.AlchQuant 4
     var C.ArtifQuant 2
     var C.BathQuant 4
     var C.CardQuant 3
     var C.GenQuant 4
     var C.WeapQuant 3
     var C.ArmQuant 3
     var C.MusicQuant 3
     var C.Music2Quant 2
     var C.LockQuant 3
     var C.EmpathQuant 3
     var C.Empath2Quant 2
     var C.Empath3Quant 2
     var C.ClerQuant 3
     var C.HaberQuant 4
     var C.ScriptQuant 3
     var C.TannQuant 3
     var C.JewelQuant 3
     var C.StitchQuant 4
     var C.CobbQuant 3
     var C.HerbQuant 3
     var C.FlowQuant 3

     var L.SkinQuant 4
     var L.BowQuant 3
     var L.OrigQuant 3
     var L.WeapQuant 3
     var L.WickQuant 3
     var L.BardQuant 3
     var L.Bard2Quant 3
     var L.ClothQuant 3
     var L.WoodQuant 3
     var L.GenQuant 3
     var L.PerfQuant 4

     var S.GenQuant 3
     var S.WeapQuant 3
     var S.ClericQuant 4
     var S.StitchQuant 4
     var S.AlchQuant 3
     var S.HerbQuant 4
     var S.ArtifQuant 3
     var S.MusicQuant 3
     var S.ArmorQuant 3
     var S.ReedQuant 3
     var S.MuseumQuant 2
     var S.BowQuant 3
     var S.SpireQuant 3
     var S.LockQuant 3
     var S.CoinQuant 3
     var S.FrillQuant 3
     var S.HeraldQuant 2
     var S.GiftQuant 3
     var S.ToyQuant 3
     var S.MemoryQuant 3
     var S.TokenQuant 2
     var S.BarberQuant 3
     var S.TannerQuant 3
     var S.SurvQuant 3
     var S.Surv2Quant 3
     var RP.GenQuant 4
     var RP.TobacQuant 4
     
     var SC.WeapQuant 2
     var H.ShieldQuant 2
     var H.JewelQuant 2
     var H.TogQuant 2
     var H.HerbQuant 2
     var H.SundQuant 2
     var H.LampQuant 2
     var H.MusicQuant 2
     var H.AlchQuant 2
     var H.ForgeQuant 2
     var H.GenQuant 2
     var H.TobacQuant 2

     var R.BaitQuant 4
     var R.GenQuant 4
     var R.HerbQuant 4
     var R.ForgeQuant 4
     var R.TailorQuant 3
     var R.LeatherQuant 3
     var R.HairQuant 4
     var R.MusicQuant 4
     var R.MagicQuant 3
     var R.OrigamiQuant 3
     var R.JewelryQuant 3
     var R.ClericQuant 3
     var R.RingQuant 2

     var A.HerbQuant 4
     var A.TannerQuant 4
     var A.ClothingQuant 4
     var A.ScriptQuant 3
     var A.ClericQuant 4
     var A.OrigamiQuant 4
     var A.JewelryQuant 3
     var A.MagicQuant 3
     var A.SlingsQuant 3
     var A.PuzzleQuant 3
     var A.FootwearQuant 4
     var A.ShieldsQuant 3
     var A.WeaponQuant 3
     var A.ArmorQuant 3
     var A.GenQuant 4
     var A.FlowerQuant 4
     var A.MusicQuant 4
     RETURN
########################
# 800-1400
########################
ITEM.COUNT5:
     var T.TarshaQuant 4
     var T.RoseQuant 4
     var T.MusicQuant 4
     var T.HatsQuant 3
     var T.ArmQuant 3
     var T.GiftQuant 3
     var T.SweetQuant 3
     var T.CupcakeQuant 3
     var T.GenQuant 3
     var T.KrrishQuant 3
     var T.LenseQuant 3
     var T.ClericQuant 3
     var T.MenQuant 3
     var T.WomenQuant 3
     var T.ClothQuant 3
     var T.ArmoryQuant 3
     var T.ForgeQuant 3

     var RH.HerbQuant 4
     var RH.IronQuant 3
     var RH.NaphQuant 4
     var RH.FlowQuant 4
     var RH.SeliQuant 4
     var RH.ArmsQuant 4
     var RH.GenQuant 4
     var RH.ClothQuant 3
     var RH.ArtifQuant 3
     var RH.JoyQuant 4
     var RH.SmokeQuant 4
     var RH.WeapQuant 4
     var RH.BardQuant 4
     var RH.Bard2Quant 4
     var RH.ClericQuant 4
     var RH.Cleric2Quant 3
     var RH.LockQuant 4
     var RH.TogQuant 3
     var RH.Tog3Quant 3
     var RH.MirgQuant 3

     var AD.FetaQuant 4
     var AD.ThreadQuant 4
     var AD.FashQuant 4
     var AD.OddsQuant 4
     var AD.BardQuant 4
     var AD.MapQuant 4
     var AD.ArmQuant 4
     var AD.SmokeQuant 4
     var AD.Tart.EQuant 4
     var AD.Tart.CQuant 4
     var AD.Tart.MQuant 4
     var AD.Tart.LQuant 4
     var AD.Tart.FQuant 4
     var KA.GrekQuant 4

     var C.AlchQuant 4
     var C.ArtifQuant 4
     var C.BathQuant 4
     var C.CardQuant 4
     var C.GenQuant 4
     var C.WeapQuant 4
     var C.ArmQuant 4
     var C.MusicQuant 4
     var C.Music2Quant 4
     var C.LockQuant 4
     var C.EmpathQuant 4
     var C.Empath2Quant 4
     var C.Empath3Quant 4
     var C.ClerQuant 4
     var C.HaberQuant 4
     var C.ScriptQuant 4
     var C.TannQuant 4
     var C.JewelQuant 4
     var C.StitchQuant 4
     var C.CobbQuant 4
     var C.HerbQuant 4
     var C.FlowQuant 4

     var L.SkinQuant 4
     var L.BowQuant 4
     var L.OrigQuant 4
     var L.WeapQuant 4
     var L.WickQuant 4
     var L.BardQuant 4
     var L.Bard2Quant 4
     var L.ClothQuant 4
     var L.WoodQuant 4
     var L.GenQuant 4
     var L.PerfQuant 4

     var S.GenQuant 4
     var S.WeapQuant 4
     var S.ClericQuant 4
     var S.StitchQuant 4
     var S.AlchQuant 4
     var S.HerbQuant 4
     var S.ArtifQuant 4
     var S.MusicQuant 4
     var S.ArmorQuant 4
     var S.ReedQuant 4
     var S.MuseumQuant 4
     var S.BowQuant 4
     var S.LockQuant 4
     var S.SpireQuant 4
     var S.CoinQuant 4
     var S.FrillQuant 4
     var S.HeraldQuant 4
     var S.GiftQuant 4
     var S.ToyQuant 4
     var S.MemoryQuant 4
     var S.TokenQuant 4
     var S.BarberQuant 4
     var S.TannerQuant 4
     var S.SurvQuant 4
     var S.Surv2Quant 4
     var RP.GenQuant 4
     var RP.TobacQuant 4
     
     var SC.WeapQuant 4
     var H.ShieldQuant 4
     var H.JewelQuant 4
     var H.TogQuant 4
     var H.HerbQuant 4
     var H.SundQuant 4
     var H.LampQuant 4
     var H.MusicQuant 4
     var H.AlchQuant 4
     var H.ForgeQuant 4
     var H.GenQuant 4
     var H.TobacQuant 4

     var R.BaitQuant 4
     var R.GenQuant 4
     var R.HerbQuant 4
     var R.ForgeQuant 4
     var R.TailorQuant 4
     var R.LeatherQuant 4
     var R.HairQuant 4
     var R.MusicQuant 4
     var R.MagicQuant 4
     var R.OrigamiQuant 4
     var R.JewelryQuant 4
     var R.ClericQuant 4
     var R.RingQuant 2

     var A.HerbQuant 4
     var A.TannerQuant 4
     var A.ClothingQuant 4
     var A.ScriptQuant 4
     var A.ClericQuant 4
     var A.OrigamiQuant 4
     var A.JewelryQuant 4
     var A.MagicQuant 4
     var A.SlingsQuant 4
     var A.PuzzleQuant 4
     var A.FootwearQuant 4
     var A.ShieldsQuant 4
     var A.WeaponQuant 4
     var A.ArmorQuant 4
     var A.GenQuant 4
     var A.FlowerQuant 4
     var A.MusicQuant 4
     RETURN
##############################
# WARNINGS
##############################
WELCOME:
     echo ************************************************************
     echo *       Welcome $charactername - Circle %circle %guild !~
     echo *    To Shroom's Ultimate Genie3 Mainland Stealing Script!
     echo *     Completely automated Progressive Stealing!
     echo *   Send bug reports/feedback to skultamaphon@gmail.com
     echo ************************************************************
     pause
     echo ************************************************************
     echo ***  MAKE SURE YOU HAVE PLENTY OF PLATS IN THE BANK
     echo ***  IN THE CITIES YOU ARE STEALING IN TO PAY FINES!
     echo ************************************************************
     pause 2
     RETURN
TOO.HURT:
     echo
     echo **************************************************************************************************
     echo *   YOU ARE TOO INJURED TO STEAL SHIT!
     echo *   GO GET HEALED FIRST YOU NUB!
     echo ***************************************************************************************************
     put #parse DONE STEALING
     exit
BAG.ALERT:
     echo
     echo **************************************************************************************************
     echo *  ERROR!!!
     echo *  You cannot set bin.container and pawn.container as the same container!!
     echo *  If you are binning AND pawning.. You MUST set them to different containers!
     echo *  THIEVES - If you are binning and pawning, you MUST have THREE different containers (bin/pawn/safe).
     echo *  If you want to use only two containers and have bin/pawn as the same container, set PAWN to OFF
     echo *  It is NOT recommended to turn BIN OFF, as over time this will kill your THIEF REP
     echo ***************************************************************************************************
     exit
THEREN.NOSTEAL:
     echo ***************************************************************************************************
     echo **** Sorry! Theren is too hard for noobs.
     echo **** Come back when you have a little more Thievery skill (~100+)
     echo **** It is recommended to start in either Crossings or Riverhaven as a noob
     echo ***************************************************************************************************
     pause 10
     gosub AUTOMOVE portal
     send .%TRAVEL.SCRIPT haven
     waitforre ^YOU HAVE ARRIVED
     goto HAVEN.STEAL
     put #parse DONE STEALING
     exit
TOO.MANY.FINES:
     put #echo >Log Red **** TOO MANY FINES IN %CITY !! RESET YOUR HEAT!!!
     echo
     echo ****************************** WARNING !!!! ************************************************************************************************************
     echo **** YOU HAVE TOO MANY OUTSTANDING FINES TO STEAL FROM THIS PROVINCE!
     echo **** YOU ARE AT HIGH RISK OF BEING THUGGED! GO TO JAIL NOW!!!
     echo **** YOU MUST GO SURRENDER TO A TOWN GUARD AND GO TO JAIL IMMEDIATELY TO RESET YOUR 'HEAT'!
     echo **** LAY LOW FOR A FEW DAYS OR STEAL FROM A DIFFERENT PROVINCE TO LET YOUR HEAT "COOL DOWN"
     echo ********************************************************************************************************************************************************
     pause 5
     echo **********************************************************************************************************************************************************
     echo **** DO NOT PASS GO! GO DIRECTLY TO JAIL AND LAY LOW IN THIS TOWN FOR A FEW DAYS TO RESET YOUR HEAT!!
     echo *** If you are getting caught too often (on the same items),
     echo *** email me your thievery ranks and log of your items you are getting caught on
     echo *** skultamaphon@gmail.com -  shroomismschism @ AIM
     echo **********************************************************************************************************************************************************
     pause 5
     gosub AUTOMOVE guard
     pause 2
     send surrender guard
     pause
     send surrender sent
     send surrender ward
     pause 0.5
     put #parse DONE STEALING
     exit
NO.FUNDS:
     put #echo >Log Red **** Warning: Out of funds in %CITY !!
     put #echo >Log Red **** Get some money from another town and pay your fine and get your stuff!!
     echo
     echo *************************************************************************************************************************************
     echo * WARNING! YOU DON'T HAVE ENOUGH MONEY TO PAY THIS FINE!
     echo * GO GET SOME FUNDS FROM ANOTHER BANK AND PAY YOUR FINE AND GET YOUR STUFF!
     echo * IT IS RECOMMENDED TO KEEP PLENTY OF PLATS IN THE BANK FOR THOSE THIEVERY CHARGES
     echo * THEY CAN REALLY RACK UP ESPECIALLY IF YOU DO NOT REGULARLY CLEAR YOUR HEAT!
     echo *************************************************************************************************************************************
     put #parse DONE STEALING
     exit
NO.PASSWORD:
     echo
     echo ***********************************************************************************************************
     echo *  YOU DIDN'T SET YOUR THIEF GUILD PASSWORDS!
     echo *  SET VARIABLES HAVEN.PW and SHARD.PW TO ~YOUR~ PASSWORDS
     echo ***********************************************************************************************************
     exit
NOOB:
     echo
     echo ***********************************************************************************************************
     echo * You are too Noob to steal from shops!!!
     echo * Hit the beggar or get some classes / steal some water until you get at least 20 ranks.
     echo ***********************************************************************************************************
     echo
     put #parse DONE STEALING
     exit
ARMOR.WARN:
     echo *************************************************************************************
     echo ** WARNING: Script could not find all your armor
     echo ** Remove any remaining armor and type "GO" to continue
     echo *************************************************************************************
     matchre RETURN GO|go
     matchwait
HELP:
     echo # - USAGE - Simply start script with .steal
     echo # - For Troubleshooting/testing - .steal <label to skip to> <type anything to SKIP BAG CHECK>
     echo # - For example - .steal CROSS.TO.CARD YES will skip directly to CROSS.TO.CARD label and skip the bag check and turn on debug mode
     echo # - This is for testing/troubleshooting purposes only, usually after already starting stealing script and you want to restart it halfway through. 
     echo # - Skips the bag check so it doesn't put already stolen items in your safe container
     echo # - This is assuming you already went through the beginning bag check - USE AT YOUR OWN RISK!
     exit