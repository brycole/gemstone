#Aesry Travel Script 6/21/06

# Script written by Xada VonKroft and edited by Kraelyst
# Most current version of this script available at
# http://www.lurksponge.com/travel

#deletefromhighlightstrings string="***"
#AddToHighlightStrings string=*** forecolor=14 highlightEntireLine=True
#AddToHighlightStrings string=*** forecolor=#FFFF00 highlightEntireLine=True

echo
echo ===================================================
echo *** List of possible destinations:
echo *** (only the first 3 letters required)
echo
echo *** TOWN AND DOCKS
echo  * Bank
echo  * Herbs
echo  * Gems
echo  * Jail
echo  * Debt
echo  * Pawn
echo  * Vaults
echo  * Hospital/Empath
echo  * ALL Stat training (Wis, Int, Ref, Str, Sta, Dis, Agi, Cha)
echo  * Tanner
echo  * Origami
echo  * Leather repair
echo  * Metal repair
echo  * MAMAS
echo  * Morgue (front room only)
echo  * Lybadel Dock
echo  * Halasa Selhin Dock
echo  * Beach (swimming)
echo  * Stream (for swimming and home area)
echo
echo *** HUNTING
echo  * Unyns (outside cave entrance)
echo  * Bloodwolves (trail into bloodwolves)
echo  * Frosties (at the cliff)
echo  * Snow Goblins (fissure)
echo  * La'tami (base of Cliffs)
echo  * Snaer Hafwa (at High Cliffs Ledge)
echo  * Wir Dinego (outside gate)
echo  * Moss Meys (on the Jama)
echo
echo *** You may start at any of the destinations
echo *** In shops you must start where the transactions take place
echo ===================================================

if_1 goto Start
goto NODESTINATION

NODESTINATION:
pause
echo
echo =============================================
echo *** You did not enter a destination
echo *** To use this script type .{scriptname} {destination}
echo *** For example, to go to the gem shop type:  .aesry gem
echo =============================================
echo
EXIT

Start:
put set description
put set roomname

CHECKLOCATION1:
pause
match CHECKLOCATION1 Sorry, you may only
match DOCKTANNER-LYBADEL [Aesry Surlaenis'a, Willowbee's Pelts and Spinners]
match UNYN-LYBADEL [Aesry Surlaenis'a, Cliff Path]
match FROSTIE-BLOODWOLVES [Aesry Surlaenis'a, Geshi'selhin Chui]
match FISSURE-BLOODWOLVES [Aesry Surlaenis'a, Geshiger]
match JAIL-BANK [jail, Guard Office]
match DEBT-BANK [Aesry Surlaenis'a, debt Office]
match CAROUSEL-BANK [Aesry Surlaenis'a, The carousel]
match LA'TAMI-BANK [Aesry Surlaenis'a, Bottom of Cliff]
match HAFWA-BANK [Aesry Surlaenis'a, High Cliffs Ledge]
match WIRDINEGO-BANK [Aesry Surlaenis'a, Outside the Necropolis]
match AUTOPATH-BANK [Shoan Isenil'a, Raeshisen]
match HOSPITAL-BANK [Aesry Surlaenis'a, Shoan Isenil'a]
match MAMAS-BANK [Aesry Surlaenis'a, Shh'yris's Forge]
match GATE-BANK [Tona Kertigen, Harti]
match ENTRANCE-BANK [Tona Kertigen, Entrance Hall]
match DEPOSIT-BANK [Tona Kertigen, Deposit Window]
match EXCHANGE-BANK [Tona Kertigen, Exchange]
match GEM-2ND [Shoiya's gems, Purchasing]
match MORGUE-2ND [morgue]
match HERB-1ST alchemical and herbal Supplies]
match LEATHER-1ST Sefu's Leather Repair]
#    --1ST TIER--
match %1 Egani's Furs]
#    --2ND TIER--
match %1 Origami Boutique]
#    -- BANK --
match %1 bank building stands
#    --4TH TIER--
match %1 Ishh's Used Goods
#    --5TH TIER--
match %1 Shyrel'nor Fundisoli]
match %1 Birches border the road
match %1 White birch mingles with silverwood
match %1 Lybadel's schedule
match CHECKLOCATION2 You glance
put look;glance
matchwait

CHECKLOCATION2:
pause
match STREAM-5TH [Aesry Surlaenis'a, Highland Ledge]
match BEACH-LYBADEL Aesry Surlaenis'a, Near Lezeni's Cove]
match WISDOM-1ST [Ger Ilerthan, Isinrel]
match REFLEX-2ND Weapons Training
match INTEL-BANK Shoan Sulihean]
match STRENGTH-BANK Beside the Pier]
match STAMINA-BANK Bellows Room]
match DISCIPLINE-4TH Willow Park]
match AGILITY-4TH [Joirin's Puzzle Shop, Back Room]
match HALASA-LYBADEL [Harbor Docks, Aesry Surlaenis'a]
match OUTSIDEFISSURE-BLOODWOLVES [Aesry Surlaenis'a, Bu'amakra]

#BEGIN CUT BELOW THIS LINE
match NOSTART You glance
put look;glance
matchwait
#END CUT ABOVE THIS LINE

1ST-BANK:
pause
move out
move go gate
move s
put climb stair
waitfor You reach the end
move s
move s
move s
put climb step
waitfor You reach the end
move s
move s
move s
move e
goto %1

1ST-2ND:
pause
move out
move go gate
move s
put climb stair
waitfor You reach the end
move s
move s
move e
move ne
move n
move ne
move ne
move e
move ne
move e
move se
move e
move se
move go building
goto %1

2ND-1ST:
pause
move out
move nw
move w
move nw
move w
move sw
move w
move sw
move sw
move s
move sw
move w
move n
move n
put climb stair
waitfor You reach the end
move n
move go gate
move go door
goto %1

2ND-BANK:
pause
move out
move se
move s
move se
move e
move s
put climb stair
waitfor You reach the end
move s
move s
move w
move s
move sw
move s
move sw
move sw
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1

4TH-BANK:
pause
move go door
move e
move n
put climb step
waitfor You reach the end
move n
move n
move w
move sw
move s
move sw
move sw
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1

BANK-4TH:
pause
move se
move s
move se
move se
move e
move se
move e
move ne
move go foot
move ne
move ne
move n
move ne
move e
move s
move s
put climb step
waitfor You reach the end
move s
move w
move go shop
goto %1

4TH-5TH:
pause
move go door
move e
move s
move s
put climb stair
waitfor You reach the end
move s
move w
move sw
move s
move sw
move sw
move w
move sw
move w
move nw
move go courtyard
goto %1

5TH-4TH:
pause
move out
move se
move e
move ne
move e
move ne
move ne
move n
move ne
move e
move n
put climb stair
waitfor You reach the end
move n
move n
move w
move go shop
goto %1

5TH-BANK:
pause
move out
move w
move nw
move nw
move n
move nw
move w
move n
put climb stair
waitfor You reach the end
move n
move n
move n
put climb step
waitfor You reach the end
move n
move n
move e
goto %1

BANK-5TH:
pause
move w
move s
move s
put climb step
waitfor You reach the end
move s
move s
move s
put climb stair
waitfor You reach the end
move s
move e
move se
move s
move se
move se
move e
move go courtyard
goto %1

LEATHER-1ST:
pause
move w
goto %1

GEM-2ND:
pause
move out
move n
move nw
move go building
goto %1 

DOCKTANNER-LYBADEL:
pause
move out
move n
move n
move climb ladder
goto %1 

HALASA-LYBADEL:
pause
move e
move n
goto %1

BEACH-LYBADEL:
move climb jetty
move climb ladder
move n
move n
move n
move climb ladder
goto %1 

UNYN-LYBADEL:
pause
move s
move down
move se
move s
move climb trail
move w
move w
move w
move climb ladder
goto %1 

FROSTIE-BLOODWOLVES:
pause
move climb cliff
move se
move sw
move s
move s
move se
move e
move se
move e
move climb trail
goto %1 

FISSURE-BLOODWOLVES:
pause
move out
move climb steep slope
move climb narrow ledge
move climb stair
move go path
move s
move s
move se
move e
move se
move e
move climb trail
goto %1 

OUTSIDEFISSURE-BLOODWOLVES:
pause
move climb steep slope
move climb narrow ledge
move climb stair
move go path
move s
move s
move se
move e
move se
move e
move climb trail
goto %1 

MOSSMEYS-BLOOD:
pause
put climb stair
waitfor You reach the end
move w
put climb step
waitfor You reach the end
move w
move go gate
move w
move w
goto %1 

GATE-BANK:
pause
move go gate
goto %1 

ENTRANCE-BANK:
pause
move go door
move go gate
goto %1 

DEPOSIT-BANK:
pause
move s
move go door
move go gate
goto %1 

EXCHANGE-BANK:
pause
move e
move s
move go door
move go gate
goto %1

MORGUE-2ND:
pause
move out
move e
move ne
move e
move se
move e
move se
move go building
goto %1 

JAIL-BANK:
pause
move go door
move go gate
move s
move sw
move s
goto %1 

DEBT-BANK:
pause
move out
move w
move sw
move sw
move s
move sw
move s
goto %1 

CAROUSEL-BANK:
pause
move out
move out
move w
move nw
move w
move sw
move w
move sw
move sw
move s
move sw
move s
goto %1 

LA'TAMI-BANK:
pause
move sw
move s
move sw
move s
move s
move s
move w
move sw
move climb bank
move sw
move nw
move sw
move nw
move nw
move w
move w
move sw
move s
move sw
move sw
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1 

HAFWA-BANK:
pause
move climb wide ledge
move climb cant ledge
move climb slant ledge
move climb down
move sw
move s
move sw
move se
move climb hole
move climb crev
move climb down
move climb down
move go tunnel
move climb down
move climb shelf
move climb down
move s
move climb thin ledge
move climb lower ledge
move climb down
move sw
move s
move sw
move s
move s
move s
move w
move sw
move climb bank
move sw
move nw
move sw
move nw
move nw
move w
move w
move sw
move s
move sw
move sw
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1 

MAMAS-BANK:
pause
move out
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1 

AUTOPATH-BANK:
pause
move go arch
move out
move out
move nw
move w
move nw
move nw
move n
move nw
goto %1 

HOSPITAL-BANK:
pause
move out
move nw
move w
move nw
move nw
move n
move nw
goto %1 

WIRDINEGO-BANK:
pause
move w
move n
move n
move n
put climb step
waitfor You reach the end
move n
move n
move w
move sw
move s
move sw
move sw
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1 

STREAM-5TH:
pause
move go ledge
move e
move ne
put climb trail
waitfor You reach the end
pause
put climb path
waitfor You reach the end
move s
move sw
move sw
move w
move sw
move w
move nw
move go courtyard
goto %1 

lyb:
lyba:
lybad:
lybade:
Lybadel:
pause
doc:
dock:
docks:
pie:
pier:
match BANK-BLOOD bank building stands
match BLOOD-LYBADEL White birch mingles with silverwood
match END-LYBADEL Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

hal:
hala:
halas:
halasa:
halasas:
halasase:
halasasel:
halasaselh:
halasaselhi:
halasaselhin:
sel:
selh:
selhi:
selhin:
match BANK-BLOOD bank building stands
match BLOOD-LYBADEL White birch mingles with silverwood
match LYBADEL-HALASA Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

sea:
swi:
swim:
swimo:
swimoc:
swimoce:
swimocea:
swimocean:
oce:
ocea:
ocean:
bea:
beac:
beach:
pause
match BANK-BLOOD bank building stands
match BLOOD-LYBADEL White birch mingles with silverwood
match LYBADEL-BEACH Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

uny:
unyn:
unyns:
pause
match BANK-BLOOD bank building stands
match BLOOD-LYBADEL White birch mingles with silverwood
match LYBADEL-UNYN Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

blo:
bloo:
blood:
bloodw:
bloodwo:
bloodwol:
bloodwolf:
bloodwolfs:
bloodwolv:
bloodwolve:
bloodwolves:
wol:
wolf:
wolfs:
wolv:
wolve:
wolves:
pause
match BANK-BLOOD bank building stands
match END-BLOOD White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

fro:
fros:
frost:
frosti:
frostie:
frosties:
frostw:
frostwe:
frostwea:
frostweav:
frostweave:
Frostweaver:
frostweavers:
wea:
weav:
weave:
weaver:
weavers:
pause
match BANK-BLOOD bank building stands
match BLOOD-FROSTIE White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

sno:
snow:
snowg:
snowgo:
snowgob:
snowgobl:
snowgobli:
snowgoblin:
snob:
snobl:
snobli:
snoblin:
snoblins:
snobs:
gob:
gobs:
gobl:
gobli:
goblin:
goblins:
fis:
fiss:
fissu:
fissur:
fissure:
pause
match BANK-BLOOD bank building stands
match BLOOD-SNOBS White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

mos:
moss:
mossm:
mossme:
mossmey:
mossmeys:
mey:
meys:
pause
match BANK-BLOOD bank building stands
match BLOOD-MOSSMEYS White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

la':
la't:
la'ta:
la'tam:
la'tami:
lat:
lata:
latam:
latami:
pause
match BANK-LA'TAMI bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

haf:
hafw:
hafwa:
sna:
snae:
snaer:
snaerh:
snaerha:
snaerhaf:
snaerhafw:
snaerhafwa:
match BANK-HAFWA bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

wir:
wird:
wirdi:
wirdin:
wirdine:
wirdineg:
wirdinego:
din:
dine:
dineg:
dinego:
pause
match BANK-WIRDINGEO bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

#=========================
#1ST TIER LOCATIONS [tanner]

tan:
tann:
tanne:
tanner:
tanners:
rep:
repa:
repai:
repair:
lea:
leat:
leath:
leathe:
leather:
leatherr:
leatherre:
leatherrep:
leatherrepa:
leatherrepai:
leatherrepair:
match BANK-1ST bank building stands
match BLOOD-LYBADEL White birch mingles with silverwood
match LYBADEL-TANNER Lybadel's schedule
match MOSSMEYS-BLOOD Birches border the road
match END-TANNER Egani's Furs]
match 2ND-1ST Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

her:
herb:
herbs:
herbsh:
herbsho:
herbshop:
alc:
alch:
alche:
alchem:
alchemi:
alchemic:
alchemica:
alchemical:
alchemy:
match BANK-1ST bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-HERB Egani's Furs]
match 2ND-1ST Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

wis:
wisd:
wisdo:
-WISDOM:
match BANK-1ST bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-WISDOM Egani's Furs]
match 2ND-1ST Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

#=========================
#2ND TIER LOCATIONS [Origami]

mor:
morg:
morgu:
morgue:
match BANK-2ND bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-2ND Egani's Furs]
match 2ND-MORGUE Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

ori:
orig:
origa:
origam:
Origami:
Origamis:
Origamish:
Origamisho:
Origamishop:
match BANK-2ND bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-2ND Egani's Furs]
match END-Origami Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

gem:
gems:
gemsh:
gemsho:
gemshop:
match BANK-2ND bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-2ND Egani's Furs]
match 2ND-gem Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

ref:
refl:
refle:
reflex:
match BANK-2ND bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-2ND Egani's Furs]
match 2ND-REFLEX Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

#=========================
#3RD TIER LOCATIONS [bank]

ban:
bank:
match END-BANK bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

mam:
mama:
mamas:
met:
meta:
metal:
metalr:
metalre:
metalrep:
metalrepa:
metalrepai:
metalrepair:
match BANK-MAMAS bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

hos:
hosp:
hospi:
hospit:
hospita:
hospital:
aut:
auto:
autop:
autopa:
autopat:
autopath:
autoe:
autoem:
autoemp:
autoempa:
autoempat:
autoempath:
emp:
empa:
empat:
empath:
hea:
heal:
heale:
healer:
match BANK-AUTOPATH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

jai:
jail:
match BANK-JAIL bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

deb:
debt:
debto:
debtof:
debtoff:
debtoffi:
debtoffic:
debtoffice:
debts:
match BANK-DEBT bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

car:
caro:
carou:
carous:
carouse:
carousel:
vau:
vaul:
vault:
vaults:
match BANK-CAROUSEL bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

int:
inte:
intel:
intell:
intelli:
intellig:
intellige:
intelligen:
intelligenc:
intelligence:
match BANK-INTEL bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

str:
stre:
stren:
streng:
strengt:
strength:
match BANK-STRENGTH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

sta:
stam:
stami:
stamin:
stamina:
match BANK-STAMINA bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-BANK Ishh's Used Goods
match 5TH-BANK Shyrel'nor Fundisoli]
put look
matchwait

#=========================
#4TH TIER LOCATIONS [Pawnshop]

paw:
pawn:
pawns:
pawnsh:
pawnsho:
pawnshop:
match BANK-4TH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match END-PAWN Ishh's Used Goods
match 5TH-4TH Shyrel'nor Fundisoli]
put look
matchwait

dis:
disc:
disci:
discip:
discipl:
discipli:
disciplin:
discipline:
match BANK-4TH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-DISCIPLINE Ishh's Used Goods
match 5TH-4TH Shyrel'nor Fundisoli]
put look
matchwait

agi:
agil:
agili:
agilit:
agility:
match BANK-4TH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-AGILITY Ishh's Used Goods
match 5TH-4TH Shyrel'nor Fundisoli]
put look
matchwait

#=========================
#5TH TIER LOCATIONS [Charisma]

cha:
char:
chari:
charis:
charism:
charisma:
match BANK-5TH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-5TH Ishh's Used Goods
match END-CHARISMA Shyrel'nor Fundisoli]
put look
matchwait

strea:
stream:
match BANK-5TH bank building stands
match BLOOD-BANK White birch mingles with silverwood
match LYBADEL-BLOOD Lybadel's schedule
match MEY-BANK Birches border the road
match 1ST-BANK Egani's Furs]
match 2ND-BANK Origami Boutique]
match 4TH-5TH Ishh's Used Goods
match 5TH-STREAM Shyrel'nor Fundisoli]
put look
matchwait

#=================

END-BANK:

pause
echo
echo *** YOU ARE NOW AT THE BANK ***
echo
EXIT

END-BLOOD:

pause
echo
echo *** YOU ARE NOW AT THE TRAIL TO BLOODWOLVES ***
echo
EXIT

END-LYBADEL:

pause
echo
echo *** YOU ARE NOW AT THE Lybadel DOCK ***
echo
EXIT

END-PAWN:

pause
echo
echo *** YOU ARE NOW AT THE PAWN SHOP ***
echo
EXIT

END-CHARISMA:

pause
echo
echo *** YOU ARE NOW AT CHARISMA TRAINING ***
echo
EXIT

END-TANNER:

pause
echo
echo *** YOU ARE NOW AT THE AESRY TANNER ***
echo *** (the leather repair is east)
echo
EXIT

END-Origami:

pause
echo
echo *** YOU ARE NOW AT THE Origami SHOP ***
echo
EXIT

BANK-BLOOD:
pause
move W
move go gate
move w
move w
move w
put climb stair
waitfor You reach the end
pause
move w
put climb stair
waitfor You reach the end
pause
move w
put climb stair
waitfor You reach the end
pause
move w
put climb stair
waitfor You reach the end
pause
move w
put climb stair
waitfor You reach the end
pause
move w
put climb stair
waitfor You reach the end
pause
move w
put climb stair
waitfor You reach the end
pause
move w
put climb step
waitfor You reach the end
move w
move go gate
move w
move w
goto %1 

HERB-1ST:
pause
move out
move sw
move s
move sw
move w
move go gate
move go door
goto %1

BANK-1ST:
pause
move w
move n
move n
move n
put climb step
waitfor You reach the end
move n
move n
move n
put climb stair
waitfor You reach the end
move n
move go gate
move go door
goto %1

BANK-2ND:
pause
move w
move n
move n
move n
put climb step
waitfor You reach the end
move n
move e
move ne
move n
move ne
move ne
move e
move ne
move e
move se
move e
move se
move go building
goto %1

1ST-HERB:
pause
move out
move go gate
move e
move ne
move n
move ne
move go shop
echo
echo *** YOU ARE NOW AT THE HERB AND ALCHEMY SHOP ***
echo
exit

2ND-MORGUE:
pause
move out
move nw
move w
move nw
move w
move sw
move w
move go building
echo
echo *** YOU ARE NOW AT THE MORGUE ***
echo
exit

2ND-gem:
pause
move out
move se
move s
move go door
echo
echo *** YOU ARE NOW AT THE GEM SHOP ***
echo
EXIT

BANK-JAIL:
pause
move n
move ne
move n
move go gate
move go door
echo
echo *** YOU ARE NOW AT THE JAIL ***
echo
EXIT

BANK-DEBT:
pause
move n
move ne
move n
move ne
move ne
move e
move go gate
echo
echo *** YOU ARE NOW AT THE DEBT OFFICE ***
echo
exit

BANK-CAROUSEL:
pause
move n
move ne
move n
move ne
move ne
move e
move ne
move e
move se
move e
move go building
move go door
echo
echo *** YOU ARE NOW AT THE CAROUSEL ***
echo
exit

BANK-LA'TAMI:
pause
move se
move s
move se
move se
move e
move se
move e
move ne
move go foot
move ne
move ne
move n
move ne
move e
move go foot
move se
move se
move ne
move se
move ne
move climb bank
move ne
move e
move climb trail
move n
move n
move ne
move n
move ne

pause
echo
echo *** YOU ARE NOW AT THE BOTTOM OF THE LA'TAMI CLIFFS ***
echo
exit

BANK-MAMAS:
pause
move se
move s
move se
move se
move e
move se
move e
move ne
move go foot
move go building

pause
echo
echo *** YOU ARE NOW AT MAMAS (METAL REPAIR) ***
echo
EXIT

BANK-AUTOPATH:
pause
move se
move s
move se
move se
move e
move se
move go gate
move go screen
move go arch

pause
echo
echo *** YOU ARE NOW AT THE NPC EMPATH ***
echo

EXIT

BANK-HAFWA:
pause
move se
move s
move se
move se
move e
move se
move e
move ne
move go foot
move ne
move ne
move n
move ne
move e
move go foot
move se
move se
move ne
move se
move ne
move climb bank
move ne
move e
move climb trail
move n
move n
move ne
move n
move ne
move climb rock ledge
move climb thin ledge
move climb rock
move n
move climb perch
move climb shelf
move climb crev
move go tunnel
move climb crumbling ledge
move climb crev
move climb hole
move climb top
move nw
move ne
move n
move ne
move climb slant ledge
move climb cant ledge
move climb wide ledge
move climb slippery ledge

pause
echo
echo *** YOU ARE OUTSIDE SNAER hafWA ***
echo
EXIT

BANK-WIRDINGEO:
pause
move se
move s
move se
move se
move e
move se
move e
move ne
move go foot
move ne
move ne
move n
move ne
move e
move s
move s
put climb step
waitfor You reach the end
move s
move s
move s
move e
pause
echo
echo *** YOU ARE NOW AT THE CEMETARY ***
echo
EXIT

5TH-STREAM:
pause
move out
move se
move e
move ne
move e
move ne
move ne
move n
put climb path
waitfor You reach the end
pause
put climb lane
waitfor You reach the end
move sw
move w
move go ledge
echo
echo ==================================
echo ***       To swim you will need to
echo ***   Go stream, west, west, west, north,
echo *** climb wall, go trail, southeast, east
echo ***   This will return you to this room.
echo ==================================
echo
pause
echo
echo *** YOU ARE NOW AT THE STREAM ***
echo
EXIT

BLOOD-LYBADEL:
pause
put climb path
waitfor You reach the end
pause
move sw
move w
put climb trail
waitfor You reach the end
pause
move n
put climb trail
waitfor You reach the end
pause
move nw
move w
put climb road
waitfor You reach the end
pause
move s
put climb trail
waitfor You reach the end
pause
move sw
put climb path
waitfor You reach the end
pause
move nw
put climb ramp
waitfor You reach the end
pause
move w
put climb walk
waitfor You reach the end
move w
move w
move w
move climb ladder
goto %1 

BLOOD-SNOBS:
pause
move climb trail
move w
move nw
move w
move nw
move n
move n
move go path
move climb stair
move climb narrow ledge
move climb steep slope
move go fissure
pause
echo
echo *** YOU ARE NOW AT THE FISSURE (SNOW GOBLINS) ***
echo
EXIT

BLOOD-FROSTIE:
pause
move climb trail
move w
move nw
move w
move nw
move n
move n
move nw
move ne
move climb cliff
pause
echo
echo *** YOU ARE NOW AT FROST WEAVERS ***
echo

EXIT

BLOOD-MOSSMEYS:
pause
move e
move go gate
move e
move e
put climb stair
waitfor You reach the end
pause
move e
put climb stair
waitfor You reach the end
pause
echo
echo *** YOU ARE NOW AT MOSS MEYS ***
echo
EXIT

BLOOD-BANK:
pause
move e
move go gate
move e
move e
put climb stair
waitfor You reach the end
move e
put climb stair
waitfor You reach the end
GOTO MEY-BANK

MEY-BANK:
pause
move e
put climb stair
waitfor You reach the end
pause
move e
put climb stair
waitfor You reach the end
pause
move e
put climb stair
waitfor You reach the end
pause
move e
put climb stair
waitfor You reach the end
pause
move e
put climb stair
waitfor You reach the end
pause
move e
put climb stair
waitfor You reach the end
move e
move e
put bow dolphin
move go gate
move e
move e
goto %1 


LYBADEL-TANNER:
pause
move climb ladder
move s
move s
move go hut
pause
echo
echo *** YOU ARE NOW AT THE DOCK TANNER ***
echo

EXIT

LYBADEL-BLOOD:
pause
move climb ladder
move e
move e
move e
put climb walk
waitfor You reach the end
pause
move e
put climb ramp
waitfor You reach the end
pause
move se
put climb path
waitfor You reach the end
pause
move ne
put climb trail
waitfor You reach the end
pause
move n
put climb road
waitfor You reach the end
pause
move e
move se
put climb trail
waitfor You reach the end
pause
move s
put climb trail
waitfor You reach the end
pause
move e
move ne
put climb path
waitfor You reach the end
goto %1 

LYBADEL-BEACH:
pause
move climb ladder
move s
move s
move s
move climb ladder
move climb jetty
pause
echo
echo *** YOU ARE NOW AT THE BEACH ***
echo
EXIT

LYBADEL-UNYN:
pause
move climb ladder
move e
move e
move e
move climb trail
move n
move nw
move up
move n
echo ============================
echo *** Need to search for opening
echo ============================
pause
echo
echo *** YOU ARE NOW AT THE CAVE ENTRANCE TO UNYNS ***
echo
EXIT

LYBADEL-HALASA:
pause
move s
move w
pause
echo
echo *** YOU ARE NOW AT THE HALASA SELHIN DOCK ***
echo
EXIT

WISDOM-1ST:
pause
move go sliding door
move n
move n
move w
move w
move go teak door
move s
move go gate
move w
move nw
move w
move sw
move w
move sw
move sw
move s
move sw
move w
move go gate
move go door
goto %1

1ST-WISDOM:
pause
move out
move go gate
move e
move ne
move n
move ne
move ne
move e
move ne
move e
move se
move e
move go gate
move n
move go teak door
move e
move e
move s
move s
move go sliding door
pause
echo
echo *** YOU ARE NOW AT THE -WISDOM TRAINING AREA ***
echo
EXIT

REFLEX-2ND:
pause
move go screen door
move go steel gate
move s
move e
move ne
move n
move ne
move ne
move e
move ne
move e
move se
move e
move se
move go building
goto %1

2ND-REFLEX:
pause
move out
move nw
move w
move nw
move w
move sw
move w
move sw
move sw
move s
move sw
move w
move n
move go steel gate
move go screen door
pause
echo
echo *** YOU ARE NOW AT THE REFLEX TRAINING AREA ***
echo
EXIT

INTEL-BANK:
pause
move out
move out
move go gateless arch
move s
goto %1

BANK-INTEL:
pause
move n
move go library arch
move go open screen
move go alcove
pause
echo
echo *** YOU ARE NOW AT THE INTELLIGENCE TRAINING AREA ***
echo
EXIT

STRENGTH-BANK:
pause
move climb step
move sw
move nw
move nw
move n
move nw
goto %1

BANK-STRENGTH:
pause
move se
move s
move se
move se
move go pier
move climb step
pause
echo
echo *** YOU ARE NOW AT THE STRENGTH TRAINING AREA ***
echo
EXIT

STAMINA-BANK:
pause
move s
move out
move go foot
move sw
move w
move nw
move w
move nw
move nw
move n
move nw
goto %1

BANK-STAMINA:
pause
move se
move s
move se
move se
move e
move se
move e
move ne
move go foot
move go building
move n
pause
echo
echo *** YOU ARE NOW AT THE STAMINA TRAINING AREA ***
echo
EXIT

DISCIPLINE-4TH:
pause
move go gravel path
move se
move e
move ne
move e
move ne
move ne
move n
move ne
move go shop
goto %1

4TH-DISCIPLINE:
pause
move go door
move sw
move s
move sw
move sw
move w
move sw
move w
move nw
move go gravel path
pause
echo
echo *** YOU ARE NOW AT THE DISCIPLINE TRAINING AREA ***
echo *** The Discipline instructor is only present during the day ***
echo
EXIT

AGILITY-4TH:
pause
move go wooden door
move out
move ne
move n
move ne
move go shop
goto %1

4TH-AGILITY:
pause
move go door
move sw
move s
move sw
move go shop
move go wooden door
pause
echo
echo *** YOU ARE NOW AT THE AGILITY TRAINING AREA ***
echo
EXIT


NOSTART:
echo
echo ======================================
echo *** You are not at a valid starting location
echo *** Please see the list above for valid locations
echo ======================================
echo
EXIT

FINISH:
put set Description
pause
echo
echo *** YOU HAVE ARRIVED ***
echo
EXIT