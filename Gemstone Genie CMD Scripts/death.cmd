action goto death1 when Your body will decay beyond its ability|that you have just died!
action goto death when ^You feel a wave of nausea rising
action goto death when ^You collapse from fatigue!
action goto death when eval $health < 50
start:
delay 100
goto start

death:
put quit
exit
death1:
delay 2
put say Nice hit.
put depart item
pause
pause
pause
put quit
exit