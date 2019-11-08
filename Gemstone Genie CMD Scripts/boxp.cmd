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
	if matchre("$roomobjects", "(coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)") then goto startbox.loop
		else goto boxdone
	gosub m.inputox.remove
	gosub emptyhands
	gosub put.1 "stance set 100 100 1 0" "^Setting"

startbox.loop:	
	#gosub container_check1
	if matchre("$roomobjects", "(coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)") then gosub get $0
		else goto boxdone
	if "$lefthand" = "Empty" then put.1 "swap" "^You move"
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
		if %use.ring != 0 then gosub put_Away_Pick
		gosub loot
		gosub dismantle
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
	if "%weaponrange" != "missile" then gosub retreat.missile
	match disarm_ID You realize
	match disarm_ID fails to reveal to you		
	matchre return You guess it is already disarmed|Surely any fool|Even your memory can not be that short|Roundtime|Somebody has already located
		put disarm ID
	matchwait	
	
disarm:
	var multi_trap OFF
disarm_loop:
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre disarm_loop ^You realize
	matchre disarm_loop fumbling fails to disarm|This is not likely to be a good thing|unable to make any progress
	matchre return You are certain the|Roundtime|You guess it is already disarmed|DISARM HELP for syntax help
		put disarm my $lefthandnoun %mode
	matchwait
	
analyze:
	if "%weaponrange" != "missile" then gosub retreat.missile
	match analyze You realize
	match analyze You are unable to
	matchre harvest You already have made an extensive study|You are certain the %disarmit is not trapped|Roundtime|You guess it is already disarmed|DISARM HELP for syntax help
	matchre return fumbling fails to disarm|This is not likely to be a good thing
		put disarm ana
	matchwait

harvest:
	if "%weaponrange" != "missile" then gosub retreat.missile
	match harvest You realize
	match return It appears that none of the trap components are accessible
	matchre harvest Your laborious fumbling fails to harvest the trap component|You fumble
	match stow_Component Roundtime	
		put disarm harvest
	matchwait

stow_Component:
	if (matchre("$righthand", "(%component_list)")) then gosub emptyhands
return

pick_ID:
	if "%weaponrange" != "missile" then gosub retreat.missile
	matchre disarm_sub is not fully disarmed
	matchre pick_ID ^You realize
	matchre pick_ID fails to teach you anything about the lock guarding it|just broke
	matchre return Somebody has already|not even locked|Roundtime
		put pick ID
	matchwait
	
pick:
	if "%weaponrange" != "missile" then gosub retreat.missile
	var multi_lock OFF
	matchre pick You realize
	matchre pick_Cont Roundtime|has already helpfully been analyzed
		put pick analyze
	matchwait
pick_loop:
	if "%weaponrange" != "missile" then gosub retreat.missile
	match pick_loop You realize
	match pick_loop You are unable to make
	matchre return With a soft click|not even locked|Roundtime
		put pick %mode
	matchwait

loot:
open_Box:
			match get_Gem_Pouch open
			match pick_ID It is locked
		put open my $lefthandnoun
		matchwait
get_Gem_Pouch:
	gosub put remove my gem pouch	
fill_Gem_Pouch:
		matchre tied_Pouch The gem pouch is too valuable|You'll need to tie it up 
		matchre stow_Pouch You take|any gems|You fill your|You open your gem pouch and quickly fill it|You have to be holding
		matchre full_Pouch anything else|pouch is too full
		put fill my gem pouch with my %disarmit
		matchwait
tied_Pouch:
		gosub put tie pouch
		goto fill_Gem_Pouch
full_Pouch:
		gosub put open my %gempouch.container
		gosub put put my gem pouch in my %gempouch.container
		gosub put close my %gempouch.container
		gosub put put get my gem pouch
		goto fill_Gem_Pouch
stow_Pouch:
		gosub stow gem pouch
get_Coin:
		matchre get_Coin You pick up
		match return What were you
		put get coin from my %disarmit
		matchwait
	
dismantle:
	match return Roundtime
	match dismantle next 15 seconds.
		put disman my $lefthandnoun %dismantle
	matchwait

return

if $Disarm_Traps.LearningRate > 34 then goto exp_Pause
if $Lockpicking.LearningRate > 34 then goto exp_Pause
	
boxdone:
	gosub m.inputox.wear
	gosub put.1 "stance set 100 1 80 100" "^Setting"
return