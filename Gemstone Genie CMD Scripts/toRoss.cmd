# debuglevel 10
# Rossman shortcut
# first 4 letters in %1 is destination

include base.cmd

action var wait.rope 1 when is already on the rope\.
action var arrive 1 when finally arriving|finally reaching
action put quit when You'd best focus on getting across|but to no avail as your fingers lose their grip,
action var path.move $1 when ^Peering closely at a faint path, you realize you would need to head (\w+)\.

gosub put.1 "stop play" "^You stop|^In the name"

goto $zoneid
33a:
goto ledge

# mistwood forest
34:
if %1 = have then goto have.s
gosub move 53
gosub ravine north
gosub move 137
gosub move 12
goto exit

# lang
40:
gosub move 231
gosub move 121
gosub ravine south
gosub move 44
have.s:
if %1 = have then
{
	gosub move 15
	gosub move 8
	gosub put.2 "south" "south" "^At the top of a rocky"
	gosub put.2 "search outcrop" "climb hand" "^Obvious"
	gosub move 46 
	gosub move 1
}
goto exit

30:
gosub move 174
gosub move 29
gosub move 14
gosub put.2 "search outcrop" "climb hand" "^Obvious"
gosub put.2 "climb wall" "north" "^Obvious"
ledge:
if $monstercount > 0 then gosub retreat.start
gosub put.2 "search ledge" "climb shrub" "^The rock face"
gosub put.2 "peer path" "down" "^Obvious"
gosub put.2 "%path.move" "n" "^Obvious"
gosub put.1 "ne" "^Obvious"
gosub move 48
if %1 = ross then gosub move 22
if %1 = lang then goto 34
exit

ravine:
var arrive 0
if $1 != "" then var dir.rope $1
put #var ross.rope 1
gosub put.1 "climb rope" "^Roundtime:|is already on the rope\."
if %wait.rope = 1 then 
{
	var wait.rope 0
	gosub hide.b
	if %arrive = 1 then goto ravine
	waitforre finally arriving|finally reaching
	goto ravine
}
put #var bleeding 0
gosub put.1 "shuffle %dir.rope" "^Obvious|^What do you want"
put #var bleeding 0
gosub put.1 "shuffle %dir.rope" "^Obvious|^What do you want"
put #var bleeding 0
gosub put.1 "shuffle %dir.rope" "^Obvious|^What do you want"
put #var bleeding 1
put #var ross.rope 0
gosub cut
gosub retreat.start
return

exit:
echo Arrived.
put #parse toross.cmd done.