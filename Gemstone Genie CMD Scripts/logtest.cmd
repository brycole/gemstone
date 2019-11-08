debuglevel 10
# Exp log script

gosub startskill Perception
pause 15
gosub endskill Perception
exit

startskill:
	var starttime $gametime
	var rankstart $$1.LearningRate
	put #log >ExpLog $time
	put #log >ExpLog $1 starting mindstate: $$1.LearningRate
return

endskill:
	var endtime $gametime
	var rankend $$1.LearningRate
	var timediff 0
	var mindstatetime 0
	var rankdiff 0
	evalmath rankdiff (%rankend - %rankstart)
	evalmath timediff (%endtime - %starttime)
	put #log >ExpLog $1 ending mindstate: $$1.LearningRate
	evalmath timediff (%timediff / 60)
	put #log >ExpLog %timediff minutes training skill.
	evalmath mindstatetime (%timediff / %rankdiff)
	put #log >ExpLog %mindstatetime minutes per mindstate.
return