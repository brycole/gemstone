##debuglevel 10
goto bundle.exit
## ** Improved bundler by Kurav 7/5/2009


dobundle:

	action (combat) put #var newbundle 1 when ^Time to start a new bundle|^You try to stuff your
	var wear 1
	
	if $newbundle = 1 then gosub makebundle
			
return
	
makebundle:
	if "$lefthand" = "Empty" then return
	put #var newbundle 0
	if "$righthand" != "Empty" then gosub stow right
	gosub put.1 "get my bund rope" "^You get"
    gosub put.1 "bundle" "^You bundle"
	gosub put.1 "tie lump bund" "^Once|^Tightening the|^Tie|^Using"
	gosub put.1 "tie lump bund" "^Once|^Tightening the|^Tie|^Using"
	gosub put.1 "wear bund" "%wear.msg"
return

bundle.exit.full:
	put #var bundle 0
	echo Bundles are full!
return

## ** Start of sell function
sellbundle:
	if $newbundle = 1 then return
	var resonance stealing
	action var nobundle 1 when ^Remove what
	
	var nobundle 0
	
	if "$guild" = "Necromancer" then gosub eotb snap

## ** Tanner location by zoneid
	if "$zoneid" = "1" then gosub move 220
	if "$zoneid" = "90" then gosub move 275
	if "$zoneid" = "99" then gosub move 18
	if "$zoneid" = "66" then gosub move 234
	if "$zoneid" = "40" then gosub move 234
	if "$zoneid" = "42" then gosub move 181
	if "$zoneid" = "61" then gosub move 163
	if "$zoneid" = "127" then gosub move 49
	if "$zoneid" = "116" then gosub move 218
		
bund.sell:
	gosub reveal
	gosub put.2 "remove bund" "sell bund" "^You ask|^Sell what"
	gosub stow bund rope
	if %nobundle = 0 then goto bund.sell

end.sell:
	put #var newbundle 1
	
	action remove ^Remove what

	#if "$guild" = "Necromancer" then return
	if "$zoneid" = 127 then return

return	

bankrun:	
## ** Bank exchange location by zoneid
	if "$zoneid" = 1 then 
	{
		if "$guild" = "Cleric" then 
		{
			gosub move 43
			gosub put.1 "drop 5 silver kronars in almsbox" "^You drop|^But you do not"
		}
		gosub move 232
	}
	
	if "$zoneid" = "99" then gosub move 114
	if "$zoneid" = "61" then gosub move 140
	if "$zoneid" = "42" then gosub move 174
	if "$zoneid" = "116" then gosub move 205
		
bankexchange:
	gosub reveal
	if "$zoneid" = "116" then
	{
		gosub put.1 "exchange all kronars for dokoras"
		gosub put.1 "exchange all lirums for dokoras"
	}
	if matchre("$zoneid", "42") then
	{
		gosub put.1 "exchange all kronars for lirums"
		gosub put.1 "exchange all dokoras for lirums"
	}

	
## ** Bank teller location by zoneid
	if "$zoneid" = 116 then gosub move 204
	if "$zoneid" = 99 then gosub move 113
	if "$zoneid" = 61 then gosub move 139
	if "$zoneid" = "42" then gosub move 173
	if "$zoneid" = 1 then
	{
		gosub walk out
		gosub walk go window
	}

	gosub reveal
	gosub put.1 "info" "^Wealth"
	gosub put.1 "check balance" "^The clerk pages"
	gosub put.1 "deposit all" "^The clerk slides|^You don't"
	gosub put.1 "check balance" "^The clerk pages"
	gosub put.1 "withdraw 30 silver" "^The clerk"
	var resonance
	
return

bundle.exit:
