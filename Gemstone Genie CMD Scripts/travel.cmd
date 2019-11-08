#TRAVEL SCRIPT - Updated 7/08/2015
 # -- Based on original SF script by Kraelyst the Hand
 # -- Modified HEAVILY, Optimized and tweaked for Genie3 by Shroom of TF 

#debuglevel 5
action put look when YOU HAVE BEEN IDLE TOO LONG
action var IceFallRisk 1;echo Ice detected! when ^You had better slow down\! The ice is|^At the speed you are traveling
var WearingSkates 0
put set RoomNames
put set Description
pause 0.5
if_1 goto INSTRUCTIONS
GOTO NODESTINATION

INSTRUCTIONS:
ECHO
ECHO ========================================================
ECHO
ECHO *** VALID DESTINATIONS: Any settlement on the mainland
ECHO * * * Only the first 3 letters of the destination need to be inputed
ECHO * * * To see a full list of destinations begin the script without specifying a location
ECHO
ECHO ========================================================
ECHO 
     action var guild $1;put #var guild $1 when Guild: (\S+)
     action var circle $1;put #var circle $1 when Circle: (\d+)
     send info;encum
     waitforre ^\s*Encumbrance\s*\:
     action remove Guild: (\S+)
     action remove Circle: (\d+)
     pause .2
     echo **** Guild: %guild  ****
     echo **** Circle: %circle ****
     pause .5
goto %1

CHECKLOCATION1:
	matchre LEAVEALLFERRIES \["Hodierna's Grace"\]|\["Kertigen's Honor"\]|\["Her Opulence"\]|\["His Daring Exploit"\]|Deck\]|a wooden flatboat mounted atop steel
	match TOLETH1 [Southern Trade Route, Outside Leth Deriel]
	match TOLETH2 [Deobar Bower Gate, Esouvar Deriel]
	match TOCROSSING1 [The Crossing, Alfren's Ferry]
	match TOCROSSING2 [Middens, Crossbow Bend]
	match TOCROSSING3 [Eastern Tier, Outside Gate]
	match TOCROSSING4 [Northeast Wilds, Outside Northeast Gate]
	match TOCROSSING5 [North Turnpike, Forest]
	match TOCROSSING6 [Mycthengelde, Flatlands]
	match TOCROSSING7 [The Crossing Docks, South End]
	match TOTIGER1 [Grassland Path, Village Gate]
	match TOARTHE1 [Valley, Village Gate]
	match TOKAERNA [Northern Trade Road, Kaerna
	match TORIVERHAVEN1 [Riverhaven, Ferry Dock]
	match TORIVERHAVEN2 [Riverhaven, Pier]
	match TORIVERHAVEN3 [Riverhaven, Stone Bridge]
	match TORIVERHAVEN4 [Riverhaven Exterior, Southwest Gate]
	match TORIVERHAVEN5 [Riverhaven, Outside North Gate]
	match TORIVERHAVEN6 [Salt Yard, Barge Dock]
	match TOLANG1 [Langenfirth, Wharf]
	match TOLANG2 [North Road, River's Edge]
	match TOHORSECLAN [Gilen Otso Steppes, Grasslands]
	match MUS-BARGE [Outside Muspar'i]
	match GODESERTEAST [Outside Muspar'i, Barge Platform]
	match MUS-HVA Dry Dock]
	match FAL-FER bridge that once spanned the expanse of the river
	match CHECKLOCATION2 You glance
put look;glance
matchwait

CHECKLOCATION2:
	match NSN2 Faldesu River
	match TOTHEREN1 [Mistwood Forest, North of a Ravine]
	match TOFORNSTED1 [Arnshal Road, Keep Entrance]
	match TOSTONE2 [Lairocott Brach, Saverack]
	match TOWOLF1 [Wildulf Woods, Needlenose Creek]
	match TOWOLF2 [Wildulf Woods, Dirt Road]
	match TOKNIFE1 [Wilderness, Gully]
	match KNI-TIG [Knife Clan, Sentry]
	match WOL-TIG towering trees of Wildulf Woods.
	match ACE-LET [Acenamacra Pier]
	match THR-RIV Stone Docks, Covered Shore]
	match SHA-N [Shard, North Bridge]
	match SHA-E [Shard, East Bridge]
	match SHA-S [Shard, South Bridge]
	match SHA-W [Shard, West Bridge]
	match SHARD.RANDOM [Shard
	match SKIFF-ILA [Ilaya Taipa, Baso Dock]
	match STARTFALDESUS The town of Riverhaven, the bridge's
	match AINFERRY1-FORF [Haalikshal Highway, Ferry Dock]
	match AINFERRY-AIN [Ain Ghazal, Ferry Dock]
	match TORAVEN1 [Seord Kerwaith, North Gate]
	match TOHIB1 [Haalikshal Highway, East Park]
	match TOHIB2 [Gate to Hibarnhvidar]
	match TOHIB3 [Outer Hibarnhvidar, Before the Great Gate]
	matchre LEAVEALLFERRIES so that it slips through the water|\["The Riverhawk"\]|\["Imperial Glory"\]
	match LEAVESKIFF Skiff]

#BEGIN CUT BELOW THIS LINE
	match TODIRGE1 [Kraelyst's Home]
	match NOSTART You glance
put look;glance
matchwait
#END CUT ABOVE THIS LINE

STARTFALDESUS:
pause 0.1
move se
move s
move s
move s
move se
move s
move se
goto croc-DIR

TOHIB1:
pause 0.1
move go raven gate
move w
move w
move w
move s
move se
move se
move se
move go gate
goto %1

TOHIB2:
pause 0.1
move go gate
move e
move e
move e
move e
move e
move e
move se
move e
move e
move s
move se
move se
move se
move go gate
goto %1

TOHIB3:
pause 0.1
move go double gate
goto %1

TORAVEN1:
pause 0.1
move go gate
move se
goto %1

TOLETH1:
pause 0.1
move go gate
move se
move se
move se
move se
move se
move se
move se
goto %1

TOLETH2:
pause 0.1
move go gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
goto %1

TOCROSSING1:
pause 0.1
move go square
move ne
move e
move e
TOCROSSINGa7:
move e
move e
move ne
move go bridge
move ne
goto %1

TOCROSSING7:
pause 0.1
move out
goto TOCROSSINGa7

TOCROSSING2:
pause 0.1
move ne
move n
move n
move w
move sw
move sw
move w
move w
move w
move n
move nw
move nw
move w
move s
move s
move sw
move w
TOCROSSING3:
pause 0.5
move go gate
move w
move w
move w
move w
goto %1

TOCROSSING4:
pause 0.5
move go gate
move w
move s
move s
move s
move s
move sw
move s
move s
move s
move w
move w
move w
goto %1

TOCROSSING5:
pause 0.5
move go arch
move e
move e
move s
move e
move s
move e
move s
move w
move w
move s
move s
move s
move s
move s
move s
move se
goto %1

TOCROSSING6:
pause 0.5
move go gate
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
move s
move s
move s
move s
move se
goto %1

TOTIGER1:
pause 0.5
move go gate
pause 0.5
goto %1

TOWOLF1:
move s
TOWOLF2:
put sw
move s
goto %1

TOKNIFE1:
pause 0.5
pause 0.5
put go bridge
move n
goto %1

TOARTHE1:
pause 0.5
move up
move up
move w
goto %1

TOKAERNA:
pause 0.5
	match to1kaerna [Kaerna Village, By the Well]
	match TOSTONE1 The store is squat but neat,
put go town gate
matchwait
to1kaerna:
move n
move ne
TOSTONE1:
move go town gate
move nw
move nw
move n
move e
move e
goto %1

TOSTONE2:
pause 0.5
put out
move down
move climb trail
goto %1

TODIRGE1:
pause 0.5
put unlock door
pause 0.5
put open door
move go door
put close house
pause 0.5
put lock house
move n
move n
move se
move e
move e
move go path
goto %1

TORIVERHAVEN1:
pause 0.5
move go ramp
move go wooden archway
move ne
move w
goto %1

TORIVERHAVEN2:
pause 0.5
move e
move s
move e
move go wooden archway
move ne
move w
goto %1

TORIVERHAVEN3:
pause 0.5
move go east gate
move w
move w
move w
move w
move w
move w
move w
goto %1

TORIVERHAVEN4:
pause 0.5
move go narrow gate
move e
move e
move e
move e
move e
move e
move e
goto %1

TORIVERHAVEN5:
pause 0.5
move go north gate
move s
move s
move s
move s
move s
move s
move s
move s
move s
goto %1

TORIVERHAVEN6:
pause 0.5
move n
move n
move ne
move nw
move out
move w
move w
move w
move w
move w
move w
goto %1

TOLANG1:
pause 0.5
move w
move s
move w
goto %1

TOLANG2:
pause 0.5
	match TOLANG2NORTH Obvious paths: south.
	match TOLANG2SOUTH Obvious paths: north.
put go bridge
matchwait
TOLANG2NORTH:
pause 0.5
move s
move s
TOLANG2SOUTH:
pause 0.5
move go shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
goto %1

TOFORNSTED1:
pause 0.5
move go gate
move e
move go ironwood door
move e
move go gate
goto %1

TOHORSECLAN:
pause 0.5
move go path
pause 0.5
goto %1

BEGINSCRIPT:
pause 0.5
goto %1

fay:
fayr:
fayri:
fayrin:
fayrins:
fayrin's:
fayrin'sr:
fayrin'sre:
fayrin'sres:
fayrin'srest:
fayrinsr:
fayrinsre:
fayrinsres:
fayrinsrest:
fayre:
fayren:
fayren':
fayren's:
fayren'sr:
fayren'sre:
fayren'sres:
fayren'srest:
fayrens:
fayrensr:
fayrensre:
fayrensres:
fayrensrest:
mara:
maracheck:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-FAY The greying wooden boards of the platform
	match FINISH [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-STE Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-LET hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

ste:
stee:
steel:
steelc:
steelcl:
steelcla:
steelclaw:
steelclawclan:
stea:
steal:
stealc:
stealcl:
stealcla:
stealclaw:
stealclawclan:
SCC:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-FAY The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match FINISH [Steelclaw Clan, Entrance]
	match SHA-STE Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-LET hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

sha:
shar:
shard:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-SHA The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match STE-SHA [Steelclaw Clan, Entrance]
	match SHARD-DIRECTIONS Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-LET hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

hor:
hors:
horse:
horsec:
horsecl:
horsecla:
horseclan:
zal:
zald:
zaldi:
zaldit:
zaldita:
zalditai:
zalditaip:
zalditaipi:
zalditaipa:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-SHA The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match STE-SHA [Steelclaw Clan, Entrance]
	match SHA-HOR Wyvern Mountain towers far into the sky
	match FINISH [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-LET hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-HOR [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

gon:
gond:
gondo:
gondol:
gondola:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match TIG-CRO The Pig's Pannage,
	match FINISH Like an aerie forgotten in the wilderness
	match FINISH [Gondola, Cab
	match FINISH The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

let:
leth:
lethd:
lethde:
lethder:
lethderi:
lethderie:
lethderiel:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match GON-LET Like an aerie forgotten in the wilderness
	match TIG-CRO The Pig's Pannage,
	match FINISH Sana'ati Dyaus Drui'tas]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

ace:
acen:
acena:
acenam:
acenama:
acenamac:
acenamacr:
acenamacra:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match GON-LET Like an aerie forgotten in the wilderness
	match TIG-CRO The Pig's Pannage,
	match LET-ACE Sana'ati Dyaus Drui'tas]
	match FINISH [Acenamacra Pier]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

alf:
alfr:
alfre:
alfren:
alfrens:
alfren's:
alfren'sf:
alfren'sfe:
alfren'sfer:
alfren'sferr:
alfren'sferry:
alfrensf:
alfrensfe:
alfrensfer:
alfrensferr:
alfrensferry:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FINISH Segoltha South Bank]
	match GON-LET Like an aerie forgotten in the wilderness
	match TIG-CRO The Pig's Pannage,
	match LET-ALF Sana'ati Dyaus Drui'tas]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

cro:
cros:
cross:
crossi:
crossin:
crossing:
crossings:
thec:
thecr:
thecro:
thecros:
thecross:
thecrossi:
thecrossin:
thecrossing:
thecrossings:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match TIG-CRO The Pig's Pannage,
	match FINISH facade of the First Provincial Bank
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

art:
arth:
arthe:
arthed:
artheda:
arthedal:
arthedale:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-STO [North Roads Caravansary]
	match STO-ART You travel through a small
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	matchre CRO-ART facade of the First Provincial Bank|The hustle of crowds making their way
	match TIG-CRO The Pig's Pannage,
	match FINISH small, white-washed sign staked along
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

kae:
kaer:
kaern:
kaerna:
kaernav:
kaernavi:
kaernavil:
kaernavill:
kaernavilla:
kaernavillag:
kaernavillage:
kea:
kear:
kearn:
kearna:
kearnav:
kearnavi:
kearnavil:
kearnavill:
kearnavilla:
kearnavillag:
kearnavillage:
	match STO-KAE You travel through a small
	match ART-KAE small, white-washed sign staked along
	matchre stoneclan exits:|Obvious paths:
put look;glance
matchwait


sto:
ston:
stone:
stonec:
stonecl:
stonecla:
stoneclan:
	pause 0.5
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-STO [North Roads Caravansary]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match CRO-ART facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match TIG-CRO The Pig's Pannage,
	match FINISH You travel through a small
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

car:
cara:
carav:
carava:
caravan:
caravans:
caravansa:
caravansar:
caravansary:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match CRO-CAR facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match TIG-CRO The Pig's Pannage,
	match FINISH [North Roads Caravansary]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

dir:
dirg:
dirge:
dark:
darks:
darkst:
darksto:
darkston:
darkstone:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match CRO-CAR facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match TIG-CRO The Pig's Pannage,
	match TODIRGE2 [North Roads Caravansary]
	match FINISH [Dirge
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

nor:
nort:
north:
northr:
northro:
northroa:
northroad:
northroadf:
northroadfe:
northroadfer:
northroadferr:
northroadferry:
northroadd:
northroaddo:
northroaddoc:
northroaddock:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FINISH [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match CRO-CAR facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match TIG-CRO The Pig's Pannage,
	match CAR-NORTHROAD [North Roads Caravansary]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

riv:
rive:
river:
riverh:
riverha:
riverhav:
riverhave:
riverhaven:
hav:
have:
haven:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match FINISH [Riverhaven, Town Square]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

fal:
fald:
falde:
faldes:
faldesu:
faldesur:
faldesuri:
faldesuriv:
faldesurive:
faldesuriver:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match CRO-CAR facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-FALDESU [North Roads Caravansary]
	match TIG-CRO The Pig's Pannage,
	match FER-FALDESU [North Road, Ferry]
	match RIV-FALDESU [Riverhaven, Town Square]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

thr:
thro:
thron:
throne:
thronec:
throneci:
thronecit:
thronecity:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match RIV-THR [Riverhaven, Town Square]
	match FINISH Stone Docks, Covered Shore]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait


ros:
ross:
rossm:
rossma:
rossman:
rossmans:
rossman's:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-THE Wheels and hooves clatter on the wood
	match ELB-THE [El'Bain's Stop, Picnic Area]
	match SKILLCHECK7 [North Road, Barony Pass]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match FINISH [Rossman's Landing, Southeast Gate]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

the:
ther:
there:
theren:
therenb:
therenbo:
therenbor:
therenboro:
therenborou:
therenboroug:
therenborough:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match ROS-THE [Rossman's Landing, Southeast Gate]
	match LAN-THE Wheels and hooves clatter on the wood
	match ELB-THE [El'Bain's Stop, Picnic Area]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match FINISH [North Road, Barony Pass]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

lan:
lang:
lange:
langen:
langenf:
langenfi:
langenfir:
langenfirt:
langenfirth:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match THE-LAN [North Road, Barony Pass]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match ROS-THE [Rossman's Landing, Southeast Gate]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match FINISH Wheels and hooves clatter on the wood
	match ELB-LAN [El'Bain's Stop, Picnic Area]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

for:
forn:
forns:
fornst:
fornste:
fornsted:
fornstea:
fornstead:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match ROS-THE [Rossman's Landing, Southeast Gate]
	match LAN-THE Wheels and hooves clatter on the wood
	match ELB-THE [El'Bain's Stop, Picnic Area]
	match THE-FOR [North Road, Barony Pass]
	match TIG-CRO The Pig's Pannage,
	match FINISH [Outside the Fornsted Walls]
	match GROUPCHECK11 [North Road, Ferry]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

hva:
hvar:
hava:
havar:
hvara:
havarl:
hvaral:
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match ROS-THE [Rossman's Landing, Southeast Gate]
	match LAN-THE Wheels and hooves clatter on the wood
	match ELB-THE [El'Bain's Stop, Picnic Area]
	match THE-FOR [North Road, Barony Pass]
	match FOR-HVA [Outside the Fornsted Walls]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match FINISH [Arnshal Road, Mountain Approach]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

mus:
musp:
muspa:
muspar:
muspari:
muspar'i:
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match ROS-THE [Rossman's Landing, Southeast Gate]
	match LAN-THE Wheels and hooves clatter on the wood
	match ELB-THE [El'Bain's Stop, Picnic Area]
	match THE-FOR [North Road, Barony Pass]
	match FOR-HVA [Outside the Fornsted Walls]
	match HVA-MUS [Arnshal Road, Mountain Approach]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

tig:
tige:
tiger:
tigerc:
tigercl:
tigercla:
tigerclan:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-TIG facade of the First Provincial Bank
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match FINISH The Pig's Pannage,
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

wol:
wolf:
wolfc:
wolfcl:
wolfcla:
wolfclan:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-TIG facade of the First Provincial Bank
	match TIG-WOL The Pig's Pannage,
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

kni:
knif:
knife:
knifec:
knifecl:
knifecla:
knifeclan:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-TIG facade of the First Provincial Bank
	match TIG-KNI The Pig's Pannage,
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

el:
elb:
elba:
elbai:
elbain:
elbains:
elbain's:
el':
el'b:
el'ba:
el'bai:
el'bain:
el'bains:
el'bain's:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match THE-ELB [North Road, Barony Pass]
	match GON-LET Like an aerie forgotten in the wilderness
	match LET-CRO Sana'ati Dyaus Drui'tas]
	match FERRY-CRO Segoltha South Bank]
	match GETCROSSINGMONEYNORTH facade of the First Provincial Bank
	match ART-STO small, white-washed sign staked along
	match STO-DIR You travel through a small
	match DIR-CAR [Dirge, Outside Gate]
	match DIR-RIV [North Roads Caravansary]
	match RIV-ROS [Riverhaven, Town Square]
	match ROS-THE [Rossman's Landing, Southeast Gate]
	match LAN-ELB Wheels and hooves clatter on the wood
	match FINISH [El'Bain's Stop, Picnic Area]
	match TIG-CRO The Pig's Pannage,
	match GROUPCHECK11 [North Road, Ferry]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match ILA-LET hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

ila:
ilay:
ilaya:
ilayat:
ilayata:
ilayatai:
ilayataip:
ilayataipa:
tai:
taip:
taipa:
ill:
illa:
illay:
illaya:
illayat:
illayata:
illayatai:
illayataip:
illayataipa:
ile:
iley:
ileya:
ileyat:
ileyata:
ileyatai:
ileyatap:
ileyataipa:
riverc:
rivercl:
rivercla:
riverclan:
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match GON-LET Like an aerie forgotten in the wilderness
	match TIG-CRO The Pig's Pannage,
	match LET-ILA Sana'ati Dyaus Drui'tas]
	match ON-GONDOLA [Gondola, Cab
	match SOUTH-PLATFORM The greying wooden boards of the platform
	match FAY-GON [Fayrin's Rest, Anloraten Crossing]
	match STE-FAY [Steelclaw Clan, Entrance]
	match SHA-GON Wyvern Mountain towers far into the sky
	match HOR-SHA [Zaldi Taipa, Cedar Path]
	match FINISH hard to see the road beyond the
	match AIN-ILA Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match RAVEN2-RAVEN1 [Raven's Point, Gear Gate]
	match RAV-SHA [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

ain:
aing:
aingh:
aingha:
ainghaz:
ainghaza:
ainghazal:
ainga:
aingaz:
aingaza:
aingazal:
aingah:
aingahz:
aingahza:
aingahzal:
aingazh:
aingazha:
aingazhal:
aingazah:
aingazahl:
gha:
ghaz:
ghaza:
ghazal:
gaz:
gaza:
gazal:
gah:
gahz:
gahza:
gahzal:
gazh:
gazha:
gazhal:
gazah:
gazahl:
pause 0.5
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match GETCROSSINGDOKORA facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match GETLETHDOKORA Sana'ati Dyaus Drui'tas]
	match GON-LET Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-SHA The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match STE-SHA [Steelclaw Clan, Entrance]
	match SHA-RAV Wyvern Mountain towers far into the sky
	match HOR-RAV [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-AIN hard to see the road beyond the
	match FINISH Ghazal, East Pier]
	match FORF-AIN The Dwarven road, smoothly cobbled,
	match GetHibDokora [Inner Hibarnhvidar, Entry]
	match GETRAVENDOKORA [Raven's Point, Gear Gate]
	match RAVEN1-RAVEN2 [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

out:
oute:
outer:
outerh:
outerhi:
outerhib:
outerhiba:
outerhibar:
outerhibarn:
outerhibarnh:
outerhibarnhv:
outerhibarnhvi:
outerhibarnhvid:
outerhibarnhvida:
outerhibarnhvidar:
hib:
hiba:
hibar:
hibarn:
hibarnh:
hibarnhv:
hibarnhvi:
hibarnhvid:
hibarnhvida:
hibarnhvidar:
hibarnv:
hibarnvh:
hibarnvhi:
hibarnvhid:
hibarnvhida:
hibarnvhidar:
hibarnvi:
hibarnvid:
hibarnvida:
hibarnvidar:
inn:
inne:
inner:
innerh:
innerhi:
innerhib:
innerhiba:
innerhibar:
innerhibarn:
innerhibarnh:
innerhibarnhv:
innerhibarnhvi:
innerhibarnhvid:
innerhibarnhvida:
innerhibarnhvidar:
pause 0.5
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match GETCROSSINGDOKORA facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-SHA The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match STE-SHA [Steelclaw Clan, Entrance]
	match SHA-RAV Wyvern Mountain towers far into the sky
	match HOR-RAV [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-AIN hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-HIB The Dwarven road, smoothly cobbled,
	match hibFINISH [Inner Hibarnhvidar, Entry]
	match RAV-FORF [Raven's Point, Gear Gate]
	match RAVEN1-RAVEN2 [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

boa:
boar:
boarc:
boarcl:
boarcla:
boarclan:
pause 0.5
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match GETCROSSINGDOKORA facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-SHA The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match STE-SHA [Steelclaw Clan, Entrance]
	match SHA-RAV Wyvern Mountain towers far into the sky
	match HOR-RAV [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-AIN hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-HIB The Dwarven road, smoothly cobbled,
	match HIB-BOA [Inner Hibarnhvidar, Entry]
	match RAV-FORF [Raven's Point, Gear Gate]
	match RAVEN1-RAVEN2 [Seord Kerwaith, Gear Gate]
	match FINISH [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

rav:
rave:
raven:
ravens:
ravensp:
ravenspo:
ravenspoi:
ravenspoin:
ravenspoint:
raven':
raven's:
raven'sp:
raven'spo:
raven'spoi:
raven'spoin:
raven'spoint:
pause 0.5
	match HVA-FOR [Arnshal Road, Mountain Approach]
	match FOR-THE [Outside the Fornsted Walls]
	match LAN-RIV Wheels and hooves clatter on the wood
	match ELB-RIV [El'Bain's Stop, Picnic Area]
	match THE-ROS [North Road, Barony Pass]
	match ROS-RIV [Rossman's Landing, Southeast Gate]
	match FER-DIR [North Road, Ferry]
	match RIV-DIR [Riverhaven, Town Square]
	match DIR-CAR [Dirge, Outside Gate]
	match CAR-CRO [North Roads Caravansary]
	match STO-ART You travel through a small
	match ART-CRO small, white-washed sign staked along
	match CRO-LET facade of the First Provincial Bank
	match FER-LET Segoltha South Bank]
	match LET-GON Sana'ati Dyaus Drui'tas]
	match NORTH-PLATFORM Like an aerie forgotten in the wilderness
	match ON-GONDOLA [Gondola, Cab
	match GON-SHA The greying wooden boards of the platform
	match FAY-STE [Fayrin's Rest, Anloraten Crossing]
	match STE-SHA [Steelclaw Clan, Entrance]
	match SHA-RAV Wyvern Mountain towers far into the sky
	match HOR-RAV [Zaldi Taipa, Cedar Path]
	match TIG-CRO The Pig's Pannage,
	match ILA-AIN hard to see the road beyond the
	match AIN-FORF Ghazal, East Pier]
	match FORF-RAV The Dwarven road, smoothly cobbled,
	match HIB-FORF [Inner Hibarnhvidar, Entry]
	match FINISH [Raven's Point, Gear Gate]
	match FINISH [Seord Kerwaith, Gear Gate]
	match BOA-HIB [Boar Clan, Before the Gate]
	match CHECKLOCATION1 You glance
put look;glance
matchwait

nen:
nena:
nenav:
nenavd:
nenavde:
nenavdel:
nenavdela:
nenavdelar:
nenavda:
nenavdal:
nenavdala:
nenavdalar:
pause 0.5
ECHO
ECHO *** Just Kidding!  Nobody knows where the lost village of Nenav Delar is located!
ECHO *** Let me know if you find it!
ECHO
pause 0.5
ECHO
ECHO *** Here's the story from the book "The Lost Village" by Trefinja Giln
ECHO ==============================
ECHO It was a cool fall afternoon in the year 157# we were having our typical meeting of the clan council discussing matters for our coming weeks festivities.  The light-hearted discussions within the council's chamber was abruptly shattered by a young Dwarven messenger.  The trembling and bloodied messenger barely managed to make it through the entrance before collapsing to the ground.  His bloodshot and glassy eyes looked up at me as I stood over him, he clasped my hand and said in a dusky, broken voice, "Nenav... Dalar... village in the mountains... slaves... help them... help... them."  He closed his eyes and breathed his last breath.  I immediately called for the village Empath but it was too late, he could not be saved.  In his right hand he was clutching a tattered and torn piece of parchment which I soon pried loose from his grip, and it read:               
ECHO 
ECHO -------------------                                   
ECHO Khenea's Prophecy                                     
ECHO -------------------                                   
ECHO                                                       
ECHO The watchers wait on a Hero's breath.                 
ECHO To bring forth an end to darkness reign.              
ECHO Death shall sow, and time will burn, before the Hero comes.                                                
ECHO 
ECHO Now time won't slay the ancient wrong                 
ECHO Nor part the evil's deed                              
ECHO In blood they plead, in heart as one, one day the Hero comes.                                                
ECHO 
ECHO When the new day opens and travelers approach         
ECHO The curse is nears its end                            
ECHO All could be the one we need, so watch... the Hero comes.                                                
ECHO 
ECHO And so it shall... come to pass                       
ECHO What evil made, be undone                             
ECHO By the Hero's hand we do await, for now the Hero comes.                                                
ECHO 
ECHO But fail it could this rite of good                   
ECHO And lead us down the starry road                      
ECHO 
ECHO If the Kvika Heart is not retrieved, then death is what will come.                                       
ECHO 
ECHO So we pray the answer will unfold                     
ECHO The prophecy we do speak                              
ECHO We wait on one to liberate, our souls... our lives... 
ECHO we seek.                                              
ECHO 
ECHO Please my lord, heed Khenea's prophecy and send us    
ECHO help.  I don't know how much longer we can wait, just 
ECHO follow along the great mountains on the edge of the   
ECHO horizon until you find the break in the...            
ECHO                                                       
ECHO --------------------------------------                
ECHO The rest of the parchment was torn off                
ECHO --------------------------------------                
ECHO                                                       
ECHO After receiving this letter we searched for more information about this hidden village, but unfortunately we found nothing.  I write this journal in hopes that someday someone will be able to resume the search and maybe decipher the cryptic message within the parchment.  
ECHO                          
ECHO ===========================
ECHO
EXIT

GON-LET:
ECHO
ECHO * * * Leaving the Dragonspine Mountains via the Obsidian Pass
ECHO * * * Beware of snowbeasts, particularly down that track
ECHO
pause 0.5
move go ridge
move n
move ne
move nw
move n
move n
move ne
move ne
move n
move ne
move n
move ne
move n
move ne
move n
move ne
move ne
move e
move e
move n
move n
move ne
move n
move ne
move n
move ne
move e
move ne
move n
move n
move ne
move ne
move ne
move ne
move ne
move n
move ne
move ne
move n
move n
move ne
move ne
ECHO
ECHO
ECHO * * * Now nearing the Endrus Forest, home to Leth Deriel.
ECHO
UNDERGONDOLA-LETH:
pause 0.5
move n
move n
move ne
move ne
move ne
move ne
move ne
move n
move ne
move n
move n
move n
move n
move ne
move ne
move ne
move n
move n
move ne
move ne
move n
move n
ECHO
ECHO
ECHO * * * Passing by the the manor of Lasarhhtha Oshu'ehhrsk the Bone Dancer
ECHO * * * Home to bone wolves, zombies, germish'din, and kartais
ECHO
move ne
move ne
move n
move ne
move go gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
ECHO
ECHO ===================
ECHO *** LETH DERIEL
ECHO *** Ancient stronghold of the Forest Elves
ECHO *** Constructed around the sacred Sana'ati Dyaus tree 
ECHO ===================
ECHO
goto %1

LET-ACE:
pause 0.5
move ne
move ne
move ne
move ne
move ne
move ne
move ne
move go e'erdream gate
move ne
move e
move ne
move se
move ne
move ne
move go sequoia tunnel
move go eastern opening
move ne
move e
move ne
move n
move ne
move ne
move e
move go rope bridge
move go north face
move e
move go crevice
move e
move ne
move go cavern opening
move n
move ne
move e
move ne
move ne
move ne
move e
move ne
move ne
move ne
move ne
move ne
move ne
move e
move down
move down
move down
move down
move e
move e
move e
move go pier
pause 0.5
ECHO
ECHO *** ACENAMACRA PIER - GATEWAY TO M'RISS
ECHO *** On the Bay of Nemethyo
ECHO
goto %1

ACE-LET:
pause 0.5
move go beach
move w
move w
move w
move go cliff trail
move up
move up
move up
move w
move sw
move sw
move sw
move sw
move sw
move sw
move w
move sw
move sw
move sw
move w
move sw
move s
move go cave
move sw
move w
move go opening
move w
move go rope bridge
move go south face
move w
move sw
move sw
move s
move sw
move w
move sw
move go sequoia tunnel
move go western opening
move sw
move sw
move nw
move sw
move w
move sw
move sw
move go e'erdream gate
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move sw
ECHO
ECHO ===================
ECHO *** LETH DERIEL
ECHO *** Ancient stronghold of the Forest Elves
ECHO *** Created by the Forest and Celestial Elves 
ECHO ===================
ECHO
goto %1

LET-CRO:
SAVE PAS-CRO
CHECKGUILD2:
match BURDENCHECK5 Guild: Thief
match MONEYCHECK5 Gender:
put info
matchwait

GROUPCHECK5:
pause 0.2
match BURDENCHECK5 You have no group
match BURDENCHECK5 You must be visible
match DISBANDGROUP1 You whisper
put whisper group ...
matchwait

DISBANDGROUP1:
put disband
pause 0.1
BURDENCHECK5:
pause 0.5
matchre SWIMCHECK5A None|Light
match SWIMCHECK5B Encumbrance : Somewhat
match SWIMCHECK5C Encumbrance : Burdened
match SWIMCHECK5D Encumbrance : Heavy
match SWIMCHECK5E Encumbrance : Very Heavy
match SWIMCHECK5F Overburdened
match SWIMCHECK5G Encumbrance : Tottering
match SWIMCHECK5H even able to move?
match SWIMCHECK5I amazing you aren't squashed!
put info
matchwait

SWIMCHECK5A:
if $Athletics.Ranks >= 25 then goto LET-CRO-CONT
goto MONEYCHECK5
SWIMCHECK5B:
if $Athletics.Ranks >= 40 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5C:
if $Athletics.Ranks >= 75 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5D:
if $Athletics.Ranks >= 120 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5E:
if $Athletics.Ranks >= 140 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5F:
if $Athletics.Ranks >= 175 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5G:
if $Athletics.Ranks >= 210 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5H:
if $Athletics.Ranks >= 240 then goto LET-CRO-CONT
goto OVERBURDENED5
SWIMCHECK5I:
if $Athletics.Ranks >= 275 then goto LET-CRO-CONT
goto OVERBURDENED5

OVERBURDENED5:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE RIVER
ECHO *** TAKING THE FERRY
ECHO
GOTO MONEYCHECK5

MONEYCHECK5:
SAVE FER-CRO
	matchre LET-CRO-CONT I don't know who you are referring to|But no one can see you
	matchre GETMONEYLETH But you don't have that much|You consider the offer and then realize
put tip zzzzzz 35 kronar
matchwait

GETMONEYLETH:
pause 0.5
move e
move e
move go ebony door
move u
put withdraw 35 copper
pause 0.5
put withdraw 35 copper
move d
move out
move w
move w
goto LET-CRO-CONT

LET-ALF:
SAVE toalfren
goto LET-CRO-CONT

LET-CRO-CONT:
pause 0.5
move nw
move nw
move nw
move nw
move nw
move nw
move nw
move go bower gate
move nw
move n
move n
move nw
move nw
move n
move n
move nw
move nw
move ne
move n
move ne
move ne
move ne

WEBNORTH1:
	match NOWEBNORTH Along the north, the trees and shrubs
	matchre WEBNORTH2 Roundtime|You can't do that while
	matchre WEBNORTH2 \.\.\.wait|type ahead
put ne
matchwait

WEBNORTH2:
pause 0.5
ECHO
ECHO *** You are stuck in a spider's web.  Be patient.
ECHO
	match WEBNORTH1 Using your escape
	match WEBNORTH1 The webs break apart and fall away, releasing you.
matchwait

NOWEBNORTH:
move nw
move nw
move n
move n
move ne
move n
ECHO
ECHO
ECHO * * * Passing the Forest of Night, created by mad mage Sithsia
ECHO * * * Home to nyads, dryads, and death spirits
ECHO
move ne
move nw
move n
move ne
move ne
move ne
move n
move n
move nw
move nw
move n
move ne
move ne
move ne
move ne
move n
GOTO %s

toalfren:
ECHO
ECHO
ECHO * * * Leaving the Endrus Forest and entering the flood plains of the Segoltha
ECHO 
pause 0.5
move n
move n
move n
ECHO
ECHO *** ALFREN'S FERRY
ECHO
goto %1

FER-CRO:
ECHO
ECHO
ECHO * * * Leaving the Endrus Forest and entering the flood plains of the Segoltha
ECHO 
pause 0.5
move n
move n
move n
goto CROSSINGFERRYNORTH

CROSSINGFERRYNORTH:
put stand
pause 0.5
	matchre WAITFORCROSSINGFERRYNORTH wait for the next one|until the next one arrives|I could not find what you were referring to|What were you referring to|There is no ferry here to go aboard
	matchre WAITONCROSSINGFERRYNORTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
	match GETMONEYCROSSINGFERRYNORTH You haven't got enough
put go ferry
matchwait

WAITFORCROSSINGFERRYNORTH:
ECHO
ECHO ============================
ECHO *** WAITING FOR THE FERRY TO ARRIVE
ECHO *** It costs 35 Kronars to ride (unless you are a citizen of Zoluren)
ECHO *** If you don't have enough it's time to start begging
ECHO ============================
ECHO
put wealth kronar
waitfor pulls into the
goto CROSSINGFERRYNORTH

GETMONEYCROSSINGFERRYNORTH:
ECHO
ECHO *** NOT ENOUGH KRONARS FOR THE FERRY! ***
ECHO
EXIT

WAITONCROSSINGFERRYNORTH:
pause 0.5
ECHO
ECHO *** Riding the ferry north across the mighty Segoltha River toward The Crossing, heart of the Five Provinces
ECHO
pause 2
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 5
ECHO
ECHO * * * The Crossing is also known as River Crossing because it is the site where the Oxenwaithe River crosses the mighty Segoltha River
ECHO * * * The Segoltha River runs from the Himineldar Shel Mountains near Ain Ghazal all the way to the Reshal Sea
ECHO * * * It is large enough for galleons to sail upon all the way upriver to Ain Ghazal
ECHO ====================================
ECHO
pause 10
ECHO
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 5
ECHO
ECHO * * * The Crossing is the heart of the Five Provinces and has seen many wars
ECHO
ECHO * * * Akroeg led the Ram Clan in gathering and conquering most of the continent under one banner.
ECHO * * * When Akroeg died his son Verek created the Seven Starred Empire from the Ram Clan.
ECHO
ECHO * * * When the Empire collapsed Lanival The Reedemer fought Teiro
ECHO * * *  in the Resistance Wars and divided the continent into Five Provinces.
ECHO
ECHO * * * Lanival was known as the Dragon and so the lands became known as the Dragon's Realms.
ECHO * * * At the end of the war, Lanival founded The Crossing at the center of the former Empire.
ECHO
ECHO * * * The 10 months of the calendar are named for great figures in history, particularly in the time of Lanival.
ECHO * * * You can read more in "Human Histories: Lanival's Tale" at the Asemath Academy in The Crossing
ECHO ====================================
ECHO
pause 5
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 3 of 5
ECHO
ECHO * * * In more recent days The Crossing has seen war with the Gorbesh, Lord Sorrow, and the Outcasts
ECHO
ECHO * * * The Gorbesh hail from the continent of Albaria.  During their invasion
ECHO * * * they destroyed the gweth mines of Zoluren and the Crossing temple.
ECHO * * * Gorbesh fortresses can still be found throughout the provinces
ECHO ====================================
ECHO
pause 5
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 4 of 5
ECHO
ECHO * * * Lord Sorrow lived in the Reach east of Kaerna and Stone Clan among the S'lai who fought for him
ECHO * * * He was a Moon Mage of immense powers whose life was magically lengthened, he was once offered a seat on the Moon Mage council
ECHO * * * Lord Sorrow brought war in 359 AV with the help of Shartug, Darkensi, Prayk, and Parnore
ECHO * * * He died while trying to harness the power of the Zaulfung Stones near Riverhaven
ECHO ====================================
ECHO
pause 5
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 5 of 5
ECHO
ECHO * * * The Outcasts are named because they were thrown out of Shard many years ago
ECHO * * * Around 375 AV the Outcasts, led by King Raenilar, marched from the deserts north of Therengia down to Shard
ECHO * * * They brought war to all the provinces with help from Goblin Prince Tnok, Grishnok, the Shark Clan, Jomay, Naarg, and others
ECHO * * * The Outcasts murdered Ferdahl Kukalakai and occupied Ilithi until one day with little warning they left Ilithi in peace
ECHO ====================================
ECHO 
pause
waitfor crew ties the ferry off.
put stand
pause 0.5
move go dock
move go square
move ne
move e
move e
move e
move e
move ne
move go bridge
move ne
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO *** Capitol of the province of Zoluren
ECHO *** Located where the Oxenwaithe River crosses the mighty Segoltha River.
ECHO ===================
ECHO
goto %1

FERRY-CRO:
CHECKGUILD10:
match PAS-CRO1 Guild: Thief
match cro-exp1 Gender:
put info
matchwait

cro-exp1:
pause 0.1
match seg-cro Athletics:
match CROSSINGFERRYNORTH EXP HELP
put exp survival 300
matchwait

seg-cro:
move s
move go foot
move w
move w
move w
move w
move w
move n
move n

seg-north:
match seg-north You wade
match roomcheck You can't swim in that direction.
match seg-north You swim
match seg-north You slap
match seg-north You struggle
match seg-north You flounder
match seg-north make much headway
match seg-north ...wait
match seg-north type ahead
put swim north 
matchwait

roomcheck:
match seg-north-current Obvious paths: east, west
match seg-north-end Obvious paths: east, southeast, south, southwest, west.
put look
matchwait

seg-north-current:
put swim west
waitfor Roundtime
goto seg-north

seg-north-end:
move climb bank
move nw
move go grass
move ne
move n
move ne
move n
move nw
move n
goto %1

GROUPCHECK10:
pause 0.1
match BURDENCHECK10 You have no group
match BURDENCHECK10 You must be visible
match DISBANDGROUP2 You whisper
put whisper group ...
matchwait

DISBANDGROUP2:
put disband
pause 0.1
BURDENCHECK10:
pause 0.1
matchre SWIMCHECK10A None|Light
match SWIMCHECK10C Encumbrance : Somewhat
match SWIMCHECK10D Encumbrance : Burdened
match SWIMCHECK10E Encumbrance : Heavy
match SWIMCHECK10E Encumbrance : Very Heavy
match SWIMCHECK10F Overburdened
match SWIMCHECK10G Encumbrance : Tottering
match SWIMCHECK10H even able to move?
match SWIMCHECK10I amazing you aren't squashed!
put info
matchwait

SWIMCHECK10A:
if $Athletics.Ranks >= 25 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10B:
if $Athletics.Ranks >= 40 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10C:
if $Athletics.Ranks >= 70 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10D:
if $Athletics.Ranks >= 120 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10E:
if $Athletics.Ranks >= 150 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10F:
if $Athletics.Ranks >= 200 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10G:
if $Athletics.Ranks >= 250 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10H:
if $Athletics.Ranks >= 300 then goto PAS-CRO1
goto OVERBURDENED10
SWIMCHECK10I:
if $Athletics.Ranks >= 350 then goto PAS-CRO1
goto OVERBURDENED10

OVERBURDENED10:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE RIVER
ECHO *** TAKING THE FERRY  NORTH
ECHO
GOTO CROSSINGFERRYNORTH

PAS-CRO1:
move s
move s
move s
goto PAS-CRO

PAS-CRO:
match FER-CRO I could not find
match FER-CRO What were you referring to?
match PASNORTH You duck quietly
put go boulder
matchwait

PASNORTH:
move go root
move ne
move e
move ne
move down
ECHO
ECHO
ECHO * * * You have entered the fabled 5th Passage of which many Thieves spent years trying to find
ECHO
MPN:
pause 0.5
pause 0.2
	matchre MPN1 You wade|You swim|You splash
	matchre MPN You slap|You struggle|You flounder|make much headway
	matchre MPN \.\.\.wait|type ahead
send n
matchwait

MPN1.RET:
put ret
put ret
MPN1:
pause 0.1
pause 0.2
	matchre MPN2 You wade|You swim|You splash
	matchre MPN1 You slap|You struggle|You flounder|make much headway
	matchre MPN1 \.\.\.wait|type ahead
	matchre MPN1.RET ^You are engaged|^You can't do that while engaged
send ne
matchwait

MPN2.RET:
put ret
put ret
MPN2:
pause 0.1
pause 0.2
	matchre MPN3 You wade|You swim|You splash
	matchre MPN2 You slap|You struggle|You flounder|make much headway
	matchre MPN2 \.\.\.wait|type ahead
	matchre MPN2.RET ^You are engaged|^You can't do that while engaged
send ne
matchwait

MPN3.RET:
put ret
put ret
MPN3:
pause 0.1
pause 0.2
	matchre MPN4 You wade|You swim|You splash
	matchre MPN3 You slap|You struggle|You flounder|make much headway
	matchre MPN3 \.\.\.wait|type ahead
	matchre MPN3.RET ^You are engaged|^You can't do that while engaged
send n
matchwait

MPN4.RET:
put ret
put ret
MPN4:
pause 0.1
pause 0.2
	matchre MPN5 You wade|You swim|You splash
	matchre MPN4 You slap|You struggle|You flounder|make much headway
	matchre MPN4 \.\.\.wait|type ahead
	matchre MPN4.RET ^You are engaged|^You can't do that while engaged
send up
matchwait

MPN5.RET:
put ret
put ret
MPN5:
pause 0.1
pause 0.2
	matchre MPN6 You wade|You swim|You splash
	matchre MPN5 You slap|You struggle|You flounder|make much headway
	matchre MPN5 \.\.\.wait|type ahead
	matchre MPN5.RET ^You are engaged|^You can't do that while engaged
send ne
matchwait

MPN6.RET:
put ret
put ret
MPN6:
pause 0.1
pause 0.2
	matchre MPN7 You wade|You swim|You splash
	matchre MPN6 You slap|You struggle|You flounder|make much headway
	matchre MPN6 \.\.\.wait|type ahead
	matchre MPN6.RET ^You are engaged|^You can't do that while engaged
send ne
matchwait

MPN7.RET:
put ret
put ret
MPN7:
pause 0.1
pause 0.2
	matchre MPN8 You wade|You swim|You splash
	matchre MPN7 You slap|You struggle|You flounder|make much headway
	matchre MPN7 \.\.\.wait|type ahead
	matchre MPN7.RET ^You are engaged|^You can't do that while engaged
send north
matchwait

MPN8.RET:
put ret
put ret
MPN8:
pause 0.1
pause 0.2
	matchre MPN9 You wade|You swim|You splash
	matchre MPN8 You slap|You struggle|You flounder|make much headway
	matchre MPN8 \.\.\.wait|type ahead
	matchre MPN8.RET ^You are engaged|^You can't do that while engaged
send north
matchwait

MPN9:
pause 0.5
pause 0.5
GOSUB move climb step
GOSUB move out
GOSUB move s
GOSUB move e
GOSUB move go ware
GOSUB move up
GOSUB move n
GOSUB move out
GOSUB move s
GOSUB move s
GOSUB move go bridge
GOSUB move ne
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO *** Capitol of the province of Zoluren
ECHO *** Located where the Oxenwaithe River crosses the mighty Segoltha River.
ECHO ===================
ECHO
GOTO %1

GETCROSSINGDOKORA:
pause 0.5
	matchre leth-exp2 I don't know who you are referring to|But no one can see you
	matchre GETCROSSING2 But you don't have that much|You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GETCROSSING2:
pause 0.5
move go bank
move go window
put withdraw 5 silver
pause 0.5
move out
move go booth
put exchange 5 silver kronar to dokora
pause
move out
move out
goto leth-exp2

GETCROSSINGMONEYNORTH:
pause 0.5
	matchre CRO-CAR I don't know who you are referring to|But no one can see you
	matchre GETMONEY2 But you don't have that much|You consider the offer and then realize
put tip zzzzzz 30 lirum
matchwait

GETMONEY2:
pause 0.5
move go bank
move go window
put withdraw 1 silver
pause 0.5
move out
move go booth
put exchange 1 silver kronar to lirum
pause 0.5
move out
move out
goto CRO-CAR

CRO-ART:
pause 0.5
move nw
move n
move n
move n
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union since 366!
ECHO
move n
move n
move n
move e
move e
move n
move w
move n
move w
move n
move w
move w
move go crumbling archway
move n
move ne
ECHO
ECHO
ECHO * * * Northward is a monastary surrounded by gargoyles and death spirits and a bramble full of badgers and trollkins
ECHO 
move ne
move e
move ne
move go birch copse
move se
move e
move e
move ne
move ne
move e
move nw
move n
move n
move ne
move nw
move n
move n
ECHO
ECHO ===================
ECHO *** ARTHE DALE
ECHO *** A Halfling village, founded by Daffleberry Tanglefoot
ECHO *** Patron god is Glythtide the ram, god of joy, wine, song, and fellowship, and patron to Bards, gourmands, and drunks
ECHO ===================
ECHO
GOTO %1

ART-KAE:
pause 0.5
move nw
move nw
move n
move n
move n
move ne
move ne
move ne
move e
move e
move e
move n
move n
move n
move n
move n
move n
move ne
move go town gate
move n
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO *** Home to the Gilded Unicorn Inn and Tavern, owned by Savrin Kaerna
ECHO *** Westward is the Journelai Route towards the Journelai mountains, inhabited by rock trolls
ECHO ===================
ECHO
goto FINISH

ART-STO:
pause 0.5
move nw
move nw
move n
move n
move n
move ne
move ne
move ne
move e
move e
move e
move n
move n
move n
move n
move n
move n
move ne
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO *** Home to the Gilded Unicorn Inn and Tavern, owned by Savrin Kaerna
ECHO *** Westward is the Journelai Route towards the Journelai mountains, inhabited by rock trolls
ECHO ===================
ECHO
pause 0.5
move n
move ne
move go town gate
move nw
move nw
move n
move e
move e
ECHO
ECHO ===================
ECHO *** STONE CLAN aka STAAN STOK (in Dwarven Haakish)
ECHO *** Home to the Stone Clan Militia, led by Paragon Redarch
ECHO *** Site of the book of power which was sought by Lord Sorrow and which could remove the wards on the Zaulfung Stones.
ECHO ===================
ECHO
GOTO %1

STO-DIR:
pause 0.5
move n
move n
move ne
move n
move e
move e
move ne
ECHO
ECHO
ECHO * * * Passing a wilderness path where leucros, vipers, geni, and rock guardians dwell
ECHO
move ne
move nw
move n
move n
move n
move n
move n
move n
move go wood bridge
move n
move n
move ne
move n
move nw
move nw
move n
move n
ECHO
ECHO
ECHO * * * This copse holds a Dark Temple with skeletons, zombies, and other undead.
ECHO
move ne
ECHO
ECHO
ECHO * * * Passing the Silverwater Mines and Silverwater Lake, inhabited by faenrae reavers and wind hounds.
ECHO
move ne
move ne
move n
move n
move ne
move nw
move n
move n
move n
move ne
move ne
move ne
move ne
move n
move nw
move nw
move nw
move nw
ECHO
ECHO ===================
ECHO *** NTR CARAVANSARY
ECHO *** A large traveller's outpost at the border between Zoluren and Therengia
ECHO ===================
ECHO
GOTO %1

CRO-CAR:
pause 0.5
move nw
move n
move n
move n
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union since 366!
ECHO
move n
move n
move n
move e
move e
move n
move w
move n
move w
move n
move w
move w
move go crumbling archway
move n
move ne
ECHO
ECHO
ECHO * * * Northward is a monastary surrounded by gargoyles and death spirits and a bramble full of badgers and trollkins
ECHO 
move ne
move e
move ne
move go birch copse
move se
move e
move e
move ne
move ne
move e
move nw
move n
move n
move ne
move nw
move n
move n
ECHO
ECHO ===================
ECHO *** ARTHE DALE
ECHO ===================
ECHO
move nw
move nw
move n
move n
move n
move ne
move ne
move ne
move e
move e
move e
move n
move n
move n
move n
move n
move n
move ne
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO ===================
ECHO
move n
move ne
move go town gate
move nw
move nw
move n
move e
move e
ECHO
ECHO ===================
ECHO *** STONE CLAN
ECHO ===================
ECHO
move n
move n
move ne
move n
move e
move e
move ne
ECHO
ECHO
ECHO * * * Wilderness path: where leucros, vipers, geni, and rock guardians dwell
ECHO
move ne
move nw
move n
move n
move n
move n
move n
move n
move go wood bridge
move n
move n
move ne
move n
move nw
move nw
move n
move n
ECHO
ECHO
ECHO * * * Dark Temple: skeletons, zombies, and other undead.
ECHO
move ne
ECHO
ECHO
ECHO * * * Silverwater Mines: inhabited by faenrae reavers and wind hounds.
ECHO
move ne
move ne
move n
move n
move ne
move nw
move n
move n
move n
move ne
move ne
move ne
move ne
move n
move nw
move nw
move nw
move nw
ECHO
ECHO ===================
ECHO *** NTR CARAVANSARY
ECHO *** A large traveller's outpost at the border between Zoluren and Therengia
ECHO ===================
ECHO
GOTO %1

DIR-CAR:
pause 0.5
move s
move s
move s
move e
move ne
move se
move e
move sw
move w
move sw
move w
move go faint roadway
GOTO %1

TODIRGE2:
pause 0.5
move go narrow track
move e
move ne
move e
move ne
move w
move nw
move sw
move w
move n
move n
move n
ECHO
ECHO ===================
ECHO *** DIRGE, formely known as DARKSTONE
ECHO *** Nestled beneath the shadow of the Greater Fist of Heaven,
ECHO *** a volcano which has smothered Dirge in lava and ash.
ECHO ===================
ECHO
GOTO %1

DIR-RIV:
GROUPCHECK3:
pause 0.5
match BURDENCHECK3 You have no group
match BURDENCHECK3 You must be visible
match GROUP3 You whisper
put whisper group ...
matchwait

GROUP3:
ECHO
ECHO *** YOU HAVE A GROUP
ECHO *** TAKING THE FERRY INSTEAD OF SWIMMING THE FALDESU
ECHO
GOTO MONEYCHECK3

BURDENCHECK3:
    matchre BURDENCHECK3A None|Light
	match BURDENCHECK3B Encumbrance : Somewhat
	match BURDENCHECK3C Encumbrance : Burdened
	match BURDENCHECK3D Encumbrance : Heavy
	match BURDENCHECK3E Encumbrance : Very Heavy
	match BURDENCHECK3F Encumbrance : Overburdened
	match BURDENCHECK3G Encumbrance : Tottering
	match BURDENCHECK3H even able to move?
	match BURDENCHECK3I amazing you aren't squashed!
put encumbrance
matchwait

CANTSWIM3:
ECHO
ECHO *** YOU DO NOT HAVE ENOUGH SWIMMING FOR THE FALDESU (120 ranks)
ECHO *** TAKING THE FERRY
ECHO
goto MONEYCHECK3

BURDENCHECK3A:
if $Athletics.Ranks >= 120 then goto DIR-RIV3
goto CANTSWIM3

BURDENCHECK3B:
if $Athletics.Ranks >= 170 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3C:
if $Athletics.Ranks >= 210 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3D:
if $Athletics.Ranks >= 250 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3E:
if $Athletics.Ranks >= 290 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3F:
if $Athletics.Ranks >= 330 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3G:
if $Athletics.Ranks >= 370 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3H:
if $Athletics.Ranks >= 410 then goto DIR-RIV3
goto OVERBURDENED3

BURDENCHECK3I:
if $Athletics.Ranks >= 450 then goto DIR-RIV3
goto OVERBURDENED3

OVERBURDENED3:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE FALDESU
ECHO *** TAKING THE FERRY
ECHO
GOTO MONEYCHECK3

MONEYCHECK3:
save DIR-FER
	matchre DIR-RIV-CONT I don't know who you are referring to|But no one can see you|You consider the offer and then realize
	match GETMONEYDIRGE But you don't have that much!
put tip zzzzzz 30 lirum
matchwait

GETMONEYDIRGE:
pause 0.5
move go narrow track
move e
move ne
move e
move ne
move w
move nw
move sw
move w
move n
move n
move n
move go ruined gate
move n
move go traveller bank
	match GOTDIRGEMONEY The clerk counts out
	matchre NODIRGEMONEY You don't have that much money|You do not seem to have an account
put withdraw 50 copper
matchwait

NODIRGEMONEY:
pause 0.5
move out
move s
move go ruined gate
ECHO 
ECHO =========================================
ECHO *** You need 30 Lirums for the Riverhaven ferry
ECHO *** Get coins from The Crossing - I can't do everything for you!
ECHO =========================================
ECHO
EXIT

GOTDIRGEMONEY:
pause 0.5
put withdraw 50 copper
put exchange 50 copper kronar to lirum
pause 0.5
put exchange 50 copper kronar to lirum
move out
move s
move go ruined gate
move s
move s
move s
move e
move ne
move se
move e
move sw
move w
move sw
move w
move go faint roadway
goto DIR-RIV-CONT

DIR-FALDESU:
save CROC-FALDESU
goto DIR-RIV-CONT

DIR-RIV3:
save CROC-RIV
goto DIR-RIV-CONT

CAR-NORTHROAD:
SAVE DIR-NORTHROAD
goto DIR-RIV-CONT

DIR-RIV-CONT:
pause 0.5
move n
ECHO
ECHO ===================
ECHO *** Entering the Royal Province of Therengia
ECHO *** Governed by Lord Baron Gyfford of the Theren family
ECHO ===================
ECHO 

LAVA01:
	match LAVA02 Heat rises in palpable waves
	matchre LAVAP01 You must be standing to do that|You can't do that while lying down
put n
matchwait

LAVAP01:
put stand
pause 0.5
goto LAVA01

LAVA02:
	match LAVA03 The land about you is still and lifeless.
	matchre LAVAP02 You must be standing to do that|You can't do that while lying down
put n
matchwait

LAVAP02:
put stand
pause 0.5
goto LAVA02

LAVA03:
	match LAVA04 [North Road, Canyon Rim]
	matchre LAVAP03 You must be standing to do that|You can't do that while lying down
put nw
matchwait

LAVAP03:
put stand
pause 0.5
goto LAVA03

LAVA04:
	match LAVA05 [North Rim, Canyon]
	matchre LAVAP04 You must be standing to do that|You can't do that while lying down
put go trail
matchwait

LAVAP04:
put stand
pause 0.5
goto LAVA04

LAVA05:
	match LAVA06 [North Road, Canyon]
	matchre LAVAP05 You must be standing to do that|You can't do that while lying down
put w
matchwait

LAVAP05:
put stand
pause 0.5
goto LAVA05

LAVA06:
	match LAVA07 To the north, the road wends
	matchre LAVAP06 You must be standing to do that|You can't do that while lying down
put go switchback trail
matchwait

LAVAP06:
put stand
pause 0.5
goto LAVA06

LAVA07:
	match LAVA08 As the road crosses a low point
	matchre LAVAP07 You must be standing to do that|You can't do that while lying down
put n
matchwait

LAVAP07:
put stand
pause 0.5
goto LAVA07

LAVA08:
pause 0.5
	matchre LAVANORTH1 You have no group|You must be visible|
	match LAVANORTH2 You whisper
	matchre LAVA08 \.\.\.wait|type ahead
put whisper group ...
matchwait

LAVANORTH1:
pause 0.5
	matchre DIGNORTH1 feeble attempt|falling short of your goal|holds you tightly, preventing
	matchre WALKNORTH1 You easily navigate|is difficult, but manageable|succeeding only with effort
	matchre LAVANORTH1 fails to keep up with you through the|\.\.\.wait|type ahead
put stand;ne
matchwait

DIGNORTH1:
pause 0.5
	match LAVANORTH1 You manage to dig enough
	match WALKNORTH1 You will have to kneel
	matchre DIGNORTH1 \.\.\.wait|type ahead|You struggle to dig
put stand;dig
matchwait


LAVANORTH2:
pause 0.5
	matchre DIGNORTH2 feeble attempt|falling short of your goal|holds you tightly, preventing
	matchre WALKNORTH2 You easily navigate|is difficult, but manageable|succeeding only with effort
put stand;ne
matchwait

DIGNORTH2:
pause 0.5
	matchre LAVANORTH2 You manage to dig enough|You will have to kneel
	match WALKNORTH2 You struggle to dig
	matchre DIGNORTH2 \.\.\.wait|type ahead
put stand;dig
matchwait

WALKNORTH2:
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause 0.5
put glance
waitfor You glance
goto WALKNORTH1

WALKNORTH1:
pause 0.5
LAVA09:
	match LAVA10 A tongue of molten lava
	matchre LAVAP09 You must be standing to do that|You can't do that while lying down
put ne
matchwait

LAVAP09:
put stand
pause 0.5
goto LAVA09

LAVA10:
	match LAVA11 Occasional flashes of red light
	matchre LAVAP10 You must be standing to do that|You can't do that while lying down
put go lava flow
matchwait

LAVAP10:
put stand
pause 0.5
goto LAVA10

LAVA11:
	match LAVA12 The route descends into the dust
	matchre LAVAP11 You must be standing to do that|You can't do that while lying down
put ne
matchwait

LAVAP11:
put stand
pause 0.5
goto LAVA11

LAVA12:
ECHO
ECHO
ECHO * * * Passing the ruined town of Skeleton's Crook and the Gate of Souls
ECHO * * * Inhabited by fire sprites, firecats, atik'et, and westanuryns
ECHO 
	match LAVA13 Your view north is partially blocked
	matchre LAVAP12 You must be standing to do that|You can't do that while lying down
put n
matchwait

LAVAP12:
put stand
pause 0.5
goto LAVA12

LAVA13:
	match LAVA14 Your footsteps echo off the glassy
	matchre LAVAP13 You must be standing to do that|You can't do that while lying down
put go tunnel
matchwait

LAVAP13:
put stand
pause 0.5
goto LAVA13

LAVA14:
	match LAVA15 Turning your back to the massive obsidian
	matchre LAVAP14 You must be standing to do that|You can't do that while lying down
put n
matchwait

LAVAP14:
put stand
pause 0.5
goto LAVA14

LAVA15:
	matchre LAVA16 Two monstrous volcanoes|You pause here for a moment 
	matchre LAVAP15 You must be standing to do that|You can't do that while lying down
put n
matchwait

LAVAP15:
put stand
pause 0.5
goto LAVA15

LAVA16:
ECHO
ECHO
ECHO * * * Entering the plains and farmlands of southern Therengia
ECHO
move n
move ne
move ne
move n
move nw
ECHO
ECHO
ECHO * * * The ruins of Sicle Grove, destroyed by the eruption of the Greater Fist caused by the fire mage Mibgluc
ECHO * * * Previously a medical community and home to Timothy, now inhabited by fire maidens
ECHO
ECHO
move n
move go bridge
move n
move n
move nw
move w
move w
move w
move w
move w
move w
move w
move w
move w
goto %s

CROC-FALDESU:
ECHO
ECHO
ECHO * * * Passing through swampland where crocodiles and leeches reside
ECHO 
move nw
move n
move nw
move n
move n
move n
move nw
pause 0.5
ECHO
ECHO *** DIVE RIVER to swim in the Faldesu
ECHO
goto FINISH

DIR-NORTHROAD:
ECHO
ECHO
ECHO * * * The Faldesu River lies northward, surrounded by swamps where crocodiles and leeches reside
ECHO
move w
move w
move w
move w
move nw
move nw
move w
move w
move go covered bridge
move w
move w
move w
move w
move w
move nw
move n
move n
ECHO
ECHO *** NORTH ROAD FERRY
ECHO
goto %1

DIR-FER:
ECHO
ECHO
ECHO * * * The Faldesu River lies northward, surrounded by swamps where crocodiles and leeches reside
ECHO
move w
move w
move w
move w
move nw
move nw
move w
move w
move go covered bridge
move w
move w
move w
move w
move w
move nw
move n
move n
ECHO
ECHO *** NORTH ROAD FERRY
ECHO
goto HAVENFERRYNORTH

GROUPCHECK11:
pause 0.1
match BURDENCHECK11 You have no group
match BURDENCHECK11 You must be visible
match GROUP11 You whisper
put whisper group ...
matchwait

GROUP11:
ECHO
ECHO *** YOU HAVE A GROUP
ECHO *** TAKING THE FERRY INSTEAD OF SWIMMING THE FALDESU
ECHO
GOTO HAVENFERRYNORTH

BURDENCHECK11:
pause 0.5
matchre BURDENCHECK11A None|Light
match BURDENCHECK11B Encumbrance : Somewhat
match BURDENCHECK11C Encumbrance : Burdened
match BURDENCHECK11D Encumbrance : Heavy
match BURDENCHECK11E Encumbrance : Very Heavy
match BURDENCHECK11F Overburdened
match BURDENCHECK11G Encumbrance : Tottering
match BURDENCHECK11H even able to move?
match BURDENCHECK11I amazing you aren't squashed!
put info
matchwait

BURDENCHECK11A:
if $Athletics.Ranks >= 155 then goto FER-RIV11
goto CANTSWIM11
BURDENCHECK11B:
if $Athletics.Ranks >= 170 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11C:
if $Athletics.Ranks >= 220 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11D:
if $Athletics.Ranks >= 270 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11E:
if $Athletics.Ranks >= 320 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11F:
if $Athletics.Ranks >= 370 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11G:
if $Athletics.Ranks >= 420 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11H:
if $Athletics.Ranks >= 470 then goto FER-RIV11
goto OVERBURDENED11
BURDENCHECK11I:
if $Athletics.Ranks >= 520 then goto FER-RIV11
goto OVERBURDENED11

OVERBURDENED11:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE FALDESU
ECHO *** TAKING THE FERRY TO RIVERHAVEN
ECHO
GOTO HAVENFERRYNORTH

CANTSWIM11:
ECHO
ECHO *** YOU DO NOT HAVE ENOUGH SWIMMING FOR THE FALDESU (120 ranks)
ECHO *** TAKING THE FERRY TO RIVERHAVEN
ECHO
goto HAVENFERRYNORTH

HAVENFERRYNORTH:
put stand
pause 0.5
	matchre WAITFORHAVENFERRYNORTH wait for the next one|until the next one arrives|I could not find what you were referring to|What were you referring to
	matchre WAITONHAVENFERRYNORTH You hand him your lirums and climb aboard|The Captain gives you a little nod
	match NOMONEY You haven't got enough lirums
put go ferry
matchwait

WAITFORHAVENFERRYNORTH:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
waitfor pulls up to the dock
goto HAVENFERRYNORTH

WAITONHAVENFERRYNORTH:
pause 0.5
ECHO
ECHO *** RIDING THE FERRY
ECHO *** Crossing the Faldesu River to the port city of Riverhaven, governed by Mayor Bressail
ECHO
pause 10
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 2
ECHO
ECHO * * * This ferry is operated by House Shillat, one of the 16 Therengian great houses (or Morzindaen)
ECHO ====================================
ECHO
pause 10
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 2
ECHO
ECHO * * * Outside Riverhaven's east gate are the Warding Stones,
ECHO * * * raised by Farn's Company during the days of the Empire
ECHO * * * to protect Riverhaven from the "nameless evils" of the Zaulfung Swamp.
ECHO * * * Perhaps that evil is the recently discovered lair of the demon or demi-god Maelshyve
ECHO * * * and her cinder beasts, basilisks, and hierophants.
ECHO
ECHO * * * More information may be found in the book "A Study of the
ECHO * * * Zaulfung Stones" at the Gealeranendae College Library in Therenborough
ECHO ====================================
ECHO
pause
waitfor crew ties the ferry off.
put stand
pause
move go dock
move go ramp
move go wooden archway
move ne
move w
goto %1

FER-FALDESU:
pause 0.5
move s
move s
move se
move e
move e
move e
move e
move e
move go covered bridge
move e
move e
move se
move se
move e
move e
move e
move e
ECHO
ECHO
ECHO * * * Passing through swampland where crocodiles and leeches reside
ECHO 
move nw
move n
move nw
move n
move n
move n
move nw
pause 0.5
ECHO
ECHO *** DIVE RIVER to swim in the Faldesu
ECHO
goto FINISH

FER-RIV11:
pause 0.5
move s
move s
move se
move e
move e
move e
move e
move e
move go covered bridge
move e
move e
move se
move se
move e
move e
move e
move e
goto CROC-RIV

CROC-RIV:
ECHO
ECHO
ECHO * * * Passing through swampland where crocodiles and leeches reside
ECHO 
move nw
move n
move nw
move n
move n
move n
move nw
move dive river
ECHO
ECHO
ECHO * * * Now swimming across the Faldesu River to the port city of Riverhaven, governed by Mayor Bressail 
ECHO
pause 0.5
NSN:
pause 0.1
put n
pause 0.5

NSN2:
pause 0.5
	match NSNWEST You can't swim
	matchre NSN2 \[|You swim
	matchre NSN2 \.\.\.wait|type ahead|Roundtime
put n
matchwait

NSNWEST:
pause
	match NCLIMBBRIDGE You can't swim
	matchre NSNWEST You struggle|You work|You blunder|You slap|You flounder
	matchre NSNWEST \.\.\.wait|type ahead
	match NSN2 You swim
put nw
matchwait

NCLIMBBRIDGE:
pause 0.5
move climb stone bridge
move go east gate
move w
move w
move w
move w
move w
move w
move w
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO *** Port city on the Faldesu River, governed by Mayor Bressail
ECHO *** Home to the Standing Stones, which protect the town from the evils of the Zaulfung Swamp 
ECHO ===================
ECHO
GOTO %1

THR-RIV:
GLORYWEST:
put stand
pause
	match THRONEBARGEWEST You hand him your Lirums
	match THRONEBARGEEAST Imperial Glory
	matchre RIVERHAWKWEST You can't do that right now|I could not find what you|What were you referring to
	match GETMONEYTHRONEWEST You haven't got enough Lirums to pay
	matchre GLORYWEST \.\.\.wait|type ahead
put go glory
matchwait

RIVERHAWKWEST:
pause
	matchre THRONEBARGEWEST You hand him your Lirums|\["The Riverhawk"\]
	matchre WAITTHRONEBARGEWEST You can't do that right now|I could not find what you|What were you referring to
	match GETMONEYTHRONEWEST You haven't got enough Lirums to pay
	matchre RIVERHAWKWEST \.\.\.wait|type ahead
put go riverhawk
matchwait

GETMONEYTHRONEWEST:
pause 0.5
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
	match GOTTHRONEMONEY The clerk counts out
	matchre NOTHRONEMONEY You don't have that much money|You do not seem to have an account
put withdraw 120 copper lirum
matchwait

NOTHRONEMONEY:
pause 0.5
ECHO
ECHO *** YOU NEED 120 LIRUMS TO RIDE THE BARGE TO RIVERHAVEN
ECHO *** BUT YOU HAVE NO MONEY IN THRONE CITY
ECHO
ECHO *** START BEGGING
ECHO
EXIT

GOTTHRONEMONEY:
pause 0.5
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
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE
ECHO
put hide
waitfor A barge pulls into the
goto GLORYWEST

THRONEBARGEWEST:
pause
ECHO
ECHO *** Riding the barge up the Faldesu River towards Riverhaven
ECHO
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
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO *** Port city on the Faldesu River, governed by Mayor Bressail
ECHO *** Home to the Standing Stones, which protect the town from the evils of the Zaulfung Swamp
ECHO ===================
ECHO
GOTO %1

RIV-THR:
pause
move e
move e
move e
move e
move e
move e
move go gate
move sw
move se
move s
move s
GLORYEAST:
put stand
pause
	matchre THRONEBARGEEAST You hand him your Lirums|Imperial Glory
	matchre RIVERHAWKEAST You can't do that right now|I could not find what you|What were you referring to
	match GETMONEYTHRONEEAST You haven't got enough Lirums to pay
	matchre GLORYEAST \.\.\.wait|type ahead
put go glory
matchwait

RIVERHAWKEAST:
pause
	matchre THRONEBARGEEAST You hand him your Lirums|\["The Riverhawk"\]
	matchre WAITTHRONEBARGEEAST You can't do that right now|I could not find what you|What were you referring to
	match GETMONEYTHRONEEAST You haven't got enough Lirums to pay
	matchre RIVERHAWKEAST \.\.\.wait|type ahead
put go riverhawk
matchwait

GETMONEYTHRONEEAST:
ECHO
ECHO *** YOU NEED 120 LIRUMS TO RIDE THIS BARGE
ECHO *** CHECKING THE BANK NOW
ECHO
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
move nw
move n
move n
move go bank
move go arch
put withdraw 120 copper lirum
pause
put withdraw 120 copper lirum
move go arch
move out
move s
move s
move s
goto RIV-THR

WAITTHRONEBARGEEAST:
pause
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE
ECHO
put hide
	match THRONEBARGEEASTDISCOVERED discovers your hiding place!
	match GLORYEAST A barge pulls into the
matchwait

THRONEBARGEEASTDISCOVERED:
ECHO
ECHO ===========================
ECHO
ECHO *** Crabs and Rats in this area - PAY ATTENTION ! !
ECHO
ECHO ===========================
ECHO
put retreat
put hide
pause
put retreat
put hide
goto WAITTHRONEBARGEEAST

THRONEBARGEEAST:
pause
ECHO
ECHO *** Riding the barge down the Faldesu River towards Throne City, capitol of the former Seven-Starred Empire
ECHO
put hide
pause
waitfor crew quickly ties the barge off.
put stand
pause
move go dock
ECHO
ECHO *** THRONE CITY
ECHO *** The ancient capitol of the Seven-Pointed Star Empire, on the banks of the Faldesu Delta
ECHO *** Protected by the powerful magics of the Y'Shai Guardians
ECHO *** Constructed by the Dwarven Axe Clan, among others
ECHO *** First Emperor was Verek, son of Akroeg the Ram who united all clans
ECHO
GOTO %1

RIV-ROS:
GROUPCHECK01:
	matchre HEALTHCHECK01 You have no group|You must be visible
	match RIV-BAR You whisper
put whisper group ...
matchwait

HEALTHCHECK01:
pause 0.1
	match PERCEPTIONCHECK01B head
	match PERCEPTIONCHECK01A Encumbrance :
	matchre HEALTHCHECK01 \.\.\.wait|type ahead
put health;enc
matchwait

PERCEPTIONCHECK01A:
if $Perception.Ranks >= 120 then goto CLIMBCHECK01
goto RIV-BAR

PERCEPTIONCHECK01B:
if $Perception.Ranks >= 140 then goto CLIMBCHECK01
goto RIV-BAR

CLIMBCHECK01:
if $Athletics.Ranks >= 100 then goto BURDENCHECK01
goto RIV-BAR

BURDENCHECK01:
save BURDENCHECK01
	matchre BURDENCHECK01A None|Light
	match BURDENCHECK01B Encumbrance : Somewhat
	match BURDENCHECK01C Encumbrance : Burdened
	match BURDENCHECK01D Encumbrance : Heavy
	match BURDENCHECK01E Encumbrance : Very Heavy
	match BURDENCHECK01F Encumbrance : Overburdened
	match BURDENCHECK01G Encumbrance : Tottering
	match BURDENCHECK01H even able to move?
	match BURDENCHECK01I amazing you aren't squashed!
put encumbrance
matchwait

BURDENCHECK01A:
if $Athletics.Ranks >= 140 then goto RIV-ROS-NORTH
goto RIV-BAR

BURDENCHECK01B:
if $Athletics.Ranks >= 190 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01C:
if $Athletics.Ranks >= 230 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01D:
if $Athletics.Ranks >= 270 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01E:
if $Athletics.Ranks >= 310 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01F:
if $Athletics.Ranks >= 350 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01G:
if $Athletics.Ranks >= 390 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01H:
if $Athletics.Ranks >= 430 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01I:
if $Athletics.Ranks >= 470 then goto RIV-ROS-NORTH
goto OVERBURDENED01


OVERBURDENED01:
ECHO
ECHO ==============================================
ECHO *** You are too burdened to swim the Rossman's route with your current swimming skill.
ECHO *** With no burden you need 140 swimming ranks for the Rossman's route.
ECHO ==============================================
ECHO
pause
GOTO RIV-BAR

RIV-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group, are too burdened, OR
ECHO *** You need more perception (140+), climbing (100+), or swimming (140+)
ECHO
ECHO    ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause 0.5
move w
move go municipal pier
move go wooden archway
move w
move n
move w
NORTHBARGE:
put stand
pause 0.5
	matchre WAITFORNORTHBARGE wait for the next one|until the next one arrives|There is no ferry
	matchre WAITONNORTHBARGE You hand him your lirums and climb aboard|The Captain gives you a little nod
	match GETMONEYNORTHBARGE You haven't got enough lirums
put go barge
matchwait

WAITFORNORTHBARGE:
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE ***
ECHO
waitfor pulls into the
goto NORTHBARGE

GETMONEYNORTHBARGE:
ECHO
ECHO *** GETTING LIRUMS FROM BANK ***
ECHO
move e
move s
move e
move go wooden archway
move ne
move nw
move n
move n
move go bank
move go arch
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
	match NONORTHBARGE You haven't got enough lirums
put go barge
matchwait

NONORTHBARGE:
pause 0.5
ECHO
ECHO *** You do not have enough Lirums in Riverhaven to ride the barge to Langenfirth.  Find some money and try again.
ECHO
EXIT

WAITONNORTHBARGE:
pause 0.5
ECHO
ECHO *** Riding the barge west across Lake Gwenalion to the Ranger town of Langenfirth
ECHO *** This barge and casino is owned by Ditsworth, sailing since 305 AV.
ECHO
pause 15
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 1
ECHO
ECHO * * * Langenfirth is named for a monk named Langen who lived in the firth.
ECHO * * * Langen came to the fishing village on Lake Gwenalion in 240 AV, almost 150 years ago.
ECHO
ECHO * * * Though at first shunned by the villagers, Langen won them over by brewing
ECHO * * * one of the finest ales ever made, crafted from the waters of Lake Gwenalion.
ECHO * * * Langen Ale is now known throughout the world.
ECHO
ECHO * * * Langen's Feast is celebrated in all the villages around
ECHO * * * Lake Gwenalion on the 3rd day of Ka'Len the Sea Drake each year.
ECHO ====================================
ECHO
pause
waitfor crew ties the barge off.
put stand
pause
move go wharf
move w
move s
move w
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO * * * A Ranger haven on the western shores of Lake Gwenalion, in the midst of Danduwen Forest
ECHO * * * Located within the territories of House Abriyit, one of the 16 great houses of Therengia 
ECHO * * * Named for Langen, a monk from the firth, who created Langen's Ale. 
ECHO ===================
ECHO
goto %1

RIV-ROS-NORTH:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
move w
move w
move w
move w
move w
move w
move w
move go narrow gate
move nw
ECHO
ECHO
ECHO * * * The western Riverhaven meadows, creeks, and woods
ECHO * * * Inhabited by goblin shamans, crayfish, eels, rams, bears, arbelogs, ogres, and wolf spiders
ECHO
ECHO
move n
move n
move n
move nw
ECHO
ECHO
ECHO * * * Passing a pasture grazed in by barghests
ECHO
move ne
move n
move ne
move nw
move n
move ne
move w
move nw
move n
ECHO
ECHO
ECHO * * * Entering the Mistwood Forest, home to the poisonous nightreaver unyns
ECHO
move ne
move n
move nw
move ne
SEARCHOUTCROP1A:
save SEARCHOUTCROP1A
	match SEARCHOUTCROP1B irregular handholds!
	match SEARCHOUTCROP1A don't find anything of interest.
	matchre PAUSE \.\.\.wait|type ahead
put search outcrop
matchwait

SEARCHOUTCROP1B:
move climb handhold
move climb rock wall
move n

SEARCHOUTCROP2A:
save SEARCHOUTCROP2A
	match SEARCHOUTCROP2B shrubs clinging to the rock face!
	match SEARCHOUTCROP2A don't find anything of interest.
	matchre PAUSE \.\.\.wait|type ahead
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
put nw
move n
move nw
move n
move ne
move go river
ECHO
ECHO
ECHO * * * Swimming up the swift-flowing Jantspyre River towards Rossman's Landing
ECHO
1SWIM1:
pause
	match 1SWIM2 You wade
	matchre 1SWIM1 You struggle|You work|You slap|You flounder
	matchre 1SWIM1 \.\.\.wait|type ahead
put e
matchwait

1SWIM2:
pause
	match 1SWIM3 You wade
	matchre 1SWIM2 You struggle|You work|You slap|You flounder
	matchre 1SWIM2 \.\.\.wait|type ahead
put ne
matchwait

1SWIM3:
pause
	match 1SWIM4 You wade
	matchre 1SWIM3 You struggle|You work|You slap|You flounder
	matchre 1SWIM3 \.\.\.wait|type ahead
put ne
matchwait

1SWIM4:
pause
	match 1SWIM5 You wade
	matchre 1SWIM4 You struggle|You work|You slap|You flounder
	matchre 1SWIM4 \.\.\.wait|type ahead
put e
matchwait

1SWIM5:
pause 0.5
put khri stop
pause 0.5
move go bank
move go path
move nw
move n
move nw
move w
move nw
move w
ECHO
ECHO ===================
ECHO *** ROSSMAN'S LANDING
ECHO *** A wilderness village in the Mistwood Forest on the northeastern shores of Lake Gwenalion 
ECHO ===================
ECHO
GOTO %1

ROS-THE:
put stow left
pause 0.5
put stow right
move east
move se
move e
move se
move ne
move go rose thicket
move e
move sw
move s
move ne
move go gap
move nw
move ne
move nw
move ne
move nw
put stop hum
pause 0.5
if "%guild" = "Thief" then put khri start silence
pause 2
pause 
ROPEN:
put climb rope
	match SHUFFLEN You climb
	match WAITN is already on the rope.
matchwait

WAITN:
put hide
ECHO
ECHO *** Waiting for someone to get off the ropes.
ECHO
	matchre ROPEN finally arriving|finally reaching
matchwait

SHUFFLEN:
ECHO
ECHO *** Travelling north on a dangerous rope bridge over a deep ravine inhabited by sky giants
ECHO
pause
pause
put shuffle north
pause
pause
put shuffle north
pause
pause
put shuffle north
pause
pause 0.5
ECHO
ECHO * * * In this ravine sky giants roam
ECHO
TOTHEREN1:
pause
move nw
move w
move nw
move sw
move nw
move w
move sw
move n
move e
move ne
move n
move nw
move sw
move n
move go north road
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
put khri stop
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO *** Protected by Theren Keep
ECHO *** Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO *** Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren
ECHO ===================
ECHO
GOTO %1

THE-LAN:
ECHO
ECHO
ECHO * * * Travelling by the farmlands, orchards, and country cottages of the beautiful Therengian countryside
ECHO 
pause
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
ELB-2LAN:
move se
move sw
ECHO
ECHO
ECHO * * * The Danduwen Forest
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River
ECHO
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO * * * A Ranger haven on the western shores of Lake Gwenalion, in the midst of Danduwen Forest
ECHO * * * Located within the territories of House Abriyit, one of the 16 great houses of Therengia 
ECHO * * * Named for Langen, a monk from the firth, who created Langen's Ale. 
ECHO ===================
ECHO
GOTO FINISH

ELB-LAN:
pause
move go main road
move w
goto ELB-2LAN

THE-FOR:
pause
	matchre GROUPPASSPORTCHECK1 You see|The folded piece of paper bears|You glance at a passport
	matchre GETPASSPORT I could not find|What were you referring to|passport has expired
put look;glance my passport
matchwait

GROUPPASSPORTCHECK1:
pause
	matchre GOTPASSPORT You have no group|You must be visible|You whisper
	matchre GROUPPASSPORTCHECK1 \.\.\.wait|type ahead
put whisper group ...
matchwait

GETPASSPORT:
pause
move go town gate
move n
move e
move e
move n
move n
move ne
move ne
move n
move ne
move go alabaster arch
move nw
move nw
move nw
move w
move w
move ne
move ne
move go lancet arch
move n
move n
move n
move go gold arch
move ne
GET-PASSPORT:
pause
	match GROUPPASSPORT1 licenser takes some of the papers
	match INV-GET-PASSPORT how do you expect to do that?
	match DESK-PASSPORT doesn't look like you have a free
	matchre GET-PASSPORT /\.\.\.wait|type ahead|passport will allow you/i
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
pause 0.5
	matchre LEAVEPASSPORT1 You have no group|You must be visible
	match GETGROUPPASSPORT1 You whisper
	matchre GROUPPASSPORT1 \.\.\.wait|type ahead
put whisper group Get a passport! ASK LICENSER FOR PASSPORT two times.  We will all need them. Let me know when you have one.
matchwait

GETGROUPPASSPORT1:
pause 0.5
pause 0.5
ECHO
ECHO
ECHO *** WHEN EVERYONE HAS A PASSPORT TYPE "GLANCE" TO CONTINUE
ECHO
ECHO
pause 0.5
waitfor You glance
put whisper group Now stow your passport away!
goto LEAVEPASSPORT1

LEAVEPASSPORT1:
pause
put stow my passport
move sw
move go gold arch
move go black arch
move s
move s
move go oak doors
move sw
move sw
move e
move e
move se
move se
move se
move go alabaster arch
move sw
move s
move sw
move sw
move s
move s
move w
move w
move s
move go town gate
goto GOTPASSPORT

GOTPASSPORT:
pause 0.5
move go stone wall
goto THERENROADWEST1

THERENROADWEST1:
pause
	matchre THERENROADWESTNOGROUP You have no group|You must be visible
	match THERENROADWESTGROUP You whisper
	matchre THERENROADWEST1 \.\.\.wait|type ahead
put whisper group GO WEST RIGHT NOW and Join me fast on the other side!
matchwait

THERENROADWESTGROUP:
pause
pause
put w
waitfor [Ker'Leor, Deep Forest Path]
ECHO
ECHO
ECHO *** GRAB YOUR GROUP AND TYPE "GLANCE" WHEN YOU ARE READY TO MOVE
ECHO *** CAUTION: Creatures roam this area!
ECHO
ECHO
waitfor You glance
GOTO THERENROADWESTDONE

THERENROADWESTNOGROUP:
pause
put w
waitfor [Ker'Leor, Deep Forest Path]
ECHO
ECHO
ECHO * * * Entering the Ker'Leor Forest at the base of the Ker'Leor mountain range, home to roving gypsies led by King Talorc
ECHO
pause
THERENROADWESTDONE:
move n
move nw
move n
move nw
move ne
move n
move ne
move ne
move nw
move ne
move n
move go road
move n
move ne
move nw
ECHO
ECHO
ECHO * * * Laakmir, site of the Suur Pillar, which houses Firulf's staff
ECHO * * * and which created the electrical creatures called seordmaors
ECHO
move nw
move n
move n
move nw
move n
move climb rocky path
ECHO
ECHO
ECHO * * * Now ascending the Ker'Leor mountains - Beware of scaly seordmaors!
ECHO
move up
move up
move up
move up
move up
move ne
move ne
move n
move nw
move climb rocky path
move climb stone ramp
move go steel bridge
move w
move w
ECHO
ECHO ===================
ECHO *** FORNSTED
ECHO *** Located in the Ke'Leor Forest atop the Ker'Leor mountains
ECHO *** Governed by Lord Paragon Larohald of the House Trigomas (one of the great Human houses of Therengia)
ECHO *** Protected by Arnshal Keep, named for the Arncharn Shel Mountains that divide Therengia and Forfedhdar
ECHO ===================
ECHO 
GOTO %1

FOR-HVA:
pause 0.5
move go gate
move w
move go wooden doors
move w
put get my passport

GROUPPASSPORT2:
pause 0.5
	matchre LEAVEPASSPORT2 You have no group|You must be visible
	match WAITPASSPORT2 You whisper
	matchre GROUPPASSPORT2 \.\.\.wait|type ahead
put whisper group Get your passport out and put it in your right hand, we are about to go through a checkpoint.
matchwait

WAITPASSPORT2:
pause 0.5
ECHO
ECHO
ECHO *** WAIT FOR EVERYONE TO GET THEIR PASSPORTS OUT AND PUT THEM IN THEIR RIGHT HANDS, THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause 0.5
waitfor You glance
GOTO LEAVEPASSPORT2

LEAVEPASSPORT2:
pause 0.5
move go gateway
put stow my passport
ECHO
ECHO
ECHO * * * Descending the Ker'Leor mountains towards Hvaral by way of Arnshal Road, named for the Arncharn Shel Mountains
ECHO
pause 0.5
move w
move w
move sw
move sw
move s
move s
move s
move sw
move sw
move nw
move nw
move n
move n
move n
move n
move nw
move nw
move w
move sw
move sw
move s
move s
move s
move s
move sw
move nw
move nw
move nw
move n
move n
move n
move nw
move nw
move sw
move s
move s
move s
move sw
move sw
move w
move up
move w
ECHO
ECHO ===================
ECHO *** HVARAL
ECHO * * * A small town in the Gemfire Mountains on the edge of the Velaka Desert
ECHO * * * Governed by Lord Elbaeryn of House Dacawla from within the Neristan Keep
ECHO * * * Formerly a Dwarven town of the Kwarlog Kingdom, since occupied by the Human Therengians
ECHO * * * An important trade route between Therengia, Muspar'I, and Kwarlog (a Dwarven city and kingdom)
ECHO ===================
ECHO
pause 0.5
goto %1

HVA-MUS:
pause 0.5
move go narrow gateway
move w
move s
move w
move sw
move nw
move go ramp
move w

GoDesertWest:
put whisper group GO BARGE! We can not get on the barge together as a group. You have to get on yourself.
pause
	matchre WAITFORBARGEWEST I could not find what|What were you referring to|You can't do that right now
	match INV-GoDesertWest they can't see you?
	matchre WAITONBARGEWEST \["The Desert Wind"\]|\["The Suncatcher"\]
put go barge
matchwait

INV-GoDesertWest:
pause 0.5
ECHO
ECHO *** You cannot board the barge while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause 0.5
waitfor You glance
goto GoDesertWest

WAITFORBARGEWEST:
ECHO
ECHO *** WAITING FOR SAND BARGE TO ARRIVE ***
ECHO
	match GoDesertWest barge pulls into the
	match WAITFORBARGEWEST YOU HAVE BEEN IDLE
matchwait 

WAITONBARGEWEST:
pause 0.5
put whisper group GO PLATFORM when we dock! We can not leave the barge together. You will have to get off the barge yourself.
pause 0.5
ECHO
ECHO *** Riding west across the Velaka Desert to Muspar'i, the Desert Jewel
ECHO * * * Riding aboard a sand barge pulled by packbeasts called yeehars.
ECHO
pause 25
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 5
ECHO
ECHO * * * The currency of the Therengian province is the Lirum.
ECHO * * * The Lirum is named after the wife of Akroeg the Ram.
ECHO
ECHO * * * Akroeg had united all the races under the banner of the Ram Clan.
ECHO * * * After Akroeg's death his wife and sons along with the scholar Moliko
ECHO * * * ended the Ram Clan and formed the Seven Pointed Star Empire.
ECHO ====================================
ECHO
pause 25
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 5
ECHO
ECHO * * * The lake in the Velaka Desert was originally inhabited by Sand Elves.
ECHO * * * After the fall of the Seven Starred Empire the S'kra Mur, led by Shorka the Cobra,
ECHO * * * settled at the lake and built Muspar'i over protests of the Sand Elves.
ECHO * * * Shorka was a friend of Lanival and fought with Lanival against Teiro in the Resistance Wars
ECHO ====================================
ECHO
pause 25
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 3 of 5
ECHO
ECHO * * * The Sand Elves and S'kra settled their differences and now live together in Muspar'i
ECHO * * * Muspar'i has become a major trade city between Kwarlog and Therengia
ECHO * * * It is known for its fine crafts: healing poultices, perfumes, dyes, spices, poisons, jewelry, weapons, silks, pottery...
ECHO ====================================
ECHO
pause 25
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 4 of 5
ECHO
ECHO * * * Muspar'i was first ruled by Shorka the Cobra, who was made queen
ECHO * * * Modern rulers and nobility of Muspar'i are known as "The Blood of Shorka",
ECHO * * * though they are not necessarily true descendents of Shorka
ECHO
ECHO * * * More can be read in "The History of Muspar'i" at the Royal Library of Muspar'i
ECHO ====================================
ECHO
pause 20
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 5 of 5
ECHO
ECHO * * * The S'kra of Muspar'i believe they were led to Velaka by the S'kra Mur god Hav'roth, the Cobra
ECHO * * * Hav'roth is god of the spirits of rock, stone, earth, and deserts and is creator of precious metals and gems
ECHO * * * Hav'roth's light aspect is Peri'el the King Snake and dark aspect Ushnish the Viper
ECHO
ECHO * * * More about the gods can be read in "The Immortals" at the Riverhaven Academy or Crossing temple
ECHO ====================================
ECHO
WAITONBARGEWEST22:
put look
pause
	match LEAVEBARGEWEST The sand barge pulls
	match WAITONBARGEWEST22 YOU HAVE BEEN IDLE
matchwait

LEAVEBARGEWEST:
put whisper group GO PLATFORM! Then go ramp and go gate. We can not leave the barge together. You will have to get off the barge yourself.
move go oasis
move go ramp
move go gate
ECHO
ECHO ====================================
ECHO *** MUSPAR'I ***
ECHO * * * A S'kra Mur city, built on a lake in the Velaka Desert
ECHO * * * Also called the Desert Jewel or the Sun's Egg by the S'kra
ECHO * * * Built by Shorka the Cobra, a S'kra who fought with Lanival against Teiro in the Resistance Wars
ECHO * * * Governed by monarchy whose ruling class and nobility are known as the "Blood of Shorka" (though not necessarily true descendents of Shorka)
ECHO * * * Patron god is Hav'roth the cobra, god of the S'kra Mur and deserts
ECHO * * * Known for its artistry in weapon forging, silks, dyes, ceramics, and jewelry
ECHO ====================================
ECHO
goto FINISH

MUS-BARGE:
move go ramp
GODESERTEAST:
put whisper group GO BARGE! We can not get on the barge together as a group. You have to get on yourself.
pause
	matchre WAITFORBARGEEast I could not find what|What were you referring to|You can't do that right now
	matchre WAITONBARGEEast \["The Desert Wind"\]|\["The Suncatcher"\]
	match INV-GODESERTEAST they can't see you?
put go barge
matchwait

INV-GODESERTEAST:
pause 0.5
ECHO
ECHO *** You cannot board the barge while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause 0.5
waitfor You glance
goto GODESERTEAST

WAITFORBARGEEast:
ECHO
ECHO *** WAITING FOR SAND BARGE TO ARRIVE ***
ECHO
waitfor barge pulls into the
goto GODESERTEAST

WAITONBARGEEast:
pause
pause
put whisper group GO DOCK when we arrive! We can not get off the barge together as a group. You have to get off the barge yourself.
pause
ECHO
ECHO ====================================
ECHO *** Riding aboard a sand barge pulled by yeehar.
ECHO *** Traveling east across the Velaka Desert towards Hvaral,
ECHO *** built into the Gemfire Mountains north of the Arncharn Shel Mountains.
ECHO ====================================
ECHO 
pause 15
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 2
ECHO
ECHO * * * Hvaral was built by the Dwarves of the Kwarlog Empire
ECHO * * * after the Humans and Dwarves won the Elven-Human War.
ECHO
ECHO * * * The Humans and Dwarves later used Hvaral as a base of
ECHO * * * operations against the Dragon Priests and D'zree.
ECHO
ECHO * * * After the Dragon Priests were defeated the Dwarves and
ECHO * * * Humans fell into conflict, sparking the Therengia-Kwarlog War.
ECHO
ECHO * * * The Dwarves withdrew from the destroyed outpost of Hvaral
ECHO * * * and the Therengians rebuilt the town in a Therengian style,
ECHO * * * including a keep that houses Hvaral's rulers, the Neristan Keep.
ECHO * * * Hvaral is a unique clash of Dwarven and Human architecture.
ECHO ====================================
ECHO 
pause 15
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 2
ECHO
ECHO * * * Hvaral is currently governed by Lord Elbaeryn
ECHO * * * Despite its name the Gemfire Mountains have few gems, or ores or salt.
ECHO * * * Muspar'i was built and settled by the S'kra Mur in recent times, after the Therengia-Kwarlog War
ECHO * * * Hvaral survives upon interprovincial trade, being the gateway to the Velaka Desert
ECHO 
ECHO * * * More can be learned about Hvaral by reading "A History of Hvaral" located in the Neristan Keep of Hvaral.
ECHO ====================================
ECHO
pause 15
waitfor The sand barge pulls
pause
	matchre LEAVEBARGEEASTNOGROUP You have no group|You must be visible
	match LEAVEBARGEEASTGROUP You whisper
put whisper group GO DOCK! We can not get off the barge together as a group. You have to get off the barge yourself.
matchwait

LEAVEBARGEEASTGROUP:
pause 0.5
move go oasis
pause 0.5
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING ***
ECHO
ECHO
waitfor You glance
goto %1

LEAVEBARGEEASTNOGROUP:
pause 0.5
move go dock
goto %1

MUS-HVA:
pause 0.5
move e
move go ramp
move se
move ne
move e
move n
move e
move go narrow gateway
ECHO
ECHO ===================
ECHO *** HVARAL
ECHO * * * A small town in the Gemfire Mountains on the edge of the Velaka Desert
ECHO * * * Governed by Lord Elbaeryn of House Dacawla from within the Neristan Keep
ECHO * * * Formerly a Dwarven town of the Kwarlog Kingdom, since occupied by the Human Therengians
ECHO * * * An important trade route between Therengia, Muspar'i, and Kwarlog (a Dwarven city and kingdom)
ECHO ===================
ECHO
pause 0.5
goto %1

HVA-FOR:
ECHO
ECHO
ECHO * * * Entering the territory of House Macwe, one of the great Therengian houses
ECHO
pause 0.5
move e
move down
move e
move ne
move ne
move n
move n
move n
move ne
move se
move se
move s
move s
move s
move se
move se
move se
move ne
move n
move n
move n
move n
move ne
move ne
move e
move se
move se
move s
move s
move s
move s
move se
move se
move ne
move ne
move n
move n
move n
move ne
move ne
move e
move go stone causeway
move go small gateway
move e
move go ironwood doors
move e
move go gate
ECHO
ECHO ===================
ECHO *** FORNSTED
ECHO * * * Located in the Ke'Leor Forest atop the Ker'Leor mountains
ECHO * * * Governed by Lord Paragon Larohald of the House Trigomas (one of the great Human houses of Therengia)
ECHO * * * Protected by Arnshal Keep, named for the Arncharn Shel Mountains that divide Therengia and Forfedhdar 
ECHO ===================
ECHO 
GOTO %1


FOR-THE:
pause 0.5
move go steel bridge
move e
move e
move down
move climb rocky path
move se
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Descending to the base of the Ker'Leor mountains, homeland of the gypsies led by King Talorc
ECHO
ECHO
move down
move down
move down
move down
move down
move climb rocky path
move s
move se
move s
move s
move se
ECHO
ECHO
ECHO * * * Passing by Laakmir, site of the Suur Pillar, which houses Firulf's staff and which created the electrical creatures called seordmaors
ECHO
ECHO
move se
move sw
move s
move w
move s
move sw
move se
move sw
move sw
move s
move sw
move se
move s
move se
move s
goto THERENROADEAST1

THERENROADEAST1:
pause 0.5
	matchre THERENROADEASTNOGROUP You have no group|You must be visible
	match THERENROADEASTGROUP You whisper
	matchre THERENROADEAST1 \.\.\.wait|type ahead
put whisper group Go EAST right now and join me on the other side!
matchwait


THERENROADEASTGROUP:
pause
pause
put e
waitfor [Theren Road]
ECHO
ECHO
ECHO *** GRAB YOUR GROUP AND TYPE "GLANCE" WHEN YOU ARE READY TO MOVE
ECHO
ECHO
waitfor You glance
GOTO THERENROADEASTDONE

THERENROADEASTNOGROUP:
pause 0.5
put e
waitfor [Theren Road]
GOTO THERENROADEASTDONE

THERENROADEASTDONE:
pause 0.5
move go stone wall
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO * * * Protected by Theren Keep
ECHO * * * Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO * * * Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren 
ECHO ===================
ECHO
GOTO %1

LAN-THE:
pause 0.5
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River by bridge
ECHO 
move n
move n
move go northern shore
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move n
move nw
move n
move nw
move ne
move nw
move n
move n
ECHO
ECHO
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO 
move ne
move nw
move n
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
pause 0.5
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
ECHO
ECHO
ECHO * * * Entering the apple orchards and fertile farmlands of upper Therengia
ECHO 
move n
move ne
move ne
move nw
move ne
move ne
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO * * * Protected by Theren Keep
ECHO * * * Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO * * * Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren 
ECHO ===================
ECHO
GOTO %1

SKILLCHECK7:
pause 0.1
if $Athletics.Ranks >= 50 then goto THE-ROS-CONT
goto NOROSSMAN


THE-ROS:
GROUPCHECK7:
pause 0.1
	matchre HEALTHCHECK7 You have no group|You must be visible
	match THE-BAR You whisper
put whisper group ...
matchwait

HEALTHCHECK7:
pause 0.1
	match PERCEPTIONCHECK7B head
	match PERCEPTIONCHECK7A Encumbrance:
	match PERCEPTIONCHECK7A Encumbrance :
	matchre HEALTHCHECK7 \.\.\.wait|type ahead
#put health
put info
matchwait

PERCEPTIONCHECK7A:
if $Perception.Ranks >= 120 then goto CLIMBCHECK7
goto THE-BAR

PERCEPTIONCHECK7B:
if $Perception.Ranks >= 140 then goto CLIMBCHECK7
goto THE-BAR

CLIMBCHECK7:
if $Athletics.Ranks >= 100 then goto SWIMCHECK7
goto THE-BAR

SWIMCHECK7:
if $Athletics.Ranks >= 30 then goto GREATSURVIVAL7
goto THE-BAR

GREATSURVIVAL7:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
goto THE-ROS-CONT

THE-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group OR need more perception (140+), climbing (100+), or swimming (30+)
ECHO
ECHO ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause 0.5
	matchre THE-BAR-CONT I don't know who you are referring to|But no one can see you.
	matchre GETMONEYSOUTHBARGE But you don't have that much|You consider the offer and then realize
put tip zzzzzz 65 lirum
matchwait

GETMONEYSOUTHBARGE:
ECHO
ECHO *** GETTING LIRUMS FROM THEREN BANK ***
ECHO
pause
move go town gate
move n
move e
move e
move n
move n
move ne
move go marble entrance
move n
put withdraw 13 bronze lirum
pause
move s
move out
move sw
move s
move s
move w
move w
move s
move go town gate
goto THE-BAR-CONT

THE-BAR-CONT:
ECHO
ECHO
ECHO * * * Travelling by the farmlands, orchards, and country cottages of the beautiful Therengian countryside
ECHO 
pause 0.5
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO 
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
pause 0.5 
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
move se
move sw
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River
ECHO
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO * * * A Ranger haven on the western shores of Lake Gwenalion, in the midst of Danduwen Forest
ECHO * * * Located within the territories of House Abriyit, one of the 16 great houses of Therengia 
ECHO * * * Named for Langen, a monk from the firth, who created Langen's Ale.
ECHO * * (Langen's Feast is celebrated on the 3rd day of Ka'Len each year) 
ECHO ===================
ECHO
move go Waldroth's Landing
move n
move e
goto SOUTHBARGE

ELB-RIV:
GROUPCheckElbain7:
	matchre HEALTHCheckElbain7 You have no group|You must be visible
	match ELB-BAR You whisper
put whisper group ...
matchwait

HEALTHCheckElbain7:
	match PERCEPTIONCheckElbain7B head
	match PERCEPTIONCheckElbain7A Encumbrance:
	match PERCEPTIONCheckElbain7A Encumbrance :
	matchre HEALTHCheckElbain7 \.\.\.wait|type ahead
put info
matchwait

PERCEPTIONCheckElbain7A:
if $Perception.Ranks >= 120 then goto CLIMBCheckElbain7
goto ELB-BAR

PERCEPTIONCheckElbain7B:
if $Perception.Ranks >= 140 then goto CLIMBCheckElbain7
goto ELB-BAR

CLIMBCheckElbain7:
if $Athletics.Ranks >= 100 then goto SWIMCheckElbain7
goto ELB-BAR

SWIMCheckElbain7:
if $Athletics.Ranks >= 30 then goto GREATSURVIVALElbain7
goto ELB-BAR

GREATSURVIVALElbain7:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
goto ELB-ROS-CONT

ELB-ROS-CONT:
pause 0.1
move go main road
move w
goto ELB-ROS-2CONT

ELB-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group OR need more perception (140+), climbing (100+), or swimming (30+)
ECHO
ECHO ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause 0.1
move go main road
move w
move se
move sw
ECHO
ECHO
ECHO * * * The Danduwen Forest
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO
move s
move s
move se
move sw
move se
move s
move se
move s
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River
ECHO
move s
move s
move go southern shore
move s
move s
move s
move se
move s
move sw
move se
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** LANGENFIRTH
ECHO ===================
ECHO
move go Waldroth's Landing
move n
move e
goto SOUTHBARGE

LAN-RIV:
GROUPCheckLang7:
	matchre HEALTHCheckLang7 You have no group|You must be visible
	match LAN-BAR You whisper
put whisper group ...
matchwait

HEALTHCheckLang7:
	match PERCEPTIONCheckLang7B head
	match PERCEPTIONCheckLang7A Encumbrance:
	match PERCEPTIONCheckLang7A Encumbrance :
	matchre HEALTHCheckLang7 \.\.\.wait|type ahead
put health;enc
matchwait

PERCEPTIONCheckLang7A:
if $Perception.Ranks >= 120 then goto CLIMBCheckLang7
goto LAN-BAR

PERCEPTIONCheckLang7B:
if $Perception.Ranks >= 140 then goto CLIMBCheckLang7
goto LAN-BAR

CLIMBCheckLang7:
if $Athletics.Ranks >= 100 then goto SWIMCheckLang7
goto LAN-BAR

SWIMCheckLang7:
if $Athletics.Ranks >= 30 then goto GREATSURVIVALLang7
goto LAN-BAR

GREATSURVIVALLang7:
ECHO
ECHO ==============================
ECHO *** Great Survival Skills!
ECHO *** Taking the Rossman's Landing shortcut!
ECHO ==============================
ECHO
goto LAN-ROS-CONT

LAN-BAR:
ECHO
ECHO ========================================
ECHO *** You cannot take the Rossman's Landing shortcut because you either
ECHO *** Have a group OR need more perception (140+), climbing (100+), or swimming (30+)
ECHO
ECHO ***  TAKING THE BARGE INSTEAD   ***
ECHO ========================================
ECHO
pause 0.5
move go Waldroth's Landing
move n
move e
goto SOUTHBARGE

SOUTHBARGE:
put stand
pause
	matchre WAITFORSOUTHBARGE wait for the next one|until the next one arrives|There is no ferry
	matchre WAITONSOUTHBARGE You hand him your lirums and climb aboard|The Captain gives you a little nod
	match NOMONEY You haven't got enough lirums
put go barge
matchwait

WAITFORSOUTHBARGE:
ECHO
ECHO *** WAITING FOR THE BARGE TO ARRIVE ***
ECHO
waitfor pulls into the
GOTO SOUTHBARGE

WAITONSOUTHBARGE:
pause
ECHO
ECHO *** Riding the barge across Lake Gwenalion to Riverhaven
ECHO *** This barge and casino is owned by Ditsworth, sailing since 305 AV.
ECHO
pause 15
ECHO
ECHO =================================
ECHO *** Common Knowledge: 1 of 2
ECHO * * * The currency of the Therengian province is the Lirum.
ECHO * * * The Lirum is named after the wife of Akroeg the Ram.
ECHO
ECHO * * * Akroeg united all the races under the banner of the Ram Clan.
ECHO * * * After Akroeg's death his work was continued by his wife, his son Verek, Barbalas, and the scholar Moliko.
ECHO * * * This group ended the Ram Clan and formed the Seven Pointed Star Empire.
ECHO =================================
ECHO
pause 15
ECHO
ECHO =================================
ECHO *** Common Knowledge: 2 of 2
ECHO * * * Akroeg's son Verek was annointed the first emperor
ECHO * * * Vereklaath or Founding Day is celebrated on the 1st day of the month of Akroeg the Ram
ECHO * * * Vereklaath is celebrated by parades of soldiers in full armor and exchange of gifts among Therengians
ECHO =================================
ECHO
waitfor crew ties the barge off.
put stand
pause 0.5
move go pier
move e
move s
move e
move go wooden archway
move ne
move w
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO * * * Site of the Dunshade manor, where Byron Dunshade murdered his wife Tatia and daughter Laurel then killed himself.
ECHO * * * Home to the olvio from the badlands to the northwest, who built the Halfling Quarter in town.
ECHO ===================
ECHO
goto %1

LAN-ROS-CONT:
pause 0.5
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River by bridge
ECHO 
move n
move n
move go northern shore
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move n
move nw
move n
move nw
move ne
move nw
move n
move n
ECHO
ECHO
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO 
move ne
move nw
ELB-ROS-2CONT:
move n
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
pause 0.5
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
ECHO
ECHO
ECHO * * * Entering the apple orchards and fertile farmlands of upper Therengia
ECHO 
move n
move ne
move ne
move nw
move ne
move ne
ECHO
ECHO
ECHO * * * Entering the Mistwood Forest
ECHO
goto LAN-ROS-2CONT

THE-ROS-CONT:
pause 0.5
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
LAN-ROS-2CONT:
move go forest road
move s
move ne
move se
move s
move sw
move w
move s
move ne
move e
move se
move ne
move se
move e
move se
if "$righthand" != "Empty" then put stow right
if "$lefthand" != "Empty" then put stow left
pause 0.5
pause 0.5
put stop hum
if "%guild" = "Thief" then put khri start silence
pause 
pause
ECHO
ECHO
ECHO * * * In this ravine sky giants roam
ECHO
pause

ROPES:
put climb rope
	match SHUFFLES You climb
	match WAITS is already on the rope.
matchwait

WAITS:
put hide
ECHO
ECHO *** Waiting for someone to get off the ropes
ECHO
	matchre ROPES finally arriving|finally reaching
matchwait

SHUFFLES:
put stop hum
if "%guild" = "Thief" then put khri start silence
pause 0.5
ECHO
ECHO *** Travelling south on a dangerous rope bridge over a deep ravine inhabited by sky giants
ECHO 
pause
pause
put shuffle south
ECHO
ECHO ================================
ECHO
ECHO *** Orcs and Warcats at the end of these ropes - PAY ATTENTION ! !
ECHO
ECHO ================================
ECHO
pause
pause
put shuffle south
wait
pause
pause
put shuffle south
wait
pause
pause
put retreat
put retreat
pause 0.5
pause 0.5
put retreat
pause 0.5
pause 0.5
move se
move sw
move se
move sw
move se
put khri stop
move go thicket
move south
move west
move west
move north
move go forest
move sw
move nw
move w
move nw
move w
ECHO
ECHO ===================
ECHO *** ROSSMAN'S LANDING
ECHO *** A wilderness village in the Mistwood Forest on the northeastern shores of Lake Gwenalion
ECHO ===================
ECHO 
GOTO %1

ROS-RIV:
HEALTHCHECK8:
pause 0.1
	match PERCEPTIONCHECK8B head
	match PERCEPTIONCHECK8A Encumbrance:
	match PERCEPTIONCHECK8A Encumbrance :
	matchre HEALTHCHECK8 \.\.\.wait|type ahead
put info
matchwait

PERCEPTIONCHECK8A:
if $Perception.Ranks >= 120 then goto CLIMBCHECK8
goto SKILLCHECK8

PERCEPTIONCHECK8B:
if $Perception.Ranks >= 140 then goto CLIMBCHECK8
goto SKILLCHECK8

CLIMBCHECK8:
if $Athletics.Ranks >= 100 then goto ROS-TO-RIV
goto SKILLCHECK8

SWIMCHECK8:
if $Athletics.Ranks >= 30 then goto ROS-TO-RIV
goto SKILLCHECK8

SKILLCHECK8:
if $Athletics.Ranks >= 50 then goto ROS-LONGWAY
goto NOROSSMAN2

NOROSSMAN2:
ECHO
ECHO ==============================
ECHO *** You do not have enough perception (140), climbing (100), or swimming (30) which are all required to take the shortcut from Rossman's to Riverhaven, nor do you have the 50 ranks of climbing required to get from Rossman's to Therenborough.  You must rent a boat to sail on Lake Gwenalion, moongate out, or find someone to help you.
ECHO ==============================
ECHO
EXIT

ROS-LONGWAY:
pause 0.5
ECHO
ECHO ============================
ECHO *** You don't have enough perception (140), climbing (100), or swimming (30) to take the shortcut from Rossman's to Riverhaven.
ECHO *** You will be taken the long way using the barge from Langenfirth to Riverhaven.
ECHO =============================
ECHO
GOTO ROS-THE

ROS-TO-RIV:
pause 0.1
move e
move se
move e
move se
move s
move se
move s
move go river
ECHO
ECHO
ECHO * * * Swimming down the swift-flowing Jantspyre River towards Riverhaven
ECHO * * * Named the "Giant's Pyre" for a boulder formation in the river which resembles a massive corpse on a funeral pyre
ECHO
pause 0.5
pause 0.5
move w
pause 0.5
pause 0.5
move sw
pause 0.5
pause 0.5
move sw
pause 0.5
pause 0.5
move w
ECHO
ECHO
ECHO * * * Entering territory inhabited by poisonous nightreaver unyns
ECHO
pause 0.5
pause 0.5
move go bank
move sw
move s
move se
move s
move s
put s

SEARCHOUTCROP3A:
save SEARCHOUTCROP3A
	match SEARCHOUTCROP3B irregular handholds!
	match SEARCHOUTCROP3A don't find anything of interest.
	matchre PAUSE \.\.\.wait|type ahead
put search outcrop
matchwait

SEARCHOUTCROP3B:
move climb handhold
move climb handhold
move sw
move se
move s
move sw
move s
move se
move e
ECHO
ECHO
ECHO * * * Passing a meadow where barghests graze
ECHO
move sw
move s
move se
move sw
move s
move sw
move se
move s
move s
ECHO
ECHO
ECHO * * * The western wilds of Riverhaven, inhabited by
ECHO * * * Goblin shamans, crayfish, eels, rams, bears, arbelogs, ogres, and wolf spiders
ECHO
move s
move se
move go gate
move e
move e
move e
move e
move e
move e
move e
ECHO
ECHO ===================
ECHO *** RIVERHAVEN
ECHO * * * Site of the Dunshade manor, where Byron Dunshade murdered his wife Tatia and daughter Laurel then killed himself.
ECHO * * * Home to the olvio from the badlands to the northwest, who built the Halfling Quarter in town.
ECHO ===================
ECHO
GOTO %1

RIV-DIR:
GROUPCHECK2:
pause 0.1
	matchre BURDENCHECK2 You have no group|You must be visible
	match GROUP2 You whisper
put whisper group ...
matchwait

GROUP2:
ECHO
ECHO *** YOU HAVE A GROUP
ECHO *** TAKING THE FERRY
ECHO
GOTO RIV-FER

BURDENCHECK2:
save BURDENCHECK2
	matchre BURDENCHECK2A None|Light
	match BURDENCHECK2B Encumbrance : Somewhat
	match BURDENCHECK2C Encumbrance : Burdened
	match BURDENCHECK2D Encumbrance : Heavy
	match BURDENCHECK2E Encumbrance : Very Heavy
	match BURDENCHECK2F Overburdened
	match BURDENCHECK2G Encumbrance : Tottering
	match BURDENCHECK2H even able to move?
	match BURDENCHECK2I amazing you aren't squashed!
	matchre PAUSE \.\.\.wait|type ahead
	match PAUSE type ahead
put encumbrance
matchwait

BURDENCHECK2A:
if $Athletics.Ranks >= 150 then goto RIV-DIR-SOUTH
goto CANTSWIM2

BURDENCHECK2B:
if $Athletics.Ranks >= 170 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2C:
if $Athletics.Ranks >= 210 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2D:
if $Athletics.Ranks >= 250 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2E:
if $Athletics.Ranks >= 290 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2F:
if $Athletics.Ranks >= 330 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2G:
if $Athletics.Ranks >= 370 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2H:
if $Athletics.Ranks >= 410 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

BURDENCHECK2I:
if $Athletics.Ranks >= 450 then goto RIV-DIR-SOUTH
goto OVERBURDENED2

CANTSWIM2:
ECHO
ECHO *** YOU DO NOT HAVE ENOUGH SWIMMING FOR THE FALDESU (120 ranks)
ECHO *** TAKING THE FERRY
ECHO
goto RIV-FER

OVERBURDENED2:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE FALDESU
ECHO *** TAKING THE FERRY
ECHO
GOTO RIV-FER

RIV-FER:
pause 0.1
move w
move go municipal pier
move go wooden archway
move go ramp
HAVENFERRYSOUTH:
put stand
pause 0.1
	matchre WAITFORHAVENFERRYSOUTH wait for the next one|until the next one arrives|I could not find what you were referring to|What were you referring to
	matchre WAITONHAVENFERRYSOUTH You hand him your lirums and climb aboard|The Captain gives you a little nod
	match GETMONEYHAVENFERRYSOUTH You haven't got enough lirums
put go ferry
matchwait

WAITFORHAVENFERRYSOUTH:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
waitfor pulls up to the dock
goto HAVENFERRYSOUTH

GETMONEYHAVENFERRYSOUTH:
ECHO
ECHO *** GETTING LIRUMS FROM BANK ***
ECHO
move go ramp
move go wooden archway
move ne
move nw
move n
move n
move go bank
move go arch
put withdraw 30 copper
pause
put withdraw 30 copper
move go arch
move out
move s
move s
move se
move go municipal pier
move go wooden archway
move go ramp
GOTO HAVENFERRYSOUTH

WAITONHAVENFERRYSOUTH:
put hide
pause
ECHO
ECHO *** Riding the ferry south across the Faldesu River
ECHO *** This ferry is operated by House Shillat, one of the 16 Therengian great houses (or Morzindaen)
ECHO
pause 0.1
waitfor crew ties the ferry off.
put stand
pause 0.1
move go dock
goto %1

FER-DIR:
ECHO
ECHO
ECHO * * * Entering the plains and farmlands of southern Therengia
ECHO 
pause 0.1
move s
move s
move se
move e
move e
move e
move e
move e
move go covered bridge
move e
move e
move se
move se
move e
move e
move e
move e
ECHO
ECHO
ECHO * * * The Faldesu River lies northward, surrounded by swamps where crocodiles and leeches reside
ECHO 
pause 0.1
GOTO CROC-DIR

RIV-FALDESU:
pause 0.5
move e
move e
move e
move e
move e
move e
move e
move go gate
ECHO
ECHO *** DIVE RIVER to swim in the Faldesu
ECHO
goto FINISH

FAL-FER:
ECHO
ECHO
ECHO * * * Passing through swamplands where crocodiles and leeches reside
ECHO
move se
move s
move s
move s
move se
move s
move se
move w
move w
move w
move w
move nw
move nw
move w
move w
move go covered bridge
move w
move w
move w
move w
move w
move nw
move n
move n
goto %1


RIV-DIR-SOUTH:
pause 0.2
move e
move e
move e
move e
move e
move e
move e
move go gate
pause 0.5
put dive river
ECHO
ECHO
ECHO * * * Now swimming south across the Faldesu River towards the farmlands of southern Therengia
ECHO 
send s
pause
pause 
SSWIMSOUTH:
	matchre SSWIMSOUTH You swim|You struggle|You blunder|You slap|You work|You flounder
	matchre SSWIMROCK You can't swim
	matchre SSWIMSOUTH \.\.\.wait|type ahead
put s
matchwait

SSWIMROCK:
pause 0.1
pause 0.5
	matchre SSWIMROCK \.\.\.wait|type ahead
	matchre SSWIMROCK You struggle|You blunder|You slap|You work|You flounder
	matchre SSWIMSOUTH \[|You swim
	matchre SCLIMBBRIDGE You can't swim
put sw
matchwait

SCLIMBBRIDGE:
pause 0.5
put khri stop
pause 0.5
move climb bridge
ECHO
ECHO
ECHO * * * Passing through swamplands where crocodiles and leeches reside
ECHO
move se
move s
move s
move s
move se
move s
move se
ECHO
ECHO
ECHO * * * Entering the plains and farmlands of southern Therengia
ECHO 
CROC-DIR:
move e
move e
move e
move e
move e
move e
move e
move e
move e
move se
move s
move s
move go bridge
move s
ECHO
ECHO
ECHO * * * The ruins of Sicle Grove, destroyed by the eruption
ECHO * * * of the Greater Fist caused by the fire mage Mibgluc
ECHO * * * Previously a medical community and home to Timothy, now inhabited by fire maidens
ECHO
ECHO
move se
move s
move sw
move sw
move s
move s

LAVA19:
	match LAVA20 [North Road, Tunnel]
	matchre LAVAP19 You must be standing to do that|You can't do that while lying down
put go tunnel
matchwait

LAVAP19:
put stand
pause
goto LAVA19

LAVA20:
	match LAVA21 Your view north is partially blocked
	matchre LAVAP20 You must be standing to do that|You can't do that while lying down
put s
matchwait

LAVAP20:
put stand
pause
goto LAVA20

LAVA21:
	match LAVA22 The route descends into the dust
	matchre LAVAP21 You must be standing to do that|You can't do that while lying down
put s
matchwait

LAVAP21:
put stand
pause
goto LAVA21

LAVA22:
ECHO
ECHO
ECHO * * * Passing the ruined town of Skeleton's Crook and the Gate of Souls
ECHO * * * Inhabited by fire sprites, firecats, atik'et, and westanuryns
ECHO 
	match LAVA23 Occasional flashes of red light
	matchre LAVAP22 You must be standing to do that|You can't do that while lying down
put sw
matchwait

LAVAP22:
put stand
pause
goto LAVA22

LAVA23:
	match LAVA24 A tongue of molten lava
	matchre LAVAP23 You must be standing to do that|You can't do that while lying down
put go old flow
matchwait

LAVAP23:
put stand
pause
goto LAVA23

LAVA24:
	match LAVA25 The wind rips a stream
	matchre LAVAP24 You must be standing to do that|You can't do that while lying down
put sw
matchwait

LAVAP24:
put stand
pause
goto LAVA24

LAVA25:
	match LAVA26 As the road crosses a low point
	matchre LAVAP25 You must be standing to do that|You can't do that while lying down
put sw
matchwait

LAVAP25:
put stand
pause
goto LAVA25

LAVA26:
pause
	match LAVASOUTH1 No one!
	match LAVASOUTH2 You have:
put assess group
put wealth
matchwait

LAVASOUTH1:
PAUSE
	matchre DIGSOUTH1 feeble attempt|falling short of your goal|holds you tightly, preventing
	matchre WALKSOUTH1 You easily navigate|is difficult, but manageable|succeeding only with effort
	match LAVASOUTH1 fails to keep up with you through the
	matchre LAVASOUTH1 \.\.\.wait|type ahead
put stand;s
matchwait

DIGSOUTH1:
pause
	match LAVASOUTH1 You manage to dig enough
	match WALKSOUTH1 You will have to kneel
	match DIGSOUTH1 You struggle to dig
	matchre DIGSOUTH1 \.\.\.wait|type ahead
put stand;dig
matchwait

LAVASOUTH2:
PAUSE
	matchre DIGSOUTH2 feeble attempt|falling short of your goal|holds you tightly, preventing
	matchre WALKSOUTH2 You easily navigate|is difficult, but manageable
	match WALKSOUTH2 succeeding only with effort
	matchre LAVASOUTH2 \.\.\.wait|type ahead
put stand;s
matchwait

DIGSOUTH2:
pause
	match LAVASOUTH2 You manage to dig enough
	match WALKSOUTH2 You will have to kneel
	match DIGSOUTH2 You struggle to dig
	matchre DIGSOUTH2 \.\.\.wait|type ahead
put stand;dig
matchwait

WALKSOUTH2:
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING ***
ECHO
ECHO
pause
waitfor You glance
goto WALKSOUTH1

WALKSOUTH1:
pause 0.1
LAVA27:
	match LAVA28 The reek of the gasses
	matchre LAVAP27 You must be standing to do that|You can't do that while lying down
put go narrow trail
matchwait

LAVAP27:
put stand
pause 0.1
goto LAVA27

LAVA28:
	match LAVA29 [North Rim, Canyon]
	matchre LAVAP28 You must be standing to do that|You can't do that while lying down
put e
matchwait

LAVAP28:
put stand
pause
goto LAVA28

LAVA29:
	match LAVA30 The road north is blocked
	matchre LAVAP29 You must be standing to do that|You can't do that while lying down
put go trail
matchwait

LAVAP29:
put stand
pause 0.1
goto LAVA29

LAVA30:
	match LAVA31 The land about you is still and lifeless.
	matchre LAVAP30 You must be standing to do that|You can't do that while lying down
put se
matchwait

LAVAP30:
put stand
pause 0.1
goto LAVA30

LAVA31:
	match LAVA32 Heat rises in palpable waves
	matchre LAVAP31 You must be standing to do that|You can't do that while lying down
put s
matchwait

LAVAP31:
put stand
pause 0.1
goto LAVA31

LAVA32:
	match LAVA33 [North Road]
	matchre LAVAP32 You must be standing to do that|You can't do that while lying down
put s
matchwait

LAVAP32:
put stand
pause 0.1
goto LAVA32

LAVA33:
	match LAVA34 [North Roads Caravansary]
	matchre LAVAP33 You must be standing to do that|You can't do that while lying down
put s
matchwait

LAVAP33:
put stand
pause
goto LAVA33

LAVA34:
ECHO
ECHO ===================
ECHO *** Entering the Province of Zoluren
ECHO *** Governed by Prince Vorclaf
ECHO *** Named from High Gamgweth "Zohlu Ren", meaning "First Land"
ECHO ===================
ECHO 
ECHO
ECHO *** NTR CARAVANSARY
ECHO *** A large traveller's outpost at the border between Zoluren and Therengia
ECHO 
GOTO %1

DIR-STO:
pause 0.5
move se
move se
move se
move se
move s
move sw
move sw
move sw
move sw
move s
move s
move s
move se
move sw
move s
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Passing the Silverwater Mines and Silverwater Lake, inhabited by faenrae reavers and wind hounds.
ECHO
move sw
ECHO
ECHO
ECHO * * * This copse holds a Dark Temple with skeletons, zombies, and other undead.
ECHO
move s
move s
move se
move se
move s
move sw
move s
move go wood bridge
move s
move s
move s
move s
move s
move s
move s
move se
move sw
ECHO
ECHO
ECHO * * * Passing a wilderness path where leucros, vipers, geni, and rock guardians dwell
ECHO 
move sw
move w
move w
move s
move sw
move s
move s
ECHO
ECHO ===================
ECHO *** STONE CLAN aka STAAN STOK (in Dwarven Haakish)
ECHO * * * Led by the clan elder, Cloudcrest
ECHO * * * Dwarves are said to be loathed by Elves because it was Dwarves who killed Keloryon, Father of all Elves, and because of the enslavement of many Wind Elves in the Dragonspine Mountains.
ECHO ===================
ECHO
GOTO %1

STO-KAE:
pause 0.5
move w
move w
move s
move se
move se
move go town gate
move sw
ECHO
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO * * * Home to the Gilded Unicorn Inn and Tavern, owned by Savrin Kaerna
ECHO * * * Adjacent to Sorrow's Reach, home of Lord Sorrow and the S'lai
ECHO ===================
ECHO
goto FINISH

STO-ART:
pause 0.5
move w
move w
move s
move se
move se
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO * * * Adjacent to Sorrow's Reach, home of Lord Sorrow and the S'lai
ECHO ===================
ECHO
move sw
move s
move go town gate
move sw
move s
move s
move s
move s
move s
move s
move w
move w
move w
move sw
move sw
move sw
move s
move s
move s
move se
move se
ECHO
ECHO ===================
ECHO *** ARTHE DALE
ECHO * * * A Halfling village, founded by Daffleberry Tanglefoot
ECHO * * * Patron god is Glythtide the ram, god of joy, wine, song,
ECHO * * * and fellowship, and patron to Bards, gourmands, and drunks.
ECHO ===================
ECHO
GOTO %1

ART-CRO:
pause 0.5
move s
move s
move se
move sw
move s
move s
move se
move w
move sw
move sw
move w
move w
move go birch copse
move sw
move sw
move w
move sw
ECHO
ECHO
ECHO * * * Northward is a monastary surrounded by gargoyles and death spirits and a bramble full of badgers and trollkins
ECHO
move sw
move s
move go crumbling archway
move e
move e
move s
move e
move s
move e
move s
move w
move w
move s
move s
move s
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO * * * Protected by Ulf'Hara Keep, home to Prince Vorclaf, leader of the province of Zoluren
ECHO * * * Heart of the Five Provinces, called The Dragon's Realms because they were formed by Lanival "the Dragon"
ECHO ===================
ECHO
GOTO %1

CAR-CRO:
pause 0.5
move se
move se
move se
move se
move s
move sw
move sw
move sw
move sw
move s
move s
move s
move se
move sw
move s
move s
move sw
move sw
ECHO
ECHO
ECHO * * * Silverwater Mines: inhabited by faenrae reavers and wind hounds.
ECHO
move sw
ECHO
ECHO
ECHO * * * Dark Temple: skeletons, zombies, and other undead.
ECHO
move s
move s
move se
move se
move s
move sw
move s
move go wood bridge
move s
move s
move s
move s
move s
move s
move s
move se
move sw
ECHO
ECHO
ECHO * * * Wilderness path: where leucros, vipers, geni, and rock guardians dwell
ECHO 
move sw
move w
move w
move s
move sw
move s
move s
ECHO
ECHO ===================
ECHO *** STONE CLAN
ECHO ===================
ECHO
move w
move w
move s
move se
move se
move go town gate
ECHO
ECHO ===================
ECHO *** KAERNA VILLAGE
ECHO * * * Adjacent to Sorrow's Reach, home of Lord Sorrow and the S'lai
ECHO ===================
ECHO
move sw
move s
move go town gate
move sw
move s
move s
move s
move s
move s
move s
move w
move w
move w
move sw
move sw
move sw
move s
move s
move s
move se
move se
ECHO
ECHO ===================
ECHO *** ARTHE DALE, a Halfling village!
ECHO ===================
ECHO
move s
move s
move se
move sw
move s
move s
move se
move w
move sw
move sw
move w
move w
move go birch copse
move sw
move sw
move w
move sw
move sw
move s
move go crumbling archway
move e
move e
move s
move e
move s
move e
move s
move w
move w
move s
move s
move s
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO * * * Protected by Ulf'Hara Keep, home to Prince Vorclaf, leader of the province of Zoluren
ECHO * * * Heart of the Five Provinces, called The Dragon's Realms because they were formed by Lanival "the Dragon"
ECHO ===================
ECHO
GOTO %1

leth-exp2:
if $Athletics.Ranks > 20 then goto cro-let
goto CRO-FER

cro-let:
CHECKGUILD:
if "%guild" = "Thief" then goto BURDENCHECK4
goto CRO-FER

BURDENCHECK4:
save BURDENCHECK4
matchre SWIMCHECK4A None|Light
match SWIMCHECK4B Encumbrance : Somewhat
match SWIMCHECK4C Encumbrance : Burdened
match SWIMCHECK4D Encumbrance : Heavy
match SWIMCHECK4E Encumbrance : Very Heavy
match SWIMCHECK4F Overburdened
match SWIMCHECK4G Encumbrance : Tottering
match SWIMCHECK4H even able to move?
match SWIMCHECK4I amazing you aren't squashed!
match pause ...wait
match pause type ahead
put info
matchwait

SWIMCHECK4A:
if $Athletics.Ranks >= 25 then goto PAS-LET
goto CRO-FER
SWIMCHECK4B:
if $Athletics.Ranks >= 40 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4C:
if $Athletics.Ranks >= 75 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4D:
if $Athletics.Ranks >= 110 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4E:
if $Athletics.Ranks >= 140 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4F:
if $Athletics.Ranks >= 180 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4G:
if $Athletics.Ranks >= 240 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4H:
if $Athletics.Ranks >= 260 then goto PAS-LET
goto OVERBURDENED4
SWIMCHECK4I:
if $Athletics.Ranks >= 300 then goto PAS-LET
goto OVERBURDENED4

OVERBURDENED4:
ECHO
ECHO *** YOU ARE TOO BURDENED TO SWIM THE RIVER
ECHO *** TAKING THE FERRY
ECHO
GOTO CRO-FER

CRO-FER:
move sw
move go Longbow Bridge
move sw
move w
move w
move w
move w
move sw
move go wooden pier

CROSSINGFERRYSOUTH:
put stand
pause
	matchre WAITFORCROSSINGFERRYSOUTH wait for the next one|until the next one arrives|I could not find what you were referring to
	matchre WAITFORCROSSINGFERRYSOUTH What were you referring to|There is no ferry here to go aboard
	matchre WAITONCROSSINGFERRYSOUTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
	match GETMONEYCROSSINGFERRYSOUTH You haven't got enough
put go ferry
matchwait

WAITFORCROSSINGFERRYSOUTH:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
waitfor pulls into the
goto CROSSINGFERRYSOUTH

GETMONEYCROSSINGFERRYSOUTH:
ECHO
ECHO *** GETTING KRONARS FROM THE BANK ***
ECHO
pause
move go Lemicus Square
move ne
move e
move e
move e
move e
move ne
move go Longbow Bridge
move ne
move go Provincial Bank
move go teller window
put withdraw 70 copper
pause
put withdraw 70 copper
pause
move out
move out
goto CRO-FER

WAITONCROSSINGFERRYSOUTH:
put hide
pause
ECHO
ECHO *** Riding south across the mighty Segoltha River towards Leth Deriel, the ancient Elven stronghold.
ECHO
pause 3
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 2
ECHO
ECHO * * * Between Crossing and Leth is the Forest of Night, created by the mad mage Sithsia.
ECHO
ECHO * * * Lord Ellinton, Sithsia's employer, built her a keep in the Endrus Forest
ECHO * * * During a conflict with Ellinton's enemies his son was slain.
ECHO * * * Sithsia wept tears of blood and fell into madness.
ECHO * * * She called to the dead to rise and kill all, friend and foe.
ECHO
ECHO * * * Today magic and life are twisted and dark in the Forest of
ECHO * * * Night and Sithsia, if she lives, hides in her ever-moving keep
ECHO
ECHO * * * You can read more in "The Forest of Night" at the Izma University in Leth Deriel.
ECHO ====================================
ECHO
pause 7
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 2 of 2
ECHO
ECHO * * * Sithsia, mage of the Forest, is credited with ending the Dragon Priest reign
ECHO
ECHO * * * Dzree sent 10,000 troops to conquer Leth Deriel, but only 1 returned.
ECHO * * * He spoke of a twisted forest of mist and darkness and mishappen fae
ECHO * * * Dzree sent more armies, but each time all perished but one survivor.
ECHO
ECHO * * * Then one day Sithsia appeared to Dzree before the Throne of Blood and 
ECHO * * * told Dzree she would never have Leth Deriel, then prophesied that Dzree
ECHO * * * and her empire would fall in one year, and so it did.
ECHO
ECHO * * * You can read more in "The Legend of the World Dragon" at The Crossing Temple
ECHO ====================================
ECHO
waitfor crew ties the ferry off.
if $hidden = 0 then put shiver
if $standing = 0 then put stand
pause
move go dock
goto %1

FER-LET:
pause .5
move s
move s
move s
GOTO BOULDERSOUTH

PAS-LET:
pause .5
move sw
move go bridge
move n
move n
GOSUB move go ware
GOSUB move s

PAS-LET-DOOR:
matchre PAS-LET2 ^You open
matchre PAS-LET2 ^What were you
matchre PAS-LET2 ^That is already
matchre PAS-LET-RET ^You are engaged
put open trapdoor
matchwait

PAS-LET-RET:
put ret
put ret
pause .1
goto PAS-LET-DOOR

PAS-LET2:
GOSUB move go trap
GOSUB move go river
GOSUB move w
GOSUB move n
PAS-LET-PANEL:
save PAS-LET-PANEL
	match RETREAT You can't do that while engaged
	match PAS-LET-CONT2 You duck quietly
	matchre RETURN2CRO I could not find|What were you referring to
put go panel
matchwait

RETURN2CRO:
pause .5
GOSUB move s
GOSUB move e
GOSUB move go ware
GOSUB move u
1234567:
GOSUB move n
GOSUB move out
GOSUB move s
GOSUB move s
GOSUB move go bridge
GOSUB move ne
goto CRO-FER

PAS-LET-CONT2:
move climb step
ECHO
ECHO
ECHO * * * You have entered the fabled 5th Passage of which many Thieves spent years trying to find
ECHO 
SMOVERET:
put ret;ret
SMOVE:
pause 0.5
pause 0.5
	matchre SMOVERET ^You can't do that while engaged|^You are engaged
	matchre SMOVE1 You splash|You wade|You swim
	matchre SMOVE You slap|You struggle|You flounder|make much headway
	matchre SMOVE \.\.\.wait|type ahead
put s
matchwait

SMOVE1RET:
put ret;ret
SMOVE1:
pause 0.5
pause 0.5
	matchre SMOVE1RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE2 You splash|You wade|You swim
	matchre SMOVE1 You slap|You struggle|You flounder|make much headway
	matchre SMOVE1 \.\.\.wait|type ahead
put s
matchwait

SMOVE2RET:
put ret;ret
SMOVE2:
pause 0.2
pause 0.5
	matchre SMOVE2RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE3 You splash|You wade|You swim
	matchre SMOVE2 You slap|You struggle|You flounder|make much headway
	matchre SMOVE2 \.\.\.wait|type ahead
put sw
matchwait

SMOVE3RET:
put ret;ret
SMOVE3:
pause 0.5
pause 0.2
	matchre SMOVE3RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE4 You splash|You wade|You swim
	matchre SMOVE3 You slap|You struggle|You flounder|make much headway
	matchre SMOVE3 \.\.\.wait|type ahead
put sw
matchwait

SMOVE4RET:
put ret;ret
SMOVE4:
pause 0.5
pause 0.2
	matchre SMOVE4RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE5 You splash|You wade|You swim
	matchre SMOVE4 You slap|You struggle|You flounder|make much headway
	matchre SMOVE4 \.\.\.wait|type ahead
put down
matchwait

SMOVE5RET:
put ret;ret
SMOVE5:
pause 0.5
pause 0.2
	matchre SMOVE5RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE6 You splash|You wade|You swim
	matchre SMOVE5 You slap|You struggle|You flounder|make much headway
	matchre SMOVE5 \.\.\.wait|type ahead
put s
matchwait

SMOVE6RET:
put ret;ret
SMOVE6:
pause 0.5
pause 0.3
	matchre SMOVE6RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE7 You splash|You wade|You swim
	matchre SMOVE6 You slap|You struggle|You flounder|make much headway
	matchre SMOVE6 \.\.\.wait|type ahead
put sw
matchwait

SMOVE7RET:
put ret;ret
SMOVE7:
pause 0.5
pause 0.3
	matchre SMOVE7RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE8 You splash|You wade|You swim
	matchre SMOVE7 You slap|You struggle|You flounder|make much headway
	matchre SMOVE7 \.\.\.wait|type ahead
put sw
matchwait

SMOVE8RET:
put ret;ret
SMOVE8:
pause 0.5
pause 0.3
	matchre SMOVE8RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE9 You splash|You wade|You swim
	matchre SMOVE8 You slap|You struggle|You flounder|make much headway
	matchre SMOVE8 \.\.\.wait|type ahead
put s
matchwait

SMOVE9RET:
put ret;ret
SMOVE9:
pause 0.5
pause 0.5
pause 0.1
	matchre SMOVE9RET ^You can't do that while engaged|^You are engaged
	matchre SMOVE10 You splash|You wade|You swim|You go
	matchre SMOVE9 You slap|You struggle|You flounder|make much headway
	matchre SMOVE9 \.\.\.wait|type ahead
put up
matchwait


SMOVE10:
pause 0.5
move sw
pause 0.2
move w
pause 0.2
move sw
pause 0.3
move climb ladder
move go gap
BOULDERSOUTH:
ECHO
ECHO * * * Now entering the Endrus Forest, home to Leth Deriel.
ECHO 
move s
move sw
move sw
move sw
move sw
move s
move se
move se
move s
move s
move sw
move sw
move sw
move s
move se
ECHO
ECHO * * * Passing the Forest of Night, created by mad mage Sithsia
ECHO * * * Home to nyads, dryads, and death spirits
ECHO
move sw
move s
move sw
move s
move s
move se
move se
move sw

WEBSOUTH1:
	match NOWEBSOUTH Thick trees line the route here,
	matchre WEBSOUTH2 Roundtime|You can't do that while
	matchre WEBSOUTH2 \.\.\.wait|type ahead
put sw
matchwait

WEBSOUTH2:
pause 0.5
ECHO
ECHO *** You are stuck in a spider's web.  Be patient.
ECHO
	matchre WEBSOUTH1 Using your escape|The webs break apart and fall away, releasing you
matchwait

NOWEBSOUTH:
move sw
move sw
move s
move sw
move se
move se
move s
move s
move se
move se
move s
move s
move se
move go bower gate
move se
move se
move se
move se
move se
move se
move se
ECHO ===================
ECHO *** LETH DERIEL
ECHO *** Ancient stronghold of the Forest Elves
ECHO *** Protected by the mad mage Sithsia
ECHO ===================
GOTO %1

LET-GON:
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move go bower gate
move sw
move s
move sw
move sw
ECHO * * * Passing the manor of Lasarhhtha Oshu'ehhrsk the Bone Dancer
ECHO * * * Home to bone wolves, zombies, germish'din, and kartais
move s
move s
move sw
move sw
move s
move s
move sw
move sw
move sw
move s
move s
move s
move s
move sw
move s
move sw
move sw
move sw
move sw
move sw
move s
move s
move sw
move sw
move s
move s
move sw
move sw
move s
move sw
move sw
move sw
move sw
move sw
move s
move s
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move w
move w
move sw
move sw
move s
move sw
move s
move sw
move s
move sw
move s
move sw
move sw
if matchre("$roomobjs","(well-made blockade)") then 
{
move go blockade
goto GOND.CONT
}
else move s

GOND.CONT:
move s
ECHO
ECHO * * * Entering the Dragonspine Mountains via the Obsidian Pass
ECHO * * * Beware of snowbeasts, particularly down that track
move se
move sw
SOUTH.SHORTCUT.CHECK:
if $Athletics.Ranks >= 520 then 
{
ECHO
ECHO *** Congratulations!!! 
ECHO *** You have enough Athletics to climb undergondola!  (520+ ranks)
ECHO *** Taking shortcut! 
ECHO 
pause 
goto nsundergondola2
}
move s
if "$righthand" != "Empty" then put stow right
if "$lefthand" != "Empty" then put stow left
pause 0.5
pause 0.5
move climb platform
goto %1

NORTH-PLATFORM:
northgondolacheck:
ECHO *** Northern Gondola Platform
pause .5
if $Athletics.Ranks >= 520 then goto nsundergondola
goto 2NORTH-PLATFORM

2NORTH-PLATFORM:
pause
	match WAITONSOUTHGONDOLA \[Gondola
	match WAITFORSOUTHGONDOLA There is no
put go gondola
matchwait

WAITFORSOUTHGONDOLA:
if $Athletics.Ranks >= 520 then goto nsundergondola
ECHO
ECHO *** WAITING FOR THE GONDOLA TO ARRIVE ***
ECHO * * * If you believe you can take the quick shortcut under the
ECHO * * * gondola (approximately 540 base ranks of climbing) type SHORTCUT1
ECHO
put look;glance gondola
	match GETONSOUTHGONDOLA The gondola stops on the platform
	match WAITFORSOUTHGONDOLA YOU HAVE BEEN IDLE
	match nsundergondola SHORTCUT1
matchwait 

GETONSOUTHGONDOLA:
put stand
pause
move go gondola
goto WAITONSOUTHGONDOLA

nsundergondola:
pause 0.1
move go ridge
move n
nsundergondola2:
if $Athletics.Ranks < 550 then
{
put get hemp rope
put uncoil my rope
pause 0.5
}
if $Athletics.Ranks < 550 then
{
if "%guild" = "Thief" then put khri start focus
pause 2
pause
}
goto CLIMB-BRANCH

CLIMB-BRANCH:
SAVE CLIMB-BRANCH
	matchre CLIMB-NICHE A stand of tall trees comes into view
	matchre FAIL-BRANCH1 climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb branch
matchwait

FAIL-BRANCH1:
SAVE FAIL-BRANCH1
pause
	matchre CLIMB-NICHE A stand of tall trees comes into view
	matchre FAIL-BRANCH2 steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb branch
matchwait

FAIL-BRANCH2:
SAVE FAIL-BRANCH2
pause
	matchre CLIMB-NICHE A stand of tall trees comes into view
	matchre FAIL-BRANCH3 climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb branch
matchwait

FAIL-BRANCH3:
SAVE FAIL-BRANCH3
pause
	matchre CLIMB-NICHE A stand of tall trees comes into view
	matchre LEAVE-BRANCH climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb branch
matchwait

LEAVE-BRANCH:
pause .5
send retreat
move south
move climb platform
goto failed-branch

FAILED-BRANCH:
pause
ECHO
ECHO *** You failed 4 attempts to climb under the gondola.
ECHO *** Maybe you should just stay put and wait like everyone else.
ECHO
put coil rope
put stow my rope
pause .5
goto 2NORTH-PLATFORM

CLIMB-NICHE:
SAVE CLIMB-NICHE
	matchre CLIMB-LEDGE The steep climb shows no signs
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
PUT climb craggy niche
matchwait

CLIMB-LEDGE:
pause
SAVE CLIMB-LEDGE
	matchre CLIMB-WALL Vegetation creeps in and out
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
PUT climb narrow ledge
matchwait

CLIMB-WALL:
SAVE CLIMB-WALL
	matchre CLIMBED-WALL Widening and flattening out, the steep climb
	matchre CLIMBED-WALL The steep climb shows no signs
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

CLIMBED-WALL:
move up
move n
move ne
goto CLIMB-EMBANKMENT

CLIMB-EMBANKMENT:
SAVE CLIMB-EMBANKMENT
	matchre CLIMB-LOG Willowy branches reach out
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
put climb embankment
matchwait

CLIMB-LOG:
SAVE CLIMB-LOG
	matchre CLIMBED-LOG Tamarisk bushes display their feathery
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

CLIMBED-LOG:
if $Athletics.Ranks < 550 then 
{
put coil rope
put stow my rope
pause 0.5
}
pause 0.1
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
move go path
move n
move ne
move go door
move go frame
goto %1
#===============

WAITONSOUTHGONDOLA:
put s
put hide
pause
ECHO
ECHO ================================
ECHO *** Riding south over the great chasm of the Obsidian Pass towards Shard, the Crystal City
ECHO ================================
ECHO
pause 10
ECHO
ECHO ================================
ECHO *** Dragon Priests make their home in western Ilithi and southern Forfedhdar
ECHO *** Many of the deadly creatures that roam Ilithi were brought by the Dragon Priests
ECHO *** They summoned the Vykathi of the hive and the Frostweavers in the Dragonspine Mountains
ECHO *** They created the Adan'f from lizards
ECHO ================================
ECHO
pause 5
ECHO
ECHO ================================
ECHO *** Ferdahl Alec, son of Corik and father to Kukalakai, built the gondola to connect Ilithi to the Mountain Elves.
ECHO *** The Mountain Elves, led by Queen Morganae, were responsible for maintaining the gondola.
ECHO *** However, one day Morganae's only daughter, Princess Anlorahle, was slaughtered on the gondola by a snow beast sent by Necromancer Sidhlot.
ECHO *** Since that day the Mountain Elves have abandoned the gondola, yet it still slowly drifts between the platforms, as if pushed by some ghostly hand.
ECHO ================================
ECHO
pause 5
ECHO
ECHO ================================
ECHO *** A switchback trail outside the south platform leads beneath the gondola and to many creatures,
ECHO *** including snowbeasts, gargoyles, frostweavers, red leucros, blade spiders, and la'tami
ECHO ================================
ECHO
WAITINGFORSOUTH:
pause 5
	match GETOFFSOUTHGONDOLA With a soft bump, the gondola
	match WAITINGFORSOUTH YOU HAVE BEEN IDLE
	put look
	matchwait 

GETOFFSOUTHGONDOLA:
move out
ECHO
ECHO *** SOUTHERN GONDOLA PLATFORM ***
ECHO
pause .5
goto %1

on-gondola:
ECHO
ECHO *** You are aboard the gondola within the Obsidian Pass of the Dragonspine Mountains
ECHO *** If you want out and are able, you better do it now
ECHO *** Otherwise you will be taken off the gondola at the next landing and continue on to your destination.
ECHO
waitfor With a soft bump, the gondola
put n
put out
pause
put south
put out
pause 0.1
goto %1

gon-fay:
ECHO
ECHO ===================
ECHO *** Entering the province of Illithi
ECHO ===================
ECHO
pause 0.1
move go door frame
move go oak door
move sw
move s
move se
move go wooded path
move sw
move w
move w
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO * * * Inhabited by Wood Elves and Halflings
ECHO * * * Home to Marachek's Oak
ECHO ===================
ECHO
goto %1

FAY-STE:
pause 0.1
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move sw
move sw
move s
move s
move sw
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO 
move sw
move s
move sw
move sw
move sw
move go bridle path
move w
ECHO
ECHO ===================
ECHO *** STEELCLAW CLAN
ECHO *** A clan of Elven warriors and barbarians
ECHO ===================
ECHO
goto %1

STE-SHA:
pause 0.1
move e
move go dusky path
move s
ECHO
ECHO
ECHO * * * The Golden Grain Fields
ECHO * * * Over the stile are jackals, boggles, kobolds, and goblins
ECHO 
move w
move w
move sw
move w
move w
move s
move s
move se
move se
move sw
ECHO
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO * * * Capitol of Ilithi and the Elothean nation, governed by an Elothean Ferdahl
ECHO * * * Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO * * * Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered then released by the Outcasts.
ECHO ===================
ECHO
goto %1

gon-sha:
ECHO
ECHO ===================
ECHO *** Entering the province of Illithi
ECHO * * * A province of Elotheans and Elves
ECHO * * * Home of the Dragon Spine Mountains, Lanival's last known location.
ECHO * * * Home of the Dragon Priests, enemy of the seven races, summoners
ECHO * * * of the Vykathi and Frostweavers, and creators of Adan'f from lizards.
ECHO ===================
ECHO
pause
move go door frame
move go oak door
move sw
move s
move se
move go wooded path
move sw
move w
move w
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO ===================
ECHO
move sw
move w
move sw
move s
move sw
move s
move sw
move s
move s
move sw
move sw
move s
move s
move sw
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO 
move sw
move s
move sw
move sw
move sw
move s
ECHO
ECHO
ECHO * * * The Golden Grain Fields: jackals, boggles, kobolds, and goblins
ECHO 
move w
move w
move sw
move w
move w
move s
move s
move se
move se
move sw
ECHO
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO * * * Capitol of Ilithi and the Elothean nation, governed by an Elothean Ferdahl
ECHO * * * Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO * * * Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered then released by the Outcasts.
ECHO ===================
ECHO
goto %1

shard-directions:
ECHO
ECHO ===================
ECHO *** Go south to get to the North Gate.
ECHO *** Go trail towards the West Gate, or
ECHO *** Follow the long road eastward to the East Gate
ECHO ===================
ECHO
goto finish

SHA-HOR:
pause
move go muddy trail
move w
move sw
move sw
move s
ECHO
ECHO
ECHO * * * Passing Wyvern Mountain, home to a World Dragon shrine built by Sh'kial
ECHO
move w
move nw
move n
move nw
move w
move n
move nw
move n
move nw
move nw
move n
move ne
move ne
move ne
move n
move ne
move n
move nw
move nw
move w
move nw
move w
move w
move sw
move nw
move w
move w
move w
move w
move w
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move sw
move w
move sw
move climb narrow path
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
move w
move nw
move w
move sw
move climb game trail
move nw
move s
move sw
move w
move nw
move w
move w
move w
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Under D'zree the Dragon Priests once conquered most of the 5 provinces
ECHO
pause 0.5
move sw
move se
move s
move w
move sw
move w
move sw
move w
move sw
move w
move nw
move w
move nw
move w
move nw
move w
move s
move go path
ECHO
ECHO ===================
ECHO *** HORSE CLAN aka Zaldi Taipa (in Elven)
ECHO *** A nomadic clan of Wind Elves
ECHO *** Governed by the Indar Taipan, Elven for "Strength of the Clan"
ECHO *** The wife of the chieften is called Carwu Taipen, Elven for "Heart of the Clan"
ECHO *** The eldest shaman is called the Jan Taipen, Elven for "Spirit of the Clan"
ECHO *** Home to the Sulde Taala, a special horse nearly worshipped by the clan, sometimes called Horse of the Huntress or the Sun-Horse.
ECHO ===================
ECHO
goto finish

hor-sha:
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
pause
move go path
move n
move e
move se
move e
move se
move e
move se
move e
move ne
move e
move ne
move e
move ne
move e
move n
move nw
move ne
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Founded by a harmless priest named Sh'kial, turned wicked by his scheming student D'zree
ECHO
pause
move e
move e
move e
move se
move e
move ne
move n
move se
move climb bluff
move ne
move e
move se
move e
move climb narrow path
move ne
move e
move ne
move e
move se
move ne
move ne
move e
move e
move se
move ne
move ne
move e
move e
move se
move ne
move e
move e
move e
move e
move e
move se
move ne
move e
move e
move se
move e
move se
move se
move s
move sw
move s
move sw
move sw
move sw
move s
move se
move se
move s
move se
move s
move e
move se
move s
move se
move e
move go muddy trail
move ne
move ne
move e
move e
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO * * * Capitol of Ilithi and the Elothean nation and home to Elves, governed by an Elothean Ferdahl
ECHO * * * Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO * * * Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered by the Outcasts.
ECHO ===================
ECHO
goto %1

SHARD.RANDOM:
put #goto 135
waitfor YOU HAVE ARRIVED
sha-n:
pause 0.5
move n
move n
move n
move n
move n
pause .5
goto %1

SHA-E:
pause
move e
move e
move e
move e
move e
move n
move n
move n
move n
move n
move n
move n
move n
move nw
move nw
move nw
move nw
move nw
move nw
move w
move w
move w
move w
move w
move w
move w
goto %1

SHA-S:
pause
move go city gate
move e
move e
move ne
move ne
move ne
move n
move n
move nw
move nw
move nw
move w
move w
move go city gate
goto SHA-N

SHA-W:
pause
move w
move w
move w
move w
move go muddy trail
move ne
move ne
move e
move e
goto %1

SHA-STE:
pause
move ne
move nw
move nw
move n
move n
move e
move e
move ne
move e
move e
ECHO
ECHO
ECHO * * * Passing through the Golden Grain Fields north of Shard.
ECHO * * * Over the stile are jackals, boggles, kobolds, and goblins
ECHO 
move n
move go bridle path
move w
ECHO
ECHO ===================
ECHO *** STEELCLAW CLAN
ECHO *** A clan of Elven warriors and barbarians
ECHO ===================
ECHO
goto %1

STE-FAY:
pause
move e
move go dusky path
move ne
move ne
move ne
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Entering the Dragon's Breath Forest
ECHO
move n
move ne
move n
move ne
move n
move ne
move e
move ne
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO *** Inhabited by Wood Elves and Halflings
ECHO *** Home to Marachek's Oak
ECHO ===================
ECHO
goto %1

FAY-GON:
pause
move e
move e
move ne
move go woodland path
move nw
move n
move ne
move go door
move go door frame
goto %1

SHA-GON:
pause
move ne
move nw
move nw
move n
move n
move e
move e
move ne
move e
move e
ECHO
ECHO
ECHO * * * The Golden Grain Fields: jackals, boggles, kobolds, and goblins
ECHO 
move n
move ne
move ne
move ne
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Travelling beside the Jademist River
ECHO * * * Across this bridge is the Darkmist Moor and the Abyss
ECHO
move n
move ne
move ne
move n
ECHO
ECHO
ECHO * * * Entering the Dragon's Breath Forest
ECHO
move n
move ne
move n
move ne
move n
move ne
move e
move ne
ECHO
ECHO ===================
ECHO *** FAYRIN'S REST
ECHO ===================
ECHO
move e
move e
move ne
move go woodland path
move nw
NORTH.SHORTCUT.CHECK:
if $Athletics.Ranks >= 520 then 
{
ECHO
ECHO *** Congratulations!!! 
ECHO *** You have enough Athletics to climb undergondola!  (520+ ranks)
ECHO *** Taking shortcut! 
ECHO 
pause 
goto snundergondola2
}
move n
move ne
move go door
move go door frame
goto %1

SOUTH-PLATFORM:
southgondolacheck:
ECHO *** Southern Gondola Platform
pause .5
if $Athletics.Ranks >= 520 then goto snundergondola
goto 2SOUTH-PLATFORM

2SOUTH-PLATFORM:
pause
matchre WAITONNORTHGONDOLA \[Gondola
matchre WAITFORNORTHGONDOLA There is no wooden
put go gondola
matchwait

WAITFORNORTHGONDOLA:
pause
ECHO
ECHO *** WAITING FOR THE GONDOLA TO ARRIVE ***
ECHO
ECHO * * * If you believe you can take the slower shortcut under the
ECHO * * * gondola (apprxoimately 150 base ranks of climbing) type SHORTCUT1.
ECHO * * * WARNING: Shortcut1 will cause you to end up with a head wound.
ECHO
ECHO * * * If you believe you can take the quick shortcut under the
ECHO * * * gondola (approximately 540 base ranks of Athletics) type SHORTCUT2
ECHO * * * OR If you have a climbing rope you can maybe do it with ~500 Athletics 
ECHO * * * Script will automatically try and get climbing rope
pause 
	matchre GETONNORTHGONDOLA The gondola stops on the platform|^You glance at a weathered
	match WAITFORNORTHGONDOLA YOU HAVE BEEN IDLE
	match snundergondola SHORTCUT2
	match longundergondola SHORTCUT1
     put look;glance gondola
	matchwait 

GETONNORTHGONDOLA:
put stand
pause
move go gondola
goto WAITONNORTHGONDOLA

snundergondola:
pause 0.1
if $Athletics.Ranks < 550 then 
{
put get hemp rope
put uncoil my rope
pause 0.5
}
if $Athletics.Ranks < 550 then 
{
if "%guild" = "Thief" then put khri start focus
pause
pause
}
move go frame
move go door
move sw
move s
snundergondola2:
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

2CLIMB-LOG:
SAVE 2CLIMB-LOG
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	matchre 2FAIL-LOG climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

2FAIL-LOG:
SAVE 2FAIL-LOG
pause
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	matchre 3FAIL-LOG climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

3FAIL-LOG:
SAVE 3FAIL-LOG
pause
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	matchre 4FAIL-LOG climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

4FAIL-LOG:
SAVE 4FAIL-LOG
pause
	match 2CLIMB-EMBANKMENT Willowy branches reach out
	matchre 3CLIMBED-LOG climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	match RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

2CLIMB-EMBANKMENT:
SAVE 2CLIMB-EMBANKMENT
	match 2CLIMBED-EMBANKMENT Utter stillness and the grandiose play of nature
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
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
	matchre 2CLIMB-LEDGE Vegetation creeps in and out
	matchre 2FAIL-WALL climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

2FAIL-WALL:
SAVE 2FAIL-WALL
pause
	matchre 2CLIMB-LEDGE Vegetation creeps in and out
	matchre 3FAIL-WALL climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall
matchwait

3FAIL-WALL:
SAVE 3FAIL-WALL
pause
	matchre 2CLIMB-LEDGE Vegetation creeps in and out
	matchre 4FAIL-WALL climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stone wall 
matchwait

4FAIL-WALL:
SAVE 4FAIL-WALL
pause
	matchre 2CLIMB-LEDGE Vegetation creeps in and out
	matchre FAILED-WALL climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
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
	matchre 3CLIMB-LOG Willowy branches reach out
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre PAUSE \.\.\.wait|type ahead
put climb embankment
matchwait

3CLIMB-LOG:
SAVE 3CLIMB-LOG
	matchre 3CLIMBED-LOG Tamarisk bushes display their feathery
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
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
move go path
move n
move ne
move go door
move go frame
pause
ECHO
ECHO *** You have failed 4 attempts to climb under the gondola.
ECHO *** Maybe you should just wait for the gondola like everyone else?
ECHO
put coil my rope
put stow my rope
pause 0.5
goto 2SOUTH-PLATFORM

2CLIMB-LEDGE:
SAVE 2CLIMB-LEDGE
	matchre 2CLIMB-NICHE The steep climb shows no signs
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb narrow ledge
matchwait

2CLIMB-NICHE:
SAVE 2CLIMB-NICHE
pause
	matchre 2CLIMB-BRANCH A stand of tall trees comes into view
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb craggy niche
matchwait

2CLIMB-BRANCH:
SAVE 2CLIMB-BRANCH
	matchre 2CLIMBED-BRANCH Cracks in the sides of the pass
	matchre PAUSE climb back down|steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb branch
matchwait

2CLIMBED-BRANCH:
pause 0.1
put coil my rope
put stow my rope
wait
pause 0.2
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
	matchre 5CLIMBED-LOG Willowy branches reach out
	matchre 6FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

6FAIL-LOG:
SAVE 6FAIL-LOG
pause
	matchre 5CLIMBED-LOG Willowy branches reach out
	matchre 7FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

7FAIL-LOG:
SAVE 7FAIL-LOG
pause
	matchre 5CLIMBED-LOG Willowy branches reach out
	matchre 8FAIL-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

8FAIL-LOG:
SAVE 8FAIL-LOG
pause
	matchre 5CLIMBED-LOG Willowy branches reach out
	matchre 3CLIMBED-LOG steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb fallen log
matchwait

5CLIMBED-LOG:
move e
goto 5CLIMB-SHELF

5CLIMB-SHELF:
SAVE 5CLIMB-SHELF
	matchre 5CLIMBED-SHELF Clusters of silverwood and spruce trees
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
put climb rock shelf
matchwait

5CLIMBED-SHELF:
move n
goto 5CLIMB-RAMP

5CLIMB-RAMP:
save 5CLIMB-RAMP
	matchre 5CLIMBED-RAMP Any traveler desiring to avoid
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb ramp
matchwait

5CLIMBED-RAMP:
move e
goto 5CLIMB-STEP

5CLIMB-STEP:
SAVE 5CLIMB-STEP
	matchre 5CLIMBED-STEP Clusters of chicory crop up
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|A wave of dizziness hits you|Struck by vertigo|your footing is questionable
	matchre FALLEN slip after a few feet|Stand up first|You must be standing
	matchre RETREAT engaged
	matchre PAUSE \.\.\.wait|type ahead
PUT climb stepping-stones
matchwait

5CLIMBED-STEP:
move n
put go gap
waitfor [Southern Trade Route, Alongside the Forest]
ECHO
ECHO *** You now have a head wound. When you awake from your stun you should eat some nemoih root.
ECHO *** This is a very long stun. Please be patient.
ECHO
pause 40
goto CHECK-STUN

CHECK-STUN:
pause 10
	match CHECK-STUN You're stunned
	match UNSTUNNED You glance
put health
put glanc
matchwait

UNSTUNNED:
ECHO *** YOU'RE NO LONGER STUNNED
save UNDERGONDOLA-LETH
goto FALLEN

WAITONNORTHGONDOLA:
pause
put n
put hide
pause
ECHO
ECHO ================================
ECHO *** Riding north over the great chasm of the Obsidian Pass towards the ancient Elven stronghold of Leth Deriel
ECHO ================================
ECHO
pause 5
ECHO
ECHO ================================
ECHO *** Ferdahl Alec, son of Corik and father to Kukalakai, built the gondola to connect Ilithi to the Mountain Elves.
ECHO *** The Mountain Elves, led by Queen Morganae, were responsible for maintaining the gondola.
ECHO *** However, one day Morganae's only daughter, Princess Anlorahle, was slaughtered on the gondola by a snow beast sent by Necromancer Sidhlot.
ECHO *** Since that day the Mountain Elves have abandoned the gondola, yet it still slowly drifts between the platforms, as if pushed by some ghostly hand.
ECHO ================================
ECHO
pause 5
ECHO
ECHO ================================
ECHO *** North of the gondola is the Province of Zoluren, governed by Prince Vorclaf
ECHO *** Zoluren is named from High Gamgweth "Zohlu Ren", meaning "First Land"
ECHO ================================
ECHO
pause 5
ECHO
ECHO ================================
ECHO *** A little known fact: The gondola only takes 6 roisaen to travel across the chasm, but if a caravan gets on the trip doubles to just over 12 roisaen.
ECHO ================================
ECHO
WAITINGFORNORTH:
put look
pause 
	match GETOFFNORTHGONDOLA With a soft bump, the gondola
	match WAITINGFORNORTH YOU HAVE BEEN IDLE
matchwait

GETOFFNORTHGONDOLA:
put north
move out
ECHO
ECHO *** NORTHERN GONDOLA PLATFORM ***
ECHO
pause .5
goto %1

CRO-TIG:
pause
move nw
move n
move n
move n
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move n
move n
move n
move w
move w
move w
move w
move go Oxenwaithe Bridge
move w
move w
move w
move w
move go western gate
ECHO
ECHO
ECHO * * * Northwesterly lies the Siergelde cliffs and ruins and the Lake of Dreams
ECHO * * * Inhabited by sprites, lipopods, trolls, goblins, cougars, jackals, and bobcats
ECHO
move go path
ECHO
ECHO
ECHO * * * Entering farmlands infested by goblins and hogs
ECHO
move w
move w
move nw
move w
move w
move nw
move w
move w
move sw
move w
move w
move nw
move nw
move w
move go village gate
ECHO
ECHO ===================
ECHO *** TIGER CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Founded and led by Ortug, the peaceful Gor'Tog brother of Trog (leader of Knife Clan)
ECHO * * * Home of TogBall team Tiger Clan Chohmpers
ECHO ===================
ECHO
GOTO %1

TIG-WOL:
pause
move go village gate
move w
move nw
move w
move w
move go shallow brook
move w
ECHO
ECHO
ECHO * * * Entering the Widulf Woods, home to the Wolf and Knife Clans as well as ogres and other forest creatures.
ECHO
pause
move w
pause
move w
move sw
move w
move sw
move s
move s
move e
move go dense bushes
move s
move sw
move s
ECHO
ECHO ===================
ECHO *** WOLF CLAN aka TREFAN ULF
ECHO * * * A clan of Human Barbarians
ECHO * * * Nomadic for centuries, finally settled earlier this century in Widulf Woods
ECHO * * * Led by Chieftan Wolfjaw Ironbeard and his wife Suza Cormyn
ECHO ===================
ECHO
GOTO FINISH

TIG-KNI:
pause
move go village gate
move w
move nw
move w
move w
move go shallow brook
move w
ECHO
ECHO
ECHO * * * Entering the Widulf Woods, home to the Wolf and Knife Clans as well as ogres and other forest creatures.
ECHO
pause
move w
pause
move w
move sw
move w
move nw
move go brambles
move ne
move ne
move n
move ne
move climb felled tree
move nw
move nw
move nw
move down
move e
move ne
move climb tree roots
move n
move ne
move ne
move n
move go wilted bush
move nw
move n
move nw
move go large outcropping
move ne
move ne
move ne
move nw
move nw
move n
move nw
move go half-open gate
move w
move nw
move n
move go rope bridge
move n
ECHO
ECHO ===================
ECHO *** KNIFE CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Led by Trog, the stupid and aggressive Gor'tog brother of Ortug (leader of Tiger Clan)
ECHO * * * Patron god is Botolf the goshawk, dark aspect of Chadatru, god of dishonesty and deceipt and patron of thieves guilds and fallen paladins.
ECHO ===================
ECHO
GOTO FINISH

WOL-TIG:
pause
move n
move ne
move n
move go dense bushes
move w
move n
move n
move ne
move e
move ne
move e
move go shallow brook
move e
pause
move e
pause
move e
move e
move se
move e
move go village gate
ECHO
ECHO ===================
ECHO *** TIGER CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Founded and led by Ortug, the peaceful Gor'Tog brother of Trog (leader of Knife Clan)
ECHO * * * Home of TogBall team Tiger Clan Chohmpers
ECHO ===================
ECHO
GOTO %1

KNI-TIG:
pause
move go rope bridge
move s
move s
move se
move e
move go half-open gate
move se
move s
move se
move se
move sw
move sw
move sw
move go large outcropping
move se
move s
move se
move go wilted bush
move s
move sw
move sw
move s
move climb tree roots
move sw
move w
move up
move se
move se
move se
move climb felled tree
move sw
move s
move sw
move go bramble patch
move s
move se
move e
move ne
move e
move go shallow brook
move e
pause
move e
pause
move e
move e
move se
move e
move go village gate
ECHO
ECHO ===================
ECHO *** TIGER CLAN
ECHO * * * A clan of Gor'Togs
ECHO * * * Founded and led by Ortug, the peaceful Gor'Tog brother of Trog (leader of Knife Clan)
ECHO * * * Home of TogBall team Tiger Clan Chohmpers
ECHO ===================
ECHO 
GOTO %1

TIG-CRO:
ECHO
ECHO
ECHO * * * Entering meadows and farmlands infested with goblins and hogs
ECHO 
pause
move go gate
move e
move se
move se
move e
move e
move ne
move e
move e
move se
move e
move e
move se
move e
move e
move go path
ECHO
ECHO
ECHO * * * Northwesterly lies the Siergelde cliffs and ruins and the Lake of Dreams
ECHO * * * Inhabited by sprites, lipopods, trolls, goblins, cougars, jackals, and bobcats
ECHO
move go gate
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
move s
ECHO
ECHO * * * The Crossing Pond, Headquarters of The Locksmith Union
ECHO
move s
move s
move s
move se
ECHO
ECHO ===================
ECHO *** THE CROSSING aka River Crossing
ECHO * * * The geographic center of the former Seven-Pointed Star Empire
ECHO * * * A port city, home to all 9 guildhalls and the Asemath Academy
ECHO ===================
ECHO
GOTO %1

tig-leth:
move s
move se
move s
move sw
move go green
move sw

tig-leth2:
match tig-leth2 You don't find anything of interest here.
match tig-leth2 You find some interesting signs something is here.
match tig-leth3 You find a very faint trail through the grass.
put search
matchwait

tig-leth3:
move go trail
move se
move climb trail

seg-south1:
match seg-let You wade
match current [Segoltha River, North Bank
match current You can't swim
match seg-south1 You swim
match seg-south1 You slap
match seg-south1 You struggle
match seg-south1 You flounder
match seg-south1 make much headway
match seg-south1 ...wait
match seg-south1 type ahead
put swim south 
matchwait


current:
put swim west
waitfor Roundtime
goto seg-south1

seg-let:
move e
move e
move e
move e
move e
move go trail
move n
goto %1

THE-ELB:
ECHO
ECHO
ECHO * * * Travelling by the farmlands, orchards, and country cottages of the beautiful Therengian countryside
ECHO 
pause
move s
move se
move sw
move sw
move s
move s
move w
move sw
move s
move sw
ECHO
ECHO
ECHO * * * Passing by the Mistwood Forest, home to Rossman's Landing
ECHO * * * Also in the forest are orcs, warcats, peccaries, and sky giants
ECHO
move sw
move sw
move se
move sw
move sw
move s
move s
move sw
move s
move s
move w
move sw
move se
move sw
move s
move s
move sw
move s
move se
move s
ECHO
ECHO
ECHO * * * Entering the Dunshade Moors
ECHO * * * Former territory of the House Dunshade before its disbanding
ECHO
move s
move sw
move sw
move s
move se
move s
move s
move se
move e
move s
move e
move go small path
ECHO
ECHO
ECHO *** EL'BAIN'S ***
ECHO
GOTO FINISH

LAN-ELB:
pause
move nw
move n
move n
move n
move nw
move ne
move n
move nw
move n
move n
move n
move go stone bridge
ECHO
ECHO
ECHO * * * Crossing the Gwenalion River on a white stone bridge
ECHO 
move n
move n
move go northern shore
ECHO
ECHO
ECHO * * * Entering the Danduwen Forest
ECHO
move n
move nw
move n
move nw
move ne
move nw
move n
move n
ECHO
ECHO
ECHO * * * Beyond the eucalyptus tree are kelpies, wood trolls, and cougars
ECHO 
move ne
move nw
move e
move go small path
ECHO
ECHO
ECHO *** EL'BAIN'S ***
ECHO
GOTO FINISH

ELB-THE:
move go main road
move w
move n
move w
move nw
move n
move n
move nw
move n
move ne
move ne
move n
move n
move nw
move n
move ne
move n
move n
move ne
move nw
move ne
move e
move n
move n
move ne
move n
move n
move ne
move ne
move nw
move ne
move ne
move ne
move n
move ne
move e
move n
move n
move ne
move ne
move nw
move n
ECHO
ECHO ===================
ECHO *** THERENBOROUGH
ECHO * * * Protected by Theren Keep
ECHO * * * Governed by the Baron of House Theren, to which all other Therengian lords kneel
ECHO * * * Patron god is Rutilor the mongoose, positive aspect of Chadatru,
ECHO * * * god of truth and justice and patron of paladins and House Theren
ECHO ===================
ECHO
GOTO %1

GETLETHDOKORA:
pause
	matchre LET-ILA I don't know who you are referring to|LET-ILA But no one can see you.
	matchre GETLETHDOK2 But you don't have that much|You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GETLETHDOK2:
pause
move e
move e
move go deposit
move u
put withdraw 3 silver
pause
move up
put exchange 3 silver kronar to dokora
pause
move d
move d
move out
move w
move w
goto LET-ILA

LET-ILA:
groupcheck-LET-ILA:
	matchre cont-LET-ILA You have no group|You must be visible
	match group-LET-ILA You whisper
	matchre groupcheck-LET-ILA \.\.\.wait|type ahead
put whisper group ...
matchwait

cont-LET-ILA:
pause 0.1
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move go bower gate
move sw
move nw
move nw
move n
pause 4
01-LET-ILA:
	match 02-LET-ILA Roundtime
	match 03-LET-ILA [Old Crank's Road, Field]
put nw
matchwait
02-LET-ILA:
pause
	matchre 01-LET-ILA You stand|You are already
	matchre 02-LET-ILA cannot manage to stand|The weight of all your possessions
	matchre 02-LET-ILA \.\.\.wait|type ahead
put stand
matchwait
03-LET-ILA:
move n
move sw
move sw
move sw
move sw
move s
move s
move s
move s
move se
04-LET-ILA:
pause
	match 05-LET-ILA filtering through the branches
	matchre Dig04-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
	matchre Dig04-LET-ILA stuck in the mud|You fall into|You can't do that while lying down.
put sw
matchwait

Dig04-LET-ILA:
pause
	match 04-LET-ILA You manage to dig
	matchre Dig04-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig04-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

05-LET-ILA:
pause
	match 06-LET-ILA Thick planks of wood
	matchre Dig05-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
	matchre Dig05-LET-ILA stuck in the mud|You fall into|You can't do that while lying down
put s
matchwait

Dig05-LET-ILA:
pause
	match 05-LET-ILA You manage to dig
	matchre Dig05-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig05-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

06-LET-ILA:
pause
	match 07-LET-ILA Mud and water make sucking sounds
	matchre Dig06-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put s
matchwait

Dig06-LET-ILA:
pause
	match 06-LET-ILA You manage to dig
	matchre Dig06-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig06-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

07-LET-ILA:
pause
	match 08-LET-ILA The dark soil is damper to the north
	matchre Dig07-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put s
matchwait

Dig07-LET-ILA:
pause
	match 07-LET-ILA You manage to dig
	matchre Dig07-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig07-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

08-LET-ILA:
pause
move sw
move w
move w
move s
move sw
move sw

09-LET-ILA:
pause
	match 10-LET-ILA large puddles of muck
	matchre Dig09-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down.
put w
matchwait

Dig09-LET-ILA:
pause
	match 09-LET-ILA You manage to dig
	matchre Dig09-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig09-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

10-LET-ILA:
pause
	match 11-LET-ILA grasses lining the
	matchre Dig10-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put w
matchwait

Dig10-LET-ILA:
pause
	match 10-LET-ILA You manage to dig
	matchre Dig10-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig10-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

11-LET-ILA:
pause
move nw
move go break
ECHO
ECHO ===================
ECHO *** ILAYA TAIPA aka River Clan
ECHO *** The settlement of River Elves
ECHO *** Features are the harbor, skiffs to Ain Ghazal, a fish shop, a pearl shop
ECHO *** Area creatures include storm bulls and forest bandits
ECHO ===================
ECHO
goto checkmites

group-LET-ILA:
pause
move sw
move sw
move sw
move sw
move sw
move sw
move sw
move go bower gate
move sw
move nw
move nw
move n
pause 4
group-01-LET-ILA:
put nw
	match group-02-LET-ILA Roundtime
	match group-03-LET-ILA [Old Crank's Road, Field]
matchwait
group-02-LET-ILA:
pause
	matchre group-01-LET-ILA You stand|You are already
	matchre group-02-LET-ILA cannot manage to stand|The weight of all your possessions
	matchre group-02-LET-ILA \.\.\.wait|type ahead
put stand
matchwait
group-03-LET-ILA:
move n
move sw
move sw
move sw
move sw
move s
move s
move s
move s
move se
put WHISPER GROUP We're passing through swamps.  From here SW, S, S, S and join me again.  If you fall then DIG your way out.
put disband
group-04-LET-ILA:
pause
	match group-05-LET-ILA wind filtering through the branches sings
	matchre group-Dig04-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down.
put sw
matchwait

group-Dig04-LET-ILA:
pause
	match group-04-LET-ILA You manage to dig
	matchre group-Dig04-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig04-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-05-LET-ILA:
pause
	match group-06-LET-ILA Thick planks of wood
	matchre group-Dig05-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put s
matchwait

group-Dig05-LET-ILA:
pause
	match group-05-LET-ILA You manage to dig
	matchre group-Dig05-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig05-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-06-LET-ILA:
pause
	match group-07-LET-ILA Mud and water make sucking sounds
	matchre group-Dig06-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down.
put s
matchwait

group-Dig06-LET-ILA:
pause
	match group-06-LET-ILA You manage to dig
	matchre group-Dig06-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig06-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-07-LET-ILA:
pause
	match group-08-LET-ILA The dark soil is damper to the north
	matchre group-Dig07-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put s
matchwait

group-Dig07-LET-ILA:
pause
	match group-07-LET-ILA You manage to dig
	matchre group-Dig07-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig07-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-08-LET-ILA:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move sw
move w
move w
move s
move sw
move sw
put WHISPER GROUP We're passing through more swamps.  From here go W, W and join me again.  If you fall then DIG your way out.
put disband

group-09-LET-ILA:
pause
	match group-10-LET-ILA large puddles of muck
	matchre group-Dig09-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down.
put w
matchwait

group-Dig09-LET-ILA:
pause
	match group-09-LET-ILA You manage to dig
	matchre group-Dig09-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig09-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-10-LET-ILA:
pause
	match group-11-LET-ILA grasses lining the
	matchre group-Dig10-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down.
put w
matchwait

group-Dig10-LET-ILA:
pause
	match group-10-LET-ILA You manage to dig
	matchre group-Dig10-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig10-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-11-LET-ILA:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move nw
move go break
ECHO
ECHO ===================
ECHO *** ILAYA TAIPA aka River Clan
ECHO *** The settlement of River Elves
ECHO *** Features are the harbor, skiffs to Ain Ghazal, a fish shop, a pearl shop
ECHO *** Area creatures include storm bulls and forest bandits
ECHO ===================
ECHO
goto checkmites

CHECKMITES:
ECHO
ECHO *** Checking now for blood mites from the swamp
ECHO
pause
	match GOTMITES blood mite
	match NOMITES You glance
put health;glance
matchwait

NOMITES:
ECHO
ECHO *** You have no blood mites on you right now, but they could show up in the next couple minutes.
ECHO *** If you get them on your eyes do not tend them off with less than 150 first aid.
ECHO
pause
goto %1

GOTMITES:
ECHO
ECHO ****************************
ECHO *** You acquired blood mites in the marsh!
ECHO *** Tend them off, but don't tend the eyes unless you have 150 first aid
ECHO ****************************
pause 3
goto %1

ILA-LET:
groupcheck-ILA-LET:
	matchre cont-ILA-LET You have no group|You must be visible
	match group-ILA-LET You whisper
	matchre groupcheck-ILA-LET \.\.\.wait|type ahead
put whisper group ...
matchwait

cont-ILA-LET:
pause
move go break
move se
move e

20-LET-ILA:
pause
	match 21-LET-ILA the trees and thorny bushes,
	matchre Dig20-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put e
matchwait

Dig20-LET-ILA:
pause
	match 20-LET-ILA You manage to dig
	matchre Dig20-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig20-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

21-LET-ILA:
pause
	match 22-LET-ILA fragrant tang
	matchre Dig21-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put ne
matchwait

Dig21-LET-ILA:
pause
	match 21-LET-ILA You manage to dig
	matchre Dig21-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig21-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

22-LET-ILA:
pause
move ne
move n
move e
move e
move ne
move n
goto 23-LET-ILA

23-LET-ILA:
pause
	match 24-LET-ILA Thick planks of wood
	matchre Dig23-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put n
matchwait

Dig23-LET-ILA:
pause
	match 23-LET-ILA You manage to dig
	matchre Dig23-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig23-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

24-LET-ILA:
pause
	match 25-LET-ILA filtering through the branches
	matchre Dig24-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put n
matchwait

Dig24-LET-ILA:
pause
	match 24-LET-ILA You manage to dig
	matchre Dig24-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig24-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

25-LET-ILA:
pause
	match 26-LET-ILA Sloping downward to the southwest,
	matchre Dig25-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put ne
matchwait

Dig25-LET-ILA:
pause
	match 25-LET-ILA You manage to dig
	matchre Dig25-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig25-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

26-LET-ILA:
pause
	match 27-LET-ILA a sparse forest.
	matchre Dig26-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put nw
matchwait

Dig26-LET-ILA:
pause
	match 26-LET-ILA You manage to dig
	matchre Dig26-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre Dig26-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

27-LET-ILA:
pause
move n
move n
move n
move n
move ne
move ne
move ne
move ne
move s
move se
pause 4
28-LET-ILA:
	match 29-LET-ILA Roundtime
	match 30-LET-ILA The carter's track winds northward,
put s
matchwait
29-LET-ILA:
pause
	matchre 28-LET-ILA You stand|You are already
	matchre 29-LET-ILA cannot manage to stand|The weight of all your possessions
	matchre 29-LET-ILA \.\.\.wait|type ahead
put stand
matchwait

30-LET-ILA:
pause
move se
move se
move ne
move go bower gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
goto checkmites

group-ILA-LET:
move go break
move se
move e
pause
put WHISPER GROUP We're passing through swamps.  From here go E, NE and join me again.  If you fall then DIG your way out.
put disband
group-20-LET-ILA:
pause
	match group-21-LET-ILA the trees and thorny bushes,
	matchre group-Dig20-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put e
matchwait

group-Dig20-LET-ILA:
pause
	match group-20-LET-ILA You manage to dig
	matchre group-Dig20-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig20-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-21-LET-ILA:
pause
	match group-22-LET-ILA fragrant tang
	matchre group-Dig21-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put ne
matchwait

group-Dig21-LET-ILA:
pause
	match group-21-LET-ILA You manage to dig
	matchre group-Dig21-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig21-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-22-LET-ILA:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move ne
move n
move e
move e
move ne
move n
pause
put WHISPER GROUP We're passing through more swamps.  From here go N, N, NE, NW and join me again.  If you fall then DIG your way out.
put disband

group-23-LET-ILA:
pause
	match group-24-LET-ILA Thick planks of wood
	matchre group-Dig23-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put n
matchwait

group-Dig23-LET-ILA:
pause
	match group-23-LET-ILA You manage to dig
	matchre group-Dig23-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig23-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-24-LET-ILA:
pause
	match group-25-LET-ILA filtering through the branches
	matchre group-Dig24-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put n
matchwait

group-Dig24-LET-ILA:
pause
	match group-24-LET-ILA You manage to dig
	matchre group-Dig24-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig24-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-25-LET-ILA:
pause
	match group-26-LET-ILA Sloping downward to the southwest,
	matchre group-Dig25-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put ne
matchwait

group-Dig25-LET-ILA:
pause
	match group-25-LET-ILA You manage to dig
	matchre group-Dig25-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig25-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-26-LET-ILA:
pause
	match group-27-LET-ILA a sparse forest.
	matchre group-Dig26-LET-ILA falling short of your goal|You make no progress in the mud|The mud holds you|stuck in the mud|You fall into|You can't do that while lying down
put nw
matchwait

group-Dig26-LET-ILA:
pause
	match group-26-LET-ILA You manage to dig
	matchre group-Dig26-LET-ILA You struggle to dig|Maybe you can reach better|cannot manage to stand|The weight of all your possessions
	matchre group-Dig26-LET-ILA \.\.\.wait|type ahead
put stand;dig
matchwait

group-27-LET-ILA:
pause
ECHO
ECHO *** Wait for your group to catch up. Once they are joined type GLANCE to continue.
ECHO
waitfor You glance
move n
move n
move n
move n
move ne
move ne
move ne
move ne
move s
move se
pause 4
group-28-LET-ILA:
put s
	match group-29-LET-ILA Roundtime
	match group-30-LET-ILA The carter's track winds northward,
matchwait
group-29-LET-ILA:
pause
	matchre group-28-LET-ILA You stand|You are already
	matchre group-29-LET-ILA cannot manage to stand|The weight of all your possessions
	matchre group-29-LET-ILA \.\.\.wait|type ahead
put stand
matchwait

group-30-LET-ILA:
pause
move se
move se
move ne
move go bower gate
move ne
move ne
move ne
move ne
move ne
move ne
move ne
goto checkmites


ILA-AIN:
pause
move go southwest gate
move nw
move nw
move n
move n
move ne
move go harbor tower
move go stone ramp
move climb iron staircase
move ne
move ne
move ne
move ne
move climb iron staircase
move go stone ramp
move out
move ne
move go oak doors
SKIFF1:
pause
	matchre WAITFORSKIFF1 You will be able to board soon|What were you referring to|You will have to wait for the next skiff|I could not find what you were referring to.
	match WAITONSKIFF1 Skiff]
	match INV-SKIFF1 they can't see you?
	match NOMONEYSKIFF1 You haven't got enough dokoras
put go skiff
matchwait

INV-SKIFF1:
pause
ECHO
ECHO *** You cannot board the skiff while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto SKIFF1

WAITFORSKIFF1:
ECHO
ECHO *****************************
ECHO *** WAITING FOR THE SKIFF TO ARRIVE
ECHO *** The fare is 58 Dokoras and you cannot withdraw from the bank in Ilaya Taipa.
ECHO *** There is a gem buyer and tanner in the building with the bank and you can convert Kronars to Dokoras at the COUNTER in the bank.
ECHO *****************************
ECHO
ECHO
ECHO *****************************
ECHO *** GO GET 58 DOKORAS NOW!!!
ECHO *** (if you don't already have them)
ECHO *****************************
ECHO
put wealth dokora
waitfor pulls into the
goto SKIFF1

NOMONEYSKIFF1:
ECHO
ECHO *** You do not have enough Dokoras for the skiff.
ECHO *** The fare is 58 Dokoras and you cannot withdraw from the bank in Ilaya Taipa.
ECHO *** There is a gem buyer and tanner in the building with the bank and you can convert Kronars to Dokoras at the COUNTER in the bank.
ECHO
ECHO *** Good Luck!
ECHO
EXIT

WAITONSKIFF1:
pause
ECHO
ECHO *** Riding a River Elf skiff up the mighty Segoltha River to Ain Ghazal, built on a towering rock in the middle of the Segoltha River
ECHO *** The Journelai Mountains loom to the north while the Himineldar Shel Mountains shade the south
ECHO 
ECHO *** Skiff stays docked for 2 minutes, ride is 7 minutes long
pause 30
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 1
ECHO
ECHO * * * Ain Ghazal is ruled by the Sisterhood of the Rose
ECHO * * * The leader of the Sisters is called the Lyba Khalo
ECHO * * * The Ain Ghazal chateau holds the chamber where there are meetings of the provincial government, called the Forfedhdar Enclave
ECHO ====================================
ECHO
pause 100
put exp
pause 100
put exp
pause 100
ECHO
ECHO *** Entering the Dwarven province of Forfedhdar
ECHO *** "Forfedhdar" is Haakish for "The Land of the Ancestors"
ECHO * * * Governed by the Forfedhdar Enclave, made up of the leaders of each settlement
ECHO
waitfor The skiff lightly taps the dock
put stand
pause
move go dock
ECHO
ECHO ===================
ECHO *** AIN GHAZAL
ECHO *** Far into the sky is the castle chateau upon the towering Ain Ghazal rock in the middle of the Segoltha
ECHO *** The only creatures to hunt are cave trolls, a bit tougher than orcs
ECHO *** Features include a makeup shop, locksmith shop, Trader guild, and deposit-only and exchange bank
ECHO ===================
ECHO
goto %1

AIN-ILA:
SKIFF2:
pause
	matchre WAITFORSKIFF2 You will be able to board soon|What were you referring to|You will have to wait for the next skiff|I could not find what you were referring to
	match WAITONSKIFF2 Skiff]
	match INV-SKIFF2 they can't see you?
	match NOMONEYSKIFF2 You haven't got enough dokoras
put go skiff
matchwait

INV-SKIFF2:
pause
ECHO
ECHO *** You cannot board the skiff while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
pause
waitfor You glance
goto SKIFF2


WAITFORSKIFF2:
ECHO
ECHO *****************************
ECHO *** WAITING FOR THE SKIFF TO ARRIVE
ECHO *** The fare is 58 Dokoras!
ECHO *****************************
ECHO
put wealth dokora
waitfor pulls into the
goto SKIFF2

NOMONEYSKIFF2:
ECHO
ECHO *** You do not have enough Dokoras for the skiff.
ECHO *** Good Luck finding 58 Dokoras!
ECHO
EXIT

WAITONSKIFF2:
pause
ECHO
ECHO *** Riding a River Elf skiff east down the mighty Segoltha River to Ilaya Taipa aka River Clan
ECHO *** The Journelai Mountains loom to the north while the Himineldar Shel Mountains shade the south
ECHO
ECHO *** Skiff stays docked for 2 minutes, Ride is 7 minutes long
pause 200
put exp
pause 100
ECHO *** Entering the Province of Zoluren
ECHO *** Governed by Prince Vorclaf
ECHO *** Named from High Gamgweth "Zohlu Ren", meaning "First Land"
ECHO
waitfor The skiff lightly taps the dock
put stand
pause
move go dock
SKIFF-ILA:
pause
move go oak doors
move sw
move go harbor tower
move go stone ramp
move climb iron staircase
move sw
move sw
move sw
move sw
move climb iron staircase
move go stone ramp
move out
move sw
move s
move s
move se
move se
move go southwest gate
ECHO
ECHO ===================
ECHO *** ILAYA TAIPA aka River Clan
ECHO *** The settlement of River Elves
ECHO ===================
ECHO
goto %1

AIN-FORF:
pause
move w
move sw
pause
move s
goto AINFERRY1

AINFERRY1:
pause
	matchre WAITFORAINFERRY1 you'll have to wait|you can board as soon as|cannot take any more passengers|What were you referring to|I could not find what you were referring to
	matchre WAITONAINFERRY1 The Damaris's Kiss|The Evening Star|You hand him
	match NOMONEYAINFERRY1 You haven't got enough dokoras
	match INV-AINFERRY1 they can't see you?
put go ferry
matchwait

INV-AINFERRY1:
pause
ECHO
ECHO *** You cannot board this ferry while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
ECHO *** Warning: Don't go invisible on the ferry either because you cannot leave these ferries while invisible.
ECHO
put khri stop
pause
put glance
waitfor You glance
goto AINFERRY1

WAITFORAINFERRY1:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO *** The fare is 31 Dokoras
ECHO
put wealth dokora
waitfor landing at the dock
goto AINFERRY1

NOMONEYAINFERRY1:
ECHO
ECHO *** You do not have enough Dokoras for the ferry
ECHO *** Good luck finding 31 Dokoras around here!
ECHO
EXIT

WAITONAINFERRY1:
pause
ECHO
ECHO ***
ECHO *** Riding a ferry towards the Haalikshal Highway to Hibarnhvidar
ECHO *** Haalikshal translates to "sacred mountain"
ECHO *** The highway is lined with Dwarven totem pillars that each tell the life of a Dwarf.
ECHO *** 
ECHO
pause
waitforre You come to a very soft stop as the ferry reaches the dock
put stand
pause
move go dock
AINFERRY1-FORF:
ECHO
ECHO *** Entering the well-paved Haalikshal Highway
ECHO
move w
move sw
move sw
move nw
move sw
move sw
goto %1

FORF-AIN:
pause
move ne
move ne
move se
move ne
move ne
move e
goto AINFERRY2

AINFERRY2:
pause
	matchre WAITFORAINFERRY2 you'll have to wait|you can board as soon as|cannot take any more passengers|What were you referring to|I could not find what you were referring to
	matchre WAITONAINFERRY2 The Damaris's Kiss|The Evening Star|You hand him 
	match NOMONEYAINFERRY2 You haven't got enough dokoras
	match INV-AINFERRY2 they can't see you?
put go ferry
matchwait

INV-AINFERRY2:
pause
ECHO
ECHO *** You cannot board this ferry while invisible.  Drop your invisibility and type GLANCE when you are ready to continue.
ECHO
ECHO *** Warning: Don't go invisible on the ferry either because you cannot leave these ferries while invisible.
ECHO
put khri stop
pause
put glance
waitfor You glance
goto AINFERRY2

WAITFORAINFERRY2:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO *** The fare is 31 Dokoras
ECHO
put wealth dokora
waitfor landing at the dock
goto AINFERRY2

NOMONEYAINFERRY2:
ECHO
ECHO *** You do not have enough Dokoras for the ferry to Ain Ghazal
ECHO *** Good luck finding 31 Dokoras around here!
ECHO
EXIT

WAITONAINFERRY2:
pause
ECHO
ECHO ***
ECHO *** Riding a ferry towards Ain Ghazal, built on a towering rock in the middle of the Segoltha River
ECHO *** 
ECHO
pause 15
ECHO
ECHO ====================================
ECHO *** Common Knowledge: 1 of 1
ECHO
ECHO * * * Ain Ghazal is ruled by the Sisterhood of the Rose
ECHO * * * The leader of the Sisters is called the Lyba Khalo
ECHO * * * The Ain Ghazal chateau holds the chamber where there are meetings of the provincial government, called the Forfedhdar Enclave
ECHO ====================================
ECHO
waitforre You come to a very soft stop as the ferry reaches the dock
put stand
pause
move go dock
AINFERRY-AIN:
pause
move n
move ne
pause
move e
ECHO
ECHO ===================
ECHO *** AIN GHAZAL
ECHO *** Far into the sky is the castle chateau upon the towering Ain Ghazal rock in the middle of the Segoltha
ECHO *** The only creatures to hunt are cave trolls, a bit tougher than orcs
ECHO *** Features include a makeup shop, locksmith shop, Trader guild, and deposit-only and exchange bank
ECHO ===================
ECHO
goto %1

FORF-HIB:
move nw
move sw
move go gates
ECHO
ECHO * * * Traveling beneath the mountains
ECHO
move sw
move se
move sw
move w
move s
move w
move w
move w
move w
move w
move go gates
move go ford
ECHO
ECHO * * * Ascending the Sky Road, climbing high into the Himineldar Shel mountains
ECHO
move nw
pause 3
pause
move nw
move nw
move ne
move ne
move w
move nw
move nw
move nw
move go gate
move go west gate
move sw
move sw
move n
move sw
move w
move w
move w
move go raven gate
ECHO
ECHO * * * Entering the wintry city of Hibarnhvidar
ECHO
pause
move w
move w
move w
move s
move se
move se
move se
move go double gate
ECHO
ECHO ===================
ECHO *** HIBARNHVIDAR
ECHO * * * Dwarven city in the soaring Himineldar Shel Mountains
ECHO * * * Home of the famous power-generating waterwheel system
ECHO * * * Captain Grutan of the Hibarnhvidar Guard leads the city's defense
ECHO ===================
ECHO
goto %1

HIBFINISH:
ECHO
ECHO ================================
ECHO * * * Outer Hibarnhvidar: GO STONE GATE
ECHO * * * Inner Hibarnhvidar: GO IRON GATE
ECHO ================================
ECHO
ECHO
goto FINISH

GetHibDokora:
pause
	matchre HIB-FORF I don't know who you are referring to|But no one can see you
	matchre GetHibDok2 But you don't have that much|You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GetHibDok2:
move go iron gate
move sw
move s
move go arch
move nw
put withdraw 2 silver
move se
move go arch
move n
move ne
move go arch
goto HIB-FORF

HIB-FORF:
move go stone gate
move nw
move nw
move nw
move n
move e
move e
move e
move go raven gate
move e
move e
move e
move ne
move s
move ne
move ne
move go gate
move go east gate
ECHO
ECHO * * * Descending via the Sky Road from high atop the Himineldar Shel mountains
ECHO
move se
move se
move se
move e
move sw
move sw
move se
move se
move go ford
move e
ECHO
ECHO * * * Entering the road beneath the mountain
ECHO
pause 3
pause
move go gates
move e
move e
move e
move e
move e
move n
move e
move ne
move nw
move ne
move go gates
move ne
move se
goto %1

HIB-BOA:
BURDENCHECK12:
matchre BURDENCHECK12A None|Light
match BURDENCHECK12B Encumbrance : Somewhat
match BURDENCHECK12C Encumbrance : Burdened
match BURDENCHECK12D Encumbrance : Heavy
match BURDENCHECK12E Encumbrance : Very Heavy
match BURDENCHECK12F Overburdened
match BURDENCHECK12G Encumbrance : Tottering
match BURDENCHECK12H even able to move?
match BURDENCHECK12I amazing you aren't squashed!
match BURDENCHECK12 ...wait
match BURDENCHECK12 type ahead
put info
matchwait

BURDENCHECK12A:
if $Athletics.Ranks >= 20 then goto cont-HIB-BOA
goto STRENGTHCHECK12

STRENGTHCHECK12:
	matchre cantswim12 \(5\)|\(6\)|\(7\)|\(8\)|\(9\)|\(10\)|\(11\)|\(12\)|\(13\)|\(14\)|\(15\)
	matchre cont-HIB-BOA \(16\)|\(17\)|\(18\)|\(19\)|\(2|\(3|\(4|\(5|\(6|\(7|\(99\)
put strength
matchwait

BURDENCHECK12B:
if $Athletics.Ranks >= 50 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12C:
if $Athletics.Ranks >= 90 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12D:
if $Athletics.Ranks >= 130 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12E:
if $Athletics.Ranks >= 170 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12F:
if $Athletics.Ranks >= 210 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12G:
if $Athletics.Ranks >= 250 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12H:
if $Athletics.Ranks >= 290 then goto cont-HIB-BOA
goto OVERBURDENED12

BURDENCHECK12I:
if $Athletics.Ranks >= 330 then goto cont-HIB-BOA
goto OVERBURDENED12

OVERBURDENED12:
ECHO
ECHO *** You do not have enough swimming with your current burden to pass through Archer's Ford to Boar Clan.  Lose some weight and try again!
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormally high strength or spells, then you can continue on to Boar Clan by typing GLANCE now.
ECHO
	match cont-HIB-BOA You glance
matchwait

CANTSWIM12:
ECHO
ECHO *** You do not have enough swimming (20) or Strength (16) to pass through Archer's Ford to Boar Clan.  Find someone to drag you or cast some swimming spells.
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormaly high strength or spells, then you can continue on to Boar Clan by typing GLANCE now.  If you can make it to Boar Clan and back to Hibarnhvidar let me know what your swimming and strength are (kraelyst@hotmail.com)!
ECHO
	match cont-HIB-BOA You glance
	match cont-HIB-BOA You glance
matchwait

cont-HIB-BOA:
move go stone gate
move nw
move nw
move nw
move n
move w
move w
move nw
move w
move w
move w
move w
move w
move w
move go northwest gate
move n
move n
move n
move n
move n
move n
move n
move n
move nw
move nw
move n
move n
move n
move nw
move nw
move n
move n
move n
move ne
move ne
move n
move n
move ne
move nw
move n
move ne
move n
move ne
move ne
move ne
move nw
move nw
move nw
move n
move ne
move n
move nw
move n
move nw
ECHO
ECHO * * * Now wading across Archer's Ford in the Biiskbowr River, which flows from the Journelai Mountains to Sawstwar Lake.
ECHO
#HIB-BOA-groupcheck:
#	matchre HIB-BOA-nogroup You have no group|You must be visible
#	match HIB-BOA-group You whisper
#put whisper group ...
#matchwait

HIB-BOA-nogroup:
save swim-HIB-BOA2
goto swim-HIB-BOA1

HIB-BOA-group:
save HIB-BOA-cont-group
pause
put say If we get separated in the ford go as far NW as you can, don't go north. I will meet you on the other side of the ford.
goto swim-HIB-BOA1

swim-HIB-BOA1:
pause
	matchre %s The evergreens begin to close in again|You can't go there
	matchre swim-HIB-BOA1 Obvious|but can't get anywhere|can't seem to make much headway
	matchre swim-HIB-BOA1 \.\.\.wait|type ahead
put nw
matchwait

HIB-BOA-cont-group:
pause
ECHO
ECHO *** When your group arrives from the ford, rejoin and then type GLANCE to continue.  Make sure their roundtime is done.
ECHO
waitfor You glance
swim-HIB-BOA2:
pause
move n
move nw
move w
move w
move w
move nw
move w
move w
move nw
move n
move n
move n
move n
move n
move n
climb-HIB-BOA1:
save climb-HIB-BOA1
	match climb-HIB-BOA3 The roadway cuts its way
	matchre climb-HIB-BOA2 slip after a few feet|You must be standing|Stand up first.
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going.|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb log stair
matchwait

climb-HIB-BOA2:
pause
	matchre climb-HIB-BOA1 You stand|You are already standing
	match climb-HIB-BOA2 cannot manage to stand.
	matchre climb-HIB-BOA2 \.\.\.wait|type ahead
put stand
matchwait

climb-HIB-BOA3:
move nw
move nw
move nw
move nw
move nw
move go stone bridge
move nw
move ne
move w
ECHO
ECHO ===================
ECHO *** BOAR CLAN
ECHO *** A Gor'Tog settlement on the banks of the Liirewsag River
ECHO *** Patron god is Everild, the boar
ECHO *** Features are the Ranger Guild, Togball Field, Everild favor alter, leather repair, and reflex training
ECHO *** Boar Clan is governed by Ranger Guildleader, currently Paglar
ECHO ===================
ECHO
goto %1

BOA-HIB:
BURDENCHECK13:
matchre BURDENCHECK13A None|Light
match BURDENCHECK13B Encumbrance : Somewhat
match BURDENCHECK13C Encumbrance : Burdened
match BURDENCHECK13D Encumbrance : Heavy
match BURDENCHECK13E Encumbrance : Very Heavy
match BURDENCHECK13F Overburdened
match BURDENCHECK13G Encumbrance : Tottering
match BURDENCHECK13H even able to move?
match BURDENCHECK13I amazing you aren't squashed!
match BURDENCHECK13 ...wait
match BURDENCHECK13 type ahead
put info
matchwait

BURDENCHECK13A:
if $Athletics.Ranks >= 20 then goto CONT-BOA-HIB
goto STRENGTHCHECK13

STRENGTHCHECK13:
	matchre cantswim13 \(5\)|\(6\)|\(7\)|\(8\)|\(9\)|\(10\)|\(11\)|\(12\)|\(13\)|\(14\)|\(15\)
	matchre CONT-BOA-HIB \(16\)|\(17\)|\(18\)|\(19\)|\(2|\(3|\(4|\(5|\(6|\(7|\(99\)
put strength
matchwait

BURDENCHECK13B:
if $Athletics.Ranks >= 50 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13C:
if $Athletics.Ranks >= 90 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13D:
if $Athletics.Ranks >= 130 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13E:
if $Athletics.Ranks >= 170 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13F:
if $Athletics.Ranks >= 210 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13G:
if $Athletics.Ranks >= 250 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13H:
if $Athletics.Ranks >= 290 then goto CONT-BOA-HIB
goto OVERBURDENED13

BURDENCHECK13I:
if $Athletics.Ranks >= 330 then goto CONT-BOA-HIB
goto OVERBURDENED13

OVERBURDENED13:
ECHO
ECHO *** You do not have enough swimming with your current burden to pass through Archer's Ford to Boar Clan.  Lose some weight and try again!
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormally high strength or spells then you can try to make the swim by typing GLANCE now.
ECHO * * * If you can make it through Archer's Ford please let me know what your swimming and strength are (kraelyst@hotmail.com)!
ECHO
	match CONT-BOA-HIB You glance
matchwait

CANTSWIM13:
ECHO
ECHO *** You do not have enough swimming (20) or Strength (16) to pass through Archer's Ford south of Boar Clan.  Find someone to drag you or cast some swimming spells.
ECHO
ECHO * * * If you think this assessment is wrong or you have abnormally high strength or spells then you can try to make the swim through Archer's Ford by typing GLANCE now.  
ECHO
	match CONT-BOA-HIB You glance
matchwait

CONT-BOA-HIB:
pause
move e
move sw
move se
move go stone bridge
move se
move se
move se
move se
move se

CLIMB-BOA-HIB1:
save CLIMB-BOA-HIB1
	match CLIMB-BOA-HIB3 Although there is packed dirt
	matchre CLIMB-BOA-HIB2 You must be standing|Stand up first
	matchre PAUSE slip after a few feet|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb log stair
matchwait

CLIMB-BOA-HIB2:
pause
	matchre CLIMB-BOA-HIB1 You stand|You are already standing
	match CLIMB-BOA-HIB2 cannot manage to stand.
	matchre CLIMB-BOA-HIB2 \.\.\.wait|type ahead
put stand
matchwait

CLIMB-BOA-HIB3:
move s
move s
move s
move s
move s
move s
move se
move e
move e
move se
move e
move e
move e
move se
move s
move se
move se
ECHO
ECHO * * * Now wading across Archer's Ford, so named for local Boar Clan Rangers using nearby trees for archery practice
ECHO
#BOA-HIB-GROUPCHECK:
#	matchre BOA-HIB-NOGROUP You have no group|You must be visible
#	match BOA-HIB-GROUP You whisper
#put whisper group ...
#matchwait

BOA-HIB-NOGROUP:
save SWIM-BOA-HIB2
goto SWIM-BOA-HIB1

BOA-HIB-GROUP:
save BOA-HIB-cont-group
pause
put say If we get separated in the ford go as far SE as you can, don't go south. I will meet you on the other side of the ford.
goto SWIM-BOA-HIB1

SWIM-BOA-HIB1:
pause
	matchre %s Flowing gently at this point, the Biiskbowr River|You can't go there
	matchre SWIM-BOA-HIB1 Obvious||but can't get anywhere|can't seem to make much headway
	matchre SWIM-BOA-HIB1 \.\.\.wait|type ahead
put se
matchwait

BOA-HIB-cont-group:
pause
ECHO
ECHO *** When your group arrives from the ford, rejoin and then type GLANCE to continue.  Make sure their roundtime is done.
ECHO
waitfor You glance
SWIM-BOA-HIB2:
move s
move se
move s
move sw
move sw
move se
move se
move se
move sw
move sw
move sw
move s
move sw
move s
move se
move sw
move s
move s
move sw
move sw
move s
move s
move s
move se
move se
move s
move s
move s
move se
move se
move s
move s
move s
move s
move s
move s
move s
move s
move go hibarnhvidar gate
ECHO
ECHO * * * Entering the wintry city of Hibarnhvidar
ECHO
pause
move e
move e
move e
move e
move e
move e
move se
move e
move e
move s
move se
move se
move se
move go double gate
ECHO
ECHO ===================
ECHO *** HIBARNHVIDAR
ECHO * * * Dwarven city in the soaring Himineldar Shel Mountains
ECHO * * * Home of the famous power-generating waterwheel system
ECHO * * * Patron god is Kertigen, creator of Elanthia and god of Dwarves, metal-working, and gems
ECHO ===================
ECHO
goto %1

FORF-RAV:
move go narrow road
move se
move se
move e
ECHO
ECHO * * * Within the abandoned mine are tommyknockers and retch fiends
ECHO
move e
move e
ECHO
ECHO * * * Mountain Giants roam upon that trail
ECHO
move se
move e
move ne
move se
ECHO
ECHO * * * Enter the cave to face angiswaerd
ECHO
pause
move e
move e
move s
move se
move s
move se
move sw
move w
move w
move sw
move nw
move sw
move w
move sw
move se
move se
pause 0.5
ECHO
ECHO *** CHECKING TO SEE IF YOU HAVE ICE SKATES! If you do - you will move fast 
ECHO *** If you do NOT have ice skates, will collect rocks inbetween every movement 
ECHO *** To avoid falling on this icy trail along the bitterly cold wind-swept cliffs of the Himineldar Shel
ECHO
GOSUB CHECK.ICE.SKATES
pause .5
GOSUB ICE se
pause
GOSUB ICE e
pause
GOSUB ICE e
pause
ECHO
ECHO * * * A tropical mist-covered jungle fills the gorge that must be leagues beneath this mammoth mountain
GOSUB ICE ne
pause
GOSUB ICE se
pause
ECHO
ECHO * * * The Dwarves settled the Himineldar Shel because it contains the most precious gemstones and ores in all Elanthia
ECHO 
GOSUB ICE sw
pause
GOSUB ICE sw
pause
ECHO
ECHO * * * Approaching the Crystalline Gorge where black stone cliffs are encased in solid ice
ECHO 
GOSUB ICE sw
pause
GOSUB ICE w
pause
ECHO
ECHO * * * Within the Crystalline Gorge is the Raven's Point outpost, a gathering of sturdy warriors that protect Forfedhdar from the Dragon Priests of the Black Spire and all who would invade
ECHO 
GOSUB ICE sw
pause
ECHO
ECHO * * * General Bazrid has spent many years commanding the warriors of Raven's Point, who are the front line of Forfedhdar's homeland defense
ECHO
GOSUB ICE sw
pause
ECHO
ECHO * * * Frostweyr Bears roam the mountainside nearby, even right up to the Raven's Point gates. Beware!
ECHO
GOSUB ICE se
pause
GOSUB ICE.SKATE.CHECK2
pause .5
move go rope bridge
move se
move e
move e
move s
move se
move se
move se
move se
move s
move sw
move se
move sw
move se
move sw
move s
move go iron gate
move se
ECHO
ECHO ===================
ECHO *** RAVEN'S POINT
ECHO * * * A Forfedhdar warrior outpost at the base of the Himineldar Shel mountains
ECHO * * * General Bazrid leads the Raven's Point warriors, who defend Forfedhdar from the Dragon Priests of the Black Spire
ECHO * * * Other nearby creatures are frostweyr bears, armored shalswar, forest gryphons, plague wraiths, and pivuh
ECHO * * * Features Smoky Bandit's tobacco shop and a bank, furrier, gem shop, general store, and homes
ECHO ===================
ECHO
goto %1

GETRAVENDOKORA:
	matchre RAV-FORF I don't know who you are referring to|But no one can see you
	matchre GETRAVENDOK2 But you don't have that much|You consider the offer and then realize
put tip zzzzzz 180 dokora
matchwait

GETRAVENDOK2:
pause
move w
move go stone bank
move w
put withdraw 2 silver
pause
move e
move go doorway
move e
goto RAV-FORF

RAV-FORF:
move nw
move go iron gate
move n
move ne
move nw
move ne
move nw
move ne
move n
move nw
move nw
move nw
move nw
move n
move w
move w
move go rope bridge
move nw
pause .5
ECHO
ECHO *** CHECKING TO SEE IF YOU HAVE ICE SKATES! If you do - you will move fast 
ECHO *** If you do NOT have ice skates, will collect rocks in between every movement 
ECHO *** To avoid falling on this icy trail along the bitterly cold wind-swept cliffs of the Himineldar Shel
ECHO
GOSUB CHECK.ICE.SKATES
pause .1
GOSUB ICE NW
pause
GOSUB ICE NE
pause
ECHO
ECHO * * * In this blizzard you probably wish you were back in Raven's Point with tobacco from Smoky Bandit's in one hand and a Dwarven ale in the other.
ECHO * * * Did you know each Dwarf clan brews its own special ale?
ECHO
GOSUB ICE ne
pause
GOSUB ICE e
pause
GOSUB ICE ne
ECHO
ECHO * * * The Dwarves settled the Himineldar Shel because it contains the most precious gemstones and ores in all Elanthia
ECHO
pause
GOSUB ICE ne
pause
GOSUB ICE ne
pause
ECHO
ECHO * * * The village of Nenav Dalar was lost in the year 157.  Perhaps you'll find it beneath one of these snowdrifts.
ECHO 
GOSUB ICE nw
pause
GOSUB ICE sw
pause
ECHO
ECHO * * * Centuries ago the Dwarves ruled the entire western and southern parts of the continent and the Himineldar Shel was part of the Kwarlog kingdom
GOSUB ICE w
pause
GOSUB ICE w
pause
GOSUB ICE nw
pause
GOSUB ICE nw
ECHO
ECHO * * * Finally done with that stupid fucking ice road!
ECHO * * * Just ahead is the Haalikshal Highway, which in Haakish means "sacred mountain"
ECHO * * * The highway is lined with the totem pillars of Dwarves whose families do not have their own totem groves
ECHO
GOSUB ICE.SKATE.CHECK2
pause 0.5
move nw
move ne
move e
move ne
move se
move ne
move e
move e
move ne
move nw
move n
move nw
move n
move w
move w
ECHO
ECHO * * * In the cave are angiswaerd
ECHO
move nw
move sw
move w
move nw
ECHO
ECHO * * * Mountain Giants roam upon that trail
ECHO
move w
move w
ECHO
ECHO * * * Enter this abandoned mine to face tommyknockers and retch fiends
ECHO
pause
move w
move nw
move nw
move go narrow road
ECHO
ECHO * * * Entering the Haalikshal Highway
ECHO
goto %1

SHA-RAV:
pause
move go muddy trail
move w
move sw
move sw
move s
ECHO
ECHO
ECHO * * * Passing beside Wyvern Mountain which contains a shrine to the World Dragon, built by Sh'kial
ECHO
pause
move w
move nw
move n
move nw
move w
move n
move nw
move n
move nw
move nw
move n
move ne
move ne
move ne
move n
move ne
move n
move nw
move nw
move w
move nw
move w
move w
move sw
move nw
move w
move w
move w
move w
move w
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move w
move sw
move sw
move nw
move w
move sw
move w
move sw
move climb narrow path
PATH-RAV:
move nw
move nw
move w
move w
move nw
move w
move nw
move ne
move nw
move w
move w
move w
move nw
move w
	matchre SWIM-PATH-RAV1 You have no group|You must be visible
	match SWIM-PATH-RAV-GROUP1 You whisper
put whisper group If we get split up keep going northward until you see the Gear Gate.
matchwait

SWIM-PATH-RAV-GROUP1:
save SWIM-PATH-RAV-GROUP1
pause
	matchre SWIM-PATH-RAV-GROUP2 The road joins the streambed|The mud of a lower bank
	matchre SWIM-PATH-RAV-GROUP1 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-PATH-RAV-GROUP1 \.\.\.wait|type ahead
put n
matchwait

SWIM-PATH-RAV-GROUP2:
save SWIM-PATH-RAV-GROUP2
	match SWIM-PATH-RAV-GROUP3 [The Western Road, Stream Bank]
	matchre SWIM-PATH-RAV-GROUP2 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-PATH-RAV-GROUP2 \.\.\.wait|type ahead
put w
matchwait

SWIM-PATH-RAV-GROUP3:
save SWIM-PATH-RAV-GROUP3
	pause
	match SWIM-PATH-RAV-GROUP4 [The Western Road, Atop the Ridge]
	match RETREAT engaged
	matchre SWIM-PATH-RAV-GROUP3 \.\.\.wait|type ahead
put nw
matchwait

SWIM-PATH-RAV-GROUP4:
ECHO
ECHO * * * Entering the Dwarven province of Forfedhdar
ECHO * * * "Forfedhdar" is Haakish for "The Land of the Ancestors"
ECHO * * * Governed by the Forfedhdar Enclave, made up of the leaders of each settlement
ECHO
pause
move nw
move n
move n
move ne
move ne
move e
move e
move ne
move ne
ECHO
ECHO * * * The Crystalline Gorge: black stone rises on all sides covered with ice crystals
ECHO
move up
move ne
move n
move nw
pause
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto raven-arrived

SWIM-PATH-RAV1:
save SWIM-PATH-RAV1
pause
	matchre SWIM-PATH-RAV2 The road joins the streambed|The mud of a lower bank
	matchre SWIM-PATH-RAV1 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-PATH-RAV1 \.\.\.wait|type ahead
put n
matchwait

SWIM-PATH-RAV2:
save SWIM-PATH-RAV2
put whisper group If we get split up keep going northward until you see the Gear Gate. 
pause
	match SWIM-PATH-RAV3 [The Western Road, Stream Bank]
	matchre SWIM-PATH-RAV2 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-PATH-RAV2 \.\.\.wait|type ahead
put w
matchwait

SWIM-PATH-RAV3:
save SWIM-PATH-RAV3
put whisper group If we get split up keep going northward until you see the Gear Gate. 
pause
put nw
	match SWIM-PATH-RAV4 [The Western Road, Atop the Ridge]
	match RETREAT engaged
	matchre SWIM-PATH-RAV3 \.\.\.wait|type ahead
matchwait

SWIM-PATH-RAV4:
ECHO
ECHO * * * Entering the Dwarven province of Forfedhdar
ECHO * * * "Forfedhdar" is Haakish for "The Land of the Ancestors"
ECHO * * * Governed by the Forfedhdar Enclave, made up of the leaders of each settlement
ECHO
pause
move nw
move n
move n
move ne
move ne
move e
move e
move ne
move ne
ECHO
ECHO * * * The Crystalline Gorge: black stone rises on all sides covered with ice crystals
ECHO
move up
move ne
move n
move nw
raven-arrived:
ECHO
ECHO ===================
ECHO *** RAVEN'S POINT
ECHO * * * A Forfedhdar warrior outpost at the base of the Himineldar Shel mountains
ECHO * * * General Bazrid leads the Raven's Point warriors, who defend Forfedhdar from the Dragon Priests of the Black Spire
ECHO * * * Other nearby creatures are frostweyr bears, armored shalswar, forest gryphons, plague wraiths, and pivuh
ECHO * * * Features Smoky Bandit's tobacco shop and a bank, furrier, gem shop, general store, and homes
ECHO ===================
ECHO
goto %1

RAV-SHA:
pause
move sw
move se
move sw
move se
move down
move sw
move sw
move w
move w
move sw
move sw
move s
ECHO
ECHO * * * Entering the province of Ilithi
ECHO
move s
move se
move se
move e
	matchre SWIM-RAV-SHA1 You have no group|You must be visible
	match SWIM-RAV-SHA-GROUP1 You whisper
put whisper group If we get split up go easterly until you reach a path and we'll meet there. Watch out for gryphons!
matchwait

SWIM-RAV-SHA-GROUP1:
save SWIM-RAV-SHA-GROUP1
pause
	match SWIM-RAV-SHA-GROUP2 The comfortable current and
	matchre SWIM-RAV-SHA-GROUP1 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-SHA-GROUP1 \.\.\.wait|type ahead
put s
matchwait

SWIM-RAV-SHA-GROUP2:
save SWIM-RAV-SHA-GROUP2
put whisper group If we get split up go easterly until you reach a path and we'll meet there. Watch out for gryphons!
pause
	match SWIM-RAV-SHA-GROUP3 [The Western Road, Stream Bank]
	matchre SWIM-RAV-SHA-GROUP2 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-SHA-GROUP2 \.\.\.wait|type ahead
put e
matchwait

SWIM-RAV-SHA-GROUP3:
save SWIM-RAV-SHA-GROUP3
put whisper group If we get split up go easterly until you reach a path and we'll meet there. Watch out for gryphons!
pause
	match SWIM-RAV-SHA-GROUP4 [The Western Road, Big Meadow]
	match RETREAT engaged
	matchre SWIM-RAV-SHA-GROUP3 \.\.\.wait|type ahead
put se
matchwait

SWIM-RAV-SHA-GROUP4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto RAV-SHA-cont

SWIM-RAV-SHA1:
save SWIM-RAV-SHA1
pause
	match SWIM-RAV-SHA2 The comfortable current and
	matchre SWIM-RAV-SHA1 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-SHA1 \.\.\.wait|type ahead
put s
matchwait

SWIM-RAV-SHA2:
save SWIM-RAV-SHA2
pause
	match SWIM-RAV-SHA3 [The Western Road, Stream Bank]
	matchre SWIM-RAV-SHA2 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-SHA2 \.\.\.wait|type ahead
put e
matchwait

SWIM-RAV-SHA3:
save SWIM-RAV-SHA3
pause
	match SWIM-RAV-SHA4 [The Western Road, Big Meadow]
	match RETREAT engaged
	matchre SWIM-RAV-SHA3 \.\.\.wait|type ahead
put se
matchwait

SWIM-RAV-SHA4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
goto RAV-SHA-cont

RAV-SHA-cont:
move climb narrow path
move ne
move e
move ne
move e
move se
move ne
move ne
move e
move e
move se
move ne
move ne
move e
move e
move se
move ne
move e
move e
move e
move e
move e
move se
move ne
move e
move e
move se
move e
move se
move se
move s
move sw
move s
move sw
move sw
move sw
move s
move se
move se
move s
move se
move s
move e
move se
move s
move se
move e
move go muddy trail
move ne
move ne
move e
move e
ECHO
ECHO ===================
ECHO *** SHARD, the Crystal City built upon the Lake of Tears
ECHO *** Capitol of Ilithi and the Elothean nation and home to Elves, governed by an Elothean Ferdahl
ECHO *** Built first by Elothean Corik the Black Cloud and Queen Morganae of the Mountain Elves
ECHO *** Rebuilt by Ferdahl Alec, son of Corik, after destruction by the Dragon Priests.  Later conquered by the Outcasts.
ECHO ===================
ECHO
goto %1

HOR-RAV:
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
pause
move go path
move n
move e
move se
move e
move se
move e
move se
move e
move ne
move e
move ne
move e
move ne
move e
move n
move nw
move ne
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Founded by a harmless priest named Sh'kial, turned wicked by his scheming student D'zree
ECHO
pause
move e
move e
move e
move se
move e
move ne
move n
move se
move climb bluff
move ne
move e
move se
move e
goto path-RAV

RAV-HOR:
pause
move sw
move se
move sw
move se
move down
move sw
move sw
move w
move w
move sw
move sw
move s
ECHO
ECHO * * * Entering the province of Ilithi
ECHO
move s
move se
move se
move e
	matchre SWIM-RAV-HOR1 You have no group|You must be visible
	match SWIM-RAV-HOR-GROUP1 You whisper
put whisper group If we get split up go easterly and southerly until you reach a path and we'll meet there. Watch out for gryphons!
matchwait

SWIM-RAV-HOR-GROUP1:
save SWIM-RAV-HOR-GROUP1
pause
	match SWIM-RAV-HOR-GROUP2 The comfortable current and
	matchre SWIM-RAV-HOR-GROUP1 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-HOR-GROUP1 \.\.\.wait|type ahead
put s
matchwait

SWIM-RAV-HOR-GROUP2:
save SWIM-RAV-HOR-GROUP2
put whisper group If we get split up go easterly and southerly until you reach a path and we'll meet there. Watch out for gryphons!
pause
	match SWIM-RAV-HOR-GROUP3 [The Western Road, Stream Bank]
	matchre SWIM-RAV-HOR-GROUP2 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-HOR-GROUP2 \.\.\.wait|type ahead
put e
matchwait

SWIM-RAV-HOR-GROUP3:
save SWIM-RAV-HOR-GROUP3
put whisper group If we get split up go easterly and southerly until you reach a path and we'll meet there. Watch out for gryphons!
pause
	match SWIM-RAV-HOR-GROUP4 [The Western Road, Big Meadow]
	match RETREAT engaged
	matchre SWIM-RAV-HOR-GROUP3 \.\.\.wait|type ahead
put se
matchwait

SWIM-RAV-HOR-GROUP4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
ECHO
ECHO
ECHO *** WAIT FOR YOUR GROUP TO REJOIN THEN TYPE "GLANCE" TO KEEP GOING
ECHO
ECHO
pause
waitfor You glance
goto RAV-HOR-CONT

SWIM-RAV-HOR1:
save SWIM-RAV-HOR1
pause
	match SWIM-RAV-HOR2 The comfortable current and
	matchre SWIM-RAV-HOR1 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-HOR1 \.\.\.wait|type ahead
put s
matchwait

SWIM-RAV-HOR2:
save SWIM-RAV-HOR2
pause
	match SWIM-RAV-HOR3 [The Western Road, Stream Bank]
	matchre SWIM-RAV-HOR2 but can't get anywhere|can't seem to make much headway
	match RETREAT engaged
	matchre SWIM-RAV-HOR2 \.\.\.wait|type ahead
put e
matchwait

SWIM-RAV-HOR3:
save SWIM-RAV-HOR3
pause
	match SWIM-RAV-HOR4 [The Western Road, Big Meadow]
	match RETREAT engaged
	matchre SWIM-RAV-HOR3 \.\.\.wait|type ahead
put se
matchwait

SWIM-RAV-HOR4:
pause
move e
move e
move e
move se
move sw
move se
move e
move se
move e
move e
move se
move se
goto RAV-HOR-CONT

RAV-HOR-CONT:
ECHO
ECHO
ECHO * * * Entering the Gilen Otso Steppes, where the pards and the arzumos roam
ECHO
move w
move nw
move w
move sw
move climb game trail
move nw
move s
move sw
move w
move nw
move w
move w
move w
ECHO
ECHO
ECHO * * * The track leads to an outpost of Dragon Priests, S'kra Mur who worship the World Dragon
ECHO * * * Under D'zree the Dragon Priests once conquered most of the 5 provinces
ECHO
pause
move sw
move se
move s
move w
move sw
move w
move sw
move w
move sw
move w
move nw
move w
move nw
move w
move nw
move w
move s
move go path
ECHO
ECHO ===================
ECHO *** HORSE CLAN aka Zaldi Taipa (in Elven)
ECHO *** A nomadic clan of Wind Elves
ECHO *** Governed by the Indar Taipan, Elven for "Strength of the Clan"
ECHO *** Home to the Sulde Taala, a special horse nearly worshipped by the clan, sometimes called Horse of the Huntress or the Sun-HORse.
ECHO ===================
ECHO
goto FINISH

RAVEN1-RAVEN2:
RAVEN1CLIMBCHECK:
pause 0.5
if $Athletics.Ranks >= 25 then goto RAVEN1GROUPCHECK
goto RAVEN1NOCLIMB

RAVEN1NOCLIMB:
pause
	match GEARGATECLOSED1 sealed for the night!
	matchre WAITGATE3 The gear gate is closed|Wait until the gear gate has|Open the gear gate
	match %1 [Raven's Point, Gear Gate]
	matchre RAVEN1NOCLIMB \.\.\.wait|type ahead
put go gate
matchwait

WAITGATE3:
pause
ECHO
ECHO *** Waiting for the Gear Gate to open for entry to Raven's Point
ECHO
	matchre RAVEN1NOCLIMB slides to a fully open position|sealing the passage both in
matchwait

GEARGATECLOSED1:
pause
ECHO
ECHO *** The Gear Gate is closed for the night and you do not have enough climbing skill (25) to bypass the gate.  You'll have to wait until day, learn more climbing, or get some help.
ECHO
ECHO * * * If you think you might be able to make it because of higher than normal strength, spells, or other tricks then type GLANCE now to try the gate bypass.
ECHO
	match RAVEN1GROUPCHECK You glance
matchwait

RAVEN1GROUPCHECK:
	matchre CHECKGATE1 You have no group|You must be visible
	match CHECKRAVENGATE3 You whisper
put whisper group ...
matchwait

CHECKRAVENGATE3:
pause
	matchre GROUPRAVEN1-RAVEN2 sealed for the night|The gear gate is closed
	matchre WAITGATE1 Wait until the gear gate has|Open the gear gate
	match %1 [Raven's Point, Gear Gate]
	matchre CHECKRAVENGATE3 \.\.\.wait|type ahead
put go gate
matchwait

GROUPRAVEN1-RAVEN2:
move se
move s
move go hole
RAVEN3STAND:
pause
	matchre WAITRAVEN3 You stand|You are already standing
	match RAVEN3STAND cannot manage to stand.
	matchre RAVEN3STAND \.\.\.wait|type ahead
put stand
matchwait

WAITRAVEN3:
ECHO
ECHO *** Wait for your group to rejoin and stand up and then type GLANCE
ECHO
pause
waitfor You glance
goto TURNBASIN3

TURNBASIN3:
pause
	match GOWALL3 stone wall opens up.
	match TURNBASIN3 stone wall closes.
	matchre TURNBASIN3 \.\.\.wait|type ahead
put turn basin
matchwait

GOWALL3:
pause
move go stone wall
move go opening
move e
move e
move go rock road
move nw
move nw
move go barrier
move sw

RAVCLIMB1A:
save RAVCLIMB1A
	match RAVCLIMB3A a rain-washed gully 
	matchre RAVCLIMB2A slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb sharp gully
matchwait

RAVCLIMB2A:
pause
	matchre RAVCLIMB1A You stand|You are already standing
	match RAVCLIMB2A cannot manage to stand.
	matchre RAVCLIMB2A \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3A:
move sw

RAVCLIMB1B:
save RAVCLIMB1B
	match RAVCLIMB3B while a jagged rockslide blocks the
	matchre RAVCLIMB2B slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb rockslide
matchwait

RAVCLIMB2B:
pause
	matchre RAVCLIMB1B You stand|You are already standing
	match RAVCLIMB2B cannot manage to stand.
	matchre RAVCLIMB2B \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3B:
move sw
move w
move go rock shard
move sw
move se
move sw
move s
move go gate
move se
goto %1

CHECKGATE1:
pause
	matchre GORAVEN1-RAVEN2 sealed for the night|Raven's Point is under siege|The gear gate is closed.|The gear gate is sealed|Wait until the gear gate has|Open the gear gate
	match %1 [Raven's Point, Gear Gate]
	matchre CHECKGATE1 \.\.\.wait|type ahead
put go gate
matchwait

WAITGATE1:
pause
put go gate
ECHO
ECHO *** Waiting for the Gear Gate to open for entry to Raven's Point
ECHO
	match CHECKGATE1 slides to a fully open position
	match WAITGATE1 sealing the passage both in
matchwait

GORAVEN1-RAVEN2:
move se
move s
move go hole
RAVEN1STAND:
pause
	matchre TURNBASIN1 You stand|You are already standing
	match RAVEN1STAND cannot manage to stand.
	matchre RAVEN1STAND \.\.\.wait|type ahead
put stand
matchwait

TURNBASIN1:
pause
	match GOWALL1 stone wall opens up.
	match TURNBASIN1 stone wall closes.
	matchre TURNBASIN1 \.\.\.wait|type ahead
put turn basin
matchwait

GOWALL1:
pause
move go stone wall
move go opening
move e
move e
move go rock road
move nw
move nw
move go barrier
move sw
RAVCLIMB1C:
save RAVCLIMB1C
	match RAVCLIMB3C a rain-washed gully 
	matchre RAVCLIMB2C slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb sharp gully
matchwait

RAVCLIMB2C:
pause
	matchre RAVCLIMB1C You stand|You are already standing
	match RAVCLIMB2C cannot manage to stand.
	matchre RAVCLIMB2C \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3C:
move sw

RAVCLIMB1D:
save RAVCLIMB1D
	match RAVCLIMB3D while a jagged rockslide blocks the
	matchre RAVCLIMB2D slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb rockslide
matchwait

RAVCLIMB2D:
pause
	matchre RAVCLIMB1D You stand|You are already standing|
	match RAVCLIMB2D cannot manage to stand.
	matchre RAVCLIMB2D \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3D:
move sw
move w
move go rock shard
move sw
move se
move sw
move s
move go gate
move se
goto %1

RAVEN2-RAVEN1:
RAVEN2CLIMBCHECK:
pause 0.5
if $Athletics.Ranks >= 25 then goto RAVEN2GROUPCHECK
goto RAVEN2NOCLIMB

RAVEN2NOCLIMB:
pause
	match GEARGATECLOSED2 sealed for the night!
	matchre WAITGATE4 The gear gate is closed|Wait until the gear gate has|Open the gear gate
	match %1 [Seord Kerwaith, Gear Gate]
	matchre RAVEN2NOCLIMB \.\.\.wait|type ahead
put go gate
matchwait

GEARGATECLOSED2:
pause
ECHO
ECHO *** The Gear Gate is closed for the night and you do not have enough climbing skill (25) to bypass the gate.  You'll have to wait until day, learn more climbing, or get some help.
ECHO
ECHO * * * If you think you might be able to make it because of higher than normal strength, spells, or other tricks then type GLANCE now to try the gate bypass.
ECHO
	match RAVEN2GROUPCHECK You glance
matchwait

WAITGATE4:
pause
ECHO
ECHO *** Waiting for the Gear Gate to open for exit from Raven's Point
ECHO
	matchre RAVEN2NOCLIMB slides to a fully open position|sealing the passage both in
matchwait

RAVEN2GROUPCHECK:
	matchre GOCHECKGATE2 You have no group|You must be visible
	match CHECKRAVENGATE4 You whisper
put whisper group ...
matchwait

CHECKRAVENGATE4:
pause
	matchre GROUPRAVEN2-RAVEN1 sealed for the night|The gear gate is closed
	matchre WAITGATE2 Wait until the gear gate has|Open the gear gate
	match %1 [Seord Kerwaith, Gear Gate]
	matchre CHECKRAVENGATE4 \.\.\.wait|type ahead
put go gate
matchwait

GROUPRAVEN2-RAVEN1:
move nw
move go gate
move n
move ne
move nw
move ne
put whisper group GO ROCK WALL and join me on the other side! 
move go rock wall
pause
ECHO
ECHO *** Wait for your group to rejoin and stand up and then type GLANCE
ECHO
pause
waitfor You glance
move e
move ne

RAVCLIMB1F:
save RAVCLIMB1F
	match RAVCLIMB3F The forest rises to the north
	matchre RAVCLIMB2F slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb rockslide
matchwait

RAVCLIMB2F:
pause
	matchre RAVCLIMB1F You stand|You are already standing
	match RAVCLIMB2F cannot manage to stand.
	matchre RAVCLIMB2F \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3F:
move ne

RAVCLIMB1G:
save RAVCLIMB1G
	match RAVCLIMB3G The forest crowds the road
	matchre RAVCLIMB2G slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb rain gully
matchwait

RAVCLIMB2G:
pause
	matchre RAVCLIMB1G You stand|You are already standing
	match RAVCLIMB2G cannot manage to stand.
	match RAVCLIMB2G \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3G:
move ne
move go crushed fence
move se
move se
move go narrow canyon
move w
move w
move go tunnel mouth
TURNTORCH4:
pause
	match GOWALL4 stone wall opens up.
	match TURNTORCH4 stone wall closes.
	matchre TURNTORCH4 \.\.\.wait|type ahead
put turn torch
matchwait

GOWALL4:
move go stone wall
pause
put whisper group GO HOLE right now, then STAND and go NORTH, NORTHWEST.  Hurry!
pause
move go hole
RAVEN4STAND:
pause
	matchre RAVEN4STOOD You stand|You are already standing
	match RAVEN4STAND cannot manage to stand.
	matchre RAVEN4STAND \.\.\.wait|type ahead
put stand
matchwait

RAVEN4STOOD:
move n
move nw
pause
ECHO
ECHO *** Wait for your group to rejoin then type GLANCE
ECHO
waitfor You glance
goto %1


GOCHECKGATE2:
CHECKGATE2:
pause
	matchre GORAVEN2-RAVEN1 sealed for the night|The gear gate is closed|Wait until the gear gate has|Open the gear gate
	match %1 [Seord Kerwaith, Gear Gate]
	match CHECKGATE2 \.\.\.wait|type ahead
put go gate
matchwait

WAITGATE2:
pause
ECHO
ECHO *** Waiting for the Gear Gate to open for exit from Raven's Point
ECHO
	match CHECKGATE2 slides to a fully open position
	match WAITGATE2 sealing the passage both in
matchwait

GORAVEN2-RAVEN1:
move nw
move go gate
move n
move ne
move nw
move ne
move go rock wall
move e
move ne
RAVCLIMB1H:
save RAVCLIMB1H
	matchre RAVCLIMB3H The forest rises to the north|Obvious
	matchre RAVCLIMB2H slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb rockslide
matchwait

RAVCLIMB2H:
pause
	matchre RAVCLIMB1H You stand|You are already standing
	match RAVCLIMB2H cannot manage to stand.
	matchre RAVCLIMB2H \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3H:
move ne

RAVCLIMB1I:
save RAVCLIMB1I
	matchre RAVCLIMB3I The forest crowds the road|Obvious
	matchre RAVCLIMB2I slip after a few feet|You must be standing|Stand up first
	matchre PAUSE steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|A wave of dizziness hits you|Struck by vertigo
	matchre PAUSE \.\.\.wait|type ahead
put climb rain gully
matchwait

RAVCLIMB2I:
pause
	matchre RAVCLIMB1I You stand|You are already standing
	match RAVCLIMB2I cannot manage to stand.
	matchre RAVCLIMB2I \.\.\.wait|type ahead
put stand
matchwait

RAVCLIMB3I:
move ne
move go crushed fence
move se
move se
move go narrow canyon
move w
move w
move go tunnel mouth
TURNTORCH2:
pause
	match GOWALL2 stone wall opens up.
	match TURNTORCH2 stone wall closes.
	matchre TURNTORCH2 \.\.\.wait|type ahead
put turn torch
matchwait

GOWALL2:
move go stone wall
move go hole
RAVEN2STAND:
pause
	matchre RAVEN2STOOD You stand|You are already standing
	match RAVEN2STAND cannot manage to stand.
	matchre RAVEN2STAND \.\.\.wait|type ahead
put stand
matchwait

RAVEN2STOOD:
move n
move nw
goto %1

NOSTART:
ECHO
ECHO ==========================================
ECHO *** You are not at a valid starting location for the MAINLAND TRAVEL SCRIPT
ECHO
ECHO * * * Start Outside any Town Gate
ECHO * * * Start on any public transport (ferry, barge, gondola, skiff)
ECHO * * * Start at any public transport dock 
ECHO
ECHO *** Additional starting locations:
ECHO  * * Crossing - outside bank# outside Moon Mage guild
ECHO  * * Riverhaven - Town Square
ECHO  * * On the broken bridge south of the Faldesu
ECHO  * * Langenfirth - Outside Wharf area
ECHO  * * El'Bain's - Picnic Area
ECHO  * * Leth Deriel - center of town
ECHO  * * Fayrin's Rest - Anloraten Crossing
ECHO  * * Wolf Clan - outside Trader outpost
ECHO  * * Knife Clan - North side of bridge
ECHO  * * Raven's Point - Inside gear gate
ECHO  * * Hibarnhvidar - Gateway between Inner and Outer Hibarnhvidar
ECHO ==========================================
ECHO
EXIT

NODESTINATION:
ECHO
ECHO =================================================
ECHO *** You did not enter a valid destination
ECHO *** To use this script type .{scriptname} {destination}
ECHO *** For example, to go to Crossing type  .travel crossing
ECHO =================================================
ECHO ========================================================
ECHO *** List of possible destinations:
ECHO
ECHO *** ILITHI:
ECHO * * * Horse Clan, Shard, Steelclaw Clan, Fayrin's Rest, Gondola
ECHO
ECHO *** FORFEDHDAR
ECHO * * * Ain Ghazal, Hibarnhvidar, Boar Clan, Raven's Point, Nenav Dalar
ECHO
ECHO *** ZOLUREN:
ECHO * * * Ilaya Taipa, Leth, Acenamacra, Alfren's Ferry, Crossing, Arthe Dale
ECHO * * * Kaerna, Caravansary, Dirge, and Tiger, Wolf, Knife, and Stone Clans
ECHO
ECHO *** THERENGIA:
ECHO * * * Faldesu River, North Road Ferry, Riverhaven, Throne City, Rossman's,
ECHO * * * Therenborough, El'Bain's, Langenfirth, Fornsted, Hvaral, Muspari
ECHO
ECHO
ECHO *** VALID STARTING LOCATIONS:
ECHO * * * Start Outside any Town Gate
ECHO * * * Start on any public transport (ferry, barge, gondola, skiff)
ECHO * * * Start at any public transport dock 
ECHO
ECHO *** Additional starting locations:
ECHO  * * Crossing - outside bank# outside Moon Mage guild
ECHO  * * Riverhaven - Town Square
ECHO  * * On the broken bridge south of the Faldesu
ECHO  * * Langenfirth - Outside Wharf area
ECHO  * * El'Bain's - Picnic Area
ECHO  * * Leth Deriel - center of town
ECHO  * * Fayrin's Rest - Anloraten Crossing
ECHO  * * Wolf Clan - outside Trader outpost
ECHO  * * Knife Clan - North side of bridge
ECHO  * * Raven's Point - Inside gear gate
ECHO  * * Hibarnhvidar - Gateway between Inner and Outer Hibarnhvidar
ECHO ========================================================
pause
ECHO =================================================
ECHO *** You did not enter a destination
ECHO *** To use this script type .{scriptname} {destination}
ECHO *** For example, to go to Crossing type  .travel crossing
ECHO =================================================
EXIT

NOMONEY:
ECHO
ECHO ============================
ECHO *** YOU ARE BROKE!
ECHO *** GET SOME MONEY!
ECHO ============================
ECHO
EXIT

NOROSSMAN:
ECHO
ECHO ==============================
ECHO *** You do not have the 50 ranks of climbing required to get to Rossman's.
ECHO *** You must take a boat from Lang or Haven or have someone take you.
ECHO ==============================
ECHO
EXIT

LEAVEALLFERRIES:
pause
ECHO
ECHO ****************************************************************
ECHO *** YOU ARE ABOARD A PUBLIC TRANSPORT!
ECHO
ECHO *** If you are at a dock and want off you must get off now and restart your script,
ECHO *** otherwise you will be let off at the next dock and taken to your final destination.
ECHO ****************************************************************
ECHO
	matchre ALLFERRYDOCK the ferry reaches the dock|reaches the dock and its crew ties the ferry off|The barge pulls into dock and its crew quickly ties the barge off|The skiff lightly taps the dock and the skilled River Elf crew quickly secure the + to the pilings|You come to a very soft stop as the ferry reaches the dock|The ferrymaster mumbles a few quick words of thanks as he and his crew move to unload the supplies
	match ALLFERRYWHARFPIER reaches its dock and its crew ties the barge off.
	match ALLFERRYMUSPARI The sand barge pulls into dock and its crew quickly ties the barge off.
matchwait

ALLFERRYDOCK:
pause
put go dock
pause
goto %1

ALLFERRYWHARFPIER:
pause
put go wharf
put go pier
pause
goto %1

ALLFERRYMUSPARI:
pause
put go platform
put go dock
pause
goto %1

LEAVESKIFF:
pause
ECHO
ECHO ****************************************************************
ECHO *** You are aboard a River Elf skiff that travels between Ilaya Taipa and Ain Ghazal.
ECHO
ECHO *** If you are at a dock and want off you must get off now and restart your script,
ECHO *** otherwise you will be let off at the next dock and taken to your final destination.
ECHO ****************************************************************
ECHO
waitfor The skiff lightly taps the dock
put stand
pause
move go dock
goto %1

RETREAT:
	matchre retreat You retreat back to pole range|still stunned
	match %s You retreat from combat.
	matchre PAUSE \.\.\.wait|type ahead
put retreat
matchwait

pause:
pause
goto %s

FALLEN:
pause
	matchre STOOD You stand|You are already standing
	matchre FALLEN cannot manage to stand|The weight of all your possessions
	matchre FALLEN \.\.\.wait|type ahead
put stand
matchwait

STOOD:
goto %s

FINISH:
put set Description
put stop hum
pause 0.1
put #parse YOU HAVE ARRIVED
ECHO
ECHO *** YOU HAVE ARRIVED ***
ECHO
pause 0.1
put look
EXIT


###############GOSUBS#####################

CHECK.ICE.SKATES:
	pause .1
	matchre ICE.SKATES.YES ^You tap
	matchre ICE.SKATES.NO ^I could not|^What were you
	send tap ice skate
	matchwait 10
	goto ICE.SKATES.NO
	
ICE.SKATES.YES:
	var UseSkatesOnIce 1
	RETURN
ICE.SKATES.NO:
	var UseSkatesOnIce 0
	RETURN
	
Ice:
	pause .1
	if %UseSkatesOnIce == 1 then
	{
		if !%WearingSkates then
		{
			put rem my boot
			put stow my boot
			wait
			pause .2
			put get my skates
			put wear my skates
			wait
			pause .2
			var WearingSkates 1
		}
	}
	if (%IceFallRisk = 1) && (%WearingSkates = 0) then
	{
		put collect rock
		pause 19
	}
	var IceFallRisk 0
	gosub move $0
	pause 0.5
	pause 0.1
	RETURN

ICE.SKATE.CHECK2:
	pause .5
	pause .1
if "%WearingSkates" = 1 then
{
	send rem my skate
	send stow my skate
	wait
	pause .2
	send get my boot
	send wear my boot
	pause .2
	var WearingSkates 0
}
RETURN

unload:
var location unload
matchre return ^You unload the
matchre return ^You remain concealed by your surroundings, convinced that your unloading
matchre return ^Roundtime:
matchre return ^But your
matchre return ^You don't have a
matchre return ^You can't unload such a weapon\.
matchre return ^Your
put unload
GOTO retry

unload.it:
put unload
pause 0.1
pause 0.1
goto STOW

empty:
if "$lefthand" != "Empty" then put empty left
if "$righthand" != "Empty" then put empty right
return


retry:
matchre location ^\.\.\.wait
matchre location ^Sorry, you may
matchre location ^Sorry, system is slow
matchre location ^You don't seem to be able to move to do that
matchre location.p ^It's all a blur
matchre location.p ^You're unconscious\!
matchre location.p ^You are still stunned
matchre location.p There is no need for violence here\.
matchre location.p ^You can't do that while entangled in a web
matchre location.p ^You struggle against the shadowy webs to no avail\.
matchre location.p ^You attempt that, but end up getting caught in an invisible box\.
matchre location1 ^You should stop playing before you do that\.
matchre location1 ^You are a bit too busy performing to do that\.
matchre location1 ^You are concentrating too much upon your performance to do that\.
matchwait 22
put #echo >Log yellow matchwait %location %todo

location.p:
pause
location:
pause .1
goto %location

location.unload:
GOSUB unload
var location stow1
GOSUB stow1
return

location.unload1:
GOSUB unload
var location wear1
GOSUB wear1
return

location1:
GOSUB stop.humming1
goto %location

return.p:
pause .1

return:
pause .1
RETURN


move:
walk:
var alsohere no
var People.Room empty
var critter no
var todo $0
var move.direction $0
move1:
var location moving
 moving:
 matchre stand.then.move ^You must be standing to do that\.|^You can't do that while lying down\.|^Stand up first\.|You can't do that while kneeling\.
 matchre pause.then.move %retry.command.triggers|You are too tired|All this climbing back and forth is getting a bit tiresome|^You work against the current|Too late|The gear gate is in the process|Wait until the gear gate
 matchre retreat.from.melee.then.move ^You are engaged to .+ melee range\!|^You try to move, but you're engaged\.|^While in combat\?|^You can't do that
 matchre retreat.from.pole.then.move ^You are engaged to .+ at pole weapon range\!|^While in combat\?|You'll have better luck if you first retreat\.
 matchre Dig.then.move ^You struggle forward
 matchre Dig.then.move ^Like a blind, lame duck, you wallow in the mud
 matchre Dig.then.move ^The mud holds you tightly
 matchre Dig.then.move ^You find yourself stuck in the mud
 matchre stow.then.move ^Free up your hands first
 matchre walk.return ^Obvious|It's pitch dark and you can't see a thing|^You go
 matchre move.error ^You can't go there\.|^You can't swim in that direction\.
 put %move.direction
GOTO retry
 stand.then.move:
 gosub stand
 goto moving
 pause.then.move:
 pause .5
 pause .2
 goto moving
 retreat.from.melee.then.move:
 put retreat
 retreat.from.pole.then.move:
 gosub stand
 put retreat
 goto moving
 move.error:
 echo * Bad move direction, will try next command in 1 second. *
 put .alert
 pause
 return
 walk.return:
 pause 0.1
 return
 Dig.then.move:
 pause .1
 put dig %move.direction
 pause .5
 pause .5
 goto moving
 stow.then.move:
 GOSUB stow
 goto moving	
 
 
 STAND:
if standing then return
var location STAND1
stand1:
pause 0.1
matchre return ^You stand back up\.
matchre return ^You swim back up
matchre return ^You are already standing\.
matchre return ^You're unconscious
matchre stand1 ^You are so unbalanced you cannot manage to stand\.
matchre stand1 ^You are overburdened and cannot manage to stand\.
matchre stand1 ^The weight of all your possessions prevents you from standing\.
matchre stand1 ^Roundtime
matchre DEAD ^You are a ghost
matchre STAND ^You are still stunned
put stand
goto RETRY
