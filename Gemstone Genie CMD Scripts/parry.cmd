include base.cmd
delay 1
gosub splay

gosub move 228
if "$roomplayers" = "" then goto start.app
else gosub move 229
if "$roomplayers" = "" then goto start.app
else gosub move 230
if "$roomplayers" = "" then goto start.app
else gosub move 231
if "$roomplayers" = "" then goto start.app
else gosub move 232
if "$roomplayers" = "" then goto start.app
else gosub move 233
if "$roomplayers" = "" then goto start.app
else goto parry.exit

if $monstercount < 1 then goto parry.exit

start.app:
gosub put.1 "wield scim" "%wield.msg"
gosub put.1 "stance set 40 100 1 0" "^Setting your"
gosub put.1 "hunt" "^Roundtime:"
gosub hunt.timer	
app.l:
if $Parry_Ability.LearningRate = 34 then goto parry.exit
if $monstercount < 1 then delay 10
##if $monstercount > 3 then gosub put.1 "stance set 50 100 1 0" "^Setting your"
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
if $sire = 0 then gosub put.1 "sing sire" ".+"
##if $Hiding.LearningRate < 34 then gosub hide
delay 10
if $hidden = 1 then gosub unhide
if $Appraisal.LearningRate < 34 then
{
	gosub put.1 "app eel quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app second eel quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app third eel quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
}
goto app.l

parry.exit:
gosub ss2.b
gosub put.1 "sheath scim" "%sheath.msg"
put #parse parry.cmd done.
exit
