action put #queue clear;send $lastcommand when ^(\.\.\.wait|Sorry,)
action goto IN_THE_STR_WEB when ^You can't do that while entangled in a web.
action var group NO when ^You have no group to whisper to!
action var group YES when ^You whisper to
action setvar WEALTH_LIRUMS $1 when \((\d+) copper Lirums\)\.
action setvar WEALTH_KRONARS $1 when \((\d+) copper Kronars\)\.
action setvar WEALTH_DOKORAS $1 when \((\d+) copper Dokoras\)\.
action setvar WEALTH_LIRUMS 0 when ^No copper Lirums.
action setvar WEALTH_KRONARS 0 when ^No copper Kronars.
action setvar WEALTH_DOKORAS 0 when ^No Dokoras.

setvar WEALTH_LIRUMS 0
setvar WEALTH_KRONARS 0
setvar WEALTH_DOKORAS 0
setvar MOVESETALREADY OFF
setvar finaldirection 0

DIRECTION_FIRST_CHECK:
if_1 then goto DIRECTION_ALREADY_SET
goto NOCHOICEMADE

DIRECTION_ALREADY_SET:
setvar finaldirection %1
eval FIRST_MOVEMENT substr("%finaldirection",0,1)
goto movingstart

stand_begin:



########### No Choice Selected ###############

NOCHOICEMADE:
echo **********************************************
echo
echo Use with latest automapper bundle located on the genie boards
echo
echo http://www.genieclient.com/bulletin/index.php?showtopic=1888
echo
echo If you are are traveling on ferrys you will need to get coin for all your travels
echo
echo USAGE - Choose to run from menu or direct in command bar 
echo 
echo eg .trav (Province)(Location) 
echo eg .trav 113  
echo 
echo
echo ********************************************************
echo #	Province			Area/Location
echo ********************************************************
echo 1:	-- Zoluren --		The Crossing Town and Surrounding Areas
echo
echo 2:	-- Zoluren --		The Northern Trade Route to Haven Ferry
echo
echo 3:	-- Zoluren --		Leth Deriel and the Southern Trade Route
echo
echo 4:	-- Therengia --		Riverhaven And Throne City					 
echo
echo 5:	-- Therengia --		Langenfirth, Theren and Rossmans Landing
echo
echo 6:	-- Ilithi --		South Trade Road
echo 
echo 7:	-- Ilithi --		Shard City And Surrounding Areas
echo ********************************************************
echo 
echo Enter Province Number

matchre Zoluren_CROSSING_SETLOCATION 1
matchre Zoluren_NTR_SETLOCATION 2
matchre Zoluren_LETH_DERIEL_SETLOCATION 3
matchre Therengia_RIVERHAVEN_SETLOCATION 4
matchre Therengia_LANG_THEREN_SETLOCATION 5
matchre Ilithi_SOUTH_TRADE_ROAD_SETLOCATION 6
matchre Ilithi_SHARD_STR_SETLOCATION 7
matchwait

Zoluren_CROSSING_SETLOCATION:
setvar FIRST_MOVEMENT 1
goto CROSSING_LOCATIONS_FULL

Zoluren_NTR_SETLOCATION:
setvar FIRST_MOVEMENT 2
goto NTR_LOCATIONS_FULL

Zoluren_LETH_DERIEL_SETLOCATION:
setvar FIRST_MOVEMENT 3
goto LETH_DERIEL_LOCATIONS_FULL

Therengia_RIVERHAVEN_SETLOCATION:
setvar FIRST_MOVEMENT 4
goto RIVERHAVEN_LOCATIONS_FULL

Therengia_LANG_THEREN_SETLOCATION:
setvar FIRST_MOVEMENT 5
goto LANG_THEREN_LOCATIONS_FULL

Ilithi_SOUTH_TRADE_ROAD_SETLOCATION:
setvar FIRST_MOVEMENT 6
goto SOUTH_TRADE_ROAD_LOCATIONS_FULL

Ilithi_SHARD_STR_SETLOCATION:
setvar FIRST_MOVEMENT 7
goto SHARD_LOCATIONS_FULL


CROSSING_LOCATIONS_FULL:
echo ***************************************************************
echo 				Crossing Town Locations
echo ***************************************************************
echo 	1 - Bank				11 - Agility
echo 	2 - Gems				12 - Reflex
echo 	3 - Tanner				13 - Strength
echo 	4 - Metal Repairs			14 - Stamina
echo 	5 - Leather Repairs			15 - Charisma
echo 	6 - Weapon Shop			16 - Discipline
echo 	7 - Armor Shop				17 - Wisdom
echo 	8 - General Store			18 - Intelligence
echo 	9 - Wound Herbs		
echo 	10 - Scars Herbs
echo		
echo ***************************************************************
echo 				Crossing Guilds
echo ***************************************************************
echo 	31 - Empaths Guild (Main Room)	35 - Clerics Guild (Gathering Hall)
echo 	32 - Barbarian Guild (Main Hall)	36 - Ranger Guild (Outside Guild)	
echo 	33 - Traders Guild (Main Hall)		37 - Moon Mage Guild (Outside Guild)
echo 	34 - War Mage Guild (Outside Guild)
echo
echo ****************************************************************
echo 				Crossing Hunting Locations
echo ***************************************************************
echo 	51 - Scavenger Goblins, Hogs		59 - Gouls (Cemetery)
echo 	52 - Field Goblins			60 - Wood Trolls, Grendels 
echo 	53 - Grass Eels				61 - Badgers, Croff Pothanits
echo 	54 - Young and Scout Ogres		62 - Trollkins, Badgers
echo 	55 - Cougars				63 - Water Sprites, Lipopods
echo 	56 - Sleazy Louts			64 - Rats (Shipyard)
echo 	57 - Revenant Conscripts		
echo 	58 - Pale Death Spirit (Lost Crossing)	
echo ****************************************************************
echo
echo Enter Location Number
goto SECOND_MOVEMENT_SET


NTR_LOCATIONS_FULL:
echo ***************************************************************
echo 				North Trade Route Locations
echo ***************************************************************
echo 	1 - Arthe Dale (Town Gate)		4 - Dirge (Town Gate)	
echo 	2 - Kaerena				5 - NTR Moon Mage Guild
echo 	3 - Ferry TO Riverhaven			
echo ****************************************************************
echo 				Arthe Dale
echo ****************************************************************
echo 	10 - Map Shop				13 - Weapons and Armor
echo 	11 - Thread Shop			14 - Bakery
echo 	12 - Phoebe's Fashions		15 - Bards Shop
echo ****************************************************************
echo 				North Trade Route Hunting Areas
echo ****************************************************************
echo 	50 - Rock Trolls (Barricade)		56 - Blue Belly Crocodile
echo 	51 - Vipers 				57 - Rock Guardians (Before trail search)
echo 	52 - Faenrae Reavers			58 - Cave Bears
echo 	53 - Slai Scouts 			59 - Warklin Mauler, Armored Warklin
echo 	54 - Thorn thicket vipers		60 - Black Leucros
echo 	55 - Fire Sprites, Firecats
echo 	
echo ***************************************************************
echo
echo Enter Location Number
goto SECOND_MOVEMENT_SET

LETH_DERIEL_LOCATIONS_FULL:
echo ***************************************************************
echo 		LETH DERIEL LOCATIONS AND SOUTH TRADE ROUTE
echo ***************************************************************
echo 	1 - Bank				5 - Leather Repairs
echo 	2 - Gems				6 - Weapon Shop
echo 	3 - Tanner				8 - General Store 	
echo 	40 - Dryers				45 - Origami			
echo 	41 - Bowyers Shop			46 - Bakery Store
echo 	42 - Candy Store			47 - Wicker Shop
echo 	43 - Clothing Shop			48 - Perfume
echo 	44 - Bard Shop				49 - Town Centre
echo ****************************************************************
echo 				Leth Hunting Areas
echo ****************************************************************
echo 	50 - STR Nyads, Dryads
echo **************************************************************
echo
echo Enter Location Number
goto SECOND_MOVEMENT_SET


RIVERHAVEN_LOCATIONS_FULL:
echo ***************************************************************
echo 				RIVERHAVEN LOCATIONS
echo ***************************************************************
echo 	1 - Bank				11 - Agility
echo 	2- Gems				12 - Reflex
echo 	3 - Tanner				13 - Strength
echo 	4 - Metal Repairs			14 - Stamina
echo 	5 - Leather Repairs			15 - Charisma
echo 	6 - Weapon Shop			16 - Discipline
echo 	7 - Armor Shop				17 - Wisdom
echo 	8 - General Store			18 - Intelligence
echo 	9 - Wound Herbs
echo 	10 - Scars Herbs	
echo ***************************************************************
Echo 				RIVERHAVEN BOATS
echo ***************************************************************
echo 	21 - Lyb to Aesry			24 - Ferry to Crossing
echo 	22 - Boat to Ratha			25 - Boat to Throne City
echo 	26 - Barge to Lang
echo ***************************************************************
Echo 				RIVERHAVEN GUILDS
echo ***************************************************************
echo 	31 - Empaths Guild			35 - Clerics Guild
echo 	32 - Barbarian Guild			36 - Ranger Guild
echo 	33 - Traders Guild			37 - Moon Mage Guild
echo 	34 - War Mage Guild
echo ****************************************************************
echo 				RIVERHAVEN HUNTING LOCATIONS
echo ***************************************************************
echo 	50 - Swamp Trolls 			57 - Young Ogres, Scount Ogres
echo 	51 - Serpants and Vipers		58 - Arbelogs 
echo 	52 - Wildland Goblins 			59 - Barghest
echo 	53 - Goblin Zombies 			60 - Wild Boar
echo 	54 - Nightstalker Unyn, Thoat Moda	61 - Heggarangi Frogs
echo 	55 - Shamans, Rams, Eels
echo 	56 - Dusk Ogres, Wolf Spiders
echo **************************************************************
echo 				Throne City
echo ***************************************************************
echo 	60 - Main Gate 			61 - Gem Shop
echo ***************************************************************
echo
echo Enter Location Number
goto SECOND_MOVEMENT_SET

LANG_THEREN_LOCATIONS_FULL:
echo ***************************************************************
echo 				Theren Town.
echo ***************************************************************
echo 	1 - Bank				7 - Clothing
echo 	2 - Gems				8 - Engraving
echo 	3 - Fur Buyer				9 - Doors
echo 	4 - Metal Repairs			10 - Tables
echo 	5 - Leather Repairs			11 - Beds
echo 	6 - General Store			12 - Walls
echo 	7 - Clothing				13 - Pawnhop
echo ***************************************************************
echo 				Langenfirth Township
echo ***************************************************************
echo 	20 - Leather Repairs			24 - Furniture Shop
echo 	21 - Tanner				25 - Fish Buyer
echo 	22 - Armor Shop 			26 - Herbalist
echo 	23 - Leather Goods 			27 - Pawnshop
echo ***************************************************************
echo 				Hunting Areas.
echo ***************************************************************
echo 	50 - Morah Vines			54 - Swamp Trolls, Peccary
echo 	51 - Maruaders			55 - Fendryad
echo 	52 - Blood Wolves 			56 - Wolf Spiders
echo 	53 - Thunder Rams 			57 - Wood Trolls, Kelpies
echo ***************************************************************
echo 				Rossman Township
echo ***************************************************************
echo 	60 - Town Gate 			
echo ***************************************************************
echo Enter Location Number
goto SECOND_MOVEMENT_SET

SOUTH_TRADE_ROAD_LOCATIONS_FULL:
echo ***************************************************************
echo 			   Trevellyns of Leth Deriel
echo ***************************************************************
echo 	1 - Bridal Fashion 			5 - Boots
echo 	2 - Clerical Supplies 			6 - Catering Services	
echo 	3 - Mens Attire 			7 - Fine Jewlery
echo 	4 - Womans Clothing	
echo ***************************************************************
Echo 			  Marachecks Oaks
echo ***************************************************************
echo 	10 - Weapons				13 - Feastery
echo 	11 - General Store			14 - Biabos Bug Collection
echo 	12 - Herbalist
echo ****************************************************************
Echo 			  Steal Claw Clan
echo ***************************************************************
echo 	21 - Armor Shop 			24 - War Mage Guild
echo 	22 - Horse Shop 			25 - Metal Weapon Repair 
echo 	23 - Stables 				26 - Tavern
echo ****************************************************************
echo 		SOUTH TRADE ROAD HUNTING LOCATIONS
echo ***************************************************************
echo 	50 - Snowbeasts (Leth Side)	 	53 - Bone Wolves, Grave Worms(Alfars Manor)
echo 	51 - Gargoyles (Shard Side)		54 - Misshapen Germish'din (Alfars Manor)
echo 	52 - Jackles, Kobolds (Shard Side)	55 - Seordhavor Kartais (Alfars Manor)
echo **************************************************************
echo
echo Enter Location Number
goto SECOND_MOVEMENT_SET


SHARD_LOCATIONS_FULL:
echo ***************************************************************
echo 				SHARD LOCATIONS
echo ***************************************************************
echo 	1 - Bank				8 - General Store	
echo 	2 - Gems				9 - Bard Shop
echo 	3 - Tanner				10 - Artificher
echo 	4 - Metal Repairs			12 - Bowery	
echo 	6 - Weapon Shop			13 - Herbilist
echo 	7 - Armor Shop				14 - Pawnshop		
echo 
echo ***************************************************************
echo 				SHARD HUNTING LOCATIONS
echo ***************************************************************
echo 	50 - Rock Trolls(Normal) 		57 - Dragon Priest, Peccary
echo 	51 - Rock Trolls(Super) 		58 - Small Peccary 
echo 	52 - Dragon Fanatics 			59 - Clouded Arzumos
echo 	53 - Eidolon Steed 			60 - Grass Eels
echo 	55 - Adanf Mages/Warriors  		61 - Sinuos Elsreal
echo **************************************************************
echo
echo Enter Location Number
goto SECOND_MOVEMENT_SET



SECOND_MOVEMENT_SET:
matchre SET_70 70
matchre SET_69 69
matchre SET_68 68
matchre SET_67 67
matchre SET_66 66
matchre SET_65 65
matchre SET_64 64
matchre SET_63 63
matchre SET_62 62
matchre SET_61 61
matchre SET_60 60
matchre SET_59 59
matchre SET_58 58
matchre SET_57 57
matchre SET_56 56
matchre SET_55 55
matchre SET_54 54
matchre SET_53 53
matchre SET_52 52
matchre SET_51 51
matchre SET_50 50
matchre SET_49 49
matchre SET_48 48
matchre SET_47 47
matchre SET_46 46
matchre SET_45 45
matchre SET_44 44
matchre SET_43 43
matchre SET_42 42
matchre SET_41 41
matchre SET_40 40
matchre SET_39 39
matchre SET_38 38
matchre SET_37 37
matchre SET_36 36
matchre SET_35 35
matchre SET_34 34
matchre SET_33 33
matchre SET_32 32
matchre SET_31 31
matchre SET_30 30
matchre SET_29 29
matchre SET_28 28
matchre SET_27 27
matchre SET_26 26
matchre SET_25 25
matchre SET_24 24
matchre SET_23 23
matchre SET_22 22
matchre SET_21 21
matchre SET_20 20
matchre SET_19 19
matchre SET_18 18
matchre SET_17 17
matchre SET_16 16
matchre SET_15 15
matchre SET_14 14
matchre SET_13 13
matchre SET_12 12
matchre SET_11 11
matchre SET_10 10
matchre SET_9 9
matchre SET_8 8
matchre SET_7 7
matchre SET_6 6
matchre SET_5 5
matchre SET_4 4
matchre SET_3 3
matchre SET_2 2
matchre SET_1 1
matchwait

SET_1:
setvar SECOND_MOVEMENT 1
goto set_movement_final
SET_2:
setvar SECOND_MOVEMENT 2
goto set_movement_final
SET_3:
setvar SECOND_MOVEMENT 3
goto set_movement_final
SET_4:
setvar SECOND_MOVEMENT 4
goto set_movement_final
SET_5:
setvar SECOND_MOVEMENT 5
goto set_movement_final
SET_6:
setvar SECOND_MOVEMENT 6
goto set_movement_final
SET_7:
setvar SECOND_MOVEMENT 7
goto set_movement_final
SET_8:
setvar SECOND_MOVEMENT 8
goto set_movement_final
SET_9:
setvar SECOND_MOVEMENT 9
goto set_movement_final
SET_10:
setvar SECOND_MOVEMENT 10
goto set_movement_final
SET_11:
setvar SECOND_MOVEMENT 11
goto set_movement_final
SET_12:
setvar SECOND_MOVEMENT 12
goto set_movement_final
SET_13:
setvar SECOND_MOVEMENT 13
goto set_movement_final
SET_14:
setvar SECOND_MOVEMENT 14
goto set_movement_final
SET_15:
setvar SECOND_MOVEMENT 15
goto set_movement_final
SET_16:
setvar SECOND_MOVEMENT 16
goto set_movement_final
SET_17:
setvar SECOND_MOVEMENT 17
goto set_movement_final
SET_18:
setvar SECOND_MOVEMENT 18
goto set_movement_final
SET_19:
setvar SECOND_MOVEMENT 19
goto set_movement_final
SET_20:
setvar SECOND_MOVEMENT 20
goto set_movement_final
SET_21:
setvar SECOND_MOVEMENT 21
goto set_movement_final
SET_22:
setvar SECOND_MOVEMENT 22
goto set_movement_final
SET_23:
setvar SECOND_MOVEMENT 23
goto set_movement_final
SET_24:
setvar SECOND_MOVEMENT 24
goto set_movement_final
SET_25:
setvar SECOND_MOVEMENT 25
goto set_movement_final
SET_26:
setvar SECOND_MOVEMENT 26
goto set_movement_final
SET_27:
setvar SECOND_MOVEMENT 27
goto set_movement_final
SET_28:
setvar SECOND_MOVEMENT 28
goto set_movement_final
SET_29:
setvar SECOND_MOVEMENT 29
goto set_movement_final
SET_30:
setvar SECOND_MOVEMENT 30
goto set_movement_final
SET_31:
setvar SECOND_MOVEMENT 31
goto set_movement_final
SET_32:
setvar SECOND_MOVEMENT 32
goto set_movement_final
SET_33:
setvar SECOND_MOVEMENT 33
goto set_movement_final
SET_34:
setvar SECOND_MOVEMENT 34
goto set_movement_final
SET_35:
setvar SECOND_MOVEMENT 35
goto set_movement_final
SET_36:
setvar SECOND_MOVEMENT 36
goto set_movement_final
SET_37:
setvar SECOND_MOVEMENT 37
goto set_movement_final
SET_38:
setvar SECOND_MOVEMENT 38
goto set_movement_final
SET_39:
setvar SECOND_MOVEMENT 39
goto set_movement_final
SET_40:
setvar SECOND_MOVEMENT 40
goto set_movement_final
SET_41:
setvar SECOND_MOVEMENT 41
goto set_movement_final
SET_42:
setvar SECOND_MOVEMENT 42
goto set_movement_final
SET_43:
setvar SECOND_MOVEMENT 43
goto set_movement_final
SET_44:
setvar SECOND_MOVEMENT 44
goto set_movement_final
SET_45:
setvar SECOND_MOVEMENT 45
goto set_movement_final
SET_46:
setvar SECOND_MOVEMENT 46
goto set_movement_final
SET_47:
setvar SECOND_MOVEMENT 47
goto set_movement_final
SET_48:
setvar SECOND_MOVEMENT 48
goto set_movement_final
SET_49:
setvar SECOND_MOVEMENT 49
goto set_movement_final
SET_50:
setvar SECOND_MOVEMENT 50
goto set_movement_final
SET_51:
setvar SECOND_MOVEMENT 51
goto set_movement_final
SET_52:
setvar SECOND_MOVEMENT 52
goto set_movement_final
SET_53:
setvar SECOND_MOVEMENT 53
goto set_movement_final
SET_54:
setvar SECOND_MOVEMENT 54
goto set_movement_final
SET_55:
setvar SECOND_MOVEMENT 55
goto set_movement_final
SET_56:
setvar SECOND_MOVEMENT 56
goto set_movement_final
SET_57:
setvar SECOND_MOVEMENT 57
goto set_movement_final
SET_58:
setvar SECOND_MOVEMENT 58
goto set_movement_final
SET_59:
setvar SECOND_MOVEMENT 59
goto set_movement_final
SET_60:
setvar SECOND_MOVEMENT 60
goto set_movement_final
SET_61:
setvar SECOND_MOVEMENT 61
goto set_movement_final
SET_62:
setvar SECOND_MOVEMENT 62
goto set_movement_final
SET_63:
setvar SECOND_MOVEMENT 63
goto set_movement_final
SET_64:
setvar SECOND_MOVEMENT 64
goto set_movement_final
SET_65:
setvar SECOND_MOVEMENT 65
goto set_movement_final
SET_66:
setvar SECOND_MOVEMENT 66
goto set_movement_final
SET_67:
setvar SECOND_MOVEMENT 67
goto set_movement_final
SET_68:
setvar SECOND_MOVEMENT 68
goto set_movement_final
SET_69:
setvar SECOND_MOVEMENT 69
goto set_movement_final
SET_70:
setvar SECOND_MOVEMENT 70
goto set_movement_final


set_movement_final:
setvar finaldirection %FIRST_MOVEMENT%SECOND_MOVEMENT
goto movingstart
exit

########### START OF MAIN SCRIPT ###############

intialise:
if "%finaldirection" = "0" then goto NOCHOICEMADE
goto movingstart



############ Where are we going ############

movingstart:

GROUP_CHECK:
put whisper group here we go
pause
goto MOVING_START_REAL


########################################################################################
##############################  START DIRECTIONS  ######################################
########################################################################################
###########################
### CROSSING LOCATIONS ###
###########################
MOVING_START_REAL:
if "%MOVESETALREADY" = "ON" then goto finaldirection_MOVE
if "%finaldirection" = "11" then setvar direction CROSSING_BANK
if "%finaldirection" = "12" then setvar direction CROSSING_GEMS
if "%finaldirection" = "13" then setvar direction CROSSING_TANNER
if "%finaldirection" = "14" then setvar direction CROSSING_METAL_REPAIRS
if "%finaldirection" = "15" then setvar direction CROSSING_LEATHER_REPAIRS
if "%finaldirection" = "16" then setvar direction CROSSING_WEAPON_SHOP
if "%finaldirection" = "17" then setvar direction CROSSING_ARMOR_SHOP
if "%finaldirection" = "18" then setvar direction CROSSING_GENERAL_STORE
if "%finaldirection" = "19" then setvar direction CROSSING_WOUND_HERBS
if "%finaldirection" = "110" then setvar direction CROSSING_SCAR_HEBS
if "%finaldirection" = "111" then setvar direction CROSSING_AGILITY
if "%finaldirection" = "112" then setvar direction CROSSING_REFLEX
if "%finaldirection" = "113" then setvar direction CROSSING_STRENGTH
if "%finaldirection" = "114" then setvar direction CROSSING_STAMINA
if "%finaldirection" = "115" then setvar direction CROSSING_CHARISMA
if "%finaldirection" = "116" then setvar direction CROSSING_DISCIPLINE
if "%finaldirection" = "117" then setvar direction CROSSING_WISDOM
if "%finaldirection" = "118" then setvar direction CROSSING_INTELLIGENCE
#######################
### CROSSING GUILDS ###
#######################
if "%finaldirection" = "131" then setvar direction CROSSING_GUILD_EMPATH
if "%finaldirection" = "132" then setvar direction CROSSING_GUILD_BARBARIAN
if "%finaldirection" = "133" then setvar direction CROSSING_GUILD_TRADER
if "%finaldirection" = "134" then setvar direction CROSSING_GUILD_WARRIOR_MAGE
if "%finaldirection" = "135" then setvar direction CROSSING_GUILD_CLERIC
if "%finaldirection" = "136" then setvar direction CROSSING_GUILD_RANGER
if "%finaldirection" = "137" then setvar direction CROSSING_GUILD_MOON_MAGE
########################
### CROSSING HUNTING ###
########################
if "%finaldirection" = "151" then setvar direction CROSSING_HUNTING_FORAGER_GOBLINS
if "%finaldirection" = "152" then setvar direction CROSSING_HUNTING_FIELD_GOBLINS
if "%finaldirection" = "153" then setvar direction CROSSING_HUNTING_GRASS_EELS
if "%finaldirection" = "154" then setvar direction CROSSING_HUNTING_YOUNG_OGRES
if "%finaldirection" = "155" then setvar direction CROSSING_HUNTING_COUGARS
if "%finaldirection" = "156" then setvar direction CROSSING_HUNTING_SLEAZY_LOUTS
if "%finaldirection" = "157" then setvar direction CROSSING_HUNTING_REVENANT_CONSCRIPTS
if "%finaldirection" = "158" then setvar direction CROSSING_HUNTING_PALE_DEATH_SPIRIT
if "%finaldirection" = "159" then setvar direction CROSSING_HUNTING_GOULS
if "%finaldirection" = "160" then setvar direction CROSSING_HUNTING_WOOD_TROLLS
if "%finaldirection" = "161" then setvar direction CROSSING_HUNTING_CROFF_PORHANITS
if "%finaldirection" = "162" then setvar direction CROSSING_HUNTING_TROLLKINS
if "%finaldirection" = "163" then setvar direction CROSSING_HUNTING_WATER_SPRITE
if "%finaldirection" = "164" then setvar direction CROSSING_HUNTING_RATS
##############################################################################################

##############################################################################################
############################
### NORTH ROAD LOCATIONS ###
############################
if "%finaldirection" = "21" then setvar direction NORTH_ROAD_ARTHE_DALE
if "%finaldirection" = "22" then setvar direction NORTH_ROAD_KAERENA
if "%finaldirection" = "23" then setvar direction NORTH_ROAD_FERRY_TO_HAVEN
if "%finaldirection" = "24" then setvar direction NORTH_ROAD_DIRGE
if "%finaldirection" = "25" then setvar direction NORTH_ROAD_GUILD_MOON_MAGE
###################
### ARTHE DALE  ###
###################
if "%finaldirection" = "210" then setvar direction ARTHE_DALE_MAP_SHOP
if "%finaldirection" = "211" then setvar direction ARTHE_DALE_THREAD_SHOP
if "%finaldirection" = "212" then setvar direction ARTHE_DALE_Phoebe_Fashions
if "%finaldirection" = "213" then setvar direction ARTHE_DALE_ARMOR
if "%finaldirection" = "214" then setvar direction ARTHE_DALE_BAKERY
if "%finaldirection" = "215" then setvar direction ARTHE_DALE_BARD_SHOP
##########################
### NORTH ROAD HUNTING ###
##########################
if "%finaldirection" = "250" then setvar direction NORTH_ROAD_HUNTING_ROCK_TROLLS
if "%finaldirection" = "251" then setvar direction NORTH_ROAD_HUNTING_VIPERS
if "%finaldirection" = "252" then setvar direction NORTH_ROAD_HUNTING_FAENRAE_REAVERS
if "%finaldirection" = "253" then setvar direction NORTH_ROAD_HUNTING_SLAI_SCOUTS
if "%finaldirection" = "254" then setvar direction NORTH_ROAD_HUNTING_BLACK_LEUCRO
if "%finaldirection" = "255" then setvar direction NORTH_ROAD_HUNTING_FIRE_SPRITES
if "%finaldirection" = "256" then setvar direction NORTH_ROAD_HUNTING_CROCODILES
if "%finaldirection" = "257" then setvar direction NORTH_ROAD_HUNTING_ROCK_GUARDIANS
if "%finaldirection" = "258" then setvar direction NORTH_ROAD_HUNTING_CAVE_BEARS
if "%finaldirection" = "259" then setvar direction NORTH_ROAD_HUNTING_MAULERS
if "%finaldirection" = "260" then setvar direction NORTH_ROAD_HUNTING_VIPERS
if "%finaldirection" = "261" then setvar direction NORTH_ROAD_HUNTING_WESTANURYN
##############################################################################################

##############################################################################################
##################################
### SOUTH TRADE ROAD SURROUNDS ###
##################################
if "%finaldirection" = "31" then setvar direction LETH_BANK
if "%finaldirection" = "32" then setvar direction LETH_GEMS
if "%finaldirection" = "33" then setvar direction LETH_TANNER
if "%finaldirection" = "35" then setvar direction LETH_GENERAL_STORE
if "%finaldirection" = "348" then setvar direction LETH_PERFUME
if "%finaldirection" = "345" then setvar direction LETH_ORIGAMI
if "%finaldirection" = "340" then setvar direction LETH_DYERS
if "%finaldirection" = "341" then setvar direction LETH_BOWYERS_SHOP
if "%finaldirection" = "342" then setvar direction LETH_CANDY_STORE
if "%finaldirection" = "343" then setvar direction LETH_CLOTHING_SHOP
if "%finaldirection" = "344" then setvar direction LETH_BARD_SHOP
if "%finaldirection" = "347" then setvar direction LETH_WICKERS_SHOP
if "%finaldirection" = "346" then setvar direction LETH_BAKERY
if "%finaldirection" = "349" then setvar direction LETH_TOWN_CENTRE
if "%finaldirection" = "350" then setvar direction SOUTH_TRADE_ROAD_NYADS
##############################################################################################

##############################################################################################
############################
### RIVERHAVEN LOCATIONS ###
############################
if "%finaldirection" = "41" then setvar direction RIVERHAVEN_BANK
if "%finaldirection" = "42" then setvar direction RIVERHAVEN_GEMS
if "%finaldirection" = "43" then setvar direction RIVERHAVEN_TANNER
if "%finaldirection" = "44" then setvar direction RIVERHAVEN_METAL_REPAIRS
if "%finaldirection" = "45" then setvar direction RIVERHAVEN_LEATHER_REPAIRS
if "%finaldirection" = "46" then setvar direction RIVERHAVEN_WEAPON_SHOP
if "%finaldirection" = "47" then setvar direction RIVERHAVEN_ARMOR_SHOP
if "%finaldirection" = "48" then setvar direction RIVERHAVEN_GENERAL_STORE
if "%finaldirection" = "49" then setvar direction RIVERHAVEN_WOUND_HERBS
if "%finaldirection" = "410" then setvar direction RIVERHAVEN_SCAR_HEBS
if "%finaldirection" = "411" then setvar direction RIVERHAVEN_FERRY_CROSSING
if "%finaldirection" = "412" then setvar direction RIVERHAVEN_BOAT_THRONE_CITY
if "%finaldirection" = "413" then setvar direction RIVERHAVEN_AGILITY
if "%finaldirection" = "414" then setvar direction RIVERHAVEN_REFLEX
if "%finaldirection" = "415" then setvar direction RIVERHAVEN_STRENGTH
if "%finaldirection" = "416" then setvar direction RIVERHAVEN_STAMINA
if "%finaldirection" = "417" then setvar direction RIVERHAVEN_CHARISMA
if "%finaldirection" = "418" then setvar direction RIVERHAVEN_DISCIPLINE
if "%finaldirection" = "419" then setvar direction RIVERHAVEN_WISDOM
if "%finaldirection" = "420" then setvar direction RIVERHAVEN_INTELLIGENCE
if "%finaldirection" = "421" then setvar direction RIVERHAVEN_BOAT_TO_AESRY
if "%finaldirection" = "422" then setvar direction RIVERHAVEN_BOAT_TO_RATHA
if "%finaldirection" = "423" then setvar direction RIVERHAVEN_BARGE_TO_LANG
#########################
### RIVERHAVEN GUILDS ###
#########################
if "%finaldirection" = "431" then setvar direction RIVERHAVEN_GUILD_EMPATH
if "%finaldirection" = "432" then setvar direction RIVERHAVEN_GUILD_BARBARIAN
if "%finaldirection" = "433" then setvar direction RIVERHAVEN_GUILD_TRADER
if "%finaldirection" = "434" then setvar direction RIVERHAVEN_GUILD_WARRIOR_MAGE
if "%finaldirection" = "435" then setvar direction RIVERHAVEN_GUILD_CLERIC
if "%finaldirection" = "436" then setvar direction RIVERHAVEN_GUILD_RANGER
##########################
### RIVERHAVEN HUNTING ###
##########################
if "%finaldirection" = "450" then setvar direction RIVERHAVEN_HUNTING_SWAMP_TROLLS
if "%finaldirection" = "451" then setvar direction RIVERHAVEN_HUNTING_SERPANTS_VIPERS
if "%finaldirection" = "452" then setvar direction RIVERHAVEN_HUNTING_WILDLAND_GOBLINS
if "%finaldirection" = "453" then setvar direction RIVERHAVEN_HUNTING_ZOMBIE_GOBLINS
if "%finaldirection" = "454" then setvar direction RIVERHAVEN_HUNTING_UNYNS
if "%finaldirection" = "455" then setvar direction RIVERHAVEN_HUNTING_SHAMANS_RAMS
if "%finaldirection" = "456" then setvar direction RIVERHAVEN_HUNTING_DUSK_OGRES
if "%finaldirection" = "457" then setvar direction RIVERHAVEN_HUNTING_YOUNG_OGRES
if "%finaldirection" = "458" then setvar direction RIVERHAVEN_HUNTING_ARBELOGS
if "%finaldirection" = "459" then setvar direction RIVERHAVEN_HUNTING_BARGHEST
####################
### THRONE CITY  ###
####################
if "%finaldirection" = "460" then setvar direction THRONE_CITY_GATE
if "%finaldirection" = "461" then setvar direction THRONE_CITY_GEM_SHOP
##############################################################################################

##############################################################################################
##########################
### LANG AND SURROUNDS ###
##########################
if "%finaldirection" = "520" then setvar direction LANG_LEATHER_REPAIRS
if "%finaldirection" = "521" then setvar direction LANG_TANNER
if "%finaldirection" = "522" then setvar direction LANG_ARMOR_SHOP
if "%finaldirection" = "523" then setvar direction LANG_LEATHER_REPAIRS
if "%finaldirection" = "524" then setvar direction LANG_FURNITURE_STORE
if "%finaldirection" = "525" then setvar direction LANG_FISH_BUYER
if "%finaldirection" = "526" then setvar direction LANG_HERBALIST
if "%finaldirection" = "527" then setvar direction LANG_PAWNSHOP
############################
### THEREN KEEP AND TOWN ###
############################
if "%finaldirection" = "51" then setvar direction THEREN_BANK
if "%finaldirection" = "52" then setvar direction THEREN_GEMS
if "%finaldirection" = "53" then setvar direction THEREN_FUR_BUYER
if "%finaldirection" = "54" then setvar direction THEREN_METAL_REPAIRS
if "%finaldirection" = "55" then setvar direction THEREN_LEATHER_REPAIRS
if "%finaldirection" = "56" then setvar direction THEREN_GENERAL_STORE
if "%finaldirection" = "57" then setvar direction THEREN_CLOTHING
if "%finaldirection" = "58" then setvar direction THEREN_ENGRAVING
if "%finaldirection" = "59" then setvar direction THEREN_DOORS
if "%finaldirection" = "510" then setvar direction THEREN_TABLES
if "%finaldirection" = "511" then setvar direction THEREN_BEDS
if "%finaldirection" = "512" then setvar direction THEREN_WALLS
if "%finaldirection" = "513" then setvar direction THEREN_PAWNSHOP
####################
### LANG HUNTING ###
####################
if "%finaldirection" = "550" then setvar direction LANG_HUNTING_VINES
if "%finaldirection" = "551" then setvar direction LANG_HUNTING_MARUADERS
if "%finaldirection" = "552" then setvar direction LANG_HUNTING_BLOOD_WOLVES
if "%finaldirection" = "553" then setvar direction LANG_HUNTING_THUNDER_RAMS
if "%finaldirection" = "554" then setvar direction LANG_HUNTING_SWAMP_TROLL
if "%finaldirection" = "555" then setvar direction LANG_HUNTING_FENDRYAD
if "%finaldirection" = "556" then setvar direction LANG_HUNTING_SPIDERS
if "%finaldirection" = "557" then setvar direction LANG_HUNTING_KELPIES
########################
### ROSSMANS LANDING ###
########################
if "%finaldirection" = "560" then setvar direction ROSSMANS_TOWN_GATE
##############################################################################################

##############################################################################################
##########################
### SOUTH TRADE ROAD   ###
##########################
if "%finaldirection" = "61" then setvar direction SOUTH_TRADE_ROAD_BRIDAL_SHOP
if "%finaldirection" = "62" then setvar direction SOUTH_TRADE_ROAD_CLERICAL_SUPPLIES
if "%finaldirection" = "63" then setvar direction SOUTH_TRADE_ROAD_MENS_ATTIRE
if "%finaldirection" = "64" then setvar direction SOUTH_TRADE_ROAD_WOMANS_CLOTHING
if "%finaldirection" = "65" then setvar direction SOUTH_TRADE_ROAD_BOOTS
if "%finaldirection" = "66" then setvar direction SOUTH_TRADE_ROAD_CATERING
if "%finaldirection" = "67" then setvar direction SOUTH_TRADE_ROAD_JEWLERY
if "%finaldirection" = "610" then setvar direction SOUTH_TRADE_ROAD_WEAPONS
if "%finaldirection" = "611" then setvar direction SOUTH_TRADE_ROAD_GENERAL_STORE
if "%finaldirection" = "612" then setvar direction SOUTH_TRADE_ROAD_HERBALIST
if "%finaldirection" = "613" then setvar direction SOUTH_TRADE_ROAD_FEASTERY
if "%finaldirection" = "614" then setvar direction SOUTH_TRADE_ROAD_BIABOS
if "%finaldirection" = "653" then setvar direction SOUTH_TRADE_ROAD_BONE_WOLVES
if "%finaldirection" = "654" then setvar direction SOUTH_TRADE_ROAD_GERMISH
if "%finaldirection" = "655" then setvar direction SOUTH_TRADE_ROAD_KARTAIS
##################
### STEAL CLAN ###
##################
if "%finaldirection" = "621" then setvar direction SOUTH_TRADE_ROAD_STEAL_CLAN_ARMOR
if "%finaldirection" = "622" then setvar direction SOUTH_TRADE_ROAD_STEAL_CLAN_HORSE
if "%finaldirection" = "623" then setvar direction SOUTH_TRADE_ROAD_STEAL_CLAN_STABLE
if "%finaldirection" = "624" then setvar direction SOUTH_TRADE_ROAD_STEAL_CLAN_ARMOR
if "%finaldirection" = "625" then setvar direction SOUTH_TRADE_ROAD_STEAL_CLAN_METAL_REPAIR
if "%finaldirection" = "626" then setvar direction SOUTH_TRADE_ROAD_STEAL_CLAN_TAVERN
###########################
### SOUTH TRADE HUNTING ###
###########################
if "%finaldirection" = "650" then setvar direction SOUTH_TRADE_ROAD_SNOWBEASTS
if "%finaldirection" = "651" then setvar direction SOUTH_TRADE_ROAD_GARGOYLES
if "%finaldirection" = "652" then setvar direction SOUTH_TRADE_ROAD_JACKLES
##############################################################################################

##############################################################################################
####################
### SHARD TOWN   ###
####################
if "%finaldirection" = "71" then setvar direction SHARD_BANK
if "%finaldirection" = "72" then setvar direction SHARD_GEMS
if "%finaldirection" = "73" then setvar direction SHARD_TANNER
if "%finaldirection" = "74" then setvar direction SHARD_METAL_REPAIRS
if "%finaldirection" = "76" then setvar direction SHARD_WEAPON_SHOP
if "%finaldirection" = "77" then setvar direction SHARD_ARMOR_SHOP
if "%finaldirection" = "78" then setvar direction SHARD_GENERAL_STORE
if "%finaldirection" = "79" then setvar direction SHARD_BARD_SHOP
if "%finaldirection" = "710" then setvar direction SHARD_ARTIFICER
if "%finaldirection" = "712" then setvar direction SHARD_BOWERY
if "%finaldirection" = "713" then setvar direction SHARD_HERBILIST
if "%finaldirection" = "714" then setvar direction SHARD_PAWNSHOP
if "%finaldirection" = "715" then setvar direction SHARD_STICHERY
####################
### SHARD GUILDS   ###
####################
if "%finaldirection" = "731" then setvar direction SHARD_EMPATHS_GUILD
if "%finaldirection" = "732" then setvar direction SHARD_BARBARIAN_GUILD
if "%finaldirection" = "733" then setvar direction SHARD_TRADERS_GUILD
if "%finaldirection" = "734" then setvar direction SHARD_WAR_MAGE_GUILD
if "%finaldirection" = "735" then setvar direction SHARD_CLERICS_GUILD
if "%finaldirection" = "736" then setvar direction SHARD_RANGER_GUILD
if "%finaldirection" = "737" then setvar direction SHARD_MOON_MAGE_GUILD
####################
### SHARD HUNTING###
####################
if "%finaldirection" = "750" then setvar direction SHARD_ROCK_TROLLS_NORMAL
if "%finaldirection" = "751" then setvar direction SHARD_ROCK_TROLLS_SUPER
if "%finaldirection" = "752" then setvar direction SHARD_DRAGON_FANATICS
if "%finaldirection" = "753" then setvar direction SHARD_EIDOLON_STEED
if "%finaldirection" = "754" then setvar direction SHARD_ADFAN
if "%finaldirection" = "755" then setvar direction SHARD_DRAGON_PRIEST
if "%finaldirection" = "756" then setvar direction SHARD_SMALL_PECCARY
if "%finaldirection" = "757" then setvar direction SHARD_COUDED_ARZUMOS
if "%finaldirection" = "758" then setvar direction SHARD_GRASS_EELS
if "%finaldirection" = "759" then setvar direction SHARD_ELSREAL
##############################################################################################
##############################  END FINAL DIRECTIONS  ########################################
##############################################################################################

finaldirection_MOVE:
setvar MOVESETALREADY ON
gosub MOVE_%direction
gosub movingstart

WEALTH_CHECK:
send wealth
return



MOVE_ROSSMANS_TOWN_GATE:

setvar storeroomnumber 3
setvar waitingroom Rossman's Landing, Southeast Gate
if "$zoneid" = "34" and "$roomid" = "3" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "34" then gosub MOVE_FINAL
if "$zoneid" != "34" then gosub MOVE_TO_ROSSMANS_TOWN
goto MOVE_ROSSMANS_TOWN_GATE

###################################################################################
####################### LOCATIONS MOVEMENT START  #################################
###################################################################################
##########################
### CROSSING LOCATIONS ###
##########################

MOVE_CROSSING_BANK:
setvar storeroomnumber 232
setvar waitingroom First Provincial Bank, Lobby
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_BANK

MOVE_CROSSING_GEMS:
Setvar storeroomnumber 399
setvar waitingroom Grisgonda's, Appraisal Room
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GEMS

MOVE_CROSSING_TANNER:
Setvar storeroomnumber 221
setvar waitingroom Falken's Tannery, Workshop
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_TANNER

MOVE_CROSSING_METAL_REPAIRS:
Setvar storeroomnumber 229
setvar waitingroom Catrox's Forge, Entryway
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_METAL_REPAIRS

MOVE_CROSSING_LEATHER_REPAIRS:
Setvar storeroomnumber 141
setvar waitingroom Randal's Leather Repair, Work Room
if "$zoneid" = "4" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4" then gosub MOVE_FINAL
if "$zoneid" != "4" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_LEATHER_REPAIRS

MOVE_CROSSING_WEAPON_SHOP:
Setvar storeroomnumber 192
setvar waitingroom Milgrym's Weapons, Showroom
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_WEAPON_SHOP

MOVE_CROSSING_ARMOR_SHOP:
Setvar storeroomnumber 193
setvar waitingroom Tembeg's Armory, Salesroom
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_ARMOR_SHOP

MOVE_CROSSING_GENERAL_STORE:
Setvar storeroomnumber 190
setvar waitingroom Berolt's Dry Goods, Showroom
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GENERAL_STORE

MOVE_CROSSING_WOUND_HERBS:
Setvar storeroomnumber 220
setvar waitingroom Mauriga's Botanicals, Salesroom
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_WOUND_HERBS

MOVE_CROSSING_SCAR_HEBS:
Setvar storeroomnumber 13
setvar waitingroom Tiger Clan Home, Small Cottage
if "$zoneid" = "4a" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4a" then gosub MOVE_FINAL
if "$zoneid" != "4a" then gosub MOVE_TO_TIGER_CLAN
goto MOVE_CROSSING_SCAR_HEBS

MOVE_CROSSING_AGILITY:
setvar storeroomnumber 394
setvar waitingroom The Academy of Agility
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_AGILITY

MOVE_CROSSING_REFLEX:
Setvar storeroomnumber 416
setvar waitingroom Rartan's Collegium of Inner Juggling and Reflexology
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_REFLEX

MOVE_CROSSING_STRENGTH:
Setvar storeroomnumber 195
setvar waitingroom Tembeg's Armory, Bellows Room
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_STRENGTH

MOVE_CROSSING_STAMINA:
Setvar storeroomnumber 320
setvar waitingroom Barbarian Guild, Stamina Training Room
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_STAMINA

MOVE_CROSSING_CHARISMA:
Setvar storeroomnumber 487
setvar waitingroom Woodruff's Recitation Room
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_CHARISMA

MOVE_CROSSING_DISCIPLINE:
Setvar storeroomnumber 393
setvar waitingroom A Mud Hovel
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_DISCIPLINE

MOVE_CROSSING_WISDOM:
Setvar storeroomnumber 213
setvar waitingroom Asemath Academy, Classroom
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_WISDOM

MOVE_CROSSING_INTELLIGENCE:
Setvar storeroomnumber 214
setvar waitingroom Asemath Academy, Classroom
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_INTELLIGENCE

#######################
### CROSSING GUILDS ###
#######################
##############################################################################################
MOVE_CROSSING_GUILD_EMPATH:
Setvar storeroomnumber 326
setvar waitingroom Empaths' Guild, Main Room
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GUILD_EMPATH

MOVE_CROSSING_GUILD_BARBARIAN:
Setvar storeroomnumber 321
setvar waitingroom Barbarian Guild, Main Hall
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GUILD_BARBARIAN

MOVE_CROSSING_GUILD_TRADER:
Setvar storeroomnumber 358
setvar waitingroom Traders' Guild, Main Hall
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GUILD_TRADER


MOVE_CROSSING_GUILD_WARRIOR_MAGE:
Setvar storeroomnumber 12
setvar waitingroom Warrior Mage Guild, Foyer
if "$zoneid" = "7" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "7" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_CROSSING_GUILD_WARRIOR_MAGE

MOVE_CROSSING_GUILD_CLERIC:
Setvar storeroomnumber 366
setvar waitingroom Clerics' Guild, Gathering Hall
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GUILD_CLERIC

MOVE_CROSSING_GUILD_RANGER:
Setvar storeroomnumber 127
setvar waitingroom The town wall here is overgrown with flowering vines and herbs
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_GUILD_RANGER

MOVE_CROSSING_GUILD_MOON_MAGE:
Setvar storeroomnumber 60
setvar waitingroom Before you stands the Observatory of the Southern Crossbow.
if "$zoneid" = "8" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "8" then gosub MOVE_FINAL
if "$zoneid" != "8" then gosub MOVE_TO_CROSSING_EAST_GATE
goto MOVE_CROSSING_GUILD_MOON_MAGE

########################
### CROSSING HUNTING ###
########################
##############################################################################################
MOVE_CROSSING_HUNTING_FORAGER_GOBLINS:
Setvar storeroomnumber 57
setvar waitingroom Farmland, Open Area
if "$zoneid" = "4" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4" then gosub MOVE_FINAL
if "$zoneid" != "4" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_HUNTING_FORAGER_GOBLINS

MOVE_CROSSING_HUNTING_FIELD_GOBLINS:
Setvar storeroomnumber 57
setvar waitingroom Farmland, Open Area
if "$zoneid" = "4" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4" then gosub MOVE_FINAL
if "$zoneid" != "4" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_HUNTING_FIELD_GOBLINS

MOVE_CROSSING_HUNTING_GRASS_EELS:
Setvar storeroomnumber 45
setvar waitingroom Applebrandy River, Riverbed
if "$zoneid" = "4" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4" then gosub MOVE_FINAL
if "$zoneid" != "4" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_HUNTING_GRASS_EELS

MOVE_CROSSING_HUNTING_YOUNG_OGRES:
setvar storeroomnumber 119
setvar waitingroom Rocky Outcrop
if "$zoneid" = "5" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4" then gosub MOVE_FINAL
if "$zoneid" != "4" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_HUNTING_YOUNG_OGRES

MOVE_CROSSING_HUNTING_COUGARS:
Setvar storeroomnumber 106
setvar waitingroom An array of mushrooms thrive here in the moist loamy soil,
if "$zoneid" = "4" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "4" then gosub MOVE_FINAL
if "$zoneid" != "4" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_HUNTING_COUGARS

MOVE_CROSSING_HUNTING_SLEAZY_LOUTS:
Setvar storeroomnumber 9
setvar waitingroom Very surly, very rank Gor'Togs shoulder by you,
if "$zoneid" = "8" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "8" then gosub MOVE_FINAL
if "$zoneid" != "8" then gosub MOVE_TO_CROSSING_EAST_GATE
goto MOVE_CROSSING_HUNTING_SLEAZY_LOUTS

MOVE_CROSSING_HUNTING_REVENANT_CONSCRIPTS:
Setvar storeroomnumber 106
setvar waitingroom Fort Motte, Ruins
if "$zoneid" = "8" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "8" then gosub MOVE_FINAL
if "$zoneid" != "8" then gosub MOVE_TO_CROSSING_EAST_GATE
goto MOVE_CROSSING_HUNTING_REVENANT_CONSCRIPTS

MOVE_CROSSING_HUNTING_PALE_DEATH_SPIRIT:
Setvar storeroomnumber 70
setvar waitingroom Old Sewers, Western Conduit
if "$zoneid" = "8a" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "8" then gosub MOVE_FINAL
if "$zoneid" != "8a" then gosub MOVE_TO_CROSSING_EAST_GATE
goto MOVE_CROSSING_HUNTING_PALE_DEATH_SPIRIT

MOVE_CROSSING_HUNTING_GOULS:
Setvar storeroomnumber 29
setvar waitingroom 
if "$zoneid" = "8" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "8" then gosub MOVE_FINAL
if "$zoneid" != "8" then gosub MOVE_TO_CROSSING_EAST_GATE
goto MOVE_CROSSING_HUNTING_GOULS

MOVE_CROSSING_HUNTING_WOOD_TROLLS:
Setvar storeroomnumber 33
setvar waitingroom Northeast Wilds, Fields
if "$zoneid" = "7" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "7" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_CROSSING_HUNTING_WOOD_TROLLS

MOVE_CROSSING_HUNTING_CROFF_PORHANITS:
Setvar storeroomnumber 25
setvar waitingroom Brambles
if "$zoneid" = "6" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "6" then gosub MOVE_FINAL
if "$zoneid" != "6" then gosub MOVE_TO_CROSSING_NORTH_GATE
goto MOVE_CROSSING_HUNTING_CROFF_PORHANITS

MOVE_CROSSING_HUNTING_TROLLKINS:
Setvar storeroomnumber 71
setvar waitingroom A rutted animal track runs between and around a number of thorny brambles.
if "$zoneid" = "6" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "6" then gosub MOVE_FINAL
if "$zoneid" != "6" then gosub MOVE_TO_CROSSING_NORTH_GATE
goto MOVE_CROSSING_HUNTING_TROLLKINS

MOVE_CROSSING_HUNTING_WATER_SPRITE:
Setvar storeroomnumber 1
setvar waitingroom Laakvor
if "$zoneid" = "2" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "2" then gosub MOVE_FINAL
if "$zoneid" != "2" then gosub MOVE_TO_CROSSING_WEST_GATE
goto MOVE_CROSSING_HUNTING_WATER_SPRITE

MOVE_CROSSING_HUNTING_RATS:
Setvar storeroomnumber 238
setvar waitingroom Barana's Shipyard, Receiving Yard
if "$zoneid" = "1" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "1" then gosub MOVE_FINAL
if "$zoneid" != "1" then gosub MOVE_TO_CROSSING_TOWN
goto MOVE_CROSSING_HUNTING_RATS
##############################################################################################
##############################################################################################
############################
### NORTH ROAD LOCATIONS ###
############################
##############################################################################################
MOVE_ARTHE_DALE_BAKERY:
Setvar storeroomnumber 80
setvar waitingroom Feta's Kitchen, Fresh Dairy and Baked Goods
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7b" then gosub MOVE_FINAL
if "$zoneid" != "7b" then gosub MOVE_ARTHE_DALE_TOWN_FINAL
goto MOVE_ARTHE_DALE_BAKERY

MOVE_ARTHE_DALE_THREAD_SHOP:
Setvar storeroomnumber 74
setvar waitingroom Quellia's Thread Shop, Sales Room
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7b" then gosub MOVE_FINAL
if "$zoneid" != "7b" then gosub MOVE_ARTHE_DALE_TOWN_FINAL
goto MOVE_ARTHE_DALE_THREAD_SHOP

MOVE_ARTHE_DALE_MAP_SHOP:
Setvar storeroomnumber 35
setvar waitingroom Arthe Dale, Glaysker Lane
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7b" then gosub MOVE_FINAL
if "$zoneid" != "7b" then gosub MOVE_ARTHE_DALE_TOWN_FINAL
goto MOVE_ARTHE_DALE_MAP_SHOP

MOVE_ARTHE_DALE_ARMOR:
Setvar storeroomnumber 78
setvar waitingroom Bobba's Arms and Armor
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7b" then gosub MOVE_FINAL
if "$zoneid" != "7b" then gosub MOVE_ARTHE_DALE_TOWN_FINAL
goto MOVE_ARTHE_DALE_ARMOR

MOVE_ARTHE_DALE_BARD_SHOP:
Setvar storeroomnumber 77
setvar waitingroom Barley Bulrush, Bardic Ballads
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7b" then gosub MOVE_FINAL
if "$zoneid" != "7b" then gosub MOVE_ARTHE_DALE_TOWN_FINAL
goto MOVE_ARTHE_DALE_BARD_SHOP

MOVE_ARTHE_DALE_Phoebe_Fashions:
Setvar storeroomnumber 75
setvar waitingroom Phoebe's Fashions, Sales Room
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7b" then gosub MOVE_FINAL
if "$zoneid" != "7b" then gosub MOVE_ARTHE_DALE_TOWN_FINAL
goto MOVE_ARTHE_DALE_Phoebe_Fashions


MOVE_NORTH_ROAD_ARTHE_DALE:
Setvar storeroomnumber 2
setvar waitingroom Arthe Dale, Village Gate
if "$zoneid" = "7b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "7" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_ARTHE_DALE
##############################################################################################

##############################################################################################
MOVE_NORTH_ROAD_KAERENA:
Setvar storeroomnumber 123
setvar waitingroom Kaerna Village, By the General Store
if "$zoneid" = "7" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "7" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_KAERENA


MOVE_NORTH_ROAD_DIRGE:
Setvar storeroomnumber 46
setvar waitingroom Lava Fields, Narrow Trace
if "$zoneid" = "13" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7c" then gosub MOVE_FINAL
if "$zoneid" != "7c" then gosub MOVE_NORTH_TRADE_ROUTE_PART_2
goto MOVE_NORTH_ROAD_DIRGE

MOVE_NORTH_ROAD_GUILD_MOON_MAGE:
Setvar storeroomnumber 30
setvar waitingroom 
if "$zoneid" = "14d" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7c" then gosub GET_THROUGH_FLOW_NORTH
if "$zoneid" != "7c" then gosub MOVE_NORTH_TRADE_ROUTE_TO_FERRY_SIDE
goto MOVE_NORTH_ROAD_GUILD_MOON_MAGE

MOVE_NORTH_ROAD_FERRY_TO_HAVEN:
Setvar storeroomnumber 120
setvar waitingroom North Road, Ferry
if "$zoneid" = "7c" and "$roomid" = "%storeroomnumber" then goto CROSSINGFERRYNORTH
if "$zoneid" = "7c" then gosub GET_THROUGH_FLOW_NORTH
if "$zoneid" != "7c" then gosub MOVE_NORTH_TRADE_ROUTE_TO_FERRY_SIDE
goto MOVE_NORTH_ROAD_FERRY_TO_HAVEN

##############################################################################################
##########################
### NORTH ROAD HUNTING ###
##########################
##############################################################################################
MOVE_NORTH_ROAD_HUNTING_ROCK_TROLLS:
Setvar storeroomnumber 138
setvar waitingroom Journalai Route, Foothills
if "$zoneid" = "9a" and "$roomid" = "2" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "7" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_ROCK_TROLLS

MOVE_NORTH_ROAD_HUNTING_CROCODILES:
Setvar storeroomnumber 122
setvar waitingroom The Marsh, In The Water
if "$zoneid" = "7c" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7c" then gosub MOVE_FINAL
if "$zoneid" != "7c" then gosub MOVE_NORTH_TRADE_ROUTE_PART_2
goto MOVE_NORTH_ROAD_HUNTING_CROCODILES

MOVE_NORTH_ROAD_HUNTING_FAENRAE_REAVERS:
Setvar storeroomnumber 41
setvar waitingroom Forest Path
if "$zoneid" = "12" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "12" then gosub MOVE_FINAL
if "$zoneid" != "12" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_FAENRAE_REAVERS

MOVE_NORTH_ROAD_HUNTING_SLAI_SCOUTS:
Setvar storeroomnumber 889
setvar waitingroom Foothills, Stony Incline
if "$zoneid" = "9b" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "9b" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_SLAI_SCOUTS

MOVE_NORTH_ROAD_HUNTING_VIPERS:
Setvar storeroomnumber 131
setvar waitingroom Wilderness, Overgrown Path
if "$zoneid" = "11" and "$roomid" = "9" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "11" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_VIPERS

MOVE_NORTH_ROAD_HUNTING_FIRE_SPRITES:
Setvar storeroomnumber 71
setvar waitingroom Sicle Grove, Atop Gateway
if "$zoneid" = "7c" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7c" then gosub MOVE_FINAL
if "$zoneid" != "7c" then gosub MOVE_NORTH_TRADE_ROUTE_PART_2
goto MOVE_NORTH_ROAD_HUNTING_FIRE_SPRITES

MOVE_NORTH_ROAD_HUNTING_ROCK_GUARDIANS:
Setvar storeroomnumber 131
setvar waitingroom Wilderness, Overgrown Path
if "$zoneid" = "11" and "$roomid" = "1" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "11" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_ROCK_GUARDIANS

MOVE_NORTH_ROAD_HUNTING_CAVE_BEARS:
Setvar storeroomnumber 133
setvar waitingroom Foothills, Stony Incline
if "$zoneid" = "10" and "$roomid" = "21" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "10" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_CAVE_BEARS

MOVE_NORTH_ROAD_HUNTING_MAULERS:
Setvar storeroomnumber 133
setvar waitingroom Foothills, Stony Incline
if "$zoneid" = "10" and "$roomid" = "21" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "10" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_MAULERS

MOVE_NORTH_ROAD_HUNTING_BLACK_LEUCRO:
Setvar storeroomnumber 131
setvar waitingroom Wilderness, Overgrown Path
if "$zoneid" = "11" and "$roomid" = "1" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "7" then gosub MOVE_FINAL
if "$zoneid" != "11" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_HUNTING_BLACK_LEUCRO

MOVE_NORTH_ROAD_WESTANURYN:
Setvar storeroomnumber 133
setvar waitingroom Foothills, Stony Incline
if "$zoneid" = "10" and "$roomid" = "%storeroomnumber" then goto YOU_HAVE_ARRIVED
if "$zoneid" = "10" then gosub MOVE_FINAL
if "$zoneid" != "10" then gosub MOVE_NORTH_TRADE_ROUTE_PART_1
goto MOVE_NORTH_ROAD_WESTANURYN


############################
### RIVERHAVEN LOCATIONS ###
############################

MOVE_RIVERHAVEN_BANK:
Setvar storeroomnumber 155
setvar waitingroom Bank of Riverhaven, Main Lobby
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_BANK

MOVE_RIVERHAVEN_GEMS:
Setvar storeroomnumber 171
setvar waitingroom Anthelorm's Gems and Curios, Purchasing Office
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GEMS

MOVE_RIVERHAVEN_TANNER:
Setvar storeroomnumber 172
setvar waitingroom Fara's Furs, Showroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_TANNER

MOVE_RIVERHAVEN_METAL_REPAIRS:
Setvar storeroomnumber 208
setvar waitingroom Unspiek's Repair Shop, Workroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_METAL_REPAIRS

MOVE_RIVERHAVEN_LEATHER_REPAIRS:
Setvar storeroomnumber 209
setvar waitingroom Seli's Armory, Sales Room
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_LEATHER_REPAIRS

MOVE_RIVERHAVEN_WEAPON_SHOP:
Setvar storeroomnumber 164
setvar waitingroom Thringol's Weapon Shop, Salesroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_WEAPON_SHOP

MOVE_RIVERHAVEN_ARMOR_SHOP:
Setvar storeroomnumber 173
setvar waitingroom Noel's Arms, Showroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_ARMOR_SHOP

MOVE_RIVERHAVEN_GENERAL_STORE:
Setvar storeroomnumber 200
setvar waitingroom Enfermine's Dry Goods, Showroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GENERAL_STORE

MOVE_RIVERHAVEN_WOUND_HERBS:
Setvar storeroomnumber 149
setvar waitingroom Crin's Herbal Shop, Salesroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_WOUND_HERBS

MOVE_RIVERHAVEN_SCAR_HEBS:
Setvar storeroomnumber 149
setvar waitingroom Crin's Herbal Shop, Salesroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_SCAR_HEBS

MOVE_RIVERHAVEN_FERRY_CROSSING:
Setvar storeroomnumber 103
setvar waitingroom Riverhaven, Ferry Dock
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_FERRY_CROSSING

MOVE_RIVERHAVEN_BOAT_THRONE_CITY:
Setvar storeroomnumber 82
setvar waitingroom Salt Yard, Barge Dock
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_BOAT_THRONE_CITY

MOVE_RIVERHAVEN_AGILITY:
Setvar storeroomnumber 210
setvar waitingroom Riverhaven, Dance Academy
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_AGILITY

MOVE_RIVERHAVEN_REFLEX:
Setvar storeroomnumber 138
setvar waitingroom Riverhaven, Brebokt's Tent
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_REFLEX

MOVE_RIVERHAVEN_STRENGTH:
Setvar storeroomnumber 206
setvar waitingroom Bantheld's Ironworks, Salesroom
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_STRENGTH

MOVE_RIVERHAVEN_STAMINA:
Setvar storeroomnumber 29
setvar waitingroom 
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_STAMINA

MOVE_RIVERHAVEN_CHARISMA:
Setvar storeroomnumber 214
setvar waitingroom Academy, Lecture Hall
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_CHARISMA

MOVE_RIVERHAVEN_DISCIPLINE:
Setvar storeroomnumber 211
setvar waitingroom Temple, Shadowy Chamber
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_DISCIPLINE

MOVE_RIVERHAVEN_WISDOM:
Setvar storeroomnumber 215
setvar waitingroom Academy, Lecture Hall
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_WISDOM

MOVE_RIVERHAVEN_INTELLIGENCE:
Setvar storeroomnumber 216
setvar waitingroom Academy, Lecture Hall
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_INTELLIGENCE

MOVE_RIVERHAVEN_BOAT_TO_AESRY:
Setvar storeroomnumber 104
setvar waitingroom Riverhaven, East Pier
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto RIVERHAVEN_BOAT_TO_AESRY

MOVE_RIVERHAVEN_BOAT_TO_RATHA:
Setvar storeroomnumber 104
setvar waitingroom Riverhaven, East Pier
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_BOAT_TO_RATHA


#########################
### RIVERHAVEN GUILDS ###
#########################

MOVE_RIVERHAVEN_GUILD_EMPATH:
Setvar storeroomnumber 152
setvar waitingroom Empaths' Guild, Entrance
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GUILD_EMPATH

MOVE_RIVERHAVEN_GUILD_BARBARIAN:
Setvar storeroomnumber 91
setvar waitingroom 
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN_WEST_GATE
goto MOVE_RIVERHAVEN_GUILD_BARBARIAN

MOVE_RIVERHAVEN_GUILD_TRADER:
Setvar storeroomnumber 137
setvar waitingroom Traders' Guild, Shipping Dock
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GUILD_TRADER

MOVE_RIVERHAVEN_GUILD_WARRIOR_MAGE:
Setvar storeroomnumber 114
setvar waitingroom Riverhaven, A Garden Path
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GUILD_WARRIOR_MAGE

MOVE_RIVERHAVEN_GUILD_CLERIC:
Setvar storeroomnumber 217
setvar waitingroom Clerics' Guild, Main Entrance
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GUILD_CLERIC

MOVE_RIVERHAVEN_GUILD_RANGER:
Setvar storeroomnumber 78
setvar waitingroom 
if "$zoneid" = "31" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "31" then gosub MOVE_FINAL
if "$zoneid" != "31" then gosub MOVE_TO_RIVERHAVEN_EAST_GATE
goto MOVE_RIVERHAVEN_GUILD_RANGER

MOVE_RIVERHAVEN_GUILD_MOON_MAGE:
Setvar storeroomnumber 29
setvar waitingroom 
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GUILD_MOON_MAGE

MOVE_RIVERHAVEN_GUILD_BARD:
Setvar storeroomnumber 140
setvar waitingroom Bards' Guild, Performance Hall
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_TOWN
goto MOVE_RIVERHAVEN_GUILD_BARD


##########################
### RIVERHAVEN HUNTING ###
##########################

MOVE_RIVERHAVEN_HUNTING_SWAMP_TROLLS:
Setvar storeroomnumber 38
setvar waitingroom Zaulfung, Chickee
if "$zoneid" = "31" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "31" then gosub MOVE_FINAL
if "$zoneid" != "31" then gosub MOVE_TO_RIVERHAVEN_EAST_GATE
goto MOVE_RIVERHAVEN_HUNTING_SWAMP_TROLLS

MOVE_RIVERHAVEN_HUNTING_SERPANTS_VIPERS:
Setvar storeroomnumber 52
setvar waitingroom Pejek Bog, Following A Brook
if "$zoneid" = "31" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "31" then gosub MOVE_FINAL
if "$zoneid" != "31" then gosub MOVE_TO_RIVERHAVEN_EAST_GATE
goto MOVE_RIVERHAVEN_HUNTING_SERPANTS_VIPERS

MOVE_RIVERHAVEN_HUNTING_WILDLAND_GOBLINS:
Setvar storeroomnumber 11
setvar waitingroom A massive tree stands by itself
if "$zoneid" = "32" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "32" then gosub MOVE_FINAL
if "$zoneid" != "32" then gosub MOVE_TO_RIVERHAVEN_NORTH_GATE
goto MOVE_RIVERHAVEN_HUNTING_WILDLAND_GOBLINS

MOVE_RIVERHAVEN_HUNTING_ZOMBIE_GOBLINS:
Setvar storeroomnumber 37
setvar waitingroom Wildlands, Root Bower
if "$zoneid" = "32" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "32" then gosub MOVE_FINAL
if "$zoneid" != "32" then gosub MOVE_TO_RIVERHAVEN_NORTH_GATE
goto MOVE_RIVERHAVEN_HUNTING_ZOMBIE_GOBLINS

MOVE_RIVERHAVEN_HUNTING_UNYNS:
Setvar storeroomnumber 61
setvar waitingroom Pejek Bog, Beside A Fence
if "$zoneid" = "31" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "31" then gosub MOVE_FINAL
if "$zoneid" != "31" then gosub MOVE_TO_RIVERHAVEN_EAST_GATE
goto MOVE_RIVERHAVEN_HUNTING_UNYNS

MOVE_RIVERHAVEN_HUNTING_SHAMANS_RAMS:
Setvar storeroomnumber 41
setvar waitingroom A delicate spider web woven amongst the dark
if "$zoneid" = "33" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "33" then gosub MOVE_FINAL
if "$zoneid" != "33" then gosub MOVE_TO_RIVERHAVEN_WEST_GATE
goto MOVE_RIVERHAVEN_HUNTING_SHAMANS_RAMS

MOVE_RIVERHAVEN_HUNTING_DUSK_OGRES:
Setvar storeroomnumber 59
setvar waitingroom The tunnel here is dark with illuminating patches of lichen
if "$zoneid" = "33" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "33" then gosub MOVE_FINAL
if "$zoneid" != "33" then gosub MOVE_TO_RIVERHAVEN_WEST_GATE
goto MOVE_RIVERHAVEN_HUNTING_DUSK_OGRES

MOVE_RIVERHAVEN_HUNTING_YOUNG_OGRES:
Setvar storeroomnumber 95
setvar waitingroom Riverhaven West Wilds, North Meadow
if "$zoneid" = "33" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "33" then gosub MOVE_FINAL
if "$zoneid" != "33" then gosub MOVE_TO_RIVERHAVEN_WEST_GATE
goto MOVE_RIVERHAVEN_HUNTING_YOUNG_OGRES

MOVE_RIVERHAVEN_HUNTING_ARBELOGS:
Setvar storeroomnumber 103
setvar waitingroom A toppled oak has opened a window to the sky
if "$zoneid" = "33" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "33" then gosub MOVE_FINAL
if "$zoneid" != "33" then gosub MOVE_TO_RIVERHAVEN_WEST_GATE
goto MOVE_RIVERHAVEN_HUNTING_ARBELOGS

MOVE_RIVERHAVEN_HUNTING_BARGHEST:
Setvar storeroomnumber 29
setvar waitingroom 
if "$zoneid" = "30" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "30" then gosub MOVE_FINAL
if "$zoneid" != "30" then gosub MOVE_TO_RIVERHAVEN_WEST_GATE
goto MOVE_RIVERHAVEN_HUNTING_BARGHEST

MOVE_RIVERHAVEN_HUNTING_WILD_BOAR:
Setvar storeroomnumber 24
setvar waitingroom The damp ground bears the tracks of hundreds 
if "$zoneid" = "31" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "31" then gosub MOVE_FINAL
if "$zoneid" != "31" then gosub MOVE_TO_RIVERHAVEN_EAST_GATE
goto MOVE_RIVERHAVEN_HUNTING_WILD_BOAR

MOVE_RIVERHAVEN_HUNTING_HEGGARANI_FROGS:
Setvar storeroomnumber 43
setvar waitingroom Pejek Bog, A Fork In The Path
if "$zoneid" = "31" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "31" then gosub MOVE_FINAL
if "$zoneid" != "31" then gosub MOVE_TO_RIVERHAVEN_EAST_GATE
goto MOVE_RIVERHAVEN_HUNTING_HEGGARANI_FROGS

###################
### THRONE CITY ###
###################


MOVE_THRONE_CITY_GEM_SHOP:
Setvar storeroomnumber 61
setvar waitingroom Old Throne City, Mir'Aevar Jegu
if "$zoneid" = "35" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "35" then gosub MOVE_FINAL
if "$zoneid" != "35" then gosub MOVE_THRONE_CITY
goto MOVE_THRONE_CITY_GEM_SHOP

MOVE_THRONE_CITY_GATE:
Setvar storeroomnumber 33
setvar waitingroom Old Throne City, Shakoepi Bridge
if "$zoneid" = "35" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "35" then gosub MOVE_FINAL
if "$zoneid" != "35" then gosub MOVE_THRONE_CITY
goto MOVE_THRONE_CITY_GATE

###############
##### STR #####
###############

MOVE_SOUTH_TRADE_ROAD_NYADS:
Setvar storeroomnumber 93
setvar waitingroom Forest of Night, The River Bank
if "$zoneid" = "60" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "60" then gosub MOVE_FINAL
if "$zoneid" != "60" then gosub MOVE_TO_STR
goto MOVE_SOUTH_TRADE_ROAD_NYADS

###################
### LETH DERIEL ###
###################

MOVE_LETH_BANK:
Setvar storeroomnumber 139
setvar waitingroom Imperial Depository, Lobby
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_BANK

MOVE_LETH_GEMS:
Setvar storeroomnumber 158
setvar waitingroom Khushi's, Back Room
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_GEMS

MOVE_LETH_TANNER:
Setvar storeroomnumber 170
setvar waitingroom Morikai's, Salesroom
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_TANNER

MOVE_LETH_WEAPON_SHOP:
Setvar storeroomnumber 156
setvar waitingroom Leth Deriel, Treetop Platform
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_WEAPON_SHOP

MOVE_LETH_ARMOR_SHOP:
Setvar storeroomnumber 10
setvar waitingroom Leth Deriel, Sana'ati Dyaus Drui'tas
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_ARMOR_SHOP

MOVE_LETH_GENERAL_STORE:
Setvar storeroomnumber 151
setvar waitingroom Alberdeen's Meats and Provisions, Front Room
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_GENERAL_STORE

MOVE_LETH_PERFUME:
Setvar storeroomnumber 166
setvar waitingroom Madame Orris' Perfumerie, Salon
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_PERFUME

MOVE_LETH_ORIGAMI:
Setvar storeroomnumber 156
setvar waitingroom Origami Boutique
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_ORIGAMI

MOVE_LETH_DYERS:
Setvar storeroomnumber 147
setvar waitingroom Reena's Rainbow, Salesroom
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_DYERS

MOVE_LETH_BOWYERS_SHOP:
Setvar storeroomnumber 161
setvar waitingroom Huyelm's Trueflight Bow and Arrow Shop, Salesroom
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_BOWYERS_SHOP

MOVE_LETH_CANDY_STORE:
Setvar storeroomnumber 144
setvar waitingroom De'ali's Elven Delights, Salesroom
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_CANDY_STORE

MOVE_LETH_CLOTHING_SHOP:
Setvar storeroomnumber 171
setvar waitingroom Ongadine's Garb and Gear, Showroom
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_CLOTHING_SHOP

MOVE_LETH_BARD_SHOP:
Setvar storeroomnumber 152
setvar waitingroom Sinjian's Bardic Requisites, Sales Room
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_BARD_SHOP

MOVE_LETH_WICKERS_SHOP:
Setvar storeroomnumber 155
setvar waitingroom Blanca's Basketry and Wickerworks, Showroom
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_WICKERS_SHOP

MOVE_LETH_BAKERY:
Setvar storeroomnumber 146
setvar waitingroom Mithin's Bakery, Sales Counter
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto MOVE_LETH_BAKERY

MOVE_LETH_TOWN_CENTRE:
Setvar storeroomnumber 18
setvar waitingroom In the midst of this clearing is the mighty tree known throughout Elanthia as Sana'ati Dyaus.
if "$zoneid" = "61" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "61" then gosub MOVE_FINAL
if "$zoneid" != "61" then gosub MOVE_TO_LETH_TOWN
goto LETH_TOWN_CENTRE



###########################
##### LANG MOVEMENTS ######
###########################

MOVE_LANG_LEATHER_REPAIRS:
Setvar storeroomnumber 240
setvar waitingroom Langenfirth, Kamze's Leather Repair
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_LEATHER_REPAIRS

MOVE_LANG_TANNER:
Setvar storeroomnumber 254
setvar waitingroom Shalan's Peltry, Tannery
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_TANNER

MOVE_LANG_ARMOR_SHOP:
Setvar storeroomnumber 252
setvar waitingroom Calliana Leather Goods, Salesroom
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_ARMOR_SHOP

MOVE_LANG_RUG_SHOP:
Setvar storeroomnumber 246
setvar waitingroom Smells Like a Rat
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_RUG_SHOP

MOVE_LANG_FURNITURE_STORE:
Setvar storeroomnumber 247
setvar waitingroom Furs and Furnishings, Sales Room
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_FURNITURE_STORE

MOVE_LANG_FISH_BUYER:
Setvar storeroomnumber 250
setvar waitingroom Net and Bait, Fish Market
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_FISH_BUYER

MOVE_LANG_HERBALIST:
Setvar storeroomnumber 251
setvar waitingroom Brother Yorgi, Herbalist
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HERBALIST

MOVE_LANG_PAWNSHOP:
Setvar storeroomnumber 245
setvar waitingroom Abotenik's Pawnshop, Frontroom
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_PAWNSHOP

#################################
##### THEREN TOWN MOVEMENTS #####
#################################

MOVE_THEREN_BANK:
Setvar storeroomnumber 91
setvar waitingroom Bank of Therenborough, Lobby
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_BANK

MOVE_THEREN_GEMS:
Setvar storeroomnumber 89
setvar waitingroom Alliance of Exchange, Gruk's Stones
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_GEMS

MOVE_THEREN_FUR_BUYER:
Setvar storeroomnumber 88
setvar waitingroom Alliance of Exchange, Fur Trade
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_FUR_BUYER

MOVE_THEREN_METAL_REPAIRS:
Setvar storeroomnumber 46
setvar waitingroom Smithy, Storage Shed
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_METAL_REPAIRS

MOVE_THEREN_GENERAL_STORE:
Setvar storeroomnumber 63
setvar waitingroom Therenborough, General Store
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_GENERAL_STORE

MOVE_THEREN_CLOTHING:
Setvar storeroomnumber 83
setvar waitingroom Tarsha's Emporium
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_CLOTHING

MOVE_THEREN_ENGRAVING:
Setvar storeroomnumber 44
setvar waitingroom Therenborough, Gizgo's Engraving
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_ENGRAVING

MOVE_THEREN_DOORS:
Setvar storeroomnumber 58
setvar waitingroom Piny Pleasures, Doors
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_DOORS

MOVE_THEREN_TABLES:
Setvar storeroomnumber 59
setvar waitingroom Piny Pleasures, Tables
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_TABLES

MOVE_THEREN_BEDS:
Setvar storeroomnumber 62
setvar waitingroom Piny Pleasures, Beds
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_BEDS

MOVE_THEREN_WALLS:
Setvar storeroomnumber 57
setvar waitingroom Piny Pleasures, Walls
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_WALLS

MOVE_THEREN_PAWNSHOP:
Setvar storeroomnumber 90
setvar waitingroom Alliance of Exchange, Dorsot's Collectables
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_THEREN
goto MOVE_THEREN_PAWNSHOP



#################################
##### LANG HUNTING MOVEMENTS #####
#################################

MOVE_LANG_HUNTING_VINES:
Setvar storeroomnumber 230
setvar waitingroom Your journey along the road leading west to Ker'Leor continues.
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_VINES

MOVE_LANG_HUNTING_MARUADERS:
Setvar storeroomnumber 230
setvar waitingroom Your journey along the road leading west to Ker'Leor continues.
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_MARUADERS

MOVE_LANG_HUNTING_BLOOD_WOLVES:
Setvar storeroomnumber 195
setvar waitingroom 'Neer's Hummock, Wolves' Refuge
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_BLOOD_WOLVES

MOVE_LANG_HUNTING_THUNDER_RAMS:
Setvar storeroomnumber 181
setvar waitingroom 'Neer's Hummock, Side Hill
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_THUNDER_RAMS

MOVE_LANG_HUNTING_SWAMP_TROLL:
Setvar storeroomnumber 70
setvar waitingroom Gwenalion Fens
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_SWAMP_TROLL

MOVE_LANG_HUNTING_FENDRYAD:
Setvar storeroomnumber 107
setvar waitingroom Gwenalion Fens, Dried Reed Hummock
if "$zoneid" = "40" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "40" then gosub MOVE_FINAL
if "$zoneid" != "40" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_FENDRYAD

MOVE_LANG_HUNTING_SPIDERS:
Setvar storeroomnumber 161
setvar waitingroom The Breech Tunnels
if "$zoneid" = "42" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "42" then gosub MOVE_FINAL
if "$zoneid" != "42" then gosub MOVE_TO_LANG
goto MOVE_LANG_HUNTING_SPIDERS

############################
##### SOUTH TRADE ROAD #####
############################

MOVE_SOUTH_TRADE_ROAD_BRIDAL_SHOP:
Setvar storeroomnumber 163
setvar waitingroom Trevellyn's of Leth Deri'el, Bridal Fashions
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_BRIDAL_SHOP

MOVE_SOUTH_TRADE_ROAD_CLERICAL_SUPPLIES:
Setvar storeroomnumber 161
setvar waitingroom Trevellyn's of Leth Deri'el, Clerical Supplies
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_CLERICAL_SUPPLIES

MOVE_SOUTH_TRADE_ROAD_MENS_ATTIRE:
Setvar storeroomnumber 165
setvar waitingroom Trevellyn's of Leth Deri'el, Gentlemen's Attire
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_MENS_ATTIRE

MOVE_SOUTH_TRADE_ROAD_WOMANS_CLOTHING:
Setvar storeroomnumber 162
setvar waitingroom Trevellyn's of Leth Deri'el, Women's Clothing
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_WOMANS_CLOTHING

MOVE_SOUTH_TRADE_ROAD_BOOTS:
Setvar storeroomnumber 164
setvar waitingroom Trevellyn's of Leth Deri'el, Travel Fashions
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_BOOTS

MOVE_SOUTH_TRADE_ROAD_CATERING:
Setvar storeroomnumber 170
setvar waitingroom Trevellyn's of Leth Deri'el, Party Planning
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_CATERING

MOVE_SOUTH_TRADE_ROAD_JEWLERY:
Setvar storeroomnumber 169
setvar waitingroom Trevellyn's of Leth Deri'el, Jeweler's Workroom
if "$zoneid" = "62" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "62" then gosub MOVE_FINAL
if "$zoneid" != "62" then gosub MOVE_TO_LETH_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_JEWLERY

MOVE_SOUTH_TRADE_ROAD_BONE_WOLVES:
Setvar storeroomnumber 73
setvar waitingroom All around is a wood in the truest sense of the word
if "$zoneid" = "63" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "63" then gosub MOVE_FINAL
if "$zoneid" != "63" then gosub MOVE_TO_OSHUEHHRSK
goto MOVE_SOUTH_TRADE_ROAD_BONE_WOLVES

MOVE_SOUTH_TRADE_ROAD_GERMISH:
Setvar storeroomnumber 47
setvar waitingroom Telpengi'hhs Sara'a, Catacombs
if "$zoneid" = "63" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "63" then gosub MOVE_FINAL
if "$zoneid" != "63" then gosub MOVE_TO_OSHUEHHRSK
goto MOVE_SOUTH_TRADE_ROAD_GERMISH

MOVE_SOUTH_TRADE_ROAD_KARTAIS:
Setvar storeroomnumber 1
setvar waitingroom Oshu'ehhrsk Manor, Second Floor Hall
if "$zoneid" = "63" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "63" then gosub MOVE_FINAL
if "$zoneid" != "63" then gosub MOVE_TO_OSHUEHHRSK
goto MOVE_SOUTH_TRADE_ROAD_KARTAIS

MOVE_SOUTH_TRADE_ROAD_WEAPONS:
Setvar storeroomnumber 149
setvar waitingroom Marachek's Weapons Emporium
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_WEAPONS

MOVE_SOUTH_TRADE_ROAD_GENERAL_STORE:
Setvar storeroomnumber 150
setvar waitingroom Marachek's General Store
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_GENERAL_STORE

MOVE_SOUTH_TRADE_ROAD_HERBALIST:
Setvar storeroomnumber 193
setvar waitingroom Telgi Mod'Sunhin, Enescu's Herbs
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_HERBALIST

MOVE_SOUTH_TRADE_ROAD_FEASTERY:
Setvar storeroomnumber 143
setvar waitingroom Marachek's Oak, Feasterie
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_FEASTERY

MOVE_SOUTH_TRADE_ROAD_BIABOS:
Setvar storeroomnumber 194
setvar waitingroom Biabo's Bug Collection, Front Parlor
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_BIABOS

MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_ARMOR:
Setvar storeroomnumber 212
setvar waitingroom Steelclaw Clan, Granzer's Repair
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_ARMOR

MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_HORSE:
Setvar storeroomnumber 234
setvar waitingroom Steelclaw Clan, Quintan's Leather
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_HORSE

MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_STABLE:
Setvar storeroomnumber 231
setvar waitingroom Steelclaw Clan, Stable
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_STABLE

MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_TAVERN:
Setvar storeroomnumber 207
setvar waitingroom MOVE_SOUTH_TRADE_ROAD_BIABOS
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_STEAL_CLAN_TAVERN

MOVE_SOUTH_TRADE_ROAD_SNOWBEASTS:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_SNOWBEASTS

MOVE_SOUTH_TRADE_ROAD_GARGOYLES:
Setvar storeroomnumber 167
setvar waitingroom Dragon's Spine, Canyon Rim
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_GARGOYLES

MOVE_SOUTH_TRADE_ROAD_JACKLES:
Setvar storeroomnumber 224
setvar waitingroom Eastern Fields, Path
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SOUTH_TRADE_ROAD_JACKLES


####################
### SHARD TOWN #####
####################

MOVE_SHARD_BANK:
Setvar storeroomnumber 146
setvar waitingroom Shard, First Bank of Ilithi
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_BANK

MOVE_SHARD_GEMS:
Setvar storeroomnumber 213
setvar waitingroom Meiria's Gems and Jewelry, Fatimi the Dealer's Backroom
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_GEMS

MOVE_SHARD_METAL_REPAIRS:
Setvar storeroomnumber 212
setvar waitingroom Steelclaw Clan, Granzer's Repair
if "$zoneid" = "66" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "66" then gosub MOVE_FINAL
if "$zoneid" != "66" then gosub MOVE_TO_SHARD_TO_GONDOLA_AREA
goto MOVE_SHARD_METAL_REPAIRS

MOVE_SHARD_WEAPON_SHOP:
Setvar storeroomnumber 629
setvar waitingroom Fiona's Fine Swords and Shields, Front Room
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_WEAPON_SHOP

MOVE_SHARD_ARMOR_SHOP:
Setvar storeroomnumber 179
setvar waitingroom Demiciil's Armory
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_ARMOR_SHOP

MOVE_SHARD_GENERAL_STORE:
Setvar storeroomnumber 214
setvar waitingroom Zerek's General Store
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_GENERAL_STORE

MOVE_SHARD_BARD_SHOP:
Setvar storeroomnumber 173
setvar waitingroom Malik the True Bard, Instruments and Picks
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_BARD_SHOP

MOVE_SHARD_ARTIFICER:
Setvar storeroomnumber 172
setvar waitingroom Shard's Osut'vie
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_ARTIFICER

MOVE_SHARD_BOWERY:
Setvar storeroomnumber 162
setvar waitingroom Avlea's Bows
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_BOWERY

MOVE_SHARD_HERBILIST:
Setvar storeroomnumber 211
setvar waitingroom Shard's Osut'vie
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_HERBILIST

MOVE_SHARD_PAWNSHOP:
Setvar storeroomnumber 158
setvar waitingroom Aelik's Pawn
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto MOVE_SHARD_PAWNSHOP

####################
### SHARD GUILDS ###
####################

SHARD_EMPATHS_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto SHARD_EMPATHS_GUILD

SHARD_BARBARIAN_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto SHARD_BARBARIAN_GUILD

SHARD_TRADERS_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto 

SHARD_WAR_MAGE_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto 

SHARD_CLERICS_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto 

SHARD_RANGER_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto 

SHARD_MOON_MAGE_GUILD:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "67" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "67" then gosub MOVE_FINAL
if "$zoneid" != "67" then gosub MOVE_TO_SHARD_TOWN
goto 


####################
### SHARD HUNTING###
####################

MOVE_SHARD_ROCK_TROLLS_NORMAL:
Setvar storeroomnumber 45
setvar waitingroom A few trees, scorched and burned in some great fire, are scattered throughout the meadow. 
if "$zoneid" = "68" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "68" then gosub MOVE_FINAL
if "$zoneid" != "68" then gosub MOVE_TO_SHARD_OUTSIDE_SOUTH_GATE
goto MOVE_SHARD_ROCK_TROLLS_NORMAL

MOVE_SHARD_ROCK_TROLLS_SUPER:
Setvar storeroomnumber 8
setvar waitingroom Shard, Shoreline
if "$zoneid" = "68" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "68" then gosub MOVE_FINAL
if "$zoneid" != "68" then gosub MOVE_TO_SHARD_OUTSIDE_SOUTH_GATE
goto MOVE_SHARD_ROCK_TROLLS_SUPER

MOVE_SHARD_DRAGON_FANATICS:
Setvar storeroomnumber 41
setvar waitingroom Meadow, Ruins
if "$zoneid" = "68" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "68" then gosub MOVE_FINAL
if "$zoneid" != "68" then gosub MOVE_TO_SHARD_OUTSIDE_SOUTH_GATE
goto MOVE_SHARD_DRAGON_FANATICS

MOVE_SHARD_EIDOLON_STEED:
Setvar storeroomnumber 52
setvar waitingroom Derelict Road, Darkling Wood
if "$zoneid" = "68" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "68" then gosub MOVE_FINAL
if "$zoneid" != "68" then gosub MOVE_TO_SHARD_OUTSIDE_SOUTH_GATE
goto MOVE_SHARD_EIDOLON_STEED

MOVE_SHARD_ADFAN:
Setvar storeroomnumber 29
setvar waitingroom Whistling Wood, Path
if "$zoneid" = "68" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "68" then gosub MOVE_FINAL
if "$zoneid" != "68" then gosub MOVE_TO_SHARD_OUTSIDE_SOUTH_GATE
goto MOVE_SHARD_ADFAN

MOVE_SHARD_DRAGON_PRIEST:
Setvar storeroomnumber 
setvar waitingroom 
if "$zoneid" = "69" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "69" then gosub MOVE_FINAL
if "$zoneid" != "69" then gosub MOVE_TO_SHARD_OUTSIDE_WEST_GATE
goto MOVE_SHARD_DRAGON_PRIEST

MOVE_SHARD_SMALL_PECCARY:
Setvar storeroomnumber 148
setvar waitingroom Further upstream, a tall wall of quartz blocks the way.  
if "$zoneid" = "69" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "69" then gosub MOVE_FINAL
if "$zoneid" != "69" then gosub MOVE_TO_SHARD_OUTSIDE_WEST_GATE
goto MOVE_SHARD_SMALL_PECCARY

MOVE_SHARD_COUDED_ARZUMOS:
Setvar storeroomnumber 77
setvar waitingroom Chunks of basalt lurch at an angle along the side of the bluff,
if "$zoneid" = "69" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "69" then gosub MOVE_FINAL
if "$zoneid" != "69" then gosub MOVE_TO_SHARD_OUTSIDE_WEST_GATE
goto MOVE_SHARD_COUDED_ARZUMOS

MOVE_SHARD_GRASS_EELS:
Setvar storeroomnumber 121
setvar waitingroom Julge Dolen Zaldeni, Stream Bank
if "$zoneid" = "69" and "$roomid" = "%storeroomnumber" then gosub YOU_HAVE_ARRIVED
if "$zoneid" = "69" then gosub MOVE_FINAL
if "$zoneid" != "69" then gosub MOVE_TO_SHARD_OUTSIDE_WEST_GATE
goto MOVE_SHARD_GRASS_EELS

MOVE_FINAL:
put #goto %storeroomnumber
waitfor %waitingroom
return



MOVE_TO_CROSSING_TOWN:
if "$zoneid" = "1" then goto MOVE_FINAL
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_TO_CROSSING_WEST_GATE_OUTOFTOWN
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_TO_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_FLOW
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "13" then goto MOVE_DIRGE_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return



MOVE_TO_CROSSING_EAST_GATE:
if "$zoneid" = "1" then goto MOVE_CROSSING_EAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_TO_CROSSING_WEST_GATE_OUTOFTOWN
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_FINAL
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_CROSSING_WEST_GATE:
echo west gate
if "$zoneid" = "1" then goto MOVE_CROSSING_WEST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_FINAL
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_CROSSING_NORTH_GATE:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTH_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE_OUTOFTOWN
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_FINAL
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_TIGER_CLAN:
if "$zoneid" = "1" then goto MOVE_CROSSING_WEST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_TIGERCLAN_MOVETO
if "$zoneid" = "4a" then goto MOVE_FINAL
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_ARTHE_DALE_TOWN_FINAL:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_TO_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_ARTHE_DALE_MOVE_TO_GATE
if "$zoneid" = "7b" then goto MOVE_FINAL
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_NORTH_TRADE_ROUTE_PART_1:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "3a" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_TO_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_FINAL
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_NORTH_TRADE_ROUTE_PART_2:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_FINAL
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_NORTH_TRADE_ROUTE_TO_FERRY_SIDE:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return



#### RIVERHAVEN ##########

MOVE_TO_RIVERHAVEN_TOWN:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_FINAL
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_RIVERHAVEN_WEST_GATE:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_WEST_GATE_INTOWN
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_FINAL
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_RIVERHAVEN_EAST_GATE:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_EAST_GATE_INTOWN
if "$zoneid" = "31" then goto MOVE_FINAL
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_THRONE_CITY:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto RIV-THR
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "35" then goto MOVE_FINAL
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_ROSSMANS_TOWN:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_BARGE_TO_LANG
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto THE-ROS-CONT
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return



MOVE_TO_LETH_TOWN:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_NORTH_GATE_INTOWN
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_FINAL
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_STR:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_NORTH_GATE_INTOWN
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_FINAL
if "$zoneid" = "61" then goto MOVE_LETH_NORTHWEST_GATE_INTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return



MOVE_TO_LETH_TO_GONDOLA_AREA:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_NORTH_GATE_INTOWN
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_FINAL
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_LANG:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_BARGE_TO_LANG
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto MOVE_FINAL
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_THEREN:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_BARGE_TO_LANG
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto move_to_theren_outoftown
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_FINAL
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return


MOVE_TO_MISTWOOD_FOREST:
if "$zoneid" = "1" then goto MOVE_CROSSING_NORTHEAST_GATE_INTOWN
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_NTR1_TO_NTR2
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_BARGE_TO_LANG
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto move_to_theren_outoftown
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_FINAL
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "66" then goto SOUTH-PLATFORM
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return




MOVE_TO_OSHUEHHRSK:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto GET_THROUGH_FLOW_NORTH_TO_FERRY
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_TO_GONDOLA
if "$zoneid" = "63" then goto MOVE_FINAL
if "$zoneid" = "66" then goto MOVE_TO_MANOR
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return


MOVE_TO_SHARD_TOWN:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_TO_GONDOLA
if "$zoneid" = "66" then goto MOVE_GONDOLA_TO_SHARD
if "$zoneid" = "67" then goto MOVE_FINAL
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_SHARD_TO_GONDOLA_AREA:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_TO_GONDOLA
if "$zoneid" = "66" then goto MOVE_FINAL
if "$zoneid" = "67" then goto MOVE_SHARD_EAST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_SHARD_OUTSIDE_SOUTH_GATE:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_TO_GONDOLA
if "$zoneid" = "66" then goto MOVE_GONDOLA_TO_SHARD
if "$zoneid" = "67" then goto MOVE_SHARD_SOUTH_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_FINAL
if "$zoneid" = "69" then goto MOVE_SHARD_WEST_GATE_OUTOFTOWN
return

MOVE_TO_SHARD_OUTSIDE_WEST_GATE:
if "$zoneid" = "1" then goto MOVE_CROSSING_FERRY_SOUTH
if "$zoneid" = "2" then goto MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT
if "$zoneid" = "3" then goto MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT
if "$zoneid" = "4" then goto MOVE_CROSSING_WEST_GATE
if "$zoneid" = "4a" then goto MOVE_CROSSING_TIGERCLAN_MOVEOUT
if "$zoneid" = "5" then goto MOVE_CROSSING_YOUNG_OGRES_FAVORS_MOVEOUT
if "$zoneid" = "5a" then goto MOVE_CROSSING_KNIFECLAN_MOVEOUT
if "$zoneid" = "6" then goto MOVE_CROSSING_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "7" then goto MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN
if "$zoneid" = "7b" then goto MOVE_ARTHE_DALE_MOVEOUT
if "$zoneid" = "7c" then goto MOVE_NTR2_MOVE_TO_NTR1
if "$zoneid" = "8" then goto MOVE_CROSSING_EAST_GATE_OUTOFTOWN
if "$zoneid" = "8a" then goto MOVE_CROSSING_LOST_CROSSING_MOVEOUT
if "$zoneid" = "9a" then goto MOVE_CROSSING_ROCK_TROLLS_MOVEOUT
if "$zoneid" = "10" then goto MOVE_LAIROCOTT_MOVEOUT
if "$zoneid" = "12" then goto MOVE_REAVERS_MOVEOUT
if "$zoneid" = "30" then goto MOVE_RIVERHAVEN_FERRY_TO_CROSSING
if "$zoneid" = "31" then goto MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN
if "$zoneid" = "32" then goto MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN
if "$zoneid" = "33" then goto MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN
if "$zoneid" = "34" then goto MOVE_MISTWOOD_ROOM_CHECK
if "$zoneid" = "40" then goto LANG_BARGE_TO_HAVEN
if "$zoneid" = "41" then goto MOVE_CREEPERS_TO_MAIN_ROAD
if "$zoneid" = "42" then goto MOVE_THEREN_MAIN_GATE_INTOWN
if "$zoneid" = "60" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN
if "$zoneid" = "61" then goto MOVE_LETH_SOUTHWEST_GATE_INTOWN
if "$zoneid" = "62" then goto MOVE_LETH_TO_GONDOLA
if "$zoneid" = "63" then goto MOVE_MANOR_OUT
if "$zoneid" = "66" then goto MOVE_GONDOLA_TO_SHARD
if "$zoneid" = "67" then goto MOVE_SHARD_WEST_GATE_INTOWN
if "$zoneid" = "68" then goto MOVE_SHARD_SOUTH_GATE_OUTOFTOWN
if "$zoneid" = "69" then goto MOVE_FINAL
return



MOVE_DIRGE_MOVEOUT:
pause
put #goto 71
waitfor North Roads Caravansary
pause
return


MOVE_MISTWOOD_ROOM_CHECK:
if $roomid < 120 then goto MOVE_TO_ROSSMANS_GATE
if $roomid > 120 then goto MOVE_MISTWOOD_TO_THEREN_ROAD
goto error


MOVE_TO_ROSSMANS_GATE:
pause
put #goto 3
waitfor Rossman's Landing, Southeast Gate
pause
goto ROS-THE

MOVE_MISTWOOD_TO_THEREN_ROAD:
pause
put #goto 137
waitfor North Road, Farmlands
pause
return

##########################
#### FINAL MOVEMENTS  ####
##########################

CROSSING_FERRY_COIN_CHECK:
gosub WEALTH_CHECK
if %WEALTH_LIRUMS < 70 then gosub CROSSING_GET_COINS_HAVEN
return

MOVE_CROSSING_FERRY_LETH:
pause
put #goto 237
waitfor The Crossing, Alfren's Ferry
goto CROSSING_FERRY_SOUTH_DOCK

MOVE_CROSSING_NORTHEAST_GATE_INTOWN:
if "%FIRST_MOVEMENT" = "5" or "%FIRST_MOVEMENT" = "4" then gosub CROSSING_FERRY_COIN_CHECK
pause
put #goto 172
waitfor Northeast Wilds, Outside Northeast Gate
return

MOVE_CROSSING_WEST_GATE_INTOWN:
pause
put #goto 173
waitfor Mycthengelde, Flatlands
return

MOVE_CROSSING_EAST_GATE_INTOWN:
pause
put #goto 171
waitfor Eastern Tier, Outside Gate
return

MOVE_CROSSING_NORTH_GATE_INTOWN:
pause
put #goto 174
waitfor North Turnpike, Forest
return

MOVE_TO_CROSSING_WEST_GATE_OUTOFTOWN:
pause
put #goto 15
waitfor The Crossing, Western Gate
return

MOVE_CROSSING_LAKE_OF_DREAMS_MOVEOUT:
pause
put #goto 2
waitfor Mycthengelde, Knoll
move south
return

MOVE_CROSSING_COUGARS_FAVORS_MOVEOUT:
pause
put #goto 2
waitfor Siergelde's Meek
return

MOVE_CROSSING_WEST_GATE_OUTOFTOWN:
pause
put #goto 15
waitfor The Crossing, Western Gate
return

MOVE_CROSSING_EAST_GATE_OUTOFTOWN:
pause
put #goto 43
waitfor The Crossing, Eastern Gate
return

MOVE_CROSSING_NORTH_GATE_OUTOFTOWN:
pause
put #goto 24
waitfor North Gate, Gate
return

MOVE_CROSSING_NORTHEAST_GATE_OUTOFTOWN:
pause
put #goto 83
waitfor The Crossing, Northeast Customs
return

MOVE_CROSSING_TIGERCLAN_MOVETO:
pause
put #goto 92
waitfor Tiger Clan Home, Dirt Pathway
return

MOVE_CROSSING_YOUNG_OGRES_MOVEOUT:
pause
put #goto 35
waitfor Dense Forest
return

MOVE_CROSSING_TIGERCLAN_MOVEOUT:
pause
put #goto 15
waitfor Grassland Path, Village Gate
return

MOVE_CROSSING_KNIFECLAN_MOVEOUT:
pause
put #goto 2
waitfor Dense Forest
return

MOVE_NTR1_TO_NTR2:
pause
put #goto 121
waitfor Moss dangles down from stunted,
return


MOVE_NTR2_TO_HAVEN_FERRY:
pause
put #goto 120
waitfor North Road, Ferry
return


MOVE_NTR2_MOVE_TO_NTR1:
pause
put #goto 45
waitfor Heavy, still air hangs in pockets about you, weighing down sound and movement.
return


MOVE_CROSSING_ROCK_TROLLS_MOVEOUT:
pause
put #goto 36
waitfor Journalai Route, Open Grasslands
return

MOVE_CROSSING_LOST_CROSSING_MOVEOUT:
pause
put #goto 15
waitfor Observatory, First Level
return

MOVE_ARTHE_DALE_MOVEOUT:
pause
put #goto 1
waitfor Valley, Village Gate
return

MOVE_ARTHE_DALE_MOVE_TO_GATE:
pause
put #goto 122
waitfor Arthe Dale, Village Gate
pause
return


MOVE_LAIROCOTT_MOVEOUT:
pause
put #goto 22
waitfor Foothills, Stony Incline
return

MOVE_REAVERS_MOVEOUT:
pause
put #goto 49
waitfor Northern Trade Road, Deep Forest
return



######  riverhaven  ####

MOVE_RIVERHAVEN_WEST_GATE_INTOWN:
pause
put #goto 174
waitfor Riverhaven Exterior, Southwest Gate
return

MOVE_RIVERHAVEN_EAST_GATE_INTOWN:
pause
put #goto 203
waitfor Riverhaven, Stone Bridge
return

MOVE_RIVERHAVEN_NORTH_GATE_INTOWN:
pause
put #goto 204
waitfor Riverhaven, Outside North Gate
return

MOVE_RIVERHAVEN_WEST_GATE_OUTOFTOWN:
pause
put #goto 1
waitfor Riverhaven, River Road West
return

MOVE_RIVERHAVEN_EAST_GATE_OUTOFTOWN:
pause
put #goto 1
waitfor Riverhaven, River Road East
return

MOVE_RIVERHAVEN_NORTH_GATE_OUTOFTOWN:
pause
put #goto 1
waitfor The Gate of Nobles,
return

####################################################
### SHARD TOWN and Areas through to GONDOLA AREA ###
####################################################

MOVE_GONDOLA_TO_SHARD:
action setvar TIME_CURRENT $1 when and it is (\S+).
put time
if "%TIME_CURRENT" = "night" then goto MOVE_SHARD_EAST_GATE_OUTOFTOWN
goto MOVE_SHARD_EAST_GATE_OUTOFTOWN

MOVE_SHARD_NORTH_GATE_OUTOFTOWN:
pause
put #goto 215
waitfor Shard, North City Gates
return

MOVE_SHARD_EAST_GATE_OUTOFTOWN:
pause
put #goto 216
waitfor Shard, East City Gates
move s
move sw
pause
return

MOVE_SHARD_SOUTH_GATE_OUTOFTOWN:
pause
put #goto 1
waitfor Shard, The New South Bridge
return

MOVE_SHARD_WEST_GATE_OUTOFTOWN:
pause
put #goto 31
waitfor Shard, West City Gates
return

MOVE_SHARD_EAST_GATE_INTOWN:
pause
put #goto 144
waitfor Shard, East Bridge
return


MOVE_SHARD_WEST_GATE_INTOWN:
pause
put #goto 145
waitfor Shard, West Bridge
return

MOVE_SHARD_SOUTH_GATE_INTOWN:
pause
put #goto 80
waitfor Old Ilithi Trade Route, Journey's Rest
return

MOVE_MANOR_OUT:
pause
put #goto 112
waitfor Southern Trade Route, Esouvar Deriel
pause
return





###################
### Leth Deriel ###
###################

MOVE_LETH_TO_GONDOLA:
pause
put #goto 3
waitfor Obsidian Pass, Platform
goto 2NORTH-PLATFORM

MOVE_LETH_SOUTHWEST_GATE_INTOWN:
pause
put #goto 18
waitfor Leth Deriel, Sana'ati Dyaus Drui'tas
pause
put #goto 131
waitfor Southern Trade Route, Esouvar Deriel
pause
return

MOVE_LETH_NORTHWEST_GATE_INTOWN:
pause
put #goto 116
waitfor A more enchanting mix of foliage,
return


MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN:
setvar STRDIR SOUTH
pause
put #goto 57
waitfor Southern Trade Route, Bosque Deriel
return


MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN_AFTERWEB:
pause
put #goto 57
waitfor Sounds unlike any you know whirl about you in a choir of whisperings
goto MOVE_%direction





MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY:
pause
put #goto 42
waitfor Southern Trade Route, Segoltha South Bank
goto MOVE_CROSSING_FERRY_TO_CROSSING

MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY_AFTERWEB:
pause
put #goto 42
waitfor Southern Trade Route, Segoltha South Bank
goto MOVE_CROSSING_FERRY_TO_CROSSING

MOVE_LETH_SOUTHWEST_GATE_OUTOFTOWN:
pause
put #goto 102
waitfor Smooth flagstones line the dusky-red soil of the road.
pause
put #goto 18
waitfor Leth Deriel, Sana'ati Dyaus Drui'tas
return 



IN_THE_STR_WEB:
waitfor Using your escape skill you work yourself free
if "%STRDIR" = "SOUTH" then goto MOVE_LETH_NORTHWEST_GATE_OUTOFTOWN_AFTERWEB
if "%STRDIR" = "NORTH" then goto MOVE_LETH_NORTHWEST_GATE_TO_CROSSING_FERRY_AFTERWEB
goto return






CROSSING_GET_COINS_HAVEN:
gosub WEALTH_CHECK
pause
if %WEALTH_LIRUMS < 75 then goto GET_MONEY_HAVEN
return

GET_MONEY_HAVEN:
pause
put #goto 234
waitfor Provincial Bank, Teller
put with 1 silver kronar
move out
move go booth
put exc all kronar for lirum
goto CROSSING_GET_COINS_HAVEN



MOVE_CROSSING_FERRY_SOUTH:
pause
gosub WEALTH_CHECK
if %WEALTH_KRONARS < 70 then goto GETMONEYCROSSINGFERRYSOUTH
pause
put #goto 237
waitfor The Crossing, Alfren's Ferry
goto CROSSING_FERRY_SOUTH_DOCK




MOVE_TO_MANOR:
pause
put #goto 107
waitfor Silhouette Forest, Near the Southern Trade Route
return



MOVE_THEREN_MAIN_GATE_INTOWN:
pause
put #goto 251
waitfor North Road, Barony Pass
return


move_to_theren_outoftown:
pause
put #goto 227
waitfor Therenborough, Town Gate
return

ROSSMAN_MOVE_TO_LANG_ROAD:
ECHO MUST START FROM OUTSIDE ROSSMANS GATE
goto ROS-THE





##############################
#### FLOW MOVEMENT NORTH  ####
##############################


GET_THROUGH_FLOW_NORTH:
pause
put #goto 56
waitfor As the road crosses a low point between
goto FLOW_MOVE_NORTH


FLOW_MOVE_NORTH:
matchre GROUP_CHECK_START paths|exits
matchre DIGGING_OUT ^Like a blind, lame duck|You fall into the mud with a loud *SPLUT*.|The mud holds you tightly
put ne
matchwait

 
GROUP_CHECK_START:
if "%group" = "NO" then goto MOVE_FINAL
if "%group" = "YES" then goto WAITING_FOR_GROUP
goto MOVE_FINAL

WAITING_FOR_GROUP:
echo waiting for your group to re join. Nod when ready to move
matchre MOVE_FINAL ^You nod.
matchwait

DIGGING_OUT:
pause
matchre FLOW_MOVE_NORTH your legs to assist your movements.
matchre DIGGING_OUT You struggle to dig|...wait
put stand
put dig
matchwait





MOVE_NTR2_MOVE_TO_FLOW:
pause
put #goto 53
waitfor North Road, Canyon Rim
goto MOVE_NTR2_MOVE_TO_NTR1

FLOW_MOVE_SOUTH:
matchre GROUP_CHECK_START_SOUTH paths|exits
matchre DIGGING_OUT_SOUTH ^Like a blind, lame duck|You fall into the mud with a loud *SPLUT*.|The mud holds you tightly
put S
matchwait

 
GROUP_CHECK_START_SOUTH:
if "%group" = "NO" then goto MOVE_FLOW_TO_NTR1
if "%group" = "YES" then goto WAITING_FOR_GROUP_SOUTH
goto MOVE_FINAL

WAITING_FOR_GROUP_SOUTH:
echo waiting for your group to re join. Nod when ready to move
matchre MOVE_FLOW_TO_NTR1 You nod.
matchwait

DIGGING_OUT_SOUTH:
pause
matchre FLOW_MOVE_NORTH your legs to assist your movements.
matchre DIGGING_OUT You struggle to dig|...wait
put stand
put dig
matchwait


MOVE_FLOW_TO_NTR1:
pause
put goto MOVE_NTR2_MOVE_TO_NTR1

GET_THROUGH_FLOW_NORTH_TO_FERRY:
pause
put #goto 56
waitforre As the road crosses a low point between|You easily navigate the mud and move forward...|The wind rips a stream of dust from the crumbling face
goto FLOW_MOVE_NORTH_FERRY

FLOW_MOVE_NORTH_FERRY:
matchre GROUP_CHECK_START_FERRY paths|exits|You easily navigate the mud and move forward...|North Road, Lava Field
matchre DIGGING_OUT_FERRY ^Like a blind, lame duck|You fall into the mud with a loud *SPLUT*.|The mud holds you tightly
put ne
matchwait
 
GROUP_CHECK_START_FERRY:
if "%group" = "NO" then goto MOVE_FERRY_MAIN
if "%group" = "YES" then goto WAITING_FOR_GROUP
goto MOVE_FERRY_MAIN

WAITING_FOR_GROUP_FERRY:
echo waiting for your group to re join. Nod when ready to move
matchre MOVE_FERRY_MAIN You nod.
matchwait

DIGGING_OUT_FERRY:
pause
matchre FLOW_MOVE_NORTH_FERRY your legs to assist your movements.
matchre DIGGING_OUT_FERRY You struggle to dig|...wait
put stand
put dig
matchwait

MOVE_FERRY_MAIN:
pause
put #goto 120
waitfor North Road, Ferry
pause
goto CROSSINGFERRYNORTH




#########################################
### FERRY - HAVEN TO NORTH TRADE ROAD ###
#########################################

MOVE_RIVERHAVEN_FERRY_TO_CROSSING:
gosub WEALTH_CHECK
if %WEALTH_LIRUMS < 60 then goto GET_MONEY_HAVEN_FERRY_SOUTH
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
waitfor pulls up to the dock
put go ferry
goto WAITONHAVENFERRYSOUTH

GET_MONEY_HAVEN_FERRY_SOUTH:
ECHO
ECHO *** GETTING LIRUMS FROM BANK ***
ECHO
put #goto 156
waitfor Bank of Riverhaven, Teller
put withdraw 30 copper
pause
GOTO MOVE_RIVERHAVEN_FERRY_TO_CROSSING

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
return


##########################################
### FERRY - NORTH TRADE ROUTE TO HAVEN ###
##########################################

CROSSINGFERRYNORTH:
put stand
pause
put go ferry
matchre WAITFORHAVENFERRYNORTH wait for the next one.|until the next one arrives.|I could not find what you were referring to.|What were you referring to?|There is no ferry here to go aboard.
matchre WAITONHAVENFERRYNORTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
matchre GETMONEYCROSSINGFERRYNORTH You haven't got enough
matchwait

NTR2_HAVENFERRYNORTH_WAIT:
put stand
pause
put go ferry
match WAITFORHAVENFERRYNORTH wait for the next one.
match WAITFORHAVENFERRYNORTH until the next one arrives.
match WAITFORHAVENFERRYNORTH I could not find what you were referring to.
match WAITFORHAVENFERRYNORTH What were you referring to?
match WAITONHAVENFERRYNORTH You hand him your lirums and climb aboard.
match WAITONHAVENFERRYNORTH The Captain gives you a little nod
match NOMONEY You haven't got enough lirums
matchwait

WAITFORHAVENFERRYNORTH:
ECHO
ECHO *** WAITING FOR THE FERRY TO ARRIVE ***
ECHO
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
return

GETMONEYCROSSINGFERRYNORTH:
ECHO YOU NEED TO GET CASH!
exit


####################################
###### CROSSING FERRY SOUTH  #######
####################################

CROSSING_FERRY_SOUTH_DOCK:
	matchre WAITFORCROSSINGFERRYSOUTH wait for the next one|until the next one arrives|I could not find what you were referring to
	matchre WAITFORCROSSINGFERRYSOUTH What were you referring to|There is no ferry here to go aboard
	matchre WAITONCROSSINGFERRYSOUTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
	match GETMONEYCROSSINGFERRYSOUTH You haven't got enough
put go ferry
matchwait

WAITFORCROSSINGFERRYSOUTH:
echo
echo *** WAITING FOR THE FERRY TO ARRIVE ***
echo
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
return


####################################
###### CROSSING FERRY NORTH  #######
####################################

MOVE_CROSSING_FERRY_TO_CROSSING:
	matchre WAITFORCROSSINGFERRYNORTH wait for the next one|until the next one arrives|I could not find what you were referring to
	matchre WAITFORCROSSINGFERRYNORTH What were you referring to|There is no ferry here to go aboard
	matchre WAITONCROSSINGFERRYNORTH You hand him your|The Captain gives you a little nod|You silently slip aboard|But I see you're pretty young
	match GETMONEYCROSSINGFERRYNORTH You haven't got enough
put go ferry
matchwait

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
pause
move go dock
move GO SQUARE
return


########################################
###### RIVERHAVEN BARGE TO LANG  #######
########################################

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
	match GETMONEYNORTHBARGE You haven't got enough lirums
put go barge
matchwait

WAITFORNORTHBARGE:
echo
echo *** WAITING FOR THE BARGE TO ARRIVE ***
echo
waitfor pulls into the
goto NORTHBARGE

GETMONEYNORTHBARGE:
echo
echo *** GETTING LIRUMS FROM BANK ***
echo
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
Return

###################################
###### LANG BARGE TO HAVEN  #######
###################################
LANG_BARGE_TO_HAVEN:
pause
put #goto 36
waitfor Langenfirth, Wharf
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
echo
echo *** WAITING FOR THE BARGE TO ARRIVE ***
echo
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
move s
move e
move go wooden archway
move ne
move w
return


#########################################
###### THRONE CITY TO RIVERHAVEN  #######
#########################################

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
	match GOTTHRONEMONEY The clerk counts out
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
return



RIV-THR:
put #goto 82
waitfor Salt Yard, Barge Dock
pause
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
echo
echo *** YOU NEED 120 LIRUMS TO RIDE THIS BARGE
echo *** CHECKING THE BANK NOW
echo
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
return

#########################
### GONDOLA_TO_SHARD ####
#########################

2NORTH-PLATFORM:
pause
	match WAITONSOUTHGONDOLA Gondola
	match WAITFORSOUTHGONDOLA There is no
put go gondola
matchwait

WAITFORSOUTHGONDOLA:
pause
put look
	match GETONSOUTHGONDOLA The gondola stops on the platform
	match WAITFORSOUTHGONDOLA YOU HAVE BEEN IDLE
matchwait 

GETONSOUTHGONDOLA:
match WAITFORSOUTHGONDOLA There is no wooden gondola here
match WAITONSOUTHGONDOLA Worn down to a dusky grey color
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
return

##############################
#### ROSSMANS SKILL CHECK ####
##############################


GROUPCHECK01:
pause
	matchre HEALTHCHECK01 You have no group|You must be visible
	match RIV-BAR You whisper
put whisper group ...
matchwait

HEALTHCHECK01:
pause
put exp survival 0
waitfor Overall state of mind
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
if $Climbing.Ranks >= 100 then goto BURDENCHECK01
goto RIV-BAR

BURDENCHECK01:
	matchre BURDENCHECK01A : None|: Light
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
if $Swimming.Ranks >= 140 then goto RIV-ROS-NORTH
goto RIV-BAR

BURDENCHECK01B:
if $Swimming.Ranks >= 190 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01C:
if $Swimming.Ranks >= 230 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01D:
if $Swimming.Ranks >= 270 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01E:
if $Swimming.Ranks >= 310 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01F:
if $Swimming.Ranks >= 350 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01G:
if $Swimming.Ranks >= 390 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01H:
if $Swimming.Ranks >= 430 then goto RIV-ROS-NORTH
goto OVERBURDENED01

BURDENCHECK01I:
if $Swimming.Ranks >= 470 then goto RIV-ROS-NORTH
goto OVERBURDENED01


OVERBURDENED01:
echo
echo ==============================================
echo *** You are too burdened to swim the Rossman's route with your current swimming skill.
echo *** With no burden you need 140 swimming ranks for the Rossman's route.
echo ==============================================
echo
pause
GOTO RIV-BAR



##############################
#### SHORTCUT TO ROSSMANS ####
##############################



RIV-ROS-NORTH:
echo
echo ==============================
echo *** Great Survival Skills!
echo *** Taking the Rossman's Landing shortcut!
echo ==============================
echo
pause
move w
move w
move w
move w
move w
move w
move w
move go narrow gate
move nw
echo
echo
echo * * * The western Riverhaven meadows, creeks, and woods
echo * * * Inhabited by goblin shamans, crayfish, eels, rams, bears, arbelogs, ogres, and wolf spiders
echo
echo
move n
move n
move n
move nw
echo
echo
echo * * * Passing a pasture grazed in by barghests
echo
move ne
move n
move ne
move nw
move n
move ne
move w
move nw
move n
echo
echo
echo * * * Entering the Mistwood Forest, home to the poisonous nightreaver unyns
echo
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
echo
echo
echo * * * Swimming up the swift-flowing Jantspyre River towards Rossman's Landing
echo

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
pause

move go bank
move go path
move nw
move n
move nw
move w
move nw
move w
echo
echo ===================
echo *** ROSSMAN'S LANDING
echo *** A wilderness village in the Mistwood Forest on the northeastern shores of Lake Gwenalion 
echo ===================
echo
Return

##########################
### Rossmans to Theren ###
##########################

ROS-THE:
put stow left
pause
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
ROPEN:
put climb rope
	match SHUFFLEN You climb
	match WAITN is already on the rope.
matchwait

WAITN:
put hide
echo
echo *** Waiting for someone to get off the ropes.
echo
	matchre ROPEN finally arriving|finally reaching
matchwait

SHUFFLEN:
echo
echo *** Travelling north on a dangerous rope bridge over a deep ravine inhabited by sky giants
echo
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
echo
echo * * * In this ravine sky giants roam
echo
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
echo
echo ===================
echo *** THERENBOROUGH
echo *** Protected by Theren Keep
echo *** Governed by the Baron of House Theren, to which all other Therengian lords kneel
echo *** Patron god is Rutilor the mongoose, positive aspect of Chadatru, god of truth and justice and patron of paladins and House Theren
echo ===================
echo
return



SOUTH-PLATFORM:
pause
put #goto 156
waitfor Obsidian Pass, Platform
goto southgondolacheck




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
return


THE-ROS-CONT:
pause
put #goto 215
waitfor The surrounding, gracefully-sloping hillsides are thickly carpeted with juniper, thyme and rosemary that fill the air with a fresh herbal fragrance.
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
put stow right
pause
put stow left
echo
echo
echo * * * In this ravine sky giants roam
echo
pause

ROPES:
put climb rope
	match SHUFFLES You climb
	match WAITS is already on the rope.
matchwait

WAITS:
put hide
echo
echo *** Waiting for someone to get off the ropes
echo
	matchre ROPES finally arriving|finally reaching
matchwait

SHUFFLES:
echo
echo *** Travelling south on a dangerous rope bridge over a deep ravine inhabited by sky giants
echo 
pause
pause
put shuffle south
echo
echo ================================
echo
echo *** Orcs and Warcats at the end of these ropes - PAY ATTENTION ! !
echo
echo ================================
echo
pause
pause
put shuffle south
pause
pause
put shuffle south
pause
put retreat
put retreat
pause
put retreat
move se
move sw
move se
move sw
move se
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
echo
echo ===================
echo *** ROSSMAN'S LANDING
echo *** A wilderness village in the Mistwood Forest on the northeastern shores of Lake Gwenalion
echo ===================
echo 

######### ARRIVAL ##########

YOU_HAVE_ARRIVED:
ECHO **********************************
ECHO YOU HAVE ARRIVED AT YOUR LOCATION!
ECHO ********************************** 
ECHO
put #parse YOU HAVE ARRIVED AT YOUR LOCATION!
exit