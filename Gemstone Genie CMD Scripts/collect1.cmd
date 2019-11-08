include base.cmd

action goto delay when ^You are still stunned\.
action goto f.exit when ^The room is too cluttered to find anything here!

collect.start:
if %hum = 1 then gosub put.1 "hum $Hum_Song" "^You are already|^You begin"
if %hum = 1 then var hum 0
gosub put.1 "collect %1" "^Roundtime:"
kp:
gosub put.1 "kick pile" "^You take a step back|^I could not"
goto collect.start

delay:
delay 10
gosub put.1 "dance silly" "^You leap to your|^Your wounds"
if $standing != 1 then goto delay
goto kp

f.exit:
delay 5
if $standing != 1 then goto delay
exit