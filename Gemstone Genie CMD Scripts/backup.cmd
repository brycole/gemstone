match move.room Also here
match cont Obvious
put look
matchwait 5
move.room:
gosub move 4
delay 2
match move.room1 Also here
match cont Obvious
put look
matchwait 5
move.room1:
gosub move 5
delay 2
match move.room2 Also here
match cont Obvious
put look
matchwait 5
move.room2:
gosub move 6
delay 2
match move.room3 Also here
match cont Obvious
put look
matchwait 5
move.room3:
gosub move 7
delay 2
match quit Also here
match cont Obvious
put look
matchwait 5


gosub dodge attack
skin.train:
	gosub spawncheck
	gosub ppcheck
	if $monstercount < 1 then gosub pause 15
	if $Light_Thrown.LearningRate > 35 then
		{
			if $Offhand_Weapon.LearningRate > 35 then goto skinexit
			if "$righthandnoun" = "rock" then
				{
					gosub put.1 "swap" ".+"
					gosub get my %parryweapon
					gosub parry attack
				}
		}
		elseif $Skinning.LearningRate > %globalexp then goto skinexit
	if $monstercount > 0 then 
		{
			if "$righthandnoun" = "rock" then gosub throw
			if "$lefthandnoun" = "rock" then gosub throw left
		}
	if (("$righthandnoun" != "rock") && ("$lefthandnoun" != "rock")) then gosub get rock
	if %death = 1 then gosub skinarray
	goto skin.train
skinexit:
	gosub dodge
	gosub emptyhands
	gosub throwcheck