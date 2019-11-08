#Crossing Favors
debuglevel 10
if %1 != orb && %1 != temple then goto usage
var orb 173|16|21
if $zoneid = 3 then var temple 2|15|43|440
else if ($zoneid = 4) then var temple 15|43|440
else if ($zoneid = 1) then var temple 476|44
else if ($zoneid != 1 && $zoneid != 3 && $zoneid != 4) then goto Usage
var curdest 0
gosub travel %1
echo *** You have arrived ***
exit

travel:
if %$1(%curdest) = 476 then
	{
	match needorb What were you
	put get my orb
	matchwait 1
	}
send #goto %$1(%curdest)
waitfor You have arrived
if %$1(%curdest) = 21 || %$1(%curdest) = 476 then return
math curdest add 1
goto travel

needorb:
echo
echo *** You need an orb, traveling there after 5 second pause
echo
pause 5
send .to temple

Usage:
echo
echo *** From anywhere within Crossing, type .favors orb
echo *** OR from in Crossing or out West gate, type .favors temple
echo
exit

