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
gosub cast ease
gosub cast ease
gosub cast ease
gosub cast ease
gosub cast ease
gosub hide
delay 45
goto app.l
exit:
#send #beep
