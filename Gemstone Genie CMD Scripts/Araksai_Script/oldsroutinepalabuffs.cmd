routinepalabuffs:
	action var Wrath off when ^You feel your righteous rage dissipate.
	action var HolyWarrior off when ^The warm glow fades from around you. You feel less capable
	action var Resolve off when ^Your sense of protection and hinderance leaves you
	action var Courage off when ^You falter for a moment as your extra courage slips away
	action var AntiStun off when ^The dull orange glow fades from around you
	action var DivineArmor off when ^Your tower shield returns to its normal condition.
	action var HeroicStrength off when ^Your extra strength deserts you as the glistening net unravels from your body.
	action var EaseBurden off when ^You feel a weight settle over you, and realize the magic that has been easing your burden has faded.
	action var Wrath on when ^Your blood begins to boil and with a mighty shout you allow the rage within to flow outward for all to see.
	action var HolyWarrior on when ^A sudden rush of vibrant energy fills you and you find yourself engulfed in a warm glow.  You somehow feel more capable.
	action var Resolve on when ^You sense a potent wave of righteousness lend its protection to you while hindering your own ability to attack.
	action var Courage on when ^You feel your courage bolstered 
	action var AntiStun on when ^A dull orange glow settles around you.
	action var DivineArmor on when ^Your tower shield feels more substantial
	action var HeroicStrength on when ^A glistening net of coiling tendrils interlaces itself across your muscles, outlining each vein and contour with sparkles of white light
	action var EaseBurden on when ^Pale yellow sparks begin to flicker over your body, infusing you with a sense of strength and vigor.
	action var Resolve off when ^The spell fails to combine with the one already in effect on you.
	action var Wraith on when ^The spell pulses through your soul, rekindling your holy rage.
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

castbuff:
	if $mana < %lowmana then return
	if "$preparedspell" = "Energy Bolt" then gosub put release
	if $spelltime > 12 then goto castrequest
	goto preprequest


preprequest:
	if $mana < %lowmana then return
	if "$preparedspell" != "None" then return
	gosub put prep $1 %baseprep
return

castrequest:
	if $mana < %lowmana then return
	var spellpower $2
	math spellpower subtract %baseprep
	if %spellpower > 0 then gosub put harness %spellpower
	pause 2
	gosub put cast
return
