##Mystarria's armor script, Aug 25th/09
##updated: Jan 10th/10
#debuglevel 5

counter set 0
var armor
var armorcount
var armortypes leathers|robe|gloves|handguards|legguards|helm|shirt|coat|hood|balaclava|collar|aventail|greaves|pants|vambraces|shield|buckler|\btarge\b|coif|cowl|ceremonial chain|gauntlets|half plate|lorica|breastplate|armor |armor$|hauberk|field plate|tasset|mask
if matchre(toupper("%1"), ("ON|OFF")) then goto $0
else
	{
	echo
	echo *** Usage:
	echo **  .armor on - puts on all your set armor
	echo **  .armor off - removes all your armor (run to set up with new armor)
	echo
	exit
	}
	
ON:
	var armor $armor
	eval armorcount count ("%armor", "|")
	var dir get|wear
goto match

OFF:
action var armor %armor|$1 when (%armortypes)
var dir rem|stow

	match end You aren't wearing anything like that.
	match setup INVENTORY HELP
put inv armor
matchwait

	setup:
		eval armor replacere("%armor", "^\|", "")
		eval armorcount count ("%armor", "|")
		put #var armor %armor

match:
if %c <= %armorcount then
	{
	if (matchre("%armor(%c)", "(%armortypes)")) then
		{
		var curitem $1
		send %dir(0) my %curitem
		send %dir(1) my %curitem
		wait
		counter add 1
		goto match
		}
	}
goto end

end:
exit