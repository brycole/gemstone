#debuglevel 5
var heading %1
put dive river
put fall
wait
put hum $Hum_Song
pause

movement:
if $%heading = 0 && matchre("$roomdesc", "slab of rock") then
{
	var dir %headingwest
	##put app %headingwest
	##wait
	##pause
}
elseif (($%heading = 0)  && (!matchre("$roomdesc", "slab of rock"))) then goto end
elseif ($%heading = 1) then var dir %heading
move %dir
##gosub delay
pause
goto movement

delay:
if ($stamina < 100) then
	{
	delay 5
	goto delay
	}
else return

end:
pause
put stand
move climb bridge
pause
put hide
exit