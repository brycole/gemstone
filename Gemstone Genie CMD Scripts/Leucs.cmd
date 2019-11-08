#Leucs

if $zoneid = 1 then
	{
	put #goto 172
	waitfor You have arrived
	put #goto 131
	waitfor You have arrived
	goto Search
	}
else
	{
	echo *** Must be in crossing to start ***
	exit
	}
Search:
match Search You find some signs
matchre Go You find .+? animal trail
matchre Go2 You find .+? bare spot
put search
matchwait 3
goto Search
Go:
move go trail
goto Search
Go2:
move go spot
move e
pause 4
move e
pause 4
move e
exit