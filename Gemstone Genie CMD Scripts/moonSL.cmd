put power
pause
delay 1

setvar pp 1
gosub spell shadowling 0

pploop:
gosub spellcheck
if (Power_Perception.LearningRate != 12) then
{
	if %regen = 1 then goto regen
	put prep $tspell $tpower
	waitfor You feel fully
	put release shadowling
	put cast
	match sl Bright golden light flares for a moment.
	match regen You are unable to harness 
	matchwait 30
}
else goto magicend

sl:
put perc shadowling
waitfor There are no spells
put hide
waitforre You blend|You melt
put stalk shadowling
waitforre You move|Stalk what?
goto pploop