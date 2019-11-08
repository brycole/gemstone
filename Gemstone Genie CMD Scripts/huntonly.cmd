include base.cmd
delay 1

start.app:
gosub put.1 "hunt" "^Roundtime:"
gosub hunt.timer	
app.l:
if $Appraisal.LearningRate = 34 then goto exit
if $monstercount < 1 then delay 10
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
gosub spell ease 1 1 1
if $mana < 100 then waiteval $mana = 100
gosub spell ease 1 1 1
if $mana < 100 then waiteval $mana = 100
gosub spell ease 1 1 1
if $mana < 100 then waiteval $mana = 100
gosub spell ease 1 1 1
if $mana < 100 then waiteval $mana = 100
gosub hide
goto app.l
exit:
