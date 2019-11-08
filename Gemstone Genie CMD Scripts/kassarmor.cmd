if matchre(toupper("%1"), ("ON|OFF")) then goto $0
else
{
echo
echo *** Usage:
echo **  .armor on - puts on all your set armor
echo **  .armor off - removes all your armor (run to set up with new armor)
echo
exit
}
OFF:
var dir rem|stow

match end ^You have nothing of that
matchre setup ^You are wearing (.*?)\.
put inv armor
matchwait

setup:
var armor $1
eval armor replace("%armor",", ", "|")
eval armor replace("%armor"," and ","|")
counter set 0
put #var armor %armor

match:
if "%armor(%c)" != "" then
{
if (matchre("%armor(%c)", ".*?(\w+$)")) then
  {
  var curitem $1
  send %dir(0) my %curitem
  send %dir(1) my %curitem
  pause 0.4
  counter add 1
  goto match
  }
}
else goto end
ON:
counter set 0
var armor $armor
var dir get|wear
goto match

end:
put #parse Armor done
exit