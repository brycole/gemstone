include base.cmd
#debuglevel 10
var box chest

start.lockpick:
gosub put.1 "get my lock" "^You get|^What were|^You are"
if "$righthandnoun" != "lockpick" then goto lockpick.exit
gosub put.1 "get my %box"  "^You get|^What were|^You are"
if "$lefthandnoun" != "%box" then goto lockpick.exit

repeat.pick:
gosub hum
gosub put.1 "pick blind" "^Roundtime|^Find a more|^It's"
if "$righthandnoun" != "lockpick" then goto start.lockpick
if $Lockpicking.LearningRate = 34 then goto lockpick.exit
else goto repeat.pick

lockpick.exit:
gosub stow left
gosub stow right
put #parse lockpick.cmd done.


exit 
