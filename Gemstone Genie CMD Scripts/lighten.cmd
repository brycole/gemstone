	#debug 10

## Set these to your anvil and grind rooms...
	var anvil 923
	var grind 976
	var armordone 0

## Action Queue for roundtimes.
	action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait

## Actions for Grinding Armor.. oh boy this is ugly. Haha.
	action var tool grind when ^Straining a bit less you maintain force to the grindstone
	action var tool spin when ^The grindstone begins to lose momentum|^It seems to be picking up speed now but is still rather slow|^Grabbing the handle you strain to turn the grindstone
	action var tool pull when ^You now feel ready to begin the crafting process|^Some pliers are now required to stitch the armor's smaller sections back together
	action var tool pound when ^Several pieces of the armor are stuck together and must be pounded free|^Several pieces of the armor are stuck together and must be pounded free
	action var tool gogrind when ^You think that thinning the armor's metal at a grindstone could lighten it further|^The armor pieces are ready to be ground away at a grindstone|^The armor is ready for grinding away of the excess metal
	action var tool goanvil when ^With the grinding complete, the armor now needs reassembly with a hammer|^That tool does not seem suitable for that task
	action var tool oil when ^The worked metal looks to be in need of some oil to preserve and protect it
	action var armordone 1 when ^With the grinding complete, the armor now needs reassembly with a hammer.

	var tool book

	if ("$lefthandnoun" != "") then var item $lefthandnoun
	Echo %item is our item $lefthandnoun is what we are holding.

do.work:
	gosub %tool
	goto do.work

book:
	send take my armor book
	waitforre ^You get
	send turn book to chapter 5
	pause 0.1
	send turn book to page 1
	pause 0.1
	send study book
	waitforre ^Roundtime
	send stow book
return

spin:
	if %armordone = 1 then var tool goanvil
		else 
		{
			send turn grindstone
			waitforre ^Roundtime
		}
return

grind:
	echo at Grind
	send push grindstone with %item
	waitforre ^Roundtime|^That tool does not seem
return

gogrind:
	if $roomid != %grind then
	{
		echo Going to a grinding room.
		send #goto %grind
		waitforre @walk done.
	}
	var tool spin
return

goanvil:
	echo Going to an anvil room.
	send #goto %anvil
	waitforre @walk done.
	var tool pound
return

pull:
	echo at Pull
	send take my pliers
	waitforre ^You get
	send pull %item with my pliers
	waitforre ^Roundtime
	send stow pliers
	waitforre ^You put|^Stow what
return

pound:
	send put %item on anvil
	waitforre ^You put
	send get my hammer
	waitforre ^You get
	send get my tongs
	waitforre ^You get
	send pound %item on anvil with my hammer
	waitforre ^Roundtime
	send stow
	waitforre ^You put|^Stow what
	send stow left
	waitforre ^You put|^Stow what
	send get %item
	waitforre ^You get
return

oil:
	send stow pliers
	waitforre ^You put|^Stow what
	send get my oil
	waitforre ^You get
	send pour oil on my %item
	waitforre ^Roundtime
exit