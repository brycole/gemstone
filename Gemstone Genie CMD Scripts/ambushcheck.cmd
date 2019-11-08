debuglevel 10
include base.cmd

action goto ambush when leaps from hiding and ambushes|reveals|comes out of hiding|just came out of hiding.|snipes|loads|appears to be aiming
action goto ambush when says,|explains|whispers,|You hear the voice of|^You hear a|asks

delay 50
goto exit2

ambush:
action remove leaps from hiding and ambushes|reveals|comes out of hiding|just came out of hiding.|snipes|loads|appears to be aiming
action remove says,|explains|whispers,|You hear the voice of|^You hear a|asks
if $csript = ht then stow hammer
if $csript = lt then stow mall
put #script abort combat
delay .5
random:

send .combat $cscript
put #var move.random 1
exit1:
put #script resume afkhunt
send .ambushcheck
exit
exit2:
exit