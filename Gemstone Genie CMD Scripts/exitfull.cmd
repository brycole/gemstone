include base.cmd
put #script abort all except exitfull

#Log no matter who does this:
action remove ^\w+ begins to focus on you\!
action remove ^\w+ begins to focus on $charactername\!
action remove ^\w+ gestures at you\.
action remove ^\w+ begins to aim at you
action remove ^\w+ turns to face you\.
action remove ^\w+ appears to be aiming at you
action remove ^Something grabs your arm and drags you \w+ with it . . .
action remove ^Something grabs your arm and tries to drag you, but you resist and stand firm\.
action remove reaches over and holds your hand\.
action remove grabs your arm and tries to drag you, but you resist and stand firm\.
action remove grabs you and drags you .+ with (him|her)\.
action remove grabs your arm and drags you .+ with (him|her) \. \. \.
action remove report you

## log from enemies doing this
action remove %enemies steps out of the Moongate, which collapses immediately behind him.
action remove %enemies came through a \w+ Moongate\.
action remove ^%enemies reaches over and holds your hand\.
action remove ^%enemies grabs your arm and tries to drag you, but you resist and stand firm\.
action remove ^%enemies grabs you and drags you .+ with (him|her)\.
action remove ^%enemies grabs your arm and drags you .+ with (him|her) \. \. \.
action remove ^%enemies begins to advance on you\!
action remove ^%enemies closes to (pole weapon|melee) range on you\!
action remove ^%enemies begins to stealthily advance on you\!
action remove ^You notice %enemies as (he|she) stealthily closes to (pole weapon|melee) range on you\.
action remove ^You notice %enemies carefully watching you\.

echo *** Uh oh, fleeing until you're atk ***
#beep
#beep
gosub ss2.b
put say Danm...
delay 1
gosub move.random
if "$zoneid" = "40" then gosub move 128
gosub hide.b
put #echo >Log1 green *** Logging out exit.full***
put quit
put #script abort