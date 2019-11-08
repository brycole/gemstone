include base.cmd
#debuglevel 10

## Set $guild var with name of guild
## Set $collect 

action goto delay when ^You are still stunned\.
action goto f.exit when ^The room is too cluttered to find anything here!

var fall 0
var count 0
var camb wrist
var spell shadows

#goto $charactername

if "$guild" = "Bard" then 
{
gosub put.1 "mana song 1" "^Your enchante"
gosub put.1 "sing mere" ".+"
}
collect.start:
if (($Perception.LearningRate >= %1) && ($Foraging.LearningRate > 25)) then goto f.exit
if_2 then if %count >= %2 then goto f.exit
#if (($mana > 50) && ($guild = moon)) then
#{
#	gosub splay
#	gosub put.2 "prep %spell" "charge %camb 32" "Roundtime"
#	gosub put.1 "focus wrist" "Roundtime|Your link"
#	var cast 1
#}
if %hum = 1 then gosub hum
if %hum = 1 then var hum 0
gosub put.1 "collect $collect" "^Roundtime:"
#if %cast = 1 then 
#{
#	gosub splay
#	gosub put.1 "cast" ".+"
#	var cast 0
#}
evalmath count (%count + 1)
kp:
gosub put.1 "kick pile" "^You take a step back|^I could not"
gosub ppcheck
goto collect.start

delay:
delay 10
gosub put.1 "dance silly" "^You leap to your|^Your wounds"
if $standing != 1 then goto delay
goto kp

f.exit:
##gosub put.1 "mana song 1" "^Your enchante"
if $standing != 1 then goto delay
echo Perception and forage learning done.
put #parse collect.cmd done.
exit
