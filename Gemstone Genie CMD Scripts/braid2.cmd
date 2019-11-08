##debuglevel 10
if $invisible = 1 then put release
pause

action setvar more.mat 1 when You need to have more material
action setvar pull 1 when $rope rope\.

mech.forage:
if $Mechanical_Lore.LearningRate < %1 then 
{
    setvar more.mat 0
	setvar pull 0
	put forage $bmaterial
    pause
}
else goto done

braid:
if $Mechanical_Lore.LearningRate < %1 then 
{
	if %more.mat = 1 then goto mech.forage
	if %pull = 1 then goto pull
	put braid my $bmaterial
	pause
	goto braid
}
else goto done

pull:
put hum $Hum_Song
put pull my $bmaterial
pause
gosub dropb
if $Mechanical_Lore.LearningRate < %1 then goto mech.forage
else goto done

dropb:
move go gate
put empty left
put empty right
delay 1
move east
return

done:
echo Mech training done.
if $lefthand != "Empty" then gosub dropb
if $righthand != "Empty" then gosub dropb
delay 1
put #parse braid.cmd done.