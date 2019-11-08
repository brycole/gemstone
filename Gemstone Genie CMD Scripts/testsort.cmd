debuglevel 10

lore:
	var ix 0
	var globalexp 33
	gosub sortskill Warding|Utility|Augmentation|Sorcery|Primary_Magic|Arcana 6
	gosub skillcheck1
	#gosub sortskill Mechanical_Lore 1
	#gosub skillcheck1
	echo done!
	exit
skillcheck1:
	if $%sort(%ix).LearningRate < %globalexp then 
		{
			if "%sort(%ix)" = "%priorskill" then
				{
					evalmath ix (%ix + 5)
					goto skillcheck1
				}
			echo %sort(0)
			echo %sort(1)
			echo %sort(2)
			exit
			var priorskill %sort(0)
			var priorskill %sort(%ix)
			evalmath i (%ix + 5)
			goto skillcheck1
		}
	if %ix != %countskills then
		{
			evalmath ix (%ix + 1)
			goto skillcheck1
		}
	var ix 0

return


sortskill:
	var items $1
	var countskills $2
	math countskills subtract 1
	var i 0

SORT.I:
	var j %i
	math j add 1
SORT.J:
	if $%items(%j).Ranks < $%items(%i).Ranks or ($%items(%j).Ranks = $%items(%i).Ranks and $%items(%j).LearningRate < $%items(%i).LearningRate) then
	{
		var itemi %items(%i)
		var itemj %items(%j)
		eval items replace("%items", "%items(%i)", "temp2")
		eval items replace("%items", "%items(%j)", "temp1")
		eval items replace("%items", "temp1", "%itemi")
		eval items replace("%items", "temp2", "%itemj")
	}
	math j add 1
	if %j <= %countskills then goto SORT.J
	math i add 1
	if %i < %countskills then goto SORT.I
	var sort %items
return