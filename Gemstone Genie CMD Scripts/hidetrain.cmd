include base.cmd
put stop play
delay 1

action goto hide.l when ^You stop advancing\.|^What do you want to advance towards


send .armor on
waitfor armor.cmd done.
##send .armor off
##waitfor armor.cmd done.
##gosub put.2 "get buck" "wear buck" "^You slide|^You are"
##gosub put.2 "get %la" "wear %la" "^You work|^You are"
##gosub put.2 "rem %la" "stow %la" "^You put"
##gosub put.2 "get shirt" "wear shirt" "^You work|^You are"

gosub move 140

delay 2
match move.room Also here
match cont Obvious
put look
matchwait 5
move.room:
gosub move 141
match end Also here
match cont Obvious
put look
matchwait 5

quit:
gosub move 23
gosub put.1 "quit"

cont:
gosub put.1 "hunt" "^Roundtime:"
gosub hunt.timer
goto hide.l.a	
app.l:
if $Appraisal.LearningRate = 34 then goto hide.l.a
if $monstercount < 1 then delay 10
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
gosub put.1 "app ranger quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app second ranger quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app prydaen quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app rakash quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app second rakash quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app second pryd quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app ghoul quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app second ghoul quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
gosub put.1 "app third pryd quick" "^\[Roundtime:|^You cannot appraise|^Appraise|^I could not"
goto app.l

delay.hide:
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
delay 30
put info
hide.l.a:
goto obs
## heavy chain 
gosub put.1 "stance eva 70" "^Your"
send .magic ease 5 pendant 4
hchain:
if $Heavy_Chain.LearningRate > 10 then goto hchainb
delay 10
goto hchain

hchainb:
delay 3
if $mana < 100 then waiteval $mana = 100
put #script abort magic
put release
pause
gosub put.1 "wear pend" "^You hang|^You are"
obs:
gosub prep.b ob 30
waitforre ^You feel fully prepared to cast your spell\.
gosub cast.b
gosub put.2 "rem glo" "stow glo" "^You put|^Remove what"
gosub put.2 "rem grea" "stow grea" "^You put|^Remove what"
gosub put.2 "rem bala" "stow bala" "^You put|^Remove what"
gosub put.2 "rem shirt" "stow shirt" "^You put|^Remove what"
##gosub put.2 "get %la" "wear %la" "^You work|^You are"
hide.l:
if (($Stalking.LearningRate < 34) || ($Hiding.LearningRate < 34)) then 
{
	if $hidden = 1 then gosub unhide.b
	waitforre ^\[You're
	if (%t >= %hunt_time) then
	{
		gosub put.1 "hunt" "^Roundtime:"
		gosub hunt.timer
	}
	gosub hide.b
	if $hidden = 1 then
	{
		if $Stalking.LearningRate < 34 then goto stalk.loop
		##gosub unstalk.b
		##gosub put.1 "adv" "^You begin to|^What do you want|^You spin around|^You are already"
	}
	goto hide.l
}
else goto end

end:
gosub retreat.start
gosub move 122
send .armor on
waitfor armor.cmd done.
put #parse hidetrain.cmd done.
exit

stalk.loop:
if $Stalking.LearningRate >= 34 then goto hide.l
else 
{
	if $hidden = 1 then gosub put.2 "retreat" "adv" "^You begin to|^What do you want|^You spin around|^You are already"
	else goto hide.l
}
goto stalk.loop