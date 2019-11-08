debuglevel 10

	gosub routinecommon

	var resonance moving
	put #var monitor no

	var temp1 %1
	var temp2 %2
	var temp3 %3
	var toollist saw|axe|shaper|knife|drawknife|glue|flights
	
	## ** Arrow messages
	var drawknife.msg ^Finally you complete sawing|^The \w+ is ready to be carved
	var glue.msg ^You place your arrowheads with your|^You place your flights with your|^The arrows must have glue applied
	##^The arrows are ready for an application of glue
	var arrowhead.msg ^You need another .+ arrowheads
	var shaper.msg ^You apply some glue to your arrows|^You dab the surface of your arrows|ready for shaping with a wood shaper|^Using slow strokes you scrape away|^You whittle away the rough
	var knife.msg ^A handful of rough edges|^Now the flights are ready to be trimmed|^Rough grooves on the|^The arrows must be carved with a knife
	var flights.msg ^You need another arrow flights
	var analyze.msg ^The arrow flights is not required|^That tool does not seem suitable for that
	
	## ** Bone Carving messages
	var rasp.msg you determine the \w+ is uneven|^An uneven texture|^The \w+ appears to be uneven
	var bonesaw.msg ^You do not see anything that would prevent
	
	
	var combined.msg %drawknife.msg|%glue.msg|%arrowhead.msg|%shaper.msg|%knife.msg|%flights.msg|%analyze.msg

	gosub emptyhands
	gosub action.init
	
	if "%1" = "arrows" then goto startarrows
	if "%1" = "lumber" then goto startlumber
	if "%1" = "arrowhead" then goto headshaft
	if "%1" = "shafts" then goto headshaft
exit

action.init:
	action var tool drawknife; var toolaction scrape when %drawknife.msg
	action var tool glue; var toolaction apply when %glue.msg
	action var tool %arrowheads; var toolaction assemble;var itemmake %itemgoal when %arrowhead.msg
	action var tool shaper; var toolaction shape when %shaper.msg
	action var tool carving knife; var toolaction carve when %knife.msg
	action var tool flights; var toolaction assemble when %flights.msg
	action var tool analyze; var toolaction analyze when %analyze.msg
	action var tool complete when ^Applying the final touches
	
	action var tool rasp; var toolaction scrape when %rasp.msg
	action var tool bone saw; var toolaction cave when %bonesaw.msg
	

return

### **** Shaping arrows section ***** ###
startarrows:
	var chapter 5
	var page %temp2
	var tool shaper
	var itemmake shafts
	var toolaction shape
	if %page = 4 then 
	{
		var arrowheads cougar-claw arrowheads
		var itemgoal cougar-claw arrows
	}
	if %page = 10 then 
	{
		var arrowheads soot-streaked arrowheads
		var itemgoal soot-stained arrows
	}
		
	if "%3" = "analyze" then 
	{
		var itemmake %itemgoal
		var tool analyze
		var toolaction analyze
	}
	
gosub studybook1
	
goto shaping.mainloop

arrows.exit:
	#gosub put.1 "ana my arrows" "^Roundtime"
	#gosub put.1 "app my arrows careful" "^Roundtime"
	put stow knife
	put swap
	pause
	put give keel

	
	exit

	
shaping.mainloop:
	if ((("$righthandnoun" != "%tool") && ("$righthand" != "%tool")) || (("$lefthandnoun" != "%tool") && ("$lefthand" != "%tool"))) then
	{
		if ((matchre("%toollist", "($righthandnoun)")) || (matchre("%toollist", "($lefthandnoun)")) then if "$1" != "" then gosub stow $1
		gosub get my %tool
	}
	if (("$righthand" != "%itemmake") && ("$lefthand" != "%itemmake")) then gosub get my %itemmake
	if (("$righthand" != "%tool") && ("$righthandnoun" != "%tool")) then gosub swap
	if ((matchre("%itemmake", "%lumberlist")) && (($lefthandnoun = lumber|$righthandnoun = lumber))) then goto lumberloopexit
	
	if "%tool" = "glue" then gosub put.1 "apply my glue to my $lefthandnoun" "^Roundtime"
		else gosub put.1 "%toolaction my $lefthandnoun with my $righthandnoun" "Roundtime:|%combined.msg"
	
	if "%tool" = "complete" then goto arrows.exit
	goto shaping.mainloop

startlumber:
	var itemmake %temp2
	var tool saw
	var toolaction cut
	var lumberlist stick|branch|limb|log
	
	goto shaping.mainloop
	
lumberloopexit:

	gosub put.1 "count lumber" "^You count"
	gosub emptyhands
	
	exit

startcarve:
	var chapter 9
	var page 26
	var tool serrated saw
	var itemmake stacks
	var toolaction carve
	var itemgoal crown
	
	gosub studybook
	
	goto shaping.mainloop
	

#### *** Creating arrowheads and shafts, will loop until lumber/part is gone *** ####

headshaft:
	if "%temp1" = "arrowhead" then 
	{
		var doshape arrowhead
		var tool hammer
	}
	if "%temp1" = "shafts" then 
	{
		var doshape shaft
		var tool shaper
		var temp2 lumber
	}
		
headshaft.loop:
	if "$righthandnoun" != "%tool" then gosub get my %tool
	if "$lefthandnoun" = "" then gosub get my %temp2
	if "$lefthandnoun" = "" then goto headshaftexit
	gosub put.1 "shape my %temp2 into %doshape" "^Roundtime"
	gosub stow left

	goto headshaft.loop

headshaftexit:

exit

studybook1:
	gosub get my shaping book
	gosub put.1 "turn my book to chapter %chapter" "^You turn|^The book is already"
	gosub put.1 "turn my book to page %page" "^You turn|^The book is already"
	gosub put.1 "study book" "^Roundtime"
	gosub emptyhands
return










include routinecommon.cmd