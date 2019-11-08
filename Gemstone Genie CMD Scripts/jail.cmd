var CLANITEM YES
var CLAN.ITEM.NAME human skull
var Plead innocent
put #script abort all except prime
pause
if_1 then goto %1
###############################################
#        JAILED / DEBT PAYING ROUTINE         #
###############################################
JAIL.CHECK:
     action instant goto PLEAD when ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|plead|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying about something else
     if "$zoneid" = "1" then goto CROSSING.JAIL
     if "$zoneid" = "30" then goto HAVEN.JAIL
     if "$zoneid" = "42" then goto THEREN.JAIL
     if "$zoneid" = "61" then goto LETH.JAIL
     if "$zoneid" = "116" then goto HIB.JAIL
     if "$zoneid" = "67" then goto SHARD.JAIL
     goto JAILED
     # matchre JAIL.SHARD The Great Tower, Chamber of Justice|Banners representing every Elothean house
     # matchre JAIL.CROSS Jail Cell|Guard House, Jail Cell
     # matchre JAIL.CROSS2 Guard House, Office|Chamber of Justice
     # matchre JAIL.LETH Gallows Tree, Cell
     # matchre JAIL.LETH2 Gallows Tree, Dungeon
     # matchre JAIL.HAVEN Town Jail, The Cell|Jackwater
     # matchre JAIL.HAVEN2 Town Jail, Judgement Chamber
     # matchre JAIL.THEREN Theren Keep, Cell
     # matchre JAIL.THEREN2 Theren Keep, Chapel|Theren Keep, Dungeon
     # matchre JAIL.HIB Justice Office, Cell|A thick-barred iron door closes off the rear of the cavern
     # matchre JAIL.HIB2 Justice Office, Judge's Chambers|Justice Office, Front Desk|A squat grey marble dais sits in the center of one end
     # matchre PLEAD ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|Shouldn't you be worrying about something else at the moment
     # send look
     # matchwait
THEREN.JAIL:
JAIL.THEREN:
     var CURRENT.CITY Theren
     echo Theren JAIL
     put #parse THEREN JAIL
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
     matchre PLEAD ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|plead|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying about something else
     matchwait 220
     goto JAILED
PLEAD:
     action remove ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|plead|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying about something else
     send plead %Plead
     pause 0.5
	pause 0.5
if "$roomid" = "23" then goto STOCKS
GET.SACK:
GET_SACK:
	pause 2
     pause
     match DEBT You glance down at your empty hands
     match SACK sack
     send glance
     matchwait
DEBT:
     gosub STAND
     echo
     echo **** Did not have enough money to pay the fine ****
     echo
     # Walking to the bank to get moneys
     if "$zoneid" = "42" then goto THEREN.JAIL.GET.FINE
     gosub clear
     pause 0.1
TO.TELLER:
     var plat 20
	 if ("$zoneid" = "116") && ("$game" != "DRF") then 
	 {
	 gosub automove 2teller
	 goto FINECHECK.DOKORAS
     }
	 gosub AUTOMOVE teller
     if "$zoneid" = "67" then goto FINECHECK.DOKORAS
     if "$zoneid" = "116" then goto FINECHECK.DOKORAS
     if "$zoneid" = "61" then goto FINE.CHECK.KRONARS
     if "$zoneid" = "1" then goto FINE.CHECK.KRONARS
     if "$zoneid" = "30" then goto FINECHECK.LIRUMS
     if "$zoneid" = "34a" then goto FINECHECK.LIRUMS
     if "$zoneid" = "42" then goto FINECHECK.LIRUMS
	pause
     echo
     echo *** UKNOWN JAIL LOCATION!!
     echo *** CRITICAL ERROR!
     echo
     put #echo >Log Red ***CRITICAL ERROR!!!! 
	put #echo >Log Red ***UNKOWN JAIL LOCATION: Zone- $zoneid Room- $roomid
     pause 0.5
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
     if %fine > 250000 then goto BIGGER_FINE
     if %fine > 100000 then goto BIG_FINE
     send withdraw %fine copper lirum
     goto PAY_DEBT
SET_FINE_DOKORAS:
     pause 0.1
     var fine $1
     var currency dokora
     if %fine > 250000 then goto BIGGER_FINE
     if %fine > 100000 then goto BIG_FINE
     send withdraw %fine copper dokora
     goto PAY_DEBT
SET_FINE:
     pause 0.1
     var fine $1
     var currency kronar
     if %fine > 250000 then goto BIGGER_FINE
     if %fine > 100000 then goto BIG_FINE
     send withdraw %fine copper kronar
     goto PAY_DEBT
BIG_FINE:
     send with 25 plat
     pause 1
     goto PAY_DEBT
BIGGER_FINE:
     if %fine >= 1200000 then
          {
               send with 200 plat
               goto PAY_DEBT
          }
     if %fine >= 900000 then
          {
               send with 120 plat
               goto PAY_DEBT
          }
     if %fine >= 500000 then
          {
               send with 90 plat
               goto PAY_DEBT
          }
     if %fine >= 450000 then
          {
               send with 50 plat
               goto PAY_DEBT
          }
     if %fine >= 400000 then
          {
               send with 45 plat
               goto PAY_DEBT
          }
     if %fine >= 350000 then
          {
               send with 40 plat
               goto PAY_DEBT
          }
     if %fine >= 250000 then
          {
               send with 35 plat
               goto PAY_DEBT
          }
     goto PAY_DEBT
NO_FINE:
     echo
     echo *** You have no fine
     echo
     goto RETURN_TO_JAIL
PAY_DEBT:
	pause
     # Walking to pay off the debt
     gosub AUTOMOVE debt
     send pay %fine
     pause
     gosub AUTOMOVE teller
     send dep all
     pause .5
RETURN_TO_JAIL:
     echo
     echo **** Heading back to jail now ****
     echo
     if "$zoneid" = "42" then goto THEREN.KEEP.JAIL
     if "$zoneid" = "67" then goto SHARD.JAIL.RETURN
     if "$zoneid" = "116" then goto HIB.JAIL.RETURN
     # Walking to the Guard House
     gosub AUTOMOVE Guard
     goto CLAN
HIB.JAIL.RETURN:
     gosub AUTOMOVE 200
     goto CLAN
     SHARD.JAIL.RETURN:
     gosub AUTOMOVE sentin
CLAN:
      if ("%CLANITEM" = "YES") then goto CLAN_ITEM
      else goto THE_SACK
CLAN_ITEM_PAUSE:
      pause 8
CLAN_ITEM:
      if ("%CLANITEM" = "NO") then goto THE_SACK
      send remove %CLAN.ITEM.NAME
      pause
THE_SACK:
     pause 0.1
     matchre THE_SACK ^\.\.\.wait|^Sorry, you may only|What were you|I could not|Please rephrase
     matchre SACK_PRE ^You reach for your sack and retrieve the equipment
     matchre CLAN_ITEM_PAUSE ^You'll need to not be wearing anything
     matchre DEBT paid off your debt to society
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
      pause 0.5
SACK:
     pause 0.2
     matchre ITEM khuj|quarterstaff|quarter staff|halberd|toad
     matchre NO_MORE_ITEMS ^There is nothing in there|^I could not find
     match OPEN_SACK That is closed.
     matchre GET_SACK_ITEM (\S+)(\.)
     send look in my small sack
     matchwait
ITEM:
	var item $0
     send get %item from my sack
     send wear %item
	send stow %item
	pause 0.5
     goto SACK
OPEN_SACK:
     send wear %CLAN.ITEM.NAME
     pause 0.5
     send open my sack
     pause 0.5
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
     else
          {
               send wear my $1
               send stow my $1
          }
     pause 0.5
     goto SACK
NO_MORE_ITEMS:
     send drop sack
     pause
     echo
     echo **** Returning to what you were doing ****
     echo
     if contains("$lefthand" "$righthand" , "%large.items") then gosub EMPTY.HANDS
CHECKLOC:
     if "$zoneid" = "67" then goto SHARDJAIL
     if "$zoneid" = "116" then goto HIBJAIL
     if "$zoneid" = "61" then goto LETHJAIL
     if "$zoneid" = "1" then goto CROSSJAIL
     if "$zoneid" = "30" then goto HAVENJAIL
     if "$zoneid" = "42" then goto THEREN.JAIL.LEAVE
CROSSJAIL:
     gosub AUTOMOVE 42
     goto END
LETHJAIL:
     gosub AUTOMOVE portal
     goto END
HAVENJAIL:
     gosub AUTOMOVE town
     goto END
SHARDJAIL:
     gosub AUTOMOVE 57
     goto END
HIBJAIL:
     gosub AUTOMOVE 75
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
     gosub AUTOMOVE portal
     pause 2
END:
	put #echo >Log SkyBlue Recovered from jail via JAIL script
	echo 
	echo *** FREE FROM JAIL!
	echo
     put #parse FREE FROM JAIL
	put #parse FREE FROM JAIL
	exit


STAND:
pause 0.2
put dance
pause 0.5
put stand
pause 0.2
put dance
RETURN

automove:
var toroom $1
if "$roomid" = "0" then gosub moveRandomDirection
automovecont:
matchre automove.return YOU HAVE ARRIVED|SHOP CLOSED
matchre automovecont YOU HAVE FAILED|MOVE FAILED
put #goto %toroom
matchwait

automove.return:
pause 0.1
RETURN
	
