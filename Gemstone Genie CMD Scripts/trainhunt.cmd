debuglevel 10
# perception training using hunt on dangerous creatures by Kurav
# base.cmd courtesy of Bakedmage

include base.cmd

gosub move 218

hunt.start:
gosub put.1 "hide" "^Roundtime:|^Eh\?"
gosub put.1 "hunt" "^Roundtime:"
gosub put.1 "hunt 1" "^Roundtime:|^Your prey|^You don't have"
gosub hunt.timer
gosub move 218
gosub put.1 "hide" "^Roundtime:|^Eh\?"
if $Perception.LearningRate < 34 then goto hunt.check

hunt.check:
if (%t >= %hunt_time) then goto hunt.start
delay 15
goto hunt.check