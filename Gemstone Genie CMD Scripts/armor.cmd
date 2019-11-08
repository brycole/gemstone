#debuglevel 10
## Character specific variables
var container1 haver
var container2 carry
if ((%1 = "off") || (%1 = "on")) then var arm %1

if %arm = off then goto off
else goto on

off:
armor_Check:
		matchre remove_And_Stow_1 (leathers|jerkin|jacket|glove|balaclava|handguards|helm|hood|collar|aventail|greaves|vambraces|shield|buckler|\btarge\b|coif|cowl|gauntlet|half plate|lorica|breastplate|hauberk|tasset|mask)
		matchre endarmor You have nothing of that sort|You are wearing nothing of that sort
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
	
on:
armor_Check1:
		matchre wear_Armor (leathers|jacket|glove|balaclava|handguards|helm|hood|collar|aventail|bone greaves|vambraces|shield|buckler|\btarge\b|coif|cowl|gauntlet|half plate|lorica|breastplate|armor|hauberk|tasset|mask)
		match armor_Check2 Encumbrance
	put look in my %container1;enc
	matchwait
	
armor_Check2:
		matchre wear_Armor (leathers|jacket|glove|handguards|balaclava|helm|hood|collar|aventail|bone greaves|vambraces|shield|buckler|\btarge\b|coif|cowl|gauntlet|half plate|lorica|breastplate|armor|hauberk|field plate|tasset|mask)
		match endarmor Encumbrance
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

endarmor:
echo Armor is %arm.
put #parse armor.cmd done.