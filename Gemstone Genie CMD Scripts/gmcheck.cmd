## UNAWARE HELPER - v1.0
#debuglevel 10
put #var afk 1
var safe 1
var verb TEACH|CLOSE|EXP|HELP|HARNESS|TDPs|POP|NOGMCHECK|LISTEN|FIND|PREPARE|BUNDLE|CRACK|TWEET|OOC
ECHO GREETINGS.  I DON'T RECOMMEND THAT YOU AFK SCRIPT USING THIS.  IT IS MERELY A FAIL SAFE FOR DOING SOMETHING ELSE IN THE SAME ROOM.
ECHO USE AT YOUR OWN RISK.
ECHO IF THE SCRIPT IS TRIGGERED, USE "NOGMCHECK" TO STOP THE SPAM.
ECHO
ECHO USE #VAR afk 1 IF YOU TRULY GO AFK.
ECHO
delay 5
## put #playsystem SystemHand
ECHO DID YOU HEAR THAT SOUND?
ECHO 
delay 5
ECHO IF YOU DID NOT HEAR THAT SOUND I RECOMMEND ASKING THE CREATOR FOR A DIFFERENT SETUP.
ECHO MAKE SURE YOUR SPEAKERS ARE ON.
ECHO
ECHO IF YOU DID HEAR THE SOUND, CONGRATS.
ECHO
ECHO Starting in 10 seconds....
delay 10

echo Starting now.
echo
echo ENTER "NOGMCHECK" to clear a check.
start:
action var temp $0;goto word when ([A-Z][A-Z]\w+)
action var safe 1 when NOGMCHECK
goto delay

word:
delay 1
if %safe = 0 then var temp PLACE holder, a safe word interuppted a GM CHECK TRIGGER.
word1:
if !matchre("%temp", "%verb") then
{
	var safe 0
	ECHO %temp was triggered!
	ECHO ****
	ECHO POSSIBLE GM CHECK.
	ECHO MUST CHECK
	put #playsystem SystemHand
	delay 5
	ECHO %temp was triggered!
	ECHO ****
	ECHO POSSIBLE GM CHECK.
	ECHO MUST CHECK
	put #playsystem SystemHand
	if $afk = 1 then goto FULLEXIT
	if %safe = 0 then goto word1
}
delay:
delay 300
goto start

FULLEXIT:
goto exitnow
## ARE YOU AFK? IT BETTER BE FOR A VERY SHORT TIME.
delay 5
put say Hi I'm her! 
delay 3
put say Here.
put say Sorry, that was a bit sudden.
put #script abort all except gmcheck
delay 10
put ponder
delay 2
put say Bleh, I should just go, I need to do laundry.
exitnow:
delay 5
put quit
