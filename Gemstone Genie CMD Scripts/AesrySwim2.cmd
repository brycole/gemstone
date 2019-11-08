## Aesry Swim ##

Loop:
if ($Swimming.LearningRate > 10) then goto End
move go stream
move w
wait
move w
wait
move w
wait
move n
wait
put climb wall
match Reclimb All this climbing back and forth
matchwait 1
Cont: 
move go trail
move se
move e
goto Loop

Reclimb:
delay 5
match Reclimb All this climbing back and forth
put climb wall
matchwait 0.5
goto Cont

End:
put hide
wait
exit
