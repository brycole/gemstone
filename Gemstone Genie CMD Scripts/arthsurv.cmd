include base.cmd
#debuglevel 10
gosub move 14

action goto delay when ^All this climbing back and forth

gosub climb oak tree
start:
put hum $vocals_song
## cannot climb trunk until at least 30
##gosub climb trunk
timer clear
timer start
##gosub climb tree
gosub put.1 "go ramp" "^Obvious"
gosub put.1 "dive hole" "^Obvious"
if $Swimming.LearningRate = 34 then goto bypass.swim
gosub walk s
gosub walk w
gosub walk n
gosub walk e
bypass.swim:
gosub climb emb
## timer delay to reach 60 second learning
gosub climb tree
evalmath delaytime 61-%t
gosub put.1 "climb prac trunk" "^You begin"
delay:
echo %delaytime
delay %delaytime
if $stamina < 100 then waiteval $stamina = 100
gosub put.1 "stop climb" "^You stop|^You weren't"
if (($Climbing.LearningRate = 34) && ($Swimming.LearningRate = 34)) then goto end
goto start


end:
put #parse arthsurv.cmd done.
exit