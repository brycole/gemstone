

	#config connect True
	timer start
	var ranged bow
	var melee kythe
	var ambush left eye
	var lowevasion 80
	var maxcritters 3
	var ammo broad-barbed arrow
	var monitor afk
	var origami lion
	var container pouch
	var boxes 0
	var maxboxes 4
	var braid_item vine
	var collect coin
	var jugglies globes
	var container1 pack
	var container2 cloak
	var container3 pack
	var armor off
	var loaded no
	var box full
	var lb cudgel
	var humming no
	var climbroom 345
	var mainroom 3
	var loreroom 145
	var humtype nocturne masterful
	var monster1 armadillo
	var monster2 boar
	var monster3 goblin
	var monster4 head-splitter
	put #var monster1 juvenile desert armadillo
	put #var monster2 adult desert armadillo
	put #var monster3 black goblin
	put #var monster4 zombie head-splitter
	action put climb practice pier when ^You finish practicing your climbing skill and take a well-earned break
	action goto exitquick when ^You don't have the proper ammunition
	action put go roadblock when ^In which direction are you trying to sneak?
	action if contains("$righthandnoun", "bow") then put retreat when closes to.*range on you
	action if "%sunlight" = "none" then var sunlight good when ^The wayerd pyramid emits a low humming noise as the sun's rays shine down on it
	gosub routinecommon
	gosub routinesteal
	gosub routinekhris
	gosub routineboxes
	gosub routinecombat
	if "%monitor" = "atk" then put #play helphelp
	if "%monitor" = "atk" then echo IF NO SOUND PLAYS YER IN TROUBLE
	if "%cheststat" = "off" then gosub armoron
#	var grandcounter 80
	
initialize:
mainloop:
	gosub clear
	if $dead = 1 then goto exitfull
	if $health < 50 then goto exitquick
	if $stunned = 1 then goto exitquick
	if $zoneid = 123 then goto tocombat
#	if %grandcounter > %stealtimer then goto leavecombat
	if %boxes > %maxboxes then goto leavecombat
	if $roomid = %loreroom then goto tocombat
	if $monstercount = 0 then if $Mechanical_Lore.LearningRate < 2 then if $roomid != %loreroom then goto leavecombat
	if $roomid = %climbroom then goto tocombat
	gosub playerscan

	if "%cheststat" = "off" then gosub armoron
	if $invisible = 1 then gosub khri stop
	if $monstercount = 1 then if contains("$monsterlist", "Brokk") then goto nothunting
	if $monstercount = 0 then goto nothunting

	if "%humming" = "yes" then gosub put stop hum
	if contains("$roomobjs", "pile of coin") then gosub put kick coin
	gosub khrilist

#	if $Hiding.LearningRate < 32 then if $monstercount = 1 then goto skipdance
	goto maindance

	skipdance:
	if $Parry_Ability.LearningRate > 15 then if $Mechanical_Lore.LearningRate < 8 then goto leavecombat
	if $Hiding.LearningRate < 30 then if $Light_Edged.LearningRate < 10 then goto melee
	if $Short_Bow.LearningRate < 10 then goto ranged
	if $Light_Edged.LearningRate < 25 then goto melee
	if $Short_Bow.LearningRate < 25 then goto ranged
	goto leavecombat




	khrilist:
	gosub khri Focus
	gosub khri Prowess
	gosub khri Flight
	gosub khri Steady
	gosub khri Strike
	gosub khri Elusion
	gosub khri Flight
	gosub khri Avoidance
	return





maindance:
#	if $monstercount < 2 then goto skipdance
#	if $Hiding.LearningRate < 15 then goto skipdance
	if $Multi_Opponent.LearningRate > 30 then goto skipdance
	if $Evasion.LearningRate > 30 then goto skipdance
#	if $Parry_Ability.LearningRate > 25 then goto skipdance
	if $Light_Blunt.LearningRate > 29 then goto skipdance
	var resonance dancing
	if "%humming" = "yes" then gosub put stop hum	
	gosub getmelee
	gosub shield_on
	if $Parry_Ability.LearningRate < 15 then gosub stanceparry
		else gosub stanceevasion
	if contains("$roomobjs", "armadillo that is trying to remain hidden") then gosub put point all
	gosub appcritter
	gosub hunt

	if $Light_Thrown.LearningRate < 25 then gosub dirt
	if %evasion = 100 then if !contains("$roomobjs", "that is sleeping") then if $Light_Blunt.LearningRate < 30 then gosub ambushstun
	if $Brawling.LearningRate < 30 then gosub put circle
		else gosub pause 3
	if $hidden = 1 then gosub put dance
	gosub skinarray
	goto mainloop



ambushstun:
	if %evasion != 100 then gosub stanceevasion
	gosub getlb

	if contains("$righthand", "%lb") then if "%weaponrange" = "missile" then
		{
		if "%weaponrange" != "melee" then gosub put engage
		if "%weaponrange" != "melee" then pause 1
		if "%weaponrange" != "melee" then gosub pause 1
		if "%weaponrange" != "melee" then gosub pause 1
		if "%weaponrange" != "melee" then gosub pause 1
		if contains("$righthand", "%lb") then
			{
			gosub hide
			gosub put ambush stun
			gosub getmelee
			}
		}
	return

	




ranged:
	var resonance ranged
	if "%humming" = "yes" then gosub put stop hum
	gosub smartshield
	if "%evasion" != "100" then {
		if "%weaponrange" != "missile" then gosub put retreat
		gosub stanceevasion
		}
	gosub dodge
	if contains("$roomobjs", "armadillo that is trying to remain hidden") then gosub put point all

	gosub getranged
	if "%loaded" = "no" then {
		put retreat
		gosub load
		}
	if "%weaponrange" != "missile" then gosub retreat
	pause 0.2
	put retreat
	gosub put aim
	if !contains("$roomobjs", "which appears stunned") then
		{
		pause 1	
		}

	if $Hiding.LearningRate < 20 then 
		{
		if $Stalking.LearningRate < 30 then gosub stalk
		if $hidden = 0 then if $Hiding.LearningRate < 30 then gosub hide
		}
	put retreat
	gosub fire
	if "%weaponrange" != "missile" then gosub retreat
	var loaded no
	goto mainloop
melee:
	var resonance melee
	if "%humming" = "yes" then gosub put stop hum
	gosub getmelee
#	gosub smartshield
	gosub shield_off
	gosub stanceevasion
	if contains("$roomobjs", "armadillo that is trying to remain hidden") then gosub put point all
	gosub hunt
#	gosub appcritter
	if $Light_Thrown.LearningRate < 10 then gosub dirt
	if contains("$lefthand", "dirt") then gosub dirt
	gosub combo
	if "%swing" = "parry" then
		{
		gosub put parry
		goto mainloop
		}
	if $Stalking.LearningRate < 30 then gosub put stalk
	if $Hiding.LearningRate < 30 then gosub hide
	if $hidden = 1 then if "%swing" = "backstab" then gosub swing %swing
		else if $hidden = 1 then var swing %swing %ambush
	gosub swing %swing
	goto mainloop


combo:
	var swing none
	if "%lastmaneuver" = "parry" then var swing feint
	if "%lastmaneuver" = "feint" then var swing draw
	if "%lastmaneuver" = "draw" then var swing sweep
	if "%lastmaneuver" = "sweep" then var swing slice
#	if "%lastmaneuver" = "slice" then var swing feint
#	if $monstercount > 1 then var swing backstab
	if $monstercount = 1 then var swing jab
	if "%swing" = "none" then var swing parry

#	if "%lastmaneuver" = "slice" then if $monstercount > 1 then {
#		var swing backstab
#		return
#		}
#	var swing jab
	return

dancearray:
	var dance none
#	if "%dance" = "none" then if $Shield_Usage.LearningRate < 30 then var dance stanceshield
#	if "%dance" = "none" then if $monstercount >= %maxcritters then var dance stanceevasion
#	if "%dance" = "none" then if $Evasion.LearningRate < 30 then var dance stanceevasion
#	if "%dance" = "none" then if $monstercount <= %maxcritters then if $Parry_Ability.LearningRate < 30 then var dance stanceparry
	if "%dance" = "none" then var dance stanceevasion
	gosub %dance
	return


leavecombat:
	put #var mapper defense
	if $roomid = %loreroom then goto loreroom
	if "%humming" = "yes" then gosub put stop hum
	gosub stanceevasion
	gosub retreat
	gosub ammo
	gosub put stop stalk
	if $invisible = 0 then
		{
		gosub put khri stop prowess steady strike
		gosub khri silence
		}
	gosub emptyhands
	if $Hidden = 1 then gosub put dance
	gosub move %loreroom
	gosub put khri stop prowess strike steady
	var talking none
loreroom:
	if $roomid != %loreroom then goto leavecombat
#	gosub stealtoggle
	if $invisible = 1 then gosub put khri stop
	var sunlight none
	gosub collectdirt

	if $Scholarship.LearningRate < 30 then gosub compendium 10
#	if $Climbing.LearningRate < 25 then gosub climbing
	if %boxes > %maxboxes then gosub m.inputoxmain
	if $Mechanical_Lore.LearningRate < 25 then gosub origami 20

	if $Light_Edged.LearningRate > 15 then if $Short_Bow.LearningRate > 15 then
		{
		gosub collect 25
		}

tocombat:
	gosub put stop hum
	gosub emptyhands
	gosub dropwealth
	if "%cheststat" = "off" then gosub armoron
	put #var mapper defense

	if $invisible = 0 then
		{
		gosub khri stop
		gosub khri silence
		}
	if $hidden = 1 then gosub put dance
	if $zoneid = 123 then gosub move 175
	var khrieliminate off
	gosub move %mainroom
	put #var mapper search
	gosub move 7
	gosub move 8
	gosub move 9
	gosub move 10
	gosub move 12
	gosub move 16
	gosub move 17
	gosub move 14
	gosub move 13
	gosub move 15
	goto leavecombat

	gosub move 6
	gosub move 2
	gosub move 3
	gosub move 4
	gosub move 5






climbing:
	if $stamina < 85 then return
	var resonance climbing
	if $standing = 0 then put stand
	gosub put stop hum
	gosub emptyhands
	if $invisible = 0 then
		{
		gosub khri stop
		gosub khri silence
		}
	if $invisible = 0 then
		{
		gosub pause 30
		goto climbing
		}
	gosub move %climbroom
	if "$righthandnoun" != "kythe" then gosub put get my kythe
	if "$lefthandnoun" != "arrows" then gosub put get my arrows
	pause 0.5
	gosub put climb practice pier
	gosub pause 100
	if $Climbing.LearningRate > 30 then gosub pause 60
	if $Climbing.LearningRate > 30 then gosub pause 60
	if $Climbing.LearningRate > 30 then gosub pause 60
	if $Climbing.LearningRate > 30 then gosub pause 60
	if $Climbing.LearningRate > 30 then gosub pause 60
	gosub put stop climb
	gosub put stop climb
	gosub move %loreroom
	if $invisible = 1 then gosub put khri stop silence
	return





skinarray:
	var arrangecount 0
	if contains("$righthandnoun", "%ranged") then gosub retreat
	if contains("$roomobjs", "%monster1 which appears dead") then gosub fullarrange %monster1
	if contains("$roomobjs", "%monster2 which appears dead") then gosub fullarrange %monster2
	if contains("$roomobjs", "%monster3 which appears dead") then gosub fullarrange %monster3
	if contains("$roomobjs", "%monster4 which appears dead") then gosub searchonly %monster4
	return


searchonly:
	var skin $0
	gosub search
	return
fullarrange:
	if $Skinning.LearningRate > 30 then goto searchonly
	var skin $0
	gosub put retreat
	gosub getmelee
	if "%lastmaneuver" = "sweep" then gosub put dodge
	gosub arrange
	gosub put skin
	if contains("$lefthand", "claw") then gosub put put my claw in my bundle
	gosub search
	return

#You try to stuff your plated claw into the bundle but can't seem to find a good spot.




stealtoggle:
	if %grandcounter < %stealtimer then return
	var resonance stealing
	gosub put stop stalk
	gosub put stop hum
	gosub emptyhands
	evalmath stealtimer %grandcounter + 70
	if "%cheststat" = "on" then gosub armoroff
	if $invisible = 0 then
		{
		gosub khri stop
		if $concentration < 30 then gosub pause 30
		if $concentration < 30 then gosub pause 30
		if $concentration < 30 then gosub pause 30
		gosub khri silence
		}
	if $standing = 0 then put stand

	if $zoneid != 116 then gosub move hibarn
	if $zoneid != 116 then gosub move hibarn
	if $zoneid != 116 then gosub move hibarn
	if $zoneid != 116 then goto exitfull
	gosub stealhibarn
#	gosub gopawn
	gosub armoron
	if $zoneid != 127 then gosub move boar
	if $zoneid != 127 then gosub move boar
	if $zoneid != 127 then gosub move boar
	if $zoneid != 127 then goto exitfull
	gosub move %loreroom
	var talking none
	return


movement:
	put ret
	pause 0.1
	put $0
	pause 1
	goto mainloop
nothunting:
	var resonance nothunting
	gosub stanceevasion
	gosub khrilist
	if $monstercount > 0 then goto mainloop

	gosub getmelee
	gosub hunt
	if "%humming" = "no" then if $Vocals.LearningRate < 27 then gosub put hum %humtype
	if "%clutter" = "bad" then gosub checkground
	if $Foraging.LearningRate < 30 then gosub put collect coin
		else
		{
		gosub pause 5
		}
	if contains("$roomobjs", "pile of coin") then gosub put kick coin
	if $monstercount > 0 then goto mainloop
	goto nothunting
activehunt:
	goto nothunting
	var apptime %grandcounter
	put #var mapper attack
	gosub ammo
	if $hidden = 0 then gosub put hide
	gosub move 68
	gosub move 81
	gosub move 100
	gosub move 106
	goto activehunt

runhide:
	if "%resonance" = "dancing" then goto leavecombat
	if "%resonance" = "melee" then goto leavecombat
	if "%resonance" = "ranged" then goto leavecombat
	if "%resonance" = "nothunting" then goto leavecombat
	if "%resonance" = "dancing" then goto leavecombat
	if "%resonance" = "climbing" then goto tocombat
	if $monstercount > 0 then goto leavecombat
	put #var mapper defense

	gosub put stop hum
	gosub hide
	var talking none
	var keywords 0
	gosub pause 100
	put look
	gosub pause 100
	put look
	gosub pause 100
	put look
	gosub pause 100
	goto loreroom







smartshield:
	if contains("$righthand", "%ranged") then goto shield_off
	if "%resonance" = "ranged" then goto shield_off
	if $Shield_Usage.LearningRate > 20 then goto shield_off
	if $Shield_Usage.LearningRate < 19 then goto shield_on	
	


	shield_off:
	if "%shieldstat" != "off" then
		{
		if "$lefthand" != "Empty" then gosub put stow left
		gosub put rem my shield
		gosub put stow my shield
		var shieldstat off
		}
	return
	shield_on:
	if "%shieldstat" != "on" then
		{
		if "$lefthand" != "Empty" then gosub put stow left
		gosub put get my shield
		gosub put wear my shield
		var shieldstat on
		}
	return

stanceevasion:
	if contains("$righthandnoun", "short bow") then gosub put retreat
	if "%evasion" != "100" then gosub stance evasion
	gosub stance shield 0
	gosub stance parry 87
	return


	if "%shieldstat" = "on" then
		{
		gosub stance parry 65
		gosub stance shield 22
		}
	if "%shieldstat" = "off" then
		{
		gosub stance shield 0
		gosub stance parry 87
		}

stanceparry:
	gosub stance parry
	gosub stance evasion 40
	gosub stance shield 47
	return
stanceshield:
	if "%shield" = "100" then return
	gosub put stance shield
	gosub put stance evasion 85
	gosub put stance parry 0
	return






include routinecommon.cmd
include routinesteal.cmd
include routineboxes.cmd
include routinekhris.cmd
include routinecombat.cmd
include stealmuspari.cmd
include stealcrossing.cmd
include stealarthedale.cmd
include stealshard.cmd
include stealhibarn.cmd
include leucropaths.cmd