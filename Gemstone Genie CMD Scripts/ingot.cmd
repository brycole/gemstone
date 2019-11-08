routineingot:
	var smithsupplies 920

	action var tool shovel;var action push fuel with my shovel when ^As you complete working the fire dies down and appears to need some more fuel\.|^As you complete working the fire dies down and needs more fuel\.
	action var tool bellows;var action push bellows when ^As you finish the fire flickers and is unable to consume its fuel\.
	action var tool rod;var action turn crucible when ^Upon finishing you observe clumps of molten metal accumulating along the crucible's sides\.
	action var tool complete when The metal quickly cools and you pick up the .+ ingot\.$
	action var tool rod;var action stir crucible with my rod when ^push fuel with my shovel|^push bellows|^turn crucible
	action var ground yes when The metal quickly cools, but your hands are full so you set it down upon the ground\.$
return

ingot:
	#debug 10


	#if_1 goto setup
	if "$1" != "" then
	{
		var process $0
		goto begin
	}
	echo First must be either smelt or refine
exit

setup:
	counter set 0

	var chapter 1
	var process $1

	if "%process" = "smelt" then var page 1
	else
	{
		if contains("%process", "refine") then var page 2
		else
		{
			echo first argument must be smelt or refine, try again
			exit
		}
	}

begin:

	var tool rod
	var action stir crucible with my rod
	var first yes


#setup.crucible:
#matchre ingot ^You get|^You are
#matchre no.ingot ^What were you
#put get my ingot
#matchwait

#ingot:
#put put my ingot in cruc
#waitforre ^You put
#goto setup.crucible

no.ingot:
	if "%process" = "smelt" then goto work
	if "$2" != "" then gosub put.1 "get my $2 ingot from my hav" ".+"
	if "$2" != "" then gosub put.1 "put my $2 ingot in cruc" ".+"
	gosub get my flux
	gosub put.1 "pour flux in cruc" "^Roundtime"
	gosub stow flux

work:
	#gosub sortmagic
	if "$righthandnoun" != "%tool" then
	{
		gosub emptyhands
		gosub get %tool
	}
	gosub put.1 "%action" "^Roundtime"
	if "%tool" = "complete" then goto finish
	if $Forging.LearningRate > 33 then
	{
		gosub put.1 "tilt cruc" "^You grab"
		gosub put.1 "tilt cruc" "^Roundtime"
		return
	}
	goto work

finish:
	return
	gosub emptyhands
	if "%ground" = "yes" then gosub get ingot
	echo Finished %process
return
