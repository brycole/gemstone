

routinemagics:
	var targetted no
	var cambrinth 0

	action var symb $1 when But you've already prepared the (.*) symbiosis
	action var symb $1 when You recall the exact details of the (.*) symbiosis, preparing to integrate it with the next spell you cast
	action var symb none when But you haven't prepared a symbiosis|You release the Chaos symbiosis|You twist the mana streams of your .* in a chaotic motion, inciting them into unpredictable patterns
	action var cambrinth ready when You reach for its center and forge a magical link to it, readying all of its mana for your use.
	action var cambrinth 1 when The cambrinth armband absorbs all of the energy.|is already holding as much power as you could possibly charge it with
	action var cambrinth 0 when Your.*emits a loud \*snap\* as it discharges.*power to aid your spell|is dim, almost magically null.  A very faint pattern indicates its readiness to absorb|^You gesture\.
	action var targetted yes when ^You begin to weave mana lines into a target pattern around
#	action var observation learned when ^You learned something useful from your observation|^While the sighting wasn't quite what you were hoping for, you still learned a little bit from your observation|^Although you don't gain a complete view of the future, you grasp more of its pattern

	var lowmana 20
return




cast:
	if $mana < %lowmana then return
	var myspell $1
	var spelltime $3





	if "$preparedspell" != "None" then
		{


		if "%myspell(3)" = "" then if !matchre("%symb", "none") then gosub put release symbiosis
		if "%myspell(3)" != "" then if "%symb" != "%myspell(3)" then gosub put prepare symb %myspell(3)
	

		if "%myspell(2)" != "" then if (("%cambrinth" = "0") && (%myspell(2) > 1)) then gosub put charge my armband %myspell(2)
		if "%cambrinth" = "1" then gosub put invoke my armband
#		if !contains("$preparedspell", "%myspell(0)") then gosub put release spell
		}
	if $spelltime > %spelltime then goto castrequest
	goto preprequest

				{
				if !matchre("%symb", "%myspell(3)|none") then gosub put release symbiosis

preprequest:
	if $mana < %lowmana then return
	if "$preparedspell" != "None" then return
	if ("$preparedspell" = "None" && "%targetted" = "yes") then var targetted no
	gosub put prep %myspell(0) %myspell(1)
	if ("$preparedspell" = "Rebuke" && "%targetted" = "no") then gosub put target
return

castrequest:
	if $mana < %lowmana then return

	if ("$preparedspell" = "Rutilor's Edge") then
		{
		if matchre("$righthand|$lefthand", "(javelin|mallet|axe|broadsword|star|club|nightstick|sword)") then gosub put cast $1
		else return
		}
	else gosub put cast
	if matchre("%myspell(0)", "Rebuke|Burn|Stun Foe") then goto preprequest
return
