include base.cmd
#debuglevel 10
goto $charactername

	Stoh:
put #script pause shadowling
put #script abort powerp
pause
pause
put #mapper
move s
delay 2
gosub move 1
goto climb.l


	Kurav:
send .armor off
waitfor armor.cmd done.
gosub put.2 "remove my rope" "uncoil my rope" "^You uncoil|^You can't" 
gosub move 1
gosub hide.b
climb.tree:
put climb fir tree with rope
put climb second fir tree with rope
matchre climb.l ^Obvious
matchre climb.pause ^Roundtime|^\.\.\.wait|^Sorry, you may
matchwait

climb.pause:
pause
goto climb.tree

climb.l:
if $Climbing.LearningRate < 34  then
{
	gosub put.2 "climb prac trunk" "hum $Hum_Song" "^You are already|^You begin|^You should stop"
	delay 15
	goto climb.l
}
else goto done	
	
done:
gosub put.1 "stop climb" "^You stop|^You weren't"
gosub hide.b
gosub put.1 "climb trunk with rope" "^Obvious"
gosub move 23
echo Climbing done.
gosub put.2 "coil my rope" "wear my rope" "^You sling"
send .armor on
waitfor armor.cmd done.
put #parse shardclimb.cmd done.
put #script resume shadowling
exit