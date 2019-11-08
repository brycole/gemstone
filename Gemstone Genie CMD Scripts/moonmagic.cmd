include base.cmd


#**************************************#
#*********** Magic Section ************#
#**************************************#
put stop play
delay 2
action setvar regen 1 when ^You strain,
action setvar regen 1 when You are unable to harness 
setvar camb1 medal
setvar camb2 wrist
setvar c 0

gosub spell $startspell 10
gosub spellcheck
goto magicstart

spellcheck:
##if %dg = 0 then gosub spellup dg 25 %moonbeam
##if $spellAUS = OFF then gosub spellup aus 40
return

magicstart:
put #var camb %camb1
goto magicloop

camb:
goto cast.magic
##if $camb = %camb2 then 
##{
##	put #var camb %camb1
##	goto cast.magic
##}
##if $camb = %camb1 then put #var camb %camb2
##goto magicloop

return

cast.magic:
put cast
goto magicloop

magicloop:
if (($Magical_Devices.LearningRate < 15) || ($Primary_Magic.LearningRate < 15)) then
{
	if %regen = 1 then goto regen
	gosub put.1 "prep %1 %2" "^You trace"
	gosub put.1 "put charge my %2 %3" "^Roundtime:"
	gosub put.1 "put charge my %2 %3" "^Roundtime:"
    gosub put.1 "focus my %2" "^Roundtime:"
	goto camb
}
else goto magicend

regen:
var regen 0
pause
send .studyc
waitfor studyc.cmd done.
gosub pp xibar
gosub pp yavash
gosub pp katamba
send .studys
waitfor studys.cmd done.
goto regenloop

pp:
put perc $1
pause
pause .5
return

regenloop:
echo Regening. $mana percent mana.
if $mana < 95 then 
{
delay 10
goto regenloop
}
if %pp = 1 then goto pploop
else goto magicloop

spell:
put #var tspell $1
put #var cpower $2
return

spellup:
put prep $1
harness:
pause
match heldloop You tap
match harness ...wait
match cast You strain 
put harness 10
matchwait
heldloop:
if $heldMana < $2 then goto harness
cast:
put cast $3
return

##ppinclude:
##include moonSL.cmd	

magicend:
setvar pp 0
gosub spell $startspell 11
##put wear $camb
pause
echo Magic training done.
put #parse magic.cmd done.