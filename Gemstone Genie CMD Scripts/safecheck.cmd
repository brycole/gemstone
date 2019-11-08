debuglevel 5
var friendslist Stoh|Fyrn|Loggrim|Jvi
counter set 0

player.setup:
var players $roomplayers
if (matchre("%players", "Also here:")) then eval players replacere("%players", "^Also here: ", "")
eval players replacere("%players", ",", "|")
echo %players

player.check:
eval playercount count("%players", "|")
if (%playercount = 0) then
	{
	if ("%players" != "") then
		{
		var playercount 1
		var players %players|
		}
	else goto Safe
	}
if (%c >= %playercount) then goto player.results
if %playercount > 0 then
	{
	if (matchre("%players(%c)", "(.* (%friendslist))")) then
		{
		var friend $1
		echo %friend
		eval players replacere("%players", "(%friend\|)", "")
		goto player.check
		}
	counter add 1
	goto player.check
	}
player.results:
if (%playercount > 0) then goto abort
else goto safe

abort:
echo aborted.... there are %playercount unfriendlies here
exit

safe:
echo you're safe
exit