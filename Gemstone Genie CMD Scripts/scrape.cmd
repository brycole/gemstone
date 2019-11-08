SetVar:
setvariable fish crep
setvariable fish_c 0

Actions:
action goto eatfish when (That really isn't going to help anything.|You'll need a hide, pelt, or skin to scrape.)
action goto getfish when (That was the last of it!|That was the last of it.)
action goto findfish when What were you referring to

put get my scraper

getfish:
if (%2 != "") then put get my %1
else put get my %fish

scrape:
if ($Skinning.LearningRate != 12) then {
pause
if (%2 != "") then put scrape %1 with scraper %2
else put scrape %fish with scraper %1
match scrape Roundtime
match eatfish has been completely cleaned. 
matchwait 1
}
else goto exit

pause:
delay 50

eatfish:
if (%2 != "") then put put my %1 in $garbage
else put eat my %fish
match eatfish You take
matchre getfish put|drop
matchwait

findfish:
if_2 then shift
echo %fish_c
if (%fish_c = 0) then 
{
setvariable fish musk
setvariable fish_c 1
goto getfish
}
if (%fish_c = 1) then {
setvariable fish grek
setvariable fish_c 2
goto getfish
}
if (%fish_c = 2) then
{
setvariable fish nomlas
setvariable fish_c 3
goto getfish
}
echo %fish
echo No fish left!
put stow my scraper

exit:
echo Scraping done.
exit