##debuglevel 10
put #var combat 0
include base.cmd

if $monstercount < 1 then goto end

start.script:

start.hidestalk:

##action goto end when points at you,|points at you\.
##action goto hide when discovers you, ruining your hiding place\!
action var retreat.pole 1 when You spin around


var c 0
var retreat.pole 1

if_1 then put #var mob1 %1
if_2 then put #var mob2 %2
if_3 then put #var mob3 %3
if_4 then put #var mob4 %4

hidestalk:
if $em = 0 then gosub spell em 1 5 0
#if $hidden = 0 then gosub retreat.start
#if $hidden = 0 then gosub hide.b
goto start.stalk

delay:
if $hidden = 1 then gosub unhide
## waiting for more then 2 creatures
delay 10

start.stalk:

mob.count:
var mob.temp $monsterlist 
var mob1.c 0
var mob2.c 0
var mob3.c 0
var mob4.c 0
eval mob.temp replace("%mob.temp", ", ", "|")
eval mob.temp replace("%mob.temp", " and ","|")
eval mob.temp replace("%mob.temp", ".", "|")
eval mob1.c count("%mob.temp", "$mob1")
eval mob2.c count("%mob.temp", "$mob2")
eval mob3.c count("%mob.temp", "$mob3")
eval mob4.c count("%mob.temp", "$mob4")
evalmath totalmob (%mob1.c + %mob2.c + %mob3.c + %mob4.c)

if $monstercount < 2 then goto delay

if $hidden = 0 then gosub hide.b
if %retreat.pole = 1 then
	{
	gosub retreat.pole
	var retreat.pole 0
	}

mob1.c:
	if %mob1.c != 0 then 
	{
		gosub adv %counter(%c) $mob1
		evalmath c (%c +1 )
		if %c < %mob1.c then goto mob1.c
		var c 0
	}

mob2.c:
	if %mob2.c != 0 then 
	{
		gosub adv %counter(%c) $mob2
		evalmath c (%c +1 )
		if %c < %mob2.c then goto mob2.c
		var c 0
	}

	mob3.c:
	if %mob3.c != 0 then 
	{
		gosub adv %counter(%c) $mob3
		evalmath c (%c +1 )
		if %c < %mob3.c then goto mob3.c
		var c 0
	}

mob4.c:
	if %mob4.c != 0 then 
	{
		gosub adv %counter(%c) $mob4 
		evalmath c (%c +1 )
		if %c < %mob4.c then goto mob4.c
		var c 0
	}
	if $Stalking.LearningRate = 34 then goto hide.start
	goto start.stalk

hide.start:
##gosub move 6
##if "$monsterlist" != "" then gosub move 5
##if "$roomplayers" != "" then gosub move 7 
##if "$roomplayers" != "" then gosub move 8
	
hide.train:
if $monstercount < 2 then
{
	gosub unhide
	delay 15
}
gosub adv $mob1
if $hidden = 1 then gosub unhide
waitforre ^\[
gosub hide.b
	##if $invisible != 1 then goto end
	if "$monsterlist" = "" then goto hide.train.walk
if $Hiding.LearningRate < 34 then goto hide.train

end:
action remove points at you,|points at you\.
action remove discovers you, ruining your hiding place\!

put #var mob1 @@
put #var mob2 @@
put #var mob3 @@
gosub loud
gosub splay
	if $hidden = 1 then gosub unhide
		gosub put.2 "get breast" "wear breast" "^You work"
		##gosub put.2 "get grea" "wear grea" "^You work|^You are|^You attach"
		gosub put.2 "get glo" "wear glo" "^You work|^You are|^You slip"

echo Hide/Stalk done.
put #parse hidestalk.cmd done.
exit

hide.local:
if $sire = 0 then
{
	##gosub quiet
	gosub put.1 "sing sire" ".+"
}

	gosub hide.b
	gosub retreat.start
	##if $heldMana < 4 then goto end
	##if $invisible = 0 then waitforre ^You are confident that
	goto hidestalk
	
run:
if contains("$roomobjs", "a rock")) then gosub put.1 "stow rock" "^You put|^Stow"	
gosub retreat.start
gosub move.random
gosub move 106
delay 5
goto start.script