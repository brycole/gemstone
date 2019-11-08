routinepalabuffs:
	var AspAegis one
	var HeroStr one
	var Courage one
	var Resolve one
	var AntiStun one
	var Wrath one
	var Armor one
	var Stun one
	var Warrior one
	

	action var AspAegis one when ^You sense the invisible magic guarding you fade
	action var HeroStr one when ^Your extra strength deserts you as the glistening net unravels from your body.
	action var Wrath one when ^You feel your righteous rage dissipate.
	action var Courage one when ^You falter for a moment as your extra courage slips away
	action var Resolve one when ^Your sense of protection leaves you
	action var Armor one when ^Your plate .* return to their normal condition.
	action var Warrior one when ^The holy golden radiance of your soul subsides, retreating into your body.
	action var Stun one when ^The dull orange glow fades from you

	action var Warrior ten when ^A blazing golden light erupts from the depths of your soul\!  Pulsating with thin grey fractures, the glow soon spreads to the whole of your body.
	action var AspAegis ten when ^A comforting opalescent glow momentarily illuminates you before sinking into your skin|^Your skin momentarily glows an opalescent hue as your spell is renewed
	action var HeroStr ten when ^A glistening net of coiling tendrils interlaces itself across your muscles, outlining each vein and contour with sparkles of white light
	action var Wrath ten when ^Your blood begins to boil and with a mighty shout you allow the rage within to flow outward for all to see.|^The spell pulses through your soul, rekindling your holy rage.
	action var Courage ten when ^You feel your courage bolstered 
	action var Resolve ten when ^You sense a potent wave of righteousness lend its protection to you.|^You sense a familiar wave of righteousness lend its protection to you once more.
	action var Armor ten when ^Your plate .* more substantial\.
	action var Stun ten when ^A dull orange glow settles around you

	action var Armor $1 when You sense the Divine Armor spell upon you, which will last for about (.*) roisaen.
	action var AspAegis $1 when ^You sense the Aspirant's Aegis spell upon you, which will last for about (.*) roisaen.
	action var HeroStr $1 when ^You sense the Heroic Strength spell upon you, which will last for about (.*) roisaen.
	action var Resolve $1 when ^You sense the Sentinel's Resolve spell upon you, which will last for about (.*) roisaen.
	action var Courage $1 when ^You sense the Courage spell upon you, which will last for about (.*) roisaen.
	action var Wrath $1 when ^You sense the Righteous Wrath spell upon you, which will last for about (.*) roisaen.
	action var Stun $1 when ^You sense the Anti-Stun spell upon you, which will last for about (.*) roisaen.
return

buffcheck:
	if !matchre("$preparedspell", "Resolve|Armor|Heroic|Courage|Wrath|None") then return
#	if ("%AspAegis" = "one" | "%AspAegis" = "two") then
#		{
#		gosub cast {Aspirant's Aegis|25|0} after 23 seconds
#		return
#		}

	if ("%Resolve" = "one" | "%Resolve" = "two") then
		{
		gosub cast {Sentinel's Resolve|20|15} after 23 seconds
		return
		}



	if ("%Armor" = "one" | "%Armor" = "two") then
		{
		gosub cast {Divine Armor|20|15} after 23 seconds
		return
		}


	if ("%HeroStr" = "one" | "%HeroStr" = "two") then
		{
		gosub cast {Heroic Strength|20|15} after 23 seconds
		return
		}

	if ("%Courage" = "one" | "%Courage" = "two") then
		{
		gosub cast {Courage|20|15} after 23 seconds
		return
		}


	if ("%Wrath" = "one" | "%Wrath" = "two") then
		{
		gosub cast {Righteous Wrath|20|15} after 23 seconds
		return
		}


return

#castbuff:
	if $mana < %lowmana then return
	if "$preparedspell" = "Energy Bolt" then gosub put release
	if $spelltime > 12 then goto castrequest
	goto preprequest


#preprequest:
	if $mana < %lowmana then return
	if "$preparedspell" != "None" then return
	gosub put prep $1 %baseprep
return

#castrequest:
	if $mana < %lowmana then return
	var spellpower $2
	math spellpower subtract %baseprep
	if %spellpower > 0 then gosub put harness %spellpower
	pause 2
	gosub put cast
return
