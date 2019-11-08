#debuglevel 10
# Created by Jailwatch
# Last Updated 24th November
# Version Number 2.3
#
# Thanks to:
# Lothekor for the route and array mapping.
# Kraelyst travel script for ferry and barge movements.
#
if_1 goto VARIABLE_SET
goto NOCHOICEMADE
 

VARIABLE_SET:
setvar WEALTH_LIRUMS 0
setvar WEALTH_KRONARS 0
setvar WEALTH_DOKORAS 0
setvar MOVESETALREADY OFF

ACTION_SET:
action setvar WEALTH_LIRUMS $1 when \((\d+) copper Lirums\)\.
action setvar WEALTH_KRONARS $1 when \((\d+) copper Kronars\)\.
action setvar WEALTH_DOKORAS $1 when \((\d+) copper Dokoras\)\.
action setvar WEALTH_LIRUMS 0 when ^No copper Lirums.
action setvar WEALTH_KRONARS 0 when ^No copper Kronars.
action setvar WEALTH_DOKORAS 0 when ^No Dokoras.
action put look when ^YOU HAVE BEEN IDLE TOO LONG\. PLEASE RESPOND\.
action goto SCRIPT_START when MOVE FAILED
action setvar passport yes when The folded piece of paper bears
action setvar THIEF YES when Guild\: Thief
SET_SAVE_FINAL_MOVE:
setvar finaldirectionsave %1
setvar SECOND_MOVEMENT_FINAL_SAVE %2

HAVEN_SKILL_CHECK:
### HAVEN AND ROSSMAN SWIM AND CLIMB CHECKS ###
if $Climbing.Ranks > 100 and $Perception.Ranks > 140 and $Swimming.Ranks > 140 then setvar RIVERTOROSSMANS CHECKOK
	else setvar RIVERTOROSSMANS CHECKFAILED
if $Climbing.Ranks > 100 and $Perception.Ranks > 140 and $Swimming.Ranks > 30 then setvar ROSSMANSTORIVER CHECKOK
	else setvar ROSSMANSTORIVER CHECKFAILED
if $Swimming.Ranks > 170 then setvar HAVENQUICKROUTE CHECKOK
	else setvar HAVENQUICKROUTE CHECKFAILED
		
		

MOVEMENT_VARIABLES:
###################################################################################
####################### LOCATIONS MOVEMENT START  #################################
###################################################################################
# Crossing routes
#TO CROSSING TOWN
CROSSING_ROUTES_LABEL:
setvariable route1 1j->Map1j_|2->WestGate|2a->Map2a_|4->WestGate|4a->WestGate|6->Map6_|7->NEGate|7a->NEGate|7b->NEGate|7c->NEGate|8->Map8_|8a->NEGate|9a->NEGate|9b->NEGate|10->NEGate|11->NEGate|12->NEGate|12a->NEGate|13->NEGate|14b->NEGate|14c->NEGate|14d->NEGate
setvariable route1j 1->Map1_|2->Map1_|4->Map1_|4a->Map1_|6->Map1_|7->Map1_|7a->Map1_|7b->Map1_|7c->Map1_|8->Map1_|8a->Map1_|9a->Map1_|9b->Map1_|10->Map1_|11->Map1_|12->Map1_|12a->Map1_|13->Map1_|14b->Map1_|14c->Map1_|14d->Map1_
setvariable route2 1->Map4_|1j->Map4_|2a->Map4_|4->Map4_|4a->Map4_|6->Map4_|7->Map4_|7a->Map4_|7b->Map4_|7c->Map4_|8->Map4_|8a->Map4_|9a->Map4_|9b->Map4_|10->Map4_|11->Map4_|12->Map4_|12a->Map4_|13->Map4_|14b->Map4_|14c->Map4_|14d->Map4_
setvariable route2a 1->Map1_|1j->Map1_|2->Map1_|4->Map1_|4a->Map1_|6->Map1_|7->Map1_|7a->Map1_|7b->Map1_|7c->Map1_|8->Map1_|8a->Map1_|9a->Map1_|9b->Map1_|10->Map1_|11->Map1_|12->Map1_|12a->Map1_|13->Map1_|14b->Map1_|14c->Map1_|14d->Map1_
setvariable route4 1->Crossing|1j->Crossing|2->Map2_|2a->Crossing|4a->Map4a_|6->Map6_|7->Crossing|7a->Crossing|7b->Crossing|7c->Crossing|8->Crossing|8a->Crossing|9a->Crossing|9b->Crossing|10->Crossing|11->Crossing|12->Crossing|12a->Crossing|13->Crossing|14b->Crossing|14c->Crossing|14d->Crossing
setvariable route4a 1->Map4_|1j->Map4_|2->Map4_|2a->Map4_|4->Map4_|6->Map4_|7->Map4_|7a->Map4_|7b->Map4_|7c->Map4_|8->Map4_|8a->Map4_|9a->Map4_|9b->Map4_|10->Map4_|11->Map4_|12->Map4_|12a->Map4_|13->Map4_|14b->Map4_|14c->Map4_|14d->Map4_
setvariable route6 1->Map1_|1j->Map4_|2->Map4_|2a->Map1_|4->Map4_|4a->Map4_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route7 1->crossing|1j->crossing|2->crossing|2a->crossing|4->crossing|4a->crossing|6->crossing|7a->Map7a_|7b->Map7b_|7c->Map7c_|8->Map8_|8a->Map8_|9a->Map9a_|9b->Map9b_|10->Map10_|11->Map11_|12->Map12_|12a->Map12a_|13->Map7c_|14b->Map7c_|14c->Map7c_|14d->Map7c_
setvariable route7a 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route7b 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route7c 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map13_|14b->Map14b_|14c->Map14c_|14d->Map14d_
setvariable route8 1->Crossing|1j->Crossing|2->Crossing|2a->Crossing|4->Crossing|4a->Crossing|6->Crossing|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8a->Map8a_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route8a 1->Map8_|1j->Map8_|2a->Map8_|4->Map8_|4a->Map8_|6->Map8_|7->Map8_|7a->Map8_|7b->Map8_|7c->Map8_|8->Map8_|9a->Map8_|9b->Map8_|10->Map8_|11->Map8_|12->Map8_|12a->Map8_|13->Map8_|14b->Map8_|14c->Map8_|14d->Map8_
setvariable route9a 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route9b 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|10->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route10 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|11->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route11 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|12->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route12 1->Map7_|1j->Map7_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12a->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route12a 1->Map7_|1j->Map7c_|2->Map7_|2a->Map7_|4->Map7_|4a->Map7_|6->Map7_|7->Map7_|7a->Map7_|7b->Map7_|7c->Map7_|8->Map7_|8a->Map7_|9a->Map7_|9b->Map7_|10->Map7_|11->Map7_|12->Map7_|13->Map7_|14b->Map7_|14c->Map7_|14d->Map7_
setvariable route13 1->Map7c_|1j->Map7c_|2->Map7c_|2a->Map7c_|4->Map7c_|4a->Map7c_|6->Map7c_|7->Map7c_|7a->Map7c_|7b->Map7c_|7c->Map7c_|8->Map7c_|8a->Map7c_|9a->Map7c_|9b->Map7c_|10->Map7c_|11->Map7c_|12->Map7c_|12a->Map7c_|14b->Map7c_|14c->Map7c_|14d->Map7c_
setvariable route14b 1->Map7c_|1j->Map7c_|2->Map7c_|2a->Map7c_|4->Map7c_|4a->Map7c_|6->Map7c_|7->Map7c_|7a->Map7c_|7b->Map7c_|7c->Map7c_|8->Map7c_|8a->Map7c_|9a->Map7c_|9b->Map7c_|10->Map7c_|11->Map7c_|12->Map7c_|12a->Map7c_|13->Map7c_|14c->Map7c_|14d->Map7c_
setvariable route14c 1->Map7c_|1j->Map7c_|2->Map7c_|2a->Map7c_|4->Map7c_|4a->Map7c_|6->Map7c_|7->Map7c_|7a->Map7c_|7b->Map7c_|7c->Map7c_|8->Map7c_|8a->Map7c_|9a->Map7c_|9b->Map7c_|10->Map7c_|11->Map7c_|12->Map7c_|12a->Map7c_|13->Map7c_|14b->Map7c_|14d->Map7c_
setvariable route14d 1->Map7c_|1j->Map7c_|2->Map7c_|2a->Map7c_|4->Map7c_|4a->Map7c_|6->Map7c_|7->Map7c_|7a->Map7c_|7b->Map7c_|7c->Map7c_|8->Map7c_|8a->Map7c_|9a->Map7c_|9b->Map7c_|10->Map7c_|11->Map7c_|12->Map7c_|12a->Map7c_|13->Map7c_|14b->Map7c_|14c->Map7c_
setvar CROSSING_ROUTES 1|1j|2|2a|4|4a|6|7|7a|7b|7c|8|8a|9|9b|10|11|12|12a|13|14b|14c|14d

HAVEN_ROUTES_LABEL:
# Haven routes
setvariable route30 31a->Map30_|31->Map31_|32->Map32_|33->Map33_|33a->Map33_|35->RIVERHAVENTOTHRONE
setvariable route31 30->Map30_|31a->Map30_|32->Map30_|33->Map30_|33a->Map30_|35->Map30_
setvariable route31a 30->Map31_|31->Map31_|32->Map31_|33->Map31_|33a->Map31_|35->Map31_
setvariable route32 30->Map30_|31->Map30_|31a->Map30_|33->Map30_|33a->Map30_|35->Map30_
setvariable route33 30->Map30_|31->Map30_|31a->Map30_|32->Map30_|33a->Map33a_|35->Map30_
setvariable route33a 30->Map33_|31->Map33_|31a->Map33_|32->Map33_|33->Map33_|35->Map33_
setvariable route35 30->THRONETORIVER|31->THRONETORIVER|31a->THRONETORIVER|32->THRONETORIVER|33->THRONETORIVER
setvar HAVEN_ROUTES 30|31|31a|32|33|33a|35

THEREN_ROUTES_LABEL:
# Rossmans routes
setvariable route34 34a->Map34_|40->Map40_|40a->Map40_|41->Map40_|42->Map40_
setvariable route34a 34->Map34_|40->Map34_|40a->Map34_|41->Map34_|42->Map34_
setvar ROSSMAN_ROUTES 34|34a
# Lang/Theren routes
setvariable route40 40a->Map40a_|41->Map41_|42->Map42_|47->BARGETOMUSPARI
setvariable route40a 40->Map40_|41->Map40_|42->Map40_|47->BARGETOMUSPARI
setvariable route41 40->Map40_|40a->Map40_|42->Map40_|47->BARGETOMUSPARI
setvariable route42 40a->Map40_|41->Map40_|42->Map40_|47->BARGETOMUSPARI
setvariable route47 40->MUSPARITOTHEREN|40a->MUSPARITOTHEREN|41->MUSPARITOTHEREN|42->MUSPARITOTHEREN
setvar THEREN_ROUTES 40|40a|41|42|47

LETH_ROUTES_LABEL:
# Leth routes
setvariable route58 59->Map61_|60->Map61_|61->Map61_|62->Map61_|63->Map61_|112->Map61_
setvariable route59 58->Map61_|60->Map61_|61->Map61_|62->Map61_|63->Map61_|112->Map61_
setvariable route60 58->Map61_|59->Map61_|61->Map61_|62->Map61_|63->Map61_|112->Map61_
setvariable route61 58->Map58_|59->Map59_|60->Map60_|62->Map62_|63->Map62_|112->Map112_
setvariable route62 58->Map61_|59->Map61_|60->Map61_|61->Map61_|63->Map63_|112->Map61_
setvariable route63 58->Map62_|59->Map62_|60->Map62_|61->Map62_|62->Map62_|112->Map62_
setvariable route112 58->Map61_|59->Map61_|60->Map61_|61->Map61_|62->Map61_|63->Map61_
setvar LETH_ROUTES 58|59|60|61|62|63|112


SHARD_ROUTES_LABEL:
setvariable route65 66->Map66_|67->Map66_|68->Map66_|68a->Map66_|68b->Map66_|69->Map66_
setvariable route66 65->Map65_|67->Map67_|68->Map68_|68a->Map68_|68b->Map68_|69->Map69_
setvariable route67 66->Map66_|68->Map68_|68a->Map68_|68b->Map68_|69->Map69_
setvariable route68 66->Map66_|67->Map67_|68a->Map68a_|68b->Map68b_|69->Map67_
setvariable route68a 66->Map68_|67->Map68_|68->Map68_|68b->Map68_|69->Map68_
setvariable route68b 66->Map68_|67->Map68_|68->Map68_|68a->Map68_|69->Map68_
setvariable route69 66->Map66_|67->Map66_|68->Map66|68a->Map66_|68b->Map66_
setvariable route143 
setvar SHARD_ROUTES 65|66|67|68|68a|68b|69

HIB_ROUTES_LABEL:
#HIB routes
setvariable route116 123->Map123_|126->Map126_|127->Map126_
setvariable route123 116->Map116_|126->Map116_|127->Map116_
setvariable route126 116->Map116_|123->Map116_|127->Map127_
setvariable route127 116->Map126_|123->Map126_|126->Map126_
setvar HIB_ROUTES 116|123|126|127

RATHA_ROUTES_LABEL:
setvariable route90 90a->Map90a_|91->Map90a_|92->Map92_|95->Map95_
setvariable route90a 90->Map90_|91->Map90_|92->Map90_|95->Map90_
setvariable route91 92->283|95->282
setvariable route92 91->1|95->1
setvariable route95 91->1|92->1
setvar RATHA_ROUTES 90|90a|91|92|95

AESRY_ROUTES_LABEL:
setvariable route98 98a->Map98a_|99->Map99_|99b->Map99_|99c->Map99_|99d->Map99_
setvariable route98a 98->120|99->120|99b->120|99c->120|99d->120
setvariable route99 98->3|98a->3|99b->57|99c->271|99d->309
setvar AESRY_ROUTES 98|98a|99
if "%1" = "menu" then goto MENU_LIST
setvar MENU_LIST PASSED
goto SCRIPT_START


NOCHOICEMADE:
echo **************************************************************
echo
echo Use with latest automapper bundle located on the genie boards
echo
echo http://www.genieclient.com/bulletin/index.php?showtopic=1888
echo
echo USAGE -   .travel (Map ID) (Destination Map Label) 
echo
echo .travel 1 teller    (Move you to the Crossing Map and move you to the teller)
echo .travel 34 gryphon  (Move you to Mistwood Forest(map 34) and then to the gryphon label)
echo .travel menu  (Display a menu of current mapped locations.)
echo
echo **************************************************************
exit




MENU_LIST:
	setvar MENU_LIST PASSED
echo
echo **************************************************************
echo #	Province			Area/Location
echo **************************************************************
echo 1:	-- The Crossing Town and Surrounding Areas
echo
echo 2:	-- Riverhaven, Rossmans, and Throne City
echo
echo 3:	-- Langenfirth, Theren, Hraval, Ker'Leor, and Fornstead
echo
echo 4:	-- Leth Deriel, South Trading Road and Ilaya Taipa
echo 
echo 5:	-- Shard City And Surrounding Areas
echo 
echo 6:	-- Ratha and Surrounding Areas
echo 
echo 7:	-- Aesry and Surrounding Areas
echo **************************************************************
echo
echo  Please Enter Area
matchre CROSSING_LOCATIONS_FULL 1
matchre HAVEN_LOCATIONS_FULL 2
matchre THEREN_LOCATIONS_FULL 3
matchre LETH_LOCATIONS_FULL 4
matchre SHARD_LOCATIONS_FULL 5
matchre RATHA_LOCATIONS_FULL 6
matchre AESRY_LOCATIONS_FULL 7
matchwait

CROSSING_LOCATIONS_FULL:
echo **************************************************************
echo       Crossing to NTR Locations
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   1   - Crossing
echo   2   - Lake of Dreams
echo   2a  - Crossing Temple
echo   4   - Crossing West Gate
echo   4a  - Tiger Clan
echo   5a  - Knife Clan
echo   6   - Crossing North Gate
echo   7   - Lower North Trade Road
echo   7a  - Vineyard
echo   7b  - Arthe Dale
echo   7c  - Upper North Trade Road
echo   8   - Crossing East Gate
echo   8a  - Lost Crossing
echo   9a  - Rock Trolls
echo   9b  - Sorrows Reach
echo   10  - Lairocott Brach and Abandoned Mine
echo   11  - Vipers, Black Leucros
echo   12  - Feanrea Reavers
echo   12a - Misenseor Abbey
echo   13  - Dirge
echo   14b - Greater Fist
echo   14c - Faldesu River
echo   14d - NTR Moon Mage Guild
goto SECOND_MOVEMENT_SET



HAVEN_LOCATIONS_FULL:
echo **************************************************************
echo     Riverhaven, Rossmans, and Throne City
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   30  - Riverhaven Town
echo   30a - Dunshade Manor
echo   31  - Riverhaven East Gate
echo   31a - Zaulfung
echo   32  - Riverhaven North Gate 
echo   33  - Riverhaven West Gate 
echo   33a - Road To Rossmans			         
echo   34  - Mistwood Forest
echo   34a - Rossmans Landing    
echo   35  - Throne City  
echo		
goto SECOND_MOVEMENT_SET
exit

THEREN_LOCATIONS_FULL:
echo **************************************************************
echo     Langenfirth and Threnbourough,  Hraval, Ker'Leor, and Fornstead
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   40  - Langenfirth TO Therenbourough
echo   40a - Rakesh Town And surrounding area
echo   41  - Vines, Maruaders, Hraval, Ker'Leor, and Fornstead
echo   42  - Therenbourough and Keep
echo   47  - Muspar'i
goto SECOND_MOVEMENT_SET
exit

LETH_LOCATIONS_FULL:
echo **************************************************************
echo      Leth Deriel, South Trading Road and Ilaya Taipa
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   50  - Segoltha River
echo   58  - Acenamacra Village
echo   59  - Boogy Wood
echo   60  - South Trading Road (Ferry To Leth Deriel)
echo   61  - Leth Deriel
echo   62  - South Trading Road (Leth Deriel To Gondola)
echo   63  - Oshu'ehhrsk Manor
echo   112 - Ilaya Taipa
goto SECOND_MOVEMENT_SET
exit

SHARD_LOCATIONS_FULL:
echo **************************************************************
echo     Shard City, West, South and North Gate Areas
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   65  - South Trading Road (Gondola to Shard)
echo   66  - Under The Gondola
echo   67  - Shard City
echo   68  - Shard South Gate
echo   68a - Ice Caves
echo   68b - Lost Ground
echo   69  - Shard West Gate
goto SECOND_MOVEMENT_SET
exit

RATHA_LOCATIONS_FULL:
echo **************************************************************
echo     Shard City, West, South and North Gate Areas
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   90  - Ratha, all tiers and sewers
echo   90a - Sand Sprites and Ochre La'heke
echo   92  - Ratha Northwest Gate
echo   95  - Ratha Northeast Gate
goto SECOND_MOVEMENT_SET
exit

AESRY_LOCATIONS_FULL:
echo **************************************************************
echo     Shard City, West, South and North Gate Areas
echo **************************************************************
echo
echo  Mapid    Name
echo
echo   98  - Road To Aesry
echo   98a - Sea Caves
echo   99  - Aesry Surlaenis'a
goto SECOND_MOVEMENT_SET
exit


SECOND_MOVEMENT_SET:
echo
echo Select the Map you would like to move to from the above list.
echo       or run the menu again to select a new area.
echo Please note that moving to labels will not work from this menu.
echo
Echo Please Enter Map:
Echo
MOVE_TO_MAP:
waitfor Please rephrase that command
pause 1
setvar finaldirectionsave $lastcommand
goto SCRIPT_START 

SCRIPT_START:

if "%MENU_LIST" != "PASSED" then goto MENU_LIST
put info
pause 1
setvar DIRECTION_VARIABLE NOTSET
setvar finaldirection %finaldirectionsave
setvar SECOND_MOVEMENT_FINAL %SECOND_MOVEMENT_FINAL_SAVE
	if matchre ("%finaldirection", "(%HAVEN_ROUTES)") then goto GET_TO_HAVEN_ROUTE
		else if matchre ("%finaldirection", "(%THEREN_ROUTES)") then goto GET_TO_THEREN_ROUTE
			else if matchre ("%finaldirection", "(%ROSSMAN_ROUTES)") then goto GET_TO_ROSSMAN_ROUTE
			 else if matchre ("%finaldirection", "(%LETH_ROUTES)") then goto GET_TO_LETH_ROUTE
				else if matchre ("%finaldirection", "(%SHARD_ROUTES)") then goto GET_TO_SHARD_ROUTE
					else if matchre ("%finaldirection", "(%HIB_ROUTES)") then goto GET_TO_HIB_ROUTE
						else if matchre ("%finaldirection", "(%CROSSING_ROUTES)") then goto GET_TO_CROSSING_ROUTE
							else if matchre ("%finaldirection", "(%RATHA_ROUTES)") then goto GET_TO_RATHA_ROUTE
								else if matchre ("%finaldirection", "(%AESRY_ROUTES)") then goto GET_TO_AESRY_ROUTE
goto ERROR_NO_LOCATION_FOUND

GET_TO_CROSSING_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto HAVEN_TO_CROSSING_CHECK
		else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto THEREN_TO_HAVEN
			else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ROSSMAN_TO_HAVEN_CHECK
			 else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto LETH_TO_CROSSING
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto SHARD_TO_LETH
				 else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto HIB_TO_SHARD
				  else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto loop
				  	else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  		else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
goto ERROR_NO_LOCATION_FOUND


GET_TO_HAVEN_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto loop
		else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto THEREN_TO_HAVEN
			else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ROSSMAN_TO_HAVEN_CHECK
  		 else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto LETH_TO_CROSSING
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto SHARD_TO_LETH
				 else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto HIB_TO_SHARD
				  else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto CROSSING_TO_HAVEN
           else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  	else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
						
goto ERROR_NO_LOCATION_FOUND


GET_TO_THEREN_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto HAVEN_TO_THEREN
		else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto loop
		 else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ROSSMAN_TO_THEREN
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto LETH_TO_CROSSING
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto SHARD_TO_LETH
					else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto HIB_TO_SHARD
					 else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto CROSSING_TO_HAVEN
					 	else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  	 else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
					 	
goto ERROR_NO_LOCATION_FOUND

GET_TO_ROSSMAN_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto HAVEN_TO_THEREN
		else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto THEREN_TO_MISTWOOD
			else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto loop			
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto LETH_TO_CROSSING
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto SHARD_TO_LETH
					else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto HIB_TO_SHARD
					 else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto CROSSING_TO_HAVEN
					 	else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  	 else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
goto ERROR_NO_LOCATION_FOUND


GET_TO_LETH_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto HAVEN_TO_CROSSING_CHECK
		else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto THEREN_TO_HAVEN
		 else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ROSSMAN_TO_HAVEN_CHECK
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto loop
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto SHARD_TO_LETH
					else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto HIB_TO_SHARD
					 else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto CROSSING_TO_LETH
					  else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  	 else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
goto ERROR_NO_LOCATION_FOUND


GET_TO_SHARD_ROUTE:
	 if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto HAVEN_TO_CROSSING_CHECK
		else if "$zoneid" = "62" then goto GOTO_NORTH_PLATFORM
		else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto THEREN_TO_HAVEN
		 else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ROSSMAN_TO_HAVEN_CHECK
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto LETH_TO_SHARD
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto loop
				 else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto HIB_TO_SHARD
				  else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto CROSSING_TO_LETH
				  	else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  	 else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
goto ERROR_NO_LOCATION_FOUND

GET_TO_HIB_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto HAVEN_TO_CROSSING_CHECK
	else if "$zoneid" = "62" then goto GOTO_NORTH_PLATFORM
	 else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto THEREN_TO_HAVEN
		else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ROSSMAN_TO_HAVEN_CHECK
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto LETH_TO_SHARD
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto SHARD_TO_HIB
				 else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto loop
				  else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto CROSSING_TO_LETH
				   else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_ISLANDS
				  	else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_ISLANDS
goto ERROR_NO_LOCATION_FOUND

GET_TO_RATHA_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto ON_MAINLAND
	 else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto ON_MAINLAND
		else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ON_MAINLAND
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto ON_MAINLAND
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto ON_MAINLAND
				 else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto ON_MAINLAND
				  else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto ON_MAINLAND
				   else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto ON_AESRY
				  	else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto loop
goto ERROR_NO_LOCATION_FOUND


GET_TO_AESRY_ROUTE:
	if matchre ("$zoneid", "(%HAVEN_ROUTES)") then goto ON_MAINLAND
	 else if matchre ("$zoneid", "(%THEREN_ROUTES)") then goto ON_MAINLAND
		else if matchre ("$zoneid", "(%ROSSMAN_ROUTES)") then goto ON_MAINLAND
			else if matchre ("$zoneid", "(%LETH_ROUTES)") then goto ON_MAINLAND
				else if matchre ("$zoneid", "(%SHARD_ROUTES)") then goto ON_MAINLAND
				 else if matchre ("$zoneid", "(%HIB_ROUTES)") then goto ON_MAINLAND
				  else if matchre ("$zoneid", "(%CROSSING_ROUTES)") then goto ON_MAINLAND
				   else if matchre ("$zoneid", "(%AESRY_ROUTES)") then goto loop
				  	else if matchre ("$zoneid", "(%RATHA_ROUTES)") then goto ON_RATHA
goto ERROR_NO_LOCATION_FOUND


ERROR_NO_LOCATION_FOUND:
Echo No location was found?
exit

ON_RATHA:
echo You are currently on Ratha, Sorry I cant travel to Aesry from here.
echo 
echo Time to catch a boat or get a gate.
exit

ON_AESRY:
echo You are currently on Aesry, Sorry I cant travel to Ratha from here.
echo 
echo Time to catch a boat or get a gate.
exit

ON_ISLANDS:
echo 
echo You are currently on the islands.
echo
echo This script is unable to move you to the islands. You will need to travel another way
exit

ON_MAINLAND:
echo 
echo You are currently on the Mainland requesting to go to the islands. 
echo
echo This script is unable to move you to the islands. You will need to travel another way.
exit

WEALTH_CHECK:
send wealth
pause 1
return

### START PROGRAM LOOP
loop:
# check if in destination zone
if "$zoneid" = "%finaldirection" then
{
	if "%SECOND_MOVEMENT_FINAL" = "" then goto end
	put #goto %SECOND_MOVEMENT_FINAL
	waitforre ^YOU HAVE ARRIVED$
	goto end
}

# look up gateway to next closest zone

setvariable route.temp %route$zoneid
gosub aa.lookup route.temp %finaldirection gateway.room

if "%gateway.room" = "MUSPARITOTHEREN" then goto MUSPARITOTHEREN
if "%gateway.room" = "BARGETOMUSPARI" then goto BARGETOMUSPARI
if "%gateway.room" = "THRONETORIVER" then goto THRONETORIVER
if "%gateway.room" = "RIVERHAVENTOTHRONE" then goto RIVERHAVENTOTHRONE
if "%gateway.room" = "NULL" then goto error.no.route

put #goto %gateway.room
waitforre ^YOU HAVE ARRIVED$
goto loop


error.not.two.args:
echo USAGE .move <zone> <room>
goto end

error.no.route:
echo NO ROUTE FOUND
goto end

end:
if "$zoneid" = "%finaldirectionsave" then goto EXIT_MESSAGE
	goto SCRIPT_START


EXIT_MESSAGE:
echo You Have Arrived at Map $zoneid
echo $roomname
put #parse TRAVEL COMPLETE
exit

### END PROGRAM LOOP



###  GOSUBS

# associative array lookup gosub
# define a-arrays like: setvar array LUvalue1->value1|LUvalue2->value2
# sets the value of the variable name given in the third arguement to the
#     associated value if found, to "NULL" otherwise

aa.lookup:
# <array name> <lookup value> <return variable name>

# store passed values locally to not mess with regex capturing later
setvariable aa.name $1
setvariable lu.value $2
setvariable return.name $3

# determine length of array
setvariable array.place 0
eval array.max count("%%aa.name", "|")


aa.lookup.loop:
eval result element("%%aa.name", %array.place)

# split the element on the ->
if matchre("%result", "\b%lu.value\b\-\>(\S+)") then
{
	setvariable %return.name $1
	return
}

math array.place add 1
if %array.place > %array.max then
{
	setvariable %return.name NULL
	pause
	return
}

goto aa.lookup.loop

setvar FIRST_MOVE %1
setvar SECOND_MOVE %2
echo past it here!
exit

CROSSING_VARIABLE:
	setvar finaldirection 1
setvar SECOND_MOVEMENT_FINAL teller
goto loop

CROSSING_TO_HAVENFERRY_VARIABLE:
if "$zoneid" = "7c" and $roomid = 81 then goto CROSSINGFERRYNORTH
setvar finaldirection 7c
setvar SECOND_MOVEMENT_FINAL ferry
goto loop
	

HAVEN_VARIABLE:
		setvar finaldirection 30
setvar SECOND_MOVEMENT_FINAL temple
goto loop

THEREN_VARIABLE:
		setvar finaldirection 42
setvar SECOND_MOVEMENT_FINAL teller
goto loop

LETH_VARIABLE:
	setvar finaldirection 61
setvar SECOND_MOVEMENT_FINAL teller
goto loop

SHARD_VARIABLE:
	setvar finaldirection 66
setvar SECOND_MOVEMENT_FINAL 
goto loop

ROSSMANS_VARIABLE:
	setvar finaldirection 34
setvar SECOND_MOVEMENT_FINAL 
goto loop

FALDESU_VARIABLE:
setvar finaldirection 14c
setvar SECOND_MOVEMENT_FINAL riverhaven
goto loop

LANG_ROAD_VARIABLE:
setvar finaldirection 40
setvar SECOND_MOVEMENT_FINAL bin
goto loop


CROSSING_TO_HAVEN:
	if "%HAVENQUICKROUTE" = "CHECKOK" then goto FALDESU_VARIABLE
  gosub WEALTH_CHECK
  pause 1
  if %WEALTH_LIRUMS >= 60 then goto CROSSING_TO_HAVENFERRY_VARIABLE
  if "$zoneid" = "1" and %WEALTH_LIRUMS < 60 then goto GET_MONEY_HAVEN_FERRY_NORTH
 	if "$zoneid" != "1" then goto CROSSING_VARIABLE 

MOVE_TO_Map7c_:
	put #goto Map7c_
	waitfor YOU HAVE ARRIVED
	goto SCRIPT_START

WALK_CROSSING_TO_HAVEN:
	put #goto NEGATE
	waitfor YOU HAVE ARRIVED
	put #goto Map7c_
	waitfor YOU HAVE ARRIVED
	put #goto Faldesu
  waitfor YOU HAVE ARRIVED
FALDESU_RETURN:
  put #goto Riverhaven
  waitfor YOU HAVE ARRIVED
  goto SCRIPT_START






##########################################
### FERRY - NORTH TRADE ROUTE TO HAVEN ###
##########################################

CROSSING_TO_HAVEN_FERRY:
	gosub WEALTH_CHECK
if %WEALTH_KRONARS >= 60 then goto CROSSING_TO_HAVENFERRY_VARIABLE



	


GET_MONEY_HAVEN_FERRY_NORTH:
	put #goto teller
	waitfor YOU HAVE ARRIVED
	put withdraw 2 sil
	put #goto exchange
	waitfor YOU HAVE ARRIVED
	put exc all kro for lir
	put #goto NEGATE
	waitfor YOU HAVE ARRIVED
	HAVEN_FERRY_RETURN:
	put #goto Map7c_
	waitfor YOU HAVE ARRIVED
	put #goto ferry
	waitfor YOU HAVE ARRIVED

CROSSINGFERRYNORTH:
put go ferry
matchre WAITFORHAVENFERRYNORTH wait for the next one.|until the next one arrives.|I could not find what you were referring to.|What were you referring to?|There is no ferry here to go aboard.
matchre WAITONHAVENFERRYNORTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
matchre GETMONEYCROSSINGFERRYNORTH You haven't got enough
matchwait

NTR2_HAVENFERRYNORTH_WAIT:
put stand
pause
put go ferry
matchre WAITFORHAVENFERRYNORTH wait for the next one.
matchre WAITFORHAVENFERRYNORTH until the next one arrives.
matchre WAITFORHAVENFERRYNORTH I could not find what you were referring to.
matchre WAITFORHAVENFERRYNORTH What were you referring to?
matchre WAITONHAVENFERRYNORTH You hand him your lirums and climb aboard.
matchre WAITONHAVENFERRYNORTH The Captain gives you a little nod
matchre NOMONEY You haven't got enough lirums
matchwait

WAITFORHAVENFERRYNORTH:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
put hide
waitfor pulls up to the dock
put go ferry
goto WAITONHAVENFERRYNORTH


WAITONHAVENFERRYNORTH:
Echo Waiting on Ferry - Heading to Riverhaven
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
move go ramp
move go wooden archway
move ne
move w
goto SCRIPT_START

GETMONEYCROSSINGFERRYNORTH:
ECHO YOU NEED TO GET CASH!
exit


#########################################
###     HAVEN TO NORTH TRADE ROAD     ###
#########################################

HAVEN_TO_CROSSING_CHECK:
if "$zoneid" != "30" then goto HAVEN_VARIABLE
if "%HAVENQUICKROUTE" = "CHECKOK" then goto RIVERHAVEN_TO_CROSSING_SWIM
goto FERRY_HAVEN_TO_CROSSING
RIVERHAVEN_TO_CROSSING_SWIM:
	put #goto Map31_
	waitfor YOU HAVE ARRIVED
	put #goto Map14c_
	waitfor YOU HAVE ARRIVED
	put #goto Map7c_
	waitfor YOU HAVE ARRIVED
	goto SCRIPT_START

FERRY_HAVEN_TO_CROSSING:
gosub WEALTH_CHECK
pause
if %WEALTH_LIRUMS < 30 then goto GET_MONEY_HAVEN_FERRY_SOUTH
pause 
put #goto 103
waitfor Riverhaven, Ferry Dock
pause
put go ferry
matchre WAITFORHAVENFERRYSOUTH wait for the next one.|until the next one arrives.|I could not find what you were referring to.|What were you referring to?
matchre WAITONHAVENFERRYSOUTH You hand him your lirums and climb aboard.|The Captain gives you a little nod
matchre GET_MONEY_HAVEN_FERRY_SOUTH You haven't got enough lirums
matchwait

WAITFORHAVENFERRYSOUTH:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
put hide
waitfor pulls up to the dock
put go ferry
goto WAITONHAVENFERRYSOUTH

GET_MONEY_HAVEN_FERRY_SOUTH:
ECHO
ECHO *** GETTING LIRUMS FROM BANK ***
ECHO
put #goto teller
waitfor YOU HAVE ARRIVED
put withdraw 35 copper
pause
GOTO FERRY_HAVEN_TO_CROSSING

WAITONHAVENFERRYSOUTH:
pause
Echo *** Waiting On Ferry Heading towards the Crossing ****
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
move south
pause
move south
goto SCRIPT_START


#########################################
###          HAVEN TO THEREN          ###
#########################################

HAVEN_TO_THEREN:
	if "$zoneid" != "30" then goto SET_HAVEN_MOVEMENT
	if "%RIVERTOROSSMANS" = "CHECKOK" then goto WALK_TO_THEREN
	goto MOVE_RIVERHAVEN_BARGE_TO_LANG
	SET_HAVEN_MOVEMENT:
setvar finaldirection 30
setvar SECOND_MOVEMENT_FINAL temple
		goto loop
	
	
MOVE_RIVERHAVEN_BARGE_TO_LANG:
pause
put #goto 99
waitfor Riverhaven, Pier
goto NORTHBARGE


NORTHBARGE:
put stand
pause
	matchre WAITFORNORTHBARGE wait for the next one|until the next one arrives|There is no ferry
	matchre WAITONNORTHBARGE You hand him your lirums and climb aboard|The Captain gives you a little nod
	matchre GETMONEYNORTHBARGE You haven't got enough lirums
put go barge
matchwait

WAITFORNORTHBARGE:
echo
echo *** WAITING FOR THE BARGE TO ARRIVE ***
echo
put hide
waitfor pulls into the
goto NORTHBARGE

GETMONEYNORTHBARGE:
echo
echo *** GETTING LIRUMS FROM BANK ***
echo
put #goto teller
waitfor you have arrived
put withdraw 13 bronze
pause
move go arch
move out
move s
move s
move se
move go municipal pier
move go wooden archway
move w
move n
move w
pause
	matchre WAITFORNORTHBARGE wait for the next one|until the next one arrives|There is no ferry
	matchre WAITONNORTHBARGE You hand him your lirums and climb aboard|The Captain gives you a little nod
	matchre NONORTHBARGE You haven't got enough lirums
put go barge
matchwait

NONORTHBARGE:
pause
echo
echo *** You do not have enough Lirums in Riverhaven to ride the barge to Langenfirth.  Find some money and try again.
echo
EXIT

WAITONNORTHBARGE:
pause
echo
echo *** Riding the barge west across Lake Gwenalion to the Ranger town of Langenfirth
echo *** This barge and casino is owned by Ditsworth, sailing since 305 AV.
echo
pause 90
echo
echo ====================================
echo *** Common Knowledge: 1 of 1
echo
echo * * * Langenfirth is named for a monk named Langen who lived in the firth.
echo * * * Langen came to the fishing village on Lake Gwenalion in 240 AV, almost 150 years ago.
echo
echo * * * Though at first shunned by the villagers, Langen won them over by brewing
echo * * * one of the finest ales ever made, crafted from the waters of Lake Gwenalion.
echo * * * Langen Ale is now known throughout the world.
echo
echo * * * Langen's Feast is celebrated in all the villages around
echo * * * Lake Gwenalion on the 3rd day of Ka'Len the Sea Drake each year.
echo ====================================
echo
pause
waitfor crew ties the barge off.
put stand
pause
move go wharf
move w
move s
goto SCRIPT_START


ROSSMAN_TO_THEREN:
	if $zoneid != "34" then goto ROSSMANS_VARIABLE
	put #goto MAP40_
	waitfor YOU HAVE ARRIVED
	goto SCRIPT_START

ROSSMAN_TO_HAVEN_CHECK:
 	if $zoneid != "34" then goto ROSSMANS_VARIABLE
 	if "%ROSSMANSTORIVER" = "CHECKFAILED" then goto ROSSMAN_TO_THEREN
  goto MISTWOOD_TO_HAVEN

THEREN_TO_MISTWOOD:
	if $zoneid != "40" then goto LANG_ROAD_VARIABLE
	put #goto Map34_
	waitfor YOU HAVE ARRIVED
	goto SCRIPT_START

THEREN_TO_HAVEN:
if "$zoneid" != "42" then goto THEREN_VARIABLE
if "%ROSSMANSTORIVER" = "CHECKOK" then goto WALK_THEREN_TO_HAVEN
	goto LANG_BARG_TO_HAVEN

WALK_THEREN_TO_HAVEN:
	put #goto town gate
	waitfor YOU HAVE ARRIVED
	put #goto Map34_
	waitfor YOU HAVE ARRIVED
MISTWOOD_TO_HAVEN:
	put #goto Map33a_
 waitfor YOU HAVE ARRIVED

move sw
move s
move se
move s
move s
put s

SEARCHOUTCROP3A:
match SEARCHOUTCROP3B irregular handholds!
match SEARCHOUTCROP3A don't find anything of interest.
match pause ...wait
match pause type ahead
put search outcrop
matchwait

SEARCHOUTCROP3B:
move climb handhold
move climb handhold
move sw
move se
pause
put #goto Map33_
 waitfor YOU HAVE ARRIVED
put #goto Map30_
 waitfor YOU HAVE ARRIVED
 goto SCRIPT_START

###################################
###### LANG BARGE TO HAVEN  #######
###################################
LANG_BARG_TO_HAVEN:
LANG_BARGE_TO_HAVEN:
gosub WEALTH_CHECK
if %WEALTH_LIRUMS < 150 then goto GET_MONEY_THEREN
pause
put #goto town gate
waitfor YOU HAVE ARRIVED
put #goto riverhaven
waitfor YOU HAVE ARRIVED
goto SOUTHBARGE

GET_MONEY_THEREN:
	put #goto Teller
	waitfor YOU HAVE ARRIVED
	put withdraw 200 copper
	goto LANG_BARGE_TO_HAVEN



SOUTHBARGE:
put stand
pause
	matchre WAITFORSOUTHBARGE wait for the next one|until the next one arrives|There is no ferry
	matchre WAITONSOUTHBARGE You hand him your lirums and climb aboard|The Captain gives you a little nod
	matchre NOMONEY You haven't got enough lirums
put go barge
matchwait

WAITFORSOUTHBARGE:
echo
echo *** WAITING FOR THE BARGE TO ARRIVE ***
echo
put hide
waitfor pulls into the
GOTO SOUTHBARGE

WAITONSOUTHBARGE:
pause
echo
echo *** Riding the barge across Lake Gwenalion to Riverhaven
echo *** This barge and casino is owned by Ditsworth, sailing since 305 AV.
echo
pause 90
echo
echo =================================
echo *** Common Knowledge: 1 of 2
echo * * * The currency of the Therengian province is the Lirum.
echo * * * The Lirum is named after the wife of Akroeg the Ram.
echo
echo * * * Akroeg united all the races under the banner of the Ram Clan.
echo * * * After Akroeg's death his work was continued by his wife, his son Verek, Barbalas, and the scholar Moliko.
echo * * * This group ended the Ram Clan and formed the Seven Pointed Star Empire.
echo =================================
echo
pause 90
echo
echo =================================
echo *** Common Knowledge: 2 of 2
echo * * * Akroeg's son Verek was annointed the first emperor
echo * * * Vereklaath or Founding Day is celebrated on the 1st day of the month of Akroeg the Ram
echo * * * Vereklaath is celebrated by parades of soldiers in full armor and exchange of gifts among Therengians
echo =================================
echo
waitfor crew ties the barge off.
put stand
pause
move go pier
move e
put #goto Temple
waitfor YOU HAVE ARRIVED
goto SCRIPT_START


WALK_TO_THEREN:
	put #goto Map33_
	waitfor YOU HAVE ARRIVED
	put #goto Map33a_
	waitfor YOU HAVE ARRIVED
		put #goto 14
	waitfor YOU HAVE ARRIVED
	
SEARCHOUTCROP1A:
pause
save SEARCHOUTCROP1A
match SEARCHOUTCROP1B irregular handholds!
match SEARCHOUTCROP1A don't find anything of interest.
match pause ...wait
match pause type ahead
put search outcrop
matchwait

SEARCHOUTCROP1B:
move climb handhold
move climb rock wall
move n

SEARCHOUTCROP2A:
match SEARCHOUTCROP2B shrubs clinging to the rock face!
match SEARCHOUTCROP2A don't find anything of interest.
match pause ...wait
match pause type ahead
put search rocky ledge
matchwait

SEARCHOUTCROP2B:
move climb shrub
pause
match 1SW head southwest.
match 1W head west.
match 1NW head northwest.
match 1N head north.
match 1NE head northeast.
match 1E head east.
match 1SE head southeast.
put peer path
matchwait

1SW:
move d
move sw
goto 1CONTINUE
1W:
move d
move w
goto 1CONTINUE
1NW:
move d
move nw
goto 1CONTINUE
1N:
move d
move n
goto 1CONTINUE
1NE:
move d
move ne
goto 1CONTINUE
1E:
move d
move e
goto 1CONTINUE
1SE:
move d
move se
goto 1CONTINUE

1CONTINUE:
pause
matchre CONTINUEMOVENORTHWEST northwest
matchre CONTINUEMOVENORTHEAST northeast 
matchre CONTINUEMOVENORTH north
put look
matchwait

move_random:
put n
put ne
put nw
goto CONTINUEAGAIN


CONTINUEMOVENORTHWEST:
pause
move NW
goto CONTINUEAGAIN

CONTINUEMOVENORTHEAST:
move NE
goto CONTINUEAGAIN

CONTINUEMOVENORTH:
move north
goto CONTINUEAGAIN

CONTINUEAGAIN:
pause
put #goto 48
waitfor YOU HAVE ARRIVED
goto SCRIPT_START

CROSSING_TO_LETH:
if "$zoneid" != "1" then goto CROSSING_VARIABLE
gosub WEALTH_CHECK
pause 1
if "%THIEF" = "YES" then goto MOVE_STR_THIEF_PASSAGE
if %WEALTH_KRONARS < 69 then goto GET_MONEY_CROSSING
put #goto Ferry
waitfor YOU HAVE ARRIVED
goto CROSSING_FERRY_SOUTH_DOCK

GET_MONEY_CROSSING:
	put #goto teller
	waitfor YOU HAVE ARRIVED
	put withdraw 70 cop
	goto CROSSING_TO_LETH
	
	
	
	
MOVE_STR_THIEF_PASSAGE:
	put #goto Map1a_
	waitfor YOU HAVE ARRIVED
	put #goto Map60_
	waitfor YOU HAVE ARRIVED
	goto SCRIPT_START
	

####################################
###### CROSSING FERRY SOUTH  #######
####################################

CROSSING_FERRY_SOUTH_DOCK:
	matchre WAITFORCROSSINGFERRYSOUTH wait for the next one|until the next one arrives|I could not find what you were referring to
	matchre WAITFORCROSSINGFERRYSOUTH What were you referring to|There is no ferry here to go aboard
	matchre WAITONCROSSINGFERRYSOUTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
	matchre GETMONEYCROSSINGFERRYSOUTH You haven't got enough
put go ferry
matchwait

WAITFORCROSSINGFERRYSOUTH:
echo
echo *** WAITING FOR THE FERRY TO ARRIVE ***
echo
put hide
waitfor pulls into the
put go ferry
goto WAITONCROSSINGFERRYSOUTH

GETMONEYCROSSINGFERRYSOUTH:
echo
echo *** GETTING KRONARS FROM THE BANK ***
echo
put #goto 234
waitfor Provincial Bank, Teller
put withdraw 70 copper
pause
goto MOVE_CROSSING_FERRY_SOUTH

WAITONCROSSINGFERRYSOUTH:
pause
echo *** WAITING ON THE FERRY HEADING TOWARDS THE SOUTH TRADE ROAD ***
waitfor crew ties the ferry off.
put stand
pause
move go dock
pause
move s
move s
move s
pause
goto SCRIPT_START


leth_to_crossing:
if "$zoneid" = "60" and "%THIEF" = "YES" then goto MOVE_TO_CROSSING_THIEF_LETHSIDE
if "$zoneid" = "60" then goto MOVE_TO_CROSSING_FERRY
if "$zoneid" != "61" then goto LETH_VARIABLE
gosub wealth_check
if %WEALTH_KRONARS < 69 then goto GET_MONEY_LETH
	put #goto Map60_
	waitfor YOU HAVE ARRIVED
MOVE_TO_CROSSING_FERRY:
	put #goto Ferry
	waitfor YOU HAVE ARRIVED
MOVE_CROSSING_FERRY_TO_CROSSING:
	matchre WAITFORCROSSINGFERRYNORTH wait for the next one|until the next one arrives|I could not find what you were referring to
	matchre WAITFORCROSSINGFERRYNORTH What were you referring to|There is no ferry here to go aboard
	matchre WAITONCROSSINGFERRYNORTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
	matchre GETMONEYCROSSINGFERRYNORTH You haven't got enough
put go ferry
matchwait


MOVE_TO_CROSSING_THIEF_LETHSIDE:
		put #goto Map1a_
	waitfor YOU HAVE ARRIVED
	put #goto crossing
waitfor YOU HAVE ARRIVED
goto SCRIPT_START

WAITFORCROSSINGFERRYNORTH:
echo
echo *** WAITING FOR THE FERRY TO ARRIVE ***
echo
waitfor pulls into the
goto MOVE_CROSSING_FERRY_TO_CROSSING


WAITONCROSSINGFERRYNORTH:
pause
echo *** WAITING ON THE FERRY HEADING TOWARDS THE CROSSING ***
waitfor crew ties the ferry off.
put stand
put go dock
pause
goto SCRIPT_START

	
GET_MONEY_LETH:
	put withdraw 70 cop
	goto leth_to_crossing
	
	LETH_TO_SHARD:
		if "$zoneid" != "61" then goto LETH_VARIABLE
		
		put #goto Map62_
		waitfor YOU HAVE ARRIVED
		GOTO_NORTH_PLATFORM:
		put #goto Platform
		waitfor YOU HAVE ARRIVED
		
2NORTH-PLATFORM:
pause
	matchre WAITONSOUTHGONDOLA Gondola
	matchre WAITFORSOUTHGONDOLA There is no
put go gondola
matchwait

WAITFORSOUTHGONDOLA:
pause
put look
	matchre GETONSOUTHGONDOLA The gondola stops on the platform
	matchre WAITFORSOUTHGONDOLA YOU HAVE BEEN IDLE
matchwait 

GETONSOUTHGONDOLA:
matchre WAITFORSOUTHGONDOLA There is no wooden gondola here
matchre WAITONSOUTHGONDOLA Worn down to a dusky grey color|Painted to a deep mist-twilight color
put stand
pause
move go gondola
matchwait

WAITONSOUTHGONDOLA:
pause
put s
	matchre GETOFFSOUTHGONDOLA ^With a soft bump, the gondola comes to a stop at its destination.
	matchre WAITONSOUTHGONDOLA YOU HAVE BEEN IDLE
matchwait 

GETOFFSOUTHGONDOLA:
put out
pause
move go frame
move go door
pause
goto SCRIPT_START





SHARD_TO_LETH:
	if "$zoneid" != "66" then goto SHARD_VARIABLE
	put #goto Platform
	waitfor YOU HAVE ARRIVED	
	southgondolacheck:
echo *** Southern Gondola Platform
goto 2SOUTH-PLATFORM

2SOUTH-PLATFORM:
pause
	matchre WAITONNORTHGONDOLA \[Gondola
	matchre WAITFORNORTHGONDOLA There is no
put go gondola
matchwait

WAITFORNORTHGONDOLA:
pause
echo
echo *** WAITING FOR THE GONDOLA TO ARRIVE ***
echo
echo * * * If you believe you can take the quick shortcut under the
echo * * * gondola (approximately 540 base ranks of climbing) type SHORTCUT2
echo
pause
put look;glance gondola
	match GETONNORTHGONDOLA The gondola stops on the platform
	match WAITFORNORTHGONDOLA YOU HAVE BEEN IDLE
	match snundergondola SHORTCUT2
	match longundergondola SHORTCUT1
matchwait 

GETONNORTHGONDOLA:
put stand
pause
move go gondola
goto WAITONNORTHGONDOLA

snundergondola:
pause
move go frame
move go door
move sw
move s
move go trail
move ne
move nw
move n
move ne
move w
move w
move go crevice
move go woodlands
move ne
move ne
move n
move ne
move n
move n

2CLIMB-LOG:
SAVE 2CLIMB-LOG
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	match 2FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

2FAIL-LOG:
SAVE 2FAIL-LOG
pause
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	match 3FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

3FAIL-LOG:
SAVE 3FAIL-LOG
pause
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	match 4FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

4FAIL-LOG:
SAVE 4FAIL-LOG
pause
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	match 3CLIMBED-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

2CLIMB-EMBANKMENT:
SAVE 2CLIMB-EMBANKMENT
	match 2CLIMBED-EMBANKMENT Utter stillness and the grandiose play of nature
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb embankment
matchwait

2CLIMBED-EMBANKMENT:
move sw
move s
move down
goto 2CLIMB-WALL

2CLIMB-WALL:
SAVE 2CLIMB-WALL
	match 2CLIMB-LEDGE Vegetation creeps in and out
	match 2FAIL-WALL steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

2FAIL-WALL:
SAVE 2FAIL-WALL
pause
	match 2CLIMB-LEDGE Vegetation creeps in and out
	match 3FAIL-WALL steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

3FAIL-WALL:
SAVE 3FAIL-WALL
pause
	match 2CLIMB-LEDGE Vegetation creeps in and out
	match 4FAIL-WALL steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

4FAIL-WALL:
SAVE 4FAIL-WALL
pause
	match 2CLIMB-LEDGE Vegetation creeps in and out
	match FAILED-WALL steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

FAILED-WALL:
pause
put retreat
move up
move n
move ne
goto 3CLIMB-EMBANKMENT

3CLIMB-EMBANKMENT:
SAVE 3CLIMB-EMBANKMENT
	match 3CLIMB-LOG Willowy branches reach out
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
put climb embankment
matchwait

3CLIMB-LOG:
SAVE 3CLIMB-LOG
	match 3CLIMBED-LOG Tamarisk bushes display their feathery
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

3CLIMBED-LOG:
move s
move s
move sw
move s
move sw
move sw
move go cleft
move go crack
move e
move e
move sw
move s
move se
move sw
move go trail
move n
move ne
move go door
move go frame
pause
echo
echo *** You have failed 4 attempts to climb under the gondola.
echo *** Maybe you should just wait for the gondola like everyone else?
echo
goto 2SOUTH-PLATFORM

2CLIMB-LEDGE:
SAVE 2CLIMB-LEDGE
	match 2CLIMB-NICHE The steep climb shows no signs
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb narrow ledge
matchwait

2CLIMB-NICHE:
SAVE 2CLIMB-NICHE
pause
	match 2CLIMB-BRANCH A stand of tall trees comes into view
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb craggy niche
matchwait

2CLIMB-BRANCH:
SAVE 2CLIMB-BRANCH
	match 2CLIMBED-BRANCH Cracks in the sides of the pass
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb branch
matchwait

2CLIMBED-BRANCH:
move s
move climb platform
goto %1

LONGUNDERGONDOLA:
move go frame
move go door
move sw
move s
move go path
move ne
move nw
move n
move ne
move w
move w
move go crevice
move go woodlands
move ne
move ne
move n
move ne
move n
move n

5CLIMB-LOG:
SAVE 5CLIMB-LOG
	match 5CLIMBED-LOG Willowy branches reach out
	match 6FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

6FAIL-LOG:
SAVE 6FAIL-LOG
pause
	match 5CLIMBED-LOG Willowy branches reach out
	match 7FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

7FAIL-LOG:
SAVE 7FAIL-LOG
pause
	match 5CLIMBED-LOG Willowy branches reach out
	match 8FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

8FAIL-LOG:
SAVE 8FAIL-LOG
pause
	match 5CLIMBED-LOG Willowy branches reach out
	match 3CLIMBED-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

5CLIMBED-LOG:
move e
goto 5CLIMB-SHELF

5CLIMB-SHELF:
SAVE 5CLIMB-SHELF
	match 5CLIMBED-SHELF Clusters of silverwood and spruce trees
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb rock shelf
matchwait

5CLIMBED-SHELF:
move n
goto 5CLIMB-RAMP

5CLIMB-RAMP:
save 5CLIMB-RAMP
	match 5CLIMBED-RAMP Any traveler desiring to avoid
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb ramp
matchwait

5CLIMBED-RAMP:
move e
goto 5CLIMB-STEP

5CLIMB-STEP:
SAVE 5CLIMB-STEP
	match 5CLIMBED-STEP Clusters of chicory crop up
	match PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	match FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stepping-STOnes
matchwait

5CLIMBED-STEP:
move n
put go gap
waitfor [Southern Trade Route, Alongside the Forest]
echo
echo *** You now have a head wound. When you awake from your stun you should eat some nemoih root.
echo *** This is a very long stun. Please be patient.
echo
pause 40
goto CHECK-STUN

CHECK-STUN:
pause 10
	match CHECK-STUN You're stunned
	match UNSTUNNED You glance
put health
matchwait

UNSTUNNED:
echo *** YOU'RE NO LONGER STUNNED
save UNDERGONDOLA-LETH
goto FALLEN

WAITONNORTHGONDOLA:
pause
put n
pause
echo
echo ================================
echo *** Riding north over the great chasm of the Obsidian Pass towards the ancient Elven stronghold of Leth Deriel
echo ================================
echo
pause 60
echo
echo ================================
echo *** Ferdahl Alec, son of Corik and father to Kukalakai, built the gondola to connect Ilithi to the Mountain Elves.
echo *** The Mountain Elves, led by Queen Morganae, were responsible for maintaining the gondola.
echo *** However, one day Morganae's only daughter, Princess Anlorahle, was slaughtered on the gondola by a snow beast sent by Necromancer Sidhlot.
echo *** Since that day the Mountain Elves have abandoned the gondola, yet it still slowly drifts between the platforms, as if pushed by some ghostly hand.
echo ================================
echo
pause 60
echo
echo ================================
echo *** North of the gondola is the Province of Zoluren, Formally governed by Prince Vorclaf, killed in the 8th month of Skullcleaver the Dwarven Axe 
echo *** in the year of the Golden Panther by Lyra who herself was said to be controled by a demon. 
echo *** Zoluren is named from High Gamgweth "Zohlu Ren", meaning "First Land"
echo ================================
echo
PAUSE 60
echo
echo ================================
echo *** A little known fact: The gondola only takes 6 roisaen to travel across the chasm, but if a caravan gets on the trip doubles to just over 12 roisaen.
echo ================================
echo
	matchre GETOFFNORTHGONDOLA ^With a soft bump, the gondola comes to a stop at its destination.
	matchre WAITONNORTHGONDOLA ^YOU HAVE BEEN IDLE
matchwait

GETOFFNORTHGONDOLA:
put north
move out
echo
echo *** NORTHERN GONDOLA PLATFORM ***
echo
put go ridge
put north
pause
goto SCRIPT_START

SHARD_TO_HIB:
	if "$zoneid" != "66" then goto SHARD_VARIABLE
		put #goto eastgate
		waitfor YOU HAVE ARRIVED
		put #goto Map69_
		waitfor YOU HAVE ARRIVED
		put #goto Himineldar
		waitfor YOU HAVE ARRIVED
goto SCRIPT_START

HIB_TO_SHARD:
if "$zoneid" != "116" then goto HIB_VARIABLE
put #goto Map123_
waitfor YOU HAVE ARRIVED	
put #goto WestGate
waitfor YOU HAVE ARRIVED		
goto SCRIPT_START


MOVE_THRONE_DOCK:
pause
put #goto 2
waitfor Outside Throne City, Forested Trail
pause
goto THR-RIV

THRONETORIVER:
THR-RIV:
GLORYWEST:
put stand
pause
	matchre THRONEBARGEWEST You hand him your Lirums
	matchre THRONEBARGEEAST Imperial Glory
	matchre RIVERHAWKWEST You can't do that right now|I could not find what you|What were you referring to
	matchre GETMONEYTHRONEWEST You haven't got enough Lirums to pay
	matchre GLORYWEST \.\.\.wait|type ahead
put go glory
matchwait

RIVERHAWKWEST:
pause
	matchre THRONEBARGEWEST You hand him your Lirums|\["The Riverhawk"\]
	matchre WAITTHRONEBARGEWEST You can't do that right now|I could not find what you|What were you referring to
	matchre GETMONEYTHRONEWEST You haven't got enough Lirums to pay
	matchre RIVERHAWKWEST \.\.\.wait|type ahead
put go riverhawk
matchwait

GETMONEYTHRONEWEST:
pause
move s
move se
move se
move climb slope
move go gate
move s
move sw
move up
move n
move nw
move go bank
move e
move e
	matchre GOTTHRONEMONEY The clerk counts out
	matchre NOTHRONEMONEY You don't have that much money|You do not seem to have an account
put withdraw 120 copper lirum
matchwait

NOTHRONEMONEY:
pause
echo
echo *** YOU NEED 120 LIRUMS TO RIDE THE BARGE TO RIVERHAVEN
echo *** BUT YOU HAVE NO MONEY IN THRONE CITY
echo
echo *** START BEGGING
echo
EXIT

GOTTHRONEMONEY:
pause
move w
move w
move out
move se
move s
move down
move ne
move n
move go gate
move climb slope
move nw
move nw
move n
goto THR-RIV

WAITTHRONEBARGEWEST:
pause
echo
echo *** WAITING FOR THE BARGE TO ARRIVE
echo
put hide
waitfor A barge pulls into the
goto GLORYWEST

THRONEBARGEWEST:
pause
echo
echo *** Riding the barge up the Faldesu River towards Riverhaven
echo
put hide
pause
waitfor crew quickly ties the barge off.
put stand
pause
move go dock
move n
move n
move nw
move ne
move out
move w
move w
move w
move w
move w
move w
goto SCRIPT_START


RIVERHAVENTOTHRONE:
RIV-THR:
put #goto Throne City Barge
waitfor Salt Yard, Barge Dock
pause
GLORYEAST:
put stand
pause
	matchre THRONEBARGEEAST You hand him your Lirums|Imperial Glory
	matchre RIVERHAWKEAST You can't do that right now|I could not find what you|What were you referring to
	matchre GETMONEYTHRONEEAST You haven't got enough Lirums to pay
	matchre GLORYEAST \.\.\.wait|type ahead
put go glory
matchwait

RIVERHAWKEAST:
pause
	matchre THRONEBARGEEAST You hand him your Lirums|\["The Riverhawk"\]
	matchre WAITTHRONEBARGEEAST You can't do that right now|I could not find what you|What were you referring to
	matchre GETMONEYTHRONEEAST You haven't got enough Lirums to pay
	matchre RIVERHAWKEAST \.\.\.wait|type ahead
put go riverhawk
matchwait

GETMONEYTHRONEEAST:
echo
echo *** YOU NEED 120 LIRUMS TO RIDE THIS BARGE
echo *** CHECKING THE BANK NOW
put #goto teller
waitfor YOU HAVE ARRIVED
put withdraw 240 copper lirum
pause
move go arch
move out
move s
move s
move s
goto RIV-THR

WAITTHRONEBARGEEAST:
pause
echo
echo *** WAITING FOR THE BARGE TO ARRIVE
echo
put hide
	match THRONEBARGEEASTDISCOVERED discovers your hiding place!
	match GLORYEAST A barge pulls into the
matchwait

THRONEBARGEEASTDISCOVERED:
echo
echo ===========================
echo
echo *** Crabs and Rats in this area - PAY ATTENTION ! !
echo
echo ===========================
echo
put retreat
put hide
pause
put retreat
put hide
goto WAITTHRONEBARGEEAST

THRONEBARGEEAST:
pause
echo
echo *** Riding the barge down the Faldesu River towards Throne City, capitol of the former Seven-Starred Empire
echo
put hide
pause
waitfor crew quickly ties the barge off.
put stand
pause
move go dock
echo
echo *** THRONE CITY
echo *** The ancient capitol of the Seven-Pointed Star Empire, on the banks of the Faldesu Delta
echo *** Protected by the powerful magics of the Y'Shai Guardians
echo *** Constructed by the Dwarven Axe Clan, among others
echo *** First Emperor was Verek, son of Akroeg the Ram who united all clans
echo
put s
put sw
pause
goto SCRIPT_START


##################################
#####   PASSPORT CHECK      ######
##################################
BARGETOMUSPARI:
MOVE_CHECK_PASSPORT:
put look my passport
pause
if "$zoneid" != "42" and "%passport" = "no" then goto THEREN_VARIABLE
if "$zoneid" = "42" and "%passport" = "no" then goto CHECKING_PASSPORT
if "%passport" = "yes" then goto THEREN_TO_FOR
if "%passport" = "no" then goto THE-FOR


CHECKING_PASSPORT:
GROUPPASSPORTCHECK1:
if %group != yes then goto GETPASSPORT
	goto GETPASSPORT


GETPASSPORT:
pause
put #goto 249
waitfor YOU HAVE ARRIVED
put #goto passport
waitfor YOU HAVE ARRIVED
put ask licenser for passport
pause
put ask licenser for passport
setvar passport yes
goto MOVE_CHECK_PASSPORT

GET-PASSPORT:
pause
setvar passport yes
match GROUPPASSPORT1 licenser takes some of the papers
match INV-GET-PASSPORT how do you expect to do that?
match DESK-PASSPORT doesn't look like you have a free
match GET-PASSPORT passport will allow you
match GET-PASSPORT ...wait
match GET-PASSPORT type ahead
put ask licenser for passport
matchwait

INV-GET-PASSPORT:
pause
ECHO
ECHO *** You cannot get a passport while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto GET-PASSPORT

DESK-PASSPORT:
pause
ECHO
ECHO *** You don't have a free hand so your passport is on the desk.  Get your passport and type GLANCE to continue
ECHO
pause
goto GROUPPASSPORT1

GROUPPASSPORT1:
pause
match LEAVEPASSPORT1 You have no group
match LEAVEPASSPORT1 You must be visible
match GETGROUPPASSPORT1 You whisper
match GROUPPASSPORT1 ...wait
match GROUPPASSPORT1 type ahead
put whisper group Get a passport! ASK LICENSER FOR PASSPORT two times.  We will all need them. Let me know when you have one.
matchwait

GETGROUPPASSPORT1:
setvar passport yes
pause
pause
ECHO
ECHO
ECHO *** WHEN EVERYONE HAS A PASSPORT TYPE "GLANCE" TO CONTINUE
ECHO
ECHO
pause
waitfor You glance
put whisper group Now stow your passport away!
goto LEAVEPASSPORT1

GOTPASSPORT:
LEAVEPASSPORT1:
THEREN_TO_FOR:
	pause
		put #goto 249
	waitfor YOU HAVE ARRIVED
	put #goto town gate
	waitfor YOU HAVE ARRIVED
	put get my passport
	put #goto vines
	waitfor YOU HAVE ARRIVED
	put #goto 2
	waitfor YOU HAVE ARRIVED
	put #goto Dock
	waitfor YOU HAVE ARRIVED
goto SCRIPT_START
	
	
	MUSPARITOTHEREN:
		put #goto Barge
		waitfor YOU HAVE ARRIVED