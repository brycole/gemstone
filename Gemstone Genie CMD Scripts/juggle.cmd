put get my $juggle
pause
goto $charactername.jugg

Stoh.jugg:
put prep cv 40
pause 20
put cast
pause

Kurav.jugg:
if_1 then goto juggle.start
gosub Hum
juggle.start:
if ($Perception.LearningRate < 5) then
   {
put hum $Hum_Song
put juggle $juggle
pause
pause 1
goto juggle.start
} 
put stow my $juggle
echo Juggling done.