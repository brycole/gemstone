VarSet:
var type 
if_1 var type %1
var contents "empty"
var gem 
var last_gem 

Actions:
action var contents $1 when ^In the .* you see (.+)\.$
action var contents $1 when ^You rummage .* and see (.+)\.$

Setup:
pause 0.2
put rummage in my %type
wait
eval contents replace("%contents",", ", "|")
eval contents replace("%contents"," and ","|")
eval gem.max count("%contents", "|")
echo %gem.max
counter set 0
action remove ^In the (.*?) pouch you see (.+)\.$

Sell:
if "%contents(%c)" = "" then goto Done
if matchre("%contents(%c)@", (".+ (\w+)@") then var gem $1
put get my %gem from my %type
put sell my %gem
waitfor You ask
counter add 1
goto Sell

Done:
echo ** Gems Sold **
exit