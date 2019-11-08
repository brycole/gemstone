action put pull my pole when wind in
action goto cast when That's all of it!
action goto stowF when You've pulled in (a|an) \w+ (grek|nomlas|muskalundge). 
action goto stowF when You've pulled in a flat-eyed creppoo.
action goto turt when You've pulled in a small turtle.
action goto seaw When You've pulled in some seaweed.  
action put untangle my pole when your line gets all tangled up\!
action put pull my my pole when your line gets all tangled up\!
counter set 0
var sleep 0
put get pole
put get line
pause
put get bait
pause

cast:
if (%c = %2) then goto exit
if ($Foraging.LearningRate != 12) then {
		if (%sleep = 1) then {
		put awaken
		var sleep 0
		}
gosub fish
}
else {
	if (%2 != 99) then {
		if (%sleep = 0) then {
		put sleep
		var sleep 1
		}
	gosub fish
	}
	else goto exit
}

tug:
put pull my pole
delay 50

fish:
put cast my pole
match tug tug
matchwait 3
goto tug

stowF:
counter add 1
if (%1 = throw) then put throw my $lefthandnoun
else put put my $lefthandnoun in my %1
gosub m.inputait

seaw:
put drop my seaw
gosub m.inputait

turt:
put throw my turt
gosub m.inputait

bait:
put get bait
pause
goto cast

exit:
put drop my pole
put awaken
echo Fishing done.
echo %c fish caught.
