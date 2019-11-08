# braid by Kurav
#debuglevel 10
include base.cmd

put #var trash 1
gosub put.1 "look" "^Obvious"

action setvar more.mat 1 when You need to have more material|Braid what\?
action var pull 1 when ^Frustration wells|^You fumble around
action goto checkhands when ^You really need

action goto hand.error when You need both hands to do that.

var dump.hand vine|vines|rope|rock|stick|grass
var rt
var hum 1
gosub put.2 "remove my glo" "stow my glove" "^Stow what\?|^You put your"
if "$guild" = "Bard" then 
{
	gosub put.1 "mana song 1" "^Your enchante"
	gosub put.1 "sing mere" ".+"
}

mech.forage:
if $Mechanical_Lore.LearningRate < %1 then 
{
    setvar more.mat 0
	setvar pull 0
	if %hum = 1 then gosub m.input hum
	if %hum = 1 then var hum 0
	gosub put.1 "forage $bmaterial" "^Roundtime:"
}
else goto done

braid:
if $Mechanical_Lore.LearningRate < %1 then 
{
	if %more.mat = 1 then goto mech.forage
	if %pull = 1 then goto pull
	if %hum = 1 then gosub m.input hum
	if %hum = 1 then var hum 0
	gosub put.1 "braid my $bmaterial" "^Roundtime:|^You need|^Braid what\?"
	gosub ppcheck
	goto braid
}
else goto done

pull:
gosub put.1 "pull my $bmaterial" "^Roundtime:|^You nod|breaks apart"
gosub checkhands
if $Mechanical_Lore.LearningRate < %1 then goto mech.forage
else goto done

dropb:
gosub put.1 "east" "^Obvious"
gosub put.1 "empty $1" "^You drop"
gosub put.1 "west" "^Obvious"
return

checkhands:
if $trash = 1 then 
{
if matchre("$lefthandnoun", "%dump.hand") then gosub put.1 "put my $lefthandnoun in $garbage" "^*"
else if $lefthandnoun != "Empty" then gosub put.1 "stow left" "^*"
if matchre("$righthandnoun", "%dump.hand") then gosub put.1 "put my $righthandnoun in $garbage" "^*"
else if $righthandnoun != "Empty" then gosub put.1 "stow right" "^*"
}
else
{
if matchre("$lefthandnoun", "%dump.hand") then gosub dropb left 
else if $lefthandnoun != "Empty" then gosub put.1 "stow left" "^*"
if matchre("$righthandnoun", "%dump.hand") then gosub dropb right
else if $righthandnoun != "Empty" then gosub put.1 "stow right" "^*"
}
return


hand.error:
gosub checkhands
goto mech.forage

done:
echo Mech training done.
gosub checkhands
gosub put.2 "get my glo" "wear my glo" "^You are already|^Wear what\?|^You slip"
end1:
put #parse braid.cmd done.