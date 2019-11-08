##### PELIC's Favor Script - Mouse Select Version.
##### EXP TRACKER PLUGIN REQUIRED!
##### UPDATED MAPS REQUIRED!
##### Changed from Climbing to Collecting, per suggestion from Worril.
##### Changed foraging location to a Ranger-friendly room, per suggestion from Kathris.
##### Last Edited: 21 JUNE, 2012
ABSOLUTE.TOP:
         # debuglevel 10
         var Current.Script getfavors
         gosub BASE.ACTIONS
         gosub STATUSBAR
         var Recover 0
         gosub EMPTY.HANDS
         if "$zoneid" = "1" then
                  {
                           gosub AUTOMOVE temple
                           gosub AUTOMOVE favor altar
                           goto INIT
                  }
         if "$zoneid" = "2a" then
                  {
                           gosub AUTOMOVE favor altar
                           goto INIT
                  }
         goto INVALID.LOCATION
INIT:
SELECT:
         put #tvar Aspect NULL
         pause 0.1
         echo
         echo **********************************************************************
         echo **        GODS            ** GUILDS                                        ** RACES                       **
         echo **********************************************************************
         pause 0.3
         put #link {**  Chadatru          ** Paladins                              **                             **} {#tvar Aspect Chadatru;#parse CHOICE MADE!}
         put #link {**  Damaris    ** Thieves                                   **                                **} {#tvar Aspect Damaris;#parse CHOICE MADE!}
         put #link {**  Eluned          **                                                      ** Elotheans            **} {#tvar Aspect Eluned;#parse CHOICE MADE!}
         put #link {**  Everild    ** Barbarians                                 **                               **} {#tvar Aspect Everild;#parse CHOICE MADE!}
         put #link {**  Faenella          ** Bards/Paladins/Traders      ** Elves                       **} {#tvar Aspect Faenella;#parse CHOICE MADE!}
         put #link {**  Glythtide        ** Bards                                         ** Halflings          **} {#tvar Aspect Glythtide;#parse CHOICE MADE!}
         put #link {**  Hav'roth          **                                                    ** S'Kra Mur            **} {#tvar Aspect Hav'roth;#parse CHOICE MADE!}
         put #link {**  Hodierna          ** Empaths/Clerics                    **                                **} {#tvar Aspect Hodierna;#parse CHOICE MADE!}
         put #link {**  Kertigen          ** Traders/Thieves                    ** Dwarves                **} {#tvar Aspect Kertigen;#parse CHOICE MADE!}
         put #link {**  Meraud          ** Mages                                          ** Elotheans          **} {#tvar Aspect Meraud;#parse CHOICE MADE!}
         put #link {**  Tamsine    **                                                   **                                **} {#tvar Aspect Tamsine;#parse CHOICE MADE!}
         put #link {**  Truffenyi        ** Clerics                                     ** Humans/Halflings **} {#tvar Aspect Truffenyi;#parse CHOICE MADE!}
         put #link {**  Urrem'tier      **                                                      **                                **} {#tvar Aspect Urrem'tier;#parse CHOICE MADE!}
         pause 0.3
         echo **********************************************************************
         echo
         echo Please select the God of your choice.
         echo
         waitforre ^CHOICE MADE\!
         if "$Aspect" == "NULL" then goto SELECT
SELECT.NUMBER:
         var Count 0
         pause 0.3
         echo
         echo ***********************************************
         echo **                                                                                   **
         echo ** How many favors do you wish to have?     **
         echo **                                                                                   **
         echo ** (Total, after script is finished.)             **
         echo **                                                                                   **
         echo **  Please select the number of your choice  **
         echo **                                                                                   **
         pause 0.3
         put #link {**                                   6                                       **}{#parse OPTION1!}
         put #link {**                                  12                                       **}{#parse OPTION2!}
         put #link {**                                  18                                       **}{#parse OPTION3!}
         put #link {**                                  24                                       **}{#parse OPTION4!}
         put #link {**                                  30                                       **}{#parse OPTION5!}
         pause 0.3
         echo **                                                                                   **
         echo ***********************************************
         echo
         matchre SET.OPTION1 ^OPTION1\!
         matchre SET.OPTION2 ^OPTION2\!
         matchre SET.OPTION3 ^OPTION3\!
         matchre SET.OPTION4 ^OPTION4\!
         matchre SET.OPTION5 ^OPTION5\!
         matchwait
SET.OPTION1:
         put #tvar Count 6
         goto CONFIRM.CHOICE
SET.OPTION2:
         put #tvar Count 12
         goto CONFIRM.CHOICE
SET.OPTION3:
         put #tvar Count 18
         goto CONFIRM.CHOICE
SET.OPTION4:
         put #tvar Count 24
         goto CONFIRM.CHOICE
SET.OPTION5:
         put #tvar Count 30
         goto CONFIRM.CHOICE
CONFIRM.CHOICE:
         echo
         echo You wish to have a total of $Count favors from $Aspect.
         echo
         echo Select 'YES' to confirm, or 'NO' to refresh the list and choose again.
         echo
         echo ***********************************************
         pause 0.3
         put #link {**                                   YES                               **}{#parse GOOD TO GO!}
         put #link {**                                   NO                                     **}{#parse RESELECT!}
         pause 0.3
         echo ***********************************************
         echo
         matchre SET.TO.GO ^GOOD TO GO\!
         matchre SELECT ^RESELECT\!
         matchwait
SET.TO.GO:
         gosub EMPTY.HANDS
FAVOR.CHECK:
         put INFO
         waitforre Debt:
         put #statusbar 4 Favor Target : $Count
         put #statusbar 5 Current favors : $Favors
RES.CRECHE.TO.FAVORS:
         if $Favors >= $Count then var Recover 1
         if "%Recover" = "1" then goto RECOVERED
         gosub AUTOMOVE crossing
         gosub AUTOMOVE 172
         gosub AUTOMOVE favors
ORB.INIT:
KNEEL:
         pause 0.1
         matchre KNEEL ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre PRAY ^You kneel down upon the ground\.
         put KNEEL
         matchwait
PRAY:
         pause 0.1
         matchre PRAY ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre PRAY ^You close your eyes and pray\.
         matchre PRAY ^As you continue to pray, another sound presents itself\.
         matchre PRAY ^You begin to pray
         matchre PRAY ^You continue to pray
         matchre DECLARE ^As the world around you returns to normal, you hear a faint voice echo within you\.
         put PRAY
         matchwait
DECLARE:
         pause 0.1
         matchre DECLARE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre STAND.FOR.ORB ^The voice speaks to you again saying\, \"If .* be your god\, .*\, rise and seek your favor\.  If this be not correct\, then declare your god again\.$
         put SAY $Aspect
         matchwait
STAND.FOR.ORB:
         pause 0.1
         matchre STAND.FOR.ORB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre GET.ORB.INIT ^\[Siergelde, Labyrinth\]
         put STAND
         matchwait
GET.ORB.INIT:
         pause 0.1
         matchre GET.ORB.INIT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre BEGIN.PUZZLE ^You get a glowing .* orb from atop an altar made of gleaming alabaster trimmed with onyx\.|^You fade in for a moment
         put GET $Aspect ORB ON ALTAR
         matchwait
BEGIN.PUZZLE:
         pause 0.1
         matchre BEGIN.PUZZLE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre LOOK ^You step through the luminous arch, and are instantly bathed in a soft, white glow\.
         matchre LOOK ^What were you referring to\?
         matchre LOOK ^I could not find what you were referring to\.
         put GO ARCH
         matchwait 5
goto LOOK 
PUZZLE:
         matchre LOOK ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre LOOK ^That's difficult to do from the bottom of the stairs\.
         matchre LOOK ^It would be difficult to go through the door from the bottom of the stairway\.
         matchre PLANT ^You are standing in a square room of smooth, stone walls\.
         matchre PLANT ^You cannot go through a closed window\.
         matchre SPONGE You also see a granite altar with several candles on it, a granite font and a small sponge\.
         matchre JUG You also see a granite altar with several candles and a water jug on it, and a granite font\.
         matchre TINDERS You also see some tinders, several candles, a granite font and a granite altar\.
         matchre VASE You also see a vase on top of the altar\.
         matchre NEXT ^\[Siergelde, Stone Grotto\]
         put %Command
         matchwait 1
LOOK:
         var Command LOOK
         goto PUZZLE
NEXT:
         pause 0.1
         matchre ORB.INIT ^You drop your .*orb and it shatters on the ground\.
         matchre FAVORS.TO.CROSSING ^You put your
         put STOW MY ORB
         matchwait
PLANT:
         pause 0.1
         matchre PLANT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre PLANT ^Judging the thickness of the paint which has sealed the window shut, you shimmy the frame of the glass to loosen it\.  After a few strong shakes, you notice a thin crack running along the painted edge\.
         matchre PLANT ^Shaking the frame of the glass once more, you manage to loosen it even further\.  As you grunt with effort, you feel the thick paint binding slip, and flakes of the stuff fall to the floor\.
         matchre OPEN ^A cool, swift breeze moves into the room, chasing the stifling heat from your skin\.
         matchre OPEN ^That is already open\.
         put OPEN WINDOW
         matchwait
OPEN:
         var Command GO WINDOW
         goto PUZZLE
SPONGE:
         gosub PUT CLEAN ALTAR
         gosub PUT CLIMB STAIR
         var Command GO DOOR
         goto PUZZLE
JUG:
         gosub PUT FILL FONT
         gosub PUT CLIMB STAIR
         var Command GO DOOR
         goto PUZZLE
TINDERS:
         gosub PUT LIGHT CANDLE
         gosub PUT CLIMB STAIR
         var Command GO DOOR
         goto PUZZLE
VASE:
         gosub PUT GET FLOWER
         var Command GO PATH
         goto PUZZLE
FAVORS.TO.CROSSING:
         gosub AUTOMOVE crossing
         goto ORB.PREP.BEGIN
CRECHE.TO.RANGER:
         gosub AUTOMOVE crossing
         gosub AUTOMOVE ranger
MAIN:
         gosub FORAGE
         gosub KICKEM
EXP.CHECK:
         if $Outdoorsmanship.LearningRate > 32 then goto ORB.PREP.BEGIN
         goto MAIN
FORAGE:
         matchre FORAGE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?
         matchre FORAGE ^Sorry\,
         matchre RETURN ^You manage to collect a pile of rocks\.
         matchre FORAGE ^Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?
         matchre FORAGE ^\[Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\]
         matchre FORAGE ^\(Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\)
         matchre FORAGE ^The room is too cluttered to find anything here\!
         put COLLECT ROCK
         matchwait
KICKEM:
         matchre KICKEM ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?
         matchre KICKEM ^Sorry\,
         matchre RETURN ^You take a step back and run up to the pile of rocks\.
         matchre KICKIT ^Now what did the rocks? ever do to you\?
         matchre KICKIT ^I could not find what you were referring to\.
         put KICK ROCK
         matchwait
KICKIT:
         matchre KICKIT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?
         matchre KICKIT ^Sorry\,
         matchre RETURN ^You take a step back and run up to the pile
         matchre RETURN ^I could not find what you were referring to\.
         put KICK PILE
         matchwait
ORB.PREP.BEGIN:
         gosub AUTOMOVE temple
         gosub AUTOMOVE favor altar
GET.ORB:
         matchre GET.ORB ^\.\.\.wait\s+\d+\s+sec(?:onds|s)?\.?$
         matchre GET.ORB ^Sorry,
         matchre HUG.ORB ^You get
         matchre BROKEN.BAD.ORB ^You drop your .* orb and it shatters on the ground\.
         put GET MY ORB
         matchwait
HUG.ORB:
         matchre HUG.ORB ^\.\.\.wait\s+\d+\s+sec(?:onds|s)?\.?
         matchre HUG.ORB ^Sorry\,
         matchre STOW.ORB ^As you press the .*orb against your chest\, it glows slightly more intensely and you feel a strange tugging\, as if something has been moved from you to the orb\.\s*You sense\, though\, that your sacrifice is not yet fully prepared\.
         matchre ORB.PREPPED ^As you press the .*orb against your chest\, it glows slightly more intensely and you feel a strange tugging\, as if something has been moved from you to the orb\.\s*You sense that your sacrifice is properly prepared\.
         matchre ORB.PREPPED ^The .*orb feels warm to your touch and has a strong, steady glow\.\s*The strange tugging sensation is gone\, leading you to believe that your sacrifice is properly prepared\.
         matchre STOW.ORB ^You rub the .*orb and feel a strange tugging\, but nothing really seems to happen\.  You sense you are lacking in the type of sacrifice the orb requires\.
         matchre BAD.ORB ^You sense that this .*orb is not deemed worthy to hold your required sacrifice\.  Perhaps another would work at this time\?
  matchre STOW.ORB ^You press the .*orb against your chest and feel a strange tugging\, but nothing really seems to happen\.  You sense you are lacking in the type of sacrifice the orb requires\.
         matchre BROKEN.BAD.ORB ^You drop your .* orb and it shatters on the ground\.
         put HUG MY ORB
         matchwait
STOW.ORB:
         matchre STOW.ORB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?
         matchre STOW.ORB ^Sorry\,
         matchre CRECHE.TO.RANGER ^Stow what\?  Type 'STOW HELP' for details\.
         matchre CRECHE.TO.RANGER ^You put
         put STOW MY ORB
         matchwait
ORB.PREPPED:
         pause 0.1
         echo ***********************
         echo *** DEPOSITING ORB. ***
         echo ***********************
         pause 0.1
PUT.ORB:
         matchre PUT.ORB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?
         matchre PUT.ORB ^Sorry\,
         matchre BROKEN.BAD.ORB ^You drop your .*orb and it shatters on the ground\.
         matchre FAVOR.CHECK ^Then\, an instant later\, the multicolored lights gather around you and mix together\, forming a white mass of brightness which completely obscures your vision\.  Slowly\, the light fades and you feel somehow changed\.
         put PUT MY ORB ON ALTAR
         matchwait
BAD.ORB:
DROP.BAD.ORB:
         matchre DROP.BAD.ORB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?
         matchre DROP.BAD.ORB ^Sorry\,
         matchre BROKEN.BAD.ORB ^You drop your .* orb\.
         matchre BROKEN.BAD.ORB ^You drop your .* orb and it shatters on the ground\.
         put DROP MY ORB
         matchwait
BROKEN.BAD.ORB:
         goto FAVOR.CHECK
RECOVERED:
         pause 0.1
         echo ******************
         echo *** ALL DONE!  ***
         echo ******************
         pause 0.1
         put #script abort %Current.Script
         exit
INVALID.LOCATION:
         pause 0.1
         echo *********************************************************
         echo *** PLEASE START THIS SCRIPT ANYWHERE IN THE CROSSING ***
         echo *********************************************************
         pause 0.1
         put #script abort %Current.Script
         exit
EMPTY.HANDS:
         if "$lefthand" != "Empty" then gosub STOW LEFT
         if "$righthand" != "Empty" then gosub STOW RIGHT
         return
STOW:
         var Item $0
STOW.RESUME:
         matchre STOW.RESUME ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre RETURN ^Stow what\?  Type 'STOW HELP' for details\.
         matchre RETURN ^You put
         put STOW %Item
         matchwait
GET:
         var Item $0
GET.RESUME:
         matchre STOW.RESUME ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre RETURN ^What were you referring to\?
         matchre RETURN ^You
         put GET %Item
         matchwait
PUT:
         var Command $0
PUT.CONTINUE:
         matchre PUT.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre RETURN ^You
         matchre RETURN ^FACE HELP for more information
         matchre RETURN ^EXP HELP for more information
         matchre RETURN ^Stow what\?  Type 'STOW HELP' for details\.
         matchre RETURN ^Roundtime\:
         matchre RETURN ^Obvious
         matchre RETURN ^\s*Encumbrance\s*\:
         matchre RETURN what\?
         matchre RETURN it's not dead yet
         matchre RETURN ^Remove what\?
         matchre RETURN ^Ok\.
         put %Command
         matchwait
STAND:
         matchre STAND ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
         matchre STAND ^Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?$|^\[Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\]$|^\(Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\)$
         matchre STAND ^You are overburdened and cannot manage to stand\.
         matchre STAND ^The weight
         matchre STAND ^You try
         matchre RETURN ^You are already standing\.
         matchre RETURN ^You stand back up\.
         matchre RETURN ^You stand up\.
         put STAND
         matchwait
AUTOMOVE:
         if "$0" = "$roomid" then return
         else put #goto $0
         waitforre @walk done
         return
STATUSBAR:
         put #statusbar 2 Getting favors (GetFavors.Cmd)
         put #statusbar 3 Type STOP to finish orb and abort script.
         put #statusbar 4
         put #statusbar 5
         return
STATUSBAR.CLEAR:
         put #statusbar 2
         put #statusbar 3
         put #statusbar 4
         put #statusbar 5
         return
END.SCRIPT:
         action clear
         gosub clear
         gosub STATUSBAR.CLEAR
         pause 0.1
         echo **********************************
         echo ***** SCRIPT ABORTED BY USER *****
         echo **********************************
         pause 0.1
         put #script abort %Current.Script
         exit
BASE.ACTIONS:
         action clear
         action var Recover 1 when ^What do you want to stop\?
         action put #var favors $1 when ^\s*Favors\s*\:\s*(\d+)
RETURN:
         return