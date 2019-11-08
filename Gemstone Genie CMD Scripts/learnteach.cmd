debuglevel 10
include base.cmd
var level.3 0
var level.2 0
var level.1 0


action var level.3 1;var teach.3 $1 when (\w+) is teaching a class on extremely advanced
action var level.2 1;var teach.2 $1 when (\w+) is teaching a class on [^extremely]
action var level.1 1;var teach.1 $1 when (\w+) is teaching a class

find.class:
	gosub put.1 "ass teach" "^Roundtime:"
	if %level.3 = 1 then 
	{
		gosub put.1 "listen %teach.3" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		goto listenexit
	}
	if %level.2 = 1 then
	{
		gosub put.1 "listen %teach.2" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		goto listenexit
	}
	if %level.1 = 1 then 
	{
		gosub put.1 "listen %teach.1" "isn't teaching|^I could not find|^You begin|^You are already|has closed the class|You cannot teach a skill "
		goto listenexit
	}

listenexit:

put #parse learnteach.cmd done.
exit