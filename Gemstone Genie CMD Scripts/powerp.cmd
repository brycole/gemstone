include base.cmd

if $heldMana > 0 then gosub release

#gosub ss2.b
#gosub spell.check

gosub splay
gosub spell aus 1 3 0 

start:
gosub perc xibar
gosub perc yavash
gosub perc katamba
gosub perc moonlight
gosub perc transduction
gosub perc psychic
gosub perc perception
gosub perc stellar
gosub perc planets
if "%1" != "stop" then
{
if !contains("$monsterlist", "a looming Shadow Servant") then
	{
		gosub m.input servant
		gosub perc servant
	}
else gosub perc servant
}

if %1 = stop then goto exit.powerp
if $Power_Perceive.LearningRate != 34 then goto start
else goto exit.powerp
	
perc:
if $Power_Perceive.LearningRate = 34 then return
gosub put.1 "perc $1" "^Roundtime|^I could not find who"
return

exit.powerp:
if "%1" != "stop" then gosub put.1 "release servant" "^A looming|^You don't"
echo Power perception training done.
put #parse powerp.cmd done.
