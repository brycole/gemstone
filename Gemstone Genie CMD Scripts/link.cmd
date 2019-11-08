##debuglevel 10
include base.cmd

put #script abort all except link
send .death
send .afkk
pause
pause

##send .armor on
##waitfor armor.cmd done.

setvar train.room 23
setvar bundle.room 45
setvar bank.room 31
setvar gem.room 116
setvar temp 0
if $bypass = 1 then goto bypass

if $righthandnoun = khuj then gosub put.1 "wear khuj" "^You sling|Perhaps you"
if $righthandnoun = dagger then put sheath dagger
if $lefthandnoun != "" then put bundle

gosub retreat.start

	main.link:
if ($Shield_Usage.LearningRate != 34) then 
{
	gosub move 10
	delay 8
	goto creturn
}
gosub ss ppwalk
test:
gosub sell %bundle.room
gosub m.inputank %bank.room
gosub move 145
##gosub ss janswim
gosub ss toross lang

##gosub gem %gem.room

##gosub move %shard.east
gosub move %train.room
goto train.start

gem:
gosub move $1
send .sell bag /g
waitfor sell.cmd done.
return

	sell:
put #var bund.loc1 0
put #var bund.loc5 0
delay .5
gosub move $1

	sell.b:
gosub put.1 "rem bundle" "^You sling|^Remove what|^You take off|^You remove" 
if "$righthandnoun" != "bundle" then return
gosub put.1 "sell bundle" "then hands you|^I could not find"
gosub put.1 "stow rope" "^You put|Stow what"
goto sell.b

	bank:
gosub move $1
gosub put.1 "wealth" "Wealth\:"
gosub put.1 "check balance" "^The clerk pages"
gosub put.2 "deposit all lirums" "deposit all lirums" "^The clerk slides a small|^You don't have any"
return

	train.start:
send .afkK
send .trainall
bypass:
if $bypass = 1 then put #var bypass 2
waitfor trainall.cmd done.

combatmove:
send .toross ross
waitforre toross.cmd done.
send .armor on
waitfor armor.cmd done.	

gosub move 22
gosub move 73
gosub ss collect 34
gosub move 145
gosub ss magic ease 5 pend 4
gosub move 22

creturn:
##gosub put.2 "rem grea" "stow grea" "^You put|^Remove what"
gosub ss weapontrain hal
gosub ss weapontrain brawl
gosub ss weapontrain le
gosub move 50
gosub prep.b ob 30
waitforre ^You feel fully prepared to cast your spell\.
gosub cast.b
if "$roomplayers" = "" then goto gen2s
else gosub move 51
if "$roomplayers" = "" then goto gen2s
else gosub move 52
if "$roomplayers" = "" then goto gen2s
else gosub move 53
if "$roomplayers" = "" then goto gen2s
else gosub move 54
goto exit5

gen2s:
put #script abort afkk
send .death
send .afkhunt
send gen2
send .ambushcheck
exit5:
exit

RETURN:
return