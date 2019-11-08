## Script created by player of Hervean.
## Version 1.2
## debug 10


## Change to yes to nod to confirm every action
	var doNod no

## Set to no to skip the initial nod.
	var init.Nod no


## Do not change.
	var tool tongs
	var doit turn %item with my tongs
	var do.Total 1


	if_1
	{
		var do.Total %1
        counter set 0
        var dStorage duff bag
        var nStorage duff bag
        var init.Nod no
	}

	action (temper) var tool bellows ; var doit push bellows when ^As you finish working the fire dims and produces less heat from the stifled coals\.|unable to consume its fuel\.$
	action (temper) var tool oil; var doit pour oil on %item when to be cleaned of the clay by pouring oil on it\.$|oil to preserve and protect it\.$
	action (temper) var tool tongs; var doit turn %item with my tongs when ^push bellows|^push fuel with my shovel|^You carefully disassemble
	action (temper) var tool shovel; var doit push fuel with my shovel when appears to need some more fuel\.$|down and needs more fuel\.$|the fire dies down\$
	action (temper) var tool done; var doit nothing when you unwrap and dampen your oil cloth and throughly clean the metal's surface\.$



start.it:
	if ("$righthandnoun" != "") then var item $righthandnoun
	if ("%init.Nod" = "yes") then 
	{
        Echo %item is our item $righthandnoun is what we are holding.
        waitforre ^You nod
	}
	action (temper) on

forge:
	send put %item on forge
	pause 0.5
	send put %item on forge
	waitforre ^Roundtime

loop:

	if ("%tool" = "done") then goto temper.done
	gosub get.tool
	if ("%doNod" = "yes") then 
	{
        echo Ready to use my %tool to do %doit
        waitforre ^You nod
	}
	send %doit
	waitforre ^Roundtime
	goto loop

get.tool:
	if ("%tool" = "oil" then
	{
        send get %item from forge
        waitforre ^You get|^What were
	}
	if ("$righthandnoun" != "%tool") then
	{
        if ("$righthand" != "Empty") then send stow right
        pause 0.2
        send get my %tool
        waitforre ^You get
        return
	}

return



temper.done:
	action (temper) off
	send stow oil
	waitforre ^You put|^Stow what
	counter add 1

	echo %c | %do.Total
	if (%c = %do.Total) then goto eof
	echo %c | %do.Total
	if (%c < %do.Total) then
	{
        gosub get.next
        goto start.it
	}
	goto eof

get.next:
	send put %item in %dStorage
	waitforre ^You put|^Stow what
	send get %item from %nStorage
	waitforre ^You get|^What do
return

eof:
	send #parse DONE TEMPER
	echo Done tempering!
exit