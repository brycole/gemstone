
routinepvpalerts:
	put #var player_threats Xionara|Phaetyl|Koranan|Arkanax|Sepherus|Scarekrow|Fahijeck|Sepharus|Khras
#	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^(\w+) lowers his head briefly before unleashing a roar hinting at a fatal following
#	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^Raising his voice with authority, (\W+) lashes out with the ferocity of a whipcrack
#	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You sense a hidden person whom you cannot pinpoint\.
#	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You can sense .* presence of (%player_threats)\.
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^(\w+) points at you, ruining your hiding place\.
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^(\w+) has spotted you\!
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^(%player_threats) reveals (him|her)self\.
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^\*.+\b(?!assassin|intercessor|kelpie)\w+ (fires|throws) a.*at you\.
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^(\w+) appears to be aiming at you with
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^(\w+) gestures at you
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^($player_threats) begins to advance on
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^($player_threats) gestures\.
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when discovers ($player_threats), ruining (his|her) hiding place\!
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You notice ($player_threats) slip into a hiding place\.
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You notice ($player_threats) attempting to (conceal|stealthily)
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You notice ($player_threats) as he stealthily closes
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You notice ($player_threats) focusing intently
	action if !matchre("%resonance", "alert3|travel") then var alerts $0|$1;goto player_alert_3 when ^You notice (\w+) trying to slip in behind you\.
	
	#action if !matchre("%resonance", "alert3|alert2|travel") then var alerts $0|$1;goto player_alert_2 when ^(\w+) gestures at you
	#action if !matchre("%resonance", "alert3|alert2|travel") then var alerts $0|$1;goto player_alert_2 when ^(\w+) appears to be aiming at you with
	action put engage %alerts(1) when It would help if you were closer.*%alerts(1)
	action var slashed yes when ^You slip out of the shadows behind .* Displaying controlled ferocity, you draw back before smoothly slicing at .*leg with swift and elegant precision.
	return



player_alert_1:
	var resonance alert1
	put echo ALERT1 - CAUTION
	pause 0.5
	if $stunned = 1 then goto player_alert_3
	if $webbed = 1 then goto player_alert_3
	if matchre("$0", "%player_threats") then goto player_alert_3
	echo WAITING for $roomplayers to leave
	waiteval $roomplayers = ""
	goto mainloop

player_alert_2:
	goto exitquick
	var resonance alert2
	var origin $roomid
	pause 0.5
	if $stunned = 1 then goto player_alert_3
	if $webbed = 1 then goto player_alert_3
	if matchre("$0", "%player_threats") then goto player_alert_3
	echo KILL - %alerts(0)
	pause 1
	if matchre("%alerts(0)", "aiming|targeting") then gosub move 338
	if !contains("$righthand", "shortbow") then gosub getitem shortbow
	gosub shield_off
	shoot_player:
	if $roomid = %origin then gosub hide
	if "%loaded" != "yes" then gosub put load %ammo
	if matchre("%alerts(0)", "aiming|targeting") then
		{
		if $hidden = 1 then gosub put dance
		gosub move %origin
		gosub hide
		}
	put .fire %alerts(1)
	pause 2
	if contains ("$roomplayers", "a stunned.* %alerts(1)") then goto shoot_player


player_alert_3:
	if $monstercount > 0 then gosub retreat
	var gmlogoff 1l
	
	gosub movedir
	gosub runhide
	goto exitquick
	var resonance alert3
	put echo * You have been attacked! *
	put #var mapper defense
	if $stunned = 1 then waiteval $stunned = 0
	if $health < 70 then goto exitquick
	if "$roomplayers" = "" then 
		{
		var slashed no
		goto mainloop
		}
	gosub stance 100 0 100 100
	if $standing != 1 then gosub put stand
	if matchre("$roomobjs", "hurling axe|throwing axe|adze|bola|throwing club|bulhawf|hhr'ata") then gosub put stow $0
	if matchre("$roomobjs", "the body of") then goto leavecombat

	gosub getitem thrusting blade
	if $concentration > 19 then gosub khri Shadowstep
	if $hidden = 0 then gosub put hide
	if $hidden = 1 then
		{
			if "%slashed" != "yes" then gosub put ambush slash %alerts(1)
			else gosub put backstab %alerts(1)
		}
	goto player_alert_3
	


