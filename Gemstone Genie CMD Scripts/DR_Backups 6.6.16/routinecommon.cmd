	
	routinecommon:
	timer clear
	timer start
	var rtgood ^Roundtime:|^\[Roundtime
	var rtwait ^\.\.\.wait|^You don't seem to be able to move to do that|^You struggle against the shadowy webs to no avail\.|^Sorry, system is slow|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!
	var ritual.msg ^This ritual may only|^Rituals do not work|^A skinned creature is worthless|^This corpse has already been|^The preservation ritual performed|^Lacking your knife, you cannot perform any rituals.|^Roundtime
	var app.msg ^Appraise what|^It's dead|Roundtime:
	var stalk.msg ^You are already|^Stalking is an|^Stalk what\?|^\[You're|^You are convinced|^Roundtime:|^You're already
	var advance.msg ^What do you want to advance towards\?|^You begin to advance on|already quite dead\.|^You are already advancing on|^You are already at melee with|^You begin to stealthily advance on|^You spin around to face|^You will have to retreat from your current melee first\.
	var get.msg ^You get|^You pick up|^You are already holding that\.|^You fade in for a moment as you pick up|^You pull|^What were you referring to\?|^But that is already in your inventory\.|^You are not strong enough to pick that u\!
	var prep.msg ^You close your eyes and breathe deeply,|^You trace an arcane sigil in the air,|^Heatless orange flames blaze between your fingertips|^Your eyes darken to black as a starless night|^You raise your arms skyward, chanting|^You are already preparing|^Icy blue frost crackles up your arms|^You make a careless gesture as you chant the words|^Tiny tendrils of lightning jolt between your hands|^The wailing of lost souls accompanies your preparations|^Your skin briefly withers and tightens, becoming gaunt|^Images of streaking stars falling from the heavens flash across your vision|^A nagging sense of desperation guides your hands through the motions|^You hastily shout the arcane phrasings needed to prepare|^You deftly waggle your fingers in the precise motions needed to prepare|^With great force, you slap your hands together before you and slowly pull them apart,|^With no small amount of effort, you slowly recall the teachings|^You struggle against your bindings to prepare|^You raise one hand before you and concentrate|^As you begin to focus on preparing|^You trace an angular sigil|^You raise an arm skyward|^You trace a hasty|^You begin chanting|^You raise an arm skyward
	var cast.msg ^Roundtime:|^You gesture|^You don't have a spell prepared\!|^Your spell pattern collapses|^With a wave of your hand,|^You wave your hand\.|^With a flick of your wrist,|^Your secondary spell pattern dissipates|^You can't cast .+ on yourself\!|^You make a|^You raise your palms and face to the heavens|^I could not find what you were referring to\.|^You have difficulty manipulating|^You draw your|^You reach with both|^You whisper|^You clench your|^You hold out your arms|^You close your eyes
	var hide.msg ^Eh\?|^You melt into|^You are a bit|^You blend in with|notices your attempt to hide\!$|^You look around
	var hum.msg ^You are already|^You begin|^You fumble|^You can't muster
	var stow.msg ^You put|^What were|^You can't put|^There isn't|too thick to fit|^Stow what|^But that|^You pick|^You hang|too long to fit
	var wear.msg ^You attach|^You work|^You slip|^You put a|^You are already|^You slide|^You hang|^You remove|^Remove what|^You sling
	var cman.msg ^\[Roundtime|^You aren't|^There is nothing|^Roundtime|already loaded|^How can you|What are you trying to throw\?
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
	setvariable 0
	var checkharness 1
	var origami_count 0
	var page_count 0
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
	var tending 0
	var combtrain 0
	var resonance
	var listennow 0
	var stalkerror 0
	var jailnow 0
	var clericswitch 0
	var pomstun 0
	var autohealer.exit 0
	
	setvariable talking none
	setvariable halfminutes 0
	var oklist Shofixy|Kalag|Nevinkar
#	var bad_page Gidii|River Caiman
	var bad_page none
	var runverbs (say,|ask,|exclaim,|says|exclaims|whisper|comes out of hiding|asks|bends over.*corpse briefly|leaps from hiding)\b/i
	action var foragemore 1 when You need to have more material in your other hand to continue braiding.|unable to find anything/.$
	action var tending 0 when ^The bandages binding your
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
	action var talking $0 when (\S+) %runverbs
	action var talking $0 when ^You hear (.+)
	action setvariable disconnected yes when Connection lost\.
	action var humming yes when ^You begin to hum|^You continue.*hum|^You.*as you begin to hum a|You are already performing something/i|^You begin some|^You effortlessly begin|^You begin a|^You fumble slightly|^You struggle
	action var humming no when ^You finish humming|^You stop playing your song.|^In the name of love/i
	action goto exitfull when WARNING:  You have a somewhat high number of items on your person|You're carrying far too many items already
	action goto exitfull when ^You are in no condition to do that
	action goto enemyhere when ^Ghasuil (says|asks)
	action put #echo >log Purple Backlash!;goto backlash when ^You sense the spell pattern spontaneously extrude a series of uncontrollable ganglia with the influx of unfocused mana\.$
	action put #echo >log Purple Backlash!;goto moonbacklash when ^The spell pattern resists the influx of Lunar mana
	action put #echo >log Purple Backlash!;goto backlash when ^The spell pattern resists the influx of (Lunar|Holy) mana
	action goto moonbacklash when BACKLASHTEST
	action var listennow 1 when ^Stoh begins to lecture you
	action put #echo >log Green Stalk error!;var stalkerror 1 when You move along to follow
	#action goto cradlefocus;put #echo >log Green Cradle done! when ^The influence of the three moons is in balance\.
	action var teachnow 1 when ^Vayek coughs\.
		
	gosub routineGMcheck
	gosub routinemagic
	return

enemyhere:
	var monitor no
	var resonance stealing
	gosub clear
	gosub put.1 "say What do want\?" "^You"
	delay 5
	gosub put.1 "say I know you called that Necromancer here." "^You"
	delay 5 
	gosub put.1 "say Stay away from me." "^You"
	goto runhide

	
goto:
	if $hidden = 1 then gosub put.1 "unhide" "^You slip"
	if (($invisible = 0) && ("%resonance" = "stealing")) then
	{
		if "$guild" = "Necromancer" then gosub eotb 10 2
		if "$guild" = "moon" then gosub rfwalk 10 0
	}
	put #goto $0
	gosub movewait
return
	
	
move:
	if $hidden = 1 then gosub put.1 "unhide" "^You slip"
	if $0 = $roomid then return
	put #script abort automapper
	if $invisible = 0 then
	{
		if (("$guild" = "Necromancer") && (%getdirt = 0)) then gosub eotb 10 2
		if (("$guild" = "moon") && ("%train_now" != "forging")) then gosub rfwalk 5 1
	}
	if $roomid = 0 then put #mapper reset
	if $roomid = 0 then goto moveto.error
	if "%resonance" = "" then var resonance moving
	put #var mapperpath none
	put #mapper path $1
	put #var lastmove $1
	if "$mapperpath" = "none" then goto moveto.error
	put #mapper walk $0
movewait:
	if %jailnow = 1 then 
	{
		gosub jailnow
		put #mapper reset
		put #mapper walk $lastmove
	}
	gosub roundtimedone
	matchre movereturn @walk done.
	matchre movecounter Obvious
	matchre movecounter closes in behind you
	matchre movecounter you sneak
	matchre movecounter you go
	matchre movewait ^You can't go there\.|^Roundtime
	matchre movewait you edge across the bridge
	matchre movewait ^You struggle
	matchre movewait Almost to the highest part of the bridge
	matchre movewait As you walk across the last stretch, a sudden gust of wind shakes the bridge
	matchwait 30
moveto.error:
	if $stamina < 85 then goto movewait
	echo Move timed out!
	if "%disconnected" = "yes" then goto notconnected
	if $roomid = 0 then
	{
		gosub retreat.missile
		gosub movedir
		if $roomid != 0 then gosub move $lastmove
	}
	echo LOST...
	goto roomrecovery
	
movecounter:
	var disconnected no
	math keywords subtract 1
	if "%monitor" != "no" then if %keywords > 3 then goto GMcheckmain
	goto movewait
movereturn:
	if "%resonance" = "moving" then var resonance
	var talking none
	if "$mapper" = "attack" then
		{
		if contains("$roomplayers", "Also here") then return
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
		if $monstercount > 2 then var playerhere 1
		if contains("$roomplayers", "Also here") then var playerhere 1
		#if contains("$roomplayers", "Also here: Stoh\.") then var playerhere 0
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
	if (($monstercount > 0) && ("%weaponrange" != "missile")) then
	{
		if %heavy = 1 then gosub heavy.remove
		gosub put.1 "retreat" "%retreat.msg|^Roundtime:"
		gosub put.1 "retreat" "%retreat.msg|^Roundtime:"
		goto walk
	}
	gosub put.1 "$0" "^Obvious|^You can't swim|^Roundtime"
return

movedone:
	var talking none
return

roomrecovery:
	var stalkerror 0
	put #script abort automapper
	gosub throwcheck
	gosub pyramid get
	gosub returnhome
	gosub move %saferoom
		
	gosub clear
	goto $charactername
returnhome:
	if $roomid = 0 then gosub movedir
	##gosub flee
	## Comment out your home zone
	gosub emptyhands
	if $zoneid = 11 then
	{
		gosub move 36
		gosub vipertrail exit
	}
	if $zoneid = 112 then gosub move 112
	if $zoneid = 10 then gosub move 22
	if $zoneid = 92 then gosub move 92
	if $zoneid = 98 then gosub move 86
	if $zoneid = 65 then gosub move 1
	if $zoneid = 10 then gosub move 22
	#if $zoneid = 4 then gosub move 14
	if "$zoneid" = "14c" then gosub move 21
	if $zoneid = 7 then gosub move 347
	if $zoneid = 6 then gosub move 114
	if $zoneid = 8 then gosub move 43
	if (($zoneid = 116) && ("$charactername" = "Stoh")) then gosub move 3
	if $zoneid = 1 then 
	{
		## ** Bank zone
		gosub checksell
		gosub move 172
		#gosub move 145
		#gosub move 171
		#gosub walk n
	}
	if $zoneid = 6 then gosub move 114
	if $zoneid = 90 then gosub move 663
	if (($zoneid = 123) && ("$guild" = "cleric")) then gosub move 169
	if $zoneid = 69 then gosub move 1
	if "$guild" = "Necromancer" then
	{
		if $roomid = 217 then gosub move 59
		if "%Philosopher" = "on" then gosub release php
		if "%Calcified" = "on" then gosub release ch
		if "%Ivory" = "on" then gosub release ivm
		if "%Butcher" = "on" then gosub release bue
	}
	if $zoneid = 67 then gosub move 132
	if $zoneid = 65 then gosub move 1
	if $zoneid = 62 then gosub move 101
	if $zoneid = 116 then gosub move 217
	if $zoneid = 126 then gosub move 103
	## ** Bank zone
	if "%resonance" != "" then return
	if $zoneid = 66 then gosub checksell
	if $zoneid = 40 then gosub checksell
	if $zoneid = 61 then gosub checksell
	if $zoneid = 127 then gosub checksell
	#if $zoneid = 61 then gosub move 130
return

checksell:
	if (($bund.loc1 > 0) || ($bund.loc5 > 0)) then gosub sellbundle
return

movedir:
		if $up = 1 then
			{
				gosub put.1 "up" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $east = 1 then 
			{
				gosub put.1 "east" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $north = 1 then
			{
				gosub put.1 "north" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $northeast = 1 then
			{
				gosub put.1 "ne" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $northwest = 1 then 
			{
				gosub put.1 "nw" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $down = 1 then
			{
				gosub put.1 "d" "^Obvious"
				if !contains("$roomplayers", "Also here") then return
					else goto movedir
			}
		if $west = 1 then
			{
				gosub put.1 "w" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $south = 1 then
			{
				gosub put.1 "s" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $southeast = 1 then
			{
				gosub put.1 "se" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if $southwest = 1 then
			{
				gosub put.1 "sw" "^Obvious"
				if contains("$roomplayers", "Also here") then goto movedir
					else return
			}
		if matchre("$roomexits", "none") then
		{
			put #echo >log Purple Move dir, no exits!
			put quit
			exit
		}
return

# ** external script start command		
ss:
	delay 1
	put .$1 $2 $3 $4 $5
	waitfor $1.cmd done.
return 

findclass:
var level.5 0
var level.4 0
var level.3 0
var level.2 0
var level.1 0
var class 0
var priorityclass $0 

action var level.5 1;var teach.5 $1 when (\w+) is teaching a class .+ %priorityclass
action var level.4 1;var teach.4 $1 when (\w+) is teaching a class .+ Targeted Magic
action var level.3 1;var teach.3 $1 when (\w+) is teaching a class on extremely advanced
action var level.2 1;var teach.2 $1 when (\w+) is teaching a class on [^extremely]
action var level.1 1;var teach.1 $1 when (\w+) is teaching a class

find.class:
	gosub put.1 "ass teach" "^Roundtime:"
	if %level.5 = 1 then 
	{
		gosub put.1 "listen %teach.5 observe" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		var class 1
		goto listenexit
	}
	if %level.4 = 1 then 
	{
		gosub put.1 "listen %teach.4 observe" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		var class 1
		goto listenexit
	}
	if %level.3 = 1 then 
	{
		gosub put.1 "listen %teach.3 observe" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		var class 1
		goto listenexit
	}
	if %level.2 = 1 then
	{
		var class 1
		gosub put.1 "listen %teach.2 observe" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		goto listenexit
	}
	if %level.1 = 1 then 
	{
		var class 1
		gosub put.1 "listen %teach.1 observe" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		goto listenexit
	}

listenexit:
return

teachloop:
	delay 30
	gosub findclass
	if %class = 0 then return
	if $Teaching.LearningRate > 33 then return
	goto teachloop

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
	gosub reveal
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
	if "$guild" = "mage" then gosub fissurecheck
	if "$righthandnoun" != "book" then gosub get $1
	gosub cyclic_check
	gosub quickspelltrain	
	gosub ppcheck
	gosub reveal
	if "$righthandnoun" != "book" then gosub get $1
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
	elseif $Vocals.LearningRate < 27 then if "%humming" = "no" then gosub put hum $vocals_song
	evalmath page (%page + 1)
	goto turnpage
return

braid:
	action var pullbraid 1 when ^Frustration wells|^You fumble around
	
	var pullbraid 0
	var garbage 0
	var empty 0
	var braid $1
	var bin $3
	var astroswitch $4
	var braidexp %globalexp
	#if "$charactername" = "Rhaec" then var braidexp 33
	#if $Time.isDay = 1 then var braidexp 33
	if $2 = "g" then var garbage 1
	if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
	if $roomid = 136 then var braid grass
	gosub put.2 "rem %gloves" "stow %gloves" "^You put|^Stow what"
	gosub put forage %braid
braidloop:
	var braidexp %globalexp
	#if "$charactername" = "Rhaec" then var braidexp 33
	#if $Time.isDay = 1 then var braidexp 33
	gosub ppcheck
	if $Mechanical_Lore.LearningRate > %braidexp then goto mechend
	if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then gosub pause 1
braidcont:
	if "$guild" = "mage" then gosub fissurecheck
	gosub cyclic_check
	gosub quickspelltrain
	if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then
	{
		if contains("$roomobjs", "%braid") then gosub get %braid
			else gosub put forage %braid
	}		
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
						else gosub put.1 "w" "^Obvious"
						if contains("$roomplayers", "Also here") then
						{
							return
						}
				gosub put drop my rope
				gosub emptyhands
				if "$charactername" = "Rhaec" then gosub put.1 "n" "^Obvious"
					else gosub put.1 "e" "^Obvious"
				}
			var empty 0
			gosub put forage %braid
		}
	goto braidloop
mechend:
	action remove ^Frustration wells|^You fumble around
	var astroreturn 0
	gosub put.1 "w" "^Obvious"
	gosub emptyhands
	gosub put.1 "e" "^Obvious"
	gosub put.2 "get my %gloves" "wear my %gloves" "%wear.msg"
	return

startburin:	
	action var newburin 1 when ^Eventually, you end up with
	action var burinerror 1 when ^It would be better to find
	
	var newburin 0
	
	gosub startskill Mechanical_Lore
	
	
imbueburin:
	var burinerror 0
	if $Mechanical_Lore.LearningRate > %globalexp then
	{
		action remove ^Eventually, you end up with
		action remove ^It would be better to find
		gosub emptyhands
		gosub endskill Mechanical_Lore
		return
	}
	if $Attunement.LearningRate < 30 then gosub ppcheck
	if "$righthandnoun" != "knife" then gosub get carv knife
	gosub put.1 "forage oak limb" "^Roundtime"
	if ("$preparedspell" != "None") then gosub release
	gosub prep imbue 25
	delay 5
	gosub cast my limb
	gosub prep imbue 25
	delay 5
	gosub cast my limb
burinloop:
	gosub quickspelltrain
	if %burinerror = 1 then goto imbueburin
	if "$righthandnoun" != "knife" then gosub get carv knife
	if (("$lefthandnoun" != "limb") && ("$righthandnoun" != "limb")) then gosub get limb
	if (("$lefthandnoun" != "limb") && ("$righthandnoun" != "limb")) then 
		{
			gosub emptyhands
			goto imbueburin
		}
	if %newburin = 0 then gosub put.1 "carve my limb with knife" "^Roundtime"
		else goto newburin
	if %newburin = 1 then goto newburin
	goto burinloop
newburin:
	var newburin 0
	#gosub put.1 "go back door" "^Obvious"
	gosub put.1 "put handle in bin" "^You"
	#gosub put.1 "go back door" "^Obvious"
	if "$righthandnoun" != "knife" then gosub emptyhands
	goto imbueburin

cradlefocus:
	gosub clear
	gosub pause 1	
	gosub emptyhands
	gosub put.1 "remove torq" "^You remove"
	gosub put.1 "focus torq" "^Roundtime"
	gosub put.1 "focus torq" "^Roundtime"
	gosub emptyhands
	send .stohlore
	exit
	
prayerbead.start:
	action var beadreset 1 when ^It would be better to find a creature
	
	gosub startskill Mechanical_Lore
	gosub emptyhands
forage.bead:
	gosub cyclic_check
	if (("$righthandnoun" = "limb") || ("$lefthandnoun" = "limb") then goto carve.loop
	gosub put.1 "forage limb" "^Roundtime"
	gosub get my jar
	gosub put.1 "sprinkle jar on my limb" "^You sprinkle"
	gosub stow left	
	if "$preparedspell" != "None" then gosub release spell
	gosub prep bless
	delay 3
	gosub cast my limb
	gosub get my skin knife
	var beadreset 0
carve.loop:
	if %beadreset = 1 then goto beadempty
	gosub quickspelltrain
	if (("$righthandnoun" != "knife") && ("$lefthandnoun" != "knife")) then gosub get my skin knife
	if (("$righthandnoun" != "limb") && ("$lefthandnoun" != "limb")) then gosub get limb
	gosub put.1 "carve my limb with my skin knife" "^Roundtime"
	if (("$righthandnoun" = "limb") || ("$lefthandnoun" = "limb")) then goto carve.loop
	gosub stow knife
	gosub get my shape
shape.loop:
	if %beadreset = 1 then goto beadempty
	gosub quickspelltrain
	if (("$righthandnoun" != "shaper") && ("$lefthandnoun" != "shaper")) then gosub get my shaper
	if (("$righthandnoun" != "block") && ("$lefthandnoun" != "block")) then gosub get block
	gosub put.1 "shape my block to lion" "^Roundtime"
	if (("$righthandnoun" = "block") || ("$lefthandnoun" = "block")) then goto shape.loop
	gosub stow shaper
	gosub put.1 "put my bead on chain" "^You carefully"
	if (("$righthandnoun" = "bead") || ("$lefthandnoun" = "bead")) then
	{
		gosub walk w
		gosub put.1 "drop bead" "^You drop"
		gosub walk e
	}
	if $Mechanical_Lore.LearningRate < %globalexp then goto forage.bead

	gosub endskill Mechanical_Lore
	action remove ^It would be better to find a creature
return

beadempty:
	gosub walk w
	gosub emptyhands
	gosub walk e
	goto forage.bead
	
waterfill:
	var fill 0
	var blessdone 0
	action var fill 1 when ^There is no more room
	action var blessdone 1 when ^A brilliant silver glow
	
	gosub move 223
	gosub get vial
waterfill.loop:	
	gosub put.2 "fill vial with water" "pour vial in jar in my pack" "^You pour|^There is no more"
	if %fill = 0 then goto waterfill.loop
	gosub emptyhands
	gosub get jar
blessloop:
	gosub prep bless
	gosub pause 3
	gosub cast water in jar
	if %blessdone = 0 then goto blessloop
	gosub emptyhands
	
	action remove ^There is no more room
	action remove ^A brilliant silver glow
return

summon.start:
	gosub startskill Summoning
	
	action var summon impedance when ^You so heavily embody|^Finishing your meditation, you feel that you have reached your limit\.$
	action var summon admittance when ^Try though you might|^You lack the
	
	var summon admittance

summon.loop:
	if $Summoning.LearningRate > 33 then goto summon.exit
	if "$guild" = "mage" then
	{
		gosub fissurecheck
		gosub magetrain
	}
	if "%summon" = "impedance" then goto pathfocus
	gosub put.1 "summon admittance" "^Roundtime|^You so"
	goto summon.loop

pathfocus:
	gosub put.1 "path focus power" "^You focus|^You lack"
	if "%summon" = "admittance" then goto summon.loop
	gosub put.1 "path stop" "^You gently"
	goto summon.loop
	
summon.exit:
	action remove ^You so heavily embody
	action remove ^Try though you might
	
	gosub endskill Summoning
return

pyramid:
	return
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

icehole:
	var icehole 0
	action var icehole 1 when ^You find a hole
	action var icehole 0 when ^You lose track of where the hole
icehole.loop:	
	gosub put.1 "search" "^Roundtime"
	if %icehole = 0 then goto icehole.loop
	gosub put.1 "go hole" "Obvious"
	action remove ^You find a hole
	action remove ^You lose track of where the hole
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
		if (($stunned = 1) && ($monstercount > 0) && (%pomstun = 0)) then goto exitquick
	}
	if (($standing = 0) && ($monstercount > 0) && (%clericswitch = 0)) then put dance silly
	if (($bleeding = 1) && (%tending = 0)) then gosub tendwound
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
	if ((%tinglenow = 1) && (%tingleon = 0)) then gosub tingleroom
	if %stalkerror = 1 then goto roomrecovery
	if (("%weaponrange" != "missle") && ($health < 90) && ($monstercount > 0)) then put retreat
	if ((%arrayloc < 3) && ("%Ghost" = "on") && (%invoke = 1) && (%invokeswitch = 0)) then gosub invokenow
	if (("$guild" = "cleric") && (%clericswitch = 0)) then
	{
		gosub badgecheck
		gosub praycheck
		gosub praymatcheck
		gosub eluned_commune
		gosub tasmine_commune
	}
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
	if %listennow = 1 then
	{
		var listennow 0
		put listen to stoh
	}
	if %teachnow = 1 then
	{
		var teachnow 0
		put teach sorcery to vayek
		delay 1
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
	gosub put.1 "prep %do1 %do2" "%prep.msg"
return

cast:
	var do1 $0
	if "%humming" = "yes" then gosub splay
	gosub put.1 "cast %do1" "%cast.msg"
return

release:
	gosub put.1 "release $0" ".+"
return

spellstance:
	gosub put.1 "spell stance $1 $2 $3" "^Your spell Integrity|^The total of the spell"
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
		if "$guild" = "warrior mage" then
		{
			if (($stamina > 30) && ($stamina < 70) && ("%Zephyr" = "off") && ("$preparedspell" = "None")) then
			{
				gosub prep zeph
				delay 15
				put cast
			}
		}
		delay 2
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

dropcoins:
  action var copperK $1 when .+ and (\d+) copper Kronars \(
  action var copperL $1 when .+ and (\d+) copper Lirums \(
  action var copperD $1 when .+ and (\d+) copper Dokoras \(
  
  var copperK 0
  var copperL 0
  var copperD 0
  
  gosub put.1 "info" "Debt:"
  
  if %copperK > 0 then gosub put.1 "drop %copperK copper kronar" "^You drop"
  if %copperL > 0 then gosub put.1 "drop %copperL copper lirums" "^You drop"
  if %copperD > 0 then gosub put.1 "drop %copperD copper dokoras" "^You drop"
  
  action remove .+ and (\d+) copper Kronars \(
  action remove .+ and (\d+) copper Lirums \(
  action remove .+ and (\d+) copper Dokoras \(
  
  return

stow:
	var do1 $1
	var do2 $2
	gosub put.1 "stow $0" "%stow.msg"
return	

swap:
	gosub put.1 "swap $0" "^You move|^You have|^You switch"
return

adv:
	var advance 1
	gosub put.1 "adv $0" "%advance.msg"
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

unhide:
	gosub put.1 "unhide" "^You come out|^But you are not|^You try to creep|^You slip"
return

reveal:
	if $invisible = 1 then 
	{
		if "$guild" = "Necromancer" then gosub release eotb
		if "$guild" = "moon" then gosub release rf
	}
return

	
splay:
	gosub put.1 "stop play" "^But you're|^You stop|^In the name of"
return

ppcheck:
	evalmath perctemp ($gametime - $last.perc)
	#if ((%perctemp > 60) && ("$charactername" = "Stoh") && ($Appraisal.LearningRate < 30)) then
	#{
	#	put #var last.perc $gametime
	#	gosub put.1 "app my bundle careful" "^Roundtime"
	#}
	if $Attunement.LearningRate > 30 then return
	## room mana 60 second timer, planet mana 300 seconds
	if "$guild" != "moon" then 
		{
			if %perctemp > 60 then goto powercheck
				else return
		}
	else if %perctemp < 300 then return
powercheck:
	##  ** Can use a PP trigger or set last.pp here.
	put #var last.perc $gametime
	gosub powerp
return

powerp:
	if "$guild" != "moon" then
		{
			gosub put.1 "power" "^Roundtime"
			return
		}
	var perp1 $1
	
	if "%Aura" = "off" then 
		{
			if "$preparedspell" != "None" then
			{
				if $spelltime > 20 then gosub castrequest 1 1 1 1
					else gosub release spell
			}
			gosub prep aus
			gosub pause 1
			gosub castrequest 1 1 1 1
		}
	gosub perc
	gosub perc xibar
	gosub perc yavash
	gosub perc katamba
	gosub perc moonlight
	gosub perc transduction
	gosub perc psychic
	gosub perc perception
	gosub perc teleo
	gosub perc planets
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
	#if $%items(%j).Ranks < $%items(%i).Ranks or ($%items(%j).Ranks = $%items(%i).Ranks and $%items(%j).LearningRate < $%items(%i).LearningRate) then
	if $%items(%j).LearningRate < $%items(%i).LearningRate then
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
	put #var connected 0
	var disconnected no
	pause 20
	put #connect
	pause 5
	if $connected = 1 then
	{
		waitfor You are .+ Keldus
		send .keldustrain
		exit
	}
	else goto notconnected

necrobacklash:
	var releasetrain 0
	gosub clear
	gosub emptyhands
	gosub prep eotb
	delay 3
	gosub cast
	gosub retreat.missile
	gosub move 175
	if "$charactername" = "Keldus" then
	{
		## ** eels in shard
		gosub move 121
		gosub checkplayer
		if %playerhere = 1 then gosub move 120
		gosub release eotb
		gosub dodge attack
		var castcamb 1
		gosub castbuff "Ease Burden" 5 6 20
		gosub spelldelay
		send .killnowtm eel
	}
	exit

backlash:
	var resonance stealing
	if "%Ghost" = "off" then
	{
		gosub castbuff "Ghost Shroud" 10 10 8
		gosub spelldelay
	}
	gosub returnhome
	gosub clear
	gosub emptyhands
## ** Go to auto healer
	gosub move 510
	gosub move 49
	gosub goto healer
	goto autohealer.loop

autohealer.move:
	var autohealer.return 1
	
autohealer:
	var resonance climbing
	gosub emptyhands
	gosub goto healer
	goto autohealer.loop
	
autohealer.loop:
	if $roomplayers != "" then
	{
		if matchre("$roomplayers", "Also here: .+ who is lying") then
		{
			gosub pause 10
			put health
			goto autohealer.loop
		}
	}
	gosub reveal
	gosub put.1 "lie" "^You lie down\."
	#var castcamb 1
	#gosub castbuff "Ease Burden" 5 6 20
	#gosub spelldelay
	#gosub emptyhands
healfull.loop:
	if $sitting = 0 then
	{
		gosub pause 10
		put health
		goto healfull.loop
	}
	
	if "%resonance" != "stealing" then 
	{
		var resonance
		goto return
	}
	if "$charactername" = "Stoh" then send .stohlore
	if "$charactername" = "Vayek" then send .vayektrain
	exit
	
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
	if "%runhide" = "yes" then return
	if matchre("%talking", "%oklist") then return
	if matchre("%talking", "a gravelly whisper accompanying the motion") then return
	if matchre("%talking", "\[?OOC: .+ (PM|AM)") then return
	if matchre("%talking", "\[?OOC: .+ 3.0") then return
	if matchre("%talking", "shouts, .+ \[?OOC:") then return
	if matchre("%talking", "shout, .+ \[?OOC:") then return
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
	if matchre("%talking", "Dry grasses whisper in supplication") then return
	if matchre("%talking", "Cormyn shakes his head and " then return
	if matchre("%talking", "Ladar says," then return
	if matchre("%talking", "Ladar shrugs and says," then return
	if matchre("%talking", "Patting the side of the boar's thick neck") then return
	if contains("%talking", "Horse Whisperer") then return
	if contains("%talking", "pruned whisper bush") then return
	if contains("%talking", "grass rustle and whisper") then return
	if contains("%talking", "shadowling") then return
	if contains("%talking", "And there's your rope back") then return
	if contains("%talking", "like the muffled sound of running") then return
	if contains("%talking", "If you would like to accompany me") then return
	if contains("%talking", "You whisper the final word") then return
	if contains("%talking", "whisper something inaudible before he walks toward the rocky incline") then return
	if contains("%talking", "Cormyn shakes his head and says,") then return
	if contains("%talking", "With a barely perceptible whisper") then return
	if contains("%talking", "With a final, swirling whisper,") then return
	if contains("%talking", "You hear a growl behind you") then return
	if contains("%talking", "The harsh whisper of a raw breeze ministers") then return
	if contains("%talking", "You hear the voice of a crier outside") then return
	if contains("%talking", "One of them Tavern Troupe folks") then return
	if contains("%talking", "You hear a low whistling") then return
	if contains("%talking", "You hear a gleeful hoot and turn to see a stone-throwing imp") then return
	if contains("%talking", "The money-changer says crossly,") then return
	if contains("%talking", "A malodorous bucca covers its eyes") then return
	if contains("%talking", "Shalvard") then return
	
	if "%talking" != "none" then echo %talking
	var runhide_action wave
	if contains("%talking", "asks,") then var runhide_action shake head
	
	put #echo >log Red Runehide trigger!! %talking
	setvariable talking none
	gosub clear
	goto runhide

runhide:
	var runhide yes
	var monitor 
	var resonance
	if $monstercount > 0 then if %spears < 3 then gosub killthrown
	if $monstercount > 0 then if %axes < %maxaxe then gosub killthrown
	if $monstercount > 0 then if %thrownknife < %maxthrown then gosub killthrown
	gosub throwcheck
	gosub pyramid get
	gosub put.1 "%runhide_action" ".+"
	if "$charactername" != "Stoh" then gosub flee
	if "$charactername" = "Stoh" then gosub rfwalk 5 1
	gosub returnhome
	gosub move %saferoom
	gosub put hide
	gosub pause 120
	gosub emptyhands
	gosub clear
	var runhide no
	goto $charactername

pause:
	var time $0
	pauseloop:
	delay 1
	gosub roundtimedone
	math time subtract 1
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
		return
		
kill.now:
	gosub leslice.combo
	gosub dodge attack
	gosub splay
	var cman draw
kill.loop:
	if $monstercount < 3 then
	{
		gosub dodge
		return
	}
	if "%weaponrange" = "melee" then
	{
		if (("$righthandnoun" != "dao") && ("$lefthandnoun" != "dao")) then 
		{
			gosub emptyhands
			gosub get my dao
		}
		gosub tmcheck
		gosub put.1 "%cman %1" "%cman.msg"
	}
		else gosub pause 1
	if contains("$roomobjs", "appears dead") then
	{
		gosub deathcheck
		goto kill.loop
	}
	gosub stamcheck
	goto kill.loop		

startcollect:
	var collect_count 0
	
	gosub startskill Perception
		
collect:
	if (($zoneid = 123) && ($1 < 5) && ($roomid != 89) && ($roomid != 262)) then
	{
		if "$guild" = "mage" then
		{
			gosub fissurecheck
			return
		}
		gosub quickspelltrain
		gosub pause 1
		return
	}
	var percepexp %globalexp
	gosub ppcheck
	if %collect_count = 0 then var collect_max $1
	if %collect_max > 4 then
	{
		gosub cyclic_check
		gosub quickspelltrain	
	}
	if %collect_count < %collect_max then
		{
			math collect_count add 1
			if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
			if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
			gosub put.1 "collect %collect" "^Roundtime:"
			if contains("$roomobjs", "pile of %collect") then gosub put kick %collect
			if (($Outdoorsmanship.LearningRate > %percepexp) && ($Perception.LearningRate > %percepexp)) then goto collect.end
		}
	else goto collect.end
	goto collect
collect.end:
	if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
	if contains("$roomobjs", "pile of") then gosub put kick pile
	gosub endskill Perception
	var collect_count 0
return

swimnow:
	gosub move 130
	gosub startskill Athletics
	gosub heavy.remove
	#gosub reveal
	gosub castbuff "Ethereal Fissure" 15 15 20
swim.loop:
	if $Athletics.LearningRate < 34 then
	{
		#if (("$guild" = "Necromancer") && ($invisible = 0)) then gosub eotb 20 20
		#if $Primary_Magic.LearningRate < 34 then gosub castbuff pfe 5 5
		#if $Primary_Magic.LearningRate < 34 then gosub castbuff pfe 5 5
		#if $spelltime > 20 then gosub castrequest
		gosub ppcheck
		gosub walk nw
		gosub stamcheck
		gosub walk se
		if "%Fissure" = "off" then gosub castbuff "Ethereal Fissure" 15 15 21
		if "%Sure" = "off" then gosub castbuff "Sure Footing" 5 25 21
		if "%Ease" = "off" then gosub castbuff "Ease Burden" 5 25 21
		if "$guild" = "mage" then gosub magetrain
		gosub stamcheck
		goto swim.loop
	}
swimnow.exit:
	gosub endskill Athletics
	gosub heavy.wear
	gosub release
return

shardclimb:
	gosub move 31
	gosub startskill Athletics
	var resonance climbing
	var climbnow 1
	
	action var climbnow 1 when ^You finish practicing|^You stop practicing
	action var climbnow 0 when ^You begin to practice
	
	gosub put.1 "get flint" "^You get"
	gosub put.1 "get rope" "^You get"
	gosub cyclic_check
shardclimb.loop:
	if $Athletics.LearningRate > 33 then goto shardclimb.exit
	gosub move 42
	put #var last.climb $gametime
	gosub put.1 "climb wall" "^Roundtime"
	gosub move 48
	gosub put.1 "climb wall" "^Roundtime"
	gosub move 31
	gosub put.1 "climb wall" "^Roundtime"
	if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
	gosub release eotb
	gosub put.1 "hide" "^Roundtime"
shardpractice.loop:
	if $Athletics.LearningRate > 33 then goto shardclimb.exit
	if %climbnow = 1 then gosub put.1 "climb practice wall" "^You begin"
	evalmath climbtemp ($gametime - $last.climb)
	delay 1
	if %climbtemp < 80 then goto shardpractice.loop
	if %climbnow = 0 then waitforre ^You continue|^You finish
	gosub put.1 "stop climb" "^You stop"
	gosub unhide
	goto shardclimb.loop
shardclimb.exit:
	action remove ^You finish practicing|^You stop practicing
	action remove ^You begin to practice
	gosub put.1 "stop climb" "^You stop"
	gosub unhide
	gosub endskill Athletics
	gosub emptyhands
	return

bloodclimb:
	gosub startskill Athletics
	var resonance climbing
	if "%Sure" = "off" then gosub castbuff "Sure Footing" 5 20 21
bloodclimb.loop:
	if $Athletics.LearningRate > 33 then goto bloodclimb.exit
	put #var last.climb $gametime
	gosub magetrain
	gosub move 370
	gosub move 369
	gosub move 367
	gosub move 368
	gosub move 365
	gosub move 366
	gosub move 363
	gosub move 364
	gosub move 179
	gosub magetrain
	evalmath climbtemp ($gametime - $last.climb)
	evalmath climbtemp1 (50 - %climbtemp)
	if $Athletics.LearningRate > 33 then goto bloodclimb.exit
	if %climbtemp > 80 then goto bloodclimb.loop
		else
		{
			gosub startcollect 2
			delay %climbtemp1
		}
	goto bloodclimb.loop
bloodclimb.exit:
	gosub endskill Athletics
	gosub emptyhands
	if "$preparedspell" = "Sure Footing" then gosub spelldelay
	gosub release
	return

velaclimb:
	gosub startskill Athletics
	var resonance climbing
	if "%Sure" = "off" then 
	{
		gosub castbuff "Sure Footing" 20 35 21
		gosub spelldelay
	}
	gosub cyclic_check
velaclimb.loop:
	if $spelltime > 21 then gosub castrequest
	if "$guild" = "mage" then gosub aethercheck
	if $Athletics.LearningRate > 33 then goto velaclimb.exit
	put #var last.climb $gametime
	gosub move 370
	gosub move 346
	if $spelltime > 21 then gosub castrequest
	if "$guild" = "mage" then gosub aethercheck
	evalmath climbtemp ($gametime - $last.climb)
	evalmath climbtemp1 (60 - %climbtemp)
	if $Athletics.LearningRate > 33 then goto velaclimb.exit
	if %climbtemp > 60 then goto velaclimb.loop
		else
		{
			gosub startcollect 3
			evalmath climbtemp1 (%climbtemp1 - 45)
			gosub pause %climbtemp1
		}
	goto velaclimb.loop
velaclimb.exit:
	gosub move 346
	gosub endskill Athletics
	gosub emptyhands
	if "$preparedspell" != "None" then gosub spelldelay
	gosub release spell
	var resonance
	
	return
	
latamiclimb:
	gosub startskill Athletics
	var resonance climbing
	if "%Sure" = "off" then 
	{
		gosub castbuff "Sure Footing" 20 35 21
		gosub spelldelay
	}
	gosub cyclic_check
latamiclimb.loop:
	if $spelltime > 21 then gosub castrequest
	if "$guild" = "mage" then gosub aethercheck
	if $Athletics.LearningRate > 33 then goto latamiclimb.exit
	put #var last.climb $gametime
	gosub move 59
	gosub move 10
	if $spelltime > 21 then gosub castrequest
	if "$guild" = "mage" then gosub aethercheck
	evalmath climbtemp ($gametime - $last.climb)
	evalmath climbtemp1 (60 - %climbtemp)
	if $Athletics.LearningRate > 33 then goto latamiclimb.exit
	if %climbtemp > 60 then goto latamiclimb.loop
		else
		{
			gosub startcollect 3
			evalmath climbtemp1 (%climbtemp1 - 45)
			gosub pause %climbtemp1
		}
	goto latamiclimb.loop
latamiclimb.exit:
	gosub endskill Athletics
	gosub emptyhands
	if "$preparedspell" != "None" then gosub spelldelay
	gosub release
	var resonance
	
	return
	
rathaswim:
	gosub startskill Swimming
	gosub move 553
	gosub armor.remove
rathaswim.loop:
	if $Swimming.LearningRate > 33 then goto rathaswimexit
upside:
	gosub roundtimedone
	matchre upside %rtwait
	match downside The current drags you down
	match goindown Some light filters down from above
	match upside but can't seem to make much headway
	match upside but can't get anywhere
	match upside You slap at the water
	match downside A rock protrudes
	match orient You can't do that while lying down
	match orient You can't swim in that direction
	match orient You continue to hum
	match orient You can't go
	put down
	matchwait

goindown:
	gosub roundtimedone
	matchre goindown %rtwait
	match downside The current drags you down
	match downside You swim down
	match goindown but can't seem to make much headway
	match goindown but can't get anywhere
	match goindown You slap at the water
	match downside A rock protrudes
	match orient You can't do that while lying down
	match orient You can't swim in that direction
	match orient You continue
	match orient You can't go
	put down
	matchwait

downside:
	gosub roundtimedone
	matchre downside %rtwait
	match goinup You swim up
	match downside but can't seem to make much headway
	match downside but can't get anywhere
	match downside You slap at the water
	match orient You can't do that while lying down
	match orient You can't swim in that direction
	match orient You continue
	match orient You can't go
	put up
	matchwait

goinup:
	gosub roundtimedone
	matchre goinup %rtwait
	match downside The current drags you down
	match rathaswim.loop The water is cold and salty
	match goinup but can't seem to make much headway
	match goinup but can't get anywhere
	match goinup You slap at the water
	match downside A rock protrudes
	match orient You can't do that while lying down
	match orient You can't swim in that direction
	match orient You continue to
	match orient You can't go
	put up
	matchwait

orient:
	matchre orient %rtwait
	match upside The water is cold and salty, and deep
	match goinup Some light filters down from above
	match downside A rock protrudes
	put stand
	put look
	matchwait
	
rathaswimexit:	
	gosub endskill Swimming
	gosub armor.wear
return

		
		
crossclimb:
## ** Kraest Cross Climb	
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
				if (("$guild" = "Necromancer") && ($invisible = 0)) then gosub eotb
				if ($standing != 1) then gosub put.1 "dance silly" "^You leap"
				gosub roundtimedone
                var ClimbReturn -1
                return
        Climb.Succeed:
				if (("$guild" = "Necromancer") && ($invisible = 0)) then gosub eotb
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
                action instant goto Script.End when eval $Climbing.LearningRate=%globalexp
        
#---------------------------------------
# SCRIPT START
#---------------------------------------
                ## hum start
				gosub splay
				gosub splay
		Start:
				#gosub m.inputardcast Lilt
				gosub move 160
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
        
				gosub move 133
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
				action var DUMMMY when eval $Climbing.LearningRate=34
				gosub pause 1
				gosub clear
				var resonance
				var adjust 1
				var bardrecast 1
        		goto climbend

climbpractice:
	var resonance climbing
	var practice 1
	var stoppractice 0
	var climb.object $0
	
	action var practice 1 when ^You finish practicing
	action var stoppractice 1 when eval $Athletics.LearningRate > %globalexp
	
	gosub startskill Athletics
	
climbpractice.loop:
	if %practice = 1 then 
	{	
		var practice 0
		gosub put.1 "climb practice %climb.object" "^You begin|^You should"
	}
		else
		{
			gosub pause 5
			if %stoppractice = 1 then goto stopclimb
		}
	goto climbpractice.loop
stopclimb:
	var resonance
	
	action remove ^You finish practicing
	action remove eval $Athletics.LearningRate = %globalexp
	
	gosub put.1 "stop climb" "^You stop|^You weren't"
	gosub endskill Athletics
return
	

magicend:
echo Climb training done.
put #parse climbpractice.cmd done.
exit
				
pmtrain:
	if "%Aus" = "off" then gosub aus
	if "%Seer" = "off" then gosub seer
	gosub prep $1 $2
	gosub ppcheck
	if $mana < 97 then gosub manacheck
pm.spelltimecheck:
	if $spelltime > $3 then gosub cast
		elseif $spelltime < $3 then
		{
			delay 1
			if $spelltime = 0 then gosub prep $1 $2
			goto pm.spelltimecheck
		}
	if $Primary_Magic.LearningRate > %globalexp then goto return
	goto pmtrain
return	
				
pmtrain.combat:
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
	 else goto pmtrain.combat

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

throwcheck:
	var throwcheck 1
	if contains("$roomobjs", "throwing hammer") then 
		{
			gosub put.1 "stow ham" "^You put|^Stow"
			goto throwcheck
		}
	if contains("$roomobjs", "lush green prayer mat") then 
		{
			gosub emptyhands
			gosub put.1 "roll mat" "^You carefully" 
			gosub put.1 "stow mat" "^You put|^Stow"
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
	var throwcheck 0
	var tempthrown 0
	#action remove eval %tempthrown = 2
	#action remove ^You put your steelstar in
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

tendwound:
	var tending 1
	if "%resonance" = "climbing" then
	{	
		
	}
	if "$charactername" = "Keldus" then
	{
		gosub put.1 "tend my right leg" "^Roundtime|^That area|^Doing your best|too injured for you to"
		gosub put.1 "tend my abdomen" "^Roundtime|^That area|^Doing your best|too injured for you to"
		#gosub put.1 "tend my right hand" "^Roundtime|^That area|^Doing your best|too injured for you to"
		#gosub put.1 "tend my left hand" "^Roundtime|^That area|^Doing your best|too injured for you to"
	}
	if "$charactername" = "Stoh" then
	{
		gosub put.1 "tend my chest" "^Roundtime|^That area|^Doing your best|too injured for you to"
		gosub put.1 "tend my back" "^Roundtime|^That area|^Doing your best|too injured for you to"
	}
	if "$charactername" = "Corav" then
	{
		gosub put.1 "tend my left hand" "^Roundtime|^That area|^Doing your best|too injured for you to"		
	}

return

start.magiclearn:
	var cycliccast 0
	var releasetrain 1
	
	put #var magic.start $gametime
	
	if "$guild" = "mage" then 
	{
		gosub castbuff "Steps of Vuan" 10 10 10
		gosub spelldelay
		gosub m.inputlock
	}
magiclearn.loop:
	evalmath magictemp ($gametime - $magic.start)
	echo %magictemp seconds training.
	if %magictemp > 1200 then goto magiclearn.exit
	
	if (("$charactername" = "Vayek") && ($Utility.LearningRate > %globalexp) && ($Augmentation.LearningRate > %globalexp) && ($Debilitation.LearningRate > %globalexp) && ($Sorcery.LearningRate > %globalexp)) then goto magiclearn.exit
	#if (("$charactername" = "Vayek") && ($Utility.LearningRate > %globalexp) && ($Augmentation.LearningRate > %globalexp) && (($Sorcery.LearningRate > %globalexp)) then goto magiclearn.exit
	if (("$charactername" = "Corav") && ($Debilitation.LearningRate > %globalexp) && ($Sorcery.LearningRate > %globalexp)) then goto magiclearn.exit
	if (("$charactername" = "Keldus") && ($Warding.LearningRate > %globalexp) && ($Augmentation.LearningRate > %globalexp) && ($Debilitation.LearningRate > %globalexp) && ($Sorcery.LearningRate > %globalexp)) then goto magiclearn.exit
	if (("$charactername" = "Stoh") && ($Arcana.LearningRate > %globalexp) && ($Warding.LearningRate > %globalexp) && ($Utility.LearningRate > %globalexp) && ($Sorcery.LearningRate > %globalexp)) then goto magiclearn.exit
	if "$guild" = "Necromancer" then
	{
		if "%Philosopher" = "off" then gosub castbuff "Philosopher's Preservation" 10 35 20
		if "%Calcified" = "off" then gosub castbuff "Calcified Hide" 15 25 20
		if "%Kura" = "off" then gosub castbuff Kura-Silma 15 35 20
	}
	if "$guild" = "cleric" then gosub m.inputuffcheck
	if "$guild" = "moon" then
	{
		if "%Aura" = "off" then
		{
		gosub castbuff "Aura Sight" 30 105 20
		gosub spelldelay
		gosub release
		}
	}
	if $monstercount > 0 then gosub spelltrain Debilitation
	if "$charactername" = "Stoh" then
	{
		gosub spelltrain Utility
		gosub spelltrain Warding
		gosub spelltrain Sorcery
	}
	if "$charactername" = "Keldus" then
	{
		gosub spelltrain Warding
		gosub spelltrain Augmentation
		gosub spelltrain Sorcery
	}
	if "$charactername" = "Vayek" then
	{
		gosub cyclic_check
		gosub spelltrain Augmentation
		gosub spelltrain Utility
		gosub spelltrain Sorcery
	}
	
	gosub pause 1
	gosub ppcheck
	goto magiclearn.loop

magiclearn.exit:
	var releasetrain 0
	gosub release spell
return

sorcerylearn:
	gosub emptyhands
	gosub put.1 "get axi rune" "^You get"
	gosub swap
	gosub m.inputlock
	
sorcery.loop:
	gosub m.inputuffcheck
	gosub put.1 "focus my rune" "^Roundtime"
	gosub quickspelltrain
	if $Sorcery.LearningRate < 33 then goto sorcery.loop
	
	gosub emptyhands
	gosub m.inputlock
	return

sortmagic:
	if "$charactername" = "Vayek" then
	{
		gosub pause 1
		return
	}
	var castcamb 0
	var harness_spell 1
	var releasetrain 1
	var skills Utility|Warding|Sorcery
	var count 3
	gosub sortskill "%skills" %count

	if $%sort(0).LearningRate > 33 then
	{
		gosub pause 1
		return
	}
	#if (("$righthandnoun" = "") && ("$lefthandnoun" = "")) then
	#{
	#	if $Sorcery.LearningRate < 34 then if "%sort(0)" = "Sorcery" then gosub castbuff "%Sorcery(0)" %Sorcery(1) %Sorcery(2) %Sorcery(3)
	#}
	#	else
	#	{
	#		if "%sort(0)" = "Sorcery" then eval sort replace("%sort", "Sorcery|", "")
	#	}
	if $Sorcery.LearningRate < 34 then if "%sort(0)" = "Sorcery" then gosub castbuff "%Sorcery(0)" %Sorcery(1) %Sorcery(2) %Sorcery(3)
	if $Utility.LearningRate < 34 then if "%sort(0)" = "Utility" then gosub castbuff "%Utility(0)" %Utility(1) %Utility(2) %Utility(3)
	#if $Augmentation.LearningRate < 34 then if "%sort(0)" = "Augmentation" then gosub castbuff "%Augmentation(0)" %Augmentation(1) %Augmentation(2) %Augmentation(3)
	if $Warding.LearningRate < 34 then if "%sort(0)" = "Warding" then gosub castbuff "%Warding(0)" %Warding(1) %Warding(2) %Warding(3)
	if $spelltime > 25 then gosub castrequest 1 1 1 1
	gosub pause 1
	var releasetrain 0
	var castcamb 1
	var harness_spell 0
return

quickarcana:
	if "$preparedspell" != "None" then
	{
		delay 1
		return
	}
	var targetspells Energy Bolt|Acid Splash|Fist of Faenella|Divine Radiance|Siphon Vitality
	var arcanaspells Ease Burden|Seal of Deflection|Protection from Evil
	if $mana < %lowmana then return
	if "$charactername" = "Stoh" then put #var train.start $gametime
	gosub startskill Arcana
	
	if "$charactername" = "Keldus" then var camb armband
	if "$charactername" = "Vayek" then var camb medallion
	if "$charactername" = "Stoh" then var camb orb
	var esloop 0
	
	action var chargeagain 1 when Try though you may, you find yourself unable to charge
	action var esloop 0 when ^The ethereal shield surrounding you shimmers slightly, but the extra cast doesn't do much good.
	action var full.c 1 when is already holding as much power|energy while the rest dissipates harmlessly
	
	if "%Aura" = "off" then gosub aus
	if (("$righthandnoun" != "%camb") && ("$righthandnoun" != "")) then gosub stow right
	if (("$lefthandnoun" != "%camb") && ("$lefthandnoun" != "")) then gosub stow left
	
quickarcana.loop:
	evalmath traintemp ($gametime - $train.start)
	echo %traintemp seconds training.
	#if %traintemp > 1200 then goto quickarcanaexit
	
	gosub ppcheck
	if (("$righthandnoun" != "%camb") && ("$lefthandnoun" != "%camb")) then gosub put.1 "rem %camb" "%wear.msg"
	if (("$righthandnoun" != "%camb") && ("$lefthandnoun" != "%camb")) then gosub get my %camb
	#if $Primary_Magic.LearningRate > %globalexp then goto quickarcanaexit
	if ("$preparedspell" = "None") then 
		{
			if "$charactername" = "Keldus" then
			{
				if $Primary_Magic.LearningRate < 25 then gosub prep ease 4
					else gosub prep ease 4
			}
			if "$charactername" = "Vayek" then
			{
				if $Primary_Magic.LearningRate <= %globalexp then gosub prep pfe 4
					else gosub prep ease 4
			}
			if "$charactername" = "Stoh" then
			{
				if $Primary_Magic.LearningRate < 20 then gosub prep sod 10
					else gosub prep ease 7
			}
		}
			elseif matchre("$preparedspell", "%targetspells") then
			{
				gosub put release
				if $Primary_Magic.LearningRate < 25 then gosub prep ease 4
					else gosub prep ease 4
			}
	if %full.c = 1 then goto quickfocus
	if "$charactername" = "Keldus" then
	{	
		if "$preparedspell" = "Calcified Hide" then if %cambcycle = 1 then goto quickfocus
		if "$preparedspell" = "Philosopher's Preservation" then if %cambcycle = 1 then goto quickfocus
		if ((%cambcycle = 4) && ($Arcana.LearningRate < 20)) then goto quickfocus
			elseif %cambcycle = 2 then goto quickfocus
	}
	if "$charactername" = "Stoh" then
	{
		if "$preparedspell" = "Seal of Deflection" then if %cambcycle = 2 then goto quickfocus
		if "$preparedspell" = "Ease Burden" then if %cambcycle = 4 then goto quickfocus
	}
	if "$charactername" = "Vayek" then
	{
		if "$preparedspell" = "Protection from Evil" then if %cambcycle = 2 then goto quickfocus
		if "$preparedspell" = "Ease Burden" then if %cambcycle = 6 then goto quickfocus
	}
1chargeagain:
	var chargeagain 0
	if "$charactername" = "Keldus" then gosub put.1 "charge my %camb 4" "^Roundtime|^Try though"
	if "$charactername" = "Vayek" then gosub put.1 "charge my %camb 6" "^Roundtime|^Try though"
	if "$charactername" = "Stoh" then gosub put.1 "charge my %camb 16" "^Roundtime|^Try though"
	if %chargeagain = 1 then goto 1chargeagain
	math cambcycle add 1
#	if $mana < 90 then var full.c 1
	gosub roundtimedone
	goto quickarcana.loop
quickfocus:
	action var focusagain 1 when Try though you may, you find yourself unable to focus
	if $Primary_Magic.LearningRate < 20 then
	{
		if "$charactername" = "Keldus" then gosub put.1 "harness 4" "^Roundtime"
	}
	var focus 0
	var full.c 0
	var cambcycle 0
1focusagain:
	var focusagain 0
	gosub put.1 "focus my %camb" "^Roundtime|^Your link|^Try though"
	if %focusagain = 1 then goto 1focusagain
	if !matchre("$preparedspell", "%arcanaspells") then if $spelltime < 20 then delay 5
	gosub cast
	if "$charactername" != "Vayek" then gosub manacheck
	if "$charactername" = "Stoh" then if $Arcana.LearningRate > %globalexp then goto quickarcanaexit
	if "%Aura" = "off" then gosub aus
	if "$charactername" = "Keldus" then return
	if "$charactername" = "Vayek" then return
	goto quickarcana.loop
return	

quickarcanaexit:
	action remove ^Try though you may, you find yourself unable to charge
	action remove ^The ethereal shield surrounding you shimmers slightly, but the extra cast doesn't do much good.
	action remove is already holding as much power|energy while the rest dissipates harmlessly
	action remove Try though you may, you find yourself unable to focus
	
	var esloop 1
	
	gosub endskill Arcana
	gosub emptyhands
	
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
	if "%Aura" = "off" then gosub aus
	gosub ppcheck
	counter set 5
arcanaloop:
	if $Arcana.LearningRate > %globalexp then
		{
			gosub release
	 		gosub put stow %camb
	 		return
	 	}
	if $monstercount > %maxcreature then 
		{
			gosub emptyhands
			gosub killthrown
			gosub throwcheck
			gosub release
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

repairall:
	var repairdone 0
	action var repairdone 1 when You recall that the repairs should be ready by now
	
	if $zoneid = 116 then gosub goto repair
	if $zoneid = 116 then 
	{
		gosub put.1 "ask ladar about repair all" "^Ladar"
		gosub put.1 "ask ladar about repair all" "^You hand"
		gosub put.1 "go arch" "^Obvious"
	}
repaircollect:
	gosub put.1 "collect rock" "^Roundtime"
	gosub put.1 "kick pile" "^You take"
	gosub put.1 "read tick" "^Looking at"
	if %repairdone = 0 then goto repaircollect
	
	gosub goto repair
	gosub put.1 "give tick to ladar" "^You hand"
	gosub heavy.wear
	gosub put.2 "get my stick" "wear my stick" "^You strap"
	action var dropsack 1 when ^There is nothing
	var dropsack 0
	gosub put.1 "look in my large sack" "^There is nothing"
	if %dropsack = 1 then gosub put.1 "drop sack" "^You drop"
	
	action remove ^There is nothing
	action remove You recall that the repairs should be ready
	return
		

## **************
## ** CLERIC STUFF
## **************

badgecheck:
	if "%resonance" != "" then return
	evalmath badgetemp ($gametime - $last.badge)
	## ** 120 minute timer
	if %badgetemp < 7200 then return
	var clericswitch 1
	put #var last.badge $gametime
	gosub put.1 "remove badge" "^You take off"
	if (("$righthandnoun" != "badge") && ("$lefthandnoun" != "badge")) then gosub get my badge
	gosub put.1 "pray badge" "^Roundtime"
	gosub put.1 "wear badge" "^You put"
	var clericswitch 0
return

praycheck:
	evalmath praytemp ($gametime - $last.pray)
	## ** 10 minute timer
	if %praytemp < 600 then return
	put #var last.pray $gametime
	var clericswitch 1
	gosub put.1 "pray peri'el" "^Roundtime|^Aligning your thoughts"
	var clericswitch 0
return

praymatcheck:
	if "%resonance" != "" then return
	evalmath praymattemp ($gametime - $last.praymat)
	## ** 10 minute timer
	if %praymattemp < 600 then return
	if (("$righthand" != "Empty") || ("$lefthand" != "Empty")) then return
	put #var last.praymat $gametime
	var clericswitch 1
	gosub get mat
	gosub put.1 "unroll mat" "^You reverently"
	gosub put.1 "kneel" "^You kneel"
	gosub put.1 "kiss mat" "^You bend forward"
praystand:	
	gosub put.1 "stand" "^You stand"
	if $standing != 1 then goto praystand
	gosub put.1 "dance mat" "^You begin"
	gosub put.1 "dance mat" "^Your actions"
	gosub put.1 "dance mat" "^Your dance reaches"
	gosub put.1 "roll mat" "^You carefully"
	gosub stow mat
	var clericswitch 0
return

ritualaltar:
	gosub put.1 "dance" "^You begin"
	gosub put.1 "dance" "^Your actions"
	gosub put.1 "dance" "^Your dance reaches"
	#gosub put.1 "kneel" "^You kneel"
	#gosub put.1 "remove chain" "^You remove"
	#gosub put.1 "meditate chain" "^You clutch"
	gosub get jar
	gosub put.1 "clean altar with holy water" "^You begin to wash|^But the"
	gosub pause 10
	gosub stow jar
	gosub put.1 "recite Phelim, give me strength for my righteous vengeance\;Chadatru, guide my sword to swing in justice\;Everild, give me the power to conquer my enemies\;Truffenyi, let me not lose sight of compassion and mercy\;Else, I will become like those I despise\;Urrem'tier, receive into your fetid grasp these wicked souls\;May the Tamsine's realms never know their evil ways again\;" "^You sense"
	return
	match ritualaltarexit A wood lion bead suddenly explodes
	matchwait 75
	put #echo >log Green Out of beads!
ritualaltarexit:
	gosub put.1 "wear chain" "^You attach"
	gosub put.1 "stand" "^You stand"
	return
	
## **************
## ** NECRO STUFF
## **************

ritual:
	gosub emptyhands
	if ("%dokill" = "skinning") then
	{
		var doritual $Thanatology.LearningRate
		math doritual add 5
		if %doritual > 33 then var doritual 33
		if ($Skinning.LearningRate > %doritual) then var doarise 1
	}
	if ("%dokill" = "arise") then
		{
			var doskin $Skinning.LearningRate
			math doskin add 5
			if %doskin > 33 then var doskin 33
			if %doskin < $Thanatology.LearningRate then var doarise 0
		}
	if %doarise = 1 then
	{	
		var arise 1
		var dokill arise
		if "$roomplayers" = "" then gosub put.1 "perform %ritual on $0" "^%ritual.msg"
		if "$roomplayers" = "" then gosub put.1 "perform arise on $0" "^%ritual.msg"
	} 
		else if %doarise = 0 then
		{
			var arise 0
			var dokill skinning
			if "$roomplayers" = "" then gosub put.1 "perform %ritual on $0" "^%ritual.msg"
		}
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
	var clericswitch 1
	pause 0.1
	if %play.instr = 0 then return
	if (("$lefthandnoun" = "crossbow") || ("$righthandnoun" = "crossbow")) then gosub put.1 "wear crossbow" "%wear.msg"
	if (("$lefthandnoun" = "staff") || ("$righthandnoun" = "staff")) then gosub put.1 "wear staff" "%wear.msg"
	if (("$lefthandnoun" = "scythe") || ("$righthandnoun" = "scythe")) then gosub put.1 "wear scythe" "%wear.msg"
	if (("$lefthandnoun" = "shield") || ("$righthandnoun" = "shield")) then gosub put.1 "wear shield" "%wear.msg"
	if contains("$lefthandnoun", "dirt") then gosub put drop my dirt
	if contains("$righthandnoun", "dirt") then gosub put drop my dirt
	if contains("$lefthandnoun", "vine") then gosub put drop my vine
	if contains("$righthandnoun", "vine") then gosub put drop my vine
	if contains("$lefthandnoun", "paper") then gosub put drop my paper
	if contains("$lefthandnoun", "%braid") then gosub put drop my %braid
	if contains("$righthandnoun", "%braid") then gosub put drop my %braid
	if contains("$lefthandnoun", "%rope") then gosub put drop my %braid
	if contains("$righthandnoun", "%rope") then gosub put drop my %braid
	if contains("$lefthandnoun", "limb") then gosub put drop my limb
	if contains("$righthandnoun", "limb") then gosub put drop my limb
	if contains("$lefthandnoun", "bead") then gosub put drop my bead
	if contains("$righthandnoun", "bead") then gosub put drop my bead
	if contains("$lefthandnoun", "block") then gosub put drop my block
	if contains("$righthandnoun", "block") then gosub put drop my block
	if "$lefthand" != "Empty" then gosub stow left
	if "$righthand" != "Empty" then gosub stow right
	if "$lefthand" != "Empty" then gosub put.1 "drop left" "^You drop"
	if "$righthand" != "Empty" then gosub put.1 "drop right" "^You drop"
	var clericswitch 0
	return

checktime:
	var checktime 0
	#12:24:24 AM
	eval timenow replacere("$time", ":", "|")
	eval timenow replacere("%timenow", " AM", "|AM")
	eval timenow replacere("%timenow", " PM", "|PM")
	#put #echo It's %timenow(0) %timenow(3)
	if "$charactername" = "Stoh" then
	{
		if (((%timenow(0) = 03) && ($connected = 1) && ("%timenow(3)" = "AM") &&  ("%train_now" != "forging")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	if "$charactername" = "Corav" then
	{
		if (((%timenow(0) = 01) && ($connected = 1) && ("%timenow(3)" = "AM")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	if "$charactername" = "Rhaec" then
	{
		if (((%timenow(0) = 99) && ($connected = 1) && ("%timenow(3)" = "AM")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	if "$charactername" = "Keldus" then
	{
		if (((%timenow(0) = 99) && ($connected = 1) && ("%timenow(3)" = "AM") && ("%resonance" != "stealing")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	if "$charactername" = "Vayek" then
	{
		if (((%timenow(0) = 01) && ($connected = 1) && ("%timenow(3)" = "AM") && ("%resonance" != "stealing")) || ($QUITNOW = 1)) then
		{
			var resonance runhide
			goto quittime
		}
	}
	var checktime 1
return

playtime:
	var checktime 0
	eval timenow replacere("$time", ":", "|")
	eval timenow replacere("%timenow", " AM", "|AM")
	eval timenow replacere("%timenow", " PM", "|PM")
	if "$charactername" = "Stoh" then
	{
		if ((%timenow(0) = 11) && ($connected = 0) && ("%timenow(3)" = "AM")) then
		{		
			delay 15
			gosub clear
			var resonance ""
			put #connect
		}
		else
		{
			delay 100
			goto playtime
		}
	}
	if "$charactername" = "Corav" then
	{
		if ((%timenow(0) = 09) && ($connected = 0) && ("%timenow(3)" = "AM")) then
		{		
			delay 15
			gosub clear
			var resonance ""
			put #connect
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
	if "$charactername" = "Keldus" then
	{
		if ((%timenow(0) = 10) && ($connected = 0) && ("%timenow(3)" = "AM")) then
		{		
			delay 15
			gosub clear
			var resonance ""
			put #connect
			waitfor You are .+ Keldus
			send .keldustrain
		}
			else
			{
				delay 100
				goto playtime
			}
	}
	if "$charactername" = "Vayek" then
	{
		if ((%timenow(0) = 09) && ($connected = 0) && ("%timenow(3)" = "AM")) then
		{		
			delay 15
			gosub clear
			var resonance ""
			put #connect
		}
		else
		{
			delay 100
			goto playtime
		}
	}
exit

quittime:
	#gosub killthrown
	gosub throwcheck
	#gosub pyramid get
	gosub clear
	gosub release shear
	gosub put.1 "stop climb" ".+"
	gosub flee
	gosub returnhome
	gosub move %saferoom
	gosub emptyhands
	gosub clear
	var stealexit 1
	var stealexit.timer $gametime
	evalmath stealtemp ($gametime - $last.steal)
	evalmath stealtemp (%stealtemp / 60)
	evalmath stealtemp round(%stealtemp, 2)
	evalmath stealecho (60 - %stealtemp)
	echo %stealecho minutes until steal timer is up.
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
	put #flash
	action clear
	var exitnow 1
	gosub clear
	gosub emptyhands
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
	put #flash
	action clear
	var exitnow 1
	gosub clear
	gosub emptyhands
	gosub throwcheck
	gosub pyramid get
	pause 20
	if dead then put exit
	pause 2
	if dead then put exit
	pause 20
exitquick:
	put #script abort automapper
	put #flash
	put #beep
	put #beep
	action clear
	var exitnow 1
	gosub emptyhands
	gosub clear
	gosub throwcheck
	gosub pyramid get
	#config connect False
	put exit
	pause 2
	put exit
	exit

include RoutineGMcheck.cmd
include routinemagic.cmd