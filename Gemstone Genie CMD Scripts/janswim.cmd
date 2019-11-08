include base.cmd
#debuglevel 10

action var swim 0 when ^Obvious
action var swim 0 when ^You can't swim in that

gosub move 9

#send .armor off
#waitfor armor.cmd done.
#gosub put.1 "fall" "^You flop"

swim.l:
if %hum = 1 then gosub put.1 "hum $Hum_Song" "^You are already|^You begin"
if %hum = 1 then var hum 0
if $Swimming.LearningRate < 34 then
{
	gosub swim w
	gosub swim e
	goto swim.l
}
else goto end

swim:
var swim 1
gosub put.1 "$1" "^Roundtime:|^You can't swim in that"
if %swim = 1 then goto swim
return

end:
#gosub put.1 "dance" "^You leap"
gosub put.1 "go ramp" "^Obvious"
#send .armor on
#waitfor armor.cmd done.
echo Swimming done.
put #parse janswim.cmd done.