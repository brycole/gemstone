setvar night 0

action setvar end.shop 1 when is closed for the night.
action put #script abort automapper;put #send .nightsteal;setvar night 1 when is closed for the night

gosub move 209;## general store
gosub steal broadsword 4
gosub move 215;## weapon shop
gosub steal "slender stiletto" 1
if %night = 0 then move out
gosub move 575;## stichery
gosub steal dress 4
gosub move 341;## cleric shop, temple of light
gosub steal ring 3
gosub move 206;## alchemist
gosub steal "seolarn weed" 1
move go iron door;## herbalist
gosub steal "yelith root" 2
gosub move 174;## armory
gosub steal "chain veil" 2
gosub move 168;## music shop
gosub steal mandolin 2
if %night = 0 then
{
	gosub empty
	put ask malik about thieves
	delay 1
	put order gitt
	put offer 25000
	delay 1
	put offer 25000
	delay 1
	pause
	pause
	put dance silly
	delay 1
	gosub steal "ivory keyblank" 2
	delay 1
	move go trap
	delay 1
}
gosub move 157;## bowyer
gosub steal "barbed arrows" 6
if %night = 0 then move out
gosub move 139;## east gate
gosub move 231;## tannery
gosub steal shears 4
gosub move 232;## surv front room
gosub steal "stone pestle on cabinet" 4
gosub empty
move go curt;## surv back room
## back room items too high
gosub move 216
gosub move 553;## coin of the realm
gosub steal case 2
gosub move 569;## barber shop
gosub steal "jar in crate" 1
gosub move 568;## toybox
gosub steal "blue beard" 1
gosub move 551;## little frills
gosub steal "sandals on tree" 1
gosub move 565;## travel tours
gosub steal badge 1
gosub move 549;## heraldry shop
gosub steal "ord shield" 1
gosub move 139;## east gate link
gosub move 193;## gondola herbalist
gosub steal "yelith root" 5


## horse clan
##send .armor on
##waitfor armor.cmd done.
##gosub move 217;## west gate area link
##gosub move 168;## horse clan
##send .armor off
##waitfor armor.cmd done.