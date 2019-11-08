include base.cmd

gosub move 88
gosub put.2 "rem breast" "stow breast" "^You put"
gosub walk n
start.swim:
if $Swimming.LearningRate = 34 then goto exit.swim
gosub hum
gosub walk ne
gosub walk nw
gosub walk sw
gosub walk se
#gosub walk s
#gosub walk n
goto start.swim


exit.swim:
gosub put.2 "get breast" "wear breast" "^You work"
gosub ss playtrain vocals stop
gosub walk s
put #parse goblinbrook.cmd done.
exit