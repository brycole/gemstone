include base.cmd

put #script pause geniehunter
pause
if $monstercount > $maxcrit.hide then gosub retreat.pole.b
if $Hiding.LearningRate < 34 then 
{
	gosub hide.b
	if $hidden = 1 then
	{
		gosub stalk.b
	}
}
end:
if $Appraisal.LearningRate < 34 then
{
	gosub put.1 "app pec quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app second pec quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app third pec quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
	gosub put.1  "app foruth pec quick" "^\[Roundtime:|^You cannot appraise|^Appraise"
}
if $hidden = 1 then gosub unhide.b

#3end:
#gosub put.1 "power" "^Roundtime:"
if $hidden = 1 then gosub unhide.b
if $Power_Perceive.LearningRate < 34 then gosub put.1 "power" "^Roundtime:"
put #script resume geniehunter
##if $monstercount > $maxcrit.hide then put adv
##if $hidden = 1 then gosub unhide.b
put #parse Roundtime