
	routinecommon:
	timer clear
	timer start
	setvariable recenttalking none
	setvariable halfcounter 0
	setvariable grandcounter 0
	setvariable checkedalready no
	setvariable totalranks 0
	setvariable GMchecks 0
	setvariable keywords 0
	var origami_count 0
	var page_count 0
	var collect_count 0
	var envelope full
	var slips 0
	var compendium_page unknown
	setvariable talking none
	setvariable halfminutes 0
	var oklist Shofixy|Kalag|Nevinkar
#	var bad_page Gidii|River Caiman
	var bad_page none
	var runverbs (says|exclaims|whisper|comes out of hiding|asks|bends over.*corpse briefly)/i
	action put forage %braid when You need to have more material in your other hand to continue braiding.
	action put stop hum when You are a bit too busy performing to do that.
	action math totalranks add 1 when ^You've gained a new rank in
	action goto exitfull when WARNING:  You have a somewhat high number of items on your person|You're carrying far too many items already
	action put stop hum when You are concentrating too much upon your performance to do that
	action put stop climb when ^You should stop practicing your Climbing skill before you do that
	action put forage vine when You need to have more material in your other hand to continue braiding.
	action setvariable envelope empty when The envelope is empty
	action setvariable talking $0 when (\S+) %runverbs
	action var compendium_page $1 when You turn to the section containing (.*) physiology
	action setvariable disconnected yes when connection lost
	action put khri stop when Doing that would give away your hiding place
	action put study %origami ins when You need to study your instructions before you begin to make something.
	action var humming yes when (^You begin to hum|^You continue.*hum|^You.*as you begin to hum a|You are already performing something)/i
	action var humming no when (^You finish humming|^You stop playing your song.|^In the name of love)/i
	action var clutter bad when ^The room is too cluttered to find anything here
	gosub routineGMcheck
	return

move:
	var weaponrange missile
	put #script abort automapper
	if $standing = 0 then gosub put stand
	put #mapper walk $0
	movewait:
	matchre movereturn you have arrived at your destination
	matchre movecounter Obvious
	matchre movecounter closes in behind you
	matchre movecounter you sneak
	matchre movecounter you go
	matchre movewait you edge across the bridge
	matchre movewait Almost to the highest part of the bridge
	matchre movewait As you walk across the last stretch, a sudden gust of wind shakes the bridge
	matchwait 30
	if "%disconnected" = "yes" then goto notconnected
	echo FUCK IM LOST...
	goto roomrecovery

	
	return
	movecounter:
	var disconnected no
	if %currentwords != %keywords then
		{
		math keywords subtract 1
		setvariable currentwords %keywords
		}
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	goto movewait
	movereturn:
	if "$mapper" = "attack" then
		{
		if contains("$roomplayers", "Also here" then return
		if contains("$roomobjs", " that appears stunned") then return
		if contains("$roomobjs", "appears dead") then return
		if contains("$roomobjs", " bolt,") then return
		if contains("$roomobjs", " arrow,") then return
		if contains("$roomobjs", "%monster1") then if $monstercount > 0 then goto movedone
		if contains("$roomobjs", "%monster2") then if $monstercount > 0 then goto movedone
		if contains("$roomobjs", "%monster3") then if $monstercount > 0 then goto movedone
		if contains("$roomobjs", "%monster4") then if $monstercount > 0 then goto movedone
		}
	if "$mapper" = "search" then
		{
		if contains("$roomplayers", "Also here") then return
		if contains("$roomobjs", " that appears stunned") then return
		if contains("$roomobjs", "appears dead") then return
		if contains("$roomobjs", " bolt,") then return
		if contains("$roomobjs", " arrow,") then return
		goto movedone
		}
	return



playerscan:
	if contains("$roomplayers", "Also here") then
		{
		if "%roomplayers" != "$roomplayers" then
			{
			var roomplayers $roomplayers
			var playerduration %halfcounter
			}
		if %playerduration != %halfcounter then goto leavecombat
		}
	else if "%roomplayers" != "none" then
		{
		var roomplayers none
		var playerduration none
		}
	return


movedone:
	var talking none
	goto mainloop

	roomrecovery:
		var resonance roomrecovery
		put #script abort automapper
		if "$mapper" = "defense" then if $invisible = 0 then
			{
			gosub khri stop
			gosub khri silence
			}
		gosub hide
		gosub retreat
		if $up = 1 then gosub put up
		if $east = 1 then gosub put east
		if $north = 1 then gosub put north
		if $northeast = 1 then gosub put ne
		if $northwest = 1 then gosub put nw

		if $down = 1 then gosub put down
		if $west = 1 then gosub put west
		if $south = 1 then gosub put south
		if $southeast = 1 then gosub put se
		if $southwest = 1 then gosub put sw
		gosub clear
	goto tocombat
		



compendium:
	if %page_count = 0 then var page_max $0
	if %page_count < %page_max then gosub onepage
		else 
		{
		var page_count 0
		gosub emptyhands
		return
		}
	goto compendium


onepage:
	if !contains("$righthand", "compendium") then
		{
		gosub emptyhands
		gosub put get my compendium
		}
	gosub khri Calm
	gosub khri Focus
	gosub khri Guile
	if contains("%compendium_page" = "unknown") then gosub put turn my comp
	if matchre("%compendium_page" = "%bad_page") then goto pagedone
	if "%humming" = "no" then if $Vocals.LearningRate < 27 then gosub put hum %humtype
	put study my comp
	matchre pagedone With a sudden moment of clarity, the information on the chart suddenly makes sense to you
	matchre pagedone Why do you need to study this chart again?
	matchwait 7
	goto onepage
	pagedone:
	math page_count add 1
	gosub put turn my comp
	return

origami:
	if %origami_count = 0 then var origami_max $0
	if $Mechanical_Lore.LearningRate > 30 then return
	if %origami_count < %origami_max then gosub onepaper
		else 
		{
		var origami_count 0
		gosub emptyhands
		return
		}
	goto origami

#I'm afraid that you can't pull that

onepaper:
	if $invisible = 1 then gosub put khri stop
	gosub khri Hasten
	gosub khri Focus
	if !contains("$righthand", "%origami instructions") then
		{
		gosub emptyhands
		gosub put get my %origami ins
		}
	if "%humming" = "no" then if $Vocals.LearningRate < 27 then gosub put hum %humtype
	if !contains("$lefthand", "paper") then
		{
		if "$lefthand" != "Empty" then gosub emptyhands
		if contains("$roomobjs", "origami paper") then gosub put get paper
			else gosub put pull my env
		if contains("$lefthand", "paper") then gosub put study my %origami ins
		}
	else gosub put fold my paper
	if $Vocals.LearningRate < 27 then if "%humming" = "no" then gosub put hum %humtype
	if "%envelope" = "empty" then gosub newenvelope

	if "$lefthand" = "Empty" then return
	if contains("$lefthand", "origami %origami") then goto origamifinish
	if $Mechanical_Lore.LearningRate > 30 then return
	goto onepaper
	origamifinish:
	pause 0.1
	pause 0.1
	pause 0.1
	math origami_count add 1
	gosub put exh my %origami
	return

newenvelope:
	var envelope full
	gosub emptyhands
	gosub put rem my env
	gosub put poke my envelope
	gosub emptyhands
	gosub put get my env
	gosub put wear my env
	return

put:
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	send $0
	roundtime:
	pause 0.1
	if $dead = 1 then goto exitfull
	matchre roundtimedone Roundtime
	matchre roundtimedone \.\.\.wait
	matchre roundtimedone ^You
	matchre roundtimedone ^It would
	matchre roundtimedone ^Why do you need to study
	matchre roundtimedone I could not find
	matchre roundtimedone ^Remove what?
	matchre roundtimedone ^Stow what
	matchre roundtimedone In the
	matchre roundtimedone ^Skin what
	matchre roundtimedone ^The
	matchre roundtimedone closes in behind you
	matchre roundtimedone Cormyn shakes his head
	matchre roundtimedone Obvious paths
	matchre roundtimedone Stop what
	matchre roundtimedone ^But
	matchre roundtimedone Sell what
	matchre roundtimedone What were
	matchre roundtimedone There is nothing
	matchre roundtimedone What do
	matchwait 5
	roundtimedone:
	pause 0.1
	pause 0.1
	pause 0.1
	if "%pouchfull" = "yes" then gosub stowpouch
	if "%talking" != "none" then gosub antipersonnel
	var talking none
	put #statusbar Grandt = %grandcounter    StealT = %stealtimer    Caught = %wanted    Boxes in hand = %boxes    Opened Boxes = %openedboxes    Timer = %t    Keywords = %keywords    Ranks = %totalranks    Resonance = %resonance
	if $webbed = 1 then gosub rtwebbed
	if $dead = 1 then goto exitfull
	if $health < 50 then goto exitquick
	if $stunned = 1 then goto exitquick
	if $standing = 0 then gosub put stand
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	if $roomid = %loreroom then if $monstercount > 0 then goto exitquick
	if "%disconnected" = "yes" then goto notconnected
	if $connected = 0 then goto notconnected
	if %t < 1 then timer clear
	if %t < 1 then timer start
	if %t > 15 then gosub grandcounter
	return



notconnected:
	var disconnected no
	pause 20
	put #connect
	pause 5
	goto leavecombat


rtwebbed:
	pause 0.5
	if $webbed = 1 then goto rtwebbed
	return

grandcounter:
	if %t > 15 then gosub gmcheckupdate
	if %t > 0 then gosub grandupdate
	return
gmcheckupdate:
	setvariable keywords 0
	return
grandupdate:
	math halfcounter add 1
	if %halfcounter > 3 then math grandcounter add 1
	if %halfcounter > 3 then setvariable halfcounter 0
	timer clear
	timer start
	return

antipersonnel:
	if "%resonance" = "runhide" then return
	if "%resonance" = "climbing" then return
	if "%resonance" = "stealing" then return
	if matchre("%talking", "%oklist") then return
	if matchre("%resonance", "%ignorerooms") then return
	if matchre("%talking", "Brokk rubs his forehead thoughtfully and says, Got to find me m") then return
	if matchre("%talking", "Like the ebb and flow of the ocean tide, so moves the") then return
	if matchre("%talking", "This is the heart of the wood, where the trees are the") then return
	if matchre("%talking", "A swift draft sweeps in from above, whispering crisply") then return
	if matchre("%talking", "^Ershhn chirrs softly as he catches your eye.  Beckoning") then return
	if matchre("%talking", "Sheltering branches sway above, allowing") then return
	if matchre("%talking", "Hardwoods gradually mingle with the conifers") then return
	if matchre("%talking", "Imbrued in darkness, the forest is thick with secrets whispe") then return
	if matchre("%talking", "The attendant says, You can purchase") then return
	if matchre("%talking", "Fallen leaves rustle with the movements of") then return
	if matchre("%talking", "Cormyn shakes his head and " then return
	if matchre("%talking", "Patting the side of the boar's thick neck") then return
	if "%talking" != "none" then echo %talking
	setvariable talking none
	gosub clear
	goto runhide

pause:
	var time $0
	pauseloop:
	pause 4.5
	gosub roundtimedone
	math time subtract 5
	if $invisible = 0 then if $monstercount > 0 then return
	if %time > 0 then goto pauseloop
	return

collect:
	if $Foraging.LearningRate > 30 then return
	if %collect_count = 0 then var collect_max $0
	gosub emptyhands
	if %collect_count < %collect_max then
		{
		if $monstercount > 0 then return
		math collect_count add 1
		if "%humming" = "no" then if $Vocals.LearningRate < 27 then gosub put hum %humtype
		if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
		if $Foraging.LearningRate < 30 then gosub put collect %collect
			else math collect_count add 50
		if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
		}
	else 
		{
		if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
		var collect_count 0
		return
		}
	goto collect







	if $Vocals.LearningRate < 27 then gosub put hum %humtype

	if $Foraging.LearningRate < 30 then gosub put kick $0
	if $Foraging.LearningRate < 30 then pause 0.1
	if $monstercount > 0 then return

	if contains("$roomobjs", "$0") then gosub put kick $0
	return


MD:
	if $concentration > 25 then return
	gosub getfan
	if $Vocals.LearningRate < 27 then gosub put hum %humtype
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub put tap fan
	if $concentration > 25 then return
	gosub put tap fan
	gosub emptyhands
	return


getmelee:
	pause 0.1
	if "%melee" = "\%melee" then echo NO MELEE WEAPON SPECIFIED, please set a \%melee
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if "$lefthand" = "%melee" then gosub put swap
	if contains("$lefthand", "dirt" then gosub put drop my dirt
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthandnoun" = "%melee" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put get my %melee
	return

getlb:
	pause 0.1
	if "%lb" = "\%lb" then echo NO LB WEAPON SPECIFIED, please set a \%lb
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if "$lefthand" = "%lb" then gosub put swap
	if contains("$lefthand", "dirt" then gosub put drop my dirt
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthandnoun" = "%lb" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put get my %lb
	return


getthrown:
	pause 0.1
	if "%thrown" = "\%thrown" then echo NO THROWN WEAPON SPECIFIED, please set a \%ranged
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if contains("$lefthand", "dirt" then gosub put drop my dirt
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthandnoun" = "%thrown" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put get %thrown
	return

getranged:
	pause 0.1
	if "%ranged" = "\%ranged" then echo NO RANGED WEAPON SPECIFIED, please set a \%ranged
	if "$lefthandnoun" = "%ranged" then gosub put swap
	if contains("$lefthand", "dirt" then gosub put drop my dirt
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthandnoun" = "%ranged" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put retreat
	gosub put get my %ranged
	return
getjugglies:
	pause 0.1
	if "%jugglies" = "\%jugglies" then echo NO JUGGLIES SPECIFIED, please set a \%jugglies
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if contains("$lefthand", "dirt") then gosub put drop my dirt
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthandnoun" = "%jugglies" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put get my %jugglies
	return
getlock:
	pause 0.1
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "lockpick" then gosub put swap
	if "$lefthandnoun" = "lockpick" then return
	if "$lefthand" != "Empty" then gosub put stow left
	gosub put get my lockpick
	return

getfan:
	pause 0.1
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if contains("$lefthand", "dirt") then gosub put drop my dirt
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthandnoun" = "fan" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put get my fan
	return
getbox:
	pause 0.1
	setvariable mybox $0
	if contains("$lefthand", "dirt" then gosub put drop my dirt
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if "$lefthandnoun" = "%boxtypes" then gosub put swap
	if "$righthandnoun" = "%boxtypes" then return
	if "$righthand" != "Empty" then gosub put stow right
	gosub put get my %mybox
	return
emptyhands:
	pause 0.1
	if contains("$lefthandnoun", "dirt") then gosub put drop my dirt
	if contains("$righthandnoun", "dirt") then gosub put drop my dirt
	if contains("$lefthandnoun", "paper") then gosub put drop my paper
	if contains("$lefthandnoun", "%braid") then gosub put drop my %braid
	if contains("$righthandnoun", "%braid") then gosub put drop my %braid
	if contains("$lefthand", "dirt") then gosub put drop my dirt
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if "$lefthand" != "Empty" then gosub put stow left
	if "$righthand" != "Empty" then gosub put stow right
	return



smartranged:
	if "$lefthandnoun" = "%ranged" then gosub put swap
	if "$lefthand" != "Empty" then gosub put stow left
	if "%loaded" = "yes" then {
		if $monstercount > 0 then gosub put aim
		if $monstercount > 0 then gosub put fire
			else {
				gosub put unload
				gosub put stow %ammo
				}
			}
	gosub put stow %ranged
	return


reconnect:
	pause 600
	echo 10 minutes
	pause 600
	echo 20 minutes
	pause 600
	echo 30 minutes
	pause 600
	echo 40 minutes
	pause 300
	echo 45 minutes
	echo logging back in...
	pause 2
	put #connect
	pause 12
	goto initialize



exit:
	action clear
	pause 15
	timer clear
	timer stop
	put exit
	pause 2
	put exit
	goto reconnect
exitfull:
	action clear
	pause 20
	if dead then put exit
	pause 2
	if dead then put exit
	pause 20
	exitquick:
	#config connect False
	put exit
	pause 2
	put exit
	exit

include RoutineGMcheck.cmd