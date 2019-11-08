## Lighten and Reinforce in one handy dandy script!
## Author: Player of Hervean
## Version: 0.9.8


debug 10
## Character set variables.

var anvil 409
var grind 409
var shop 14



## Actions for controlling things.

## Grinding room actions

action (grind) var tool spin when ^The grindstone begins to lose momentum
action (grind) var tool grind when ^Straining a bit less you maintain force to the grindstone
action (grind) var tool toanvil; action (grind) off when ^With the grinding complete
##

action (anvil) var tool togrind when ^You think that thinning|^The armor pieces are ready to be ground|^You think adjusting the armor|^The armor is ready for grinding away of the excess metal
action (anvil) var tool hammer when ^Several pieces of the armor are stuck
action (anvil) var tool pliers when ^Some pliers are now required to stitch the armor|^You now feel ready to begin the crafting process|^You layer the leather strips inside the
action (anvil) var tool oil when ^The worked metal looks to be in need of some oil to preserve and protect it
action (anvil) var tool done when ^pour oil on
action var armordone 1 when ^With the grinding complete, the armor now needs reassembly with a hammer.
##

## Reading Actions
action (read) var plighten $1 when Page (.*): metal armor lightening 
action (read) var preinforce $1 when Page (.*): metal armor reinforcing
action (read) var cChapter $1 when Chapter (.*): Armor Enhancements

##

#### End Actions


##
##Page (.*): metal armor lightening 
##Page (.*): metal armor reinforcing
##Chapter (.*): Armor Enhancements

## Action Queue for roundtimes.
action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait

if_1
{
	if ("%1" = "reinforce") then
	{
		var reinforce delay
	}
	if ("%1" = "lighten") then
	{
		var reinforce no
	}
}

set.item:
if ("$righthand" != "Empty") then var item $righthandnoun

read.book:
if ("$lefthand" != "Empty") then
{
	send stow left
	waitforre ^You put
}
action (read) on
send get my armor book
waitforre ^You get
send turn book to index
send read book
delay 1
send turn book to chapter 5
pause 0.5
send read book
delay 1
if "%1" = "lighten" then send turn book to page 1
	if "%1" = "reinforce" then send turn book to page 3
pause 0.5
send study book
waitforre ^Roundtime
action (read) off
action (anvil) on
var tool pliers

dowork:
gosub %tool
goto dowork

strip:
send get %item
waitforre ^You get|^You are
gosub get.tool
send assemble %item with %tool
waitforre ^You layer the leather strips inside the
var reinforce no
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
send push grind with %item
waitforre ^Roundtime
return

toanvil:
if ("%reinforce" != "no") then
{
	send #goto %shop
	waitforre @walk done.
	send buy strip
	waitforre ^The sales clerk hands you your leather strips
	send stow strip
	waitforre ^You put
}
if $roomid != %anvil then 
	{
		send #goto %anvil
		waitforre @walk done.
	}
var tool hammer
if ("%reinforce" = "delay") then var reinforce yes
action (anvil) on
return

togrind:
action (anvil) off
send stow
waitforre ^You put
send stow left
waitforre ^You put
send get %item from anvil
waitforre ^You get
	if $roomid != %grind then 
		{
			send #goto %grind
			waitforre @walk done.
		}
action (grind) on
var tool spin
return

pliers:
if ("$righthandnoun" != "%item") then
{
	send stow
	waitforre ^You put|^Stow
	send stow left
	waitforre ^You put|^Stow
	send get %item
	waitforre ^You get|^You are
}
if ("%reinforce" = "yes") then
{
	var tool strip
	return

}
gosub get.tool
send pull %item with my pliers
waitforre ^Roundtime
return

hammer:
send put %item on anvil
waitforre ^You put
gosub get.tool
send pound %item with my hammer
waitforre ^Roundtime
return


oil:
gosub get.tool
if ("$righthandnoun" != "%item") then
{
	send get %item
	waitforre ^You get|^You are
}
send pour oil on my %item
waitforre ^Roundtime
return

get.tool:
if ("%tool" = "hammer") then
{
	send get my hammer
	waitforre ^You get
	if ("$lefthand" != "Empty") then send stow left
	send get my tong
	waitforre ^You get
	return
}
if ("$righthand" != "Empty") then
{
	if ("$righthandnoun" != "%item") then
	{
		send stow
		waitforre ^You put
	}
}
if ("$lefthand" != "Empty") then
{
	send stow left
	waitforre ^You put
}
send get my %tool
waitforre ^You get
return

done:
exit