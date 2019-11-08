include base.cmd

send .armor on
waitfor armor.cmd done.

if $zoneid != 41 then gosub move 229
goto done
gosub move 61


walkstart:
timer clear
timer start
if %hum = 1 then gosub put.1 "hum $Hum_Song" "^You are already|^You begin"
if %hum = 1 then var hum 0
gosub walk nw
gosub walk nw
gosub walk n
gosub climbobj wall
gosub climbobj cliff
echo $stamina
waiteval $stamina = 100
gosub walk n
gosub walk nw
gosub climbobj wall
gosub climbobj wall
echo $stamina
waiteval $stamina = 100
gosub walk ne
gosub walk ne
gosub walk ne
gosub walk e
gosub climbobj wall
gosub climbobj wall
echo $stamina
waiteval $stamina = 100
gosub walk s
gosub climbobj wall
gosub climbobj wall
echo $stamina
waiteval $stamina = 100
gosub walk sw
gosub walk se
gosub walk s
gosub walk sw
gosub walk sw
echo %t
evalmath delaytime 61-%t
echo %delaytime
## current climbing time takes 55 seconds, learning timer is 60 seconds, this delay bridges the gap
delay %delaytime
if $Climbing.LearningRate < 34 then goto walkstart

done:
gosub ss weapontrain1 brawl
gosub ss weapontrain tm
put #script abort ambushcheck
gosub move 54
gosub put.1 "go wall" "^Obvious"
gosub walk s
gosub move 215
put #parse seordwall.cmd done.