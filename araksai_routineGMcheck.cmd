	routineGMcheck:
	var GMchecks 0
	var randomanswer 0

#	var dangertriggers (\bignor(?:e[sd]?|ing)\b|\bcontinu(?:e[sd]?|ing)\b|\btyp(?:e[sd]?|ing)\b|\bhello\b|\brespond(?:e[sd]?|ing)\b|\breply(?:e[sd]?|ing)\b|\banswer(?:e[sd]?|ing)\b|\bspeak(?:e[sd]?|ing)\b|\bwhisper(?:e[sd]?|ing)\b|\bscream(?:e[sd]?|ing)\b|\bwait(?:e[sd]?|ing)\b|\byou have\b|SEND\[|\]SEND|\*SEND\*|\baloud\b|\btalk(?:e[sd]?|ing)\b|\".*\"|\bscript(?:e[sd]?|ing)\b|\bsmil(?:e[sd]?|ing)\b|\bfrown(?:e[sd]?|ing)\b|\bsnort(?:e[sd]?|ing)\b|\byell(?:e[sd]?|ing)\b|\bexclaim(?:e[sd]?|ing)\b|\bannounc(?:e[sd]?|ing)\b|\bdeclar(?:e[sd]?|ing)\b|\bvoic(?:e[sd]?|ing)\b|\bsa(?:id|y(?:ing)?s?)\b|\bclaim(?:e[sd]?|ing)\b|\bboom(?:e[sd]?|ing)\b|\bshout(?:s|ed|ing)?\b|\bthis place\b|you there\b|\bsqueak(?:s|ed|ing)?\b|\bdoing\b|\bspider(?:s)?\b|\balert(?:s|ed|ing)?\b|\bcheer(?:s|ed|ing)?\b|\bnod(?:s|ded|ding)?\b|\btyp(?:|e|es|ed|ing)\b|\bjump(?:s|ed|ing)?\b|\bwav(?:e[sd]?|ing)\b|\bstop(?:|s|ped|ping)\b  )/i
#	math keywords add 1;put #echo >log Orange *** KEYWORD: %keyword_was ****;if %keywords < 0 then math keywords

	var dangertriggers (\!\?|\?\!|\!\!|Continues|Hello|Respond|Reply|Answer|Speak|whisper|Scream|Ignoring| Wait|Y...have.*Seconds|SEND\[|\]SEND|\*SEND\*|Aloud| Talk|\".*\"|scripting|smil|frown|snort |yell|exclaim|announc|declar|voic|say| claim|announce|boom|shout|this place|you there| squeak| doing| spider|alert|cheer|nod|type |typing|typed|monkey|spider|mouse|rat\b|frog|demand)/i
	var combinedtriggers (your name)
	var SP (\!| |@|\#|\$|\%|\^|\&|\*|\(|\)|_|-|\+|\=|\{|\}|\||\\|\;|\'|\"|\<|\>|,|\.|\?|\/)
	action math keywords add 1 when (\w)%SP(\w)%SP(\w)%SP(\w)
	action math keywords add 1 when (\w)%SP{2,9}(\w)%SP{2,9}(\w)
	action math keywords add 1 when [A-Z]{4,9}
	action math keywords add 1 when %combinedtriggers
	action math keywords add 1 when %dangertriggers
	action math keywords subtract 1 when ^You have no idea what you're doing
	action math keywords subtract 2 when ^Stow what\?
	action math keywords subtract 1 when Sayaph
	action math keywords subtract 1 when  frog-crotch bolt
	action math keywords subtract 1 when ^Head popping out from under the ground, the armadillo quickly burrows fully up to the surface, looking around alertly.
	action math keywords subtract 1 when ^Brokk rubs his forehead thoughtfully and says, Got to find me more skins.  Got to be some hunters around here willing to sell some.
	action math keywords subtract 1 when ^A black goblin draws a hurling axe from the harness slung over its shoulder with a crooked smile.
	action math keywords subtract 1 when yellow door
	action math keywords subtract 1 when Patting the side of the boar's thick neck, the goblin mounted on a damaska boar whispers to its mount
	action math keywords subtract 1 when The attendant says, \"You can purchase.*Just order it again and we'll see it done
	action math keywords subtract 1 when Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2
	action math keywords subtract 1 when A loud *BOOM* sounds as the enraged tusky falls to the ground in an ungraceful heap of zombie pork flesh.
	action math keywords subtract 1 when A voice whispers in your ear, "The officials in City of.* have charged you with thievery.  We've kept things quiet, but thought you'd like to know
	action math keywords subtract 1 when ^A sales clerk points to where you lie concealed and begins to shout loudly for help.
	action math keywords subtract 1 when If you still wish to drop it, EMPTY <hand> or DROP it again
	action math keywords subtract 1 when ^As you consider a stealthy assault on.*perhaps it's a little risky.
	action math keywords subtract 1 when ^Careful probing of the.*fails to reveal to you what type of trap protects it
	action math keywords subtract 1 when ^Heavy footfalls and a chilling grunt announce the arrival of a zombie head-splitter
	action math keywords subtract 1 when ^Glowering darkly as its aura of flames dims to a deep purple, a Dragon Priest purifier hisses, "The holy flames of the World Dragon call out to me.  They hunger for the blood of the betrayers!"
	action math keywords subtract 1 when ^A Dragon Priest purifier chuckles dryly to itself with a sinuous hiss and shouts, "All ssshall tassste the undying fury of the World Dragon!".
	action math keywords subtract 1 when ^A Dragon Priest purifier glowers in disgust and softly hisses, "The continued presence of the corrupted ones has become quite taxing.  The plague of the corrupted ones will be cleansed from Elanthia in the name of the World Dragon!"
	action math keywords subtract 1 when ^A Dragon Priest purifier chuckles dryly to itself with a sinuous hiss and shouts, "All ssshall tassste the undying fury of the World Dragon!".
	action math keywords subtract 1 when ^A Dragon Priest purifier gazes at its burning talons as it hisses, "The primal nature of fire is exsshilarating!  Like a blackened sssoul to a living body, the fire consssumesss foressstsss, mountainsss... in the blink of an eye.  Devouring everything with itsss malevolent intent, and leaving nothing but asssh and memoriesss in itsss wake."
	action math keywords subtract 1 when ^A Dragon Priest purifier draws in a deep breath as it tilts its face to the heavens and softly hisses, "I can smell the stench the corrupted ones leave upon the air.  When all of the tainted ones are purged, I will be able to breath clean air once more!"
	action math keywords subtract 1 when ^A Dragon Priest purifier serenely gazes at the flames licking the air around its talons and softly hisses, "Ssso... perfect... ssso... beautiful... ssso... deadly!"
	action math keywords subtract 1 when ^A Dragon Priest purifier raises its arms to the heavens and slowly hisses, "I have been baptizssed within the fire of the World Dragon, and all ssshall feel my wrath!"
	action math keywords subtract 1 when ^A Dragon Priest purifier glides slowly into the area and hisses, "All shall be cleansed within my holy fire!"
	action math keywords subtract 1 when ^A Dragon Priest purifier gazes toward the heavens with a gentle smile as it calmly hisses, "My work is finally complete in this world.  Unto the World Dragon I commend my undying spirit!"
	action math keywords subtract 1 when ^A Dragon Priest zealot charges into the area shouting, "Cower before the might of the World Dragon Priests!"
	action math keywords subtract 1 when ^A Dragon Priest zealot snarls, "The tainted shall taste the venom of the World Dragon Priests!" 
	action math keywords subtract 1 when ^A Dragon Priest zealot snarls, "I shall give my life in the name of the World Dragon!"
	action math keywords subtract 1 when ^A Dragon Priest zealot bellows, "Stand fast, warriors of the World Dragon! This day is ours!" 
	action math keywords subtract 1 when ^A Dragon Priest zealot gasps to draw breath as it manages to mutter, "The infection... will... be.... purged!" before falling still with a soft hiss.
	action math keywords subtract 1 when ^You exhale.*then with a tremendous.*smack it flat between your hands before tossing away
	action math keywords subtract 1 when ^A grumbling janitor wanders into the area.  Flailing his broom, he shouts, \"I'm a-pickin' stuff up\!  Cain't stand this clutter another roisaen\!  Ye have till I
	action math keywords subtract 1 when In approximately one minute, I am returning to this spot and picking up everything I find on the ground.  If you leave it there, it's MINE and I won't give it back
	action math keywords subtract 1 when ^The troll laughs monstrously and chants, \".*\"
	action math keywords subtract 1 when Fallen leaves rustle with the movements of a thousand crawling insects.  With no birdsong to add a melody to the eerie rhythm, the crackling and whispering becomes the murmur of an unseen voice in the night
	action math keywords subtract 1 when Script finished|yellow|breeze continues to swirl around you.
	action math keywords subtract 1 when ^Sorry, system is slow.  No type ahead allowed|^Sorry, you may only type ahead 1 command
	action math keywords subtract 1 when ^You should probably wait until.*is dead first
	action math keywords set 0 when ^EXP HELP for more information|\*\*\*\*IMPORTANT\!\*\*\*\*
	return

GMcheckmain:
	action clear
	var keywords 0
	math GMchecks add 1
	echo GMCHECKING
	if "%monitor" = "atk" then gosub playnoise
	goto exitquick
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



playnoise:
	echo ###############################################################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ######## PAY ATTENTION #### PAY ATTENTION #####################
	echo ###############################################################
	put #play helphelp
	noisehide:
	if $hidden = 0 then if $monstercount > 0 then put retreat
	if $hidden = 0 then if $monstercount > 0 then put hide
	pause 2.5
	if $hidden = 0 then if $monstercount > 0 then put retreat
	if $hidden = 0 then if $monstercount > 0 then put hide
	pause 2.5
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



