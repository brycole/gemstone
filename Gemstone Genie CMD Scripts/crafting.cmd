#debuglevel 10

gosub routinecommon
gosub routinemoonbuffs

action var forgeshort $1 When Forge long: .+ (\w+)

## This needs to be whatever your book is...
var craft %1

## Change this to yes or no to toggle appraisal and analyze when you are done.
var endExamine yes

## Change this to no to skip examine when doing work orders to save time.
var woExamine no

## Set up your ingot storage bag for things that are too small...
## Note, make this different from your iDefault so it doesn't grab the same ingot over and over.. and over.. and over...
var iStorage bag

## Variable for the bag you normally keep your ingots.
var iDefault haver

## Turns off looping and bundling when set to no.
var workOrders no

## Uncomment the next line to override the makers mark.
#var doMark yes

## Turns Deeding on/off for work orders only.
var doDeed no

## Makes the script skip most of the echos.
var be.Quiet no

craft.loop:
## Leave these alone.
var item
var item1
var assemble no
var assemble2 no
var asmCount1 0
var asmCount2 0
var iSize 0
var iCount 0
var repeat
var iCompare no
var pliers no
var grind 1
var smallingot 0
var train_now forging
var master Juln

var totalCount 0
var craftedCount 0

## *** Main crafting loop
	#gosub emptyhands
	var ingotcount 0

	if "%1" = "solo" then goto solostart

	action math ingotcount add 1 when ^You see nothing unusual
	gosub put.1 "look my tin ingot" "^You see|^I could not find"
	action remove ^You see nothing unusual

	if %ingotcount = 0 then
	{
		send .smelt
		waitfor Smelting done
		var keywords set 0
		gosub emptyhands
	}
solostart:
	gosub findanvil


## ***

	if_2
	{
		var workOrders %2
		echo setting workOrders to: %workOrders
	}

	if_3
	{
		var repeat yes
		var totalCount %3
		Echo Repeating %totalCount times!
	}
	else echo Crafting book set to script default: %craft

var counter

if "%workOrders" = "yes" then Echo *** WARNING! YOU ARE DOING WORK ORDERS!
if "%workOrders" = "no" then Echo *** WARNING! YOU ARE NOT DOING WORK ORDERS!

## ** Assemble actions
	 action (book) var assemble $2 $3; var asmCount1 $1 when .*(\d).* (long|short) wooden (pole)$
	 action (book) var assemble $2; var asmCount1 $1 when .*(\d).* metal shield (handle)$
	 action (book) var assemble $2; var asmCount1 $1 when .*(\d).* wooden (hilt|haft)$
	 action (book) var assemble $2 $3; var asmCount1 $1 when .*(\d).* (large) cloth (padding)$
	 action (book) var assemble $2 $3; var asmCount1 $1 when .*(\d).* (large) leather (backing)$
	 action (book) var assemble2 $2 $3; var asmCount2 $1 when .*(\d).* (small) cloth (padding)$
	 action (book) var assemble2 $2 $3; var asmCount2 $1 when .*(\d).* (small) leather (backing)$
 	 action (book) var assemble2 $2 $3; var asmCount2 $1 when .*(\d).* (long|short) leather (cord)$

## ** Study book actions
	action (book) var iSize $1 when ingot\W\((.+)\Wvolume\W$
	action (book) var item1 $1 when crafting (.+)\S*    =-$
	action (book) var item $1 when ([\w]+)    =-$

## Logbook repeat actions.
action (log) var repeat yes; var iCount $1 when You must bundle and deliver (\d) more within the next (\d*) roisaen\.$
action (log) var iCompare $1 when craft (.*)\.  You

## Forge actions. Ahh the messyness!
action (forge) var tool bellows when ^As you finish working the fire dims and produces less heat from the stifled coals\.|^As you finish the fire flickers and is unable to consume its fuel\.
action (forge) var tool tongs when would benefit from some soft reworking\.$|^The .+ could use some straightening along the horn of the anvil\.|^The .+ must be drawn into wire on a mandrel and placed in mold sets using tongs\.|^The .+ now looks ready to be turned into wire using a mandrel or mold set\.|TURN it with the tongs to perform these tasks\.$|^The metal must be transfered to plate molds
action (forge) var tool shovel when ^As you complete working the fire dies down and appears to need some more fuel\.|^The fire needs more fuel before you can do that\.|^As you complete working the fire dies down and needs more fuel
action (forge) var tool tub when  ^The .+ is complete and ready for a quench hardening in the slack tub\.|^The metal now appears ready for cooling in the slack tub\.|^ You can PUSH the TUB to reposition it and quench the hot metal\.
action (forge) var tool oil when some oil to preserve and protect it\.$|POUR OIL on .* to complete the forging process\.$
action (forge) var tool analyze when ^That tool does not seem suitable for that task\.|^The .+ now appears ready for grinding
action (forge) var tool hammer when ^push my bellows|with my tongs$|^push fuel with my shovel|appears ready for more pounding with a forging hammer|pounding of the metal |Then you twirl it about a mandrel rod, forming an even spool of glowing hot wire\.$Then you clip the end and set it alongside the forge.  The rest you place inside scale molds deep in the fire\.$|with a forging hammer\.$
action (forge) var tool rehammer when ^The .+ appears ready for pounding the assembled handle onto the metal backing\.
action (forge) var tool grind when PUSH the GRINDSTONE
action (forge) var grind 1 when ^The grindstone begins to lose|the grinding wheel slows down|^The stone wheel slows down|begins to lose momentum
action (forge) var grind 0 when keeping it spinning fast\.$

## Plier stuff. Usually after forging is done. Full those links pull them good!
action (forge) var tool pliers when with the pliers to stitch them together\.$|appear ready for bending using a pair of pliers\.| are now ready for stitching together using pliers.$|Just pull the helm with the pliers to rivet the plates into place and weave the chain together\.$|The individual metal pieces are now ready for riveting together using pliers\.$|Just pull the .* with the pliers to rivet the plates into place and weave the chain together\.$|^Metal links and scales can be woven into place by using pliers to pull them together\.|weaving of links and scales into and around it\.

## When do we assemble stuff? When we see this!
action (forge) var tool assemble when ^\[Ingredients can
## Ok this means we are done...
action (forge) var tool done when ^Applying the final touches, you complete

## Extra ingot left over.
action (forge) var extra yes when ^You realize the .+ will not require as much metal as you have\, and so you split the ingot and leave the portion you won't be using on the ground\.

## Analyze Ingot action for when things are too small... oops!
action (ingot) var smallingot 1 when ^You need a larger volume of metal
action (ingot) var iCompare $1 when (\d*) volume of metal

	action (book) on
	action (log) on
	action (forge) off

	#gosub emptyhands
	goto skiplog
	gosub get my log

readlog:
	matchre chapter.1 This logbook is tracking a work order requiring you to craft (a metal dagger|a metal kythe|a metal carving knife|a metal oben|a metal briquet|a metal koummya|a metal stiletto|a metal rapier|a metal poignard|a metal pasabas|a metal pugio|a metal thrusting blade|a metal short sword|a metal scimitar|a metal katar|a metal sabre|a metal misericorde|a metal hanger|a metal kris|a metal parang|a metal takouba|a metal curlade|a metal jambiya|a metal adze|a metal leaf blade sword|a metal sashqa|a metal telek|a metal mambeli|a metal nehlata|a metal gladius|a metal falcata|a metal baselard|a metal throwing dagger|a light throwing axe|a metal dart|a metal hand axe|a metal foil|a metal hatchet|a metal sunblade|a metal cutlass|a metal kasai|a metal shotel|a metal dao)\.  You must bundle
	matchre chapter.2 This logbook is tracking a work order requiring you to craft (a metal broadsword|a metal namkomba|a metal arzfilt|a metal hunting sword|a metal kudalata|a metal nimsha|a metal spatha|a metal back-sword|a metal longsword|a metal recade|a metal round axe|a metal battle axe|a metal nehdalata|a metal robe sword|a metal condottiere|a metal falchion|a metal cinquedea|a metal schiavona|a metal abassi|a metal hurling axe|a metal dagasse)\.  You must bundle
	matchre chapter.3 This logbook is tracking a work order requiring you to craft (a metal two-handed sword|a metal kaskara|a metal warring axe|a metal shh'oi'ata|a metal marauder blade|a metal greatsword|a metal greataxe|a metal flamberge|a metal claymore|a metal periperiu sword|a metal karambit|a metal double axe|a metal twin-point axe|a metal igorat axe)\.  You must bundle
	matchre chapter.4 This logbook is tracking a work order requiring you to craft (a metal cudgel|a metal bola|a metal prod|a metal cuska|a metal cosh|a metal bulhawf|a metal gavel|a metal komno|a metal bludgeon|a metal hhr'tami|a metal hand mallet|a spiked metal club|a metal scepter|a spiked metal hammer|a metal zubke|a spiked metal mace|a spiked metal gauntlet|a metal marlingspike|a short metal hammer|a metal mace|a metal club|a metal belaying pin|a metal hand mace|a metal war hammer|a ridged metal gauntlet|a metal boomerang|a metal garz|a metal boko|a metal war club|a flanged metal mace|a metal mallet|a metal k'trinni sha-tai|a metal throwing club)\.  You must bundle
	matchre chapter.5 This logbook is tracking a work order requiring you to craft (a metal horseman's flail|a metal morning star|a heavy metal chain|a spiked metal hara|a metal ball and chain|a spiked ball and chain|a metal greathammer|a metal ukabi|a heavy metal mace|a metal throwing hammer|a metal imperial war hammer|a metal throwing mallet|a double-headed hammer|a hurlable war hammer|a metal hara|a metal hhr'ata|a heavy metal mallet|a metal sledgehammer)\.  You must bundle
	matchre chapter.6 This logbook is tracking a work order requiring you to craft (a metal footman's flail|a metal two-headed hammer|a metal akabo|a metal maul|a double-sided ball and chain|a heavy sledgehammer|a metal war mattock|a metal dire mace|a metal vilks kodur|a giant metal mallet)\.  You must bundle
	matchre chapter.7 This logbook is tracking a work order requiring you to craft (a metal javelin|a two-pronged halberd|a light metal spear|a metal khuj|a metal scythe|a metal partisan|a metal bardiche|a metal military fork|a metal lochaber axe|a metal duraka skefne|a metal guisarme|a metal pole axe|a metal halberd|a metal fauchard|a metal tzece|a metal ngalio|a metal coresca|a metal pike|a metal awgravet ava|a metal lance|a metal hunthsleg|a metal spetum|a metal allarh|a metal ranseur|a metal spear|a metal ilglaiks skefne|a metal glaive)\.  You must bundle
	matchre chapter.8 This logbook is tracking a work order requiring you to craft (a metal cane|some metal elbow spikes|a metal nightstick|some metal knee spikes|a metal quarterstaff|some spiked metal knuckles|some metal knuckles|some metal hand claws|a metal pike staff)\.  You must bundle
	matchre chapter.9 This logbook is tracking a work order requiring you to craft (a metal throwing spike|a metal boarding axe|a metal bastard sword|a metal half-handled riste|a metal war sword|a thin-bladed metal fan|a metal broadaxe|a metal riste|a metal bar mace|a thick-bladed metal fan|a metal splitting maul)\.  You must bundle
	matchre completed This work order appears to be complete
	matchre expired This logbook is tracking a work order that has expired
	matchre needwork ^This logbook has been used to complete
	matchre readlog %rtwait
	put read my logbook
	matchwait

chapter.1:
	 var forgelong $1
     var order.chapter 1
     goto chapter.name
chapter.2:
     var forgelong $1
     var order.chapter 2
     goto chapter.name
chapter.3:
     var forgelong $1
     var order.chapter 3
     goto chapter.name
chapter.4:
     var forgelong $1
     var order.chapter 4
     goto chapter.name
chapter.5:
     var forgelong $1
     var order.chapter 5
     goto chapter.name
chapter.6:
     var forgelong $1
     var order.chapter 6
     goto chapter.name
chapter.7:
     var forgelong $1
     var order.chapter 7
     goto chapter.name
chapter.8:
     var forgelong $1
     var order.chapter 8
     goto chapter.name
chapter.9:
     var forgelong $1
     var order.chapter 9
     goto chapter.name
chapter.10:
     var forgelong $1
     var order.chapter 10
     goto chapter.name

chapter.name:
	put #Parse Forge long: %forgelong
	gosub get my weapon book
	gosub put.1 "turn book to chapter %order.chapter" "^You turn|^The book is already"
	put read book
    waitforre Page (\d+): %forgelong
    var page $1

    gosub put.1 "turn my book to page %page" "^You turn|^The book is already"
skiplog:
	gosub get my armor book
	gosub put.1 "read my book" "^A list of"

	action (book) off
	action (log) off

	if matchre("%forgelong", ".* ball and chain") then var item ball

	if ("%be.Quiet" != "yes") then
	{
	echo Item: %item1
	echo Item Verb: %item
	echo Assemble1: %assemble
	echo Assemble2: %assemble2
	echo asmCount1: %asmCount1
	echo asmCount2: %asmCount2
	echo Ingot size: %iSize
	}

	goto study.book

study.book:
	gosub put.1 "study my book" "^Roundtime"
	gosub stow book
	#gosub check.logbook
	action (forge) on
	goto setup.anvil

check.logbook:
	if "%workOrders" = "no" then return
	if ("%be.Quiet" != "yes") then echo %iCount
	if %totalCount = 0 then var totalCount %iCount
	if "%iCompare" = "%item1" then put #echo Green Idiot check checked out! Moving on to make %iCompare aka %item1 !
	if "%iCompare" != "%item1" then
	{
	put #echo Red WARNING! %iCompare does not match %item1 !
	put #echo Red To continue anyways NOD!
	put #beep
	waitforre ^You nod
	}

return


setup.anvil:

	var tool hammer
	#gosub get my ingot from my %iDefault

first.pound:
	gosub put.1 "put my ingot on anvil" "^You put"
	gosub poundcheck
	action (ingot) on
	gosub put.1 "pound ingot on anvil with my hammer" "^Roundtime|^You need"
	action (forge) off
	action (ingot) off
	if %smallingot = 1 then goto small_ingot
	if "%extra" = "yes" then gosub extra.ingot
	goto work

extra.ingot:
	gosub emptyhands
	gosub stow ingot
return

small_ingot:
	var smallingot 0
	gosub emptyhands
	gosub get ingot from anvil
	gosub put.1 "put ingot in buck" "^You drop"
	send .smelt
	waitfor Smelting done
	var keywords set 0
	gosub emptyhands
	goto craft.loop

work:
	#gosub ppcheck
	#gosub quickspelltrain
	if ("%be.Quiet" != "yes") then echo %tool
	if "%tool" = "hammer" then goto pound
	if "%tool" = "bellows" then goto bellows
	if "%tool" = "shovel" then goto shovel
	if "%tool" = "tongs" then goto turn
	if "%tool" = "tub" then goto tub
	if "%tool" = "oil" then goto oil
	if "%tool" = "analyze" then goto analyze
	if "%tool" = "pliers" then goto pull
	if "%tool" = "assemble" then goto assemble
	if "%tool" = "rehammer" then goto rehammer
	if "%tool" = "grind" then goto grind
	if "%tool" = "done" then goto bundle
	goto work

rehammer:
	gosub put.1 "put %item on anvil" "^You put"
	var tool hammer
	goto work

oil:
	gosub emptyhands
	gosub get my %item
	gosub get my oil
	if (("$righthandnoun" != "oil") && ("$lefthandnoun" != "oil")) then gosub buyoil
	action (forge) on
	gosub put.1 "pour oil on my %item" "^Roundtime"
	action (forge) off
	gosub stow oil
	if (("$WO_Mark" = "true") || ("%doMark" = "yes")) then gosub mark
	goto work

buyoil:
	gosub move 917
	gosub put.1 "order 6" "^The attendant"
	gosub put.1 "order 6" "^The attendant"
	gosub findanvil
	return

grind:
	gosub findgrind
	action (forge) on
	if %grind = 1 then
	{
		gosub put.1 "turn grind" "^Roundtime"
		goto grind
	}
	action (forge) off
	if (("$righthandnoun" != "%item") && ("$lefthandnoun" != "%item")) then gosub get my %item
	gosub put.1 "push grind with my %item" "^Roundtime"
	var tool oil
	goto work

findgrind:
	if (($roomid = 976) || ($roomid = 977)) then return
	gosub move 976
return

mark:
if ("%doMark" = "no") then return
if ("$WO_Mark" = "false") then return
if ("$WO_Mark" = "true") then
{
	send get my stamp
	waitforre ^You get
	send mark %item with stamp
	waitforre ^Roundtime
	send stow stamp
	waitforre ^You put
	return
}
if ("%doMark" = "yes") then
{
	send get my stamp
	waitforre ^You get
	send mark %item with stamp
	waitforre ^Roundtime
	send stow stamp
	waitforre ^You put
	return
}
return

assemble:
	action (forge) on
	gosub stow left
	gosub stow right
	if (("$righthandnoun" != "%item") && ("$lefthandnoun" != "%item")) then gosub get %item
	if ("%be.Quiet" != "yes") then
	{
		echo %assemble 1
		echo %assemble2 2
	}
	if (("%assemble" != "no") || ("%assemble2" != "no")) then gosub buy_assemble
	if "%assemble" != "no" then
	{
		gosub assemble1.loop
		if ("$lefthand" != "Empty") then gosub stow %assemble
	}
	if "%assemble2" != "no" then
	{
		gosub assemble2.loop
		if ("$lefthand" != "Empty") then gosub stow %assemble2
	}
	action (forge) off
	var tool grind
	goto work

buy_assemble:
	gosub move 917
	if "%assemble" != "no" then
	{
		gosub put.1 "buy %assemble" "The sales clerk"
		gosub stow %assemble
	}
	if "%assemble2" != "no" then
	{
		gosub put.1 "buy %assemble2" "The sales clerk"
		gosub stow %assemble2
	}
	gosub findanvil
	return

findanvil:
	if $roomid != 976 then gosub move 976
	gosub checkplayer
	if %playerhere = 1 then
	{
		gosub move 977
		gosub checkplayer
		if %playerhere = 1 then gosub move 975
		gosub checkplayer
		if %playerhere = 1 then gosub move 974
		gosub checkplayer
		if %playerhere = 1 then exit
	}
return

findmaster:
	var movelist s|w|w|sw|se|nw|ne|e|e|s|s|s|n|n|n|e|e|se|sw|done
	var movearray 0

	gosub move 407
movenow:
	if contains("$roomobjs", "%master") then goto foundmaster
	if "%movelist(%movearray)" = "done" then goto foundmaster
	gosub put.1 "%movelist(%movearray)" "^Obvious"
	var keywords set 0
	math movearray add 1
	goto movenow

foundmaster:
	if "%movelist(%movearray)" = "done" then echo Could not find master!
		else echo Found Master %master
	var keywords set 0
return

completed:
	gosub findmaster
	gosub put.1 "give log to juln" "^You hand"
	gosub put.1 "ask %master for hard weaponsmithing work" "shuffles"

	goto craft.loop

needwork:
	gosub findmaster
	gosub put.1 "ask %master for hard weaponsmithing work" "shuffles"
	if $Forging.LearningRate < 30 then goto craft.loop
	goto forge_exit

expired:
	gosub findmaster
untie:
	action var untie 1 when ^You untie
	var untie 0
	if "$lefthandnoun" = "logbook" then gosub swap
	gosub put.1 "untie log" "^You untie|^You have nothing"
	gosub put.1 "empty left" "^You drop|^Your left hand"
	if %untie = 1 then goto untie
	action remove ^You untie
	gosub put.1 "ask %master for hard weaponsmithing work" "shuffles"
	goto craft.loop

assemble1.loop:
	action (forge) on
	if "%asmCount1" = "0" then return
	if "%asmCount1" = "1" then
	{
		gosub get my %assemble
		gosub put.1 "assemble my %item with %assemble" "^You slide|mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
	}
	if "%asmCount1" = "2" then
	{
		gosub get my %assemble
		gosub put.1 "assemble my %item with %assemble" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
		gosub get my %assemble
		gosub put.1 "assemble my %item with %assemble" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
	}
	if "%asmCount1" = "3" then
	{
		gosub get my %assemble
		gosub put.1 "assemble my %item with %assemble" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
		gosub get my %assemble
		gosub put.1 "assemble my %item with %assemble" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
		gosub get my %assemble
		gosub put.1 "assemble my %item with %assemble" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
	}
	action (forge) off
return

assemble2.loop:
	action (forge) on
	if "%asmCount2" = "0" then return
	if "%asmCount2" = "1" then
	{
		gosub get my %assemble2
		gosub put.1 "assemble my %item with %assemble2" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
	}
	if "%asmCount2" = "2" then
	{
		gosub get my %assemble2
		gosub put.1 "assemble my %item with %assemble2" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
		gosub get my %assemble2
		gosub put.1 "assemble my %item with %assemble2" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
	}
	if "%asmCount2" = "3" then
	{
		gosub get my %assemble2
		gosub put.1 "assemble my %item with %assemble2" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
		gosub get my %assemble2
		gosub put.1 "assemble my %item with %assemble2" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
		gosub get my %assemble2
		gosub put.1 "assemble my %item with %assemble2" "mark where it will attach when you continue crafting.$|so you stop assembling them\.$"
	}
	action (forge) off
return

analyze:
	gosub emptyhands
	gosub get %item from anvil
	if ("%be.Quiet" != "yes") then Echo At analyze... der...
	action (forge) on
	gosub put.1 "analyze %item" "^Roundtime"
	action (forge) off
	if ("%be.Quiet" != "yes") then echo %tool
	goto work

checkpliers:
	if (("$righthandnoun" = "pliers") && ("$lefthandnoun" = "%item") ) then return
	if "$righthandnoun" != "%item" || "$lefthandnoun" != "%item" then
	{
		gosub emptyhands
		gosub get my %item
	}
	if "$righthandnoun" = "%item" then gosub swap
	if "$righthandnoun" != "pliers" then if "$righthandnoun" = "" then gosub get my pliers
	if "$righthandnoun" = "pliers" then return
return

pull:
	gosub checkpliers
	action (forge) on
	gosub put.1 "pull my %item with my pliers" "^Roundtime"
	action (forge) off
	goto work

pound:
	gosub poundcheck
	action (forge) on
	gosub put.1 "pound %item on anvil with my hammer" "^Roundtime"
	action (forge) off
	goto work

poundcheck:
	if "$righthandnoun" != "hammer" then
	{
		if "$righthandnoun" != "" then gosub stow right
		gosub get my hammer
	}
	if "$lefthandnoun" != "tongs" then
	{
		if "$lefthandnoun" != "" then gosub stow left
		gosub get my tongs
	}
return

shovel:
	var %tool hammer
	gosub stow my hammer
	gosub get my shovel
	action (forge) on
	gosub put.1 "push fuel with my shovel" "^Roundtime"
	action (forge) off
	gosub stow shovel
	goto work

bellows:
	var %tool hammer
	gosub stow my hammer
	gosub get my bellows
	action (forge) on
	gosub put.1 "push my bellows" "^Roundtime"
	action (forge) off
	gosub stow bellows
	goto work

turn:
	var %tool hammer
	gosub poundcheck
	action (forge) on
	gosub put.1 "turn %item on anvil with my tongs" "^Roundtime"
	action (forge) off
	goto work

tub:
	action (forge) on
	gosub put.1 "push tub" "^Roundtime"
	action (forge) off
	goto work

app:
	if "%endExamine" != "yes" then return
	if "%woExamine" != "yes" then return
	gosub put.1 "appraise my %item careful" "^Roundtime"
	gosub put.1 "analyze my %item" "^Roundtime"
	return

check.repeat:
	var repeat no
	action (log) on
	send read my logbook
	pause 3
	action (log) off
return

do.deed:
send get my packet
waitforre ^You get
send push %item with packet
waitforre you record it on a deed for your records\.$
send stow packet
waitforre ^You put
send get my logbook
waitforre ^You get
send bundle deed with logbook
waitforre ^you record it on a deed for your records\.$|^You notate the deed in
return


bundle:
gosub app
if "%workOrders" = "yes" then
{
	if ("%doDeed" = "yes") then gosub do.deed
	else
	{
		gosub get my logbook
		if (("$righthandnoun" != "%item") && ("$lefthandnoun" != "%item")) then gosub get my %item
		gosub put.1 "bundle my %item with my logbook" "^You notate"
		if "$righthand" != "Empty" then
		{
			gosub put.1 "put %item in buck" "^You drop"
			goto needwork
		}
	}
	gosub check.repeat
	gosub stow log
}
goto whatnext


whatnext:
exit
	#echo %repeat
	#echo %iCount
	counter add 1
	var craftedCount %c
	if %craftedCount = $WO_Amount then
	{
		echo We are done!
		var repeat no
	}
	if "%craftedCount" = "%totalCount" then
	{
		echo We are done!
		var repeat no
	}
	if "%repeat" = "yes" then
	{
		Echo **** Repeating! Need %iCount more of %item1
		if $Forging.LearningRate < 30 then goto book.read
		else goto forge_exit
	}
	else goto eof

book.read:
	action (book) on

	gosub emptyhands
	gosub get my weapon book
	goto study.book

eof:
	if "%workOrders" = "yes" then
	{
		##put #echo >Log Blue Finished workorder for %item1 !
		gosub findmaster
		gosub get my log
		gosub put.1 "give log to %master" "^You hand"
		gosub emptyhands
	}
	pause 1
	##Echo *** We are done making %item1 !
	if (("$righthandnoun" != "%item") && ("$lefthandnoun" != "%item")) then gosub get my %item
	if (("$righthandnoun" = "%item") || ("$lefthandnoun" = "%item")) then gosub put.1 "put my %item in buck" "^You drop"
	if $Forging.LearningRate < 30 then goto craft.loop
forge_exit:
	gosub goto repair
	gosub repairtools
	put #parse Forging done
exit

repairtools:
	gosub get my forging hammer
	gosub put.2 "give ham to ladar" "give ham to ladar" "^You hand|I will not repair"
	var keywords 0
	gosub get my tong
	gosub put.2 "give tong to ladar" "give tong to ladar" "^You hand|I will not repair"
	var keywords 0
	gosub emptyhands
	gosub get my shov
	gosub put.2 "give shov to ladar" "give shov to ladar" "^You hand|I will not repair"
	var keywords 0
	gosub get my bellow
	gosub put.2 "give bell to ladar" "give bell to ladar" "^You hand|I will not repair"
	var keywords 0
	gosub emptyhands
	gosub get my rod
	gosub put.2 "give rod to ladar" "give rod to ladar" "^You hand|I will not repair"
	var keywords 0
	gosub emptyhands
	return

include routinecommon.cmd
include routinemoonbuffs.cmd
