##debuglevel 10
put #statusbar 1 ""
put #var pawn 0
setvar watch 0
delay 1
put stop play
delay 1
echo Make sure hands are empty.
if ($lefthand != "Empty") then exit
if ($righthand != "Empty") then exit

action send .pawn when $findpawn
action shift when There isn't any more room|That's too heavy to go in there!
action setvar end.shop 1 when but at the last minute you realize that you are being watched
action setvar end.shop 1 when begins to shout loudly for help.|begins to shout for help.
action servar end.shop 1 when They are placed in a sack

## Steal start
gosub armor off
gosub empty
gosub map

zonecheck:
if $zoneid = 1 then goto crossing
if $zoneid = 99 then goto aesry
if $zoneid = 67 then goto shard

echo Cannot find zone id! Exiting script.
exit

crossing:
include crossingsteal.cmd
goto end

shard:
include shardsteal.cmd
goto end

aesry:
include aesrysteal.cmd
goto end

move:
put #var lastmove $1
gosub empty
delay 1
put #mapper walk $1
waitfor @walk done.
return

steal:
setvariable stealcount 0
steal2:
if %end.shop = 1 then
{
	setvar end.shop 0
	return
}
if %stealcount < $2 then
{
	if ($hidden = 0) then put hide
	pause
	math stealcount add 1
	evalmath stashcount %stealcount % 2 
	put steal $1
	waitfor Roundtime
	pause
	if %stashcount = 0 then
		{
			gosub stash
			pause
			gosub stash
			pause
		}
	goto steal2
}
else
{
	if %stashcount = 1 then
	{
			gosub stash
			pause
			return
	}
	else return
}

stash:
if_1 then
{
	put put my $righthandnoun in my %1
	pause
}
else put drop my $righthandnoun
return

empty:
if ($lefthand != "Empty") then put empty left
if ($righthand != "Empty") then put empty right
return

armor: 
var arm $1
include armor.cmd
return

map:
include map.cmd
return

exit:
echo Hands are not empty!
exit

end:
##if $zoneid = 1 then gosub crossingend
##if $zoneid = 99 then gosub aesryend
pause 1
gosub empty
delay 3
gosub armor on
##put #mapper walk %end.room
##waitfor @walk done.
echo Steal done, starting one hour timer.
put #parse steal.cmd done.
delay 3600
echo One hour steal timer is up.
put #statusbar 1 STEAL NOW
exit

RETURN:
return