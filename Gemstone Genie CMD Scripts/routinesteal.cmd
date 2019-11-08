routinesteal:

	action setvar end.shop 1 when but at the last minute you realize that you are being watched
	action setvar end.shop 1 when begins to shout loudly for help.|begins to shout for help.
	action servar end.shop 1 when They are placed in a sack
	action put #log >SkillLog $time;put #log >SkillLog $lastcommand;put #log >SkillLog $Stealing.Ranks stealing ranks.;put #echo >log Orange *** Not learning from $lastcommand in $roomname @ $Stealing.Ranks ranks when ^You don't feel you learned anything
	action put #echo >log Red You were caught in $roomname stealing a: $lastcommand when notices you attempting|Guards\! Guards\!|begins to shout
	action var jailnow 1 when ^The door slams shut|^The guard brings you to the jail|^You slowly wake up|^Before you really realize
	action var pillory 1 when ^Your ankles and wrists are quickly fit into stocks,
	
	var sellpawn.msg shakes his head|looks around|After pausing for a moment, he hands you|briefly glances
	var jailnow 0
	var pawn 0
	
return

steal:
	if $invisible = 0 then
	{
		if "$guild" = "Necromancer" then gosub eotb 20 20
		if "$guild" = "moon" then gosub rfwalk 10 0
	}
	setvariable stealcount 0
steal2:
	if %end.shop = 1 then
	{
		setvar end.shop 0
		gosub stash
		return
	}
	if %stealcount < $2 then
	{
		if $hidden = 0 then
		{
			if $roomid != 218 then gosub put.1 "hide" "%hide.msg"
		}
		math stealcount add 1
		gosub put.1 "steal $1" "^Roundtime:|^You can't|^You haven't"
		if (("$righthand" !=  "Empty") && ("$lefthand" != "Empty")) then gosub stash
		goto steal2
	}
		else gosub stash
return
		
stealcheck:
	if %stealexit = 1 then
	{
		evalmath stealtemp (%stealexit.timer - $last.steal)
		var stealexit 0
	}
		else evalmath stealtemp ($gametime - $last.steal)
	evalmath stealtemp (%stealtemp / 60)
	evalmath stealtemp round(%stealtemp, 2)
	evalmath stealecho (60 - %stealtemp)
	echo %stealecho minutes until steal timer is up.
	if %stealtemp < 60 then return
	gosub returnhome
	var resonance stealing
	## ** Spell up room
	gosub emptyhands
	gosub release
	if "$charactername" = "Raelok" then
	{
		gosub move 4
		gosub checkplayer
		if %playerhere = 1 then gosub move 4
		gosub trainarmor.remove
		gosub castbuff Obfuscation 13 13 20
		gosub spelldelay
		## ** Start stealing
		## ** West gate crossing
		gosub move 14
		put #var last.steal $gametime
		put #script steal
		put #script pause raeloktrain
		gosub trainarmor.wear
		#gosub spellstance 100 130 70
		## ** End Keldus
	}
	if "$charactername" = "Stoh" then
	{
		gosub move 232
		if "%Shadows" = "off" then 
		{	
			gosub shadows
		}
		## ** Start stealing
		put #var last.steal $gametime
		gosub stealaesry.now
		## ** End Stoh
	}
	if "$charactername" = "Vayek" then
	{
		gosub move 229
		gosub heavy.remove
		## ** Start stealing
		## ** West gate entrance to town
		##** Cross west gate gosub move 14
		put #var last.steal $gametime
		gosub stealaesry.now
		gosub heavy.wear
		## ** End Vayek
	}
	if %pawn = 1 then gosub pawnshop
	gosub returnhome
	var resonance
return

stash:
	if %jailnow = 1 then gosub jailnow
	if %pawn = 1 then
	{
	if "$lefthand" != "Empty" then
	{
	if matchre("$pawnlist", "$lefthand") then gosub put.1 "put $lefthandnoun in my shoulder sack" "%stow.msg"
		else 
		{
			if !matchre("$nopawnlist", "$lefthand") then
			{
				if !matchre("$temppawnlist", "$lefthand") then
				{
					if "$lefthand" != "Empty" then
					{
						var templist $temppawnlist
						var templist %templist$lefthand|
						put #var temppawnlist %templist
						gosub put.1 "put $lefthandnoun in my shoulder sack" "%stow.msg"
					}
				}
			}
		}
	}
	if "$righthand" != "Empty" then
	{
	if matchre("$pawnlist", "$righthand") then gosub put.1 "put $righthandnoun in my shoulder sack" "%stow.msg"
		else 
		{
			if !matchre("$nopawnlist", "$righthand") then
			{
				if !matchre("$temppawnlist", "$righthand") then
				{
					if "$righthand" != "Empty" then
					{
						var templist $temppawnlist
						var templist %templist$righthand|
						put #var temppawnlist %templist
						gosub put.1 "put $righthandnoun in my shoulder sack" "%stow.msg"					
					}
				}
			}
		}
	}
	}
	if "$righthand" != "Empty" then gosub put.1 "empty right" "^You drop|^Whoah"
	if "$righthand" != "Empty" then gosub put.1 "lower my $righthandnoun" "^You drop|lower"
	if "$lefthand" != "Empty" then gosub put.1 "empty left" "^You drop|^Whoah"
	if "$lefthand" != "Empty" then gosub put.1 "lower my $lefthandnoun" "^You drop|lower"
return

pawnshop:
	gosub goto pawn
	var cc 0
	gosub release

sell.temppawn:
	echo $temppawnlist
	echo $temppawnlist(%cc) in temp list.
	if "$temppawnlist(%cc)" = "" then goto temppawndone
	if matchre("$temppawnlist(%cc)", "(\w+)$") then var tempget $0
	gosub put.1 "get %tempget from my shoulder sack" "%get.msg"
	gosub reveal
	gosub put.1 "sell my $righthandnoun" "%sellpawn.msg"
	if "$righthand" != "Empty" then
		{
			var templist $nopawnlist
			var templist %templist$righthand|
			put #var nopawnlist %templist
			if "$righthand" != "Empty" then gosub put.1 "empty right" "^You drop|^Whoah"
			if "$righthand" != "Empty" then gosub put.1 "lower my $righthandnoun" "^You drop|lower"
		}
	else if !matchre("$pawnlist", "$temppawnlist(%cc)") then
		{
			var templist $pawnlist
			var templist %templist$temppawnlist(%cc)|
			put #var pawnlist %templist
		}	
	math cc add 1
	goto sell.temppawn

temppawndone:
	put #var temppawnlist ""

sellallpawn:
	action var contents $1 when ^In the .* you see (.+)\.$
	action var contents $1 when ^You rummage .* and see (.+)\.$

sell.setup:
	var contents
	gosub put.1 "l in my shoulder sack" "^In the|^There is nothing"
	eval contents replace("%contents",", ", "|")
	eval contents replace("%contents"," and ","|")
	eval item.max count("%contents", "|")
	echo %item.max items max.
	var ii 0
	action remove ^In the .* you see (.+)\.$
	action remove ^You rummage .* and see (.+)\.$
	if %item.max = 0 then goto sell.pawn.done

sell.pawn:
	if "%contents(%ii)" = "" then goto sell.pawn.done
	if matchre("%contents(%ii)@", (".+ (\w+)@") then var sellpawn $1
	gosub reveal
	gosub get my %sellpawn from my shoulder sack
	if "$righthandnoun" = "sigilbook" then gosub stow sigil
	gosub put.1 "sell my $righthandnoun" "%sellpawn.msg"
	if matchre("$pawnlist", "$righthand") then gosub put.1 "empty right" "^You drop|^Whoah"
		else if "$righthand" != "Empty" then gosub stow right
	if matchre("$pawnlist", "$righthand") then gosub put.1 "lower my $righthandnoun" "^You drop|lower"
		else if "$righthand" != "Empty" then gosub stow right
	math ii add 1
	goto sell.pawn

sell.pawn.done:
return

jailnow:
	put #script abort automapper
	var resonance stealing
	var monitor no
	var sackempty 0
	var jailnow 0
	var pillory 0
	action var sackempty 1 when ^There is nothing in
	gosub release
	waitfor PLEAD INNOCENT
	gosub put.1 "plead guilty" "^You raise your voice"
	delay 10
	if %pillory = 1 then waitfor ^You accept a sack
	gosub put.1 "open my small sack" "^You open"
	gosub reveal
	gosub put.1 "look in small sack" "There is nothing"
	if %sackempty = 1 then gosub put.1 "drop small sack" "^You drop"
		else gosub emptyhands
	action remove when ^There is nothing in
	return

include stealcrossing.cmd
include stealratha.cmd
include stealaesry.cmd
include stealshard.cmd