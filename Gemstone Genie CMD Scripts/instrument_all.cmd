include base.cmd

action var do.tune flat when sharp\.$
action var do.tune sharp when flat\.$

var do.tune

gosub put.2 "rem bala" "stow bala" "^You put|^Remove|^Stow"
##gosub put.2 "rem gaunt" "stow gaunt" "^You put"
gosub put.2 "rem glo" "stow glo" "^You put|^Remove|^Stow"

put stop play
gosub put.1 "get my harp" "^You get|^You are already"
gosub put.1 "get my kit" "^You get"
gosub put.1 "repair my harp" "^Your|Roundtime"
gosub put.1 "stow kit" "^You put"
gosub tune

gosub ss playtrain strings
gosub put.1 "stow harp" "^You put|^Stow"

gosub put.1 "get my jug" "^You get|^You already"
gosub ss playtrain winds
gosub put.1 "stow my jug" "^You put|^Stow"

gosub put.1 "get my stick" "^You get|^You already"
gosub ss playtrain percussions
gosub put.1 "stow my stick" "^You put|^Stow"

gosub put.1 "stop play" "^You stop|^But|^In the name"
#put sing mere
gosub ss armor on
put mana song 1
put #parse instrument_all.cmd done.
exit 

tune:
matchre tune %retry.command.triggers
matchre return you realize that it is in tune\.$|perfect tune\.$
match tune Roundtime:
put tune harp %do.tune
matchwait
