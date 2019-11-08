varset:
var type 
if_1 var type %1
var contents "empty"
var item 

actions:
action var contents $1 when ^In the .* you see (.+)\.$
action var contents $1 when ^You rummage .* and see (.+)\.$

setup:
pause 0.2
put rummage %2 my %type
wait
eval contents replace("%contents",", ", "|")
eval contents replace("%contents"," and ","|")
eval item.max count("%contents", "|")+1
evalmath item.max %item.max+1
echo %item.max items.
counter set 0

sort:
if "%contents(%c)" = "" then goto done
if matchre("%contents(%c)@", (".+ (\w+)@") then var item $1
put get my %item from my %type
put put my %item in my %3
counter add 1
match sort You put
matchwait 5

done:
echo ** Items Transfered **
exit