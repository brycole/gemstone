var stuff
var stuffcount
var action get|wear
var exceptions gauntlets|staff|spear
var item
var itemnumber 0

waitforre \w+'s grave you see (.+)
var stuff $1

setup:
eval stuff replacere("%stuff", "(, | and )", "|")
echo %stuff
eval stuff replace("%stuff", ".", "|")
echo %stuff
eval stuffcount count("%stuff", "|")
math stuffcount subtract 1

redress:
if %itemnumber > %stuffcount then goto end
if (matchre("%stuff(%itemnumber)", "(%exceptions)")) then var item $0
if ("%item" = "") && (matchre("%stuff(%itemnumber)", "(\w+)$")) then var item $0
put %action(0) %item
put %action(1) my %item
wait
math itemnumber add 1
var item
goto redress

end:
echo
echo All done!
echo
exit
