#debuglevel 10	

if $connected = 0 then goto playtime
		
	gosub routinecommon
	#gosub routinecombat
	gosub routinemoonbuffs
	#gosub routinesteal
	#gosub astro.initialize
	
initialize: 
	put #log >ExpLog *********
	put #log >ExpLog $datetime
	var monitor atk
	var monitor no
	var resonance roomrecovery
	#var ignorerooms 2

	var baseprep 1
	var maxcreature 3
	var exitnow 0
	var lowmana 50
	var saferoom 173
	var globalexp 15
	var killmob wolf
	#var killmob1 scout ogre
	var gloves sleeves
	var maxmonster 3
	var camb orb
	var castcamb 1
	var docharge 15

	gosub put.1 "power" "^Roundtime:"
	gosub put.1 "stance set 100 3 100 0" "^Setting"
	gosub put.1 "dodge" "^Roundtime|^But you are"
	#goto bypass
	
#goto bypass
goto $charactername

#*********        *********
#*********  Stoh  *********
#*********        *********

Stoh:
	gosub emptyhands
## ** Steal check
	#gosub stealsetup
		
	#if $roomid = 419 then goto forgestart	
## ** Move to lore room
	#gosub returnhome
	#if $roomid != 262 then gosub move 262
	#gosub release
	#gosub put.1 "cough" "^You cough"
	
	goto bypassforge
forgestart:		
## ** Forging training
	gosub move 169
	gosub reveal
	var train_now forging
	gosub goto 1teller
	gosub put.1 "info" "^Wealth"
	gosub put.1 "check balance" "^The clerk pages"
	gosub put.1 "deposit all" "^The clerk slides|^You don't"
	gosub put.1 "check balance" "^The clerk pages"
	gosub put.1 "withdraw 3 plat" "^The clerk"

## ** Forging tools
	gosub goto repair
ticketrepairloop:
	gosub put.1 "get ticket" "^You get|^What were"
	if (("$lefthandnoun" != "ticket") && ("$righthandnoun" != "ticket")) then goto repairloopdone
giveticketloop:	
	gosub put.1 "give ticket to ladar" "^You hand"
	var keywords 0
	gosub emptyhands
	if (("$lefthandnoun" = "ticket") || ("$righthandnoun" = "ticket")) then
	{
		gosub pause 15
		goto giveticketloop
	}
	goto ticketrepairloop
	
repairloopdone:
	send .crafting weapon
	waitfor Forging done
	var keywords set 0
	var train_now
	
		
	gosub returnhome
	if $roomid != 262 then gosub move 262
	gosub reveal

bypassforge:
	
# Arcana training
	gosub start.magiclearn
	gosub emptyhands
	gosub release shear
	
# Astronomy training
	var tool mirror
	gosub release
	gosub startskill Astrology
	gosub astrotrain
	gosub endskill Astrology
	if $kneeling = 1 then put dance silly

goto bypass_sch	
## ** Scholarship training - $1 first chapter, $2 last chapter
	gosub startskill Scholarship
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book
	gosub endskill Scholarship

bypass_sch:
	
## ** Mech Training
## ** Burin Carving
	gosub startburin

## ** Forage & Perception training	
	var collect rock
	gosub startcollect 9999999

	goto climbbypass
mechbypass:
## ** Climbing!

	gosub move 1
	gosub move 3
	delay 30
	gosub move 125
	gosub prep sov 5
	delay 5
	gosub cast
	gosub climbpractice wall
	gosub release
	gosub move 15
	delay 30
	gosub move 217
	gosub move 205
	gosub release
	gosub reveal
climbbypass:
	
	math globalexp add 10
	if %globalexp > 25 then var globalexp 25
	goto Stoh

exit
include routinecommon.cmd 
#include routinecombat.cmd
#include routinesteal.cmd
include routinemoonbuffs.cmd
#include astro.cmd