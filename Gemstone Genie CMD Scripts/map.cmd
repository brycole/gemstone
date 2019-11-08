## Mapper setup
put #mapper
put look
pause
if $north = 1 then gosub mapmove n
if $northeast = 1 then gosub mapmove ne
if $east = 1 then gosub mapmove e
if $southeast = 1 then gosub mapmove se
if $south = 1 then gosub mapmove s
if $southwest = 1 then gosub mapmove sw
if $west = 1 then gosub mapmove w
if $northwest = 1 then gosub mapmove nw
if $up = 1 then gosub mapmove u
if $down = 1 then gosub mapmove d

mapmove:
var end.room $roomid
move $1

Echo Mapper initialized.
echo Pausing for 3 seconds.
pause 3

goto zonecheck