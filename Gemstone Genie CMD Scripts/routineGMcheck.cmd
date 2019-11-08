	routineGMcheck:
	var GMchecks 0
	var randomanswer 0
	var gmlogoff 0
	var ds_gmcheck 0
	var td_gmcheck 0

#	var dangertriggers (\bignor(?:e[sd]?|ing)\b|\bcontinu(?:e[sd]?|ing)\b|\btyp(?:e[sd]?|ing)\b|\bhello\b|\brespond(?:e[sd]?|ing)\b|\breply(?:e[sd]?|ing)\b|\banswer(?:e[sd]?|ing)\b|\bspeak(?:e[sd]?|ing)\b|\bwhisper(?:e[sd]?|ing)\b|\bscream(?:e[sd]?|ing)\b|\bwait(?:e[sd]?|ing)\b|\byou have\b|SEND\[|\]SEND|\*SEND\*|\baloud\b|\btalk(?:e[sd]?|ing)\b|\".*\"|\bscript(?:e[sd]?|ing)\b|\bsmil(?:e[sd]?|ing)\b|\bfrown(?:e[sd]?|ing)\b|\bsnort(?:e[sd]?|ing)\b|\byell(?:e[sd]?|ing)\b|\bexclaim(?:e[sd]?|ing)\b|\bannounc(?:e[sd]?|ing)\b|\bdeclar(?:e[sd]?|ing)\b|\bvoic(?:e[sd]?|ing)\b|\bsa(?:id|y(?:ing)?s?)\b|\bclaim(?:e[sd]?|ing)\b|\bboom(?:e[sd]?|ing)\b|\bshout(?:s|ed|ing)?\b|\bthis place\b|you there\b|\bsqueak(?:s|ed|ing)?\b|\bdoing\b|\bspider(?:s)?\b|\balert(?:s|ed|ing)?\b|\bcheer(?:s|ed|ing)?\b|\bnod(?:s|ded|ding)?\b|\btyp(?:|e|es|ed|ing)\b|\bjump(?:s|ed|ing)?\b|\bwav(?:e[sd]?|ing)\b|\bstop(?:|s|ped|ping)\b  )/i
#	math keywords add 1;put #echo >log Orange *** KEYWORD: %keyword_was ****;if %keywords < 0 then math keywords

	var dangertriggers (\!\?|\?\!|\!\!|Continues|Hello|Respond|Reply|Answer|Speak|whisper|Scream|Ignoring| Wait|Y...have.*Seconds|SEND\[|\]SEND|\*SEND\*|Aloud| Talk|\".*\"|scripting|smil|frown|snort |yell|exclaim|announc|declar|voic|say| claim|announce|boom|shout|this place|you there| squeak| doing| spider|alert|cheer|nod|type |typing|typed|monkey|spider|mouse|rat\b|frog|demand|itch|pinch|tap|^You hear someone)/i
	var combinedtriggers (your name|yourself and|yourself to)
	var SP (\!| |@|\#|\$|\%|\^|\&|\*|\(|\)|_|-|\+|\=|\{|\}|\||\\|\;|\'|\"|\<|\>|,|\.|\?|\/)
	action math keywords add 1 when (\w)%SP(\w)%SP(\w)%SP(\w)
	action math keywords add 1 when (\w)%SP{2,9}(\w)%SP{2,9}(\w)
	action math keywords add 1 when [A-Z]{4,9}
	action math keywords add 99 when [A-Z]{10,20}
	action math keywords add 1 when %combinedtrigger
	action math keywords add 1 when %dangertriggers
	
	#action math keywords add 1; echo $0 when (\w)%SP(\w)%SP(\w)%SP(\w)
	#action math keywords add 1; echo $0 when (\w)%SP{2,9}(\w)%SP{2,9}(\w)
	#action math keywords add 1; echo $0 when [A-Z]{4,9}
	#action math keywords add 1; echo $0 when %combinedtriggers
	#action math keywords add 1; echo $0 when %dangertriggers
		
	put #highlight {regex} {#FF0080} {(\w)%SP(\w)%SP(\w)%SP(\w)}
	put #highlight {regex} {#FF0080} {(\w)%SP{2,9}(\w)%SP{2,9}(\w)}
	put #highlight {regex} {#FF0080} {[A-Z]{4,9}}
	put #highlight {regex} {#FF0080} {%combinedtriggers}
	put #highlight {regex} {#FF0080} {%dangertriggers}	
	#echo $0 - Keyword trigger 
	
	## ** Random creatures
	## ** Place in hunting sections
	#action (combat) math keywords subtract 1 when ^You hear a muffled
	#action (combat) math keywords subtract 1 when (pink|green|orange|purple|violet) monkey
	#action (combat) math keywords subtract 1 when crab twitches|finger twitches|tail twitches
	#action (combat) math keywords subtract 2 when ^A (?:war|hill) troll (?:mutters|hollers|bellows)
	#action (combat) math keywords subtract 1 when giant rat|rat pelt|monkey paw
	#action (combat) math keywords subtract 1 when ^A young cave troll (lumbers|stomps)
	action (combat) math keywords subtract 1 when ^A giant blight ogre staggers
	
	## ** Name triggers
	#action math keywords subtract 1 when ^Twitchy
	#action math keywords subtract 1 when Lahsayre|Pinchot
	#action math keywords subtract 1 when igorat axe
		
	## ** Generic combat
	action (combat) math keywords subtract 1 when yellow
	#action (combat) math keywords subtract 1 when ^A mutant togball reaches toward the sky, making an effort to straighten its body. 
	#action (combat) math keywords subtract 1 when sayanad
	#action (combat) math keywords subtract 1 when If it's worth doing
	
	## ** Death & screaming
	#action (combat) math keywords subtract 1 when ^The .+ screams one last time|screams in agony as the flames|screams evilly one last time|^The storm giant screams|^The .+ stumbles and falls
	#action (combat) math keywords subtract 1 when screams with delight|screams delightedly as it falls|^The .+ screams and grasps|^The .+ screams and falls to the ground grasping

	## ** Random triggers
	
	action math keywords subtract 2 when ^Stow what
	action math keywords subtract 1 when ^YOU HAVE ARRIVED
	#if "$charactername" = "Raelok" then action math keywords subtract 2 when ^A high valley spotted
	
	## ** Skill triggers
	
	action math keywords subtract 1 when ^\w+ continues to
	#action math keywords subtract 1 when ^Your class is currently
	
	## ** Spell triggers
	#action math keywords subtract 1 when ^With a final, swirling whisper,
	#action math keywords subtract 1 when ^A (faint|gentle|delicate) (pleasant|warm) breeze continues to swirl
	#action math keywords subtract 1 when ^You whisper (several words|the final)
	action math keywords subtract 1 when ^Syntax: CAST
	action math keywords subtract 1 when ^Glimmering cracks

	
	## ** Room triggers
	action math keywords subtract 1 when ^A rough-hewn log bridge
	
	## ** Shop triggers
	action math keywords subtract 1 when ^Vandorf quickly separates the bundle
	action math keywords subtract 1 when ^Vandorf says
	
	#action math keywords subtract 1 when \*CRACK\*
	action math keywords subtract 1 when ^You skillfully interpose your
	action math keywords subtract 1 when ^You attempt to blend with the

	#action (bard) math keywords subtract 2 when ^You focus your voice
	#action math keywords subtract 1 when pinch of .+ (?:dust|filings)|piece of spiderweb|spiderweb turquoise|rat fur
	#action math keywords subtract 1 when spidersilk
	action math keywords subtract 1 when ^You project your wish

	action var keywords 20 when pinches you
	action var keywords 20 when taps your shoulder
	action var keywords 20 when GameHost|GameMaster|SEND
	action math keywords subtract 1 when ^Sorry, system is slow|^Sorry, you may only type
	
	## ** Reset keywords trigger
	
	action var keywords 0 when ^  SCROLL \{SPELL\}|^  SHADOWLING
	action var keywords 0 when ^The door slams shut|^The guard brings you to the jail
	action var keywords 0 when ^EXP HELP for more information|\*\*\*\*IMPORTANT\!\*\*\*\*
	action var keywords 0 when ^Judging by the heavens above
	action var keywords 0 when ^\[Do you really want to destroy the|^You grab one side of the crucible and pour
	action var keywords 0 when ^The crucible's contents are not hot enough to empty
	action var keywords 0 when ^You are certain that the .+ is worth exactly
	action var keywords 0 when ^You can use SPELL STANCE
	action var keywords 0 when ^EXP HELP
	action var keywords 0 when Order of the (White Rose|Black Fox)
	action var keywords 0 when ^  STATUS
	action var keywords 0 when ^SYSTEM ANNOUNCEMENT
	action var keywords 0 when ^\w+ speaks with the clerk
	action var keywords 0 when ^The clerk pages through
	action var keywords 0 when ^  \(LISTEN HELP for more options
	action var keywords 0 when MANA SPELLUP
	
	## ** KNOWN GM CHECKS
	action var keywords 20;echo Possible GM CHECK! Keyword: $0 when (SEND|PAY|AFK|TELL|LOUD|REALLY|CHANCE|COOKIE|KILL|FAMILY|SAY|SCRATCH)
			
	return

GMcheckmain:
	goto exitquick
	
	## *** Not using the below
	action clear
	var oldkeywords %keywords
	var keywords 0
	math GMchecks add 1
	echo GMCHECKING
	if "$monitor" = "atk" then gosub playnoise
	#gosub playnoise
	goto exitquick5
	if %oldkeywords > 50 then goto gmcheckexit
	goto exitquick5
	setvariable foolverb stretch
	goto giveanswers
	setvariable foolverb none
	setvariable smile 0
	setvariable frown 0
	setvariable giggle 0
	setvariable snort 0
	setvariable yell 0
	setvariable dance 0
	setvariable say 0
	setvariable whisper 0
	setvariable exclaim 0
	setvariable announce 0
	setvariable declare 0
	setvariable whistle 0
	setvariable touch 0
	setvariable poke 0
	setvariable prod 0
	setvariable slap 0
	setvariable kick 0
	setvariable elbow 0
	setvariable bite 0
	setvariable voice 0
	setvariable nod 0
	setvariable clap 0
	setvariable shrug 0
	action goto exitfull when dead
	action math smile add 1 when smile
	action math frown add 1 when frown
	action math giggle add 1 when giggl
	action math snort add 1 when snort
	action math yell add 1 when yell
	action math dance add 1 when danc
	action math say add 1 when say
	action math jump add 1 when jump
	action math whisper add 1 when whisper
	action math exclaim add 1 when exlcaim
	action math whistle add 1 when whistl
	action math touch add 1 when touch
	action math poke add 1 when pok
	action math prod add 1 when prod
	action math slap add 1 when slap
	action math kick add 1 when kick
	action math elbow add 1 when elbow
	action math bite add 1 when bit
	action math voice add 1 when voic
	action math nod add 1 when nod
	action math clap add 1 when clap
	action math shrug add 1 when shrug
	
	put hide
	pause 5
	if not $hidden = 1 then put retreat
	if not $hidden = 1 then pause 0.1
	if not $hidden = 1 then pause 0.1
	if not $hidden = 1 then put hide
	pause 5
	if not $hidden = 1 then put retreat
	if not $hidden = 1 then pause 0.1
	if not $hidden = 1 then pause 0.1
	if not $hidden = 1 then put hide
	pause 5
	var keywords 0
	gosub check smile
	gosub check frown
	gosub check giggle
	gosub check snort
	gosub check dance
	gosub check whistle
	gosub check nod
	gosub check clap
	gosub check shrug
	setvariable foolverb stretch
	goto giveanswers

gmcheckrt:
	## Add herb rooms, TSC, orchard
	var saferooms 50|120|106
	var safezones 10|1
	if matchre("$roomid", "%saferooms") then
	{
		if matchre("$zoneid", "%safezones") then
		{
			var lastrt 0
			goto roundtimedone
		}
	}
	delay 3
	put #echo >log RED GMCHECK! HIGH RT!
	if "$monitor" = "atk" then gosub playnoise
	if "$charactername" = "Veylis" then put say Ouch. Jesus! What's with the RT.
	if "$charactername" = "Raeloc" then put say Uh...wow.  What's going on. This RT is ridiculous.
	if "$charactername" = "Calesti" then put say Ouch! What the heck... Seriously high RT.
	delay 3
	put glare
	var gmlogoff 1
	goto runhide
	
gmcheck_stand:
	pause 1
	if $kneeling = 1 then return
	if %skinnow = 1 then return
	#debuglevel 10
	if matchre("$roomname", "Temple, Black Altar") then return
	if %icefall = 1 then
	{
		if $standing = 0 then gosub stand
		var icefall 0
		debuglevel 0
		return
	}
	if %fallmsg = 1 then
	{
		if %fallok = 1 then
		{
			if $standing = 0 then gosub stand
			var fallok 0
			var fallmsg 0
			debuglevel 0
			return
		}
	}
	
	if "$zoneid" = "5" then
	{
		if $roomid = 6 then return
		if $roomid = 8 then return
		if $roomid = 134 then return
		if $roomid = 139 then return
	}
	if "$zoneid" = "16" then
	{
		if $roomid = 22 then return
		if $roomid = 19 then return
		if $roomid = 23 then return
	}
	delay 1
	put stand
	delay 3
	put #echo >log RED GMCHECK! KNOCKED DOWN!
	if "$monitor" = "atk" then gosub playnoise
	if "$charactername" = "Veylis" then put say Ouch. Jesus, I'm here.  No need to get me killed.
	if "$charactername" = "Turon" then put say Heh, ya got me.  I'm here, please stop.
	if "$charactername" = "Raeloc" then put say Uh... what just knocked me down.  They have no spells here...
	if "$charactername" = "Merisai" then put say Ouch! What the heck...
	if "$charactername" = "Calesti" then put say Ouch! ... What's going on?
	delay 3
	put glare
	var gmlogoff 1
	goto runhide


	playnoise:
	echo ###############################################################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ###############################################################
	put #play helphelp
	put #play helphelp
	put #play helphelp
	noisehide:
	pause 1
	goto playnoise



check:
	setvariable this $0
	if %%this > 10 then setvariable foolverb $0
	if "%foolverb" != "none" then goto giveanswers
	return
	goto mainloop

touchcheck:
	setvariable this $0
	if %%this > 10 then setvariable foolverb $0
	if %foolverb != "none" then goto giveanswers
	return
	goto mainloop
	giveanswers:
	math randomanswer add 3
	goto answer%randomanswer



answer1:
	setvariable randomanswer 1
	setvariable response1 'howdy
	setvariable response2 search
	setvariable response3 'grin
	setvariable response4 'Bleh.. whoops.
	goto automatedresponse
answer2:
	setvariable randomanswer 2
	setvariable response1 'Err..
	setvariable response2 'Hello there.
	setvariable response3 ponder
	setvariable response4 scratch raikage
	goto automatedresponse
answer3:
	setvariable randomanswer 3
	setvariable response1 mutter
	setvariable response2 search
	setvariable response3 'What a weird place this is..
	setvariable response4 cackle
	goto automatedresponse
answer4:
	setvariable randomanswer 4
	setvariable response1 'Haha.
	setvariable response2 'I C U
	setvariable response3 'Err.. Bad timin.  Sorry, i gotta go.
	setvariable response4 exitfull

automatedresponse:
	pause 1
	if "%response1" != "none" then put %response1
	pause 0.1
	pause 1
	pause 1
	pause 0.1
	if $monstercount > 0 then if not $hidden = 1 then put retreat
	if not $hidden = 1 then pause 0.1
	if not $hidden = 1 then pause 0.1
	if not $hidden = 1 then put hide
	pause 3
	pause 1
	if "%response2" != "none" then put %response2
	pause 1
	pause 1
	pause 3
	put unhide
	pause 1
	pause 1
	if "%foolverb" != "none" then put %foolverb
	pause 1
	pause 1
	put hide
	pause 3
	pause 1
	if "%response3" != "none" then put %response3
	pause 1
	pause 1
	pause 3
	pause 1
	if "%response4" = "exitfull" then goto exitfull
	if "%response4" != "none" then put %response4
	pause 2
	setvariable keywords 0
	timer clear
	goto exitquick



