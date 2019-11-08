include base.cmd
action setvar regen 1 when ^You strain,
action setvar regen 1 when You are unable to harness


gosub put.1 "stop play" "^You stop|^But you're"
gosub put.1 "remove meda" "^You remove|^You aren't"

magicloop:
if $Magical_Devices.LearningRate < 34 then
}
	gosub put.1 "prep maf" "^You trace"
	gosub put.1 "charge meda 8" "^Roundtime:"
	waitforre ^You feel fully attuned
	gosub put.1 "charge meda 8" "^Roundtime:"
	gosub put.1 "focus meda" "^Roundtime:"
	waitforre ^You feel fully attuned
	gosub put.1 "cast" "^You gesture\."
	##if $Power_Perceive.LearningRate < 34 then gosub put.1 "power" "^Roundtime"
	waitforre ^You feel fully attuned
	goto magicloop
}
else goto done
regen:
goto regenloop


regenloop:
echo Regening. $mana percent mana.
if $mana < 95 then 
{
delay 10
goto regenloop
}
else goto magicloop


done:
gosub put.1 "wear meda" "^You hang"
gosub put.1 "sing mere" "^With a"
put #parse bardmagic.cmd done.