## climb practice
	gosub routinecommon 

initialize: 

main:
action put climb practice wall when ^You finish practicing your climbing skill and take a well-earned break 
action instant goto stopclimb when eval $Climbing.LearningRate=34

echo $Climbing.LearningRate
	gosub put climb practice wall
	gosub pause 900

stopclimb:
echo $Climbing.LearningRate
	gosub put stop climb

magicend:
echo Climb training done.
put #parse climbpractice.cmd done.
exit

	
include routinecommon.cmd 

