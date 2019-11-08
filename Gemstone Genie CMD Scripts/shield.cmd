include base.cmd
delay 1

#put #class spell_msg true
gosub splay

start.script:
##gosub move 40
##if "$roomplayers" = "" then goto start.app
##else gosub move 41
##if "$roomplayers" = "" then goto start.app
##else gosub move 42
##if "$roomplayers" = "" then goto start.app
##else goto shield.exit

start.app:
gosub put.1 "stance set 100 1 100 0" "^Setting your"
gosub put.1 "hunt" "^Roundtime:"
gosub hunt.timer	

app.l:
gosub spell.check
##if $monstercount > 3 then gosub put.1 "stance set 50 1 100 0" "^Setting your"
if (($Shield_Usage.LearningRate = 34) && ($Evasion.LearningRate = 34)) then goto shield.exit
if $monstercount < 1 then delay 10
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
##if $sire = 0 then gosub put.1 "sing sire" ".+"
##if $Hiding.LearningRate < 34 then gosub hide
delay 10
if $hidden = 1 then gosub unhide
if $Appraisal.LearningRate < 34 then
{
	gosub put.1 "app leuc quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app second leuc quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app third leuc quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app fourth leuc quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	#gosub put.1 "app skin quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	#gosub put.1  "app money quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	#gosub put.1  "app tight quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	##gosub put.1  "app pinch quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
}
goto app.l

shield.exit:

gosub ss2.b
put #parse shield.cmd done.
exit
