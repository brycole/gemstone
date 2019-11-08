## Disarming script by Warneck
#debuglevel 5
## Character specific variables
var container1 basket
var container2 pack
var componentcontainer brown pouch
var pickstorage robe

## Script actions
action var multi_trap ON when is not yet fully disarmed
action var multi_lock ON when discover another lock protecting

put exp survival 0
waitfor Overall state of mind
if ($Disarm_Traps.Ranks >= 15) then
{
	action var mode quick when is a trivially constructed|is a laughable matter|An aged grandmother could|will be a simple matter for you to
	action var mode normal when should not take long with your skills|is precisely at your skill level|with only minor troubles|got a good shot at
	action var mode careful when some chance of being able|with persistence you believe you could|would be a longshot|minimal chance|You really don't have any chance
	action var mode careful when Prayer would be a good start|You could just jump off a cliff|same shot as a snowball|pitiful snowball encased in the Flames
	var mode
} else
{
	var mode careful
}

## Scripts variables
var component_list tube|needle|seal|bladder|studs|blade|\brune\b|spring|hammer|disc|dart|reservoir|face|\bpin\b|vial|striker|cube|sphere|leg|crystal|circle|clay
var multi_trap ON
var multi_lock ON
var thief_hide NO
var harvest NO
var dismantle

top:
	if $hidden = 1 then put shiver
	var LAST top
		matchre stowStuff right|left
		match guild_Check empty hands.
	put glance
	matchwait

stowStuff:
	var LAST stowStuff
		matchre guild_Check You|Stow
	put stow right;stow left
	matchwait

guild_Check:
		match barb Barbarian
		match bard Bard
		match cleric Cleric
		match moonmage Moon Mage
		match ranger Ranger
		match thief Thief
		match warmage Warrior Mage
		match armor_Check Gender
	put info
	matchwait
 
barb:
	var dismantle bash
	goto armor_Check

bard:
	var dismantle shriek
	goto armor_Check
	
cleric:
	var dismantle pray
	goto armor_Check

moonmage:
	var dismantle focus
	goto armor_Check
	
ranger:
	var dismantle whistle
	goto armor_Check

thief:
	if (toupper("%thief_hide") = "NO") then
	{
		var dismantle thump
		var harvest YES
	}
	goto armor_Check
	
warmage:
	var dismantle fire
	goto armor_Check
	
armor_Check:
		matchre remove_And_Stow_1 (leathers|glove|balaclava|handguards|helm|shirt|coat|hood|collar|aventail|greaves|vambraces|shield|buckler|\btarge\b|coif|cowl|gauntlet|half plate|lorica|breastplate|armor|hauberk|field plate|tasset|mask)
		matchre main You have nothing of that sort|You are wearing nothing of that sort
	put inv armor
	matchwait
	
remove_And_Stow_1:
	var armor $0
remove_Armor_1:
	var LAST remove_Armor_1
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre stow_Armor_1 You work|You remove|You pull|You take|You loosen|You sling
	put remove %armor
	matchwait
stow_Armor_1:
	var LAST stow_Armor_1
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match armor_Check You put your
		matchre stow_Armor_2 any more room in|closed|no matter how you arrange
	put put %armor in my %container1
	matchwait	
stow_Armor_2:
	var LAST stow_Armor_2
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match armor_Check You put your
		matchre no_More_Stowing any more room in|closed|no matter how you arrange
	put put %armor in my %container2
	matchwait
	
no_More_Stowing:
	echo **   No more room for stowing; exiting script   **
	put wear %armor
	goto done
	
main:	
	gosub container_Check1
	if ("$lefthand" = "Empty") then 
	{
		put swap
		pause 1
	}
	disarm_sub:
		gosub disarm_ID
		if ("%mode" = "toss") then goto toss_box
		gosub disarm
		if "%harvest" = "YES" then gosub analyze
		if "%multi_trap" = "ON" then goto disarm_sub
	gosub get_Pick
	lock_sub:
		gosub pick_ID	
		if ("%mode" = "toss") then goto toss_box
		gosub pick
		if "%multi_lock" = "ON" then goto lock_sub
		gosub put_Away_Pick
	gosub loot
	gosub dismantle
	if "%harvest" = "YES" then gosub fix_Lock
	gosub exp_Check
	goto main

container_Check1:
		matchre get_For_Disarm (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
		match container_Check2 Encumbrance
	put look in my %container1;enc
	matchwait

container_Check2:
		matchre get_For_Disarm (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
		match armor_Check1 Encumbrance
	put look in my %container2;enc
	matchwait
	
get_For_Disarm:
	var disarmit $1
	get_Box:
		var LAST get_Box
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			matchre return You get|You are already
		put get my %disarmit
		matchwait

toss_Box:
	var LAST toss_Box
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type	
		match You
	put drop my %disarmit
	matchwait
	
weapon:
	var LAST weapon
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match stow_Weapon You
    put remove knuckles
	matchwait
	stow_Weapon:
	var LAST stow_Weapon
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match return You
	put stow knuckles
	matchwait
	
disarm_ID:
	var LAST disarm_ID
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match weapon knuckles
		match disarm_ID fails to reveal to you		
		matchre return You guess it is already disarmed|Surely any fool|Even your memory can not be that short|Roundtime|Somebody has already located
		#matchre return coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box
	put disarm ID
	matchwait	
	
disarm:
	var multi_trap OFF
disarmIt_Cont:
	var LAST disarmIt_Cont
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre return You are certain the %disarmit is not trapped|Roundtime|You guess it is already disarmed|DISARM HELP for syntax help
		matchre disarmIt_Cont fumbling fails to disarm|This is not likely to be a good thing|unable to make any progress
	put disarm my %disarmit %mode
	matchwait
	
analyze:
	var LAST analyze
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match analyze You are unable to
		matchre harvest You already have made an extensive study|You are certain the %disarmit is not trapped|Roundtime|You guess it is already disarmed|DISARM HELP for syntax help
		matchre return fumbling fails to disarm|This is not likely to be a good thing
	put disarm ana
	matchwait

harvest:	
	var LAST harvest
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match return It appears that none of the trap components are accessible
		matchre harvest Your laborious fumbling fails to harvest the trap component|You fumble
		match stow_Component Roundtime	
	put disarm harvest
	matchwait

stow_Component:
	if (matchre ("$righthand", "(%component_list)")) then gosub stow_It $0
	if ("$righthand" != "Empty") then
	{
		put empty right hand
		waitfor You
	}
	goto return

stow_It:
	var component $0
	stow_Comp:
		var LAST stow_Comp
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			match return You
		put put %component in my %componentcontainer
		matchwait

get_Pick:
	var LAST get_Pick
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre return You get|You are already
		match no_More_Picks what were you referring too
	put get my lockpick
	matchwait
	
no_More_Picks:
	echo
	echo ***  You have no more lockpicks  ***
	echo
	goto armor_Check1

put_Away_Pick:
	var LAST put_Away_Pick
	if ("$righthand" = "Empty") then return
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre return You put|What were you
	put put lockpick in my %pickstorage
	matchwait
	
pick_ID:
	if ("$righthand" = "Empty") then gosub get_Pick
	var LAST pick_ID
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre disarm_ERROR is not fully disarmed
		matchre pick_ID fails to teach you anything about the lock guarding it|just broke
		matchre return Somebody has already|not even locked|Roundtime
	put pick ID
	matchwait
	
pick:
	var LAST pick
	var multi_lock OFF
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre pick_Cont Roundtime|has already helpfully been analyzed
	put pick anal
	matchwait
pick_Cont:
	if ("$righthand" = "Empty") then gosub get_Pick
	var LAST pick_Cont
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match pick_cont You are unable to make
		matchre return With a soft click|not even locked|Roundtime
	put pick %mode
	matchwait

loot:
	open_Box:
		var LAST open_Box
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			match get_Gem_Pouch open
		put open my %disarmit
		matchwait
	get_Gem_Pouch:
		var LAST get_Gem_Pouch
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			match fill_Gem_Pouch You get
		put get black pouch from my bag
		matchwait
	fill_Gem_Pouch:
		var LAST fill_Gem_Pouch
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			matchre stow_Pouch You take|any gems|anything else
		put fill my black pouch with my %disarmit
		matchwait
	stow_Pouch:
		var LAST stow_Pouch
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			matchre get_Coin You|Stow
		put put my black pou in my bag
		matchwait
	get_Coin:
		var LAST get_Coin
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			matchre get_Coin You pick up
			match return What were you
		put get coin from my %disarmit
		matchwait
	
dismantle:
	var LAST dismantle
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		match return Roundtime
		match dismantle next 15 seconds.
	put disman my %disarmit %dismantle
	matchwait

fix_Lock:
	gosub get_Pick
	fixing:
	var LAST fixing
		matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
		matchre go_On Roundtime|look like it
	put fix my lock
	matchwait
	go_On:
	gosub put_Away_Pick	
	return

exp_Check:
	put exp 
	waitfor Overall state of mind
	if $Disarm_Traps.LearningRate > 10 then goto exp_Pause
	if $Lockpicking.LearningRate > 10 then goto exp_Pause
	if ("$righthand" != "Empty") then put stow $JUGGLIE
    return

exp_Pause:
	pause 0.5
	if ($Perception.LearningRate > 10) then
	{
		pause 30
		goto exp_Check
	} elseif ("$righthand" = "Empty") then put get my $JUGGLIE
JUGGLE:
		matchre JUGGLE ^\.\.\.wait|^Sorry, you may only type
		match exp_Check Roundtime
	put juggle my $JUGGLIE
	matchwait
	
return:
	return

pause:
	pause 
	goto %LAST
	
armor_Check1:
		matchre wear_Armor (leathers|glove|balaclava|handguards|helm|chain shirt|coat|hood|collar|aventail|greaves|vambraces|shield|buckler|\btarge\b|coif|cowl|gauntlet|half plate|lorica|breastplate|armor|hauberk|field plate|tasset|mask)
		match armor_Check2 Encumbrance
	put look in my %container1;enc
	matchwait
	
armor_Check2:
		matchre wear_Armor (leathers|glove|handguards|balaclava|helm|chain shirt|coat|hood|collar|aventail|greaves|vambraces|shield|buckler|\btarge\b|coif|cowl|gauntlet|half plate|lorica|breastplate|armor|hauberk|field plate|tasset|mask)
		match done Encumbrance
	put look in my %container2;enc
	matchwait

wear_Armor:
	var armor $1
	get_It:
		var LAST get_It
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			matchre wear_It You work|You remove|You pull|You take|You get|But that is
		put get my %armor
		matchwait
	wear_It:
		var LAST wear_It
			matchre PAUSE ^\.\.\.wait|^Sorry, you may only type
			matchre armor_Check1 You slip|You put|You work|You hang|You pull|You slide|You attach|You sling
		put wear my %armor
		matchwait
	
disarm_ERROR:
	echo
	echo Error while opening box
	echo Something bad happened
	echo
	put #beep
	put stow right
	pause 1
	put stow left
	pause 1
	goto done
	
done:
	pause 1
	put glance
exit