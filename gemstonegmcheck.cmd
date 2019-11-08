
	action var combat_status $1 when AS: \+\d{1,7} vs DS: \+\d{1,7} with AvD: \+\d{1,7} \+ d100 roll: .(\d{1,7})
	action if %combat_status > 1000 then goto pausequit when Roundtime
	action goto FALL when ^A sudden fierce gust of wind howls through the area\!|^The ground beneath you violently shakes and rumbles\!
#       action (dscheck) var ds_gmcheck $1 when   AS: \+\d+ vs DS: .(\d+) with AvD 
#       action (dscheck) var td_gmcheck $1 when   CS: \+\d+ - TD: .(\d+) \+ CvA


#	Then...CLICK!  It opens!

mainloop:
	matchre MONSTER (^Your heart leaps into your throat at the sound of the terrible wail|^A mastodonic leopard pounces on you, knocking you painfully to the ground|^You take a running start towards the ramp but as you are about to make a fantastic leap, you misjudge a step and slide head first down the ramp crashing hard into the snow-covered ground below|^You are knocked to the ground\!|^You fall screaming to the ground grasping your mangled|huge foot up and slams it into the (floor|ground), shaking everything violently|crouches, sweeps a leg at you and connects\!|The swarm surrounds you, causing you to lose your balance and fall|The swarm bunches tightly together and forms a dark mass around you, knocking you to the ground!)
	matchre MONSTER ^You assume a meditative posture, sitting with legs folded and hands resting upon your knees.
	matchre FALL ^You stand back up\.
	matchre CAPS ([A-Z]{5,15})
	matchre pausequit [A-Z]{2,9} [A-Z]{2,9} [A-Z]{2,9}
	matchre RT Roundtime: (\d{2,9}) sec\.
	matchwait
	goto mainloop




playnoise:
	echo ###############################################################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ###############################################################
	put #play helphelp
	noisehide:
	pause 5
	goto playnoise




FALL:
	if matchre("$roomid", "260|335") then goto mainloop
	if %falls > 0 then goto pausequit
	pause 5
	echo darn it
	#put 'Darn it.
	pause 1
	if $standing = 0 then waiteval $standing = 1
	var falls 1
	goto mainloop

CAPS:
	var trigger $0
	echo TRIGGER ON %trigger
	if matchre("$roomid", "374|238") then if matchre("%trigger", "\b(EXPEDITING|REMOVAL|BOUNTIES|CLICK)\b") then goto mainloop
	if ("$preparedspell" != "None" && "%trigger" = "RELEASE") then goto mainloop
	if matchre("%trigger", "\b(CRACK|CRUNCH|QUANTITY|SILVERWOOD|SERVICE|SHOWSERVICE|FUMBLE)\b") then goto mainloop
	if matchre("%bounty", "One of our citizens") then goto mainloop
	if "$roomplayers" = "" then if matchre("%trigger", "CLICK") then goto mainloop
	if matchre("$roomobjs", "guard" then if matchre("%trigger", "SEARCH") then goto mainloop
	if matchre("$roomname", "Blackfinger") then if matchre("%trigger", "ORDER|EMPTY") then goto mainloop
	if "%trigger" = "" then goto mainloop
	goto pausequit

(ignor|continu|\btyp(e[sd]?|ing)\b|hello|respond|reply|answer|speak|spoken|whisper|scream| you (have|are)|\bSEND\b|aloud|talk|\bscript(s?|ing|ed)\b|smil|frown|snort|yell|exclaim|announc|declar|voic|say|claim|boom|shout|this place|you there|squeak|doing|spider|alert|cheer|nod|jump|wav|stop)


RT:
	if matchre("$roomid", "260|335") then goto mainloop
	echo RT was $1
	goto pausequit

MONSTER:
	pause 2
	if $standing = 0 then waiteval $standing = 1
	pause 2
	goto mainloop

pausequit:
	gosub playnoise
	put #script pause laflan
	echo QUITTING
	pause 5
	put quit
	put #script abort
	exit