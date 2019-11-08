##debuglevel 10

var rt.com ^\.\.\.wait|^You are still stunned|^You don't seem to be able to move to do that|^You can't do that while entangled in a web|^You struggle against the shadowy webs to no avail\.|^Sorry, system is slow|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!
var ritual.msg ^Roundtime:|^This ritual may only|^Rituals do not work|^You've|^A skinned creature is worthless|^This corpse has already been|^The preservation ritual performed|^Lacking your knife, you cannot perform any rituals.
var app.msg ^\[Roundtime|^Appraise what|^It's dead|Roundtime:
var stalk.msg ^Roundtime:|^\[Roundtime:|^You are already|^Stalking is an|^Stalk what\?|^\[You're
var advance.msg ^What do you want to advance towards\?|^You begin to advance on|already quite dead\.|^You are already advancing on|^You are already at melee with|^You begin to stealthily advance on|^You spin around to face|^You will have to retreat from your current melee first\.
var get.msg ^You get|^You pick up|^You are already holding that\.|^You fade in for a moment as you pick up|^You pull|^What were you referring to\?|^But that is already in your inventory\.|^You are not strong enough to pick that up\!
var prep.msg ^You begin chanting a prayer|^You close your eyes and breathe deeply,|^You trace an arcane sigil in the air,|^Heatless orange flames blaze between your fingertips|^Your eyes darken to black as a starless night|^You raise your arms skyward, chanting|^You are already preparing|^Icy blue frost crackles up your arms|^You make a careless gesture as you chant the words|^Tiny tendrils of lightning jolt between your hands|^The wailing of lost souls accompanies your preparations|^Your skin briefly withers and tightens, becoming gaunt|^Images of streaking stars falling from the heavens flash across your vision|^A nagging sense of desperation guides your hands through the motions|^You hastily shout the arcane phrasings needed to prepare|^You deftly waggle your fingers in the precise motions needed to prepare|^With great force, you slap your hands together before you and slowly pull them apart,|^With no small amount of effort, you slowly recall the teachings|^You struggle against your bindings to prepare|^You raise one hand before you and concentrate|^As you begin to focus on preparing
var cast.msg ^You gesture|^You don't have a spell prepared\!|^Your spell pattern collapses|^With a wave of your hand,|^You wave your hand\.|^With a flick of your wrist,|^Your secondary spell pattern dissipates|^You can't cast .+ on yourself\!|^You make a holy gesture|^You raise your palms and face to the heavens|^I could not find what you were referring to\.|^You have difficulty manipulating the mana streams, causing the spell pattern to collapse at the last|^You draw your|^You reach with both
var hide.msg ^Roundtime:|^Eh\?|^You melt into|^You are a bit|^You blend in with|notices your attempt to hide\!$
var hum.msg ^You are already|^You begin|^You fumble
var stow.msg ^You put|^Stow what
var mark.msg ^Roundtime:|^Mark
var wield.msg ^With a flick|^You're already|^You draw|^You sling|^You aren't|^You deftly|^You pick|^You are|^You get
var sheath.msg ^You deftly|^You secure|^You sheath|^With a flick|^You sling|^Perhaps|^You put

var rtlist Partial Displacement
var ss1 stance set 100 0 83 100
var ss1.pm stance set 100 0 83 100
var ss2 stance set 100 1 100 0
var counter first|second|third|fourth|fifth|sixth|seventh|END
var hum 1
var do1
var do2
var do3
var nec.spells acs|hp
var t 0
var reporters Azmina|Shankey|Hobblin
var friends (nonerightnow)
var enemies Iapetos
var super.enemies (Nonerightnow)

# local script actions
action var hum 1 when ^You finish humming|^You are already performing 

# teach learn
##To learn from him, you must LISTEN TO Stedis.

#Log no matter who does this:
action goto exit.full when ^\w+ begins to focus on you\!
action goto exit.full when ^\w+ begins to focus on $charactername\!
action goto exit.full when ^\w+ gestures at you\.
action goto exit.full when ^\w+ begins to aim at you
action goto exit.full when ^\w+ turns to face you\.
action goto exit.full when ^\w+ appears to be aiming at you
action goto exit.full when ^Something grabs your arm and drags you \w+ with it . . .
action goto exit.full when ^Something grabs your arm and tries to drag you, but you resist and stand firm\.
action goto exit.full when reaches over and holds your hand\.
action goto exit.full when grabs your arm and tries to drag you, but you resist and stand firm\.
action goto exit.full when grabs you and drags you .+ with (him|her)\.
action goto exit.full when grabs your arm and drags you .+ with (him|her) \. \. \.
action goto exit.full when report you

## ambush
if $combat = 1 then
{
		action goto ambush when leaps from hiding and ambushes|reveals|comes out of hiding|just came out of hiding\.|snipes|appears to be aiming|^You .+ cough
		action goto ambush when says,|explains,|whispers,|^You hear the voice of|^You hear a voice|asks,
}

## log from enemies doing this
action goto exit.full when %enemies steps out of the Moongate, which collapses immediately behind him.
action goto exit.full when %enemies came through a \w+ Moongate\.
action goto exit.full when ^%enemies appears to be aiming at you
action goto exit.full when ^%enemies reaches over and holds your hand\.
action goto exit.full when ^%enemies grabs your arm and tries to drag you, but you resist and stand firm\.
action goto exit.full when ^%enemies grabs you and drags you .+ with (him|her)\.
action goto exit.full when ^%enemies grabs your arm and drags you .+ with (him|her) \. \. \.
action goto exit.full when ^%enemies begins to advance on you\!
action goto exit.full when ^%enemies closes to (pole weapon|melee) range on you\!
action goto exit.full when ^%enemies begins to stealthily advance on you\!
action goto exit.full when ^You notice %enemies as (he|she) stealthily closes to (pole weapon|melee) range on you\.
action goto exit.full when ^You notice %enemies carefully watching you\.

## *********************
##  Spell actions
## *********************


var la coat
##gosub cut.check
goto base.end

put.1:
var firstcommand $1
var waitstring $2
match clear
putting.1:
matchre pause.putting.1 %rt.com
matchre return %waitstring
put %firstcommand
matchwait
pause.putting.1:
pause .1
goto putting.1

put.2:
var firstcommand $1
var secondcommand $2
var waitstring $3
match clear
putting.2:
matchre pause.putting.2 %rt.com
matchre return %waitstring
put %firstcommand
put %secondcommand
matchwait
echo error
pause.putting.2:
pause .1
goto putting.2

# end base command section
# Kurav created "universal" gosubs



move:
put #var lastmove $1
if matchre ("$roomobjs", "dense unnatural fog") then gosub move.random
put #goto $lastmove
waitfor @walk done.
return

ss:
delay 1
put .$1 $2 $3 $4 $5
waitfor $1.cmd done.
return 

retreat.start:
matchre return ^You retreat from combat|^You are already|^You sneak back
matchre retreat.start ^You retreat back|^Roundtime:|%rt.com|^You stop advancing
put ret
matchwait

retreat.pole:
matchre return ^You retreat|^You are already|^You sneak back
matchre retreat.pole ^Roundtime\:|%rt.com|^You stop advancing
put ret
matchwait


fa.tend:
if "$3" = "" then
{
	var old.firstcommand $1
	var old.waitstring $2
}
else
{
	var old.firstcommand $1
	var old.secondcommand $2
	var old.waitstring $3
}
match clear
put #var bleeding 0
gosub put.2 "tend my chest" "tend my back" "^You work|^That area has|^That area is"
var firstcommand %old.firstcommand
var secondcommand %old.secondcommand
var waitstring %old.waitstring
return

hide.b:
gosub put.1 "hide" "^Roundtime:|^Eh\?|^You melt into|^You are a bit|^You blend in with|notices your attempt to hide\!$"
return

unhide:
gosub put.1 "unhide" "^You come out|^But you are not|^You try to creep|^You slip"
return

unstalk.b:
gosub put.1 "stop stalk" "^You stop stalking\.|^You're not"
return

quiet:
gosub put.1 "song quiet" "^You will now play your enchantes a bit quieter|^You are already"
return

loud:
gosub put.1 "song loud" "^You will now play your enchantes a bit louder|^You are already"
return

stow:
var do1 $1
var do2 $2
if !matchre("$0", " ") then gosub put.1 "stow $0" "%stow.msg"
else gosub put.1 "stow %do1 in %do2" "%stow.msg"
return

walk:
gosub put.1 "$1" "^Obvious"
return

return

climbobj:
gosub put.1 "climb $1" "^Obvious"
return

hunt.timer:
timer clear
timer start
setvar hunt_time 0
math hunt_time add 80
return

### ****
### necro subs
### ****

cut:
matchre cut.1.pause %rt.com
matchre return %ritual.msg
put perf cut
matchwait
cut.1.pause:
pause .2
goto cut

cut.check:
if "$guild" = "Necromancer" then return
if "$roomplayers" != "" then return
if $ross.rope = 1 then return
evalmath timeSinceLastCut $gametime - $last.cut
put #var timecut %timeSinceLastCut
if $timecut < 70 then return
if $Thanatology.LearningRate < 33 then gosub cut
return

prep.b:
gosub put.1 "prep $1 $2" "%prep.msg"
var curr.spell $1
return

rel:
gosub put.1 "release" "^Type RELEASE HELP"
return

cast.b:
if "$preparedspell" = "%rtlist" then gosub put.1 "cast $1" "^Roundtime:|^You don't|^You can't|^Your secondary spell pattern dissipates"
else gosub put.1 "cast $1" "^Roundtime:|^You don't|^You can't|^You gesture|^Your secondary spell pattern dissipates"
return

ritual:
if (($1 = arise) && ($arise = 1)) then
{
	if "$roomplayers" = "" then gosub put.1 "perform arise on $2" "^%ritual.msg"
}
else if "$roomplayers" = "" then gosub put.1 "perform $ritual on $0" "^%ritual.msg"
return

ss1.b:
put #var stance ss1.s
if "$cscript" = "pm" then gosub put.1 "%ss1.pm" "^Setting your"
else gosub put.1 "%ss1" "^Setting your"
return

ss2.b:
put #var stance ss2.s
gosub put.1 "%ss2" "^Setting your"
return

return:
return

move.random:
put #mapper
if $north = 1 then var mapmove n
if $northeast = 1 then var mapmove ne
if $east = 1 then var mapmove e
if $southeast = 1 then var mapmove se
if $south = 1 then var mapmove s
if $southwest = 1 then var mapmove sw
if $west = 1 then var mapmove w
if $northwest = 1 then var mapmove nw
if $up = 1 then var mapmove u
if $down = 1 then var mapmove d
gosub retreat.start
if %mapmove = "" then
{
	if matchre("$roomexits", "(north|south|east|west|northeast|northwest|southeast|southwest|up|down)(,|$)") then 
	{
		var fogexit $1
		delay 1
		gosub walk %fogexit
	}
}
else gosub walk south
return

################################################
#  
# NEW BASE START
#
###############################################

m.input:
gosub $1 $2 $3 $4 $5 $6 $7
return

adv:
gosub put.1 "adv $0" "%advance.msg"
return

app:
gosub put.1 "app $0" "%app.msg"
return

cast:
gosub put.1 "cast" "%cast.msg"
return

get:
if $2 != "" then gosub put.1 "get $1 from my $2" "%get.msg"
else gosub put.1 "get my $1" "%get.msg"
return

harness:
var do1 $1
var do2 $2
harness1:
pause .1
matchre heldloop ^You tap
matchre harness1 %rt.com
put harness %do1
matchwait
heldloop:
if $mana < 100 then waiteval $mana = 100
if $heldMana < %do2 then goto harness1
return

hum:
if %hum = 1 then gosub put.1 "hum $vocals_song" "%hum.msg"
var hum 0
return

prep:
var do1 $1
var do2 $2
gosub put.1 "prep %do1 %do2" "%prep.msg"
return

ppcheck:
evalmath perctemp ($gametime - $last.perc)
if %perctemp < 300 then return
##  Can use a PP trigger or set last.pp here.
put #var last.perc $gametime
if $Power_Perceive.LearningRate < 29 then gosub ss powerp stop
return

rf:
gosub splay
##gosub pp.check
gosub spell rf 1 0 4
waitforre ^The refractive field gathers around you, completely hiding you from view.
return

release:
gosub put.1 "release" "^Type RELEASE HELP for more options\."
return

servant:
gosub put.1 "prep shadow servant" "%prep.msg"
delay 10
gosub put.1 "cast" "%cast.msg"
return

spell:
## $1 is spell name, $2 is prep, $3 is delay, $4 is harness
put #class spell_msg true
var do1 $1
var do2 $2
var do3 $3
var do4 $4
if $heldMana > 0 then gosub m.input release
gosub put.1 "prep %do1 %do2" "%prep.msg"
delay %do3
if "%do4" != "0" then gosub put.1 "harness %do4" "^Roundtime"
gosub put.1 "cast" "%cast.msg"
return

stalk:
gosub put.1 "stalk $0" "%stalk.msg"
return

uhide:
gosub put.2 "unhide" "hide" "%hide.msg"
return

hide:
gosub put.1 "hide" "%hide.msg"
return

mark:
gosub put.1 "mark all $0" "%mark.msg"
return

climb:
var do1 $0 
climb_r:
if $standing != 1 then put dance
matchre climb_r_rt ^Roundtime|^\.\.\.wait
matchre return ^Obvious
put climb %do1
matchwait
climb_r_rt:
pause .1
goto climb_r

wear:
matchre return ^You sling
matchre return ^You attach
matchre return ^You put
matchre return ^You strap
matchre return ^You work your way into
matchre return ^You slide your left arm through
matchre return ^You hang
matchre return ^You slip
matchre return ^You drape
matchre return ^You slide
matchre return ^You are already wearing that\.
matchre return ^Wear what\?
matchre return ^You can't wear any more items like that\.
matchre location.unload1 ^You should unload the
matchre location.unload1 ^You need to unload the
put wear %todo

put:
if $1 != "" then var do1 $1
if $2 != "" then var do2 $2
matchre return ^You drop
matchre return ^You put
matchre return ^You reverently place
matchre return ^As you start to place
matchre return ^What were you referring to\?
matchre p.p %rt.com
put put my %do1 in my %do2 
matchwait
p.p:
pause .1
goto put

focus:
if "$1" != "" then var do1 $1
if "$2" != "" then var do2 $2
matchre f.p link, but fail\.
matchre return ^Roundtime:|^You focus your magical senses
matchre f.p %rt.com
put focus my %do1
matchwait
f.p:
pause .1
goto focus

splay:
matchre return ^But you're
matchre return ^You stop
matchre return ^In the name of
matchre splay %rt.com
put stop play
matchwait

######################
##
## Spells
##
######################
spell.check:
	if $seer = 0 then gosub seer
	#if $mana < 50 then return
	if $aus = 0 then gosub aus
	if "$sop" = "0" then gosub spell sop 1 5 0
	if "$stw" = "0" then gosub spell stw 1 5 0
	if "$em" = "0" then gosub spell em 1 5 0
	return
	
aus:
gosub prep aus 10
gosub harness 10 50
delay 1
gosub cast
return

seer:
if $combat = 1 then return
if $combat = 0 then return
gosub prep seer 11
gosub harness 10 45
delay 1
gosub cast
return

#####################################
# #
# Reconnect Portion and Disconnect #
# #
######################################

ambush:
echo $0
ECHO AMBUSH TRIGGERED!
gosub m.input release
if $cscript = ht then put stow hammer
if $cscript = lt then put stow rock
delay .5
if $combat = 1 then gosub move.random
gosub clear
goto RANDOM_MOVE

exit.now:
exit.full:
if $afk = 1 then send .exitfull
else
	{
	put #beep
	echo Script was triggered off!
	put #beep
	put #beep
	}
exit

GOTO disco.end.of.file

pause.script:
pause 5
put hide
pause 5
echo * Pausing script for 3 minutes at the request of a friend.
put exp
pause 60
put exp
pause 60
put exp
pause 60
goto Script.begin

reconnect:
ACTION clear
GOSUB clear
pause 4
put look
pause 4
goto Script.begin

disco.end.of.file:
put quit
put quit


base.end: