action clear
gosub clear
Counter Set 0
Timer clear
var reconnects 0
var listen null
var todo

################################################################################

var friends (nonerightnow)
var enemies Aerathor
var super.enemies (Nonerightnow)

#Log only if person is an enemy:
action goto exit.full when ^ \*.%super.enemies joins the adventure\.
action goto exit.full when ^%enemies just arrived\.
action goto exit.full when ^%enemies gestures
action goto exit.full when ^You notice %enemies peering through the other side of the Moongate\.
action goto exit.full when ^A \w+ moonbeam flares into a brilliant blossom of light\! As your eyes slowly recover, you notice a dazed-looking %enemies, who wasn't there before\.
action goto exit.full when ^A shadow swiftly oozes into the room, deposits a very shaken %enemies, and just as swiftly departs\.
#No carrot on the below one b/c titles
action goto exit.full when %enemies came through a \w+ Moongate\.

#Log no matter who does this:
action goto exit.full when ^\w+ begins to focus on you\!
action goto exit.full when ^\w+ begins to focus on $charactername\!
#action goto exit.full when ^\w+ gestures at you\.
action goto exit.full when ^\w+ begins to aim at you
action goto exit.full when ^\w+ turns to face you\.
action goto exit.full when ^\w+ appears to be aiming at you
action goto exit.full when ^Something grabs your arm and drags you \w+ with it . . .
action goto exit.full when ^Something grabs your arm and tries to drag you, but you resist and stand firm\.

action goto exit.temp when ^Your mind hears (\w+) thinking, "$charactername log

#TODO: Trigger if person is not in clan: (For now only logging on enemies)
action goto exit.full when ^%enemies reaches over and holds your hand\.
action goto exit.full when ^%enemies grabs your arm and tries to drag you, but you resist and stand firm\.
action goto exit.full when ^%enemies grabs you and drags you .+ with (him|her)\.
action goto exit.full when ^%enemies grabs your arm and drags you .+ with (him|her) \. \. \.
action goto exit.full when ^%enemies begins to advance on you\!
action goto exit.full when ^%enemies closes to (pole weapon|melee) range on you\!
action goto exit.full when ^%enemies begins to stealthily advance on you\!
action goto exit.full when ^You notice %enemies as (he|she) stealthily closes to (pole weapon|melee) range on you\.
action goto exit.full when ^You notice %enemies carefully watching you\.
action goto exit.full when ^You are carrying between 400 and 499 items on you\.
action goto exit.full when ^You are carrying 500 or more items\. You MUST get rid of enough items to be below 500
action goto exit.full when ^(\w+) waves (an ilmenite-tipped wand|a narrow scheelite rod) at you\.
#action goto exit.full when ^ \* %friends is slain before your eyes\!
#action goto exit.full when ^You slowly tip over and fall down
#action goto exit.full when rushes in and engages you\!

action goto reconnect when ^Closing the WIZARD front end does NOT necessarily mean your
action goto reconnect when ^Character will be dropped from the game\!
action goto reconnect when Please check for new or updated items in NEWS\!

################################################################################


action var People.Room occupied when ^A howl echoes about you as a wolf calls to his kind\!$
action var People.Room occupied when ^With a waver like a mirage, \w+ fades into view\.$
action var People.Room occupied when ^You notice \w+ loading
action var People.Room occupied when ^\w+ appears to be aiming at
action var People.Room occupied when ^You notice \w+'s attempt to remain hidden
action var People.Room occupied when Appearing to have lost sight of its target
action var People.Room occupied when comes out of hiding\.$
action var People.Room occupied when ^\w+ leaps from hiding
action var People.Room occupied when slips out of the shadows
action var People.Room occupied when Someone snipes
action var People.Room occupied when attempt to fire from hiding\.$
action var People.Room occupied when ^You hear
action var People.Room occupied when You hear the spine-chilling hiss of a S'Kra Mur somewhere in the shadows\.$
action var People.Room occupied when bursts from hiding and begins to dance about\!$
action var People.Room occupied when ^You notice \w+ as \w+ stealthily closes to.(meele|missle) on a
action var People.Room occupied when ^You notice \w+ attempting to stealthily advance upon a
action var People.Room occupied when ^You hear someone cough\.$
action var People.Room occupied when ^You hear the voice of \w+ say, "
action var People.Room occupied when ^\w+ moves into a position to (parry|dodge)\.$
action var People.Room occupied when ^\w+ coughs\.$
action var People.Room occupied when ^\w+ says, "
action var People.Room occupied when ^\w+ gestures at a \w+\.$
var People.Room empty

################################################################################


Action var Hidden 0 when ^You blend in with your surroundings|^You slip into a hiding|^You melt into the background|^Darkness falls over you like a cloak, and you involuntarily blend into the shadows\.|^Eh\? But you're already hidden
Action var Hidden 1 when ^You leap out of hiding|^You come out of hiding\.|^You burst from hiding and begin to dance about\!|^You slip out of hiding\.|notices your attempt to hide|discovers you, ruining your hiding place|reveals you, ruining your hiding attempt
var Hidden 1

action var humming 0 when ^You begin to hum|^You fumble slightly as you begin to hum|^You struggle to begin to hum|^You continue to hum|^You are already performing something\.
action var humming 1 when ^You finish humming|^You stop playing your song\.|^In the name of love\?
var humming 1

action var foragable 1 when ^The room is too cluttered to find anything her
action var foragable 0 when ^A scavenger troll strolls in, looks you squarely in the eye and says
action var foragable 0 when ^A low fog rolls in, then just as quickly rolls out
var foragable 0

################################################################################


action var skin 1 when ^A.*gryphon collapses into a lifeless mound of fur and feathers\.
action var skin 1 when ^A.*snow goblin stares at you stupidly for a moment, before its eyes roll backwards into its head\.
action var skin 1 when ^The forest geni's body explodes into a gaseous cloud\.
action var skin 1 when ^The forest geni cries out to the forest for protection\. Getting no response, it collapses to the ground\.
action var skin 1 when ^A giant black leucro collapses to the ground, yelping like a lost puppy calling for its mother until finally it ceases all movement\.
action var skin 1 when ^A giant black leucro suddenly yelps like a puppy and stops all movement\.
action var skin 1 when ^The silver leucro screams one last time and lies
action var skin 1 when ^The silver leucro falls to the ground and lies
action var skin 1 when ^A caracal tips over, limbs extended stiffly, and exp
action var skin 1 when ^A caracal trembles violently before finally exp
action var skin 1 when ^A peccary flops in a porky heap, squealing one last time before passing into obliv
action var skin 1 when ^A peccary kicks and spasms as the last vestiges of life flee this mortal c
action var skin 1 when ^A bristle-backed peccary flops in a porky heap, squealing one last time before passing into ob
action var skin 1 when ^A bristle-backed peccary kicks and spasms as the last vestiges of life flee this mortal
action var skin 1 when ^The asaren celpeze thrashes about for a moment, then lies s
action var skin 1 when ^The asaren celpeze's flared crest wobbles, then collapses as the celpeze falls over and lies s
action var skin 1 when ^The asaren celpeze slumps and goes limp\. Its tail twitches once or twice, and the light fades from its baleful e
action var skin 1 when ^The asaren celpeze's chest heaves slowly and it emits a rasping hiss before finally lying st
action var skin 1 when ^A giant thicket viper slaps around a few times and then grows still\.
action var skin 1 when ^A giant thicket viper rises up threateningly one last time before collapsing\.

action var skin 0 when ^Skin what\?
action var skin 0 when ^.* can't be skinned
var skin 0

################################################################################


Action var listen $2 when ^To learn from (him|her), you must LISTEN TO (\w+)
Action var listen null when ^You begin to listen
Action var listen null when ^You are already listening to someone\.
Action var listen null when ^Who do you want to listen to
Action var listen null when isn't teaching a class\.
Action var listen null when I could not find who you were referring to\.

Action send dump junk when ^The room is too cluttered to find anything here\!

#action put STAND when eval $standing = 0
action send stand when ^You must stand first
action send stand when ^You might want to stand up first
action send stand when ^You had better stand up first
action send stand when ^You can't do that while lying down
action send stand when ^You'd have better luck standing up

goto disco.end.of.file

stow:
var location stow1
var todo $0
stow1:
matchre return ^Stow what\?
matchre return ^You put your
matchre return ^But that is already in your inventory\.
matchre location.unload ^You should unload the
matchre location.unload ^You need to unload the
put stow %todo
GOTO retry


wear:
var location wear1
var todo $0
wear1:
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
GOTO retry


remove:
var location remove1
var todo $0
remove1:
matchre return ^You remove
matchre return ^You loosen the straps securing
matchre return ^You take
matchre return ^You slide
matchre return ^You sling
matchre return ^You work your way out of
matchre return ^You pull off
matchre return ^You pull your
matchre return ^You aren't wearing that\.
matchre return ^Remove what\?
matchre return ^What were you referring to\?
put remove my %todo
GOTO retry


get:
var location get1
var todo $0
get1:
matchre return ^You get
matchre return ^You pick up
matchre return ^You are already holding that\.
matchre return ^You fade in for a moment as you pick up
matchre return ^You pull
matchre return ^What were you referring to\?
matchre return ^But that is already in your inventory\.
matchre return ^You are not strong enough to pick that up\!
put get %todo
GOTO retry


wield:
var location wield1
var todo $0
wield1:
matchre return ^You can only wield a weapon or a shield\!
matchre return ^You need to have your
matchre return ^You draw out your
matchre return ^You're already holding
put wield %todo
GOTO retry


juggle:
var location juggle1
var todo $0
juggle1:
matchre return ^Don't be silly\!
matchre return ^What were you referring to\?
matchre return ^But you're not holding
matchre return ^It's easier to juggle if you start
matchre return ^Roundtime
put juggle %todo
GOTO retry


predict:
var location predict1
var todo $0
predict1:
matchre return ^You focus inwardly searching for insight into your future\.
matchre return ^The future, however, remains a dark mystery to you\.
matchre return ^You must be a real expert to predict the weather indoors\.
matchre return ^Roundtime
put predict %todo
GOTO retry


read:
var location read1
var todo $0
read1:
matchre return ^I could not find what you were referring to\.
matchre return ^The writing is too small\. You'll have to hold the scroll to read it\.
matchre return ^Roundtime
put read %todo
GOTO retry


prep_spell:
if $Primary_Magic.LearningRate > 30 then goto return
if $Harness_Ability.LearningRate > 30 then goto return
prep_spell1:
if $mana < 80 then goto return
prep:
var location prep1
var todo $0
prep1:
matchre return ^You begin chanting a prayer
matchre return ^You close your eyes and breathe deeply,
matchre return ^You trace an arcane sigil in the air,
matchre return ^Heatless orange flames blaze between your fingertips
matchre return ^Your eyes darken to black as a starless night
matchre return ^You raise your arms skyward, chanting
matchre return ^You are already preparing
matchre return ^Icy blue frost crackles up your arms
matchre return ^You make a careless gesture as you chant the words
matchre return ^Tiny tendrils of lightning jolt between your hands
matchre return ^The wailing of lost souls accompanies your preparations
matchre return ^Your skin briefly withers and tightens, becoming gaunt
matchre return ^Images of streaking stars falling from the heavens flash across your vision
matchre return ^A nagging sense of desperation guides your hands through the motions
matchre return ^You hastily shout the arcane phrasings needed to prepare
matchre return ^You deftly waggle your fingers in the precise motions needed to prepare
matchre return ^With great force, you slap your hands together before you and slowly pull them apart,
matchre return ^With no small amount of effort, you slowly recall the teachings
matchre return ^You struggle against your bindings to prepare
matchre return ^You raise one hand before you and concentrate
matchre return ^As you begin to focus on preparing
put prepare %todo
GOTO retry


harness:
#if $preparedspell = None then GOTO return
var location harness1
var todo $0
harness1:
matchre return ^Roundtime
matchre return ^You tap into the mana
matchre return ^Usage:
matchre return ^Attunement:
matchre return ^You strain, but cannot harness that much power\.
matchre return ^You can't harness that much mana\!
put harness %todo
GOTO retry


infuse:
var location infuse1
var todo $0
infuse1:
matchre return ^Roundtime
matchre return ^You don't have enough harnessed to infuse that much\.
put infuse %todo
GOTO retry


cast:
var location cast1
var todo $0
cast1:
matchre return ^You gesture
matchre return ^You don't have a spell prepared\!
matchre return ^Your spell pattern collapses
matchre return ^With a wave of your hand,
matchre return ^You wave your hand\.
matchre return ^With a flick of your wrist,
matchre return ^Your secondary spell pattern dissipates
matchre return ^You can't cast .+ on yourself\!
matchre return ^You make a holy gesture
matchre return ^You raise your palms and face to the heavens
matchre return ^I could not find what you were referring to\.
matchre return ^You have difficulty manipulating the mana streams, causing the spell pattern to collapse at the last moment\.
put cast %todo
GOTO retry


charge:
var location charge1
var todo $0
charge1:
matchre return ^Roundtime
put charge %todo
GOTO retry


focus:
var location focus1
var todo $0
focus1:
matchre return ^Roundtime
matchre return ^You reach out into the seemingly infinite strands of Lunar mana
matchre return ^You move into the chaotic tides
matchre return ^Your link to the .+ is intact\.
matchre return ^You are in no condition to do that\.
put focus %todo
GOTO retry


release:
var location release
matchre return ^Type RELEASE HELP for more options\.
put release
GOTO retry


release.spell:
if $preparedspell = None then return
var location release.spell
matchre return ^You let your concentration lapse and feel the spell's energies dissipate\.
matchre return ^You aren't preparing a spell\.
put release spell
GOTO retry


release.mana:
var location release.mana
matchre return ^You release the mana you were holding\.
matchre return ^You aren't holding any mana\.
put release mana
GOTO retry


rel:
var location rel
matchre return ^You release a
matchre return ^You release the mana you were holding\.
matchre return ^You aren't holding any mana\.
put release 1 mana
GOTO retry


power:
var location power1
var todo $0
power1:
matchre return ^Roundtime
matchre return ^Something in the area is interfering
matchre return ^I could not find who you were referring to\.
put PERCEIVE %todo
GOTO retry


tend:
var location tend1
var todo $0
tend1:
matchre return ^That area has already been tended to\.
matchre return ^You work carefully at tending your wound\.
matchre return ^Doing your best
matchre return too injured for you to do that\.
matchre return ^That area is not bleeding\.
matchre return ^Roundtime:
put tend %todo
GOTO retry


look:
var location look1
var todo $0
look1:
matchre return ^You are
matchre return ^You have
matchre return ^You see
matchre return ^(He|She) is
matchre return ^I could not find what you were referring to\.
put look %todo
GOTO retry


teach:
var location teach1
var todo $0
teach1:
matchre return ^You begin to lecture
matchre return is already listening to you\.
matchre return is listening to someone else\.
matchre return ^You have already offered to
matchre return already trying to teach someone else
matchre return is already trying to teach you something
matchre return ^That person is too busy teaching their own students to listen to your lesson\.
matchre return ^You cannot listen to a teacher and teach at the same time
matchre return ^I could not find who you were referring to\.
matchre return isn't teaching you anymore\.
put Teach %todo
GOTO retry


listen:
var location listen1
var todo $0
listen1:
matchre return ^You begin to listen
matchre return ^Your teacher appears to have left\.
matchre return ^You are already listening to someone\.
matchre return ^Who do you want to listen to
matchre return ^I could not find who you were referring to\.
matchre return isn't teaching a class\.
matchre return ^You cannot teach a skill and be a student at the same time\!
put listen %todo
GOTO retry


stop:
var location stop1
var todo $0
stop1:
matchre return ^You stop teaching\.
matchre return ^But you aren't teaching anyone\.
matchre return ^You stop listening to
matchre return ^But you aren't listening to anyone\.
matchre return ^You stop trying to teach
put stop %todo
GOTO retry



khri:
var location khri1
var todo $0
khri1:
matchre return not recognizable as a valid khri\.
matchre return ^Roundtime
matchre return ^You're already using the
matchre return ^You strain, but cannot focus your mind enough to manage that\.
matchre return ^You have not recovered from your previous
put khri start %todo
GOTO retry


ask:
var location ask1
var todo $0
ask1:
matchre return ^To whom are you speaking\?
matchre return ^With a sad look
matchre return ^A pure white alfar avenger peers at you
put ask %todo
GOTO retry


stance:
var location stance1
var todo $0
var current.stance $0
stance1:
matchre return ^You are now set to use your
matchre return ^Your (attack|evasion|parry|shield) ability is now set at
put stance %todo
GOTO retry


stance.set:
var location stance.set1
var todo $0
stance.set1:
matchre return ^Setting your
matchre return ^Please specify
matchre return ^You have specified a total number
put stance set %todo
GOTO retry


count:
var location Count1
var todo $0
count1:
matchre return ^You take a quick count of potential threats in the area\.\.\.
matchre return ^You count up the items in your
matchre return ^That doesn't tell you much of anything.
put count %todo
GOTO retry


forage:
if $Foraging.LearningRate > 33 then return
var location forage1
var todo $0
forage1:
matchre return ^Roundtime
matchre return ^You really need to have at least one hand free to forage properly\.
matchre return ^You cannot forage while in combat\!
matchre return ^The room is too cluttered to find anything here\!
put forage %todo
GOTO retry


collect:
if $Foraging.LearningRate > 33 then return
var location collect1
var todo $0
collect1:
matchre return ^Roundtime
matchre return ^You really need to have at least one hand free to forage properly\.
matchre return ^You cannot collect anything while in combat\!
matchre return ^The room is too cluttered to find anything here\!
put collect %todo
GOTO retry


kick:
var location kick
matchre kick ^You take a step back and run up to the
matchre kick1 ^You can't do that from your position\.
matchre kick1 ^You throw a glorious temper tantrum\!
matchre return ^I could not find what you were referring to\.
put kick pile
GOTO retry

kick1:
GOSUB stand
GOTO kick

turn:
var location turn1
var todo $0
turn1:
matchre return ^Turn what\?
matchre return ^You turn to the section
put turn %todo
GOTO retry


study:
var location study1
var todo $0
study1:
matchre return ^You study your
matchre return ^You've already started to make something
matchre return ^You are unable to sense additional information\.
matchre return ^You take on a studious look\.
matchre return ^You should try that where you can see the sky\.
matchre return ^You feel it is too soon to grasp anything new in the skies above\.
matchre return ^Roundtime
put study %todo
GOTO retry


poke:
var location poke1
var todo $0
poke1:
matchre return ^You poke a hole in your
matchre return ^You toss a piece of
matchre return ^You poke a piece of
matchre return ^You tear up the empty envelope and toss it away\.
matchre return ^What were you referring to\?
matchre return ^Going around poking things isn't going to get you far\.
matchre return ^You can't tear up the envelope while there's still paper inside\.
matchre return ^You must be either wearing or holding a plain paper envelope before you can do that\!
put poke %todo
GOTO retry


drop:
var location drop1
var todo $0
drop1:
matchre return ^You drop
matchre return ^What were you referring to\?
matchre return ^But you aren't holding that\.
put drop %todo
GOTO retry


aim:
var location aim1
var todo $0
aim1:
matchre return ^You begin to target
matchre return ^You shift your target to
matchre return ^You are already targetting that\!
matchre return ^You need both hands in order to aim\.
matchre return ^At what are you trying to aim\?
matchre return ^Your .+ isn't loaded\!
matchre return ^But the .+ in your right hand isn't a ranged weapon\!
matchre return ^You don't have a ranged weapon to aim with\!
put aim %todo
GOTO retry


target:
var location target1
var todo $0
target1:
matchre return ^You begin to weave
matchre return ^Your target pattern is already formed
matchre retrun ^You must be preparing a spell in order to target it\!
matchre return ^You don't need to target the spell you're preparing\.
matchre target2 ^There is no need to target
put target %todo
GOTO retry
target2:
put loot
GOTO target1

load:
var location load1
var todo $0
load1:
matchre return ^Roundtime
matchre return ^Your .+ is already loaded
matchre return ^What weapon are you trying to load\?
matchre return ^You don't have the proper ammunition readily available for your
matchre return ^You can't load .+, silly\!
put load %todo
GOTO retry


unload:
var location unload
matchre return ^You unload the
matchre return ^You remain concealed by your surroundings, convinced that your unloading
matchre return ^Roundtime:
matchre return ^But your
matchre return ^You don't have a
matchre return ^You can't unload such a weapon\.
matchre return ^Your
put unload
GOTO retry


pray:
var location pray1
var todo $0
pray1:
matchre return ^You bow your head
matchre return ^You want to pray here\?
matchre return ^You kneel down and begin to pray\.
matchre return ^You continue praying for guidance\.
matchre return ^You pray fervently\.
matchre return ^You beseech your God for mercy\.
matchre return ^You begin to pray, kneeling before the altar\.
matchre return ^The soft sound of your prayers wraps itself around you and brings you a sense of tranquility\.
matchre return ^Your fervent prayers are met with a sense of peace and security\.
matchre return ^As you utter your prayer
matchre return ^You begin to pray
put pray %todo
GOTO retry


rub:
var location rub1
var todo $0
rub1:
matchre return ^You rub the orb and feel a strange tugging, but nothing really seems to happen\.
matchre return ^As you rub the orb, it glows slightly more intensely and you feel a strange tugging, as if something has been moved from you to the orb\.
matchre return The strange tugging sensation is gone, leading you to believe that your sacrifice is properly prepared\.
matchre return ^Rub what\?
put rub %todo
GOTO retry


stand:
if standing then return
var location stand1
stand1:
matchre return ^You stand back up\.
matchre return ^You swim back up
matchre return ^You are already standing\.
matchre stand1 ^You are so unbalanced you cannot manage to stand\.
matchre stand1 ^You are overburdened and cannot manage to stand\.
matchre stand1 ^The weight of all your possessions prevents you from standing\.
matchre stand1 ^Roundtime
put stand
GOTO retry


hunt:
var location hunt1
var todo $0
hunt1:
matchre return ^You take note
matchre return ^Roundtime
matchre return ^You move to hunt down your prey\.
matchre return ^Your prey seems to have completely vanished\.
matchre return ^You don't have that target currently available\.
matchre hunt2 ^You'll need to disengage first\.
matchre hunt3 ^You'll need to be standing up, first\.
put hunt %todo
GOTO retry
hunt2:
GOSUB retreat
GOTO hunt
hunt3:
GOSUB stand
GOTO hunt1


start.humming:
if $Vocals.LearningRate > 30 then return
if %humming = 0 then return
var location start.humming1
start.humming1:
matchre return ^You begin to hum
matchre return ^You fumble slightly as you begin to hum
matchre return ^You struggle to begin to hum
matchre return ^You continue to hum
matchre return ^You are already performing something\.
matchre start.humming1 ^You can't focus your attention enough to perform\.
put hum %hum
GOTO retry


stop.humming:
var location stop.humming
stop.humming1:
matchre return ^You stop playing your song\.
matchre return ^In the name of love\?
put stop hum
GOTO retry


steal:
var location steal1
var todo $0
steal1:
matchre return ^Roundtime
matchre return ^You start to steal from
matchre return ^You cautiously attempt to lift
matchre return ^You haven't picked something to steal\!
matchre return ^You glance around but your mark seems to be missing\.
matchre return ^You couldn't get close enough to steal anything in time\.
matchre return ^You need at least one hand free to steal\.
matchre return ^You consider it, but
put steal %todo
GOTO retry


put:
var location put1
var todo $0
put1:
matchre return ^You drop
matchre return ^You put
matchre return ^You reverently place
matchre return ^As you start to place
matchre return ^What were you referring to\?
put put %todo
GOTO retry


lean:
var location lean1
var todo $0
lean1:
matchre return ^You lean
matchre return ^You shift your weight\.
matchre return ^I could not find what you were referring to\.
put lean %todo
GOTO retry


eat:
var location eat1
var todo $0
eat1:
matchre return ^You'd be better off trying to drink
matchre return ^What were you referring to\?
matchre return ^You eat
matchre return ^You can't drink a
matchre return ^You drink
put %todo
GOTO retry


gesture:
var location gesture1
var todo $0
gesture1:
matchre return ^you gesture\.
matchre return ^Roundtime:
matchre return ^As you intone a quiet prayer to Meraud, your hands begin to glow with a faint silvery nimbus\.
put gesture %todo
GOTO retry


retreat:
var location retreat
matchre retreat ^You retreat from combat\.
matchre retreat ^You retreat back to pole range\.
matchre retreat ^You stop advancing
matchre retreat ^You sneak back out
matchre retreat ^You must stand first\.
matchre return ^You are already as far away as you can get\!
matchre return ^You try to
matchre return revealing your hiding place\!
put retreat
GOTO retry


2retreat:
var location 2retreat
matchre return ^You stop advancing
matchre return ^You retreat from combat\.
matchre return ^You retreat back to pole range\.
matchre return ^You sneak back out
matchre return ^You are already as far away as you can get\!
matchre return ^You try to
matchre return revealing your hiding place\!
put retreat
GOTO retry


advance:
var location advance1
var todo $0
advance1:
matchre return ^What do you want to advance towards\?
matchre return ^You begin to advance on
matchre return ^You are already advancing on
matchre return ^You are already at melee with
matchre return ^You begin to stealthily advance on
matchre return ^You spin around to face
matchre return ^You will have to retreat from your current melee first\.
put advance %todo
GOTO retry


swap:
var location swap1
var todo $0
swap1:
matchre return ^You have nothing to swap\!
matchre return ^You move
matchre return ^You turn
matchre return ^You deftly change
matchre return ^You effortlessly switch
matchre return ^You fiercely switch
put swap %todo
GOTO retry


swap_right:
var location swap_right
matchre Swap_get ^You have nothing
matchre return to your righT hand
matchre swap_right to your left hand
put swap
matchwait


swap_Left:
var location swap_Left
matchre Swap_get ^You have nothing
matchre swap_Left to your righT hand
matchre return to your left hand
put swap
matchwait


Swap_get:
GOSUB stow %weapon_type
goto location



block.stop:
var location block.stop
matchre return ^Okay\.
matchre return ^You stop trying to defend against
matchre return ^You aren't trying to defend against a second foe\!
put block stop
GOTO retry


dump.junk:
var location dump.junk
matchre return ^\[You have marked this room to be cleaned by the janitor\. It should arrive shortly.\]
matchre return ^The janitor was recently summoned to this room\. Please wait \d+ seconds\.
matchre return ^You should just kick yourself in the shin\. There is no junk here\.
put dump junk
GOTO retry


flee:
var location flee1
var todo $0
flee1:
matchre return ^You assess your combat situation and realize you don't see anything engaged with you
matchre return ^Your attempt to flee has failed
matchre return ^Your fate is sealed
matchre return ^You melt into the background, convinced that your misdirect was successful
matchre return ^You manage to free yourself from engagement
matchre return ^How do you expect to flee with your
matchre flee2 ^You should stand up first\.
put flee %todo
GOTO retry

flee2:
gosub stand
goto flee1

appraise:
var location appraise1
var todo $0
appraise1:
matchre return ^Taking stock of its
matchre return ^It's dead
matchre return ^Appraise what\?
matchre return ^Roundtime
put appraise %todo
GOTO retry


mark:
var location mark1
var todo $0
mark1:
matchre return ^You carefully size up
matchre return ^It's dead
matchre return ^As you consider
matchre return ^Roundtime
matchre return ^Mark what\?
put mark all %todo
GOTO retry


Attack:
var todo $0
var location attack1
if $stamina < 85 then pause 3
Attack1:
pause .1
if $stamina < 85 then pause 4
matchre advance2 ^It would help if you were closer
matchre advance2 ^You aren't close enough to attack\.
matchre return ^You don't have a weapon to draw with\!
matchre return ^But you don't have a ranged weapon in your hand to fire with\!
matchre return ^But your .+ isn't loaded\!
matchre return ^You need two hands to wield this weapon\!
matchre return ^I could not find what you were referring to\.
matchre return ^At what are you trying to throw
matchre return ^At what are you trying to attack\?
matchre return ^There is nothing else to face
matchre return ^How can you snipe if you are not hidden\?
#matchre return you\.\]
#matchre return position\.\]
#matchre return opponent\.\]
#matchre return advantage\.\]
#matchre return balanced\]
#matchre return balance\]
matchre return ^\[Roundtime
matchre return ^Roundtime:
matchre return is already quite dead\.
put %todo
GOTO retry


advance2:
pause
put engage
pause 2
goto Attack1


Skinning.Arrange:
var location Skinning.Arrange
matchre Skinning.Arrange ^You properly arrange
matchre Skinning.Arrange ^Roundtime
matchre return has already been arranged as much as you can manage\.
matchre return ^Arrange what\?
matchre return ^Try killing the
put arrange
GOTO retry


pre.skin:
if %skin = 0 then goto Return
if %current.stance != custom then GOSUB stance custom
GOSUB Dodge
GOSUB stowing
GOSUB get my skinning knife
return


Skinning:
var location Skinning
matchre return ^.*can't be skinned
matchre return ^Skin what\?
matchre return ^Living creatures often object to being flayed alive\.
matchre return ^There isn't another
matchre return ^You hideously bungle the attempt
matchre return ^Somehow managing to do EVERYTHING wrong
matchre return ^Some days it just doesn't pay to wake up\.
matchre return ^Despite your best efforts,
matchre return ^You bumble the attempt
matchre return ^You claw
matchre return ^You fumble and make an improper cut
matchre return ^Your .* twists and slips in your grip
matchre pre.skin ^You will need a more appropriate tool for skinning
matchre pre.skin ^You must have one hand free to skin\.
matchre pre.skin ^You'll need to have a bladed instrument to skin with\.
matchre Skinning ^You approach \w+'s kill
matchre Skinning.Empty ^You struggle with the
matchre Skinning.Empty ^Roundtime
matchre Skinning.Empty ^A heartbreaking slip
matchre Skinning.Empty ^You skillfully peel
matchre Skinning.Empty ^You skin
matchre Skinning.Empty ^You work diligently at skinning
matchre Skinning.Empty ^You work hard at peeling
matchre Skinning.Empty ^You skillfully peel
matchre Skinning.Empty ^You slice away a bloody trophy
matchre Skinning.Empty ^Some greater force guides your hand
matchre Skinning.Empty ^Moving with impressive skill and grace
put skin
GOTO retry


Skinning.Empty:
GOSUB drop $lefthand
return


Dodge:
var location Dodge
matchre return ^You are already in a position
matchre return ^But you are already dodging\!
matchre return ^You move into a position
matchre return ^You need two hands to wield this weapon\!
matchre return ^Roundtime
put Dodge
GOTO retry


Parry:
var location Parry
matchre return ^You are already in a position
matchre return ^Roundtime:
matchre return ^You are already in a position to parry\.
matchre return ^You need two hands to wield this weapon\!
matchre return ^You move into a position
put Parry
GOTO retry


EXP:
var location EXP1
var todo $0
EXP1:
matchre return ^EXP HELP for more information
matchre return ^Overall state of mind:
put EXP %todo
GOTO retry


INFO:
var location INFO
matchre return ^Wealth:
matchre return ^Concentration :
matchre return ^Debt:
put INFO
GOTO retry


health:
var location health
matchre return.p ^Your body feels
matchre return.p ^Your spirit feels
put health
GOTO retry


mind:
var location mind1
mind1:
matchre return ^EXP HELP for more information
matchre return ^Overall state of mind:
put mind
GOTO retry


shiver:
var location shiver1
matchre return ^A shiver runs up your spine\.
put shiver
GOTO retry


HIDE:
var location HIDE
matchre return reveals you, ruining your hiding attempt
matchre return discovers you, ruining your hiding place\!
matchre return notices your attempt to hide\!
matchre return ^Eh\? But you're already hidden
matchre return ^You melt into the background
matchre return ^You slip into a hiding
matchre return ^You blend in with your surroundings
matchre return ^You can't hide in all this armor\!
matchre return ^Roundtime
put HIDE
GOTO retry


stalk:
var location stalk
matchre return ^Stalk what\?
matchre return ^Stalking is an inherently stealthy endeavor, try being out of sight\.
matchre return ^You are already stalking
matchre return alerts others of your attempt to slip behind
matchre return Roundtime:
put stalk
GOTO retry


stop.stalk:
var location stop.stalk
matchre return ^You stop stalking\.
matchre return ^You're not stalking anything though\.
put stop stalk
GOTO retry

drag:
var location drag1
var todo $0
drag1:
matchre return ^I could not find what you were referring to\.
matchre return ^Don't be silly\!
matchre return ^Roundtime
put drag %todo
GOTO retry


########################
# MOVE #
########

move:
var alsohere no
var People.Room empty
var critter no
var todo $0
move1:
var location moving
moving:
#Running heedlessly over the rough terrain|A bony hand reaches up out of the bog and clamps its cold skeletal fingers|can't seem to make much headway
matchre stand.then.move ^You must be standing to do that\.
matchre stand.then.move ^You can't do that while lying down\.
matchre stand.then.move ^You can't do that while kneeling.
matchre pause.then.move ^You are too tired
matchre pause.then.move ^All this climbing back and forth is getting a bit tiresome
matchre pause.then.move ^Your excessive speed causes you to lose your footing
matchre pause.then.move ^You work against the current
matchre retreat.then.move ^You are engaged to
matchre retreat.then.move ^You'll have better luck if you first retreat
matchre retreat.then.move While in combat
matchre Dig.then.move ^You struggle forward
matchre Dig.then.move ^Like a blind, lame duck, you wallow in the mud
matchre Dig.then.move ^The mud holds you tightly
matchre Dig.then.move ^You find yourself stuck in the mud
matchre stow.them.move ^Free up your hands first
matchre return ^Obvious
matchre return It's pitch dark and you can't see a thing
matchre move.error ^You can't go there\.
matchre move.error ^You can't swim in that direction\.
put %todo
GOTO retry
stand.then.move:
gosub stand
goto move1
pause.then.move:
pause .2
goto moving
retreat.then.move:
GOSUB retreat
goto moving
move.error:
echo * Bad move direction, will try next command in 1 second. *
pause
goto moving
Dig.then.move:
pause .1
put dig %move.direction
pause .5
pause .5
goto moving
stow.them.move:
GOSUB stowing
goto moving


moverandom:
pause .2
var People.Room empty
random 1 8
if %r = 1 and $north = 0 then goto moverandom
if %r = 2 and $northeast = 0 then goto moverandom
if %r = 3 and $east = 0 then goto moverandom
if %r = 4 and $southeast = 0 then goto moverandom
if %r = 5 and $south = 0 then goto moverandom
if %r = 6 and $southwest = 0 then goto moverandom
if %r = 7 and $west = 0 then goto moverandom
if %r = 8 and $northwest = 0 then goto moverandom

if %r = 1 then var direction north
if %r = 2 then var direction northeast
if %r = 3 then var direction east
if %r = 4 then var direction southeast
if %r = 5 then var direction south
if %r = 6 then var direction southwest
if %r = 7 then var direction west
if %r = 8 then var direction northwest

GOSUB move %direction
return


stowing:
if "$lefthand" = "slender khuj" then GOSUB wear my slender khuj
if "$righthand" = "slender khuj" then GOSUB wear my slender khuj
if "$lefthand" = "copperwood longbow" then GOSUB wear my copperwood longbow
if "$righthand" = "copperwood longbow" then GOSUB wear my copperwood longbow
if "$lefthand" = "quarter staff" then GOSUB wear my quarter staff
if "$righthand" = "quarter staff" then GOSUB wear my quarter staff
if "$lefthand" = "halberd" then GOSUB wear my halberd
if "$righthand" = "halberd" then GOSUB wear my halberd
if "$lefthand" = "partisan" then GOSUB wear my partisan
if "$righthand" = "partisan" then GOSUB wear my partisan
if "$righthand" != "Empty" then GOSUB stow Right
if "$lefthand" != "Empty" then GOSUB stow left
return



empty:
if "$lefthand" != "Empty" then GOSUB drop $lefthand
if "$righthand" != "Empty" then GOSUB drop $righthand
return


retry:
matchre location ^\.\.\.wait
matchre location ^Sorry, you may
matchre location ^Sorry, system is slow
matchre location ^You don't seem to be able to move to do that
matchre location.p ^It's all a blur
matchre location.p ^You're unconscious\!
matchre location.p ^You are still stunned
matchre location.p There is no need for violence here\.
matchre location.p ^You can't do that while entangled in a web
matchre location.p ^You struggle against the shadowy webs to no avail\.
matchre location.p ^You attempt that, but end up getting caught in an invisible box\.
matchre location1 ^You should stop playing before you do that\.
matchre location1 ^You are a bit too busy performing to do that\.
matchre location1 ^You are concentrating too much upon your performance to do that\.
matchwait

location.unload:
GOSUB unload
var location stow1
GOSUB stow1
return

location.unload1:
GOSUB unload
var location wear1
GOSUB wear1
return

location1:
GOSUB stop.humming1
goto %location

location.p:
pause

location:
pause .3
goto %location

return.p:
pause .1

return:
return


######################################
# #
# Reconnect Portion and Disconnect #
# #
######################################

exit.now:
exit.full:
echo *** Uh oh, fleeing until you're atk ***
action clear
gosub clear
put look
put health
pause .5
put exit
put #beep
put #script abort reconnect
pause .5
put exit
put #beep
pause .5
put exit
put #beep
pause .5
put #echo >Log1 green *** Logging out exit.full***
put #script abort
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