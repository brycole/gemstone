## Tool Check and Repair Script
## Author: Player of Hervean
## Version 1.0



## Analyze Actions for conditions.
action (analyze) var repair no when ^This appears to be a crafting.*(pristine|mint)
action (analyze) var repair yes when ^This appears to be a crafting.*(good|scuffed|minor|dents|notch|badly|battered)


## Queue action
action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait

## Variable that holds the tools.
var checkTools hammer|pliers|tong|rod|bellows|shovel


## Set this to whatever you want your default storage to be.
var dStorage haver

## Tool Count
var tCount 6


init:
counter set 0
gosub empty.hands
send store default %dStorage


work.loop:
if %c = %tCount then goto eof
var tool %checkTools(%c)

gosub get.tool

gosub analyze

if ("%repair" = "yes") then
{
	gosub start.repair
}

if ("%repair" = "no") then
{
	put #echo Yellow $righthand in decent repair.
}

gosub stow.tool

counter add 1
goto work.loop



get.tool:
send get %tool
waitforre ^You get
return

stow.tool:
send stow %tool
waitforre ^You put
return


analyze:
action (analyze) on
send analyze $righthandnoun
waitforre ^Roundtime
action (analyze) off
return

start.repair:
send get my brush
waitforre ^You get
send rub $righthandnoun with brush
waitforre ^Roundtime|suffered too much
send stow brush
waitforre ^You put
send get oil
waitforre ^You get
send pour oil on $righthandnoun
waitforre ^Roundtime|^You cannot
send stow oil
waitforre ^You put
return


empty.hands:
if ("$righthand" != "Empty") then send stow
if ("$lefthand" != "Empty") then send stow left
return

eof:
put #parse REPAIR DONE