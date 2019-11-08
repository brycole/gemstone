include base.cmd

## ** Dancing shield **
gosub put.1 "stance set 100 1 99 0" "^Setting your"
gosub put.1 "hunt" "^Roundtime:"
gosub hunt.timer
shield:
app.l:
if $Shield_Usage.LearningRate <= 34 then goto parry
if $Appraisal.LearningRate != 34 then
{
if $monstercount < 1 then delay 10
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
gosub put.1 "app gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1  "app second gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1  "app third gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1  "app fourth gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
goto app.l
}
delay 15
put wealth
goto shield

parry:
gosub put.1 "wield scim" "^You deftly|^You're"
gosub put.1 "stance set 10 99 1 0" "^Setting your"
parry1:
gosub put.1 "look" "^Obvious"
parry2:
if $Parry_Ability.LearningRate = 34 then goto end
if $Appraisal.LearningRate != 34 then
{
if $monstercount < 1 then delay 10
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
gosub put.1 "app gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1  "app second gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1  "app third gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1  "app fourth gob quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
goto parry2
}
delay 15
goto parry1

end:
gosub put.1 "sheath scim" "^You secure"
put #parse dance.cmd done.
exit