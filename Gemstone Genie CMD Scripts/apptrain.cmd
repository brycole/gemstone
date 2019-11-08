include base.cmd
delay 1

put mana song 5

send .armor on
waitfor armor.cmd done.
gosub put.1 "stance shield" "^You are now set"

gosub move 99
gosub move 116
if "$roomplayers" = "" then goto start.app
else gosub move 117
if "$roomplayers" = "" then goto start.app
else gosub move 118
if "$roomplayers" = "" then goto start.app
else gosub move 119
if "$roomplayers" = "" then goto start.app
else gosub move 120


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
gosub put.1 "app rakash quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1  "app second rakash quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1  "app third rakash quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1  "app fourth rakash quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1 "app rakash pryd" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1  "app second pryd quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1  "app third pryd quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
gosub put.1  "app fourth pryd quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
goto app.l
exit:
gosub move 81
gosub move 10
put mana song 10
put #parse apptrain.cmd done.
