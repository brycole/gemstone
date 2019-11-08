##debuglevel 10
if $invisible = 1 then put release
pause
var lr $1
if_1 then var lr %1

#*****************************************#
#*********** Braiding Section ************#
#*****************************************#
put release
Mech:
Mech.Start:
if $righthandnoun = "rope" then
{
    put put my $righthandnoun in $garbage
    put hum $Hum_Song
    pause
}    
if $lefthandnoun = "rope" then put put my $lefthandnoun in $garbage

if $Mechanical_Lore.LearningRate = 34 then goto Mech.End
if $lefthand = "Empty" and $righthand = "Empty" then goto Mech.Forage
if ($lefthand != "Empty") then gosub dropb
if ($righthand != "Empty") then gosub dropb
goto Mech.Start

Mech.Forage:
pause
if $Mechanical_Lore.LearningRate < %lr then {
    put forage $bmaterial
    pause
    }
else
    goto Mech.End

Mech.Braid:
pause
match Mech.Pull $rope rope.
match Mech.Pull wasted effort.
match Mech.Forage more material
match Mech.Forage need to be holding
match Mech.Forage appropriate rope making
match Mech.Braid Roundtime:
put braid my $bmaterial
matchwait

Mech.Pull:
pause
match Mech.Start examine your new
match Mech.Forage ruined pieces.
match Mech.Forage need to be holding
match Mech.Braid work so far.
match Mech.Pull Roundtime:
put pull my $bmaterial
matchwait

Mech.End:
pause
if $lefthand != "Empty" then gosub dropb
if $righthand != "Empty" then gosub dropb

end:
echo Mechlore training is done.
put #parse braid.cmd done.
pause .5
goto exit

dropb:
move go gate
put empty left
put empty right
delay 1
move east
return
exit: