include base.cmd
var fa1 red comp
var fa2 cloth comp

if "$guild" = "Bard" then
{
gosub put.1 "mana song 20" "^Your enchante"
gosub put.1 "chant fae" "^You take|^You're"
}

action var return 1 when ^You continue to study|^Why do you|^You continue studying
action goto studytimer when You take on a studious look.
var return 0
var fa.waitstring ^You begin|^With a sudden|^You continue to study|^You continue studying|^Why do you|^In a sudden moment|^You attempt

getcomp:
gosub studystart %fa1
gosub put.1 "stow comp" "^You put"
var return 0
gosub studystart %fa2
goto studytimer

studystart:
gosub put.1 "get my $1 comp" "^You get|^You are already"
gosub put.1 "study my comp" "%fa.waitstring"

faloop:
if ($Scholarship.LearningRate != 34) then 
{
	gosub put.1 "turn my comp" "^You turn"
	gosub put.1 "study my comp" "%fa.waitstring"
	if %return = 1 then return
	#gosub put.1 "hum $Hum_Song" "^You are already|^You begin"
	goto faloop
} 

studytimer:
gosub put.1 "stow comp" "^You put"
end:
echo Compendium training done.
put #parse studyc.cmd done.