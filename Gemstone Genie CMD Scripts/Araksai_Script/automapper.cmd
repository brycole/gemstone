echo AUTOMAPPER STARTED
#debuglevel 5

loop:
if $connected = 0 then echo MOVE %1
if $connected = 1 then gosub move %1
shift
if_1 goto loop
exitmapper:
put #parse you have arrived at your destination
exit

move:
	if ($hidden = 1) then
		{
		if matchre("%1", "climb") then var movement %1
		else var movement sneak %1
		} 
	else var movement $0
#	eval movement replace ("%movement", "sneak u", "sneak up")
	eval movement replace ("%movement", "sneak go", "sneak")

move.real:
	if $hidden = 0 then eval movement replace ("%movement", "sneak", " ")
	matchre move.real ^\.\.\.wait
	matchre move.real can't seem to make much headway
	matchre move.real ^Sorry, you may only type ahead
	matchre move.real ^Sneaking is an inherently stealthy endeavor, try being out of sight
	matchre move.failed ^You can't go there
	matchre move.failed ^I could not find what you were referring to\.
	matchre move.failed ^What were you referring to
	matchre move.retreat ^You are engaged to
	matchre move.retreat ^You can't do that while
	matchre move.retreat You attempt to move, but you find the mud adheres to your feet like thick paste and fastens you to the ground
	matchre move.retreat ^You slip in the mud and fall flat on your back
	matchre move.retreat ^You try to move, but you're engaged
	matchre unstealth You can't do that here.
	matchre unstealth ^You can't sneak that way
	matchre move.done ^It's pitch dark
	matchre move.done ^Obvious
	matchre exitmapper ^You need to be visible first
	matchre exitmapper ^The door is locked up tightly for the night
	matchre move.pause ^All this climbing back and forth is getting a bit tiresome
	if $standing = 0 then put stand
	put %movement
	matchwait 25
move.retreat:
	if $monstercount > 0 then put retreat
	if $monstercount > 0 then put retreat
	wait
	goto move.real
move.failed:
	put #parse you have arrived at your destination
	echo *** move failed ***
	exit

unstealth:
	gosub put dance
	goto move.real



move.pause:
	if $hidden = 1 then goto move.done
	pause 10
	goto move.real
move.done:

	if "$mapper" = "attack" then
		{
		if contains("$roomplayers", "Also here") then return
		if contains("$roomobjs", " that appears stunned") then return
		if contains("$roomobjs", "appears dead") then return
		if contains("$roomobjs", " bolt,") then return
		if contains("$roomobjs", " arrow,") then return
		if contains("$roomobjs", "pyramid") then return
		if contains("$roomobjs", "pile of rock") then return
		if contains("$roomobjs", "that is sleeping") then return
		if contains("$roomobjs", "that appears immob") then return
		if eval(count("$roomobjs", ",")) > 10 then return
		if contains("$roomobjs", "$monster1") then if $monstercount > 0 then goto exitmapper
		if contains("$roomobjs", "$monster2") then if $monstercount > 0 then goto exitmapper
		if contains("$roomobjs", "$monster3") then if $monstercount > 0 then goto exitmapper
		if contains("$roomobjs", "$monster4") then if $monstercount > 0 then goto exitmapper
		}
	if "$mapper" = "search" then
		{
		if contains("$roomplayers", "Also here") then return
		if contains("$roomobjs", " that appears stunned") then return
		if contains("$roomobjs", "appears dead") then return
		if contains("$roomobjs", " bolt,") then return
		if contains("$roomobjs", "pyramid") then return
		if contains("$roomobjs", " arrow,") then return
		if contains("$roomobjs", "pile of rock") then return
		if contains("$roomobjs", "that appears immob") then return
		if eval(count("$roomobjs", ",")) > 10 then return
		goto exitmapper
		}
	return

return:
return
put #parse you have arrived at your destination