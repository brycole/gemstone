include base.cmd
delay 1

put #class spell_msg true
put #var sop 0
put #var em 0

#gosub move 35
if "$roomplayers" = "" then goto start.app
else gosub move 34
if "$roomplayers" = "" then goto start.app
else gosub move 37
if "$roomplayers" = "" then goto start.app
else gosub move 38
if "$roomplayers" = "" then goto start.app
else goto shield.exit


start.app:
gosub put.1 "stance set 100 0 100 0" "^Setting your"
gosub put.1 "hunt" "^Roundtime:"
gosub hunt.timer	
app.l:
#eval mob1.c count("$monsterlist", "cougar")
##echo %mob1.c
#if %mob1.c > 3 then gosub put.1 "stance set 100 0 100 0" "^Setting your"
#else gosub put.1 "stance set 100 0 40 0" "^Setting your"
#if $sop = 0 then gosub spell sop 1 5 0
if $Evasion.LearningRate = 34 then goto evasion.exit
if $monstercount < 1 then delay 10
if (%t >= %hunt_time) then
{
	gosub put.1 "hunt" "^Roundtime:"
	gosub hunt.timer
}
gosub spell ease 1 1 0
if $mana < 100 then waiteval $mana = 100
gosub spell ease 1 1 0
if $mana < 100 then waiteval $mana = 100
gosub spell ease 1 1 0
if $mana < 100 then waiteval $mana = 100
gosub spell ease 1 1 0
if $mana < 100 then waiteval $mana = 100
if $sop = 0 then gosub spell sop 1 5 0
goto app.l

evasion.exit:
put #class spell_msg false
put #var sop 5
put #var em 5

gosub ss2.b
put #parse shield.cmd done.
exit