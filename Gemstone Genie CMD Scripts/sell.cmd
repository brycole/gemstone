## Created by Kurav

gosub rel

varset:
var type %1
var contents "empty"
var item

actions:
action var contents $1 when ^You rummage .* and see (.+)\.$

## changes capture string into an array and counts variables
setup:
pause 0.2
put rummage /%2 my %type
wait
eval contents replace("%contents",", ", "|")
eval contents replace("%contents"," and ","|")
eval item.max count("%contents", "|")
echo %item.max items.
counter set 0

## sell loop via array
sell:
if "%contents(%c)" = "" then goto done
if matchre("%contents(%c)@", (".+ (\w+)@") then var item $1
put get my %item from my %type
put sell my %item
counter add 1
## merchant match, may need to be changed/added depending on merchants or items being told
match sell hands you
matchwait 5

done:
echo ** Items Sold **
put #parse sell.cmd done.
exit
 