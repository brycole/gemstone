routinebox:

	action var multi_trap ON when is not yet fully disarmed
	action var multi_lock ON when discover another lock protecting

	var container1 back
	#var container2 satchel
	var componentcontainer sack
	var gem.container canvas sack
	var pickstorage lockpick ring
	var use.ring 1
	var component_list tube|needle|seal|bladder|studs|blade|\brune\b|spring|hammer|disc|dart|reservoir|face|\bpin\b|vial|striker|cube|sphere|leg|crystal|circle|clay
	var multi_trap ON
	var multi_lock ON
	var thief_hide NO
	var harvest NO
	var dismantle
	var mode careful

return

	
checkbox:
	if matchre("$roomobjs", "(coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)") then
	{
		gosub put.1 "stance set 100 0 100 0" "^Setting"
		gosub m.inputox.remove
		gosub emptyhands
		goto startbox.loop
	}
		else return
	
startbox.loop:	
	#gosub container_check1
	if matchre("$roomobjs", "(coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)") then gosub get $0
		else goto boxdone
	if "$lefthand" = "Empty" then gosub put.1 "swap" "^You move"
	#if (("$lefthand" = "Empty") && ("$righthand" = "Empty")) then gosub done
	
	disarm_sub:
		gosub disarm_ID
		gosub disarm
		if %harvest = YES then gosub analyze
		if %multi_trap = ON then goto disarm_sub
	
	lock_sub:
		gosub pick_ID	
		gosub pick
		if %multi_lock = ON then goto lock_sub
		if %use.ring != 1 then gosub put_Away_Pick
		gosub dismantle
		gosub loot
	goto startbox.loop

container_Check1:
		matchre get.box (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
		put look in my %container1
		matchwait 2
return

get.box:
	gosub get $0
return
	
disarm_ID:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre disarm_ID fails to reveal to you|You realize|%rtwait
	matchre return You guess it is already disarmed|Surely any fool|Even your memory can not be that short|Roundtime|Somebody has already located
		put disarm ID
	matchwait	
	
disarm:
	var multi_trap OFF
disarm_loop:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre disarm_loop ^You realize|%rtwait|fumbling fails to disarm|This is not likely to be a good thing|unable to make any progress
	matchre return You are certain the|Roundtime|You guess it is already disarmed|DISARM HELP for syntax help
		put disarm my $lefthandnoun %mode
	matchwait
	
analyze:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre analyze You realize|You are unable to|%rtwait
	matchre harvest You already have made an extensive study|You are certain the %disarmit is not trapped|Roundtime|You guess it is already disarmed|DISARM HELP for syntax help
	matchre return fumbling fails to disarm|This is not likely to be a good thing
		put disarm ana
	matchwait

harvest:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre harvest You realize|%rtwait|^Your laborious
	match return It appears that
	match stow_Component Roundtime	
		put disarm harvest
	matchwait

stow_Component:
	if (matchre("$righthand", "(%component_list)")) then gosub emptyhands
return

pick_ID:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre disarm_sub is not fully disarmed
	matchre pick_ID ^You realize|fail to teach you|%rtwait
	matchre return Somebody has already|not even locked|Roundtime
		put pick ID
	matchwait
	
pick:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	var multi_lock OFF
	matchre return ^It's not even locked,
	matchre pick %rtwait|^You realize
	matchre pick_loop Roundtime|has already helpfully been analyzed
		put pick analyze
	matchwait
pick_loop:
	gosub roundtimedone
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre pick_loop %rtwait|^You are unable|^You realize
	matchre return With a soft click|not even locked|Roundtime
		put pick %mode
	matchwait

dismantle:
	if "%weaponrange" != "missile" then gosub retreat.missile
	gosub put.1 "open my $lefthandnoun" "^You open"
	gosub put.1 "dismantle my $lefthandnoun" "You can not|^Roundtime"
	gosub put.1 "dismantle my $lefthandnoun" "You can not|^Roundtime"
return

loot:
	gosub loot.loop
return

if $Disarm_Traps.LearningRate > 34 then goto exp_Pause
if $Lockpicking.LearningRate > 34 then goto exp_Pause
	
boxdone:
	gosub m.inputox.wear
	gosub put.1 "stance set 100 1 80 100" "^Setting"
return