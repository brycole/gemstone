if_1 then goto forage.start
goto $charactername.forage

Stoh.forage:
put prep cv 40
pause 20
put cast
pause

gosub rf

Kurav.forage:

forage.start:
put kneel

Forage.Continue:
if $Foraging.LearningRate != 12 then
    {
    if ($lefthand != "Empty") then put put my $lefthandnoun in $garbage
	pause
    if ($righthand != "Empty") then put put my $righthandnoun in $garbage
	pause
    put hum $song
    put forage $fm $ft
    wait
    pause
    put forage $fm $ft
    wait
    pause
    goto Forage.Continue
    }
goto Forage.End

Forage.End:
if ($lefthand != "Empty") then put put $lefthand in $garbage
if ($righthand != "Empty") then put put $righthand in $garbage
delay 2
put stand
echo Foraging is done.
