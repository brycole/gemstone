include base.cmd
gosub ss2.b

#debuglevel 10
#
#if "$roomplayers" != "" then gosub move 4
#if "$roomplayers" != "" then gosub move 5
#if "$roomplayers" != "" then gosub move 8
#if "$roomplayers" != "" then gosub move 7

action var full.c 1 when is already holding as much power as you could possibly|energy while the rest dissipates harmlessly
action goto lost when Your concentration slips for a moment, and your spell is lost\.|You are already preparing 
action var fullprep 1 when ^You feel fully prepared to cast your spell.

##if "$roomplayers" != "" then gosub move 44
##if "$roomplayers" != "" then gosub move 45
##if "$roomplayers" != "" then goto magicend

##**************************************#
##*********** Magic Section ************#
##**************************************#


#gosub spell.check
#gosub seer
#gosub 

var camb orb
var charge_mana 12
var low.cap 9
var fullprep 0
var train.spell ease
put #var spellup 1

gosub get %camb
gosub m.input splay

magicstart:
gosub ppcheck
counter set 5

magicloop:
#gosub spell.check
if $Arcana.LearningRate < 34 then
{
	var localtime $gametime
	goto charge.magic
}
else goto magicend

charge.magic:
gosub mob.check

## counter to check time
counter add 1
if %c > 7 then
	{
	  counter set 0
		gosub put.1 "prep %train.spell" "^You trace|^You raise|^You begin"
	}

if $mana < 100 then waiteval $mana = 100
var charge_mana 12
gosub put.1 "charge my %camb %charge_mana" "^Roundtime:"
#if (($mana > 96) && ($mana < 100)) then math charge_mana add 1
#if $mana < 96 then math charge_mana subtract 1
#if $mana < 96 then waiteval $mana >= 96
#if $mana = 100 then math charge_mana add 1
#if %charge_mana < %low.cap then var charge_mana %low.cap

## ** charge loop switch
if %full.c != 1 then goto charge.magic
else goto camb

camb:
var full.c 0
goto cast.magic
return

cast.magic:
gosub focus %camb
if %fullprep = 0 then waiteval %fullprep = 1
gosub put.1 "cast" "^You gesture\.|^You don't|^You draw"
if $mana < 100 then waiteval $mana = 100
var fullprep 0
#gosub spell.check
goto magicstart

lost:
gosub m.input release
gosub focus %camb
gosub m.input spell ease 1 20 0

goto magicstart

mob.check:
return
	if contains("$monsterlist", "marauder") then
		{
		 gosub put.1 "target mar" "prep mb" "^You raise"
		}
		else return

exit
magicend:
put #var spellup 0
put #var mob1 @NONE
put #var mob2 @NONE
gosub m.input put %camb bag
echo Magic training done.
put #parse magic.cmd done.