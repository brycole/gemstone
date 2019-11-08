
### **** Necromancer healing *** ####


routinenecroheal:

var healzone 4

return

healcheck:

debuglevel 10
	action (healaction) on
	action (bleeder) on
	action (combat) on
	action (clean) on
	action (infection) on
	action (dormant) on
	action (paralysis) on
	
	action (healaction) var woundlist $1 when ^You have ((\b(?!no )\w+).+)$
	action (bleeder) var currentbleeder xxxx when ^Your wounds are infected
	#action (bleeder) var currentbleeder $2 hand when ^You have deep (slashes|cuts) across the (right|left) hand\.
	#action (bleeder) var currentbleeder left leg when a broken left leg with gaping holes
	action (clean) var clean 1 when ^You have a dormant infection
	action (paralysis) var paralysis 1 when (complete|severe) paralysis of the entire body
	
	##^XXXXYou have deep (slashes|cuts) across the (right|left) hand\.
	
	action (consume) var consumefail 1 when ^Lacking any injury
	action (consume) var doconsume 1 when ^Lacking any ritually
	
	action (infection) var infection 1 when ^Your wounds are infected
	action (dormant) put #var dormant.infection 1 when ^You have a dormant infection
	
	var trainweapon.var spear
	var clean 0
	var paralysis 0
	var totalclean 1
	var infection 0
	put #var dormant.infection 0
	var woundcount
	var woundlist NONE
	var woundloc right arm|right leg|right hand|right eye|left arm|left leg|left hand|left eye|head|neck|chest|back|abdomen|skin
	
	gosub put.1 "health" "^Your body"
	echo %woundlist
	if "%woundlist" = "NONE" then var clean 1
	gosub replacewound
	eval woundcount count("%woundlist", "|")
	math woundcount subtract 1
	echo %woundlist
	echo %woundcount
	if matchre("%woundlist(%woundcount)", "%currentbleeder") then math woundcount subtract 1
	if %woundcount <= 0 then var clean 1
	
	var cfprep 20
	var cfdelay 20
	var doconsume 1
	
	if %paralysis = 1 then
	{
		var clean 0
		var cfprep 12
		var cfdelay 12
		var woundlist |skin
		var woundcount 1
	}
		
	
	if ((%clean = 1) && (%infection = 1)) then
	{
		var clean 0
		var cfprep 12
		var cfdelay 12
		var woundlist |%woundloc
		eval woundcount count("%woundlist", "|")
		math woundcount subtract 1
	}
	
	if $dormant.infection = 1 then if matchre("%woundlist(%woundcount)", "(%woundloc)") then var clean 0
	if %clean = 1 then goto heal.done
	
	## *** Boar Clan
	##if (matchre("$roomid", "(220|221)")) && ("$zoneid" != "%healzone")) then
	if %NULL = 99 then
	{
		## ** Moving to young trolls in boar clan to heal
		if "$zoneid" = "127" then 
		{
			if matchre("$roomname", "Liirewsag River") then 
			{
				gosub move 146
				gosub move 100
			}
			gosub move 510
		}
		if "$zoneid" = "126" then gosub move 49
		if "$zoneid" = "116" then gosub move 3
		gosub move 217
		gosub release eotb
		var noinvis 1
		var noinvis 0		
		var firsthealroom 256
		var secondhealroom 247
	}
	## *** Boar Clan
	
	## ** Crossing
	gosub returnhome
	## ** Crossing
	
	
	gosub move %firsthealroom
	gosub checkplayer
	if %playerhere = 1 then gosub move %secondhealroom
	gosub checkplayer
	if %playerhere = 1 then goto runhide
	
healkillstart:
	gosub trainarmor wear
	if ("$preparedspell" != "Consume Flesh" && ($preparedspell != "None")) then gosub release
	if "%Rite" = "On" then gosub release roc
	if "$invisible" = "1" then gosub release eotb
	gosub emptyhands
	gosub dodge attack
	var totalclean 0
	
healkill.loop:
    if "%woundlist(%woundcount)" = "" then put #echo >log Red Error in necroheal. Should not be in healkill.loop with zero wounds. woundcount: %woundcount, woundlist: %woundlist
	if ("$preparedspell" != "Consume Flesh" && ($preparedspell != "None")) then gosub release
		else gosub preprequest "Consume Flesh" %cfprep %cfprep %cfdelay
	if $monstercount < 1 then 
	{
		delay 1
		if matchre("$roomobjs", "(which|that) (appears dead|\(dead\))") then goto healnow.loop
		goto healkill.loop
	}		
	gosub stamcheck
	gosub get spear
	if "$righthandnoun" = "spear" then gosub put.1 "lob" "%cman.msg"
	if "$lefthandnoun" = "spear" then gosub put.1 "lob left" "%cman.msg"
	var doconsume 1

healnow.loop:
	if matchre("$roomobjs", "(%ritualcritters) (which|that) (appears dead|\(dead\))") then 
	{
		var consumemob $1
		var consumewound
		if matchre("%woundlist(%woundcount)", "(%woundloc)") then var consumewound $1
		if "%consumewound" = "" then goto heal.done
		if ("$preparedspell" != "Consume Flesh" && ($preparedspell != "None")) then gosub release
			else gosub preprequest "Consume Flesh" %cfprep %cfprep %cfdelay
		if %doconsume = 1 then gosub put.1 "perform consume on %consumemob" "^Roundtime"
		var doconsume 0
		var consumefail 0
		gosub spelldelay
		if !matchre("$roomobjs", "(%ritualcritters) (which|that) (appears dead|\(dead\))") then goto healkill.loop
		gosub cast %consumewound
		math woundcount subtract 1
		if matchre("%woundlist(%woundcount)", "%currentbleeder") then math woundcount subtract 1
		if matchre("$roomobjs", "(which|that) (appears dead|\(dead\))") then 
		{
			if %consumefail = 1 then goto healnow.loop
			gosub search
			if !contains("$roomobjs", "(which|that) appears dead") then gosub deathwait
		}
		if %woundcount <= 0 then goto healcheck
		if $monstercount > 0 then gosub put.1 "face next" "^You turn|^There is nothing"
	}
	goto healkill.loop

deathwait:
	put #var last.death $gametime
deathwait.loop:
	delay 1
	if !contains("$roomobjs", "(which|that) appears dead") then goto deathwait.loop
return
	
	
heal.done:
	action (healaction) off
	action (bleeder) off
	action (combat) off
	action (clean) off
	action (infection) off
	action (dormant) off
	action (consume) off
	
	if %totalclean = 0 then 
	{
		var thrown.down 0
		gosub stow %trainweapon.var
	}
	var healswitch 1
	var healnow 0
	var globalexp %startexp
	
	if $bleeding = 1 then gosub put.1 "tend my %currentbleeder" "^Roundtime|^That area|^Doing your best|too injured for you to"	
	debuglevel 0
	
return
	
## ** Replace wound section
  
replacewound:
	var woundlist |%woundlist
	eval woundlist replace("%woundlist", "open and bleeding sores all over the skin", "skin|") 
    eval woundlist replace("%woundlist", "complete paralysis of the entire body", "skin|") 
    eval woundlist replace("%woundlist", "boils and sores around the skin", "skin|") 
    eval woundlist replace("%woundlist", "severe paralysis of the entire body", "skin|") 
    eval woundlist replace("%woundlist", "a painful, enflamed body rash", "skin|") 
    eval woundlist replace("%woundlist", "partial paralysis of the entire body", "skin|") 
	eval woundlist replace("%woundlist", "a body rash", "skin|") 
    eval woundlist replace("%woundlist", "difficulty controlling actions", "skin|") 
    eval woundlist replace("%woundlist", "a large skin rash", "skin|") 
    eval woundlist replace("%woundlist", "some severe twitching", "skin|") 
	eval woundlist replace("%woundlist", "some minor twitching", "skin|")  
	eval woundlist replace("%woundlist", "a small skin rash", "skin|") 
    eval woundlist replace("%woundlist", "severe skin loss exposing bone and internal organs", "skin|") 
    eval woundlist replace("%woundlist", "general numbness all over and have difficulty thinking", "skin|") 
    eval woundlist replace("%woundlist", "severely stiff and shriveled skin that seems to be peeling off the body", "skin|") 
    eval woundlist replace("%woundlist", "general numbness all over", "skin|") 
    eval woundlist replace("%woundlist", "some shriveled and oddly folded skin", "skin|") 
	eval woundlist replace("%woundlist", "severe skin discoloration", "skin|") 
    eval woundlist replace("%woundlist", "numbness in your fingers and toes", "skin|") 
    eval woundlist replace("%woundlist", "slight numbness", "skin|")) 
	eval woundlist replace("%woundlist","right arm","right arm|")
	eval woundlist replace("%woundlist","right leg","right leg|")
	eval woundlist replace("%woundlist","right hand","right hand|")
	eval woundlist replace("%woundlist","right eye","right eye|")
	eval woundlist replace("%woundlist","left eye","left eye|")
	eval woundlist replace("%woundlist","left arm","left arm|")
	eval woundlist replace("%woundlist","left leg","left leg|")
	eval woundlist replace("%woundlist","left hand","left hand|")
	eval woundlist replace("%woundlist","head","head|")
	eval woundlist replace("%woundlist","neck","neck|")
	eval woundlist replace("%woundlist","chest","chest|")
	eval woundlist replace("%woundlist","back","back|")
	eval woundlist replace("%woundlist","abdomen","abdomen|")
return