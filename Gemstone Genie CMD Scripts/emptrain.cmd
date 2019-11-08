put .exprefresh
Actions:
action put #queue clear;pause .5;send $lastcommand when ^(\.\.\.wait|^Sorry, you may only type)

#*****************************************#
#*********** Variable Setting ************#
#*****************************************#
Variables:
var Garbage turtle
var Song batt mast
var Camb medallion
var BMaterial grass
var Rope heavy
var Foragable red rose
var Juggly bumbleb
var Yoyo 0
var Instrument zills
var IType \$Percussions
var ISong lull quiet
var IClean cloth

#*******************************************#
#*********** Compendium Section ************#
#*******************************************#
Compendium:
Compendium.Start:
if $First_Aid.LearningRate < 11 then
    {
    if ($Empathy.LearningRate < 11) then
        {
        put perc health
        wait
        pause .5
        }
    put sit
    put get my comp
    pause .5
    put hum %Song
    put open my comp
    goto Compendium.Study
    }
goto Magic

Compendium.Study:
if $First_Aid.LearningRate < 11 then
    {
    put study my comp
    match Compendium.Start You take on a studious
    matchwait 1
    pause .5
    goto Compendium.Turn
    }
else 
   goto Compendium.End

Compendium.Turn:
put turn my comp
pause .5
goto Compendium.Study

Compendium.End:
pause .5
put stop hum
put close my comp
pause .5
put stow my comp

#**************************************#
#*********** Magic Section ************#
#**************************************#
Magic:
Magic.Start:
if $Magical_Devices.LearningRate < 11 then
    {
    pause .5
    put prep gs 15
    if ($Empathy.LearningRate < 11) then
        {
        put perc health
        wait
        pause 1
        }
    else
        pause 3
    put cast col
    put hold my %Camb
    goto Magic.Study
    }
goto Mech

Magic.Study:
if $Magical_Devices.LearningRate < 11 then
    {
    if ($mana > 40) then
        {
        put charge my %Camb 15
        wait
        pause 1
        put prep tranq
        put focus my %Camb
        wait
        pause 1
        waitforre ^You feel fully prepared
        put cast
        pause .5
        goto Magic.Study
        }
    else
        goto Magic.End
    }

Magic.End:
pause .5
put wear my %Camb
pause .5
if $Empathy.LearningRate < 11 then
    {
    put perc health
    wait
    pause .5
    }

#*****************************************#
#*********** Braiding Section ************#
#*****************************************#
Mech:
Mech.Start:
if $righthandnoun = "rope" then
    {
    put put my $righthandnoun in %Garbage
    put hum %Song
    pause .5
    if ($Empathy.LearningRate < 11) then
        {
        put perc health
        wait
        pause .5
        }
    }    
if $lefthandnoun = "rope" then put put my $lefthandnoun in %Garbage
if $Mechanical_Lore.LearningRate > 10 then goto Mech.End
if $lefthand = "Empty" and $righthand = "Empty" then goto Mech.Forage
if ($lefthand != "Empty") then put stow left
if ($righthand != "Empty") then put stow right
pause .5
goto Mech.Start

Mech.Forage:
pause .5
if $Mechanical_Lore.LearningRate < 11 then
    {
    if ($Empathy.LearningRate < 11) then
        {
        put perc health
        wait
        pause .5
        }
    put forage %BMaterial
    wait
    pause .5
    }
else
    goto Mech.End

Mech.Braid:
wait
match Mech.Pull %Rope rope.
match Mech.Pull wasted effort.
match Mech.Forage more material
match Mech.Forage need to be holding
match Mech.Forage appropriate rope making
match Mech.Braid Roundtime:
put braid my %BMaterial
matchwait

Mech.Pull:
wait
match Mech.Start  examine your new
match Mech.Forage ruined pieces.
match Mech.Forage need to be holding
match Mech.Braid work so far.
match Mech.Pull Roundtime:
put pull my %BMaterial
matchwait

Mech.End:
wait
pause .5
if $lefthand != "Empty" then put put my $lefthandnoun in %Garbage
if $righthand != "Empty" then put put my $righthandnoun in %Garbage

#*****************************************#
#*********** Foraging Section ************#
#*****************************************#
Forage:
Forage.Start:
if $Foraging.LearningRate < 11 then
    {
    put hum %Song
    put kneel
    goto Forage.Continue
    }
goto Forage.End

Forage.Continue:
if $Foraging.LearningRate < 11 then
    {
    if ($lefthand != "Empty") then put put my $lefthandnoun in %Garbage
    if ($righthand != "Empty") then put put my $righthandnoun in %Garbage
    if ($Empathy.LearningRate < 11) then
        {
        put perc health
        wait
        pause .5
        }
    put hum %Song
    put forage %Foragable careful
    wait
    pause .5
    put forage %Foragable careful
    wait
    pause .5
    goto Forage.Continue
    }
goto Forage.End

Forage.End:
if ($lefthand != "Empty") then put put $lefthand in %Garbage
if ($righthand != "Empty") then put put $righthand in %Garbage
pause .5
put stop hum

#*****************************************#
#*********** Juggling Section ************#
#*****************************************#
Perc:
Perc.Start:
put stand
put get my %Juggly
pause .5
if $Perception.LearningRate < 11 then
    {
    if %Yoyo = 1 then put wear my %Juggly
    goto Perc.Juggle
    }
goto Perc.End

Perc.Juggle:
pause .5
if $standing = 0 then put dance
if $Perception.LearningRate < 11 then
    {
    if (%Yoyo = 1) then
        {
        put throw my %Juggly
        }
    else
        put juggle my %Juggly
    wait
    pause .5
    goto Perc.Juggle
    }

Perc.End:
if %Yoyo = 1 then put rem my %Juggly
put stow %Juggly
pause

#*******************************************#
#*********** Instrument Section ************#
#*******************************************#
Instrument:
Instrument.Start:
if %Instrument = "None" then goto Compendium
if (%IType.LearningRate < 11)  then
    {
    put get my %Instrument
    if (%IType = "Strings") then put get my pick
    goto Instrument.Play
    }
goto Compendium

Instrument.Play:
if (%IType.LearningRate < 11)  then
    {
    put play %ISong on %Instrument
    pause .5
    put asse my %Instrument
    wait
    pause 1
    delay 20
    goto Instrument.Play
    }

Instrument.End:
put stop play
if (%IType = "\$Strings") then put stow my pick
pause 1
match Instrument.End [Roundtime:
put shake my %Instrument
matchwait .5
pause 1
put get my %IClean
match Instrument.End [Roundtime:
put clean my %Instrument with %IClean
matchwait .5
pause 1
put stow my %IClean
put stow my %Instrument
pause .5
goto Compendium