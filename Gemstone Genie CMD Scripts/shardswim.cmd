action goto eng when You are engaged|You'll have better luck

send .armor on
waitfor armor.cmd done.

gosub move 80
gosub move 188

	swim.l:
if $Swimming.LearningRate < 34 then
{
	setvar lmove se
	put swim se
	pause
	setvar lmove nw
	put swim nw
	delay 1
	goto swim.l
}
else goto end

	eng:
put retreat
put retreat
delay 1
if %lmove = nw then
{
	move nw
	delay 1
	goto swim.l
}
if %lmove = se then goto swim.l

	move:
put #var lastmove $1
put #mapper walk $1
waitfor @walk done.
return

	end:
gosub move 182
gosub move 184
gosub move 1
echo Swimming done.
put #parse shardswim.cmd done.

