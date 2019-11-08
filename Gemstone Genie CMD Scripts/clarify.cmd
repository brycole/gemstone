var c.pouch %1
var contents "empty"
var gem 
var last.gem 
var cg 1

action var type $1;var contents $2 when ^In the (.*?) pouch you see (.+)\.$
action var cg 0 when is completely perfect.


if_1 goto setup
echo Not enough variables!
exit

setup:
pause 0.5
put l in my %c.pouch pouch
delay 1
eval contents replace("%contents",", ", "|")
eval contents replace("%contents"," and ","|")
eval gem.max count("%contents", "|")
echo %gem.max gems.
counter set 0
action remove ^In the (.*?) pouch you see (.+)\.$

next.gem:
if "%contents(%c)" = "" then goto done
if matchre("%contents(%c)", ("$gems")) then var gem $1
if $spellPG = OFF then gosub check.pg
timer start
setvar cg 1
put prep pg
delay 2
gosub main.clarify
counter add 1
goto next.gem


main.clarify:
if $spellPG = OFF then gosub check.pg
put get my %gem from my %c.pouch pouch
gosub pg
gosub cg
gosub end.clarify
return

pg:
if $spellPG = OFF then gosub check.pg
put cast my %gem
waitforre You gesture|You let your
return

cg:
if $spellPG = OFF then gosub check.pg
put prep cg
delay 3
match RETURN It begins to
match cg Your spell fails
match RETURN You let your
if %cg = 1 then put cast my %gem
else put release
matchwait


end.clarify:
if $spellPG = OFF then gosub check.pg
put put my %gem in my black pouch
waitforre You put|What were you
return

check.pg:
put prep pg
harness:
pause
match heldloop You tap
match harness ...wait
put harness 5
matchwait
heldloop:
if $heldMana < 35 then goto harness
put cast
return

done:
echo Total time to clarify was %t seconds.
exit

RETURN:
pause
return