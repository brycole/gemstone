debuglevel 10

put #var combat 1
include base.cmd
include hunt.move.cmd
include bundle.cmd
include creaturelist.cmd

gosub splay
##gosub loud

send .death

# global list: loot, stance(ss1 or ss2), weapon.combo, maxcrit
delay 1

put #var cscript %1 %2 %3 %4
put #var death.wait 0

##gosub m.input splay
if %1 = pm then gosub ss1.b
if %1 = le then gosub put.1 "wield my dag" "%wield.msg"
if %1 = le then put #var weapon.combo le.slice

if %1 = me then put #var weapon.combo me.slice
if %1 = me then gosub put.1 "wield my scim" "%wield.msg"

if %1 = he then put #var weapon.combo he
if %1 = he then gosub put.1 "wield my falch" "%wield.msg"

if %1 = lx then put #var weapon.combo lx
if %1 = lx then gosub put.1 "remove crossbow" "%wield.msg"
#if %1 = lx then gosub put.1 "rem shield" "^You loosen"

if %1 = hal then put #var weapon.combo hal

if %1 = tm then put #var weapon.combo tm
if %1 = tm then gosub put.1 "get tx" "^You get|^You are"
if %1 = pm then put #var weapon.combo tm
	
if %1 = brawl then put #var weapon.combo brawl

if %1 = lt then gosub put.1 "get rock" "%wield.msg"
if %1 = lt then put #var weapon.combo lt

if %1 = ht then gosub put.1 "get ham" "%wield.msg"
if %1 = ht then put #var weapon.combo ht

put #var disable 0
put #var combat 1
put #var quick 1
put #var balm 0
var combat.check 1
var roomid.p 0
var retreat 0
var cman.msg ^\[Roundtime|^You aren't|^There is nothing|^Roundtime|already loaded|^You begin|^You pick|^You get some|^How can you
gosub $weapon.combo.var

action var retreat 1 when ^You are too
action var death 1 when balance\]|balanced\]|^There is nothing|^Face what\?
action var sever 0 when ^You are a bit too|^You look inside
action var range.curr melee when ^You are already at melee
action put face second %currtarg;put app second %currtarg quick when ^What's the point in facing
action if %cman = fire then goto target.find when I could not find
##action put face %currtarg when ^Face what\?
action goto exit when ^You are unable to harness sufficient energy to cast the spell.
action goto target.find when ^What do you want to advance|^You have lost sight of your target
action goto webbed when eval $webbed = 1
action goto rest when eval $stamina < 65
action goto advance.act when ^You aren't close enough
action goto regen when ^You are unable to harness sufficient energy to cast the spell.
action goto run when ^The young ogre begins to advance on you



var decay.list [A|An] .+ decays away\.
var combat.range 1
var range.curr
var cman %man4
var range ^You close to (pole)|^You close to (melee)|stops you from advancing|\[You're
var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bar|bead|beryl|bloodgem|bloodstone|carnelian|chrysoberyl|carnelian|chalcedony
var gems2 chrysoberyl|chrysoprase|citrine|coral|crystal|diamond|diopside|emerald|egg|eggcase|garnet|gem|goldstone|glossy malachite
var gems3 (chunk of|some|piece of).*granite|hematite|iolite|ivory|jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|nugget|onyx
var gems4 opal|pearl|pebble|peridot|quartz|ruby|sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon
var gemslist %gems1|%gems2|%gems3|%gems4
var coin silver (coin|coins)
var scroll scroll|tablet|vellum|sheiska leaf|ostracon|bark|papyrus roll|smudged parchment|tattered papyrus|seishaka leaf
var item %coin|%scroll|dira|%gemslist

if $move.random = 1 then
{
	put #var move.random 0
	goto RANDOM_MOVE
}

##gosub put.1 "hunt" "^Roundtime:"
##gosub hunt.timer

## FIND TARGET

target.find:
if (("%1"  = "lt") && ("$righthandnoun" != "rock")) then gosub put.1 "get rock" "^You get|^You are already|^What were"
## ** BARD SECTION
##if %1 != tm then 
##{
#	gosub put.1 "sing sire" "^As you begin to sing, a gentle arpeggio|^You're already"
#	if "$lefthandnoun" != "zills" then gosub put.1 "get zills" "^You get|^You are"
#	if $sire = 0 then gosub put.1 "play sire" ".+"
#	$if $balm = 0 then gosub put.1 "sing balm" ".+"
#}
#else if $naga = 0 then gosub put.1 "play naga" ".+"


## pp check section
gosub ppcheck

## spell up section
if $spellup = 1 then gosub spell.check
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
gosub mob.count
if %mob1.c > 0 then gosub face $mob1
if %mob2.c > 0 then gosub face $mob2
if %mob3.c > 0 then gosub face $mob3
goto no.mob

mob.count:
var mob.temp $monsterlist 
var mob1.c 0
var mob2.c 0
var mob3.c 0
eval mob.temp replace("%mob.temp", ", ", "|")
eval mob.temp replace("%mob.temp", " and ","|")
eval mob.temp replace("%mob.temp", ".", "|")
eval mob1.c count("%mob.temp", "$mob1")
eval mob2.c count("%mob.temp", "$mob2")
eval mob3.c count("%mob.temp", "$mob3")
return


regen:
waiteval $mana = 100
goto target.find

face:
var currtarg $1
gosub put.1 "face $1" "^You turn|^You are already|^You are too closely|^Face"
if $quick = 0 then gosub put.1 "app $1 quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not|^You can't"
if %retreat = 1 then
{
	gosub retreat.start
	var retreat 0
	goto face
}
advance.act:
if %range.curr = melee then var range.curr
gosub advance
gosub clear

## attack function
attack:
if (($hide = 1) && ($Hiding.LearningRate < 34)) then
	{
		if $monstercount > 1 then
		{
			if $hidden = 0 then gosub hide.b
		}
	}
		
#if $guild = Bard then 
#{
#	if $end.song = 1 then gosub put.1 "$curr.song" ".+"
#	put #var end.song 0
#}
#if $bleeding = 1 then gosub put.1 "health" "^Your"
if $stance != "ss1.s" then gosub ss1.b
if ((%1 = tm) || (%1 = pm)) then goto tm.combat
	if %sever = 1 then gosub put.1 "predict sever %currtarg" "^Roundtime|^You are a bit too|^You look inside|^While the sorcerous pattern still binds"

## Main combat attack function, uses actions based on weapon type
if %1 = me then if $stamina < 100 then waiteval $stamina = 100
if (("%cman" = "fire") && ($Hiding.LearningRate < 30)) then
{
	gosub hide
	var cman poach
}

if %1 != tm then 
{
	#gosub put.1 "sing sire" "^As you begin to sing, a gentle arpeggio|^You're already"
	##f "$lefthandnoun" != "zills" then gosub put.1 "get zills" "^You get|^You are"
	#if $sire = 0 then gosub put.1 "play sire" ".+"
	##if $balm = 0 then gosub put.1 "sing balm" ".+"
}

## combat cyle
gosub put.1 "%cman" "%cman.msg"

	
#if "%cman" = "fire" then
#	{
#	if $stamina < 100 then waiteval $stamina = 100
#	}

## LT and LX section
if ((%cman = fire) && (%lxwait > 0)) then delay %lxwait
if ((%1 = ht) || (%1 = lt)) then
{
	if %1 = lt then gosub put.1 "get rock" "^You pick"
	if %1 = ht then gosub put.1 "get hamm" "^You pick|^You are"
	if $stamina < 90 then waiteval $stamina = 100
}
## DO I EVEN NEED THIS SECTION?
#if ((%1 = lx) && ("%cman" = "get %lxammo.short") then
#{
#	if %death = 1 then gosub put.1 "stow %lxammo.short" "^You pick|^You pull"
#	else if contains("$roomobjs", "%lxammo")) then gosub put.1 "get %lxammo.short" "^You pick"
#	var cman %man4
#}
## hal section
death:
if %death = 1 then goto loot
goto attack

advance:
	if $disable = 1 then 
	{
			if "$cscript" = pm then
			{
				if "%currtarg" = "$mob1" then
				{
					if $stance != b.ss1 then gosub ss1.b
					gosub m.input spell bolt 1 1 0
					##gosub m.input spell set 9 4 0
					##var sever 1
				}
			}
			else
				{
					if $stance != ss1.1 then gosub ss1.b
					gosub m.input spell bolt 1 1 0
				}
	}
			
		
gosub put.1 "advance" "^You begin|^You are already"
if ((%1 = ht) || (%1 = lt) || (%1 = tm) || (%1 = pm)) then return
if %range.curr = melee then return
waitforre %range
if (($1 = pole) && (%combat.range = 2)) then gosub put.1 "retreat" "^You stop advancing"
if (($1 != melee) && (%combat.range = 1)) then waitforre %range
return 

loot:
if %1 = pm then var spell_loc right leg
put #var death.wait 1
##if %1 = hal then gosub put.1 "dodge" "^You move into a position to dodge\.|^But you are already"
##if %swap = 1 then waitforre ^You pick up
if ((%swap = 1) && ($lefthandnoun = rock)) then gosub put.1 "swap" "^You move"
if %swap = 1 then var cman throw
if %swap = 1 then var swap 0
var death 0
if "$guild" = "Necromancer" then if matchre ("$roomobjs", "(%ritualcritters) ((which|that) appears dead|\(dead\))") then gosub ritual $1
if (($skin = 1) || ("$mob1" = "peccary")) then
if matchre ("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then
{
	gosub ss2.b
	if ((%1 = ht) || (%1 = lt)) then gosub put.1 "enc" "Encumbrance"
	if %1 = lx then gosub put.1 "wear crossbow" "%sheath.msg"
    #if %1 = lx then gosub put.1 "wear shield" "^You slide"
	if %1 = hal then gosub put.1 "wear %halweap" "%sheath.msg"
	if %1 = le then gosub put.1 "sheath dag" "%sheath.msg"
	if %1 = he then gosub put.1  "sheath falc" "%sheath.msg"
	if "$lefthandnoun" = "zills" then gosub stow zills
	if %1 = me then gosub put.1 "sheath scim" "%sheath.msg"
	if %1 = ht then gosub put.1 "stow ham" "%sheath.msg"
	if %1 = lt then gosub put.1 "stow rock" "%sheath.msg"
	if %1 = tm then gosub stow tx
	##gosub put.1 "remove belt knife" "^You remove"
	##gosub put.1 "stow belt knife" "^You put"
	gosub put.1 "wield my skin knife" "%wield.msg"
	gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned"
	gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned"
	gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned"
    #gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned"
	##gosub put.1 "arrange all" "^Roundtime|^Arrange|cannot be skinned"
	gosub put.1 "skin" "^Roundtime|^Skin|cannot be skinned\."
	gosub put.1 "sheath skin knife" "%sheath.msg"
	##gosub put.1 "get belt knife" "^You get"
	##gosub put.1 "wear belt knife" "^You attach"
	if $bundle = 1 then gosub m.inputundlestart
	else gosub put.1 "empty left" "Your left hand|^You drop"
	if %1 = hal then gosub put.1 "rem %halweap" "%wield.msg"
	if %1 = le then gosub put.1 "wield my dag" "%wield.msg"
	if %1 = me then gosub put.1 "wield my scim" "%wield.msg"
	if %1 = he then gosub put.1 "wield my falc" "%wield.msg"
	if %1 = ht then gosub put.1 "get rock" "%wield.msg"
	if %1 = lt then gosub put.1 "get rock" "%wield.msg"
	if %1 = tm then gosub put.1 "get tx" "^You get|^You are"
}
else if (($Thanatology.LearningRate < 34) && ("$guild" = "Necromancer")) then if matchre ("$roomobjs", "(%ritualcritters) ((which|that) appears dead|\(dead\))") then gosub ritual arise "$1"
gosub put.1 "loot $loot" "^You search|%decay.list|^I could not find"
goto loot.loop

tm.combat:
if (($hide = 1) && ($Hiding.LearningRate < 34)) then
	{
		if $monstercount > 1 then
		{
			if $hidden = 0 then gosub hide.b
		}
	}
#if $guild = Bard then 
#{
#	if $end.song = 1 then gosub put.1 "$curr.song" ".+"
#	put #var end.song 0
#}
##action put target $mob
if (("$roomplayers" != "") && ("$guild" = "Necromancer")) then gosub prep.b %nec_tm_spell %tm_mana
else gosub prep.b %tm_spell %tm_mana
#if "%currtarg" != "$mob1" then gosub put.1 "target" "^You begin to weave|^You are not engaged|^I could not find"
#else  ## THIS SECTION IS USED TO TARGET DIFF CREATURES 
gosub put.1 "target %spell_loc" "^You begin to weave|^You are not engaged|^I could not find"
if $mana < 96 then waiteval $mana = 100
if (("$roomplayers" != "") && ("$guild" = "Necromancer")) then
{
	if contains("%nec.spells", "%curr.spell") then 
	{
		gosub rel.b
		goto tm.combat
	}
	else goto cast_do
}
cast_do:
##if $monstercount > 1 then gosub retreat.start
##gosub put.1 "harness 1" "Roundtime:"
gosub cast.b
## moon mage fluct calculators
##if (($mana > 96) && ($mana < $100)) then evalmath tm_mana (%tm_mana + 1)
##if $mana < 96 then evalmath tm_mana (%tm_mana - 1)
#if %tm_mana < 9 then var tm_mana 9
if matchre ("$roomobjs", ".+ ((which|that) appears dead|\(dead\))") then
{
	goto loot
}
goto tm.combat

loot.loop:
if matchre("$roomobjs", ("\b(%item)\b(,|\.| and)")) then
{
	gosub put.1 "stow $1" "^You put|^Stow what\?|^You pick"
	goto loot.loop
}
get.ammo:
if %1 = lx then
{
	if contains("$roomobjs", "%lxammo")) then
	{
	gosub put.1 "stow %lxammo.short" "^You pick"
	goto get.ammo
	}
}
if %1 = lx then gosub put.1 "remove crossbow" "%wield.msg"
#if %1 = lx then gosub put.1 "rem shield" "^You loosen"
if %exit = 1 then goto exit
goto target.find

no.mob:
put #var death.wait 0
echo None
delay 2
if %move = 0 then
{
	if "$stance" = ss1.b then gosub ss2.b
	delay 10
	goto target.find
}
goto hunt

hunt:
if $quick = 1 then goto RANDOM_MOVE
goto hunt.room
exit

## status effects

rest:
if %death = 1 then goto loot
gosub ss2.b
waiteval $stamina = 100
goto target.find

webbed:
echo *** You are webbed. ***
action goto target.find when ^You finally manage to free yourself from the webbing.
delay 50
goto target.find

## **** weapon vars

tm.var:
##put #var skin 1
put #var disable 0
var tm_spell pd
var nec_tm_spell bolt
var tm_mana 1
var spell_loc
if %1 = pm then var spell_loc right leg
action var spell_loc right eye when focusing on its left eye\.
action var spell_loc right leg when focusing on its right eye\.
action var spell_loc left eye when focusing on its left (arm|foreleg)\.
##action var spell_loc left leg when focusing on its chest\.
action var spell_loc left arm when focusing on its right (arm|foreleg)\.
action var spell_loc right arm when focusing on its left (leg|hindleg)\.
action var spell_loc left leg when focusing on its right (leg|hindleg)\.
action goto exit when eval $Targeted_Magic.LearningRate = 34
if %1 = pm then action goto exit when eval $Primary_Magic.LearningRate = 34
return

hal.var:
##gosub put.2 "rem %la" "stow %la" "^You put"
var man1 slice
var man2 punch
var man3 chop
var man4 draw
var halweap scythe
var combat.range 2
var move 1

action var cman %man1 when you step backward
action var cman %man2 when you slice a
action var cman %man3 when you punch your
action var cman %man4 when you chop a
action var cman %man4 when ^You move into a position to dodge\.|^But you are already
action goto exit when eval $Halberds.LearningRate = 34
gosub put.1 "rem %halweap" "%sheath.msg"
return

le.jab.var:
action goto exit when eval $Light_Edged.LearningRate = 34
action var cman %man1 when you feint
action var cman %man2 when you lunge
action var cman %man3 when you thrust
action var cman %man4 when you jab
var man1 lunge
var man2 thrust
var man3 jab
var man4 feint
return

brawl.var:
action goto exit when eval $Brawling.LearningRate = 34
if %2 = thana then action goto exit when eval $Thanatology.LearningRate = 34
action var cman %man1 when [Yy]ou kick your
action var cman %man2 when [Yy]ou slice your
action var cman %man3 when [Yy]ou punch your
action var cman %man4 when [Yy]ou claw your
var man1 slice
var man2 punch
var man3 claw
var man4 kick
return

le.slice.var:
action goto exit when eval $Light_Edged.LearningRate = 34
action var cman %man1 when you sweep a
action var cman %man2 when you step backward
action var cman %man3 when you slice a
action var cman %man4 when you chop a
var man1 draw
var man2 slice
var man3 chop
var man4 sweep
return

lt.var:
var swap 0
var man4 throw

action goto exit when eval $Light_Thrown.LearningRate = 35
##action var swap 1 when eval $Offhand_Weapon.LearningRate = 34
return

me.slice.var:
action goto exit when eval $Medium_Edged.LearningRate = 34
action var cman %man2 when [Yy]ou step backward
action var cman %man3 when [Yy]ou sweep a
action var cman %man3.5 when [Yy]ou slice a\s
action var cman %man4 when [Yy]ou chop a
action var cman %man1 when [Yy]ou feint a
var man1 draw
var man2 sweep
var man3 slice
var man3.5 chop
var man4 feint
return

he.var:
action goto exit when eval $Heavy_Edged.LearningRate = 34
action var cman %man2 when [Yy]ou step backward
action var cman %man3 when [Yy]ou sweep a
action var cman %man3.5 when [Yy]ou slice a\s
action var cman %man4 when [Yy]ou chop a
action var cman %man1 when [Yy]ou feint a
var man1 draw
var man2 sweep
var man3 slice
var man3.5 chop
var man4 feint
var roomid.p 100|82
return


ht.var:
put #var disable 1
put #var quick 1
##put #var skin 1
var man4 throw

action goto exit when eval $Heavy_Thrown.LearningRate = 34
return
lx.var:
var lxammo crossbow bolt
var lxammo.short bolt
var lxwait 0
var man4 nock my %lxammo.short
var man1 aim
var man2 get %lxammo.short
var man9 fire

action var cman %man1 when ^You load|already loaded|load .+ with a %lxammo\.$
action var cman %man9 when ^You begin to target
action var cman fir when ^How can you poach if
action var cman %man4 when (You|you) fire a
action var cman %man4 when ^You pick up (a|an) %lxammo\.|^You pull a %lxammo
##action var exit 1;goto loot when eval $Light_Crossbow.LearningRate = 34
action var exit 1;goto loot when eval $Light_Crossbow.LearningRate = 34 && %death = 1
return

run:
if contains("$roomobjs", "a rock")) then gosub put.1 "stow rock" "^You put|^Stow"	
if contains("$roomobjs", "%lxammo")) then
{
	gosub put.1 "stow %lxammo.short" "^You pick"
	goto run
}
gosub retreat.start
gosub move.random
gosub move 106
delay 5
goto target.find

exit:
pause
put #var combat 0
if contains("$roomobjs", "%lxammo")) then
{
	gosub put.1 "stow %lxammo.short" "^You put"
	goto exit
}
if %1 = tm then gosub stow tx
if %1 = le then gosub put.1 "sheath my dag" "^With a flick|^You sheathe"
if %1 = lt then gosub put.1 "stow rock" "^You put|^You secure"
if %1 = ht then gosub put.1 "get hamm" "^You pick|^You are already"
if %1 = lx then gosub put.1 "wear crossbow" "^You sling|^You are already"
#if %1 = lx then gosub put.1 "wear shield" "^You slide"
if %1 = hal then gosub put.1 "wear %halweap" "^You sling|^Perhaps"
if %1 = ht then gosub put.1 "stow ham" "%sheath.msg"
if %1 = me then gosub put.1  "sheath my scim" "%sheath.msg"
if %1 = he then gosub put.1  "sheath my falc" "%sheath.msg"
if "$lefthandnoun" = "zills" then gosub stow zills

gosub ss2.b
gosub put.1 "dodge" "^Roundtime:|But you are"

put #class spell_msg false
put #var stw 5
put #var sop 5
put #var em 5
put #parse combat.cmd done.
