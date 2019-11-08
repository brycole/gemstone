#debuglevel 10
include base.cmd

if "$zoneid" = "40" then var pptrail nw|ne|nw|ne|e|e|s|s|e|sw|w|sw
if "$zoneid" = "40" then var start.room 23
if "$zoneid" = "4" then var pptrail s|sw|se|se|e|s|se|sw|s|sw|Sw|ne|ne|n|ne|nw|n|e|ne|go path|w|n|nw|w|
if "$zoneid" = "4" then var start.room 269
if "$zoneid" = "34a" then var pptrail n|e|e|e|s|s|s|s|s|s|s|n|n|n|n|n|n|n|w|w|w|s
if "$zoneid" = "34a" then var start.room 14
if "$zoneid" = "7b" then var pptrail go path|e|ne|n|ne|nw|w|sw|sw|s|sw|e|go path
if "$zoneid" = "7b" then var start.room 71
var c 0

eval item.max count("%pptrail", "|")

gosub move %start.room

path:
gosub put.1 "%pptrail(%c)" "[.+]|^Obvious"
gosub put.1 "power" "^Roundtime"
if $Power_Perceive.LearningRate < 34 then math c add 1
else goto done
if %c > %item.max then var c 0
goto path

done:
gosub move %start.room
put #parse ppwalk.cmd done.



