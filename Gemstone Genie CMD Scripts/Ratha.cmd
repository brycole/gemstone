#Travel Ratha 4-2-07
##debuglevel 5
# -- This script was created by Kraelyst the Hand
# -- Most current version of this script available at
# -- http://www.lurksponge.com/travel

if_1 goto INSTRUCTIONS
goto nodestination

INSTRUCTIONS:
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo ========================================================
echo *** VALID DESTINATIONS:
echo * * * * ESSENTIAL SERVICES: Bank, Gems, Vault, Pawn, Furrier, Healer, Stables, Stat Training...
echo * * * * SHOPS: Locksmith, Alchemy, HERBs, ORIGAMI, Bait Leather/METAL Repair, Instruments...
echo * * * * CRITTERS: Sprites, Swain, Leucros, Moruryns, Undead, Malchata, etc...
echo * * * * CITY EXITS: All ship docks and Taisgath
echo
echo *** Only the first 3 letters of the destination need to be inputed
echo *** To see a full list of destinations begin the script without specifying a destination
echo ========================================================
echo 
put set roomnames
put set description
pause
goto %1


#==================
#ALTERNATE STARTS
#==================

CHECKLOCATION1:
pause
match LEAVEPORTICOA [Lower Bank of Ratha, Portico]
match LEAVEBURSAR [Lower Bank of Ratha, Currency Exchange]
match LEAVEBOURSE [Lower Bank of Ratha, Auction Bourse]
match LEAVECASHIER [Lower Bank of Ratha, Cashier]
match LEAVEVAULT [Ratha, Carousel Square]
match MOVEOUT [Ratha, Carousel Desk]
match 1NEH Night Sky's
match 2NEH Supporting the largest vessels from far-awa
match 1UASIN partially covered by dark canvas
match LEAVEDEPART [Temple of Hodierna, Berengaria's Bridge]
match 3BANK-3RD Grand Provincial Bank, Bursarium]
match STR-1ST [Imble's Ironworks, Foundry]
match 1JAIL-1ST [Ratha, High Guardhouse]
match METAL-2ND [Krrikt'k's Forge]
match HERB-1ST [Sisters-in-Lore, Herbal and Alchemical Supplies]
match ORIGAMI-3RD [Ratha, Ssivo's Migi Shagamat]
match PORTAL-1ST A sharp breeze whips a stinging fan
match WIS-3RD [Ratha, Small House]
match STABLE-4TH doorway leading into a supply
match LEAVESTABLE1 Stretching off into dimness, rows of individual stalls
match LEAVESTABLE2 [Ratha Stables, Supply Room]
match BAZAAR-1ST Muffled sounds erupt into
match CHECKLOCATION2 You glance
put look;glance
matchwait

CHECKLOCATION2:
pause
match LEAVEDIVINE2 [Oracle Veraclese, Divine Rialto]
match LEAVEDIVINE1A [Divine Rialto, Odds and Ends]
match LEAVEEXOTICS [Chabalu's Exotics, Showroom]
match LEAVEJEWELRY [Svra'an's Fine Jewelry]
match LEAVE3FORGE [Ss'ran's Forge, Shop]
match LEAVEMAJIK [Kalazashi's House of Majik]
match LEAVEMASKSA [The Raven's Mask and Leatherworks, Sales Room]
match LEAVEEMBOSSERA Embosser's Workshop]
match LEAVEHAIR [Dennats Baya]
match LEAVEINSTRUMENT [Elepaio's Luthierre]
match LEAVETAILOR [Amorand the Tailor]
match LEAVECHANDLERY [Captain Namazzi's Ship Goods]
match LEAVEHERMIT [Hermit's Shack]
match LEAVE1FORGE [Grimbly's Forge,
match FISH-1ST [Ratha Bait and Tackle]
match LEAVECARPETS [Paganell's Carpets]
match NOSTART You glance
put look;glance
matchwait

NOSTART:
echo
echo ======================================
echo *** You are not at a valid starting location
echo *** Please see the list above for valid locations
echo ======================================
echo
EXIT

#============
#DESTINATIONS
#============

1st:
1stt:
1stti:
1sttie:
1sttier:
tier1:
fir:
firs:
first:
firstt:
firstti:
firsttie:
firsttier:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match FINISH A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

rai:
raif:
findr:
findra:
findrai:
findraif:
loc:
lock:
locks:
locksm:
locksmi:
locksmit:
locksmith:
locksmiths:
key:
keyb:
keybl:
keybla:
keyblan:
keyblank:
keyblanks:
lockp:
lockpi:
lockpic:
lockpick:
lockpicks:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match GOFINDRAIF1 A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

baz:
baza:
bazaa:
BAZAAR:
bazar:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-BAZAAR A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-BAZAAR [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait


kra:
kra':
kra'h:
kra'he:
kra'hei:
kra'heis:
krah:
krahe:
krahei:
kraheis:
kra'heih:
kra'heiha:
kra'heihat:
kra'heihatc:
kra'heihatch:
kra'heihatchl:
kra'heihatchli:
kra'heihatchlin:
kra'heihatchling:
kra'heihatchlings:
kraheiha:
kraheihat:
kraheihatc:
kraheihatch:
kraheihatchl:
kraheihatchli:
kraheihatchlin:
kraheihatchling:
kraheihatchlings:
hat:
hatc:
hatch:
hatchl:
hatchli:
hatchlin:
hatchling:
hatchlings:
sew:
sewe:
sewer:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-KRA A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-KRA [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-KRA a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

cli:
clin:
clini:
clinic:
emp:
empa:
empat:
empaths:
pat:
path:
paths:
hea:
heal:
heale:
healer:
healers:
med:
medi:
medic:
medics:
hos:
hosp:
hospi:
hospit:
hospita:
hospital:
#   1ST TIER:
match ALREADYTHERE Treatment Room One]
match BANK-CLINIC [Lower Bank of Ratha, Atrium]
match GEMS-CLINIC [Mother Magpie's Gems and Metals]
match PAWN-CLINIC [Paedraig's Pawn]
match 1ST-CLINIC A wall of refuse
match VAULT-CLINIC [Ratha, The Carousel]
match MAMAS-CLINIC [MAMAS Company, Ratha Branch]
match NEH-CLINIC Wide and well-built,
match UARO-CLINIC [Uaro Dock, Port of Ratha]
match UASIN-CLINIC Workers, dressed in dark
match SEERAH-CLINIC The walk comes to an abrupt end
match SWAIN-CLINIC [Old Rat's Tavern, Back Room]
match INT-CLINIC [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

ban:
bank:
1ba:
1ban:
1bank:
bank1:
1stbank:
bank1st:
#   1ST TIER:
match CLINIC-BANK Treatment Room One]
match ALREADYTHERE [Lower Bank of Ratha, Atrium]
match GEMS-BANK [Mother Magpie's Gems and Metals]
match PAWN-BANK [Paedraig's Pawn]
match 1ST-BANK A wall of refuse
match VAULT-BANK [Ratha, The Carousel]
match MAMAS-BANK [MAMAS Company, Ratha Branch]
match NEH-BANK Wide and well-built,
match UARO-BANK [Uaro Dock, Port of Ratha]
match UASIN-BANK Workers, dressed in dark
match SEERAH-BANK The walk comes to an abrupt end
match SWAIN-BANK [Old Rat's Tavern, Back Room]
match INT-BANK [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

gem:
gems:
gemsh:
gemsho:
gemshop:
#   1ST TIER:
match CLINIC-GEMS Treatment Room One]
match BANK-GEMS [Lower Bank of Ratha, Atrium]
match ALREADYTHERE [Mother Magpie's Gems and Metals]
match PAWN-GEMS [Paedraig's Pawn]
match 1ST-GEMS A wall of refuse
match VAULT-GEMS [Ratha, The Carousel]
match MAMAS-GEMS [MAMAS Company, Ratha Branch]
match NEH-GEMS Wide and well-built,
match UARO-GEMS [Uaro Dock, Port of Ratha]
match UASIN-GEMS Workers, dressed in dark
match SEERAH-GEMS The walk comes to an abrupt end
match SWAIN-GEMS [Old Rat's Tavern, Back Room]
match INT-GEMS [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

paw:
pawn:
pawns:
pawnsh:
pawnsho:
pawnshop:
#   1ST TIER:
match CLINIC-PAWN Treatment Room One]
match BANK-PAWN [Lower Bank of Ratha, Atrium]
match GEMS-PAWN [Mother Magpie's Gems and Metals]
match ALREADYTHERE [Paedraig's Pawn]
match 1ST-PAWN A wall of refuse
match VAULT-PAWN [Ratha, The Carousel]
match MAMAS-PAWN [MAMAS Company, Ratha Branch]
match NEH-PAWN Wide and well-built,
match UARO-PAWN [Uaro Dock, Port of Ratha]
match UASIN-PAWN Workers, dressed in dark
match SEERAH-PAWN The walk comes to an abrupt end
match SWAIN-PAWN [Old Rat's Tavern, Back Room]
match INT-PAWN [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

HERB:
HERBs:
HERBsh:
HERBsho:
HERBshop:
alc:
alch:
alche:
alchem:
alchemy:
alchemi:
alchemis:
alchemist:
#   1ST TIER:
match CLINIC-HERB Treatment Room One]
match BANK-HERB [Lower Bank of Ratha, Atrium]
match GEMS-HERB [Mother Magpie's Gems and Metals]
match PAWN-HERB [Paedraig's Pawn]
match 1ST-HERB A wall of refuse
match VAULT-HERB [Ratha, The Carousel]
match MAMAS-HERB [MAMAS Company, Ratha Branch]
match NEH-HERB Wide and well-built,
match UARO-HERB [Uaro Dock, Port of Ratha]
match UASIN-HERB Workers, dressed in dark
match SEERAH-HERB The walk comes to an abrupt end
match SWAIN-HERB [Old Rat's Tavern, Back Room]
match INT-HERB [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

vau:
vaul:
vault:
vaults:
car:
caro:
carou:
carous:
carouse:
carousel:
squ:
squa:
squar:
square:
#   1ST TIER:
match CLINIC-VAULT Treatment Room One]
match BANK-VAULT [Lower Bank of Ratha, Atrium]
match GEMS-VAULT [Mother Magpie's Gems and Metals]
match PAWN-VAULT [Paedraig's Pawn]
match 1ST-VAULT A wall of refuse
match ALREADYTHERE [Ratha, The Carousel]
match MAMAS-VAULT [MAMAS Company, Ratha Branch]
match NEH-VAULT Wide and well-built,
match UARO-VAULT [Uaro Dock, Port of Ratha]
match UASIN-VAULT Workers, dressed in dark
match SEERAH-VAULT The walk comes to an abrupt end
match SWAIN-VAULT [Old Rat's Tavern, Back Room]
match INT-VAULT [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

fis:
fish:
fishi:
fishin:
fishing:
fishs:
fishsh:
fishsho:
fishshop:
tac:
tack:
tackl:
tackle:
tackles:
tacklesh:
tacklesho:
tackleshop:
bai:
bait:
baits:
baitsh:
baitsho:
baitshop:
baitandtackle:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-FISH A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

mam:
mama:
mamas:
wei:
weig:
weigh:
weight:
#   1ST TIER:
match CLINIC-MAMAS Treatment Room One]
match BANK-MAMAS [Lower Bank of Ratha, Atrium]
match GEMS-MAMAS [Mother Magpie's Gems and Metals]
match PAWN-MAMAS [Paedraig's Pawn]
match 1ST-MAMAS A wall of refuse
match VAULT-MAMAS [Ratha, The Carousel]
match ALREADYTHERE [MAMAS Company, Ratha Branch]
match NEH-MAMAS Wide and well-built,
match UARO-MAMAS [Uaro Dock, Port of Ratha]
match UASIN-MAMAS Workers, dressed in dark
match SEERAH-MAMAS The walk comes to an abrupt end
match SWAIN-MAMAS [Old Rat's Tavern, Back Room]
match INT-MAMAS [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

doc:
dock:
docks:
neh:
nehd:
nehdo:
nehdoc:
nehdock:
nehdocks:
kre:
kree:
kreel:
kreela:
kree'la:
ski:
skir:
skirr:
skirrl:
skirrlo:
skirrlol:
skirrlola:
skirrlolas:
skirrlolasu:
skirr':
skirr'l:
skirr'lo:
skirr'lol:
skirr'lola:
skirr'lolas:
skirr'lolasu:
cro:
cros:
cross:
crossi:
crossin:
crossing:
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
#   1ST TIER
match CLINIC-NEH Treatment Room One]
match BANK-NEH [Lower Bank of Ratha, Atrium]
match GEMS-NEH [Mother Magpie's Gems and Metals]
match PAWN-NEH [Paedraig's Pawn]
match 1ST-NEH A wall of refuse
match VAULT-NEH [Ratha, The Carousel]
match MAMAS-NEH [MAMAS Company, Ratha Branch]
match ALREADYTHERE Wide and well-built,
match UARO-NEH [Uaro Dock, Port of Ratha]
match UASIN-NEH Workers, dressed in dark
match SEERAH-NEH The walk comes to an abrupt end
match SWAIN-NEH [Old Rat's Tavern, Back Room]
match INT-NEH [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

uar:
uaro:
uarod:
uarodo:
uarodoc:
uarodock:
uarodocks:
uard:
uardd:
uarddo:
uarddoc:
uarddock:
uardocks:
hal:
hala:
halas:
halasa:
sel:
selh:
selhi:
selhin:
halasas:
halasase:
halasasel:
halasaselh:
halasaselhi:
halasaselhin:
aes:
aesr:
aesry:
sur:
surl:
surla:
surlae:
surlaen:
surlaeni:
surlaenis:
surlaenisa:
#   1ST TIER:
match CLINIC-UARO Treatment Room One]
match BANK-UARO [Lower Bank of Ratha, Atrium]
match GEMS-UARO [Mother Magpie's Gems and Metals]
match PAWN-UARO [Paedraig's Pawn]
match 1ST-UARO A wall of refuse
match VAULT-UARO [Ratha, The Carousel]
match MAMAS-UARO [MAMAS Company, Ratha Branch]
match NEH-UARO Wide and well-built,
match ALREADYTHERE [Uaro Dock, Port of Ratha]
match UASIN-UARO Workers, dressed in dark
match SEERAH-UARO The walk comes to an abrupt end
match SWAIN-UARO [Old Rat's Tavern, Back Room]
match INT-UARO [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

uas:
uasi:
uasin:
uasind:
uasindo:
uasindoc:
uasindock:
uasindocks:
har:
hara:
haraj:
haraja:
harajaa:
harajaal:
hara':
hara'j:
hara'ja:
hara'jaa:
hara'jaal:
tas:
tasi:
tasia:
tasia':
tasia'z:
tasia'za:
tasia'zau:
tasia'zaul:
tasiaz:
tasiaza:
tasiazau:
tasiazaul:
#   1ST TIER:
match CLINIC-UASIN Treatment Room One]
match BANK-UASIN [Lower Bank of Ratha, Atrium]
match GEMS-UASIN [Mother Magpie's Gems and Metals]
match PAWN-UASIN [Paedraig's Pawn]
match 1ST-UASIN A wall of refuse
match VAULT-UASIN [Ratha, The Carousel]
match MAMAS-UASIN [MAMAS Company, Ratha Branch]
match NEH-UASIN Wide and well-built,
match UARO-UASIN [Uaro Dock, Port of Ratha]
match ALREADYTHERE Workers, dressed in dark
match SEERAH-UASIN The walk comes to an abrupt end
match SWAIN-UASIN [Old Rat's Tavern, Back Room]
match INT-UASIN [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

see:
seer:
seera:
seerah:
spr:
spri:
sprit:
sprite:
sprites:
san:
sand:
sands:
sandsp:
sandspr:
sandspri:
sandsprit:
sandsprite:
sandsprites:
cra:
crab:
crabs:
lah:
lahe:
lahek:
laheke:
la':
la'h:
la'he:
la'hek:
la'heke:
#   1ST TIER:
match CLINIC-SEERAH Treatment Room One]
match BANK-SEERAH [Lower Bank of Ratha, Atrium]
match GEMS-SEERAH [Mother Magpie's Gems and Metals]
match PAWN-SEERAH [Paedraig's Pawn]
match 1ST-SEERAH A wall of refuse
match VAULT-SEERAH [Ratha, The Carousel]
match MAMAS-SEERAH [MAMAS Company, Ratha Branch]
match NEH-SEERAH Wide and well-built,
match UARO-SEERAH [Uaro Dock, Port of Ratha]
match UASIN-SEERAH Workers, dressed in dark
match ALREADYTHERE The walk comes to an abrupt end
match SWAIN-SEERAH [Old Rat's Tavern, Back Room]
match INT-SEERAH [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

baw:
bawd:
bawdy:
bawdys:
bawdysw:
bawdyswa:
bawdyswai:
bawdyswain:
bawdyswains:
swa:
swai:
swain:
swains:
ref:
refl:
refle:
reflex:
#   1ST TIER:
match CLINIC-SWAIN Treatment Room One]
match BANK-SWAIN [Lower Bank of Ratha, Atrium]
match GEMS-SWAIN [Mother Magpie's Gems and Metals]
match PAWN-SWAIN [Paedraig's Pawn]
match 1ST-SWAIN A wall of refuse
match VAULT-SWAIN [Ratha, The Carousel]
match MAMAS-SWAIN [MAMAS Company, Ratha Branch]
match NEH-SWAIN Wide and well-built,
match UARO-SWAIN [Uaro Dock, Port of Ratha]
match UASIN-SWAIN Workers, dressed in dark
match SEERAH-SWAIN The walk comes to an abrupt end
match ALREADYTHERE [Old Rat's Tavern, Back Room]
match INT-SWAIN [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

chan:
chand:
chandl:
chandle:
chandler:
chandlery:
chandlers:
chandlersh:
chandlersho:
chandlershop:
chandlerys:
chandlerysh:
chandlerysho:
chandleryshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-CHANDLERY A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match ALREADYTHERE [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

herm:
hermit:
hermits:
hermitsh:
hermitsho:
hermitshop:
hermitsha:
hermitshac:
hermitshack:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-HERMIT A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match ALREADYTHERE [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
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
inteli:
intelig:
intelige:
inteligen:
inteligenc:
inteligence:
#   1ST TIER:
match CLINIC-INT Treatment Room One]
match BANK-INT [Lower Bank of Ratha, Atrium]
match GEMS-INT [Mother Magpie's Gems and Metals]
match PAWN-INT [Paedraig's Pawn]
match 1ST-INT A wall of refuse
match VAULT-INT [Ratha, The Carousel]
match MAMAS-INT [MAMAS Company, Ratha Branch]
match NEH-INT Wide and well-built,
match UARO-INT [Uaro Dock, Port of Ratha]
match UASIN-INT Workers, dressed in dark
match SEERAH-INT The walk comes to an abrupt end
match SWAIN-INT [Old Rat's Tavern, Back Room]
match ALREADYTHERE [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

str:
stre:
stren:
streng:
strengt:
strength:
#   1ST TIER:
match CLINIC-STR Treatment Room One]
match BANK-STR [Lower Bank of Ratha, Atrium]
match GEMS-STR [Mother Magpie's Gems and Metals]
match PAWN-STR [Paedraig's Pawn]
match 1ST-STR A wall of refuse
match VAULT-STR [Ratha, The Carousel]
match MAMAS-STR [MAMAS Company, Ratha Branch]
match NEH-STR Wide and well-built,
match UARO-STR [Uaro Dock, Port of Ratha]
match UASIN-STR Workers, dressed in dark
match SEERAH-STR The walk comes to an abrupt end
match SWAIN-STR [Old Rat's Tavern, Back Room]
match INT-STR [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

1ja:
1jai:
1JAIL:
1pr:
1pri:
1pris:
1priso:
1prison:
ja1:
jai1:
jail1:
pr1:
pri1:
pris1:
priso1:
prison1:
gua:
guar:
guard:
guardh:
guardho:
guardhou:
guardhous:
guardhouse:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-1JAIL A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-1ST a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

jai:
jail:
pri:
pris:
priso:
prison:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-1JAIL A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-3JAIL a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

wed:
wedd:
weddi:
weddin:
wedding:
weddingp:
weddingpo:
weddingpor:
weddingport:
weddingporta:
weddingPORTAL:
pre:
prem:
premi:
premie:
premiu:
premium:
premiump:
premiumpo:
premiumpor:
premiumport:
premiumporta:
premiumPORTAL:
por:
port:
porta:
PORTAL:
sea:
seac:
seaca:
seacav:
seacave:
seacaves:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-PORTAL A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-1ST [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-3JAIL a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait


#=================
#2nd Tier Destinations
#=================

2nd:
2ndt:
2ndti:
2ndtie:
2ndtier:
tier2:
sec:
seco:
secon:
second:
secondt:
secondti:
secondtie:
secondtier:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match AGI-2ND [Antellius' Weapons Training]
match FINISH [Ratha Bazaar, Grand Pavilion]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

tail:
tailo:
tailor:
tailors:
tailorsh:
tailorsho:
tailorshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match AGI-2ND [Antellius' Weapons Training]
match 2ND-TAILOR [Ratha Bazaar, Grand Pavilion]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait


met:
meta:
METAL:
METALr:
METALre:
METALrep:
METALrepa:
METALrepai:
METALrepair:
rep:
repa:
repai:
repair:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-METAL [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

fur:
furr:
furri:
furrie:
furrier:
tan:
tann:
tanne:
tanner:
tannery:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match ALREADYTHERE [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-FURRIER [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

hai:
hair:
hairc:
hairca:
haircar:
haircare:
hairs:
hairsh:
hairsho:
hairshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match ALREADYTHERE [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-HAIR [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

ins:
inst:
instr:
instru:
instrum:
instrume:
instrumen:
instrument:
instruments:
instrumentsh:
instrumentsho:
instrumentshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match ALREADYTHERE [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-INSTRUMENT [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

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
mas:
mask:
masks:
masksh:
masksho:
maskshop:
maskss:
maskssh:
maskssho:
masksshop:
emb:
embo:
embos:
emboss:
embossi:
embossin:
embossing:
embossings:
embossingsh:
embossingsho:
embossingshop:
embosse:
embosser:
embossers:
embossersh:
embossersho:
embossershop:
leathere:
leatherem:
leatheremb:
leatherembo:
leatherembos:
leatheremboss:
leatherembossi:
leatherembossin:
leatherembossing:
leatherembosse:
leatherembosser:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match ALREADYTHERE [The Raven's Mask and Leatherworks, Workroom]
match 2ND-LEATHER [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

agi:
agil:
agili:
agilit:
agility:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-2ND A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-AGI [Ratha Bazaar, Grand Pavilion]
match ALREADYTHERE [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-2ND a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

#=================
#3RD Tier Destinations
#=================

3RD:
3RDt:
3RDti:
3RDtie:
3RDtier:
tier3:
thi:
thir:
third:
thirdt:
thirdti:
thirdtie:
thirdtier:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match FINISH a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

div:
divi:
divin:
divine:
divines:
divinesh:
divinesho:
divineshop:
diviner:
divineri:
divineria:
divinerial:
divinerialt:
divinerialto:
ria:
rial:
rialt:
rialto:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-DIVINE a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

jew:
jewe:
jewel:
jewels:
jewelr:
jewelry:
jewelrys:
jewelrysh:
jewelrysho:
jewelryshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-JEWELRY a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait


gre:
gree:
green:
the:
theg:
thegr:
thegre:
thegree:
thegreen:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match ALREADYTHERE [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-GREEN a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

tai:
tais:
taisg:
taisga:
taisgat:
taisgath:
phe:
phel:
pheli:
phelim:
phelims:
phelim's:
phelimtemple:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match ALREADYTHERE [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-TAISGATH a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

deb:
debt:
debto:
debtof:
debtoff:
debtoffi:
debtoffic:
debtoffice:
debtor:
debtors:
debts:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match ALREADYTHERE [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-DEBT a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

3ba:
3ban:
3BANK:
bank3:
3RDbank:
bank3RD:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-3BANK a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

3jai:
3JAIL:
3pri:
3pris:
3priso:
3prison:
ja3:
jai3:
jail3:
pr3:
pri3:
pris3:
priso3:
prison3:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match ALREADYTHERE [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-3JAIL a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

dis:
disc:
disci:
discip:
discipl:
discipli:
disciplin:
discipline:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match ALREADYTHERE [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-DIS a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

char:
chari:
charis:
charism:
charisma:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match ALREADYTHERE [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-CHA a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

wis:
wisd:
wisdo:
wisdom:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match ALREADYTHERE [Ratha, Small House]
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-WIS a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

stam:
stami:
stamin:
stamina:
war:
warm:
warma:
warmag:
warmage:
warmageg:
warmagegu:
warmagegui:
warmageguil:
warmageguild:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match ALREADYTHERE [Warrior Mage Guild, Testing Chamber]
match 3RD-STA a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

maj:
maji:
majik:
majick:
majiks:
majiksh:
majiksho:
majikshop:
majicks:
majicksh:
majicksho:
majickshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match ALREADYTHERE [Warrior Mage Guild, Testing Chamber]
match 3RD-MAJIK a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

ori:
orig:
origa:
origam:
ORIGAMI:
ORIGAMIs:
ORIGAMIsh:
ORIGAMIsho:
ORIGAMIshop:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-ORIGAMI a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

exo:
exot:
exoti:
exotic:
exotics:
exoticsh:
exoticsho:
exoticshop:
exoticss:
exoticssh:
exoticssho:
exoticsshop:
chab:
chaba:
chabal:
chabalu:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-EXOTICS a smoke-stained wooden shack
match ALREADYTHERE [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

dob:
dobe:
dobek:
dobeks:
mor:
moru:
morur:
morury:
moruryn:
moruryns:
morun:
moruny:
morunyn:
morunyns:
urr:
urrem:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-MORURYN a smoke-stained wooden shack
match ALREADYTHERE [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

alt:
alta:
altar:
dep:
depa:
depar:
depart:
dea:
deat:
death:
dead:
ber:
bere:
beren:
bereng:
berenga:
berengar:
berengari:
berengaria:
berengaria':
berengaria's:
berengarias:
berengaria'stemple:
berengariastemple:
berengariatemple:
hod:
hodi:
hodie:
hodier:
hodiern:
hodierna:
hodierna':
hodierna's:
hodiernas:
hodierna'stemple:
hodiernastemple:
hodiernatemple:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-DEPART a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

#=================
#4th Tier Destinations
#=================

4th:
4tht:
4thti:
4thtie:
4thtier:
tier4:
fou:
four:
fourt:
fourth:
fourtht:
fourthti:
fourthtie:
fourthtier:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-4TH a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match FINISH walkways here become expansive plazas
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

stab:
stabl:
STABLE:
Stables:
hor:
hors:
horse:
horses:
horsest:
horsesta:
horsestab:
horsestabl:
horseSTABLE:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-4TH a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match 4TH-STABLE walkways here become expansive plazas
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

bea:
beac:
beach:
und:
unde:
undea:
undead:
spe:
spec:
spect:
spectr:
spectra:
spectral:
pir:
pira:
pirat:
pirate:
pirates:
ske:
skel:
skele:
skelet:
skeleta:
skeletal:
sai:
sail:
sailo:
sailor:
sailors:
deaths:
deathsp:
deathspi:
deathspir:
deathspiri:
deathspirit:
deathspirits:
spi:
spir:
spiri:
spirit:
spirits:
dar:
dark:
darks:
darksp:
darkspi:
darkspir:
darkspiri:
darkspirit:
darkspirits:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-UNDEAD a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match ALREADYTHERE path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

leu:
leuc:
leucr:
leucro:
leucros:
sil:
silv:
silve:
silver:
silverl:
silverle:
silverleu:
silverleuc:
silverleucr:
silverleucro:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-LEUCRO a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match ALREADYTHERE Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

mer:
merr:
merro:
merrow:
merrows:
selk:
selki:
selkie:
selkies:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-MERROW a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match ALREADYTHERE An algae-stained precipice
match POKE-3RD [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

pok:
poke:
pokek:
pokeke:
pokekeh:
pokekehe:
pokekehek:
pokekeheke:
pokekehekep:
pokekehekepi:
pokey:
pokie:
kor:
korg:
korgi:
dol:
dolo:
dolom:
doloma:
dolomar:
dolomars:
wark:
warkl:
warkli:
warklin:
warklins:
mau:
maul:
maule:
mauler:
maulers:
mal:
malc:
malch:
malcha:
malchat:
malchata:
#   1ST TIER:
match CLINIC-1ST Treatment Room One]
match BANK-1ST [Lower Bank of Ratha, Atrium]
match GEMS-1ST [Mother Magpie's Gems and Metals]
match PAWN-1ST [Paedraig's Pawn]
match 1ST-3RD A wall of refuse
match VAULT-1ST [Ratha, The Carousel]
match MAMAS-1ST [MAMAS Company, Ratha Branch]
match NEH-1ST Wide and well-built,
match UARO-1ST [Uaro Dock, Port of Ratha]
match UASIN-1ST Workers, dressed in dark
match SEERAH-1ST The walk comes to an abrupt end
match SWAIN-1ST [Old Rat's Tavern, Back Room]
match INT-1ST [Jack Tarr's Rest, Darkened Corner]
#   2ND TIER
match FURRIER-2ND [Furrier's Shop]
match LEATHER-2ND [The Raven's Mask and Leatherworks, Workroom]
match 2ND-3RD [Ratha Bazaar, Grand Pavilion]
match AGI-2ND [Antellius' Weapons Training]
#   3RD TIER
match GREEN-3RD [Truffenyi's Green]
match TAISGATH-3RD [Phelim's Temple, Planetarium]
match DEBT-3RD [Sshoi-sson Palace, Debtor's Hall]
match JAIL-3RD [Office of the Malk'smo]
match DIS-3RD [Kertigen's Temple, Meditation Chamber]
match CHA-3RD [Faenella's Temple, Priest's Quarters]
match 4TH-3RD walkways here become expansive plazas
match STA-3RD [Warrior Mage Guild, Testing Chamber]
match 3RD-POKE a smoke-stained wooden shack
match MORURYN-3RD [Urrem'tier's Temple, Dark Alcove]
#   4TH TIER
match UNDEAD-3RD path winds through the rubbish
match UNDEAD-3RD Shady elms grow on either side
match MERROW-3RD An algae-stained precipice
match ALREADYTHERE [Pokekehekepi beachhead]
match CHECKLOCATION1 You glance
put look;glance
matchwait

#===========
#TIER TO TIER
#===========

HERB-1ST:
pause
move out
move sw
move sw 
move w
goto %1

METAL-2ND:
pause
move go arch
move out
move nw
move nw
move nw
move n
move nw
move nw
move w
move sw
goto %1

ORIGAMI-3RD:
pause
move out
move ne
goto %1

1ST-2ND:
pause
move go broken grating

GROUPCHECK1:
pause
match NOGROUP1 No one!
match GROUPWAIT1 You have:
matchre GROUPCHECK1 Sorry, you may only|\.\.\.wait
put assess group;wealth
matchwait

GROUPWAIT1:
echo
echo
echo *** Whispering to your group to follow you into the passage
echo
put whisper group GO PASSAGE and then rejoin me! Hurry!
pause
move go passage
goto GROUPWAITING1

GROUPWAITING1:
SAVE GROUPWAITING1
echo
echo =================================
echo *** When your group is back together, type GLANCE
echo *** Kra'hei hatchlings in this area - PAY ATTENTION ! !
echo =================================
echo
match 001 You glance
matchre RETREAT advance on you|range on you
matchwait

NOGROUP1:
move go passage
goto 001

001:
save 001
match 002 the slip of a loose brick
match RETREAT engaged
match UNGUARD Although tempted to move,
put nw 
matchwait

002:
save 002
match 003 touch of a drop of water
match RETREAT engaged
put sw
matchwait

003:
save 003
match 004 touch of a feathery
match RETREAT engaged
put w
matchwait

004:
save 004
match 005 the feel of soft, yielding mud
match RETREAT engaged
put up
matchwait

005:
save 005
match 006 [The Sewers, Beneath the Drain]
match RETREAT engaged
put go obscure opening
matchwait

006:
pause
move go gilded drain
goto %1

2ND-1ST:
pause
move go gilded drain 
move go obscure opening

007:
save 007
match 008 the touch of a feathery,
match RETREAT engaged
match UNGUARD Although tempted to move,
put down
matchwait

008:
save 008
match 009 pungent, spicy aroma
match RETREAT engaged
put ne
matchwait

009:
save 009
match 010 the feel of soft, yielding mud
match RETREAT engaged
put se
matchwait

010:
save 010
match 011 an odd whiff of incense
match RETREAT engaged
match UNGUARD Although tempted to move,
put e
matchwait

011:
save 011
match 012 The Sewers, Beneath the Drain]
match RETREAT engaged
match UNGUARD Although tempted to move,
put go passage
matchwait

012:
GROUPCHECK4:
pause
match NOGROUP4 No one!
match GROUPWAIT4 You have:
matchre GROUPCHECK4 Sorry, you may only|\.\.\.wait
put assess group;wealth
matchwait

GROUPWAIT4:
echo
echo
echo *** Whispering to your group to follow you through the grating
echo
put whisper group GO GRATING and then rejoin me!
pause
move go broken grating
goto GROUPWAITING4

GROUPWAITING4:
SAVE GROUPWAITING4
echo
echo =================================
echo *** When your group is back together, type GLANCE
echo =================================
echo
waitfor You glance
goto GROUPDONE4

NOGROUP4:
move go broken grating
goto GROUPDONE4

GROUPDONE4:
goto %1

1ST-3RD:
pause
move go broken grating

GROUPCHECK2:
pause
match NOGROUP2 No one!
match GROUPWAIT2 You have:
matchre GROUPCHECK2 Sorry, you may only|\.\.\.wait
put assess group;wealth
matchwait

GROUPWAIT2:
echo
echo
echo *** Whispering to your group to follow you into the passage
echo
put whisper group GO PASSAGE and then rejoin me! Hurry!
pause
move go passage
goto GROUPWAITING2

GROUPWAITING2:
SAVE GROUPWAITING2
echo
echo =================================
echo *** When your group is back together, type GLANCE
echo *** Kra'hei hatchlings in this area - PAY ATTENTION ! !
echo =================================
echo
match 013 You glance
matchre RETREAT advance on you|range on you
matchwait

NOGROUP2:
move go passage
goto 013

013:
save 013
match 014 the slip of a loose brick
match RETREAT engaged
match UNGUARD Although tempted to move,
put nw
matchwait

014:
save 014
match 015 the touch of a drop of water
match RETREAT engaged
put sw
matchwait

015:
save 015
match 016 the touch of a feathery,
match RETREAT engaged
put w
matchwait

016:
save 016
match 017 odd whiff of incense
match RETREAT engaged
put up
matchwait

017:
save 017
match 018 the chill of a clammy breeze
match RETREAT engaged
put n
matchwait

018:
save 018
match 019 something silent brushing past
match RETREAT engaged
put up
matchwait

019:
save 019
match 020 tang of the salt sea
match RETREAT engaged
put nw
matchwait

020:
save 020
match 021 the smell of fish, fresh
match RETREAT engaged
put w
matchwait

021:
save 021
match 022 [The Sewers, Beneath the Grating]
match RETREAT engaged
put go narrow crevice
matchwait

022:
pause
move go sewer grating
goto %1

3RD-1ST:
pause
move go sewer grating
move go narrow crevice

023:
save 023
match 024 tang of the salt sea
match RETREAT engaged
match UNGUARD Although tempted to move,
put e
matchwait

024:
save 024
match 025 something silent brushing past
match RETREAT engaged
put se
matchwait

025:
save 025
match 026 the reek of mold
match RETREAT engaged
put down
matchwait

026:
save 026
match 027 odd whiff of incense
match RETREAT engaged
put s
matchwait

027:
save 027
match 028 the touch of a feathery,
match RETREAT engaged
put down
matchwait

028:
save 028
match 029 pungent, spicy aroma
match RETREAT engaged
put ne
matchwait

029:
save 029
match 030 the feel of soft, yielding mud
match RETREAT engaged
put se
matchwait

030:
save 030
match 031 an odd whiff of incense
match RETREAT engaged
match UNGUARD Although tempted to move,
put e
matchwait

031:
save 031
match 032 [The Sewers, Beneath the Drain]
match RETREAT engaged
match UNGUARD Although tempted to move,
put go passage
matchwait

032:
GROUPCHECK3:
pause
match NOGROUP3 No one!
match GROUPWAIT3 You have:
matchre GROUPCHECK3 Sorry, you may only|\.\.\.wait
put assess group;wealth
matchwait

GROUPWAIT3:
echo
echo
echo *** Whispering to your group to follow you through the grating
echo
put whisper group GO GRATING and then rejoin me!
pause
move go broken grating
goto GROUPWAITING3

GROUPWAITING3:
SAVE GROUPWAITING3
echo
echo =================================
echo *** When your group is back together, type GLANCE
echo =================================
echo
waitfor You glance
goto GROUPDONE3

NOGROUP3:
move go broken grating
goto GROUPDONE3

GROUPDONE3:
goto %1

2ND-3RD:
pause
move go gilded drain 
move go obscure opening

033:
save 033
match 034 the reek of mold
match RETREAT engaged
match UNGUARD Although tempted to move,
put n
matchwait

034:
save 034
match 035 something silent brushing past
match RETREAT engaged
put up
matchwait

035:
save 035
match 036 the tang of the salt sea
match RETREAT engaged
put nw
matchwait

036:
save 036
match 037 the smell of fish, fresh
match RETREAT engaged
put w
matchwait

037:
save 037
match 038 [The Sewers, Beneath the Grating]
match RETREAT engaged
put go narrow crevice
matchwait

038:
pause
move go sewer grating
goto %1

3RD-2ND:
pause
move go sewer grating
move go crevice

039:
save 039
match 040 tang of the salt sea
match RETREAT engaged
match UNGUARD Although tempted to move,
put e
matchwait

040:
save 040
match 041 something silent brushing past
match RETREAT engaged
put se
matchwait

041:
save 041
match 042 the reek of mold
match RETREAT engaged
put down
matchwait

042:
save 042
match 043 odd whiff of incense
match RETREAT engaged
put s
matchwait

043:
save 043
match 044 [The Sewers, Beneath the Drain]
match RETREAT engaged
put go obscure opening
matchwait

044:
pause
move go gilded drain
goto %1

RETREAT:
matchre retreat You retreat back to pole range|still stunned
match %s You retreat from combat.
matchre pause \.\.\.wait|type ahead
put retreat
matchwait

UNGUARD:
pause
put guard stop
goto %s

#====================
#LOCATIONS TO 1ST TIER
#====================
CLINIC-HERB:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

LEAVECASHIER:
LEAVEBURSAR:
LEAVEBOURSE:
pause
move go atrium
goto %1

PORTICOB:
pause
move go door
goto %1

GEMS-HERB:
pause
move out
move w
move nw
move n
move n
move nw
move nw
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

PAWN-HERB:
pause
move out
move ne
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

VAULT-HERB:
pause
move out
move out
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

MAMAS-HERB:
pause
move out
move s
move s
move ne
move e
move e
move e
move ne
move e
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

1NEH:
pause
move n
goto %1

2NEH:
pause
move n
move n
goto %1

NEH-HERB:
pause
move n
move e
move ne
move e
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

UARO-HERB:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
move ne
move e
move e
move e
move ne
move e
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

1UASIN:
pause
move go ramp
UASIN-HERB:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

SEERAH-HERB:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
move ne
move e
move e
move e
move ne
move e
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

SWAIN-HERB:
pause
move e
move go door
move out
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

INT-HERB:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

STR-1ST:
pause
move climb step
move go door
move e
move e
move se
move e
move e
move e
move e
move sw
move w
goto %1

#====================
#1ST TIER TO LOCATIONS
#====================
1ST-CLINIC:
pause
move e
move ne
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
move nw
move w
move n
move ne
move n
move ne
move ne
move e
move go clinic
move e
move go room one
pause
echo
echo *** Whew!  Made it!
echo *** You are at the Clinic
echo    (lie down to be healed)
echo
goto FINISH

1ST-BANK:
pause
move e
move ne
move se
move s
move se
move se
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH

1ST-GEMS:
pause
move e
move ne
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
move se
move se
move s
move s
move se
move e
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH

1ST-PAWN:
pause
move e
move ne
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

1ST-VAULT:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move w
move nw
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

1ST-FISH:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move w
move nw
move w
move go bait shop
pause
echo
echo *** You are at the fishing supply shop
echo
goto FINISH

1ST-MAMAS:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move w
move nw
move w
move sw
move w
move w
move w
move sw
move n
move n
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

1ST-NEH:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move w
move nw
move w
move sw
move w
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

1ST-UARO:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move w
move nw
move w
move sw
move w
move w
move w
move sw
move w
move sw
move w
move w
move sw
move sw
move go ramp
pause
echo
echo *** The Uaro Dock
echo *** The Halasa Selhin sails for Aesry
echo
goto FINISH

1ST-UASIN:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move e
move e
move e
move e
move e
move s
move se
move se
move ne
move w
move go dock
pause
echo
echo *** The Uasin Dock
echo *** Up the ramp the Tasia'zaul sails for Hara'Jaal
echo *** You must have completed a quest to get past Kretsky
echo *** And Kretsky ALWAYS charges a gold to go up the ramp
echo
goto FINISH

1ST-SEERAH:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move w
move nw
move w
move sw
move w
move w
move w
move sw
move w
move sw
move w
move w
move sw
move sw
move w
move sw
move sw
pause
echo
echo *** Go Gap to the Seerah wreck
echo *** sand sprites, crabs, la'heke
echo
goto FINISH

1ST-SWAIN:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move e
move e
move e
move e
move go tavern
move go door
move west
pause
echo
echo *** Bawdy Swains
echo *** You can train Reflex here
echo
put hide
goto FINISH

1ST-CHANDLERY:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move e
move e
move e
move e
move e
move n
move go chandlery
pause
echo
echo *** You are at the Captain Namazzi's Chandlery
echo
goto FINISH

1ST-HERMIT:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move e
move e
move e
move e
move e
move s
move se
move se
move ne
move se
move e
move e
move ne
move e
move ne
move n
move go narrow crevice
move go trail
move go canvas door
pause
echo
echo *** You are at the hermit shack
echo
goto FINISH

1ST-INT:
pause
move e
move ne
move ne
move ne
move e
move ne
move e
move e
move se
move se
move go Tarr Rest
move go swinging door
move go common room
move go darkened corner
pause
echo
echo *** Train Intelligence Here
echo
goto FINISH

1ST-STR:
pause
move e
move ne
move w
move w
move w
move w
move nw
move w
move w
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

1ST-1JAIL:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move go guardhouse
pause
echo
echo *** Welcome to jail, you filthy scoundrel!
echo *** If you meant to go to the 3RD tier jail you should enter "3JAIL" as your destination
echo
goto FINISH

1ST-PORTAL:
pause
move e
move ne
move se
move s
move se
move se
move s
move s
move s
move e
pause
echo
echo *** You are at the premium and event PORTALs
echo *** Warning! Bawdy swain roam the street here!
echo
goto FINISH

#====================
#LOCATIONS TO 2ND TIER
#====================
FURRIER-2ND:
pause
move out
move e
move e
move s
move se
move e
move e
move ne
move e
move e
move e
move e
move sw
goto %1

LEATHER-2ND:
pause
move go sales room
masksb:
embosserb:
move out
move e
move ne
move e
move e
move e
move e
move sw
goto %1

AGI-2ND:
pause
move out
move se
move e
move ne
move e
move e
move e
move se
move e
move se
move e
move n
move n
move ne
move n
move n
move nw
move nw
move w
move sw
goto %1

#=====================
#2ND TIER TO LOCATIONS
#=====================

2ND-FURRIER:
pause
move ne
move w
move w
move w
move w
move sw
move w
move w
move nw
move n
move w
move w
move go building
pause
echo
echo *** You are at the Furrier
echo
goto FINISH
EXIT

2ND-TAILOR:
pause
move ne
move e
move e
move go painted shop
pause
echo
echo *** You are at the tailor
echo
goto FINISH
EXIT

2ND-HAIR:
pause
move ne
move w
move w
move w
move w
move sw
move w
move w
move nw
move n
move w
move go small shop
pause
echo
echo *** You are at the Hair Care shop
echo
goto FINISH
EXIT

2ND-INSTRUMENT:
pause
move ne
move w
move w
move w
move w
move sw
move w
move w
move nw
move n
move w
move w
move ne
move nw
move nw
move sw
move s
move go tiny shop
pause
echo
echo *** You are at the instrument shop
echo
goto FINISH
EXIT

2ND-LEATHER:
pause
move ne
move w
move w
move w
move w
move sw
move w
move go oak shop
move go work room
pause
echo
echo *** You are at the Leather Repair
echo *** To purchase leather masks, GO ROOM
echo *** To see the leather embosser, GO ROOM then GO ALCOVE
echo
goto FINISH
EXIT

2ND-AGI:
pause
move ne
move e
move se
move se
move s
move s
move sw
move s
move s
move w
move nw
move w
move nw
move w
move w
move w
move sw
move w
move nw
move go building
pause
echo
echo *** Train Agility here
echo
goto FINISH
EXIT

#=====================
#LOCATIONS TO 3RD TIER
#=====================
GREEN-3RD:
pause
move s
move w
move w
move nw
move ne
goto %1

TAISGATH-3RD:
pause
move go doorway
move climb step
move nw
move nw
move w
move w
move s
move sw
move sw
move sw
move ne
goto %1

DEBT-3RD:
pause
move out
move out
move go door
move climb stai
move s
move s
move go gate
move e
move n
move ne
move n
move nw
move ne
goto %1

3BANK-3RD:
pause
move w
move w
move go door
move climb stai
move s
move s
move go gate
move e
move n
move ne
move n
move nw
move ne
goto %1

JAIL-3RD:
pause
move out
move s
move s
move e
move ne
goto %1

DIS-3RD:
pause
move up
move out
move n
move n
move go door
move n
move up
move ne
move up
move e
move ne
move ne
move e
move e
move s
move se
move se
move se
move e
move e
move ne
goto %1

CHA-3RD:
pause
move out
move out
move go gap
move e
move s
move se
move se
move se
move e
move e
move ne
goto %1

WIS-3RD:
pause
move out
move s
move s
move s
move s
move e
move ne
goto %1

STA-3RD:
pause
move out
move go gate
move sw
move w
move s
move se
move se
move se
move e
move e
move ne
goto %1

MORURYN-3RD:
pause
move out
move out
move sw
move s
move s
move w
move w
move nw
move ne
goto %1


#=====================
#3RD TIER TO LOCATONS
#=====================
3RD-DIVINE:
pause
move ne
move ne
move go ornate shop
pause
echo
echo *** You are at the Divine Rialto shop
echo
goto FINISH

3RD-JEWELRY:
pause
move ne
move ne
move n
move w
move nw
move ne
move go jewelry shop
pause
echo
echo *** You are at the Jewelry Shop
echo
goto FINISH

3RD-GREEN:
pause
move sw
move se
move e
move e
move n
pause
echo
echo *** You are at the Green
echo  (official hangout of the 3RD tier)
echo
goto FINISH

3RD-TAISGATH:
pause
move sw
move se
move e
move e
move e
move se
move n
move n
move climb step
move go building
pause
echo
echo *** You are in Phelim's Temple
echo *** Through that moongate is the isle of Taisgath
echo
goto FINISH
EXIT

3RD-DEBT:
pause
move sw
move se
move s
move sw
move s
move w
move go gate
move n
move n
move climb stair
move go door
move go hall
move go collection office
pause
echo
echo *** You are at the Debt Collector's office
echo
goto FINISH

3RD-3BANK:
pause
move sw
move se
move s
move sw
move s
move w
move go gate
move n
move n
move climb stair
move go door
move e
move e
pause
echo
echo *** You are at the 3RD tier Bank
echo
goto FINISH

3RD-3JAIL:
pause
move sw
move w
move n
move n
move go office
pause
echo
echo *** Welcome to jail, you dirty crook!
echo *** If you meant to go to the 1st tier jail then choose "1JAIL" as your destination
echo
goto FINISH

3RD-DIS:
pause
move sw
move w
move w
move sw
move w
move w
move w
move sw
move n
move n
move w
move down
move sw
move down
move s
move go entrance
move s
move s
move go door
move down
pause
echo
echo *** Train Discipline Here
echo
goto FINISH

3RD-CHA:
pause
move sw
move w
move w
move nw
move nw
move nw
move n
move w
move s
move go round building
move w
pause
echo
echo *** Train Charisma Here
echo  (If you want to waste your TDPs)
echo
goto FINISH

3RD-WIS:
pause
move sw
move w
move n
move n
move n
move n
move go house
pause
echo
echo *** Train Wisdom Here
echo
goto FINISH

3RD-STA:
pause
move sw
move w
move w
move nw
move nw
move nw
move n
move e
move ne
move go gate
move go arch
pause
echo
echo *** Train Stamina Here
echo
goto FINISH

3RD-MAJIK:
pause
move sw
move w
move w
move nw
move nw
move nw
move n
move go tile shop
pause
echo
echo *** You are at the Majik Shop
echo
goto FINISH

3RD-DEPART:
pause
move sw
move se
move e
move e
move e
move se
move n
move go ornate arch
move e
pause
echo
echo *** You are at the depart spot in the Temple of Hodierna
echo
goto FINISH

3RD-EXOTICS:
pause
move ne
move ne
move n
move e
move e
move go shop
pause
echo
echo *** You are at the Exotics shop
echo
goto FINISH

3RD-MORURYN:
pause
move sw
move se
move e
move e
move n
move n
move ne
move go door
move go arch
pause
echo
echo *** You are in Urrem'tier's Temple
echo *** Moruryns
echo  (Show affection to the statue to get inside)
echo
goto FINISH

#=====================
#4TH TIER TO LOCATONS
#=====================
4TH-STABLE:
pause
move n
move n
move n
move n
move n
move w
move w
move go gate
move go large STABLE
echo
echo *** You are at the Stables out the gates of the 4th tier
echo
goto FINISH

3RD-4TH:
pause
move go sewer grating
move go narrow crevice

601:
save 601
match 602 tang of the salt sea
match RETREAT engaged
put e
matchwait

602:
save 602
match 603 something silent brushing past
match RETREAT engaged
put se
matchwait

603:
save 603
match 604 the reek of mold
match RETREAT engaged
put down
matchwait

604:
save 604
match 605 the slip of a loose brick
match RETREAT engaged
put w
matchwait

605:
save 605
match 606 the feel of soft, yielding mud
match RETREAT engaged
put nw 
matchwait

606:
save 606
match 607 the touch of a drop of water
match RETREAT engaged
put s
matchwait

607:
save 607
match 608 A large circular opening
match RETREAT engaged
put sw
matchwait

608:
save 608
match 609 pungent, spicy aroma
match RETREAT engaged
put up
matchwait

609:
save 609
match 610 odd whiff of incense
match RETREAT engaged
put w
matchwait

610:
save 610
match 611 A light flickers to the southwest
match RETREAT engaged
put nw
matchwait

611:
save 612
match 612 The tunnel walls have been built
match RETREAT engaged
put n
matchwait

612:
save 612
match 613 stream of water falls to the floor.
match RETREAT engaged
put n
matchwait

613:
save 613
matchre 614 Water flows in from the north|Water flows into a hole
match RETREAT engaged
matchre FAIL-LADDER You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|slip after a few feet|A wave of dizziness hits you|Struck by vertigo
put climb ladder
matchwait

614:
save 614
match 615 The walls are narrowly within
match 615 The walls curve into the ceiling
match RETREAT engaged
put n
matchwait

615:
save 615
match 616 A thin sheet of water flows
match RETREAT engaged
put n
matchwait

616:
save 616
match 617 Nadamian Avenue]
match RETREAT engaged
put go polished grate
matchwait

617:
goto %1

3RD-UNDEAD:
pause
move go sewer grating
move go narrow crevice

101:
save 101
match 102 tang of the salt sea
match RETREAT engaged
put e
matchwait

102:
save 102
match 103 something silent brushing past
match RETREAT engaged
put se
matchwait

103:
save 103
match 104 the reek of mold
match RETREAT engaged
put down
matchwait

104:
save 104
match 105 the slip of a loose brick
match RETREAT engaged
put w
matchwait

105:
save 105
match 106 the feel of soft, yielding mud
match RETREAT engaged
put nw 
matchwait

106:
save 106
match 107 the touch of a drop of water
match RETREAT engaged
put s
matchwait

107:
save 107
match 108 A large circular opening
match RETREAT engaged
put sw
matchwait

108:
save 108
match 109 pungent, spicy aroma
match RETREAT engaged
put up
matchwait

109:
save 109
match 110 odd whiff of incense
match RETREAT engaged
put w
matchwait

110:
save 110
match 111 A light flickers to the southwest
match RETREAT engaged
put nw
matchwait

111:
save 112
match 112 The tunnel walls have been built
match RETREAT engaged
put n
matchwait

112:
save 112
match 113 stream of water falls to the floor.
match RETREAT engaged
put n
matchwait

113:
save 113
match 114 Water flows in from the north
match 114 Water flows into a hole
match RETREAT engaged
put climb ladder
matchwait

114:
save 114
match 115 The walls are narrowly within
match 115 The walls curve into the ceiling
match RETREAT engaged
put n
matchwait

115:
save 115
match 116 A thin sheet of water flows
match RETREAT engaged
put n
matchwait

116:
save 116
match 117 Nadamian Avenue]
match RETREAT engaged
put go polished grate
matchwait

117:
pause
move n
move n
move n
move n
move n
move w
move w
move go gate
move nw
move nw
move n
move n
move ne
move n
pause
echo
echo *** Climb the path and follow the trail for the undead
echo *** Death spirits, dark spirits, spectral pirates, and skeletal sailors
echo
goto FINISH
EXIT

3RD-LEUCRO:
pause
move go sewer grating
move go narrow crevice

201:
save 201
match 202 tang of the salt sea
match RETREAT engaged
put e
matchwait

202:
save 202
match 203 something silent brushing past
match RETREAT engaged
put se
matchwait

203:
save 203
match 204 the reek of mold
match RETREAT engaged
put down
matchwait

204:
save 204
match 205 the slip of a loose brick
match RETREAT engaged
put w
matchwait

205:
save 205
match 206 the feel of soft, yielding mud
match RETREAT engaged
put nw 
matchwait

206:
save 206
match 207 the touch of a drop of water
match RETREAT engaged
put s
matchwait

207:
save 207
match 208 A large circular opening
match RETREAT engaged
put sw
matchwait

208:
save 208
match 209 pungent, spicy aroma
match RETREAT engaged
put up
matchwait

209:
save 209
match 210 odd whiff of incense
match RETREAT engaged
put w
matchwait

210:
save 210
match 211 A light flickers to the southwest
match RETREAT engaged
put nw
matchwait

211:
save 212
match 212 The tunnel walls have been built
match RETREAT engaged
put n
matchwait

212:
save 212
match 213 stream of water falls to the floor.
match RETREAT engaged
put n
matchwait

213:
save 213
matchre 214 Water flows in from the north|Water flows into a hole
match RETREAT engaged
matchre FAIL-LADDER You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|slip after a few feet|A wave of dizziness hits you|Struck by vertigoness is intimidating
put climb ladder
matchwait

214:
save 214
match 215 The walls are narrowly within
match 215 The walls curve into the ceiling
match RETREAT engaged
put n
matchwait

215:
save 215
match 216 A thin sheet of water flows
match RETREAT engaged
put n
matchwait

216:
save 216
match 217 Nadamian Avenue]
match RETREAT engaged
put go polished grate
matchwait

217:
pause
move n
move n
move n
move n
move n
move w
move w
move go gate
move nw
move nw
move n
move n
move ne
move n
move n
move nw
move nw
move ne
move nw
move nw
move ne
move ne

match WAITFOR217CONT You can't go there
match 217CONT Just to the southwest
put ne
matchwait

WAITFOR217CONT:
echo
echo *** There is a stupid farmer or farm animals blocking the trade road.
echo *** You must wait for them to pass.
echo
matchre START217CONT traffic starts|The herd of pigs finally passes|The stolid farmer slaps the reins on his team one more time
matchwait

START217CONT:
move ne
217CONT: 
move ne
move nw
move ne
move ne
move ne
echo
echo *** Entering a muddy section of the Reshalia Trade Road
echo
pause

match TOLEUCRO1 No one!
matchre GROUPTOLEUCRO1 You have:
put assess group;wealth
matchwait

GROUPTOLEUCRO1:
save GROUPTOLEUCRO1
matchre GROUPTOLEUCRO2a A pedal mill stands|Two large Gor'Togs,
matchre STAND You slip in the mud|You can't do that while|\.\.\.wait|type ahead
put nw
matchwait

GROUPTOLEUCRO2a:
save GROUPTOLEUCRO2b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPTOLEUCRO2b Obvious paths|Obvious exits
matchre GROUPTOLEUCRO2a \.\.\.wait|type ahead
put peer southeast
matchwait

GROUPTOLEUCRO2b:
save GROUPTOLEUCRO2b
matchre GROUPTOLEUCRO3a The occasional crunch underfoot
matchre STAND You slip in the mud|You can't do that while|\.\.\.wait|type ahead
put peer southeast
put nw
matchwait

GROUPTOLEUCRO3a:
save GROUPTOLEUCRO3b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPTOLEUCRO3b Obvious paths|Obvious exitsious exits:
matchre GROUPTOLEUCRO3a ...wait|type ahead
put peer southeast
matchwait

GROUPTOLEUCRO3b:
save GROUPTOLEUCRO3b
matchre GROUPTOLEUCRO4a farmers have built a wooden
matchre STAND You slip in the mud|You can't do that 
put nw
matchwait

GROUPTOLEUCRO4a:
save GROUPTOLEUCRO4b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPTOLEUCRO4b Obvious paths|Obvious exits
matchre GROUPTOLEUCRO4a ...wait|type ahead
put peer southeast
matchwait

GROUPTOLEUCRO4b:
save GROUPTOLEUCRO4b
matchre GROUPTOLEUCRO5a pile of decomposing weeds
matchre STAND You slip in the mud|You can't do that 
put n
matchwait

GROUPTOLEUCRO5a:
save TOLEUCRO5
pause
matchre FALLEN who is lying down|(prone)
matchre TOLEUCRO5 Obvious paths|Obvious exits
matchre GROUPTOLEUCRO5a ...wait|type ahead
put peer south
matchwait

TOLEUCRO1:
save TOLEUCRO1
matchre TOLEUCRO2 A pedal mill stands|Two large Gor'Togs,
matchre STAND You slip in the mud|You can't do that|type ahead
put nw
matchwait

TOLEUCRO2:
save TOLEUCRO2
match TOLEUCRO3 The occasional crunch underfoot
matchre STAND You slip in the mud|You can't do that
put nw
matchwait

TOLEUCRO3:
save TOLEUCRO3
match TOLEUCRO4 farmers have built a wooden
matchre STAND You slip in the mud|You can't do that
put nw
matchwait

TOLEUCRO4:
save TOLEUCRO4
match TOLEUCRO5 pile of decomposing weeds
matchre STAND You slip in the mud|You can't do that
put n
matchwait

TOLEUCRO5:
move nw
pause
move nw
move nw
move n
move n
move n
move ne
move ne
move e
move n
move ne
move ne
move ne
move ne
move e
move e
move ne
move ne
move ne
move e
move ne
move ne
pause
echo
echo *** Go east to enter the silver leucro area
echo
goto FINISH
EXIT

3RD-MERROW:
pause
move go sewer grating
move go narrow crevice

301:
save 301
match 302 tang of the salt sea
match RETREAT engaged
put e
matchwait

302:
save 302
match 303 something silent brushing past
match RETREAT engaged
put se
matchwait

303:
save 303
match 304 the reek of mold
match RETREAT engaged
put down
matchwait

304:
save 304
match 305 the slip of a loose brick
match RETREAT engaged
put w
matchwait

305:
save 305
match 306 the feel of soft, yielding mud
match RETREAT engaged
put nw 
matchwait

306:
save 306
match 307 the touch of a drop of water
match RETREAT engaged
put s
matchwait

307:
save 307
match 308 A large circular opening
match RETREAT engaged
put sw
matchwait

308:
save 308
match 309 pungent, spicy aroma
match RETREAT engaged
put up
matchwait

309:
save 309
match 310 odd whiff of incense
match RETREAT engaged
put w
matchwait

310:
save 310
match 311 A light flickers to the southwest
match RETREAT engaged
put nw
matchwait

311:
save 312
match 312 The tunnel walls have been built
match RETREAT engaged
put n
matchwait

312:
save 312
match 313 stream of water falls to the floor.
match RETREAT engaged
put n
matchwait

313:
save 313
matchre 314 Water flows in from the north|Water flows into a hole
match RETREAT engaged
matchre FAIL-LADDER You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|slip after a few feet|A wave of dizziness hits you|Struck by vertigo
put climb ladder
matchwait

314:
save 314
matchre 315 The walls are narrowly within|The walls curve into the ceiling
match RETREAT engaged
put n
matchwait

315:
save 315
match 316 A thin sheet of water flows
match RETREAT engaged
put n
matchwait

316:
save 316
match 317 Nadamian Avenue]
match RETREAT engaged
put go polished grate
matchwait

317:
pause
move n
move n
move n
move n
move n
move w
move w
move go gate
move nw
move nw
move n
move n
move ne
move n
move n
move nw
move nw
move ne
move nw
move nw
move ne
move ne

match WAITFOR317CONT You can't go there
match 317CONT Just to the southwest
put ne
matchwait

WAITFOR317CONT:
echo
echo *** There is a stupid farmer or farm animals blocking the trade road.
echo *** You must wait for them to pass.
echo
matchre START317CONT traffic starts|The herd of pigs finally passes|The stolid farmer slaps the reins on his team one more time
matchwait

START317CONT:
move ne
317CONT: 
move ne
move nw
move ne
move ne
move ne
echo
echo *** Entering a muddy section of the Reshalia Trade Road
echo
pause

match TOMERROW1 No one!
match GROUPTOMERROW1 You have:
put assess group;wealth
matchwait

GROUPTOMERROW1:
save GROUPTOMERROW1
matchre GROUPTOMERROW2a A pedal mill stands|Two large Gor'Togs,
matchre STAND You slip in the mud|You can't do that
match stand type ahead
put nw
matchwait

GROUPTOMERROW2a:
save GROUPTOMERROW2b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPTOMERROW2b Obvious paths|Obvious exits
match GROUPTOMERROW2a ...wait|type ahead
put peer southeast
matchwait

GROUPTOMERROW2b:
save GROUPTOMERROW2b
match GROUPTOMERROW3a The occasional crunch underfoot
matchre STAND You slip in the mud|You can't do that
put peer southeast
put nw
matchwait

GROUPTOMERROW3a:
save GROUPTOMERROW3b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPTOMERROW3b Obvious paths|Obvious exits
match GROUPTOMERROW3a ...wait|type ahead
put peer southeast
matchwait

GROUPTOMERROW3b:
save GROUPTOMERROW3b
match GROUPTOMERROW4a farmers have built a wooden
matchre STAND You slip in the mud|You can't do that
put nw
matchwait

GROUPTOMERROW4a:
save GROUPTOMERROW4b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPTOMERROW4b Obvious paths|Obvious exits
match GROUPTOMERROW4a ...wait|type ahead
put peer southeast
matchwait

GROUPTOMERROW4b:
save GROUPTOMERROW4b
match GROUPTOMERROW5a pile of decomposing weeds
matchre STAND You slip in the mud|You can't do that
put n
matchwait

GROUPTOMERROW5a:
save TOMERROW5
pause
matchre FALLEN who is lying down|(prone)
matchre TOMERROW5 Obvious paths|Obvious exits
match GROUPTOMERROW5a ...wait|type ahead
put peer south
matchwait

TOMERROW1:
save TOMERROW1
matchre TOMERROW2 A pedal mill stands|Two large Gor'Togs,
matchre STAND You slip in the mud|You can't do that
match stand type ahead
put nw
matchwait

TOMERROW2:
save TOMERROW2
match TOMERROW3 The occasional crunch underfoot
matchre STAND You slip in the mud|You can't do that
put nw
matchwait

TOMERROW3:
save TOMERROW3
match TOMERROW4 farmers have built a wooden
matchre STAND You slip in the mud|You can't do that
put nw
matchwait

TOMERROW4:
save TOMERROW4
match TOMERROW5 pile of decomposing weeds
matchre STAND You slip in the mud|You can't do that
put n
matchwait

TOMERROW5:
move nw
pause
move nw
move nw
move n
move n
move nw
move w
move w
move w
move w
move w
move nw
move w
move nw
move nw
move w
move nw
move nw
move w
move w
move nw
move nw
move w
move go thin trail
move climb down path
move climb down path
move climb down path
move climb down path
move climb down path
move climb down path
move climb down path
move climb down path
pause
echo
echo *** Merrows
echo *** Go through the fissure and follow the trail southward to merrows
echo *** But you must have decent swimming to get back out!
echo       (Don't hurt the selkies!)
echo
goto FINISH
EXIT

3RD-POKE:
pause
move go sewer grating
move go narrow crevice

401:
save 401
match 402 tang of the salt sea
match RETREAT engaged
put e
matchwait

402:
save 402
match 403 something silent brushing past
match RETREAT engaged
put se
matchwait

403:
save 403
match 404 the reek of mold
match RETREAT engaged
put down
matchwait

404:
save 404
match 405 the slip of a loose brick
match RETREAT engaged
put w
matchwait

405:
save 405
match 406 the feel of soft, yielding mud
match RETREAT engaged
put nw 
matchwait

406:
save 406
match 407 the touch of a drop of water
match RETREAT engaged
put s
matchwait

407:
save 407
match 408 A large circular opening
match RETREAT engaged
put sw
matchwait

408:
save 408
match 409 pungent, spicy aroma
match RETREAT engaged
put up
matchwait

409:
save 409
match 410 odd whiff of incense
match RETREAT engaged
put w
matchwait

410:
save 410
match 411 A light flickers to the southwest
match RETREAT engaged
put nw
matchwait

411:
save 412
match 412 The tunnel walls have been built
match RETREAT engaged
put n
matchwait

412:
save 412
match 413 stream of water falls to the floor.
match RETREAT engaged
put n
matchwait

413:
save 413
matchre 414 Water flows in from the north|Water flows into a hole
match RETREAT engaged
matchre FAIL-LADDER You must be standing|steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|slip after a few feet|A wave of dizziness hits you|Struck by vertigo
put climb ladder
matchwait

414:
save 414
match 415 The walls are narrowly within
match 415 The walls curve into the ceiling
match RETREAT engaged
put n
matchwait

415:
save 415
match 416 A thin sheet of water flows
match RETREAT engaged
put n
matchwait

416:
save 416
match 417 Nadamian Avenue]
match RETREAT engaged
put go polished grate
matchwait

417:
pause
move n
move n
move n
move n
move n
move e
move e
move go gate
move n
move ne
move ne
move ne
move e
move e
move e
move ne
move ne
move n
move ne
move ne
move nw
move w
move nw
move n
move ne
move e
move e
move e
move e
move ne
move n
move n
move ne
move n
move ne
move e
move ne
move ne
move n
move ne
move n
move n
move n
move n
move ne
move n
move n
move ne
move ne
move ne
move ne
move e
move e
move ne
move ne
move ne
move e
move ne
move e
move e
move go bridge
move climb trail
move n
move ne
move ne
move ne
move n
move n
move e
move se
move ne
move ne
move ne
move e
move e
move go bridge
move e
move ne
move ne
move ne
move e
move e
move e
move e
move se
move ne
move se
move ne
move n
move ne
move e
move e
move se
move se
move e
move se
pause
echo
echo *** Pokekehekepi Beachhead
echo *** dolomars, warklin, maulers, malchata
echo *** dock for the Halasa Selhin to Aesry
echo
goto FINISH
EXIT

#=====================
#LOCATIONS TO 4TH TIER
#=====================
UNDEAD-3RD:
pause
move sw
move sw
move w
move sw
move sw
move sw
move w
move w
move sw
move sw
move sw
move sw
move s
move w
move sw
move sw
move s
MERROWB-3RD:
move s
move s
move se
move se
move se
move s
echo
echo *** Entering a muddy section of the Reshalia Trade Road
echo
pause

match FROMLEUCRO1 No one!
match GROUPFROMLEUCRO1 You have:
put assess group;wealth
matchwait

GROUPFROMLEUCRO1:
save GROUPFROMLEUCRO1
match GROUPFROMLEUCRO2a The occasional crunch underfoot
matchre STAND You slip in the mud|You can't do that
match stand type ahead
put se
matchwait

GROUPFROMLEUCRO2a:
save GROUPFROMLEUCRO2b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPFROMLEUCRO2b Obvious paths|Obvious exits
match GROUPFROMLEUCRO2a ...wait|type ahead
put peer northwest
matchwait

GROUPFROMLEUCRO2b:
save GROUPFROMLEUCRO2b
matchre GROUPFROMLEUCRO3a A pedal mill stands astride|Two large Gor'Togs,
matchre STAND You slip in the mud|You can't do that
put se
matchwait

GROUPFROMLEUCRO3a:
save GROUPFROMLEUCRO3b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPFROMLEUCRO3b Obvious paths|Obvious exits
match GROUPFROMLEUCRO3a ...wait|type ahead
put peer northwest
matchwait

GROUPFROMLEUCRO3b:
save GROUPFROMLEUCRO3b
match GROUPFROMLEUCRO4a The road takes a sharp turn
matchre STAND You slip in the mud|You can't do that
put se
matchwait

GROUPFROMLEUCRO4a:
save GROUPFROMLEUCRO4b
pause
matchre FALLEN who is lying down|(prone)
matchre GROUPFROMLEUCRO4b Obvious paths|Obvious exits
match GROUPFROMLEUCRO4a ...wait|type ahead
put peer northwest
matchwait

GROUPFROMLEUCRO4b:
save GROUPFROMLEUCRO4b
match GROUPFROMLEUCRO5a It looks like someone discarded
matchre STAND You slip in the mud|You can't do that
put sw
matchwait

GROUPFROMLEUCRO5a:
save FROMLEUCRO5
pause
matchre FALLEN who is lying down|(prone)
matchre FROMLEUCRO5 Obvious paths|Obvious exits
match GROUPFROMLEUCRO5a ...wait|type ahead
put peer northeast
matchwait

FROMLEUCRO1:
save FROMLEUCRO1
match FROMLEUCRO2 The occasional crunch underfoot
matchre STAND You slip in the mud|You can't do that
match stand type ahead
put se
matchwait

FROMLEUCRO2:
save FROMLEUCRO2
matchre FROMLEUCRO3 A pedal mill stands astride|Two large Gor'Togs,
matchre STAND You slip in the mud|You can't do that
put se
matchwait

FROMLEUCRO3:
save FROMLEUCRO3
match FROMLEUCRO4 The road takes a sharp turn
matchre STAND You slip in the mud|You can't do that
put se
matchwait

FROMLEUCRO4:
save FROMLEUCRO4
match FROMLEUCRO5 It looks like someone discarded
matchre STAND You slip in the mud|You can't do that
put sw
matchwait

FROMLEUCRO5:
move sw
pause
move sw
move se
move sw

match WAITFORFROMLEUCRO5CONT You can't go there
match FROMLEUCRO5CONT Just to the northeast
put sw
put look
matchwait

WAITFORFROMLEUCRO5CONT:
echo
echo *** There is a stupid farmer or farm animals blocking the trade road.
echo *** You must wait for them to pass.
echo
matchre STARTFROMLEUCRO5CONT traffic starts|The herd of pigs finally passes|The stolid farmer slaps the reins on his team one more time
matchwait

STARTFROMLEUCRO5CONT:
move sw
FROMLEUCRO5CONT: 
move sw
move sw
move se
move se
move sw
move se
move se
move s
move s
move sw
move s
move s
move se
move se
move go gate
move e
move e
goto GATE-4TH

MERROW-3RD:
pause
move climb up path
move climb up path
move climb up path
move climb up path
move climb up path
move climb up path
move climb up path
move climb up path
move go thin trail
move e
move se
move se
move e
move e
move se
move se
move e
move se
move se
move e
move se
move e
move e
move e 
move e
move e
move se
goto merrowb-3RD

POKE-3RD:
pause
move nw
move w
move nw
move nw
move w
move w
move sw
move s
move sw
move nw
move sw
move nw
move w
move w
move w
move w
move sw
move sw
move sw
move w
move go bridge
move w
move w
move sw
move sw
move sw
move nw
move w
move s
move s
move sw
move sw
move sw
move s
move climb gorge
move go bridge
move w
move w
move sw
move w
move sw
move sw
move sw
move w
move w
move sw
move sw
move sw
move sw
move s
move s
move sw
move s
move s
move s
move s
move sw
move s
move sw
move sw
move w
move sw
move s
move sw
move s
move s
move sw
move w
move w
move w
move w
move sw
move s
move se
move e
move se
move sw
move sw
move s
move sw
move sw
move w
move w
move w
move sw
move sw
move sw
move s
move go gate
move w
move w
goto GATE-4TH

LEAVESTABLE1:
pause
move east
move out
move go gate
move e
move e
goto GATE-4TH

LEAVESTABLE2:
pause
move go open doorway
move out
move go gate
move e
move e
goto GATE-4TH

STABLE-4TH:
pause
move out
move go gate
move e
move e
goto GATE-4TH

GATE-4TH:
move s
move s
move s
move s
move s
4TH-3RD:
pause
move go grate

500:
save 500
matchre 501 The walls are narrowly within|The walls curve into the ceiling
match RETREAT engaged
put go pipe
matchwait

501:
save 501
matchre 502 Water flows in from the north|Water flows into a hole
match RETREAT engaged
put s
matchwait

502:
save 502
match 503 stream of water falls to the floor.
match RETREAT engaged
matchre FAIL-502 steepness is intimidating|can't seem to find purchase|find it hard going|your footing is questionable|slip after a few feet|A wave of dizziness hits you|Struck by vertigo
put climb rung
matchwait

FAIL-502:
put n
move n
move go grate
echo
echo *** You failed to climb through the sewers!
echo *** Make sure you are fully healed or get help getting down from the 4th tier
echo *** You are outside the sewer on the 4th tier
echo
EXIT

503:
save 503
match 504 The tunnel walls have been built 
match RETREAT engaged
put s
matchwait

504:
save 504
match 505 A light flickers to the southwest
match RETREAT engaged
put s
matchwait

505:
save 505
match 506 the slip of a loose brick
match RETREAT engaged
put se
matchwait

506:
save 506
match 507 pungent, spicy aroma
match RETREAT engaged
put e
matchwait

507:
save 507
match 508 A large circular opening
match RETREAT engaged
put down
matchwait

508:
save 508
match 510 tang of the salt sea
match RETREAT engaged
put ne
matchwait

510:
save 510
match 511 The dim beams from the southwest
match RETREAT engaged
put se
matchwait

511:
save 511
match 512 something noiselessly brushing past
match RETREAT engaged
put ne
matchwait

512:
save 512
match 513 the feel of soft, yielding mud
match RETREAT engaged
put se
matchwait

513:
save 513
match 514 reek of mold
match RETREAT engaged
put n
matchwait

514:
save 514
match 515 the stench of refuse
match RETREAT engaged
put up
matchwait

515:
save 515
match 516 tang of the salt sea
match RETREAT engaged
put nw
matchwait

516:
save 516
match 517 the smell of fish, fresh
match RETREAT engaged
put w
matchwait

517:
save 517
match 518 [The Sewers, Beneath the Grating]
match RETREAT engaged
put go crevice
matchwait

518:
pause
move go sewer grating
goto %1

ALREADYTHERE:
pause
echo
echo *** You are already at that location!
echo *** For your destination you entered: "%1"
echo
EXIT

1ST-HERB:
pause
move e
move ne
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

2ND-METAL:
pause
move ne
move e
move se
move se
move s
move se
move se
move se
move go Krrikt'k's Forge
move go arch
pause
echo
echo *** You are at the METAL repair
echo
goto FINISH

3RD-ORIGAMI:
pause
move sw
move go ornate structure
pause
echo
echo *** You are at the ORIGAMI shop
echo
goto FINISH
EXIT

#===================
#ADDITIONAL STARTS
#===================
LEAVEPORTICOA:
pause
goto PORTICOB

1TIER:
pause
move e
move ne
move ne
move go shop
goto %1

2TIERA:
pause
move ne
move e
goto 2tierb

3TIER:
pause
move sw
move go structure
goto %1

LEAVEDEPART:
pause
move w
move out
move s
move nw
move w
move w
move w
move nw
move go structure
goto %1

LEAVEMASKSA:
pause
goto masksb

LEAVEEMBOSSERA:
pause
move out
goto embosserb

LEAVEHAIR:
pause
move out
move e
move s
move se
move e
move e
move ne
move e
move e
move e
move e
move sw
goto %1

LEAVEINSTRUMENT:
pause
move out
move n
move ne
move se
move se
move sw
move e
move e
move s
move se
move e
move e
move ne
move e
move e
move e
move e
move sw
goto %1

LEAVETAILOR:
pause
move out
move w
move w
move sw
goto %1

LEAVECARPETS:
pause
move out
move nw
move w
move w
move sw
move w
move sw
move sw
move sw
move w
goto %1

LEAVECHANDLERY:
pause
move out
LEAVE2HERMIT:
move s
move w
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

LEAVEHERMIT:
pause
move go door
move go trail
move go crevice
move s
move sw
move w
move sw
move w
move w
move nw
move sw
move nw
move nw
move n
move n
goto LEAVE2HERMIT

LEAVE1FORGE:
pause
move out
move sw
move s
move s
move s
move sw
goto %1

LEAVEDIVINE1A:
pause
move go curtain
goto LEAVEDIVINE1b
LEAVEDIVINE2:
pause
LEAVEDIVINE1b:
move out
move sw
move sw
goto %1

LEAVEEXOTICS:
pause
move out
move w
move w
move s
move sw
move sw
goto %1

LEAVEJEWELRY:
pause
move out
move sw
move se
move e
move s
move sw
move sw
goto %1

LEAVE3FORGE:
pause
move out
goto %1

LEAVEMAJIK:
pause
move out
move s
move se
move se
move se
move e
move e
move ne
goto %1

1JAIL-1ST:
pause
move out
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

PORTAL-1ST:
pause
move w
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

#====================
FAIL-LADDER:
FAIL503:
save FAIL503
match FAIL504 The tunnel walls have been built 
match RETREAT engaged
match stand You can't do that while
put s
matchwait

FAIL504:
save FAIL504
match FAIL505 A light flickers to the southwest
match RETREAT engaged
put s
matchwait

FAIL505:
save FAIL505
match FAIL506 the slip of a loose brick
match RETREAT engaged
put se
matchwait

FAIL506:
save FAIL506
match FAIL507 pungent, spicy aroma
match RETREAT engaged
put e
matchwait

FAIL507:
save FAIL507
match FAIL508 A large circular opening
match RETREAT engaged
put down
matchwait

FAIL508:
save FAIL508
match FAIL510 tang of the salt sea
match RETREAT engaged
put ne
matchwait

FAIL510:
save FAIL510
match FAIL511 The dim beams from the southwest
match RETREAT engaged
put se
matchwait

FAIL511:
save FAIL511
match FAIL512 something noiselessly brushing past
match RETREAT engaged
put ne
matchwait

FAIL512:
save FAIL512
match FAIL513 the feel of soft, yielding mud
match RETREAT engaged
put se
matchwait

FAIL513:
save FAIL513
match FAIL514 reek of mold
match RETREAT engaged
put n
matchwait

FAIL514:
save FAIL514
match FAIL515 the stench of refuse
match RETREAT engaged
put up
matchwait

FAIL515:
save FAIL515
match FAIL516 tang of the salt sea
match RETREAT engaged
put nw
matchwait

FAIL516:
save FAIL516
match FAIL517 the smell of fish, fresh
match RETREAT engaged
put w
matchwait

FAIL517:
save FAIL517
match FAIL518 [The Sewers, Beneath the Grating]
match RETREAT engaged
put go crevice
matchwait

FAIL518:
pause
move go grat
echo
echo *** You failed to climb through the sewers!
echo *** Make sure you are fully healed or get help going up to the 4th tier
echo *** You are now outside the sewers on the 3RD tier
echo
EXIT

BANK-CLINIC:
pause
move go door
move climb stair
move sw
move nw
move nw
move n
move nw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
INTERSECTION-CLINIC:
move nw
move w
move n
move ne
move n
move ne
move ne
move e
move go clinic
move e
move go room one
pause
echo
echo *** Whew!  Made it!
echo *** You are at the Clinic
echo    (lie down to be healed)
echo
goto FINISH
EXIT

GEMS-CLINIC:
pause
move out
move w
move nw
move n
move n
move nw
move nw
goto INTERSECTION-CLINIC

PAWN-CLINIC:
pause
move out
move ne
goto INTERSECTION-CLINIC

VAULT-CLINIC:
pause
move out
move out
move w
move sw
move w
move w
move w
move sw
move n
move n
move nw
move n
move w
move nw
move n
move n
move nw
move nw
goto INTERSECTION-CLINIC

MAMAS-CLINIC:
pause
move out
move nw
move n
move w
move nw
move n
move n
move nw
move nw
goto INTERSECTION-CLINIC

NEH-CLINIC:
pause
move n
move w
move w
move sw
move n
move n
move nw
move n
move w
move nw
move n
move n
move nw
move nw
goto INTERSECTION-CLINIC

UARO-CLINIC:
pause
move go ramp
move w
move sw
move sw
goto SEERAH-CLINIC

UASIN-CLINIC:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
goto INTERSECTION-CLINIC

SEERAH-CLINIC:
pause
move ne
move n
move n
move n
move ne
move n
move n
move ne
move n
move nw
move n
move n
move ne
move ne
move e
move ne
goto INTERSECTION-CLINIC

SWAIN-CLINIC:
pause
move e
move go door
move out
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
goto INTERSECTION-CLINIC

INT-CLINIC:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move sw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
goto INTERSECTION-CLINIC

CLINIC-1ST:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
INTERSECTION-grate:
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move sw
move w
goto %1

BANK-1ST:
pause
move go door
move climb stai
move sw
move nw
move nw
move n
move nw
move sw
move w
goto %1

GEMS-1ST:
pause
move out
move w
move nw
move n
move n
move nw
move nw
goto INTERSECTION-grate

PAWN-1ST:
pause
move out
move ne
goto INTERSECTION-grate

VAULT-1ST:
pause
move out
move out
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

FISH-1ST:
pause
move out
move e
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

MAMAS-1ST:
pause
move out
move nw
move n
move w
move nw
move n
move n
move nw
move nw
goto INTERSECTION-grate

NEH-1ST:
pause
move n
move e
move ne
move e
move se
move e
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
pause
goto %1

UARO-1ST:
pause
move go ramp
move w
move sw
move sw
goto SEERAH-1ST

UASIN-1ST:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

SEERAH-1ST:
pause
move ne
move n
move n
move n
move ne
move n
move n
move ne
move n
move nw
move n
move n
move ne
move ne
move e
move ne
goto INTERSECTION-grate

SWAIN-1ST:
pause
move e
move go door
move out
move w
move w
move w
move w
move n
move n
move n
move nw
move nw
move n
move nw
move sw
move w
goto %1

INT-1ST:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move sw
move sw
move w
goto %1

CLINIC-BANK:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
INTERSECTION-BANK:
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move se
move s
move se
move se
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

GEMS-BANK:
pause
move out
move s
move se
move s
move s
INTERSECTION2-BANK:
move ne
move e
move e
move e
move ne
move e
move se
move e
move n
move n
move n
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

PAWN-BANK:
pause
move out
move ne
goto INTERSECTION-BANK

VAULT-BANK:
pause
move out
move out
move se
move e
move n
move n
move n
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

MAMAS-BANK:
pause
move out
move s
move s
goto INTERSECTION2-BANK

NEH-BANK:
pause
move n
move e
move ne
move e
move se
move e
move n
move n
move n
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

UARO-BANK:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION2-BANK

UASIN-BANK:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move n
move n
move n
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

SEERAH-BANK:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION2-BANK

SWAIN-BANK:
pause
move e
move go door
move out
move w
move w
move w
move w
move n
move n
move n
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

INT-BANK:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move sw
move se
move s
move se
move se
move ne
move climb stair
move go door
pause
echo
echo *** You are at the 1st Tier Bank atrium
echo
goto FINISH
EXIT

CLINIC-GEMS:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH
EXIT

BANK-GEMS:
pause
move go door
move climb stair
move sw
move s
move s
move s
move w
move nw
move w
move sw
move w
INTERSECTION-GEMS:
move w
move w
move sw
move n
move n
move nw
move n
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH
EXIT

PAWN-GEMS:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH
EXIT

VAULT-GEMS:
pause
move out
move out
move w
move sw
move w
goto INTERSECTION-GEMS

MAMAS-GEMS:
pause
move out
move nw
move n
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH
EXIT

NEH-GEMS:
pause
move n
goto INTERSECTION-GEMS

UARO-GEMS:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
move n
move n
move nw
move n
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH
EXIT

UASIN-GEMS:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
goto INTERSECTION-GEMS

SEERAH-GEMS:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
move n
move n
move nw
move n
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH
EXIT

SWAIN-GEMS:
pause
move e
move go door
move out
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
goto INTERSECTION-GEMS

INT-GEMS:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move sw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
move se
move se
move s
move s
move se
move e
move go market
pause
echo
echo *** You are at the Gem Shop
echo
goto FINISH

CLINIC-PAWN:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

BANK-PAWN:
pause
move go door
move climb stair
move sw
move nw
move nw
move n
move nw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

GEMS-PAWN:
pause
move out
move w
move nw
move n
move n
move nw
move nw
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

VAULT-PAWN:
pause
move out
move out
move w
move sw
move w
move w
move w
move sw
INTERSECTION-PAWN:
move n
move n
move nw
move n
move w
move nw
move n
move n
move nw
move nw
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH
EXIT

MAMAS-PAWN:
pause
move out
move nw
move n
move w
move nw
move n
move n
move nw
move nw
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

NEH-PAWN:
pause
move n
move w
move w
move sw
goto INTERSECTION-PAWN

UARO-PAWN:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION-PAWN

UASIN-PAWN:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-PAWN

SEERAH-PAWN:
pause
move ne
move n
move n
move n
move ne
move n
move n
move ne
move n
move nw
move n
move n
move ne
move ne
move e
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

SWAIN-PAWN:
pause
move e
move go door
move out
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-PAWN

INT-PAWN:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move sw
move w
move w
move w
move w
move nw
move w
move w
move w
move sw
move sw
move go building
pause
echo
echo *** You are at the Pawn Shop
echo
goto FINISH

CLINIC-VAULT:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
INTERSECTION-VAULT:
move ne
move e
move e
move e
move ne
move e
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

BANK-VAULT:
pause
move go door
move climb stair
move sw
move s
move s
move s
move w
move nw
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

GEMS-VAULT:
pause
move out
move s
move se
move s
move s
goto INTERSECTION-VAULT

PAWN-VAULT:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
goto INTERSECTION-VAULT

MAMAS-VAULT:
pause
move out
move s
move s
goto INTERSECTION-VAULT
move go carousel

NEH-VAULT:
pause
move n
move e
move ne
move e
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

UARO-VAULT:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION-VAULT

UASIN-VAULT:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move w
move nw
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

SEERAH-VAULT:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION-VAULT

SWAIN-VAULT:
pause
move e
move go door
move out
move w
move w
move w
move w
move w
move nw
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

INT-VAULT:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move w
move w
move w
move w
move w
move w
move nw
move go carousel
move go door
pause
echo
echo *** You are at the Vaults
echo
goto FINISH

CLINIC-MAMAS:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move s
move se
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

BANK-MAMAS:
pause
move go door
move climb stair
move sw
move s
move s
move s
INTERSECTION-MAMAS:
move w
move nw
move w
move sw
move w
move w
move w
move sw
move n
move n
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

GEMS-MAMAS:
pause
move out
move s
move se
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

PAWN-MAMAS:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

VAULT-MAMAS:
pause
move out
move out
move w
move sw
move w
move w
move w
move sw
move n
move n
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

NEH-MAMAS:
pause
move n
move w
move w
move sw
move n
move n
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

UARO-MAMAS:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
move n
move n
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

UASIN-MAMAS:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
goto INTERSECTION-MAMAS

SEERAH-MAMAS:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
move n
move n
move go building
pause
echo
echo *** You are at MAMAS
echo
goto FINISH

SWAIN-MAMAS:
pause
move e
move go door
move out
move w
move w
move w
move w
goto INTERSECTION-MAMAS

INT-MAMAS:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move w
move w
move w
move w
move w
goto INTERSECTION-MAMAS

CLINIC-NEH:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
move ne
move e
move e
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

BANK-NEH:
pause
move go door
move climb stair
move sw
move s
move s
move s
move w
move nw
move w
move sw
move w
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

GEMS-NEH:
pause
move out
move s
move se
move s
move s
move ne
move e
move e
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

PAWN-NEH:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
move ne
move e
move e
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

VAULT-NEH:
pause
move out
move out
move w
move sw
move w
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

MAMAS-NEH:
pause
move out
move s
move s
move ne
move e
move e
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

UARO-NEH:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
move ne
move e
move e
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

UASIN-NEH:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

SEERAH-NEH:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
move ne
move e
move e
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

SWAIN-NEH:
pause
move e
move go door
move out
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

INT-NEH:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move w
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move go dock
pause
echo
echo *** Neh Dock
echo *** The Kree'la sails for Riverhaven
echo *** The Skirr'lolasu sails for Crossing
echo
goto FINISH

CLINIC-UARO:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
INTERSECTION-UARO:
move w
move sw
move w
move w
move sw
move sw
move go ramp
pause
echo
echo *** The Uaro Dock
echo *** The Halasa Selhin sails for Aesry
echo
goto FINISH

BANK-UARO:
pause
move go door
move climb stair
move sw
move s
move s
move s
move w
move nw
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-UARO

GEMS-UARO:
pause
move out
move s
move se
move s
move s
goto INTERSECTION-UARO

PAWN-UARO:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
goto INTERSECTION-UARO

VAULT-UARO:
pause
move out
move out
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-UARO

MAMAS-UARO:
pause
move out
move s
move s
goto INTERSECTION-UARO

NEH-UARO:
pause
move n
move w
move w
move sw
goto INTERSECTION-UARO

UASIN-UARO:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-UARO

SEERAH-UARO:
pause
move ne
move ne
move e
move go ramp
pause
echo
echo *** The Uaro Dock
echo *** The Halasa Selhin sails for Aesry
echo
goto FINISH

SWAIN-UARO:
pause
move e
move go door
move out
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-UARO

INT-UARO:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move w
move w
move w
move w
move w
move w
move nw
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION-UARO

CLINIC-UASIN:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
INTERSECTION1-UASIN:
move ne
move e
move e
move e
move ne
move e
move se
move e
INTERSECTION2-UASIN:
move e
move e
move e
move e
move e
move s
move se
move se
move ne
move w
move go dock
pause
echo
echo *** The Uasin Dock
echo *** Up the ramp the Tasia'zaul sails for Hara'Jaal
echo *** You must have completed a quest to get past Kretsky
echo *** And Kretsky ALWAYS charges a gold to go up the ramp
echo
goto FINISH

BANK-UASIN:
pause
move go door
move climb stair
move sw
move s
move s
move s
goto INTERSECTION2-UASIN

GEMS-UASIN:
pause
move out
move s
move se
move s
move s
goto INTERSECTION1-UASIN

PAWN-UASIN:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
goto INTERSECTION1-UASIN

VAULT-UASIN:
pause
move out
move out
move se
move e
goto INTERSECTION2-UASIN

MAMAS-UASIN:
pause
move out
move s
move s
goto INTERSECTION1-UASIN

NEH-UASIN:
pause
move n
move e
move ne
move e
move se
move e
goto INTERSECTION2-UASIN

UARO-UASIN:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION1-UASIN

SEERAH-UASIN:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION1-UASIN

SWAIN-UASIN:
pause
move e
move go door
move out
move e
move s
move se
move se
move ne
move w
move go dock
pause
echo
echo *** The Uasin Dock
echo *** Up the ramp the Tasia'zaul sails for Hara'Jaal
echo *** You must have completed a quest to get past Kretsky
echo *** And Kretsky ALWAYS charges a gold to go up the ramp
echo
goto FINISH

INT-UASIN:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move s
move se
move se
move ne
move w
move go dock
pause
echo
echo *** The Uasin Dock
echo *** Up the ramp the Tasia'zaul sails for Hara'Jaal
echo *** You must have completed a quest to get past Kretsky
echo *** And Kretsky ALWAYS charges a gold to go up the ramp
echo
goto FINISH

CLINIC-SEERAH:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move sw
move w
move sw
move sw
move s
move s
move se
move s
move sw
move s
move s
move sw
move s
move s
move s
move sw
pause
echo
echo *** Go Gap to the Seerah wreck
echo *** sand sprites, crabs, la'heke
echo
goto FINISH

BANK-SEERAH:
pause
move go door
move climb stair
move sw
move s
move s
move s
INTERSECTION1-SEERAH:
move w
move nw
move w
move sw
move w
move w
move w
move sw
INTERSECTION2-SEERAH:
move w
move sw
move w
move w
move sw
move sw
move w
move sw
move sw
pause
echo
echo *** Go Gap to the Seerah wreck
echo *** sand sprites, crabs, la'heke
echo
goto FINISH

GEMS-SEERAH:
pause
move out
move s
move se
move s
move s
goto INTERSECTION2-SEERAH

PAWN-SEERAH:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
goto INTERSECTION2-SEERAH

VAULT-SEERAH:
pause
move out
move out
move w
move sw
move w
move w
move w
move sw
goto INTERSECTION2-SEERAH

MAMAS-SEERAH:
pause
move out
move s
move s
goto INTERSECTION2-SEERAH

NEH-SEERAH:
pause
move n
move w
move w
move sw
goto INTERSECTION2-SEERAH

UARO-SEERAH:
pause
move go ramp
move w
move sw
move sw
pause
echo
echo *** Go Gap to the Seerah wreck
echo *** sand sprites, crabs, la'heke
echo
goto FINISH

UASIN-SEERAH:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
goto INTERSECTION1-SEERAH

SWAIN-SEERAH:
pause
move e
move go door
move out
move w
move w
move w
move w
goto INTERSECTION1-SEERAH

INT-SEERAH:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move w
move w
move w
move w
move w
goto INTERSECTION1-SEERAH

CLINIC-SWAIN:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
INTERSECTION1-SWAIN:
move ne
move e
move e
move e
move ne
move e
move se
move e
INTERSECTION2-SWAIN:
move e
move e
move e
move e
move go tavern
move go door
move west
pause
echo
echo *** Bawdy Swains
echo *** You can train Reflex here
echo
put hide
goto FINISH

BANK-SWAIN:
pause
move go door
move climb stair
move sw
move s
move s
move s
goto INTERSECTION2-SWAIN

GEMS-SWAIN:
pause
move out
move s
move se
move s
move s
goto INTERSECTION1-SWAIN

PAWN-SWAIN:
pause
move out
move ne
move se
move se
move s
move s
move se
move e
move s
move se
move s
move s
goto INTERSECTION1-SWAIN

VAULT-SWAIN:
pause
move out
move out
move se
move e
goto INTERSECTION2-SWAIN

MAMAS-SWAIN:
pause
move out
move s
move s
goto INTERSECTION1-SWAIN

NEH-SWAIN:
pause
move n
move e
move ne
move e
move se
move e
goto INTERSECTION2-SWAIN

UARO-SWAIN:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION1-SWAIN

UASIN-SWAIN:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move go tavern
move go door
move west
pause
echo
echo *** Bawdy Swains
echo *** You can train Reflex here
echo
put hide
goto FINISH

SEERAH-SWAIN:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION1-SWAIN

INT-SWAIN:
pause
move out
move out
move out
move down
move s
move se
move s
move se
move s
move s
move s
move s
move w
move go tavern
move go door
move west
pause
echo
echo *** Bawdy Swains
echo *** You can train Reflex here
echo
put hide
goto FINISH

CLINIC-INT:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
INTERSECTION-INT:
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move ne
move ne
move e
move ne
move e
move e
move se
move se
move go Tarr Rest
move go swinging door
move go common room
move go darkened corner
pause
echo
echo *** Train Intelligence Here
echo
goto FINISH

BANK-INT:
pause
move go door
move climb stair
move sw
move s
move s
move s
INTERSECTION2-INT:
move e
move e
move e
move e
move e
INTERSECTION3-INT:
move n
move n
move n
move n
move nw
move n
move nw
move n
move go Tarr Rest
move go swinging door
move go common room
move go darkened corner
pause
echo
echo *** Train Intelligence Here
echo
goto FINISH

GEMS-INT:
pause
move out
move s
move se
move s
move s
INTERSECTION1-INT:
move ne
move e
move e
move e
move ne
move e
move se
move e
goto INTERSECTION2-INT

PAWN-INT:
pause
move out
move ne
goto INTERSECTION-INT

VAULT-INT:
pause
move out
move out
move se
move e
goto INTERSECTION2-INT

MAMAS-INT:
pause
move out
move s
move s
goto INTERSECTION1-INT

NEH-INT:
pause
move n
move e
move ne
move e
move se
move e
goto INTERSECTION2-INT

UARO-INT:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION1-INT

UASIN-INT:
pause
move n
move e
move sw
move nw
move nw
move n
goto INTERSECTION3-INT

SEERAH-INT:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION1-INT

SWAIN-INT:
pause
move e
move go door
move out
move e
goto INTERSECTION3-INT

CLINIC-STR:
pause
move go dispensary
move w
move out
move w
move sw
move sw
move s
move sw
move s
move e
move se
move ne
move e
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

BANK-STR:
pause
move go door
move climb stair
move sw
move nw
move nw
move n
move nw
INTERSECTION-STR:
move w
move w
move w
move w
move nw
move w
move w
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

GEMS-STR:
pause
move out
move w
move nw
move n
move n
move nw
move nw
move ne
move e
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

PAWN-STR:
pause
move out
move ne
move ne
move e
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

VAULT-STR:
pause
move out
move out
move se
move e
INTERSECTION2-STR:
move n
move n
move n
move nw
move nw
move n
move nw
goto INTERSECTION-STR

MAMAS-STR:
pause
move out
move nw
move n
move w
move nw
move n
move n
move nw
move nw
move ne
move e
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

NEH-STR:
pause
move n
move w
move w
move sw
INTERSECTION3-STR:
move n
move n
move nw
move n
move w
move nw
move n
move n
move nw
move nw
move ne
move e
move go ironworks
move climb stone steps
pause
echo
echo *** Train Strength Here
echo
goto FINISH

UARO-STR:
pause
move go ramp
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION3-STR

UASIN-STR:
pause
move n
move e
move sw
move nw
move nw
move n
move w
move w
move w
move w
move w
goto INTERSECTION2-STR

SEERAH-STR:
pause
move ne
move ne
move e
move ne
move ne
move e
move e
move ne
move e
goto INTERSECTION3-STR

SWAIN-STR:
pause
move e
move go door
move out
move w
move w
move w
move w
goto INTERSECTION2-STR

INT-STR:
pause
move out
move out
move out
move down
move nw
move nw
move w
move w
move sw
move w
move sw
move sw
goto INTERSECTION-STR

BANK-HERB:
pause
move go door
move climb stair
move sw
move nw
move nw
move n
move nw
move ne
move go tiny shop
pause
echo
echo *** You are at the HERB and alchemy shop
echo
goto FINISH

LEAVEVAULT:
pause
move go door
goto %1

MOVEOUT:
pause
move out
goto %1

1ST-KRA:
pause
echo
echo *** To fight kra'hei GO GRATING then GO VALVE
echo *** To fight hatchlings GO GRATING then GO PASSAGE
echo
goto FINISH

2ND-KRA:
pause
echo
echo *** To fight kra'hei GO DRAIN then GO VALVE
echo *** To fight hatchlings GO DRAIN then GO OPENING
echo
goto FINISH

3RD-KRA:
pause
echo
echo *** To fight kra'hei GO GRATING then GO VALVE
echo *** To fight hatchlings GO GRATING then GO CREVICE
echo
goto FINISH

1ST-BAZAAR:
pause
move e
move ne
move n
move n
move n
move w
move nw
move n
move n
move nw
move w
move n
echo
echo *** You are outside the Ratha Bazzar, go north to enter.
echo * * * The paths through the BAZAAR are always changing
echo * * * More shops are open at daytime than at night
echo * * * The BAZAAR links the 1st tier with the 2nd tier
echo
goto FINISH

2ND-BAZAAR:
pause
move ne
echo
echo *** You are outside the Ratha Bazzar, go north to enter.
echo * * * The paths through the BAZAAR are always changing
echo * * * More shops are open at daytime than at night
echo * * * The BAZAAR links the 1st tier with the 2nd tier
echo
goto FINISH

BAZAAR-1ST:
pause
move s
move e
move se
move s
move s
move se
move e
move s
move s
move s
move sw
move w
goto %1

BAZAAR-2ND:
pause
move sw
goto %1

GOFINDRAIF1:
echo
echo *** Now seeking out Raif!
echo
GOFINDRAIF2:
pause
match FOUNDRAIF Raif
match R01 Obvious paths: east.
put look
matchwait

r01:
match FOUNDRAIF Raif
match R02 Obvious paths: northeast, west.
put e
matchwait

r02:
match FOUNDRAIF Raif
match R03 Obvious paths: north, northeast, southeast, southwest, west, northwest.
put ne
matchwait

r03:
match FOUNDRAIF Raif
match R04 Obvious paths: northeast, southwest, northwest.
put ne
matchwait

r04:
match FOUNDRAIF Raif
match R05 Obvious paths: east, southwest.
put ne
matchwait

r05:
match FOUNDRAIF Raif
match R06 Obvious paths: northeast, west.
put e
matchwait

r06:
match FOUNDRAIF Raif
match R07 Obvious paths: east, southwest.
put ne
matchwait

r07:
match FOUNDRAIF Raif
match R08 Obvious paths: east, west.
put e
matchwait

r08:
match FOUNDRAIF Raif
match R09 Obvious paths: southeast, west.
put e
matchwait

r09:
match FOUNDRAIF Raif
match R10 Obvious paths: southeast, northwest.
put se
matchwait

r10:
match FOUNDRAIF Raif
match R11 Obvious paths: south, northwest.
put se
matchwait

r11:
match FOUNDRAIF Raif
match R12 Obvious paths: north, southeast.
put s
matchwait

r12:
match FOUNDRAIF Raif
match R13 Obvious paths: south, northwest.
put se
matchwait

r13:
match FOUNDRAIF Raif
match R14 Obvious paths: north, southeast.
put s
matchwait

r14:
match FOUNDRAIF Raif
match R15 Obvious paths: south, northwest.
put se
matchwait

r15:
match FOUNDRAIF Raif
match R16 Obvious paths: north, south.
put s
matchwait

r16:
match FOUNDRAIF Raif
match R17 a stone
put s
matchwait

r17:
match FOUNDRAIF Raif
match R18 Obvious paths: north, south.
put s
matchwait

r18:
match FOUNDRAIF Raif
match R19 Obvious paths: north, south, west.
put s
matchwait

r19:
match FOUNDRAIF Raif
match R20 Obvious paths: north, southeast.
put s
matchwait

r20:
match FOUNDRAIF Raif
match R21 Obvious paths: southeast, northwest.
put se
matchwait

r21:
match FOUNDRAIF Raif
match R22 Obvious paths: northeast, northwest.
put se
matchwait

r22:
match FOUNDRAIF Raif
match R23 Obvious paths: southeast, southwest, west.
put ne
matchwait

r23:
match FOUNDRAIF Raif
match R24 Obvious paths: east.
put w
matchwait

r24:
move e
match FOUNDRAIF Raif
match R25 Obvious paths: east, northwest.
put se
matchwait

r25:
match FOUNDRAIF Raif
match R26 Obvious paths: east, west.
put e
matchwait

r26:
match FOUNDRAIF Raif
match R27 Obvious paths: northeast, west.
put e
matchwait

r27:
match FOUNDRAIF Raif
match R28 Obvious paths: east, southwest.
put ne
matchwait

r28:
match FOUNDRAIF Raif
match R29 Obvious paths: northeast, west.
put e
matchwait

r29:
match FOUNDRAIF Raif
match R30 Obvious paths: north, southwest.
put ne
matchwait

r30:
match FOUNDRAIF Raif
match R31 Obvious paths: south.
put n
matchwait

r31:
move s
move sw
move w
move sw
move w
move w
move nw
move sw
move nw
move nw
move n
match FOUNDRAIF Raif
match R32 Obvious paths: east, southwest, west.
put w
matchwait

r32:
match FOUNDRAIF Raif
match R33 Obvious paths: east, west.
put w
matchwait

r33:
match FOUNDRAIF Raif
match R34 a sign.
match R34 a sign,
put w
matchwait

r34:
match FOUNDRAIF Raif
match R35 festive meeting
put w
matchwait

r35:
match FOUNDRAIF Raif
match R36 Obvious paths: north, east, west.
put w
matchwait

r36:
match FOUNDRAIF Raif
match R37 Obvious paths: east, northwest.
put w
matchwait

r37:
match FOUNDRAIF Raif
match R38 Obvious paths: southeast, west.
put nw
matchwait

r38:
match FOUNDRAIF Raif
match R39 Obvious paths: east, southwest.
put w
matchwait

r39:
match FOUNDRAIF Raif
match R40 Obvious paths: northeast, west.
put sw
matchwait

r40:
match FOUNDRAIF Raif
match R41 Obvious paths: east, west.
put w
matchwait

r41:
pause
match FOUNDRAIF Raif
match R42 Obvious paths: east, west.
put w
matchwait

r42:
match FOUNDRAIF Raif
match R43 Obvious paths: east, southwest.
put w
matchwait

r43:
match FOUNDRAIF Raif
match R44 Obvious paths: north, northeast, west.
put sw
matchwait

r44:
match FOUNDRAIF Raif
match R45 Obvious paths: east, southwest.
put w
matchwait

r45:
match FOUNDRAIF Raif
match R46 Obvious paths: northeast, west.
put sw
matchwait

r46:
match FOUNDRAIF Raif
match R47 Obvious paths: east, west.
put w
matchwait

r47:
match FOUNDRAIF Raif
match R48 Obvious paths: east, southwest.
put w
matchwait

r48:
match FOUNDRAIF Raif
match R49 Obvious paths: northeast, southwest.
put sw
matchwait

r49:
match FOUNDRAIF Raif
match R50 Obvious paths: northeast, west.
put sw
matchwait

r50:
match FOUNDRAIF Raif
match R51 Obvious paths: east, southwest.
put w
matchwait

r51:
match FOUNDRAIF Raif
match R52 Obvious paths: north, northeast, southwest.
put sw
matchwait

r52:
match FOUNDRAIF Raif
match R53 Obvious paths: northeast.
put sw
matchwait

r53:
move ne
match FOUNDRAIF Raif
match R54 Obvious paths: north, south.
put n
matchwait

r54:
pause
match FOUNDRAIF Raif
match R55 Obvious paths: north, south.
put n
matchwait

r55:
match FOUNDRAIF Raif
match R56 Obvious paths: northeast, south.
put n
matchwait

r56:
match FOUNDRAIF Raif
match R57 Obvious paths: north, southwest.
put ne
matchwait

r57:
match FOUNDRAIF Raif
match R58 Obvious paths: north, south.
put n
matchwait

r58:
match FOUNDRAIF Raif
match R59 Obvious paths: northeast, south.
put n
matchwait

r59:
match FOUNDRAIF Raif
match R60 Obvious paths: north, southwest.
put ne
matchwait

r60:
match FOUNDRAIF Raif
match R61 Obvious paths: south, northwest.
put n
matchwait

r61:
match FOUNDRAIF Raif
match R62 Obvious paths: north, southeast.
put nw
matchwait

r62:
match FOUNDRAIF Raif
match R63 Obvious paths: north, south.
put n
matchwait

r63:
match FOUNDRAIF Raif
match R64 Obvious paths: northeast, south.
put n
matchwait

r64:
match FOUNDRAIF Raif
match R65 Obvious paths: northeast, southwest.
put ne
matchwait

r65:
match FOUNDRAIF Raif
match R66 Obvious paths: east, southwest.
put ne
matchwait

r66:
match FOUNDRAIF Raif
match R67 Obvious paths: northeast, west.
put e
matchwait

r67:
match FOUNDRAIF Raif
match R68 Obvious paths: northeast, southeast, southwest, northwest.
put ne
matchwait

r68:
match FOUNDRAIF Raif
match R69 Obvious paths: southeast, west.
put nw
matchwait

r69:
match FOUNDRAIF Raif
match R70 Obvious paths: north, east.
put  w
matchwait

r70:
match FOUNDRAIF Raif
match R71 Obvious paths: northeast, south.
put n
matchwait

r71:
match FOUNDRAIF Raif
match R72 Obvious paths: north, southwest.
put ne
matchwait

r72:
match FOUNDRAIF Raif
match R73 Obvious paths: northeast, south.
put n
matchwait

r73:
match FOUNDRAIF Raif
match R74 Obvious paths: northeast, southwest.
put ne
matchwait

r74:
match FOUNDRAIF Raif
match R75 Obvious paths: east, southwest.
put ne
matchwait

r75:
match FOUNDRAIF Raif
match R76 Obvious paths: northeast, west.
put e
matchwait

r76:
match FOUNDRAIF Raif
match R77 Obvious paths: east, southwest.
put ne
matchwait

r77:
match FOUNDRAIF Raif
match R78 Obvious paths: east, west.
put e
matchwait

r78:
match FOUNDRAIF Raif
match R79 Obvious paths: northeast, west.
put e
matchwait

r79:
move ne
move e
match FOUNDRAIF Raif
match R80 Obvious paths: north, south.
put s
matchwait

r80:
match FOUNDRAIF Raif
match R81 Obvious paths: north, east.
put s
matchwait

r81:
match FOUNDRAIF Raif
match R82 Obvious paths: northeast, southeast, west.
put e
matchwait

r82:
match FOUNDRAIF Raif
match R83 Obvious paths: northeast, southwest.
put ne
matchwait

r83:
match FOUNDRAIF Raif
match R84 Obvious paths: southwest.
put ne
matchwait

r84:
move sw
move sw
match FOUNDRAIF Raif
match R85 Obvious paths: south, northwest.
put se
matchwait

r85:
match FOUNDRAIF Raif
match R86 Obvious paths: north, south.
put s
matchwait

r86:
match FOUNDRAIF Raif
match R87 Obvious paths: north, southeast.
put s
matchwait

r87:
match FOUNDRAIF Raif
match R88 Obvious paths: east, northwest.
put se
matchwait

r88:
match FOUNDRAIF Raif
match R89 Obvious paths: south, west.
put e
matchwait

r89:
match FOUNDRAIF Raif
match R90 Obvious paths: north, southeast, south.
put s
matchwait

r90:
match FOUNDRAIF Raif
match R91 Obvious paths: north, south.
put s
matchwait

r91:
match FOUNDRAIF Raif
match R92 Obvious paths: north, northeast, southeast, southwest, west, northwest.
put s
matchwait

r92:
match FOUNDRAIF Raif
match R93 Obvious paths: south, northwest.
put se
matchwait

r93:
match FOUNDRAIF Raif
match R94 Obvious paths: north, southeast.
put s
matchwait

r94:
match FOUNDRAIF Raif
match R95 Obvious paths: southeast, northwest.
put se
matchwait

r95:
match FOUNDRAIF Raif
match R96 Obvious paths: northeast, south, northwest.
put se
matchwait

r96:
match FOUNDRAIF Raif
match R97 Obvious paths: southwest.
put ne
matchwait

r97:
move sw
match FOUNDRAIF Raif
match R98 Obvious paths: north, south.
put s
matchwait

r98:
match FOUNDRAIF Raif
match R99 High Guardhouse.
match R99 High Guardhouse,
put s
matchwait

r99:
match FOUNDRAIF Raif
match R001 Obvious paths: north, east, west.
put s
matchwait

r001:
move w
move nw
move w
move sw
move w
move w
move w
move sw
match FOUNDRAIF Raif
match R002 Obvious paths: north, south.
put n
matchwait

r002:
match FOUNDRAIF Raif
match R003 Obvious paths: south, northwest.
put n
matchwait

r003:
match FOUNDRAIF Raif
match R004 Obvious paths: north, southeast.
put nw
matchwait

r004:
match FOUNDRAIF Raif
match R005 Obvious paths: south, west.
put n
matchwait

r005:
match FOUNDRAIF Raif
match R006 Obvious paths: east, northwest.
put w
matchwait

r006:
match FOUNDRAIF Raif
match R007 Obvious paths: north, southeast.
put nw
matchwait

r007:
match FOUNDRAIF Raif
match R008 Obvious paths: north, south.
put n
matchwait

r008:
match FOUNDRAIF Raif
match R009 Obvious paths: south, northwest.
put n
matchwait

r009:
match FOUNDRAIF Raif
match R010 Obvious paths: southeast, northwest.
put nw
matchwait

r010:
match FOUNDRAIF Raif
match R011 Obvious paths: northeast, southeast, southwest, northwest.
put nw
matchwait

r011:
move ne
move e
move e
move e
move se
move e
move e
move e
move e
move sw
move w
echo
echo *** Searching for Raif again!
echo *** He must be hiding, that sneaky ne'r-do-well!
goto GOFINDRAIF2

FOUNDRAIF:
pause
echo
echo *** You have found Raif!
echo *** Better do what you need before he disappears!
echo
goto FINISH

#====================
STAND:
put stand
pause
goto %s

FALLEN:
echo
echo ===========================
echo *** Someone has fallen in the road.  Waiting for them to catch up.
echo *** Type GLANCE when you are ready to continue
echo ===========================
put Yell Stand up and follow me!
pause
waitfor You glance
goto %s

PAUSE:
pause
goto %s

CHA:
STA:
HER:
pause
echo
echo *** For this destination you must use at least 4 letters because:
echo * * * CHA could be CHArisma or CHAndlery.
echo * * * STA could be STAmina or Stables
echo * * * HER could be HERBs or HERmit shack
echo
EXIT

NODESTINATION:
pause
echo
echo ===================================================
echo *** List of possible destinations:
echo *** (only the first 3 letters required)
echo
echo *** ESSENTIAL SERVICES
echo  * Any tier (1st, 2nd, 3RD, 4th) - outside sewers
echo  * The Green
echo  * 1Bank (bank on 1st tier)
echo  * 3BANK (bank on 3RD tier)
echo  * 1JAIL (jail on 1st tier)
echo  * 3JAIL (jail on 3RD tier)
echo  * Healer
echo  * Gems
echo  * Pawn
echo  * Vault
echo  * MAMAS
echo  * Furrier
echo  * Debt
echo  * Stables
echo  * Depart spot
echo  * PORTALs (wedding, premium, events)
echo  * ALL stat training (Int, Wis, Dis, Str, Sta, Agi, Ref, Cha)
echo
echo *** SHOPS
echo  * HERBs/Alchemy
echo  * ORIGAMI
echo  * Bait Shop
echo  * Locksmith (Raif)
echo  * Chandlery
echo  * Hermit Shack
echo  * Leather repair
echo  * METAL repair
echo  * Masks and leather embossing
echo  * Hair Care
echo  * Instruments
echo  * Tailor
echo  * Exotics
echo  * Divine Rialto
echo  * Majik Shop
echo  *
echo *** CITY EXITS
echo  * Taisgath
echo  * Neh Dock (Kree'la to Haven, Skirr'lolasu to Crossing)
echo  * Uaro Dock (Halasa Selhin to Aesry)
echo  * Uasin Dock (Tasia'zaul to Hara'jaal)
echo  * Pokekehekepi
echo  *
echo *** HUNTING
echo  * Seerah (sprites, crabs, la'heke)
echo  * Swain [back room]
echo  * Kra'hei
echo  * Hatchlings
echo  * Moruryn
echo  * Undead (sailors, pirates, spirits)
echo  * Merrows
echo  * Leucros
echo  * Pokekehekepi (dolomar, warklins, maulers, malchata)
echo  *
echo *** Additional Starting locations (NOT destinations):
echo  * Any room in the 1st tier bank
echo  * Outside any entrance to the sewers
echo  * Any room on any dock
echo  * Inside almost any shop
echo  * Hodierna's temple (where you depart)
echo ===================================================
echo
echo =============================================
echo *** You did not enter a destination
echo *** To use this script type .{scriptname} {destination}
echo *** For example, to go to the gem shop type:  .ratha gem
echo =============================================
echo
EXIT

#====================
FINISH:
echo
echo *** YOU HAVE ARRIVED ***
echo
echo Signup to get automatically notified when this script is updated by going to http://groups.yahoo.com/group/TravelScripts/join
echo
EXIT