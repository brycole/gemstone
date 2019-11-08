include base.cmd

debuglevel 10

setvar shack.find 0 
setvar reed.find 0

action setvar shack.find 1 when a ruined shack
action setvar reed.find 1 when You tap some

put tap reed
delay 1
put look
delay 1
if %reed.find = 1 then goto exit
if %shack.find = 1 then goto at.shack
peer.start:
if $north = 1 then gosub peer n
if $northeast = 1 then gosub peer ne
if $east = 1 then gosub peer e
if $southeast = 1 then gosub peer se
if $south = 1 then gosub peer s
if $southwest = 1 then gosub peer sw
if $west = 1 then gosub peer w
if $northwest = 1 then gosub peer nw
if $up = 1 then gosub peer u
if $down = 1 then gosub peer d
goto move1

peer:
put peer $1
delay .5
if %shack.find = 1 then gosub shack.find $1
return

move1:
gosub mapmove %1

mapmove:
gosub walk $1
pause
delay 1
put tap reed
delay 1
if %reed.find = 1 then goto exit
gosub clear
goto peer.start

shack.find:
move $1
pause
at.shack:
move w
pause
move nw
pause
move go reed
exit

exit:
move go reed
exit