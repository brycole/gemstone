## Created by Kurav

varset:
var type %1
var contents "empty"
var item

actions:
action var contents $1 when ^You rummage .* and see (.+)\.$
action var contents $1 when ^In the .* you see (.+)\.$


## changes capture string into an array and counts variables
setup:
pause 0.2
put l in %type
##put rummage %2 %type
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
put get %item from %type
put put %item in %3
counter add 1
## merchant match, may need to be changed/added depending on merchants or items being told
matchre sell You put|What were
matchwait 5

done:
echo ** Items Sold **
put #parse sell.cmd done.
exit
 