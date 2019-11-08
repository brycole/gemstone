##### PELIC's Favor Script - Mouse Select Version.
##### EXP TRACKER PLUGIN REQUIRED!
##### UPDATED TF MAPS REQUIRED!
##### Changed from Climbing to Collecting, per suggestion from Worril.
##### Changed foraging location to a Ranger-friendly room, per suggestion from Stephinroth.
##### Added Fix for hugging orb with no exp from Dasffion
##### Fixed missing COLLECT sub.  (Thanks, Taz)
##### Last Edited: 10/23/2014
ABSOLUTE_TOP:
     # debuglevel 5
     var CurrentScript getfavors
     gosub STATUSBAR
     action var Recover 1;put #statusbar 3 Finishing current orb. when ^What do you want to stop\?
     action put #var Favors $1 when ^\s*Favors\s*\:\s*(\d+)
     action put #var Favors $1 when ^You currently have (\d+) favors with the gods\.
     var Recover 0
     gosub EMPTY_HANDS
     if "$zoneid" = "1" then goto INIT
     if "$zoneid" = "2a" then goto INIT
     goto INVALID_LOCATION
INIT:
SELECT:
     put #tvar Aspect NULL
     pause 0.3
     echo
     echo **********************************************************************
     echo **    GODS        ** GUILDS                     ** RACES            **
     echo **********************************************************************
     pause 0.3
     put #link {**  Chadatru      ** Paladins                   **                  **} {#tvar Aspect Chadatru;#parse CHOICE MADE!}
     put #link {**  Damaris       ** Thieves                    **                  **} {#tvar Aspect Damaris;#parse CHOICE MADE!}
     put #link {**  Eluned        **                            ** Elotheans        **} {#tvar Aspect Eluned;#parse CHOICE MADE!}
     put #link {**  Everild       ** Barbarians                 **                  **} {#tvar Aspect Everild;#parse CHOICE MADE!}
     put #link {**  Faenella      ** Bards/Paladins/Traders     ** Elves            **} {#tvar Aspect Faenella;#parse CHOICE MADE!}
     put #link {**  Glythtide     ** Bards                      ** Halflings        **} {#tvar Aspect Glythtide;#parse CHOICE MADE!}
     put #link {**  Hav'roth      **                            ** S'Kra Mur        **} {#tvar Aspect Hav'roth;#parse CHOICE MADE!}
     put #link {**  Hodierna      ** Empaths/Clerics            **                  **} {#tvar Aspect Hodierna;#parse CHOICE MADE!}
     put #link {**  Kertigen      ** Traders/Thieves            ** Dwarves          **} {#tvar Aspect Kertigen;#parse CHOICE MADE!}
     put #link {**  Meraud        ** Mages                      ** Elotheans        **} {#tvar Aspect Meraud;#parse CHOICE MADE!}
     put #link {**  Tamsine       **                            **                  **} {#tvar Aspect Tamsine;#parse CHOICE MADE!}
     put #link {**  Truffenyi     ** Clerics                    ** Humans/Halflings **} {#tvar Aspect Truffenyi;#parse CHOICE MADE!}
     put #link {**  Urrem'tier    **                            **                  **} {#tvar Aspect Urrem'tier;#parse CHOICE MADE!}
     pause 0.3
     echo **********************************************************************
     echo
     echo Please select the God of your choice.
     echo
     waitforre ^CHOICE MADE\!
     if "$Aspect" = "NULL" then goto SELECT
SELECT.NUMBER:
     var Count 0
     pause 0.3
     echo
     echo ***********************************************
     echo **                                           **
     echo ** How many favors do you wish to have?      **
     echo **                                           **
     echo ** (Total, after script is finished.)        **
     echo **                                           **
     echo **  Please select the number of your choice  **
     echo **                                           **
     pause 0.3
     put #link {**                     6                     **}{#parse OPTION1!}
     put #link {**                    12                     **}{#parse OPTION2!}
     put #link {**                    18                     **}{#parse OPTION3!}
     put #link {**                    24                     **}{#parse OPTION4!}
     put #link {**                    30                     **}{#parse OPTION5!}
     pause 0.3
     echo **                                           **
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
     put #link {**                     YES                   **}{#parse GOOD TO GO!}
     put #link {**                     NO                    **}{#parse RESELECT!}
     pause 0.3
     echo ***********************************************
     echo
     matchre SET.TO.GO ^GOOD TO GO\!
     matchre SELECT ^RESELECT\!
     matchwait
SET.TO.GO:
     gosub EMPTY_HANDS
FAVOR.CHECK:
     gosub PUT info
     put #statusbar 4 Favor Target : $Count
     put #statusbar 5 Current Favors : $Favors
     if $Favors >= $Count then var Recover 1
     if "%Recover" = "1" then goto RECOVERED
     if "$zoneid" = "2a" then goto RES.CRECHE.TO.FAVORS
     if "$zoneid" = "1" then goto CROSSING.TO.FAVORS
RES.CRECHE.TO.FAVORS:
     gosub AUTOMOVE crossing
CROSSING.TO.FAVORS:
     gosub AUTOMOVE w gate
     gosub AUTOMOVE favors
ORB.INIT:
KNEEL:
     pause 0.0001
     matchre KNEEL ^\.\.\.wait|^Sorry\,
     matchre PRAY ^You kneel down upon the ground\.
     send kneel
     matchwait
PRAY:
     pause 0.0001
     matchre PRAY ^\.\.\.wait|^Sorry\,
     matchre PRAY ^You close your eyes and pray\.
     matchre PRAY ^As you continue to pray, another sound presents itself\.
     matchre PRAY ^You begin to pray
     matchre PRAY ^You continue to pray
     matchre DECLARE ^As the world around you returns to normal, you hear a faint voice echo within you\.
     send pray
     matchwait
DECLARE:
     pause 0.0001
     matchre DECLARE ^\.\.\.wait|^Sorry\,
     matchre STAND.FOR.ORB ^The voice speaks to you again saying\, \"If .* be your god\, .*\, rise and seek your favor\.  If this be not correct\, then declare your god again\.
     send say $Aspect
     matchwait
STAND.FOR.ORB:
     pause 0.0001
     matchre STAND.FOR.ORB ^\.\.\.wait|^Sorry\,
     matchre GET.ORB.INIT ^\[Siergelde, Labyrinth\]
     send stand
     matchwait
GET.ORB.INIT:
     pause 0.0001
     matchre GET.ORB.INIT ^\.\.\.wait|^Sorry\,
     matchre BEGIN.PUZZLE ^You get a glowing .* orb from atop an altar made of gleaming alabaster trimmed with onyx\.|^You fade in
     send get $Aspect orb on altar
     matchwait
BEGIN.PUZZLE:
     pause 0.0001
     matchre BEGIN.PUZZLE ^\.\.\.wait|^Sorry\,
     matchre LOOK ^You step through the luminous arch, and are instantly bathed in a soft, white glow\.
     matchre LOOK ^What were you referring to\?
     matchre LOOK ^I could not find what you were referring to\.
     send go arch
     matchwait
PUZZLE:
     matchre LOOK ^\.\.\.wait|^Sorry\,
     matchre LOOK ^That's difficult to do from the bottom of the stairs\.
     matchre LOOK ^It would be difficult to go through the door from the bottom of the stairway\.
     matchre PLANT ^You are standing in a square room of smooth, stone walls\.
     matchre PLANT ^You cannot go through a closed window\.
     matchre SPONGE You also see a granite altar with several candles on it, a granite font and a small sponge\.
     matchre JUG You also see a granite altar with several candles and a water jug on it, and a granite font\.
     matchre TINDERS You also see some tinders, several candles, a granite font and a granite altar\.
     matchre VASE You also see a vase on top of the altar\.
     matchre NEXT ^\[Siergelde, Stone Grotto\]
     send %Command
     matchwait 1
LOOK:
     var Command look
     goto PUZZLE
NEXT:
     pause 0.0001
     matchre ORB.INIT ^You drop your .*orb and it shatters on the ground\.
     matchre FAVORS.TO.CROSSING ^You put your
     send stow my orb
     matchwait
PLANT:
     pause 0.0001
     matchre PLANT ^\.\.\.wait|^Sorry\,
     matchre PLANT ^Judging the thickness of the paint which has sealed the window shut, you shimmy the frame of the glass to loosen it\.  After a few strong shakes, you notice a thin crack running along the painted edge\.
     matchre PLANT ^Shaking the frame of the glass once more, you manage to loosen it even further\.  As you grunt with effort, you feel the thick paint binding slip, and flakes of the stuff fall to the floor\.
     matchre OPEN ^A cool, swift breeze moves into the room, chasing the stifling heat from your skin\.
     matchre OPEN ^That is already open\.
     send open window
     matchwait
OPEN:
     var Command go window
     goto PUZZLE
SPONGE:
     gosub PUT clean altar;-encumbrance
     gosub PUT climb stair;-encumbrance
     var Command go door
     goto PUZZLE
JUG:
     gosub PUT fill font;-encumbrance
     gosub PUT climb stair;-encumbrance
     var Command go door
     goto PUZZLE
TINDERS:
     gosub PUT light candle;-encumbrance
     gosub PUT climb stair;-encumbrance
     var Command go door
     goto PUZZLE
VASE:
     gosub PUT get flower;-encumbrance
     var Command go path
     goto PUZZLE
FAVORS.TO.CROSSING:
     gosub AUTOMOVE crossing
     gosub AUTOMOVE ranger
     gosub AUTOMOVE 103
GO.FORAGE:
     if $roomid = 355 then goto MAIN
     if $zoneid != 1 then gosub AUTOMOVE crossing
     gosub AUTOMOVE 103
MAIN:
     gosub COLLECT rock
     gosub KICKEM
EXP.CHECK:
     if ($Outdoorsmanship.LearningRate > 29) || ($Perception.LearningRate > 29) then goto ORB.PREP.BEGIN
     goto MAIN
ORB.PREP.BEGIN:
GET.ORB:
     matchre GET.ORB ^\.\.\.wait|^Sorry\,
     matchre HUG.ORB ^You get|^You fade in
     matchre BROKEN.BAD.ORB ^You drop your .* orb and it shatters on the ground\.
     send get my orb
     matchwait
HUG.ORB:
     matchre HUG.ORB ^\.\.\.wait|^Sorry\,
     matchre STOW.ORB ^As you press the .*orb against your chest\, it glows slightly more intensely and you feel a strange tugging\, as if something has been moved from you to the orb\.\s*You sense\, though\, that your sacrifice is not yet fully prepared\.
     matchre ORB.PREPPED ^As you press the .*orb against your chest\, it glows slightly more intensely and you feel a strange tugging\, as if something has been moved from you to the orb\.\s*You sense that your sacrifice is properly prepared\.
     matchre ORB.PREPPED ^The .*orb feels warm to your touch and has a strong, steady glow\.\s*The strange tugging sensation is gone\, leading you to believe that your sacrifice is properly prepared\.
     matchre STOW.ORB ^You press the .*orb against your chest and feel a strange tugging\, but nothing really seems to happen\.  You sense you are lacking in the type of sacrifice the orb requires\.
     matchre BAD.ORB ^You sense that this .*orb is not deemed worthy to hold your required sacrifice\.  Perhaps another would work at this time\?
     matchre BROKEN.BAD.ORB ^You drop your .* orb and it shatters on the ground\.
     send hug my orb
     matchwait
STOW.ORB:
     matchre STOW.ORB ^\.\.\.wait|^Sorry\,
     matchre GO.FORAGE ^Stow what\?  Type 'STOW HELP' for details\.
     matchre GO.FORAGE ^You put
     send stow my orb
     matchwait
ORB.PREPPED:
     delay 0.3
     echo ***********************
     echo *** DEPOSITING ORB. ***
     echo ***********************
     delay 0.3
     gosub AUTOMOVE temple
     gosub AUTOMOVE favor altar
PUT.ORB:
     matchre PUT.ORB ^\.\.\.wait|^Sorry\,
     matchre BROKEN.BAD.ORB ^You drop your .*orb and it shatters on the ground\.
     matchre FAVOR.CHECK ^Then\, an instant later\, the multicolored lights gather around you and mix together\, forming a white mass of brightness which completely obscures your vision\.  Slowly\, the light fades and you feel somehow changed\.
     send put my orb on altar
     matchwait
BAD.ORB:
DROP.BAD.ORB:
     matchre DROP.BAD.ORB ^\.\.\.wait|^Sorry\,
     matchre BROKEN.BAD.ORB ^You drop your .* orb\.
     matchre BROKEN.BAD.ORB ^You drop your .* orb and it shatters on the ground\.
     send drop my orb
     matchwait
BROKEN.BAD.ORB:
     goto FAVOR.CHECK
RECOVERED:
     delay 0.3
     echo ******************
     echo *** ALL DONE!  ***
     echo ******************
     delay 0.3
     put #script abort %CurrentScript
     exit
INVALID_LOCATION:
     delay 0.3
     echo *********************************************************
     echo *** PLEASE START THIS SCRIPT ANYWHERE IN THE CROSSING ***
     echo *********************************************************
     delay 0.3
     put #script abort %CurrentScript
     exit
END_SCRIPT:
     gosub STATUSBAR_CLEAR
     put #script abort %CurrentScript
     exit
STATUSBAR:
     put #statusbar 2 Getting Favors (GetFavors.Cmd)
     put #statusbar 3 Type STOP to finish orb and abort script.
     put #statusbar 4
     put #statusbar 5
     return
STATUSBAR_CLEAR:
     put #statusbar 2
     put #statusbar 3
     put #statusbar 4
     put #statusbar 5
     return
#### INCLUDE CONTENT FOLLOWS
 
#### EMPTY HANDS SUB
EMPTY_HANDS:
     pause 0.0001
     if ("$righthand" != "Empty") then gosub STOW $righthandnoun
     if ("$lefthand" != "Empty") then gosub STOW $lefthandnoun
     return
 
#### PUT SUB
PUT:
     var Command $0
     var LOCATION PUT_1
     pause 0.0001
     PUT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^You (?:hand|push|move|put|tap|drop|place) .*\.
     matchre RETURN_CLEAR ^Your .*\.
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
     matchre RETURN_CLEAR ^You.*analyze
     matchre RETURN_CLEAR ^You glance down .*\.
     matchre RETURN_CLEAR ^You turn .*\.
     matchre RETURN ^\s*Encumbrance\s*\:
     send %Command
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! (GetFavors.Cmd) ***
     put #echo >$Log Crimson $datetime Command = %Command
     put #log $datetime MISSING MATCH IN PUT (GetFavors.Cmd)
     return
 
#### GET SUB
GET:
     var Get $0
     var LOCATION GET_1
     pause 0.0001
     GET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^You get .*\.|^You fade in
     matchre RETURN ^You pick up .*\.
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^Get what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     send get %Get
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! (GetFavors.Cmd) ***
     put #echo >$Log Crimson $datetime Get = %Get
     put #log $datetime MISSING MATCH IN GET (GetFavors.Cmd)
     return
 
#### STOW SUB
STOW:
     var Stow $0
     var LOCATION STOW_1
     pause 0.0001
     STOW_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre WEAR_1 ^.* is too long to fit in .*\.
     matchre RETURN ^You put .*\.
     matchre RETURN ^You open your pouch and put .* inside\, closing it once more\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Stow what\?  Type 'STOW HELP' for details\.
     send stow %Stow
     matchwait
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (GetFavors.Cmd) ***
     put #echo >$Log Crimson $datetime Stow = %Stow
     put #log $datetime MISSING MATCH IN STOW (GetFavors.Cmd)
     return
 
##### STANDING SUB
STAND:
     var LOCATION STAND_1
     pause 0.0001
     STAND_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre WAIT ^The weight of all your possessions prevents you from standing\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You stand up\.
     matchre RETURN ^You stand back up\.
     matchre RETURN ^You are already standing\.
     send stand
     matchwait
 
#### FORAGING SUBS
FORAGE:
     var Forage $0
     var LOCATION FORAGE_1
     pause 0.0001
     FORAGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You manage to find .*\.
     matchre RETURN ^The room is too cluttered to find anything here\!
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send forage %Forage
     matchwait
COLLECT:
     var Collect $0
     var LOCATION COLLECT_1
     pause 0.0001
     COLLECT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You manage to collect a pile of .*\.
     matchre RETURN ^The room is too cluttered to find anything here\!
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send collect %Collect
     matchwait
KICKEM:
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     return
KICKIT:
     var LOCATION KICKIT_1
     pause 0.0001
     KICKIT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^You take a step back and run up to the pile of .*\.
     send kick pile
     matchwait
 
#### CATCH AND RETRY SUBS
WAIT:
     pause 0.0001
     pause 0.1
     if (!$standing) then gosub STAND
     goto %LOCATION
WEBBED:
     pause 0.0001
     if ($webbed) then waiteval (!$webbed)
     if (!$standing) then gosub STAND
     goto %LOCATION
IMMOBILE:
     pause 0.0001
     if contains("$prompt" , "I") then pause 20
     if (!$standing) then gosub STAND
     goto %LOCATION
STUNNED:
     pause 0.0001
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
 
#### RETURNS
RETURN_CLEAR:
     pause 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     pause 0.0001
     return
 
#### AUTOMAPPER MOVEMENT SUBS
AUTOMOVE:
     var Destination $0
     var failCounter 0
     if (!$standing) then gosub AUTOMOVE_STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     matchre AUTOMOVE_FAILED ^AUTOMAPPER MOVEMENT FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED
     matchre AUTOMOVE_RETURN ^SHOP CLOSED\!
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     send #goto %Destination
     matchwait
AUTOMOVE_STAND:
     pause 0.1
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     put STAND
     matchwait
AUTOMOVE_FAILED:
     evalmath failCounter (failCounter + 1)
     if (%failCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     send #mapper reset
     pause 0.5
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     put #echo
     put #echo Crimson *** AUTOMOVE FAILED. PLEASE INVESTIGATE THEN RESUME SCRIPT. ***
     put #echo
     put #script pauseorresume %CurrentScript
     goto AUTOMOVE_GO
AUTOMOVE_RETURN:
     return
 
#### END INCLUDE CONTENT