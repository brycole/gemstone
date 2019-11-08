	
	routinecommon:
	timer clear
	timer start
	var rtgood ^Roundtime:|^\[Roundtime
	var rtwait ^\.\.\.wait|^You don't seem to be able to move to do that|^You struggle against the shadowy webs to no avail\.|^Sorry, system is slow|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!
	var ritual.msg ^This ritual may only|^Rituals do not work|^You've|^A skinned creature is worthless|^This corpse has already been|^The preservation ritual performed|^Lacking your knife, you cannot perform any rituals.
	var app.msg ^Appraise what|^It's dead|Roundtime:
	var stalk.msg ^You are already|^Stalking is an|^Stalk what\?|^\[You're
	var advance.msg ^What do you want to advance towards\?|^You begin to advance on|already quite dead\.|^You are already advancing on|^You are already at melee with|^You begin to stealthily advance on|^You spin around to face|^You will have to retreat from your current melee first\.
	var get.msg ^You get|^You pick up|^You are already holding that\.|^You fade in for a moment as you pick up|^You pull|^What were you referring to\?|^But that is already in your inventory\.|^You are not strong enough to pick that up\!
	var prep.msg ^You begin chanting a prayer|^You close your eyes and breathe deeply,|^You trace an arcane sigil in the air,|^Heatless orange flames blaze between your fingertips|^Your eyes darken to black as a starless night|^You raise your arms skyward, chanting|^You are already preparing|^Icy blue frost crackles up your arms|^You make a careless gesture as you chant the words|^Tiny tendrils of lightning jolt between your hands|^The wailing of lost souls accompanies your preparations|^Your skin briefly withers and tightens, becoming gaunt|^Images of streaking stars falling from the heavens flash across your vision|^A nagging sense of desperation guides your hands through the motions|^You hastily shout the arcane phrasings needed to prepare|^You deftly waggle your fingers in the precise motions needed to prepare|^With great force, you slap your hands together before you and slowly pull them apart,|^With no small amount of effort, you slowly recall the teachings|^You struggle against your bindings to prepare|^You raise one hand before you and concentrate|^As you begin to focus on preparing
	var cast.msg ^You gesture|^You don't have a spell prepared\!|^Your spell pattern collapses|^With a wave of your hand,|^You wave your hand\.|^With a flick of your wrist,|^Your secondary spell pattern dissipates|^You can't cast .+ on yourself\!|^You make a holy gesture|^You raise your palms and face to the heavens|^I could not find what you were referring to\.|^You have difficulty manipulating the mana streams, causing the spell pattern to collapse at the last|^You draw your|^You reach with both
	var hide.msg ^Eh\?|^You melt into|^You are a bit|^You blend in with|notices your attempt to hide\!$
	var hum.msg ^You are already|^You begin|^You fumble
	var stow.msg ^You put|^What were|^You can't put|^There isn't|too thick to fit|^Stow what|^But that
	var wear.msg ^You attach|^You work|^You slip|^You put a|^You are already
	var cman.msg ^\[Roundtime|^You aren't|^There is nothing|^Roundtime|already loaded|^You begin|^How can you|What are you trying to throw?
	var mark.msg ^Mark
	var orig.msg ^You tear|^You remove|^You attach
	var misc.msg ^You take|^You turn|^You search|^Setting|^You stop practicing|^But you are already|^You toss your|^You stand|^You kneel|^You need to have|^Framed by a low|^You drop|^This chapter|^You turn your book|^You carefully make|^You make|^You find|^You study your
	var astro.msg ^You cut
	var wield.msg ^With a flick|^You're already|^You draw|^You sling|^You aren't|^You deftly|^You pick|^You are|^You get|^You exhale
	var sheath.msg ^You deftly|^You secure|^You sheath|^With a flick|^You sling|^Perhaps
	var total.msg %rtgood|%ritual.msg|%app.msg|%stalk.msg|%advance.msg|%get.msg|%prep.msg|%cast.msg|%hide.msg|%hum.msg|%stow.msg|%mark.msg|%wield.msg|%sheath.msg|%astro.msg|%misc.msg|%orig.msg|%wear.msg
	setvariable recenttalking none
	setvariable humstopmsg ^You are concentrating too much upon your performance to do that|^You should stop playing before you do that.|^You are a bit too busy performing to do that.
	setvariable halfcounter 0
	setvariable quartcounter 0
	setvariable astrocounter
	setvariable grandcounter 0
	setvariable checkedalready no
	setvariable totalranks 0
	setvariable GMchecks 0
	setvariable keywords 0
	var checkharness 1
	var origami_count 0
	var page_count 0
	var collect_count 0
	var envelope full
	var slips 0
	var humming no
	var foragemore 0
	var focus 0
	var checktime 1
	var axes 0
	var maxaxe 0
	var thrownknife 25
	var maxthrown 25
	var thrownweap steelstar
	var thrownweap.count 0
	var tempthrown 0
	var bolas 1
	var spears 3
	var pyramidtotal 0
	var throwcheck 0
	var compendium_page unknown
	var books1 0
	var books2 0
	var adjust 1
	var forceloud 0
	setvariable talking none
	setvariable halfminutes 0
	var oklist Shofixy|Kalag|Nevinkar
#	var bad_page Gidii|River Caiman
	var bad_page none
	var runverbs (say,|ask,|exclaim,|says|exclaims|whisper|comes out of hiding|asks|bends over.*corpse briefly|leaps from hiding)\b/i
	action var foragemore 1 when You need to have more material in your other hand to continue braiding.
	action put stop climb when ^You should stop practicing your Climbing skill before you do that
	action put study %origami ins when You need to study your instructions before you begin to make something.
	action put climb practice wall when ^You finish practicing your climbing skill and take a well-earned break 
	action math totalranks add 1 when ^You've gained a new rank in
	action math pyramidtotal add 1 when ^You pick up a Wayerd pyramid\.$
	action math pyramidtotal add 1 when ^You tap a Wayerd pyramid inside your canvas sack\.$
	action math pyramidtotal substract 1 when ^You drop a Wayerd pyramid\.$
	action math spears subtract 1 when you throw a lumium light spear
	action math spears add 1 when ^You pick up a lumium light spear
	action math bolas subtract 1 when you throw a .+ bola
	action math bolas add 1 when ^You pick up a .+ bola\.$
	action math axes subtract 1 when you throw a light darkstone throwing axe
	action math axes add 1 when ^You pick up a light darkstone throwing axe|^You pull a light darkstone throwing axe
	action math thrownknife subtract 1 when you throw a .+ steelstar
	action math thrownknife add 1 when ^You pick up a .+ steelstar|^You pull a .+ steelstar
	action setvariable envelope empty when The envelope is empty
	action setvariable talking $0 when (\S+) %runverbs
	action put release when ^But that would give away your hiding place
	action var focus 1 when ^Your link to the .+ is intact
	action var compendium_page $1 when You turn to the section containing (.*) physiology
	action var pullbraid 1 when ^Frustration wells|^You fumble around
	action setvariable disconnected yes when connection lost
	action var humming yes when ^You begin to hum|^You continue.*hum|^You.*as you begin to hum a|You are already performing something/i|^You begin some|^You effortlessly begin|^You begin a|^You fumble slightly|^You struggle
	action var humming no when ^You finish humming|^You stop playing your song.|^In the name of love/i
	action var clutter bad when ^The room is too cluttered to find anything here
	action var fullprep 1 when ^You feel fully prepared to cast your spell.
	action var full.c 1 when is already holding as much power as you could possibly|energy while the rest dissipates harmlessly
	action var combtrain 99;var mblast 0;var combthrow 1;var death 0 when [A|An] .+ decays away\. 
	action var stance DEF when ^Your stance makes it difficult to manipulate
	action goto exitfull when WARNING:  You have a somewhat high number of items on your person|You're carrying far too many items already
	gosub routineGMcheck
	return

move:
	var weaponrange missile
	put #script abort automapper
	if !contains("$roomplayers", "Also here" then gosub throwcheck
	if $standing = 0 then gosub put stand
	put #mapper walk $0
	movewait:
	matchre movereturn @walk done.
	matchre movecounter Obvious
	matchre movecounter closes in behind you
	matchre movecounter you sneak
	matchre movecounter you go
	matchre movewait you edge across the bridge
	matchre movewait Almost to the highest part of the bridge
	matchre movewait As you walk across the last stretch, a sudden gust of wind shakes the bridge
	matchwait 30
	if "%disconnected" = "yes" then goto notconnected
	if $roomid = 0 then
	{
		gosub movedir
		if $roomid != 0 then goto move
	}
	echo LOST...
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
	if "%resonance" = "moving" then var resonance ""
	var talking none
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

checkplayer:
		var playerhere 0
		if contains("$roomplayers", "Also here") then var playerhere 1
		if contains("$roomobjs", " that appears stunned") then var playerhere 1
		if contains("$roomobjs", "appears dead") then var playerhere 1
		if contains("$roomobjs", " bolt,") then var playerhere 1
		if contains("$roomobjs", " arrow,") then var playerhere 1
		if contains("$roomobjs", " bundle,") then var playerhere 1
		if contains("$roomobjs", " Shadow Servant,") then var playerhere 1
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

walk:
	gosub put.1 "$0" "^Obvious"
return

movedone:
	var talking none
return

	roomrecovery:
		gosub throwcheck
		gosub pyramid get
		if "$charactername" = "Rhaec" then 
			{
				gosub flee
			}
		put #script abort automapper
		put #var mapper defense
		if "$charactername" = "Stoh" then gosub rfwalk
		gosub returnhome
		gosub move %saferoom
		
		gosub clear
	if "$charactername" = "Stoh" then goto Stoh
	if "$charactername" = "Rhaec" then goto Rhaec

returnhome:
	gosub flee
	## Comment out your home zone
	gosub emptyhands
	if $zoneid = 11 then
	{
		gosub move 36
		gosub vipertrail exit
	}
	if $zoneid = 10 then gosub move 22
	if $zoneid = 92 then gosub move 92
	if $zoneid = 65 then gosub move 1
	if $zoneid = 10 then gosub move 22
	if $zoneid = 4 then gosub move 14
	if $zoneid = 1 then 
	{
		gosub move 145
		gosub move 171
		gosub walk n
	}
	if $zoneid = 6 then gosub move 114
	#if $zoneid = 7 then gosub move 347
	if $zoneid = 8 then gosub move 53
return

movedir:
		if $up = 1 then
			{
				gosub put up
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $east = 1 then 
			{
				gosub put east
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $north = 1 then
			{
				gosub put north
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $northeast = 1 then
			{
				gosub put ne
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $northwest = 1 then 
			{
				gosub put nw
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $down = 1 then
			{
				gosub put down
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $west = 1 then
			{
				gosub put west
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $south = 1 then
			{
				gosub put south
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $southeast = 1 then
			{
				gosub put se
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $southwest = 1 then
			{
				gosub put sw
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
return

# external script start command		
ss:
	delay 1
	put .$1 $2 $3 $4 $5
	waitfor $1.cmd done.
return 

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
		gosub get my compendium
		}
	if contains("%compendium_page" = "unknown") then gosub put turn my comp
	if matchre("%compendium_page" = "%bad_page") then goto pagedone
	if "%humming" = "no" then if $Vocals.LearningRate < 27 then gosub put hum $vocals_song
	gosub ppcheck
	put study my comp
	matchre pagedone ^You begin|^With a sudden|^You continue to study|^You continue studying|^Why do you|^In a sudden moment|^You attempt
	matchwait 7
	goto onepage
	pagedone:
	math page_count add 1
	gosub put turn my comp
	return

books:
	var scholarexp %globalexp
	if %play.yes = 1 then var scholarexp 33
	if $Scholarship.LearningRate > %scholarexp then return
	action setvar newchapter 1 when ^This chapter does not have that many pages.
	var newchapter 0
	var chapter $2
	var endchapter $3
	var page 1
	gosub get $1
turnchapter:	
	gosub put turn my book to chapter %chapter
turnpage:
	gosub put turn my book to page %page
studybook:
	if %newchapter = 1 then
		{
			var newchapter 0
			var page 1
			evalmath chapter (%chapter + 1)
			if %chapter > %endchapter then return
			goto turnchapter
		}
	if $Scholarship.LearningRate > %scholarexp then return
	gosub ppcheck
	gosub put study my book
	if "$charactername" = "Rhaec" then
	{
		if %play.yes = 1 then
		{
			if %play.song = 1 then
			{
				if $%learn.play > %globalexp then return	
				gosub ppcheck
				gosub put.1 "%play_comm %song" "^You|^You're"
				var play.song 0
				var play.instr 0
			}
		}
	} 
	evalmath page (%page + 1)
	goto turnpage
return

braid:
	var pullbraid 0
	var garbage 0
	var empty 0
	var braid $1
	var bin $3
	var astroswitch $4
	var braidexp %globalexp
	#if "$charactername" = "Rhaec" then var braidexp 33
	if $Time.isDay = 1 then var braidexp 33
	if $2 = "g" then var garbage 1
	if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
	gosub put.2 "rem %gloves" "stow %gloves" "^You put|^Stow what"
	gosub put forage %braid
braidloop:
	var braidexp %globalexp
	#if "$charactername" = "Rhaec" then var braidexp 33
	if $Time.isDay = 1 then var braidexp 33
	gosub ppcheck
	if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
	if $Vocals.LearningRate < 27 then if "%humming" = "no" then gosub put hum $vocals_song
braidcont:
	#if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then gosub put forage %braid
	if %pullbraid = 1 then
	 {
	 		gosub put pull my %braid
	 		var pullbraid 0
	 		var empty 1
	 }
		else
			{
				if "$righthand" != "Empty" then gosub put braid my %braid
				if %foragemore = 1 then
					{
						if "%astroswitch" = "astro" then
						 {
						 	evalmath astrotime ($gametime - $last.peer)
							echo %astrotime
							if %astrotime > 180 then
		 				 		{
		 				 			gosub emptyhands
		 				 			var astroreturn 1
		 				 			goto astrotrain
		 				 			var astroreturn 0
		 				 			if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
		 				 		}
						 }
						 if "$righthand" = "Empty" then gosub put.1 "get %braid" ".+"
						 gosub put forage %braid
						 var foragemore 0
						 pause
						 if "$righthand" = "Empty" then goto mechend
					}
			}
	if %empty = 1 then 
		{
			if %garbage = 1 then gosub put put my rope in %bin
				else 
				{
					if "$charactername" = "Rhaec" then gosub put.1 "s" "^Obvious"
						else gosub put.1 "e" "^Obvious"
						if contains("$roomplayers", "Also here") then
						{
							return
						}
				gosub put drop my rope
				gosub emptyhands
				if "$charactername" = "Rhaec" then gosub put.1 "n" "^Obvious"
					else gosub put.1 "w" "^Obvious"
				}
			var empty 0
			gosub put forage %braid
		}
	goto braidloop
mechend:
	var astroreturn 0
	gosub emptyhands
	gosub put.2 "get my %gloves" "wear my %gloves" "^You slip|^Wear what"
	return

pyramid:
	if ((%pyramidtotal = 3) && ("$1" = "get")) then return
	if ((%pyramidtotal = 0) && ("$1" = "drop")) then return
	gosub emptyhands
	if "$1" = "drop" then
		{	
			if $Time.isDay = 1 then
			{
				gosub put.2 "Get pyra from first sack" "get pyra from second sack" "^You get|^What"
				gosub put.2 "empty right" "Empty left" "^You drop|^What"
				gosub put.2 "get pyra from third sack" "empty right" "^You drop|^What"
			}
		}
	if "$1" = "get" then
		{
			if contains("$roomobjs", "pyramid") then
			{
				gosub put.2 "get pyra" "get pyra" "^You pick"
				gosub put.2 "put pyra in sack" "put pyr in second sack" "^You put"
				gosub put.2 "get pyra" "put pyra in third sack" "^You put"
			}
			else 
			{
				if contains("$roomobjs", "other stuff") then
				{
					gosub put.2 "get pyra" "get pyra" "^You pick"
					gosub put.2 "put pyra in sack" "put pyr in second sack" "^You put"
					gosub put.2 "get pyra" "put pyra in third sack" "^You put"
				}
			}
		}
	gosub emptyhands
return

toaesryclimb:
	evalmath climbtemp ($gametime - $last.climb)
	#if %climbtemp < 600 then return
	put #var last.climb $gametime
	gosub rfwalk
	gosub move 390
	gosub startskill Climbing
	gosub move 25
	gosub endskill Climbing
return

fromaesryclimb:
	gosub rfwalk
	gosub startskill Climbing
	gosub move 86
	gosub endskill Climbing
return

vipertrail:
	var resonance moving
	var tracksfound 0
	var lost.track 0
	action var tracksfound 1 when ^You find some animal tracks\.|^You find some faint animal tracks|some faint animal tracks\.$
	action var lost.track 1 when ^You lose track of where

	if "$1" = "enter" then gosub viperenter
	if "$1" = "exit" then gosub viperexit
	var resonance
return
viperenter:	
	if contains("$roomobjs", "animal trail") then gosub put.1 "go trail" "^Obvious"
		else
		{
			gosub put.1 "search" "^Roundtime"
			goto viperenter
		}
	if %lost.track = 1 then 
	{
		var lost.track 0
		goto viperenter
	}
2trailenter:	
	if contains("$roomobjs", "animal trail") then gosub put.1 "go trail" "^Obvious"
		else
		{
			gosub put.1 "search" "^Roundtime"
			goto 2trailenter
		}
3trailenter:	
	if contains("$roomobjs", "animal trail") then gosub put.1 "go trail" "^Obvious"
		else
		{
			gosub put.1 "search" "^Roundtime"
			goto 3trailenter
		}	
4trailenter:
	if %tracksfound = 1 then gosub put.1 "go track" "^Obvious"
		else
		{
			gosub put.1 "search" "^Roundtime"
			goto 4trailenter
		}
return
	
viperexit:
	if %tracksfound = 1 then gosub put.1 "go track" "^Obvious"
		else
		{
			gosub put.1 "search" "^Roundtime"
			goto viperexit
		}		
	gosub put.1 "go trail" "^Obvious"
	gosub put.1 "n" "^Obvious"
	gosub put.1 "n" "^Obvious"
	delay 5
trailexit:	
	if contains("$roomobjs", "faint path") then gosub put.1 "go path" "^Obvious"
		else
		{
			gosub put.1 "search" "^Roundtime"
			goto trailexit
		}
	if %lost.track = 1 then 
	{
		var lost.track 0
		goto trailexit
	}
return

# Climb practice - $1 right hand item, $2 left hand item, 0 for none, $3 for room exception
climb:
	var climblist trunk|tree
	var climbtotal 1
	var xc 0
	var get1 $1
	var get2 $2
	var except1 $3
get.climb:
	if %get1 != 0 then
		{
			if $righthand = "Empty" then
				{
					gosub get my %get1
					gosub get my %get2 	
				}
		}

climb.do:
	math keywords subtract 1
	if ((%climblist(%xc) = %except1) && ($righthand != "Empty")) then
		{
			gosub put stow right
			gosub put stow left
		}
	if %xc > %climbtotal then return
	if $standing != 1 then put dance silly
	if (($righthand = "Empty") && (%climblist(%xc) != %except1)) then goto get.climb
	matchre next.climb ^Obvious
	matchre repeat.climb ^Roundtime
	matchre delay.climb ^All this climbing back and forth is getting a bit tiresome.  
	put climb %climblist(%xc)
	matchwait 5
	# Error.  What happened to climb?
	return 
repeat.climb:
	pause .1
	pause .1
	gosub roundtimedone
	goto climb.do
next.climb:
	math xc add 1
	gosub roundtimedone
	goto climb.do
delay.climb:
	gosub pause 15
	gosub roundtimedone
	goto repeat.climb

origami:
	var origami.end 0
	action var origami.end 1 when You must be either wearing or holding 
	if $Mechanical_Lore.LearningRate > %globalexp then goto origami.end
onepaper:
	gosub emptyhands
	gosub get my primer
getpaper:
	if $Mechanical_Lore.LearningRate > %globalexp then goto origami.end
	if "%humming" = "no" then if $Vocals.LearningRate < 33 then gosub put hum $vocals_song
	gosub put pull my env
	if %origami.end = 1 then goto origami.end
	##keywoards ^You get a sheet|^You must be either wearing|^I'm afraid
	pause
	if "%envelope" = "empty" then gosub newenvelope
	gosub put study my %origami ins
fold:
	gosub put fold my paper
	if $Vocals.LearningRate < 27 then if "%humming" = "no" then gosub put hum $vocals_song
	if contains("$lefthand", "origami %origami") then goto origamifinish
	if $Mechanical_Lore.LearningRate > %globalexp then goto origami.end
	goto fold
	origamifinish:
	pause 0.1
	pause 0.1
	pause 0.1
	math origami_count add 1
	gosub put exh my %origami
	goto getpaper
origami.end:
	gosub put stow my primer
	gosub put poke my paper
	if %origami.end = 1 then gosub m.inputraid grass dgd bin
	return

newenvelope:
	var envelope full
	gosub emptyhands
	gosub put rem my env
	# ^You remove
	gosub put poke my envelope
	# ^You tear|^You remove
	gosub emptyhands
	gosub get my env
	gosub put wear my env
	return

put:
	var do $0
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
do:
roundtime:
	if $dead = 1 then goto exitfull
	matchre put.pause %rtwait
	matchre humstop %humstopmsg
	matchre roundtimedone %total.msg
	put %do
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
roundtimedone:
	if %checktime = 1 then gosub checktime
	if "%pouchfull" = "yes" then gosub stowpouch
	if "%talking" != "none" then gosub antipersonnel
	var talking none
	put #statusbar Grandt = %grandcounter    StealT = %stealtimer    Caught = %wanted    Boxes in hand = %boxes    Opened Boxes = %openedboxes    Timer = %t    Keywords = %keywords    Ranks = %totalranks    Resonance = %resonance
	if $webbed = 1 then gosub rtwebbed
	if %exitnow = 0 then
	{
		if $dead = 1 then goto exitfull
		if $health < 50 then goto exitquick
		if $stunned = 1 then goto exitquick
	}
	if $standing = 0 then gosub put stand
	if %keywords < 0 then var keywords 0
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	#if $roomid = %loreroom then if $monstercount > 0 then goto exitquick
	if "%disconnected" = "yes" then gosub notconnected
	if $connected = 0 then goto notconnected
	if %t < 1 then timer clear
	if %t < 1 then timer start
	if %t > 15 then gosub grandcounter
	if %combtrain = 1 then gosub checkroom
	if (("$guild" = "bard") && (%bardrecast = 0)) then
	{
		if $stamina > 75 then
		{
			if %adjust = 1 then
			{
				if (($mana > 90) && ($Arcana.LearningRate = 0) && ("$righthand" = "NULLEMPTY") && ("$lefthand" = "Empty") && (%death = 0) && (%throwcheck = 0)) then gosub quickarcana
				if (($mana > 90) && (%manasong = 1)) then gosub manasongadjust up
				if (($mana < 70) && (%manasong = 10)) then gosub manasongadjust down
			}
		}
		if (($stamina > 40) && ($stamina < 75) && ("%Lilt" = "off")) then gosub m.inputardcast Lilt
		if (($mana = 100) && ($stamina > 90) && (%bardsong = 0) && ($concentration > 90)) then gosub m.inputardsong
	}
	return

put.1:
	var firstcommand $1
	var waitstring $2
	match clear
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
putting.1:
	matchre pause.putting.1 %rtwait
	matchre roundtimedone %waitstring
	put %firstcommand
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
	goto roundtimedone
pause.putting.1:
	pause .1
	goto putting.1

put.2:
	var firstcommand $1
	var secondcommand $2
	var waitstring $3
	match clear
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
putting.2:	
	matchre pause.putting.2 %rtwait
	matchre roundtimedone %waitstring
	put %firstcommand
	put %secondcommand
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
	goto roundtimedone
pause.putting.2:
	pause .1
	goto putting.2

## *******  PUT.1 skill functions.

prep:
	var do1 $1
	var do2 $2
	if "%humming" = "yes" then gosub put.2 "stop play" "prep %do1 %do2" "%prep.msg"
	else gosub put.1 "prep %do1 %do2" "%prep.msg"
return

cast:
	var do1 $1
	gosub stamcheck
	gosub put.1 "cast %do1" "%cast.msg"
return

rel:
	gosub put.1 "release" "Type RELEASE"
return

throw:
	var do1 $1
	var do2 $2
	gosub stamcheck
	gosub put.1 "throw %do1" "%cman.msg"
return

stamcheck:
	if $stamina < 90 then 
	{
		delay 1
		gosub roundtimedone
		goto stamcheck
	}
return

perc:
	gosub put.1 "perc $1" "^Roundtime"
return

get:
	var do1 $0
	gosub put.1 "get %do1" "%get.msg"
return

stow:
	var do1 $1
	var do2 $2
	if !matchre("$0", " ") then gosub put.1 "stow $0" "%stow.msg"
		else gosub put.1 "put %do1 in %do2" "%stow.msg"
return	

focus:
if "$1" != "" then var do1 $1
if "$2" != "" then var do2 $2
	matchre f.p link, but fail\.
	matchre roundtimedone ^Roundtime:|^You focus your magical senses|^Your link to the
	matchre f.p %rtwait
	put focus my %do1
	matchwait
f.p:
	pause .1
	goto focus

humstop:
	put stop hum
put.pause:
	pause .1
	goto do

splay:
	gosub put.1 "stop play" "^But you're|^You stop|^In the name of"
return

ppcheck:
	if %play.instr = 0 then return
	evalmath perctemp ($gametime - $last.perc)
	if "$guild" = "bard" then 
		{
			if %perctemp > 60 then goto bardcheck
				else return
		}
	else if %perctemp < 300 then return
bardcheck:
	##  Can use a PP trigger or set last.pp here.
	put #var last.perc $gametime
	if $Power_Perceive.LearningRate < 29 then gosub powerp stop
return

powerp:
	if "$guild" = "bard" then
		{
			gosub put.1 "power" "^Roundtime"
			return
		}
	if "$guild" = "warrior mage" then
		{
			gosub put.1 "power" "^Roundtime"
			return
		}
	var perp1 $1
	var combtrain 0
	
	if "%Aus" = "off" then 
		{
			gosub prep aus
			gosub pause 1
			gosub cast
		}
	var combtrain 1
	gosub perc xibar
	gosub perc yavash
	gosub perc katamba
	gosub perc moonlight
	gosub perc transduction
	gosub perc psychic
	gosub perc perception
	gosub perc stellar
	gosub perc planets
	
	if %perp1 = "stop" then return
	if $Power_Perceive.LearningRate < 34 then goto powerp
return

### USAGE:
### var skills Medium_Edged|Heavy_Edged|Long_Bow
### var count 3
### gosub sort %skills %count
### echo %sort

sortskill:
	var items $1
	var countskills $2
	math countskills subtract 1
	var i 0

SORT.I:
	var j %i
	math j add 1
SORT.J:
	if $%items(%j).Ranks < $%items(%i).Ranks or ($%items(%j).Ranks = $%items(%i).Ranks and $%items(%j).LearningRate < $%items(%i).LearningRate) then
	{
		var itemi %items(%i)
		var itemj %items(%j)
		eval items replace("%items", "%items(%i)", "temp2")
		eval items replace("%items", "%items(%j)", "temp1")
		eval items replace("%items", "temp1", "%itemi")
		eval items replace("%items", "temp2", "%itemj")
	}
	math j add 1
	if %j <= %countskills then goto SORT.J
	math i add 1
	if %i < %countskills then goto SORT.I
	var sort %items
return
	

startskill:
	var starttime $gametime
	var rankstart $$0.LearningRate
	put #log >ExpLog $time
	put #log >ExpLog $1 starting mindstate: $$0.LearningRate
return

endskill:
	var endtime $gametime
	var rankend $$0.LearningRate
	var timediff 0
	var mindstatetime 0
	var rankdiff 0
	evalmath rankdiff (%rankend - %rankstart)
	evalmath timediff (%endtime - %starttime)
	put #log >ExpLog $1 ending mindstate: $$0.LearningRate
	evalmath timediff (%timediff / 60)
	put #log >ExpLog %timediff minutes training skill.
	evalmath mindstatetime (%timediff / %rankdiff)
	put #log >ExpLog %mindstatetime minutes per mindstate.
return

notconnected:
	var disconnected no
	pause 20
	put #connect
	pause 5
return


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
	math quartcounter add 1
	math astrocounter add 1
	if %halfcounter > 3 then math grandcounter add 1
	if %halfcounter > 3 then setvariable halfcounter 0
	timer clear
	timer start
	return

antipersonnel:
	if "%resonance" = "runhide" then return
	if "%resonance" = "climbing" then return
	if "%resonance" = "stealing" then return
	if "%resonance" = "moving" then return
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
	if contains("%talking", "Horse Whisperer") then return
	if contains("%talking", "pruned whisper bush") then return
	if contains("%talking", "grass rustle and whisper") then return
	if contains("%talking", "shadowling") then return
	if contains("%talking", "like the muffled sound of running") then return
	if "%talking" != "none" then echo %talking
	setvariable talking none
	gosub clear
	goto runhide

runhide:
	if $monstercount > 0 then if %spears < 3 then gosub killthrown
	if $monstercount > 0 then if %axes < %maxaxe then gosub killthrown
	if $monstercount > 0 then if %thrownknife < %maxthrown then gosub killthrown
	gosub throwcheck
	gosub pyramid get
	gosub put ponder
	if "$charactername" = "Rhaec" then gosub flee
	if "$charactername" = "Stoh" then gosub rfwalk
	gosub returnhome
	gosub move %saferoom
	gosub put hide
	gosub pause 120
	gosub emptyhands
	gosub clear
	goto $charactername

pause:
	var time $0
	pauseloop:
	pause 4.5
	gosub roundtimedone
	math time subtract 5
	if $invisible = 0 then if $monstercount > 0 then return
	if %time > 0 then goto pauseloop
	return

checkroom:
	var combtrain 0
killstart:
	if contains("$monsterlist", "%killmob") then
			{
				var killnow %killmob
				goto killnow
			}
	if contains("$monsterlist", "%killmob1") then
			{
				var killnow %killmob1
				goto killnow
			}
			var combtrain 1
			return
killnow:		
		if "$preparedspell" = "None" then gosub prep pd
			else if "$preparedspell" != "Partial Displacement" then 
				{
					put release
					gosub prep pd
				}
		pause 2
		gosub ATK
		gosub cast %killnow
		pause 1
		if contains("$roomobjs", "appears dead") then gosub put loot equipment
			else goto killstart
		gosub DEF
		return

collect:
	var percepexp %globalexp
	#var percepexp 33
	#math percepexp  10
	gosub ppcheck
	if %collect_count = 0 then var collect_max $1
	if %collect_count < %collect_max then
		{
			#if $monstercount > 0 then return
			math collect_count add 1
			if "%humming" = "no" then if $Vocals.LearningRate < 33 then gosub put hum $vocals_song
			if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
			gosub put.1 "collect %collect" "^Roundtime:"
			if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
			if $Perception.LearningRate > %percepexp then goto collect.end
		}
	else goto collect.end
	goto collect
collect.end:
	if contains("$roomobjs", "pile of") then gosub put kick pile
	var collect_count 0
return

crossclimb:
	
goto SubSkip
#---------------------------------------
# Local Subroutines
#---------------------------------------
        Climb.Sub:
                var Climbable $0
                goto Climb1
        ClimbP:
                pause .5
        Climb1:
                match ClimbP ...wait
                match Climb.Fail Roundtime
                matchre Climb.Succeed Obvious (paths|exits):
                put climb %Climbable
                matchwait
        Climb.Fail:
                if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
				gosub roundtimedone
                var ClimbReturn -1
                return
        Climb.Succeed:
                if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
				gosub roundtimedone
                var ClimbReturn 0
                return

SubSkip:

#---------------------------------------
# CONSTANT VARIABLES
#---------------------------------------

#---------------------------------------
# VARIABLES
#---------------------------------------
        var ClimbReturn 0
        var Climbable
		var resonance climbing
		var adjust 0
		var bardrecast 1
#---------------------------------------
# ACTIONS
#---------------------------------------
                action instant goto Script.End when eval $Climbing.LearningRate=34
        
#---------------------------------------
# SCRIPT START
#---------------------------------------
                ## hum start
				gosub splay
				gosub splay
				#gosub put.1 "mana song 10" "^Your enchante"
				#gosub m.inputardcast Lilt
        Start:
				#gosub m.inputardcast Lilt
                gosub move 411
        Climb-000:
                gosub Climb.Sub embrasure
                if (%ClimbReturn == 0) then 
                {
                        gosub walk go gate
                        gosub walk west
                        gosub walk go stone stair
                }
                gosub walk south
        Climb-001:
                gosub Climb.Sub break
                if (%ClimbReturn == 0) then 
                {
                        gosub walk north
                        gosub walk go gate
                        gosub walk west
                        gosub walk go stone stair
                        gosub walk south
                }
        Climb-002:
                gosub Climb.Sub embrasure
                if (%ClimbReturn != 0) then
                {
                        gosub walk north
                        gosub walk go stair
                        gosub walk east
                        gosub walk go gate
                }
        Climb-003:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then
                {
                        gosub walk go stair
                        gosub walk east
                        gosub walk go gate
                }
                gosub walk go footpath
        Climb-004:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then 
                {
                        gosub walk north
                        gosub walk go stair
                        gosub walk east
                        gosub walk go gate
                        gosub walk go footpath
                }
                gosub walk south
                gosub walk down
                gosub walk south
                gosub walk south
                gosub walk southwest
        Climb-005:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then 
                {
                        gosub walk south
                        gosub walk go stair
                        gosub walk go gate
                        gosub walk go bush
                }
                else
                {
                        gosub walk south
                }
        Climb-006:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then 
                {
                        gosub walk south
                        gosub walk go stair
                        gosub walk go gate
                }
                else
                {
                        gosub walk south
                }
        Climb-007:
                gosub Climb.Sub wall
                if (%ClimbReturn != 0) then 
                {
                        gosub walk go gate
                        gosub walk go stair
                }
        Climb-008:
                gosub Climb.Sub embrasure
                if (%ClimbReturn == 0) then 
                {
                        gosub walk go gate
                        gosub walk go stair
                }
                        gosub walk north
        Climb-009:
                gosub Climb.Sub break
                if (%ClimbReturn == 0) then 
                {
                        gosub walk south
                        gosub walk go gate
                        gosub walk go stair
                        gosub walk north
                }
        Climb-010:
                gosub Climb.Sub embrasure
                if (%ClimbReturn == 0) then 
                {
                        gosub walk south
                        gosub walk south
                        gosub walk go gate
                }
                else
                {
                        gosub walk south
                        gosub walk go stair
                }
        

                gosub move 425
                        
        Climb-011:
                gosub Climb.Sub break
                if (%ClimbReturn == 0) then 
                {
                        gosub walk south
                        gosub walk go gate
                        gosub walk go stairs
                        gosub walk east
                }
        Climb-012:
                gosub Climb.Sub embrasure
                if (%ClimbReturn == 0) then 
                {
                        gosub walk southwest
                        gosub walk south
                        gosub walk go gate
                        gosub walk go stairs
                }
                else
                {
                        gosub walk west
                }
        Climb-013:
                gosub Climb.Sub embrasure
                if (%ClimbReturn == 0) then 
                {
                        gosub walk go gate
                        gosub walk go stairs
                }
                gosub walk south
        Climb-014:
                gosub Climb.Sub embrasure
                if (%ClimbReturn != 0) then 
                {
                        gosub walk north
                        gosub walk go stairs
                        gosub walk go gate
                        gosub walk northwest
                }
        Climb-015:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then 
                {
                        gosub walk north
                        gosub walk go stairs
                        gosub walk go gate
                }
                else
                {
                        gosub walk southeast
                }       
        Climb-016:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then 
                {
                        gosub walk go stairs
                        gosub walk go gate
                }
                gosub walk go narrow trail
        Climb-017:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then 
                {
                        gosub walk west
                        gosub walk go stairs
                        gosub walk go gate
                        gosub walk go narrow trail

                }
                gosub walk northeast
        Climb-018:
                gosub Climb.Sub wall
                if (%ClimbReturn == 0) then
                {
                        gosub walk west
                        gosub walk go stairs
                }
                else
                {
                        gosub walk southwest
                        gosub walk south
                        gosub walk go gate
                }
                goto start

        Script.End:
				gosub clear
				action var DUMMMY when eval $Climbing.LearningRate=34
				var resonance
				var adjust 1
				var bardrecast 1
        		goto climbend

pmtrain:
	var tempspell $1
	var tempprep $2
	if "%Aus" = "off" then gosub aus
	if "%Seer" = "off" then gosub seer
	if "$preparedspell" = "Mental Blast" then gosub put.1 "release" ".+"
	gosub prep $1 $2
	if %combthrow = 0 then gosub throwcheck
	#pause $3
	gosub throwtrain
	gosub manacheck
spelltimecheck:
	if $spelltime > $3 then gosub cast
		else 
			{
				if $spelltime < $3 then
					{
						delay 1
						if $spelltime = 0 then gosub prep $1 $2
						goto spelltimecheck
					}
				gosub cast
			}
	if $Primary_Magic.LearningRate > %globalexp then
		{
			gosub throwcheck
			if %spears = 3 then gosub emptyhands
				else gosub killthrown
			return
		}
	 else goto pmtrain

killthrown:
	gosub emptyhands
	if "$charactername" = "Stoh" then gosub ATK
		else gosub dodge attack
	if "$charactername" = "Stoh" then
	{
	if %mblast = 0 then 
		{
			if "$preparedspell" = "None" then gosub prep mb
				else if "$preparedspell" != "Mental Blast" then gosub put release
		}
		else
			{
				if "$preparedspell" = "None" then 
					{
						gosub prep pd
						gosub put.1 "target" ".+"
					}
				else if "$preparedspell" != "Mental Blast" then gosub put release
			}
	#if "$righthand" = "Empty" then 
	#	{
	#		gosub get ham
	#		if "$lefthandnoun" = "hammer" then gosub put.1 "swap" "^You move|^You have"
	#	}
	
	if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	}
	if "$charactername" = "Rhaec" then 
		{
			gosub get bola
			if "$lefthandnoun" = "bola" then gosub put.1 "swap" "^You move|^You have"
		}
	gosub throw
	if $spelltime > 2 then gosub cast
	if contains("$roomobjs", "appears dead") then 
			{
				gosub put loot equipment
				var combthrow 0
				gosub throwcheck
			}
	if ((%spears = 3) && (%axes = %maxaxe) && (%thrownknife = %maxthrown)) then return
		else 
			{
				delay 1
				if $monstercount > 0 then goto killthrown
					else return
			}
			

throwtrain:
	if (($Heavy_Thrown.LearningRate > 35) && (%spears = 3)) then return
	if (($monstercount > 0) && (%combthrow = 1)) then 
		{
			if %mblast = 500 then
				{
					gosub ATK
					gosub put release
					var mblast 0
					gosub prep mb
					pause 1
					gosub cast
					gosub prep %tempspell %tempprep
				}
			if %spears > 0 then
				{
					put #echo %spears spears.
					if contains("$roomobjs", "lumium light spear") then gosub get spear
						else gosub get my spear
				}
				else gosub get ham
			if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
			gosub ATK
			gosub throw
			if !contains("$roomobjs", "appears dead") then
				{
					if contains("$roomobjs", "lumium light spear") then gosub put.2 "get spear" "throw" "%cman.msg"
						else if %spears > 0 then gosub put.2 "get my spear" "throw" "%cman.msg|^What"
				}
			if !contains("$roomobjs", "appears dead") then
				{
					if contains("$roomobjs", "lumium light spear") then gosub put.2 "get spear" "throw" "%cman.msg"
						else if %spears > 0 then gosub put.2 "get my spear" "throw" "%cman.msg|^What"
				}
			delay .5
			if contains("$roomobjs", "appears dead") then 
				{
					gosub put.1 "loot equipment" "^You search|^I could not find"
					var combthrow 0
				}
		}
	if $monstercount < 1 then gosub throwcheck
	return

ATK:
	if "%stance" = "DEF" then
		{
			if "$charactername" = "Stoh" then gosub put stance set 100 0 84 100
			if "$charactername" = "Rhaec" then gosub put stance set 84 0 100 100
			var stance ATK
		}
return

DEF:
	if "%stance" = "ATK" then
		{
			if "$charactername" = "Rhaec" then gosub put stance set 100 0 100 0
			if "$charactername" = "Stoh" then gosub put stance set 100 0 100 0
			var stance DEF
		}
return
		
throwcheck:
	var throwcheck 1
	if contains("$roomobjs", "throwing hammer") then 
		{
			gosub put.1 "stow ham" "^You put|^Stow"
			goto throwcheck
		}
	if contains("$roomobjs", "lumium light spear") then 
		{
			gosub put.1 "stow spear" "^You put|^Stow"
			goto throwcheck
		}
	if contains("$roomobjs", "javelin") then 
		{
			gosub put.1 "stow jave" "^You put|^Stow"
			goto throwcheck
		}
	if matchre("$roomobjs", "bola\b") then 
		{
			gosub put.1 "stow bola" "^You put|^Stow"
			goto throwcheck
		}
	if matchre("$roomobjs", "throwing axe\b") then 
		{
			gosub put.1 "stow axe" "^You put|^Stow"
			goto throwcheck
		}
	if matchre("$roomobjs", "steelstar\b") then 
		{
		action math tempthrown add 1 when ^You put your steelstar in
		action put #parse @stowdone;var tempthrown 0 when eval %tempthrown = 2
			eval thrownweap.count count("$roomobjs", "%thrownweap")
			if %thrownweap.count > 1 then
			{
				put stow steel
				gosub put.1 "stow steel" "@stowdone|^Stow"
			}
				else gosub put.1 "stow steel" "^You put|^Stow"
			goto throwcheck
		}
#	if %exitnow = 1 then return
	gosub roundtimedone
	var throwcheck 0
	var tempthrown 0
	action var tempthrown EMPTY when eval %tempthrown = 2
	action var tempthrown EMPTY when ^You put your steelstar in
return
		
		
	
manacheck:
	put #var last.manacheck $gametime
manaloop:
	if (($monstercount > %maxcreature) && ("$charactername" = "Stoh")) then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
	gosub roundtimedone
	if $mana = 100 then return
		else 
		{
			if $mana < 100 then
			{
				if %manahide = 1 then
				{
					if $Hiding.LearningRate < 34 then
					{
					 	gosub put.2 "hide" "shiver" "^A shiver"
					}
				}
				if %manahunt = 1 then
				{
					evalmath hunttemp ($gametime - $last.hunt)
					if %hunttemp > 80 then
					{
						put #var last.hunt $gametime
						if $monstercount = 0 then gosub put.1 "hunt" "^Roundtime"
					}
				}
			}
		delay 1
		gosub roundtimedone
		goto manaloop
		}
return

checkharness:
	if %checkharness = 1 then
		{
			gosub put.1 "harness %tempmana" "^Roundtime:"
			gosub manacheck
			evalmath mana.check ($gametime - $last.manacheck)
			put #echo %mana.check seconds.
			if %mana.check > 4 then evalmath tempmana (%tempmana - 1)
				else 
					{
						var checkharness 0
					}
			gosub put.1 "release" "^Type RELEASE"
			goto checkharness
		}
return

quickarcana:
	var bardrecast 1
	if %full.c = 1 then goto quickfocus
	if "$righthandnoun" != "medallion" then gosub put.1 "rem wren medal" "^You remove|^You detach"
	if "$righthandnoun" != "medallion" then gosub get my medal
	gosub put.1 "charge my wren medal 7" "^Roundtime"
	if $mana < 10 then var full.c 1
	#gosub manacheck
	gosub roundtimedone
	goto quickarcana
return

quickfocus:
	var focus 0
	gosub put.1 "focus my medal 2" "^Roundtime|^Your link"
	if %focus = 1 then 
		{
			var focus 0
			var full.c 0
			gosub put.1 "wear medal" "^You attach|^You wear|^You hang"
			var bardrecast 0
			return
		}
	gosub roundtimedone
	goto quickfocus
return	

bardarcana:
	action var chargeagain 1 when Try though you may, you find yourself unable to charge
	if (("$righthandnoun" != "jug") && ("$lefthandnoun" != "jug")) then gosub get jug
	if "%Naga" = "off" then 
		{
			gosub m.inputardcast Naga play
			gosub manacheck
		}
	if $Arcana.LearningRate > %globalexp then goto return
	if $preparedspell = "None" then 
		{
			if $Arcana.LearningRate > %globalexp then return
			if $Primary_Magic.LearningRate < 25 then gosub prep ease
				else gosub prep ease
		}
	if %full.c = 1 then goto bardfocus
	if %cambcycle = 6 then goto bardfocus
	#if $Primary_Magic.LearningRate < 25 then if $spelltime > 25 then goto bardfocus
	#	else if $spelltime > 25 then goto bardfocus
	#gosub manacheck
chargeagain:
	var chargeagain 0
	gosub put.1 "charge my wren medal 7" "^Roundtime|^Try though"
	if %chargeagain = 1 then goto chargeagain
	math cambcycle add 1
#	if $mana < 90 then var full.c 1
	gosub roundtimedone
	goto bardarcana
return

bardfocus:
	action var focusagain 1 when Try though you may, you find yourself unable to focus
	var focus 0
	var full.c 0
	var cambcycle 0
focusagain:
	var focusagain 0
	gosub put.1 "focus my medal" "^Roundtime|^Your link|^Try though"
	if %focusagain = 1 then goto focusagain
	if %focus = 1 then 
		{
			var focus 0
			var full.c 0
		#	gosub put.1 "wear medal" "^You attach|^You wear|^You hang"
		#	var bardrecast 0
		}
	gosub cast
	gosub manacheck
	goto bardarcana
return	

arcana:
	gosub get %camb
arcanastart:
	if "%Aus" = "off" then gosub aus
	if "%Seer" = "off" then gosub seer
	gosub ppcheck
	counter set 5
arcanaloop:
	if $Arcana.LearningRate > %globalexp then
		{
			gosub rel
	 		gosub put stow %camb
	 		return
	 	}
	if $monstercount > %maxcreature then 
		{
			gosub emptyhands
			gosub killthrown
			gosub throwcheck
			gosub rel
			gosub get %camb
		}
	if %c > 7 then
		{
			counter set 0
			var combtrain 0
			gosub prep %train.spell
		}	
	gosub manacheck
	gosub put.1 "charge my %camb %charge_mana" "^Roundtime:"
	waitforre .+
	counter add 1
	if %full.c != 1 then goto arcanaloop
	var full.c 0
	gosub focus %camb
	if $preparedspell = "None" then 
		{
			gosub prep %train.spell
		}
fullprepcheck:
	if %fullprep = 0 then
		{
			delay 1
			goto fullprepcheck
		}
 	gosub cast
	var fullprep 0
	var combtrain 1
	gosub manacheck
	goto arcanastart

appcombat:
	var appexp %globalexp
	math appexp add 5
	var monster $1
	var apptemp $monstercount
	gosub put.2 "hide" "shiver" "^A shiver"
appcombatloop:
	if %apptemp = 4 then %apptemp1 = fourth
		if %apptemp = 3 then %apptemp1 = third
			if %apptemp = 2 then %apptemp1 = second
				if %apptemp = 1 then %apptemp1 = first
	gosub put.1 "app %apptemp1 %monster quick" "^\[Roundtime:|^You cannot"
	math apptemp subtract 1
	if %apptemp < 0 then var apptemp 0
	if %apptemp = 0 then goto appexp
		else goto appcombatloop
appexp:
	if $Appraisal.LearningRate < %appexp then goto appcombat
return

appcritter:
	if "$charactername" = "Rhaec" then gosub spawncheck
	if "$charactername" = "Stoh" then
		{
			if $monstercount > %maxcreature then gosub put.2 "retreat" "retreat" "^You retreat from|^You are already"
		}
	if $Appraisal.LearningRate > %globalexp then return

	eval crittercount count("$monsterlist", "%monster1")
	if %crittercount > 0 then gosub apprun %monster1
	eval crittercount count("$monsterlist", "%monster2")
	if %crittercount > 0 then gosub apprun %monster2
	eval crittercount count("$monsterlist", "%monster3")
	if %crittercount > 0 then gosub apprun %monster3
	eval crittercount count("$monsterlist", "%monster4")
	if %crittercount > 0 then gosub apprun %monster4

	if $monstercount < 1 then gosub pause 15
	if "$charactername" = "Stoh" then gosub put.2 "hide" "shiver" "^A shiver"
	else gosub pause 5
	if $Appraisal.LearningRate > %globalexp then return
	goto appcritter
		
return

apprun:
	gosub put.1 "app $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put.1 "app second $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put.1 "app third $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return

	gosub put.1 "app fourth $0 quick" "^\[Roundtime|^You cannot"
	math crittercount subtract 1
	if %crittercount < 1 then return
return

##############
## BARD STUFF
##############
instrumentall:
	action var do.tune flat when sharp\.$
	action var do.tune sharp when flat\.$
	action var tune 1 when you realize that it is in tune\.$|perfect tune\.$

	var str lyre
	var per zills
	var win jug
	
	var do.tune
	var tune 0
	var play.yes 1

	gosub put.2 "rem %helm" "stow %helm" %stow.msg
	gosub put.2 "rem %glove" "stow %glove" %stow.msg
	gosub emptyhands

	gosub splay
	
	#gosub get my %str
#	gosub put.1 "get my kit" "^You get"
#	gosub put.1 "repair my harp" "^Your|Roundtime"
#	gosub put.1 "stow kit" "^You put"
#	gosub tune

#	gosub playtrain strings
#	gosub emptyhands

	gosub startskill Winds
	gosub get my %win
	gosub playtrain winds
	gosub emptyhands
	gosub endskill Winds

	gosub startskill Percussions
	gosub get my %per
	gosub playtrain percussions
	gosub emptyhands
	gosub endskill Percussions

	gosub splay
#put sing mere

	gosub put.2 "get %helm" "wear %helm" "^You put"
	gosub put.2 "get %glove" "wear %glove" "^You slip"

	gosub put.1  "mana song 1" "^All"
	var play.yes 0
	
return

tune:
	gosub put.1 "tune %str %do.tune" "you realize that it is in tune\.$|perfect tune\.$|sharp\.$|flat\.$
	if %tune = 0 then goto tune
	var tune 0
return

playtrain:
## Self adjusting instrument/hum script
## by Haldrik 11/19/2009
## Modified from Mystarria's hum script

	gosub splay
	gosub m.inputardcast Care chant
	gosub ppcheck
	
	put #var instr_type $1

	gosub instrument.setup

	var adjust_up ^You begin to hum|^You begin some|^You effortlessly begin|^You begin a
	var adjust_down ^You fumble slightly|^You struggle

	var temp1 %$instr_type
	var temp2 %temp1(0)
	var temp3 %temp1(3)
	var temp4 %temp1(2)
	evalmath play ($%temp2 \ %temp3)
	var learn.play %temp1(1)
	var play_comm hum
	var play.song 0
	var play.instr 0
	var pause.song 0

	action var play.song 1 when ^You finish playing|^You finish humming
	action var play.instr 1 when ^You finish playing|^You stop
	action var pause.song 1 when ^You finish playing|^You finish humming|^You begin|^You continue|^You concentrate|^You maneuver|^You find yourself|^You concentrate|^Your voice

	gosub ppcheck
	if "$1" != "vocals" then
	{
		var play_comm play
		#gosub put.1 "chant care" "^With a sharp cut|^You're|^As you begin|^You are unable|^With a quick"
		gosub m.inputardsong
		gosub put.2 "get my cloth" "clean my %temp4 with my cloth" "dry it off|^\[Roundtime:|not in need of cleaning\."
		gosub stow cloth
		gosub put.1 "app my %temp4" "^Roundtime"
	}

	var ranks 0|5|10|22|29|36|43|50|59|63|76|90|103|117|137|156|175|192|210|229|248|270|325|358|380|410|460|490|540|600|654|720|800
	var style Scales halt|Scales|Arpeggios|Ditty|Folk|Ballad|Waltz|Lullaby|March|Jig|Lament|Wedding|Hymn|Rumba|Polka|Battle|Reel|Elegy|Serenade|Minuet|Psalm|Dirge|Gavotte|Tango|Tarantella|Bolero|Nocturne|Requiem|Fantasia|Rondo|Aria|Sonata|Concerto
	var min 0
skillcheck:
	if (%play > %ranks(%min)) then
		{
			math min add 1
			goto skillcheck
		}
		else var song %style(%min)

hum.1:
	if ($%learn.play > %globalexp) then goto play.end
	var play.instr 0
	matchre hum.1 %rtwait
	match songset with only the slightest hint of difficulty.
	matchre adjust (%adjust_up|%adjust_down)
	put %play_comm %song
		matchwait 7
		put #echo Song error.
	return
	
songset:
	put #var $1_song %song
	goto play.s

adjust:
	if (("%style(%min)" = "Scales halt") && ("$1" = "You struggle")) then goto songset
	if (("%style(%min)" = "Scales halt") && ("$1" = "You fumble slightly")) then goto songset
	gosub put.1 "stop play" "^You stop|^But"
	if contains("%adjust_up", ("$1") then math min add 1
	elseif contains("%adjust_down", ("$1") then math min subtract 1
	var song %style(%min)
	goto hum.1

play.l:
	if %play.song = 1 then
	{
		gosub ppcheck
		gosub put.1 "%play_comm %song" "^You|^You're"
		var play.song 0
		var play.instr 0
	}
play.s:
	if "$2" = "stop" then goto play.end
	if %pause.song = 0 then
		{
			delay 1
			gosub roundtimedone
			goto play.s
		}
	gosub instrument.setup
	var learn.play %temp1(1)
	if $%learn.play > %globalexp then goto play.end
	if %books1 = 0 then
	{
		if "$righthandnoun" = "%win" then
		{
			var books1 1
			gosub m.inputooks "weapon book" 1 9
			gosub stow book
		}
	}
	if %books2 = 0 then
	{
		if "$righthandnoun" = "%per" then
		{
			var books2 1
			gosub m.inputooks "armor book" 1 4
			gosub stow book
		}
	}	
	if $Perception.LearningRate < 33 then gosub collect 1
		else 
		{
			if $Appraisal.LearningRate < 33 then gosub put.1 "asses $righthandnoun" "^Roundtime"
				else delay 1
		}
	gosub roundtimedone
	goto play.l

play.end:
	if %play.song != 1 then gosub splay
	gosub put.2 "get my cloth" "clean my %temp4 with my cloth" "dry it off|^\[Roundtime:|not in need of cleaning\."
return

## instrument difficulty is the 3rd array section(0-3), based on a base difficulty of vocals, 1.
instrument.setup:
	var strings Strings.Ranks|Strings.LearningRate|lyre|1
	var winds Winds.Ranks|Winds.LearningRate|jug|1
	var percussions Percussions.Ranks|Percussions.LearningRate|zills|1
	var vocals Vocals.Ranks|Vocals.LearningRate|0|1
return
	
md:
	gosub getfan
mdloop:
	if $Vocals.LearningRate < 27 then gosub put hum $vocals_song
	if "$righthandnoun" != "fan" then return
	gosub put tap fan
	if $Arcana.LearningRate < %globalexp then goto mdloop
	gosub emptyhands
return

return:
	return

emptyhands:
	pause 0.1
	if %play.instr = 0 then return
	if contains("$lefthandnoun", "dirt") then gosub put drop my dirt
	if contains("$righthandnoun", "dirt") then gosub put drop my dirt
	if contains("$lefthandnoun", "vine") then gosub put drop my vine
	if contains("$righthandnoun", "vine") then gosub put drop my vine
	if contains("$lefthandnoun", "paper") then gosub put drop my paper
	if contains("$lefthandnoun", "%braid") then gosub put drop my %braid
	if contains("$righthandnoun", "%braid") then gosub put drop my %braid
	if contains("$lefthandnoun", "%rope") then gosub put drop my %braid
	if contains("$righthandnoun", "%rope") then gosub put drop my %braid
	if contains("$lefthand", "dirt") then gosub put drop my dirt
	if "$lefthandnoun" = "%ranged" then gosub smartranged
	if "$righthandnoun" = "%ranged" then gosub smartranged
	if "$lefthand" != "Empty" then gosub stow left
	if "$righthand" != "Empty" then gosub stow right
	return

checktime:
	var checktime 0
	eval timenow replacere("$time", ":", "|")
	eval timenow replacere("%timenow", " AM", "|AM")
	eval timenow replacere("%timenow", " PM", "|PM")
	#put #echo It's %timenow(0) %timenow(3)
	if "$charactername" = "Stoh" then
		{
	if (((%timenow(0) = 3) && ($connected = 1) && ("%timenow(3)" = "AM")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	if "$charactername" = "Rhaec" then
		{
	if (((%timenow(0) = 02) && ($connected = 1) && ("%timenow(3)" = "AM")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	var checktime 1
return

playtime:
   eval timenow replacere("$time", ":", "|")
	eval timenow replacere("%timenow", " AM", "|AM")
	eval timenow replacere("%timenow", " PM", "|PM")
	if "$charactername" = "Stoh" then
		{
	if ((%timenow(0) = 10) && ($connected = 0) && ("%timenow(3)" = "AM")) then
		{		
			delay 15
			gosub clear
			var resonance ""
			put #connect
			delay 10
			send .stohtrain
		}
		else
			{
				delay 100
				goto playtime
			}
		}
		if "$charactername" = "Rhaec" then
		{
	if ((%timenow(0) = 10) && ($connected = 0) && ("%timenow(3)" = "AM")) then
		{		
			delay 15
			gosub clear
			var resonance ""
			put #connect
			waitfor You are Rhaec
			send .repair
			waitfor @repair done.
			send .rhaectrain
		}
		else
			{
				delay 100
				goto playtime
			}
		}
exit

quittime:
	gosub killthrown
	gosub throwcheck
	gosub pyramid get
	gosub clear
	gosub put.1 "stop climb" ".+"
	if "$charactername" = "Rhaec" then 
		{
			gosub flee
		}
	if "$charactername" = "Stoh" then gosub rfwalk
	gosub returnhome
	gosub move %saferoom
	gosub emptyhands
	gosub clear
	put quit
	goto playtime

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
	var exitnow 1
	gosub clear
	gosub throwcheck
	gosub pyramid get
	pause 15
	timer clear
	timer stop
	put exit
	pause 2
	put exit
	goto reconnect
exitfull:
	action clear
	var exitnow 1
	gosub clear
	gosub throwcheck
	gosub pyramid get
	pause 20
	if dead then put exit
	pause 2
	if dead then put exit
	pause 20
exitquick:
	action clear
	var exitnow 1
	gosub clear
	gosub throwcheck
	gosub pyramid get
	#config connect False
	put exit
	pause 2
	put exit
	exit

include RoutineGMcheck.cmd
