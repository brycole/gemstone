

	routinesteal:
	setvariable stealtimer 70
	var item1 chain helm
	var item2 pin
	var item3 ice pick
	var item4 rocks
	var item5 rag
	var item6 ithor potion
	var item7 large jar
	var item8 needle
	var item9 snood
	var item10 sling
	var item11 silk fan
	var item12 wine
	var item good
	var wanted 0
	var pawnlist chain helm|pin|wine|ice pick|rocks|rag|potion|large jar
	action put lower my $righthandnoun when If you still wish to drop it, 
	action setvariable item bad when ^Cormyn shakes his head and says, \".*.isn't worth my time.\"
	action setvariable caught yes when realize that you are being watched and should back off
	action setvariable caught yes when points to where you lie concealed and begins to shout
	action setvariable caught yes when You feel that for the moment you've learned all you can about 
	action setvariable caught yes when You don't feel you learned anything useful from this trivial theft.
	action setvariable caught yes when notices you attempting to make the grab and begins to shout for help.
	action goto exitfull when ^\[Guard House, Jail Cell\]
	action goto exitfull when ^From the stench here, it is apparent that the guards have little interest in coddling criminals
	action goto exitfull when ^A wide swath of thick metal bars, the closest Velaka
	action goto exitfull when ^\[Muspar'i, Jail Cell\]
	return


steal:
	eval stealfull replace ("$0", ", ", "|")
	var target %stealfull(0)
	var rounds %stealfull(1)
	var caught no
	var stealcount 0
	gosub emptyhands
	stealloop:
	if "%cheststat" = "on" then gosub armoroff
	if %stealcount < %rounds then
		{
		math stealcount add 1
		gosub put steal %target
		pause 0.1
		pause 0.1
		pause 0.1
		gosub put drop $righthandnoun
		if "%caught" = "yes" then goto stopstealing
		goto stealloop
		}
		return

stopstealing:
	math wanted add 1
	return

gopawn:
	if "$roomid" != "953" then gosub move 953
	pawnshop:
	if "$roomid" != "953" then goto gopawn
	matchre pawnstuff ^(You rummage through .+)
	put rummage %container1
	matchwait 10
	goto pawnshop
	pawnstuff:
	setvariable pawnitems $0
	pawnloop:
	if contains("%pawnitems", "%item1") then gosub sell %item1
	if contains("%pawnitems", "%item2") then gosub sell %item2
	if contains("%pawnitems", "%item3") then gosub sell %item3
	if contains("%pawnitems", "%item4") then gosub sell %item4
	if contains("%pawnitems", "%item5") then gosub sell %item5
	if contains("%pawnitems", "%item6") then gosub sell %item6
	if contains("%pawnitems", "%item7") then gosub sell %item7
	if contains("%pawnitems", "%item8") then gosub sell %item8
	if contains("%pawnitems", "%item9") then gosub sell %item9
	if contains("%pawnitems", "%item10") then gosub sell %item10
	if contains("%pawnitems", "%item11") then gosub sell %item11
	if contains("%pawnitems", "%item12") then gosub sell %item12
	if contains("%pawnitems", "%item13") then gosub sell %item13
	if contains("%pawnitems", "%item14") then gosub sell %item14
	if contains("%pawnitems", "%item15") then gosub sell %item15
	return


sell:
	if !contains("$righthand", "$0") then gosub put get my $0
		if "%item" = "good" then
			{
			if contains("$righthand", "$0") then gosub put sell my $0
			}
		else if contains("$righthand", "$0") then gosub put drop my $0
	if !contains("$righthand", "$0") then gosub emptyhands
	if !contains("$righthand", "$0") then gosub put get my $0
	if contains("$righthand", "$0") then goto sell
	var item good
	return


include stealmuspari.cmd
include stealcrossing.cmd
include stealarthedale.cmd
include stealshard.cmd
include stealhibarn.cmd