routinebardbuffs:
	action var bardsong 0;var Lilt off;var Sire off;var Mere off;var Tear off;var Care off;var Harmony off;var Dalu off;var Naga off when ^You stop performing|^Your enchante fails completely.| backfires\.$|^Your spell backfires
	action var Lilt on;var bardsong 1 when melodic introduction of "Hodierna's Lilt"\.$
	action var Lilt off when [Y|y]ou stop performing the Hodierna's Lilt enchante\.$
	action var Sire on;var bardsong 1 when "Call of the Siren" take shape in your mind\.$
	action var Sire off when [Y|y]ou stop performing the Call of the Siren enchante\.$
	action var Mere on;var bardsong 1 when ^With a quick breath, you begin to sing the opening notes to "Merelew's Legacy"
	action var Mere off when [Y|y]ou stop performing the Merelew's Legacy enchante\.$
	action var Tear on;var bardsong 1 when ^With powerful, vibrant tones, you launch yourself 
	action var Tear off when [Y|y]ou stop performing the Naming of Tears enchante\.$
	action var Care on;var bardsong 1 when ^With a sharp cut to your voice
	action var Care off when [Y|y]ou stop performing the Caress of the Sun enchante\.$
	action var Harmony on;var bardsong 1 when ^Twirling, rapid trills carry proudly across the room
	action var Harmony off when [Y|y]ou stop performing the Harmony enchante\.$
	action var Dalu on;var bardsong 1 when sounding the opening notes of "Damaris' Lullaby"\.
	action var Dalu off when [Y|y]ou stop performing the Damaris' Lullaby enchante\.$
	action var Naga on;var bardsong 1 when ^The first gentle notes of "Naga's Blessing" waft
	action var Naga off when [Y|y]ou stop performing the Naga's Blessing enchante\.$
	action var loud 0 when You will now play your enchantes a bit quieter\.|You are already playing your enchantes as quietly as you can\.
	action var loud 1 when You will now play your enchantes a bit louder\.|You are already playing your enchantes as loudly as you can\.
	action var manasong $2 when ^Your enchante mana allocation has been changed from \w+\((\d+)\) to \w+\((\d+)\)
  	
	var bardrecast 0
	var mainsong mere
	var combatsong harmony
	var bardsong 0
	var Lilt off
	var Sire off
	var Mere off
	var Tear off
	var Care off
	var Harmony off
	var Dalu off
	var Naga off
	var songlist Hodierna's Lilt|Call of the Siren|Merelew's Legacy|Naming of Tears|Caress of the Sun|Harmony|Naga's Blessing
return

bardsong:
	if $monstercount > 1 then gosub put.1 "sing %combatsong" "%songlist|^Your enchante fails|^You're already"
		else gosub put.1 "sing %mainsong" "%songlist|^Your enchante fails|^You're already"
return

manasongadjust:
	var bardrecast 1
	if "$1" = "up" then gosub put.1 "mana song 10" "^Your enchante"
	if "$1" = "down" then 
		{
			gosub splay
			gosub put.1 "mana song 1" "^Your enchante"
		}
	var bardrecast 0
return

buffcheck:
	if %Resolve = off then gosub castbuff SR %sr
	if %Wraith = off then gosub castbuff RW %rw
	if %Courage = off then gosub castbuff courage %cour
	if %HolyWarrior = off then gosub castbuff HOW %how
	if %AntiStun = off then gosub castbuff AS %as
	if %DivineArmor = off then gosub castbuff DA %da
	if %HeroicStrength = off then gosub castbuff HES %hes
	if %EaseBurden = off then gosub castbuff EASE %ease
return

bardcast:
	var bardrecast 1
	if ("%$1" = "on") then return
		else if %bardsong = 1 then gosub splay
	if "$2" != "" then gosub put.1 "$2 $1" "%songlist|^Your enchante fails|^You're already"
		else gosub put.1 "sing $1" "%songlist|^Your enchante fails|^You're already"
	var bardrecast 0
return

castbuff:
	if $mana < %lowmana then return
	if "$preparedspell" = "Energy Bolt" then gosub put release
	if $spelltime > 12 then goto castrequest
	goto preprequest

preprequest:
	if $mana < %lowmana then return
	if "$preparedspell" != "None" then return
	gosub prep $1 %baseprep
return

castrequest:
	if $mana < %lowmana then return
	var spellpower $2
	math spellpower subtract %baseprep
	if %spellpower > 0 then gosub put harness %spellpower
	pause 2
	gosub put cast
return

1rfwalk:
	if $invisible = 1 then return
	gosub put release
	gosub prep rf
	gosub put harness 4
	gosub put cast
	matchre return ^The refractive field
	matchwait 7
return

1aus:
	gosub prep aus 15
	gosub put.1 "harness 15" "^Roundtime"
	gosub put.1 "harness 15" "^Roundtime"
	gosub put.1 "harness 15" "^Roundtime"
1delayaus:
	delay .5
	if $spelltime > 20 then gosub cast
		else goto delayaus
	gosub manacheck
return

1seer:
	gosub prep seer 16
	gosub put.1 "harness 15" "^Roundtime"
1delayseer:
	delay .5
	if $spelltime > 15 then gosub cast
		else goto delayseer
	gosub manacheck
return