instrumentall:
	action var do.tune flat when sharp\.$
	action var do.tune sharp when flat\.$

	var str lyre
	var per zill
	var win txistu

	var do.tune

	gosub put.2 "rem cowl" "stow cowl" "^You put|^Remove|^Stow"
	gosub put.2 "rem glo" "stow glo" "^You put|^Remove|^Stow"

	gosub put.1 "stop play" ".+"
	
	gosub put.1 "get my %str" "^You get|^You are already"
#gosub put.1 "get my kit" "^You get"
#gosub put.1 "repair my harp" "^Your|Roundtime"
#gosub put.1 "stow kit" "^You put"
	gosub tune

	gosub playtrain strings
	gosub put.1 "stow %str" "^You put|^Stow"

	gosub put.1 "get my %win" "^You get|^You already"
	gosub playtrain winds
	gosub put.1 "stow my %win" "^You put|^Stow"

	gosub put.1 "get my %per" "^You get|^You already"
	gosub playtrain percussions
	gosub put.1 "stow my %per" "^You put|^Stow"

	gosub put.1 "stop play" "^You stop|^But|^In the name"
#put sing mere

	gosub put.2 "get cow" "wear cowl" "^You put"
	gosub put.2 "get glo" "wear glo" "^You slip"

	gosub put.1  "mana song 1" "^All"

tune:
	matchre tune %retry.command.triggers
	matchre return you realize that it is in tune\.$|perfect tune\.$
	match tune Roundtime:
	put tune %str %do.tune
	matchwait
