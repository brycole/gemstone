start:
if $preparedspell != None then waitfor You gesture.
put #script pause all except shadowling
pause
pause
put release
put stop play
delay 1

gosub shadow
gosub shadow
gosub shadow
gosub shadow
put teach $k.skill to kurav
put #script resume all
delay 420
goto start


shadow:
put prep shadowling
delay 8
put cast
put hide
pause
put stalk shadowling
pause
put perc shadowling
pause
return



