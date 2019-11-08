include base.cmd
debuglevel 10
## OLD.  USE ASTRO.CMD
## Astrology script by Haldrik 2010 & 2012
## Observe list, change to whichever constellations you want to observe
observe1:
	
setvar obs.list forge|er'qutra|dawgolesh|amlothi|morleena|archer|vulture|spider|raccoon|shark|magpie|wolverine|panther|xibar|katamba|sun|yavash

setvar def.list forge|dawgolesh|morleena|merewalda|welkin|toad|magpie|katamba
setvar mag.list dawgolesh|amlothi|durgaulda|shrike|spider|yavash
setvar lor.list forge|er'qutra|amlothi|brigantine|shrike|welkin|xibar
setvar off.list forge|merewalda|triquetra|archer|raccoon|shark|wolverine|panther|sun
setvar sur.list er'qutra|morleena|shrike|welkin|triquetra|durgaulda|brigantine|archer|toad|spider|raccoon|magpie|shark|wolverine|panther|sun|yavash
setvar day.adjust 0
setvar day 0
setvar center 0
setvar c 0
var redo 0
setvar cloud 0
setvar pred.list

action var redo 1 when ^You have not pondered
action setvar fruit 1 when You peer at .+ panther
action setvar fruit 1 when turns up fruitless.
action setvar cloud 1 when Clouds obscure the sky|You see nothing regarding the future.

action goto observe1 when ^Your search for the Elanthian sun is foiled by the darkness\.
action setvar day 1 when foiled by the daylight\.

gosub m.input get tele

## finding a visible constellation
center:
setvar fruit 0
gosub put.1 "center tele on %obs.list(%c)" "You put|You peer"
if %fruit = 1 then 
{	
	if %day = 0 then math c add 1
	else math c subtract 1
	goto center
}
else if ((%day = 1) && (%day.adjust = 0)) then goto day
goto const

delay.obs:
var redo 0
delay 15
goto center

## constellation found
const:
var vis %obs.list(%c)
peer:
gosub put.1 "peer tele" "^Roundtime|Clouds obscure"
if %redo = 1 then goto delay.obs
if %cloud = 1 then gosub castpg
if %cloud = 1 then
{
	setvar cloud 0
	goto peer
}
gosub put.1 "stow tele" "You put your"

## calculating available pools for prediction
if matchre("%vis", "%off.list") then setvar pred.list %pred.list|offense
if matchre("%vis", "%sur.list") then setvar pred.list %pred.list|survival
if matchre("%vis", "%def.list") then setvar pred.list %pred.list|defense
if matchre("%vis", "%mag.list") then setvar pred.list %pred.list|magic
if matchre("%vis", "%lor.list") then setvar pred.list %pred.list|lore
eval pred.size count("%pred.list", "|")

## predicting with tools
setvar c 1
gosub m.input get $tool

align:
gosub put.1 "align %pred.list(%c)" "^Roundtime"
goto $tool

deck:
gosub put.1 "shuffle deck" "^You cautiously"
gosub pu2. "cut deck" "deal deck 6" "^You collect the cards"
goto tool.end

 
bone:
if $kneeling != 1 then put kneel
gosub put.1 "throw my bones at stoh" "^Roundtime"
goto tool.end

mirror:
gosub put.1 "gaze mirror" "^Roundtime"
goto tool.end

tool.end:
math c add 1
if %c <= %pred.size then goto align
gosub put.1 "pred anal" "^Roundtime"
timer clear
timer start
gosub put.1 "stow $tool" "^You put"
#send .collect 34 4
## send .powerp stop
## timer for predict analyze and predictions
setvar c 0
timer:
if %t > 90 then
{
	timer clear
	timer start
	math c add 1
	if %c = 1 then gosub put.1 "predict anal" "^Roundtime"
	pause .2
	#if %c = 1 then send .collect 34 4
}
if $Astrology.LearningRate >= 34 then goto exit
if %c >= 2 then goto observe1
delay 10
goto timer

exit:
delay 1
pause
put #script abort collect
if $kneeling = 1 then put dance silly
put #parse observe1.cmd done.
exit

castpg:
gosub splay
delay 1
gosub m.input spell pg 30 15 20
return

day:
eval obs.max count("%obs.list", "|")
setvar day.adjust 1
setvar c %obs.max
goto center