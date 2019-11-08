# Login script

delay 5
put info
delay 5
put exp all
delay 5

if $invisible = 1 then 
{
	if "$guild" = "Necromancer" then put release eotb
	if "$guild" = "moon" then put release rf
	delay 2
}
put sort auto head
put look $charactername
delay 2
if "$charactername" = "Stoh" then
	{
		#send .stohlore
	}
if "$charactername" = "Corav" then
	{
		send .coravtrain
	}
if "$charactername" = "Vayek" then
	{
		send .vayektrain
	}
	
