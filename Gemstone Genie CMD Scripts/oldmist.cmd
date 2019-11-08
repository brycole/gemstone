## MIST FOREST CODE 

put #script abort toross
delay 3
gosub move 5
##gosub move 174
##gosub move 74
delay 2
match move.room1 Also here
match cont1 Obvious
put look
matchwait 5
move.room1:
gosub move 6
match quit Also here
match cont1 Obvious
put look
matchwait 5
cont1:
send .combat le
waitfor combat.cmd done.
gosub put.1 "look" "^Obvious"
if $roomid = 10 then 
{
	send .toross lang ledge
	waitfor toross.cmd done.
}
	else 
{
	gosub move.random
	if $roomid = 10 then 
	{
		send .toross lang ledge
		waitfor toross.cmd done.
	}
	else
	{
		gosub move 48
		send .toross lang
		waitfor toross.cmd done.
	}
}