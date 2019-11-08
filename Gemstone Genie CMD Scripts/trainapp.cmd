VarSet:
var type 
if_1 var type %1
var contents "empty"
var item 
var last_item

Actions:
action var contents $1 when ^In .* you see (.+)\.$
action var contents $1 when ^You rummage .* and see (.+)\.$
action var contents $1 when ^On .* you see (.+)\.$

Setup:
pause 0.2
#put rummage %2 my %type
put look %1 %2
wait
eval contents replace("%contents",", ", "|")
eval contents replace("%contents"," and ","|")
eval item.max count("%contents", "|")
echo %item.max items on %2.
counter set 0

Sell:
if "%contents(%c)" = "" then goto Done
if matchre("%contents(%c)@", (".+ (\w+)@") then var item $1
put app %item %1 %2 quick
wait
counter add 1
goto Sell

Done:
echo ** Items Appraised **
exit