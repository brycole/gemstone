debuglevel 10
var killmob scavenger goblin
var disablemob scout ogre

gosub routinecommon 

action var mob1 $1 when A (.+) \(1:
action var mob2 $1 when A (.+) \(2:
action var mob3 $1 when A (.+) \(3:
action var mob4 $1 when A (.+) \(4:

echo %killmob
echo %disablemob

start: 

var moblist %mob1|%mob2|%mob3|%mob4
echo %mob1
echo %mob2
echo %mob3
echo %mob4
echo %moblist

killstart:
	if contains("%moblist", "%killmob") then
		{
		 gosub put prep pd
		 gosub pause 1
		 gosub put cast %killmob
		 if contains("$roomobjs", "appears dead") then gosub put loot
		 else goto killstart
		}

delay 3
goto start
exit

include routinecommon.cmd
		