include base.cmd
include favora.cmd

#debuglevel 10

action var favors $1 when Favors : (\d+)

setvar c 0

#goto bypass

start.favor:
if %favors > 10 then exit
setvar c 0
if "$guild" = "Bard" then gosub put.1 "sing mere" "^With a quick|^You're"
put hum $vocals_song
gosub ss to favor
if "$zoneid" = "3" then
{
	gosub put.1 "go stone" "^Obvious"
}
else gosub put.2 "go maus" "go font" "^Quartz steps"

pray.l:
gosub pray
math c add 1
if %c >= 2 then goto to.temple
goto pray.l

to.temple:
##if "$zoneid" = "3" then gosub put.2 "get my orb" "east" "^Obvious"
gosub ss to northeast
if "$zoneid" = "180" then 
{
	gosub ss collect
	gosub move 135
}
if "$zoneid" = "1" then 
{
	delay 1
	gosub move 172
	gosub move 10
	gosub ss collect
	gosub put.1 "get my orb" "You get"
	gosub ss to temple
}

setvar c 0
get.orb:
gosub put.1 "get orb" "^You get|^What were you|^You are already"
math c add 1

rub:
put rub my orb
matchre rub ^As you rub the orb,
matchre altar ^The \S+ orb
matchre drop ^You sense that this
matchre check.favor ^Rub what\?
matchwait

drop:
gosub put.1 "drop orb" "^You drop"
goto get.orb

altar:
gosub put.1 "put orb on altar" "^As you start"
match c add one
if %c >= 2 then goto check.favor
goto get.orb

check.favor:
put info
waitfor Encumbrance :
if %favors < 8 then goto start.favor

echo Favor script done.