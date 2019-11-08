
	var rtgood ^Roundtime:|^\[Roundtime|^Cast Roundtime
	var rtwait ^\.\.\.wait|^Wait|^You don't seem to be able to move to do that|^You struggle against the shadowy webs to no avail\.|^Sorry, system is slow|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!
	
	action var getgem $1 when ^In the steel belt you see a .+? (\S+),
	
	var getbelt haver
	var putbelt bag
	var pouchcolor green

## 8/23 --12:45am
## 9/03 --12:35am
## 9/11 -- 12:33am
## 9/21 -- 11:30pm
## 10/3 -- 2:00am
## 10/11 -- 3:30am
## 10/20 -- 10:30am
## 11/5 -- 11:27pm
## 11/22 -- 4:13pm

	loop:
	
	gosub put.1 "get steel belt from %getbelt" "^You get|^What|^You need"
	gosub put.1 "close belt" "^You close|^You cant|^That is"
	if "$righthand" = "Empty" then goto exit
	gosub put.2 "rub belt" "open belt" "^Your fingers tingle|^You rub"
	gosub put.1 "l in belt" "^In the|^There is nothing"
	gosub put.2 "get %getgem from steel belt" "put %getgem in cloth sack" "You put"
	gosub put.2 "fill %pouchcolor pouch with belt" "close belt" "^You close"
	gosub put.1 "put belt in %putbelt" "^You put"
	goto loop

exit:
exit















put.1:
	var firstcommand $1
	var waitstring $2
	match clear
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "$monitor" != "no" then if %keywords > 3 then goto GMcheckmain
putting.1:
	matchre pause.putting.1 %rtwait
	matchre roundtimedone %waitstring
	matchre spellresearch.1 ^Are you sure you want to do
	put %firstcommand
	echo %firstcommand
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
	goto roundtimedone
pause.putting.1:
	pause .2
	goto putting.1
spellresearch.1:
	pause .2
	put research stop
goto putting.1


put.2:
	var firstcommand $1
	var secondcommand $2
	var waitstring $3
	match clear
	if "%resonance" = "roomrecovery" then if %keywords > 0 then var keywords 0
	if "$monitor" != "no" then if %keywords > 3 then goto GMcheckmain
putting.2:	
	matchre pause.putting.2 %rtwait
	matchre roundtimedone %waitstring
	matchre spellresearch.2 ^Are you sure you want to do
	put %firstcommand
	echo %firstcommand
	put %secondcommand
	echo %secondcommand
	matchwait 7
	put #log >SkillLog $time
	put #log >SkillLog $lastcommand command caused matchwait to time out.
	goto roundtimedone
pause.putting.2:
	pause .2
	goto putting.2
spellresearch.2:
	pause .2
	put research stop
goto putting.2

roundtimedone:

return