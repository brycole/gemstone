routineclericbuffs:
	action var Major on when ^A bright silver nimbus roars up
	action var Major off when ^The field of silver-blue light
	action var Minor on when ^You are bathed in a soft
	action var Minor off when ^The soft silver glow fades
	action var Shield on when ^A fiery blaze covers
	action var Shield off when ^Your latent Shield
	action var Sanctify on when ^A brilliant .+ halo appears
	action var Sanctify off when ^Your nerves buzz
	action var Centering on when ^An odd tingling sensation spreads
	action var Centering off when ^The tingling sensation leaves
	action var Benediction on when ^Suddenly your muscles flood|^You suddenly feel more limber
	action var Benediction off when ^You feel the divinity seep
	action var Protection on when ^You are bathed in a 
	action var Protection off when ^The soft white glow fades
	action var Auspice on when ^Your spirit sings with a
	action var Auspice off when ^Your spirit grows colder
	action var Ghost on when ^A swirling grey fog
	action var Ghost off when ^The swirling fog dissipates
	action var Malediction on when ^Tendrils of malevolent darkness
	action var Malediction off when ^The swirling confines
	action var Soul on when ^Your magic hooks|^Slippery as an eel
	action var Soul off when ^A shroud of vapor rises|^The spiritual weight
	action var Divine off when ^The searing lights fade|^The glowing aura fades
	action var Divine on when ^The ray strikes|^A glowing aura surrounds
	action var Hydra on when ^Swirls of malefic darkness gather in a wide matrix
	action var Hydra off when ^The deadening murk around you subsides.


	
	## ** Non-cleric spells
	action var Righteous on when ^Your blood begins|^The spell pulses through
	action var Righteous off when ^You feel your righteous rage
	
	action var communeshort on when ^You whisper a prayer|^You will not be able to open another|^You grind some dirt in your fist|^You feel warmth spread throughout
	action var communeshort off when ^You feel fully prepared to seek assistance
	action var $1 on when ^You sense the (\S+)
	
	#action put #echo >log Green Ritual success. $lastcommand when ^You feel that your gods have smiled upon you
	#action put #echo >log Red Ritual failed. $lastcommand when ^You get a sense that you have completed this ritual
	
## ** Cleric Keywords

	action var keywords 0 when ^You feel that your gods have smiled upon you
	action var keywords 0 when ^Aligning your thoughts with the song

	

## ** Communes	
	action var Eluned on when ^You feel the power
	action var Eluned off when ^The faint holy aura fades
	
	action math keywords subtract 1 when ^You whisper the final word of your spell

	var Malediction off
	var Soul off

	#var Warding Manifest Force|10|10|21|Warding
	var Warding Sanyu Lyba|20|45|9|Warding
	var Augmentation Sanctify Pattern|15|22|21|Augmentation
	var Utility Divine Radiance|15|22|21|Utility
	var Debilitation Soul Sickness|5|5|10|Debilitation
	#var Debilitation Phelim's Sanction|10|10|5|Debilitation
	var Sorcery Clear Vision|12|12|21|Sorcery
	
	## ** 2% - spell prep, 3% - total spell cast, 4% - wait time until spell, 5% - type of spell
	## ** These spells are using the chaos symbiosis
	
	var training_spell_list Sanctify Pattern|Divine Radiance|Clear Vision
	
	var targetspells Fists of Faenella|Telekinetic Throw|Fire of Ushnish
	var debilspells Soul Sickness
	var areaspells Fire of Ushnish
	var DO_spell_list Aura Sight|Clear Vision|Telekinetic Throw|Mental Focus
	var sorc_list Aura Sight|Clear Vision|Telekinetic Throw|Mental Focus
	
	var cambarray camb arm|king arm|wristband
	var arrayloc 0
	var nodirt 0
	var chaos 1
	
clericspelloff:
	
	var Eluned off
	var Major off
	var Minor off
	var Shield off
	var Sanctify off
	var Centering off
	var Benediction off
	var Protection off
	var Auspice off
	var Ghost off
	var Righteous off
	var Hydra off
	
	var communeshort off
	gosub magicspelloff
	
return

buffcheck:
	#if %spelluproom = 1 then 
	#{
	#	var docharge 10
		if "$guild" = "Cleric" then gosub pomcast
	#}
	if $spelltime > 27 then gosub castrequest
	if "%Manifest" = "off" then 
	{	
		gosub castbuff "Manifest Force" 15 15 4
		#if $monstercount > %maxcreature then gosub castbuff "Manifest Force" 10 10 6
			#else gosub castbuff "Manifest Force" 10 30 21
	}
	#if "%Sanctify" = "off" then gosub castbuff "Sanctify Pattern" 10 60 20
	if "%Major" = "off" then gosub castbuff "Major Physical Protection" 20 70 28
	if "%Minor" = "off" then gosub castbuff "Minor Physical Protection" 20 70 28
	if "%Protection" = "off" then gosub castbuff "Protection from Evil" 20 70 28
	if "%Centering" = "off" then gosub castbuff "Centering" 20 70 21
	#if "%Auspice" = "off" then gosub castbuff "Auspice" 10 55 20	
	if "%Shield" = "off" then gosub castbuff "Shield of Light" 20 60 21
	if "%Benediction" = "off" then gosub castbuff "Benediction" 20 60 21
	#if "%Righteous" = "off" then gosub castbuff "Righteous Wrath" 10 55 20
	#if %Ease = off then gosub castbuff Ease 10 20
	var docharge %start.docharge
	if (("$righthandnoun" = "%camb") || ("$lefthandnoun" = "%camb") && ("%camb" != "orb")) then gosub put.1 "wear %camb" "%wear.msg"
return


gauge:
	gosub castbuff "Gauge Flow" 10 40 21
	gosub spelldelay
	if (("$lefthandnoun" = "orb") || ("$righthandnoun" = "orb")) then gosub stow orb
	if (("$righthandnoun" = "%camb") || ("$lefthandnoun" = "%camb") && ("%camb" != "orb")) then gosub put.1 "wear %camb" "%wear.msg"
return

communecheck:
	if $Theurgy.LearningRate > 28 then return
	if "%resonance" = "moving" then return
	gosub eluned_commune
	gosub tamsine_commune
	#gosub kertigen_commune	
return

eluned_commune:
	if "%playsong" = "on" then return
	if %nodirt = 1 then return
	evalmath elunedtemp ($gametime - $last.eluned)
	if %elunedtemp < 1200 then return
	if "%communeshort" = "on" then return
	if (("$righthand" != "Empty") && ("$lefthand" != "Empty")) then return
	var clericswitch 1
	gosub put.1 "push vial" "^You push the"
	if (("$righthandnoun" != "dirt") && ("$lefthandnoun" != "dirt")) then 
	{
		var nodirt 1
		var clericswitch 0
		return
	}
	put #var last.eluned $gametime
	gosub put.1 "commune eluned" "^You grind|^You feel like|^You stop as you"
	if (("$righthandnoun" = "dirt") || ("$lefthandnoun" = "dirt")) then gosub stow dirt in my vial
	var clericswitch 0
return

tamsine_commune:
	if "%playsong" = "on" then return
	evalmath tamsinetemp ($gametime - $last.tamsine)
	if %tamsinetemp < 1200 then return
	if "%communeshort" = "on" then return
	if (("$righthand" != "Empty") && ("$lefthand" != "Empty")) then return
	put #var last.tamsine $gametime
	var clericswitch 1
	gosub put.2 "get my bottle" "sprinkle bottle on Kaislan" "^You sprinkle"
	gosub put.1 "commune tamsine" "^You feel warmth|^You feel like|^You stop as you"
	gosub stow bottle
	var clericswitch 0
return

kertigen_commune:
	evalmath kertigentemp ($gametime - $last.kertigen)
	if %kertigentemp < 1200 then return
	put #var last.kertigen $gametime
	gosub emptyhands
	gosub put.1 "get my holy oil" "^You get|^What were"
	if "$righthand" != "holy oil" then return
	gosub put.1 "get my arrows" "^You get|^What were"
	var returnarrows $roomid
	if "$lefthandnoun" != "arrows" then gosub m.inputuyarrows
	gosub put.1 "sprinkle oil on arrows" "^You sprinkle"
	gosub put.1 "commune kertigen" "^You whisper a|^You feel like|^You stop as you"
	gosub stow oil
	gosub put.1 "drop arrow" "^You drop"
return

foragedirt:
	var getdirt 1
	var kickdirt 0
	action (foragedirt) var kickdirt 1 when ^There doesn't seem to be anything left in the pile
	action (foragedirt) on
collectdirt:
	if !matchre("$roomobjs", "(pile of dirt|some dirt)") then gosub put.1 "collect dirt" "^Roundtime"
dirtloop:
	if %kickdirt = 1 then 
	{
		gosub put.1 "kick dirt" "^You take"
		var kickdirt 0
		goto collectdirt
	}
	if matchre("$roomobjs", "(pile of dirt|some dirt)") then gosub stow dirt in my vial
	if (matchre("$roomobjs", "(pile of dirt|some dirt)") && ("$righthandnoun" != "dirt") && ("$lefthandnoun" != "dirt")) then gosub stow dirt in my vial
	if (("$righthandnoun" = "dirt") || ("$lefthandnoun" = "dirt")) then goto dirtexit
	if matchre("$roomobjs", "(pile of dirt|some dirt)") then goto dirtloop
		else goto collectdirt
dirtexit:
	action (foragedirt) off
	gosub walkdump
	gosub emptyhands
	var getdirt 0
	var nodirt 0
return
	
ritualcheck:
	gosub put.1 "kneel" "^You kneel"
	gosub put.1 "kiss altar" "^You bend"
return

## ***  COMMUNES *** ##

Eluned:
	if "%Eluned" = "INCENSE" then return
	if "%playsong" = "on" then return
	gosub emptyhands
	gosub get incense
	if "$righthandnoun" != "incense" then
	{
		var Eluned INCENSE
		return
	}
	gosub put.1 "drop incense" "^You drop"
	gosub put.2 "get knife" "get flint" "^You get a piece"
	gosub put.1 "light incense with flint" "^Roundtime"
	gosub emptyhands
	gosub get incense
	gosub put.2 "wave incense at Vayek" "commune" "^You feel|^You stop"
	gosub put.1 "snuff incense" "^You snuff"
	gosub emptyhands
return

bless:
	var weaponblessed 1
	gosub put.1 "wield star" "%wield.msg"
	gosub release
	gosub prep bless 10
	delay 14
	gosub put.1 "harness 5" "^Roundtime"
	gosub put.1 "harness 5" "^Roundtime"
	gosub cast my star
	gosub stow star
return

clerictrain:
	gosub ppcheck
	if $spelltime > 27 then gosub castrequest
	gosub sortskill Warding|Utility|Augmentation|Sorcery 4
	
		
	gosub castbuff "%Augmentation(0)" %Augmentation(1) %Augmentation(2) %Augmentation(3)
	if $monstercount < 1 then gosub castbuff "%Augmentation(0)" %Augmentation(1) %Augmentation(2) %Augmentation(3)
	gosub castbuff "%Utility(0)" %Utility(1) %Utility(2) %Utility(3)
	if $monstercount < 1 then gosub castbuff "%Utility(0)" %Utility(1) %Utility(2) %Utility(3)
	gosub castbuff "%Sorcery(0)" %Sorcery(1) %Sorcery(2) %Sorcery(3)
	if $monstercount < 1 then gosub castbuff "%Sorcery(0)" %Sorcery(1) %Sorcery(2) %Sorcery(3)
	gosub castbuff "%Warding(0)" %Warding(1) %Warding(2) %Warding(3)
	if $monstercount < 1 then gosub castbuff "%Warding(0)" %Warding(1) %Warding(2) %Warding(3)
	
	if (("$righthandnoun" = "%camb") || ("$lefthandnoun" = "%camb") && ("%camb" != "orb")) then gosub put.1 "wear %camb" "%wear.msg"
	var docharge %start.docharge
	return
	
shroudcheck:
	if "%Ghost" = "off" then
	{
		if $spelltime > 27 then gosub castrequest
		if "$preparedspell" != "None" then gosub release spell
		gosub castbuff "Ghost Shroud" 15 15 8
		gosub spelldelay
	}
	return

hydrahex:
	if ("$preparedspell" != "None") then gosub release
	gosub castbuff "Hydra Hex" 12 12 13
	gosub spelldelay
return
	
pomcast:
	if "$preparedspell" != "None" then return
	if %incombat = 1 && $SpellTimer.PersistenceofMana.duration > 5 then return
	if $SpellTimer.PersistenceofMana.duration > 50 then return
	var pomstun 1
	var spellup no
	if %spelluproom = 1 then var spellup yes
	var spelluproom 0
	
	gosub emptyhands
	gosub put.1 "get my staff" "^You get a"
	if "$preparedspell" != "None" then gosub release
	gosub castbuff "Persistence of Mana" 425 425 40
	gosub put.1 "invoke my staff" "^Roundtime"
	gosub spelldelay
conloop:
	if $stunned = 1 then
	{
		delay 10
		goto conloop
	}
	if "$righthand" != "Empty" then gosub stow my staff
	if $roomid = 33 then var collect rock
	if $roomid = 218 then var collect torn cloth
	gosub startcollect 1
	if $concentration < 90 then goto conloop
	
	if "%spellup" = "yes" then var spelluproom 1
	var pomstun 0
	var collect rock
return
	
	
fillcamb:
	
	#gosub chargecamb medallion 48
	gosub chargecamb "king arm" 32
	gosub chargecamb "camb arm" 32
	gosub chargecamb "wrist" 32
	
	var arrayloc 0
	var invoke 1
return


## **************
## ** CLERIC STUFF
## **************

badgecheck:
	if "%resonance" = "moving" then return
	evalmath badgetemp ($gametime - $last.badge)
	## ** 90 minute timer (might be 2 hour timer)
	if %badgetemp < 5400 then return
	var clericswitch 1
	put #var last.badge $gametime
	gosub put.1 "remove badge" "^You take off"
	if (("$righthandnoun" != "badge") && ("$lefthandnoun" != "badge")) then gosub get my badge
	gosub put.1 "pray badge" "^Roundtime"
	gosub put.1 "wear badge" "^You put"
	var clericswitch 0
return

praycheck:
	evalmath praytemp ($gametime - $last.pray)
	## ** 10 minute timer
	if %praytemp < 600 then return
	put #var last.pray $gametime
	var clericswitch 1
	gosub put.1 "pray peri'el" "^Roundtime|^Aligning your thoughts"
	var clericswitch 0
return

prayer.matcheck:
	if matchre("%resonance", "(moving|healing)") then return
	if matchre("$roomid", "(%altar.rooms)") then return
	if matchre("$roomobjs", "(which|that) appears dead") then return
	if (("$righthand" != "Empty") || ("$lefthand" != "Empty")) then return
	if %swimmingnow = 1 then return
	evalmath praymattemp ($gametime - $last.praymat)
	## ** 10 minute timer
	if %praymattemp < 600 then return
	put #var last.praymat $gametime
	var clericswitch 1
	if $monstercount > 0 then gosub dodge
	if "%playsong" = "on" then gosub playsongoff
	if matchre("$roomobjs", "prayer mat") then 
	{	
		put #echo >log Red Prayer mat is on ground! Find out why. Skipping to kiss mat section.
		goto kissmat
	}
	gosub get my mat
	if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then
	{
		put #echo >log Red Prayer mat is missing! $lefthand, $righthand, $roomname
		var clericswitch 0
		return
	}	
	gosub put.1 "unroll my mat" "^You reverently"
	if (($monstercount = 0) && ("$preparedspell" = "None")) then gosub playsong.play
kissmat:
	gosub put.1 "kneel" "^You kneel"
	gosub put.1 "kiss mat" "^You bend forward"
	if $standing = 0 then gosub stand
	gosub put.1 "dance mat" "^You begin|^In your condition|^You dance"
	gosub put.1 "dance mat" "^Your actions|^In your condition|^You dance"
	gosub put.1 "dance mat" "^Your dance reaches|^In your condition|^You dance"
	gosub playsong.exit
rollmat:	
	if $standing = 0 then gosub stand
	gosub put.1 "roll mat" "^You carefully|^You can't"
	if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then
	{
		gosub emptyhands
		if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then 
		{
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll second mat" "^You carefully|^You can't"	
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll third mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll fourth mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll fifth mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll sixth mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll seventh mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll eighth mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll ninth mat" "^You carefully|^You can't"
			if (("$righthand" != "velvet mat") && ("$lefthand" != "velvet mat")) then gosub put.1 "roll tenth mat" "^You carefully|^You can't"
		}
			else 
			{
				put #echo >log Attempting to emptyhands! $lefthand, $righthand, $roomname, $roomobjs
				put put my $lefthandnoun in my back
				pause
				pause
				put put my $righthandnoun in my back
				goto rollmat
			}
		if matchre("$roomobjs", "prayer mat") then put #echo >log Red Prayer mat still on ground! $lefthand, $righthand, $roomname, $roomobjs
	}	
stowmat:
	gosub stow mat
	if (("$righthand" = "velvet mat") || ("$lefthand" = "velvet mat")) then
	{
		put #echo >log Red Error stowing prayer mat! $lefthand, $righthand, $roomname, $roomobjs
		put put my $lefthandnoun in my back
		pause
		pause
		put put my $righthandnoun in my back
		goto stowmat
	}
	var clericswitch 0
	if $monstercount > 0 then gosub dodge attack
return

arearituals:
	if "$zoneid" = "123" then return
	evalmath arearitual.temp ($gametime - $last.arearitual)
	if %arearitual.temp < 1200 then return
	put #var last.arearitual $gametime
	var resonance stealing	
	## ** Fill water here
	if "$zoneid" = "1" then gosub move 260
	if "$zoneid" = "42" then gosub move 249
	if "$zoneid" = "116" then gosub move 60
	if "$zoneid" = "127" then gosub move 56
	gosub fillwater
	## ** Move to Altar Room
	var altar.rooms 713|302|203|243|35
	if "$zoneid" = "1" then gosub move 713
	if "$zoneid" = "40" then gosub move 302
	if "$zoneid" = "42" then gosub move 203
	if "$zoneid" = "116" then gosub move 243
	if "$zoneid" = "127" then gosub move 35
	gosub ritualaltar
	var resonance
return

fillwater:
	action (fillwater) var fullwater 1 when ^There is no more 
	action (fillwater) on
	
	var waterbottle bottle
	var fullwater 0
	var fillwater from pond
	var fillwater.msg ^You fill|^The water is|^There is no more room|^You have to be
	
	if "$zoneid" = "127" then var fillwater from barrel
fill.loop:
	if ((!matchre("$righthand", "%waterbottle")) && (!matchre("$lefthand", "%waterbottle"))) then gosub get my %waterbottle
	gosub put.1 "fill my %waterbottle with water %fillwater" "%fillwater.msg"
	if %fullwater = 0 then goto fill.loop
	
	action (fillwater) off
	gosub release spell
	if %usedcamb = 1 then gosub castbuff "Bless" 1 1 21
		else gosub castbuff "Bless" 1 1 5
	gosub spelldelay
	gosub put.1 "cast water in my bottle" "%cast.msg"
	var usedcamb 0
	gosub stow bottle
return

ritualaltar:
	gosub get bottle
	gosub put.1 "clean altar with holy water" "^You begin to wash|^But the"
	gosub pause 10
	gosub stow bottle
	var playsong on
	gosub put.1 "play hymn masterful on zill for kertigen" "^You begin"
	gosub put.1 "dance" "^You begin|^In your condition"
	gosub put.1 "dance" "^Your actions|^In your condition"
	gosub put.1 "dance" "^Your dance reaches|^In your condition"
	#gosub put.1 "kneel" "^You kneel"
	#gosub put.1 "remove chain" "^You remove"
	#gosub put.1 "meditate chain" "^You clutch"
	gosub put.1 "recite Phelim, give me strength for my righteous vengeance\;Chadatru, guide my sword to swing in justice\;Everild, give me the power to conquer my enemies\;Truffenyi, let me not lose sight of compassion and mercy\;Else, I will become like those I despise\;Urrem'tier, receive into your fetid grasp these wicked souls\;May Tamsine's realms never know their evil ways again\;" "^You sense"
	pause 2
	matchre RETURN ^You get a sense|^After a moment|^You feel your efforts|^You feel that your
	matchwait 360
	put #echo >log Red Error with playsong at altar! Match timed out after 360 seconds.
	if "%playsong" = "on" then gosub playsongoff
return
	match ritualaltarexit A wood lion bead suddenly explodes
	matchwait 75
	put #echo >log Green Out of beads!
ritualaltarexit:
	#gosub put.1 "wear chain" "^You attach"
	gosub put.1 "stand" "^You stand"
	return