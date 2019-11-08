include base.cmd
#debuglevel 10

action goto eng when You are engaged|You'll have better luck

send .armor on
waitfor armor.cmd done.

gosub move 112
gosub put.1 "jump" "^Obvious"

	swim.l:
if $Swimming.LearningRate < 34 then
{
	gosub swim nw
	gosub swim ne
	gosub swim ne
	gosub swim n
	gosub swim n
	gosub swim nw
	gosub swim sw
	gosub swim s
	gosub swim sw
	gosub swim s
	gosub swim se
	gosub swim se
	goto swim.l
}
else goto end

	swim:
gosub put.1 "$1" "^Obvious"
return

	eng:
gosub retreat.start
gosub put.1 "go humm" "^Obvious|^What were"

put #mapper
gosub put.1 "look" "^Obvious"
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
gosub put.1 "$1" "^Obvious"

if $north = 1 then gosub mapmove1 n
if $northeast = 1 then gosub mapmove1 ne
if $east = 1 then gosub mapmove1 e
if $southeast = 1 then gosub mapmove1 se
if $south = 1 then gosub mapmove1 s
if $southwest = 1 then gosub mapmove1 sw
if $west = 1 then gosub mapmove1 w
if $northwest = 1 then gosub mapmove1 nw
if $up = 1 then gosub mapmove1 u
if $down = 1 then gosub mapmove1 d
	
	mapmove1:
gosub put.1 "$1" "^Obvious"
gosub move 112
gosub put.1 "jump" "^Obvious"
goto swim.l

	end:
gosub put.1 "go humm" "^Obvious|^What were"
delay 1
gosub move 23
echo Swimming done.
put #parse fenswim.cmd done.