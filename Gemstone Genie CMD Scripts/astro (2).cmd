## Astrology script by Haldrik 2010 & 2012 - INCLUDE FILE
## Observe list, change to whichever constellations you want to observe
routineastro:
	setvar obs.list morleena|shrike|welkin|merewalda|triquetra|durgaulda|brigantine|archer|toad|spider|raccoon|shark|magpie|wolverine|panther|xibar|katamba|sun|yavash

	setvar def.list morleena|welkin|toad|magpie|katamba
	setvar mag.list morleena|durgaulda|shrike|spider|yavash
	setvar lor.list morleena|brigantine|shrike|welkin|xibar
	setvar off.list merewalda|triquetra|archer|raccoon|shark|wolverine|panther|sun
	setvar sur.list morleena|merewalda|shrike|welkin|triquetra|durgaulda|brigantine|archer|toad|spider|raccoon|magpie|shark|wolverine|panther|sun|yavash
	
	action var redo 1 when ^You have not pondered
	action setvar fruit 1 when You peer at .+ panther
	action setvar fruit 1 when turns up fruitless.
	action setvar cloud 1 when Clouds obscure the sky|You see nothing regarding the future.

	action goto observe1 when ^Your search for the Elanthian sun is foiled by the darkness\.
	action setvar day 1 when foiled by the daylight\.
return

astrotrain:
	setvar day.adjust 0
	setvar day 0
	setvar center 0
	setvar c 0
	setvar redo 0
	setvar cloud 0
	setvar pred.list
	
	gosub put get my tele

## Finding a visible constellation
center:
	setvar fruit 0
	gosub put center tele on %obs.list(%c)
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

## Constellation found
const:
	var vis %obs.list(%c)
peer:
	gosub put peer tele
	if %redo = 1 then goto delay.obs
	if %cloud = 1 then gosub castpg
	if %cloud = 1 then
	{
		setvar cloud 0
		goto peer
	}
	gosub put stow tele

## Calculating available pools for prediction
	if matchre("%vis",	"%off.list") then setvar pred.list %pred.list|offense
	if matchre("%vis", "%sur.list") then setvar pred.list %pred.list|survival
	if matchre("%vis", "%def.list") then setvar pred.list %pred.list|defense
	if matchre("%vis", "%mag.list") then setvar pred.list %pred.list|magic
	if matchre("%vis", "%lor.list") then setvar pred.list %pred.list|lore
	eval pred.size count("%pred.list", "|")

## Predicting with tools
	setvar c 1
	gosub put get my %tool

align:
	gosub put align %pred.list(%c)
	goto %tool

deck:
	gosub put shuffle deck
	gosub put cut deck 
	gosub put deal deck 6
	goto tool.end

 
bone:
	if $kneeling != 1 then gosub put kneel
	gosub put throw my bones at stoh
	goto tool.end

mirror:
	gosub put gaze mirror
	goto tool.end

tool.end:
	math c add 1
	if %c <= %pred.size then goto align
	gosub put pred anal
	timer clear
	timer start
	gosub put stow %tool
	gosub collect 4

## Timer for predict analyze and predictions
	setvar c 0
timer:
	if %t > 90 then
	{
		timer clear
		timer start
		math c add 1
		if %c = 1 then gosub put predict anal
		if %c = 1 then gosub collect 4
	}
	if $Astrology.LearningRate > 33 then return
	if %c >= 2 then goto astrotrain
	delay 10
	goto timer

castpg:
	gosub put prep pg 10
	gosub pause 10
	gosub put cast
return

day:
	eval obs.max count("%obs.list", "|")
	setvar day.adjust 1
	setvar c %obs.max
	goto center