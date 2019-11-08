put get my fan

start:
if $Magical_Devices.LearningRate < 34 then
{
put tap fan
pause
goto start
}
pause
pause
put stow my fan
put #parse tap.cmd done.
echo MD training done.