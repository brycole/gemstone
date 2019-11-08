
routineenchant:

	var sigil sigil
	var imbuespell unleash
	var resonance roomrecovery
	put #var monitor no
	var camb orb

	action var sigilstudy $0 when (Guiding your fingers .+)
	action var fruit 1 when turns up fruitless.|foiled by the daylight\.|^Your head is still|^You are unable to
	action var failbond 1;put #echo >log Red Fail bonding! when ^The sigil fails to bond
	
return

sigil.check:
	var sigilcolor $1
	var pagenumber $2
	var sigilobject $3
	if $Time.isDay = 0 then gosub sigil.sky %sigilobject
		else gosub sigil.book
return

sigil.book:
	var failbond 0
	if "%sigilcolor" = "blue" then gosub get sigil from knapsack
	if "%sigilcolor" = "black" then gosub get sigil from bag
	if "%sigilcolor" = "white" then gosub get sigil from wove sack
	if "%sigilcolor" = "red" then gosub get sigil from case
	gosub put.1 "open sigil" "^You carefully"
	var sigilpage 1
	gosub sigil.turnpage
	gosub sigil.study 
	#gosub sigil.bind
return

sigil.turnpage:
	if %pagenumber = %sigilpage then return
	gosub put.1 "turn sigil" "^Roundtime"
	math sigilpage add 1
	goto sigil.turnpage

sigil.study:
	gosub put.1 "read sigil" "^Roundtime"
	if contains("%sigilstudy", "%sigilobject") then gosub put.1 "study sigil" "^Roundtime"
		else goto sigil.study
	gosub put.1 "close sigil" "^You"
	if "%sigilcolor" = "blue" then gosub put.1 "put sigil in knapsack" "%stow.msg"
	if "%sigilcolor" = "black" then gosub put.1 "put sigil in bag" "%stow.msg"
	if "%sigilcolor" = "white" then gosub put.1 "put sigil in wove sack" "%stow.msg"
	if "%sigilcolor" = "red" then gosub put.1 "put sigil in case" "%stow.msg"
return
	
sigil.bind:
	gosub get burin
	if "$righthandnoun" != "burin" then gosub put.1 "swap" "^You move"
	if "%Aura" = "off" then 
	{
		gosub castbuff "Aura Sight" 25 99 20
		gosub spelldelay
	}
	gosub prep %imbuespell 25
	gosub put.1 "scribe my %item" "^Roundtime"
	gosub stow burin
	if %failbond = 1 then goto sigil.book
	if "%sigilobject" = "Shrew" then return
	delay 5
	gosub cast my %item
	gosub put.1 "focus my %item" "^Roundtime"
	gosub put.1 "focus my %item" "^Roundtime"
return		

sigil.sky:
	var fruit 0
	gosub get my tele
	gosub put.1 "put %item in knapsack" "%stow.msg"
	gosub put.1 "center tele on %sigilobject" "^You put your eye"
	delay 2
	if %fruit = 1 then 
	{
		gosub stow tele
		gosub get %item from knapsack
		goto sigil.book
	}
	gosub put.1 "study %sigilobject with tele" "^Roundtime"
	gosub stow tele
	gosub get %item from knapsack
	gosub sigil.bind
return