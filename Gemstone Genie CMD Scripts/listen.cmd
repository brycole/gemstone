## Variables you can change
var autolisten YES
var autolistenmessage
var BarbLearnMagic NO
var PaladinLearnStealing NO

## This are your options for what sort of classes you want to listen to compared to the skill you know already
## Just pick which options you want or pick all of them, make sure they have a | between them or it wont work right
## Put what you choose into the "var complexclass" below
## (Still not a complete list, I think)
##
##	extremely simplistic|simplistic|basic|intermediate|advanced|extremely advanced
##

var complexclass advanced|extremely advanced

##

## If you want to listen to people with the same amount of skill as yourself change the NO on the variable teachnormal below to YES
##

var teachnormal YES

##




## ------------------------------------------------------------------------
## DONT MESS WITH EVERYTHING AFTER HERE UNLESS YOU KNOW WHAT YOUR DOING
## ------------------------------------------------------------------------
eval autolisten toupper(%autolisten)
eval BarbLearnMagic toupper(%BarbLearnMagic)
eval PaladinLearnStealing toupper(%PaladinLearnStealing)
eval teachnormal toupper(%teachnormal)
action var class $1 when Guild: (.+)
put info
waitfor Gender:

if (("%class" = "Barbarian") && ("%BarbLearnMagic" = "YES")) then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
else
	{
	if "%class" = "Barbarian" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
	}
if "%class" = "Bard" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Musical Theory|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "Cleric" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "Empath" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Empathy|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "Moon Mage" then var teachableskills Animal Lore|Appraisal|Astrology|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "None Yet" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if (("%class" = "Paladin") && ("%PaladinLearnStealing" = "YES")) then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
else
	{
	if "%class" = "Paladin" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
	}
if "%class" = "Ranger" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "Thief" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "Trader" then var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Trading|Twohanded Blunt|Twohanded Edged|Vocals|Winds
if "%class" = "Warrior Mage" then var var teachableskills Animal Lore|Appraisal|Bone Armor|Brawling|Climbing|Cloth Armor|Composite Bow|Disarm Traps|Escaping|Evasion|First Aid|Foraging|Halberds|Harness Ability|Heavy Blunt|Heavy Chain|Heavy Crossbow|Heavy Edged|Heavy Plate|Heavy Thrown|Hiding|Leather Armor|Light Blunt|Light Chain|Light Crossbow|Light Edged|Light Plate|Light Thrown|Lockpicking|Long Bow|Magical Devices|Mechanical Lore|Medium Blunt|Medium Edged|Multi Opponent|Offhand Weapon|Parry Ability|Perception|Percussions|Pikes|Power Perceive|Primary Magic|Quarter Staff|Scholarship|Scouting|Shield Usage|Short Bow|Skinning|Slings|Staff Slings|Stalking|Stealing|Strings|Swimming|Targeted Magic|Teaching|Twohanded Blunt|Twohanded Edged|Vocals|Winds

if %teachnormal = YES then action var classname%assess $1;var %assess $2;math assess add 1;math classcount add 1 when (.+) is teaching a class on (%teachableskills) which is still open to new students
action var classname%assess $1;var %assess $3;math assess add 1;math classcount add 1 when (.+) is teaching a class on (%complexclass) \(compared to what you already know\) (%teachableskills) which is still open to new students
action goto pauseclass when No one seems to be teaching
action goto unvarreset when Your teacher is not here, so you are no longer learning anything|isn't teaching a class|isn't teaching you anymore|Your teacher has left, so you are no longer learning anything
action var Listening YES when You are in this class|You are observing this class
action var Listening NO when You assess the teaching environment
if %autolisten = YES then action var assess 1;var classsort 1;var classcount 0;var classname%assess $1;var %assess $2;math assess add 1;math classcount add 1;goto expall when (.+) begins to lecture you on the proper usage of the (.+) skill.
action if $1 = %currentname then goto unvarreset when (.+) stops teaching
action if $1 = %currentname then goto unvarreset when (.+) just (went|left)
var varnumber 1

unvar:
unvar %varnumber
unvar classname%varnumber
unvar %varnumber_Ranks
unvar %varnumber_rankname
unvar %varnumber_name
unvar %varnumber_class
unvar skill%varnumber
unvar skill%varnumber_name
unvar skill%varnumber_rankname
delay 0.1
if %varnumber != 9 then math varnumber add 1
else goto start
goto unvar

start:
var assess 1
var classsort 1
var classcount 0
assess:
put assess teach
match expall Roundtime
matchre assess ^\.\.\.wait|^Sorry, you may only type
matchwait
expall:
put exp all 0
waitfor EXP HELP for more information
goto class_sort

pauseclass:
Echo *** No Class Found ***
if ((%autolisten = YES) && ("$roomplayers" != "")) then put %autolistenmessage
delay 180
goto start

longpause:
Echo *** Pausing because Teaching and Skills being taught are both mindlocked ***
delay 300
goto start

class_sort:
delay 0.1
if "%%classsort" = "\%%classsort" then 
	{
	var skill1 9999
	var skill2 9999
	var skill3 9999
	var skill4 9999
	var skill5 9999
	var skill6 9999
	var skill7 9999
	var skill8 9999
	var skill9 9999
	var sort 1
	var current 0
	goto sortskill
	}
if %%classsort = Animal Lore then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Animal_Lore.LearningRate
	var %classsort_Ranks $Animal_Lore.Ranks
	var %classsort_class Animal Lore
	math classsort add 1
	goto class_sort
	}
if %%classsort = Appraisal then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Appraise.LearningRate
	var %classsort_Ranks $Appraise.Ranks
	var %classsort_class Appraise
	math classsort add 1
	goto class_sort
	}
if %%classsort = Astrology then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Astrology.LearningRate
	var %classsort_Ranks $Astrology.Ranks
	var %classsort_class Astrology
	math classsort add 1
	goto class_sort
	}
if %%classsort = Bone Armor then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Bone_Armor.LearningRate
	var %classsort_Ranks $Bone_Armor.Ranks
	var %classsort_class Bone Armor
	math classsort add 1
	goto class_sort
	}
if %%classsort = Brawling then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Brawling.LearningRate
	var %classsort_Ranks $Brawling.Ranks
	var %classsort_class Brawling
	math classsort add 1
	goto class_sort
	}
if %%classsort = Climbing then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Climbing.LearningRate
	var %classsort_Ranks $Climbing.Ranks
	var %classsort_class Climbing
	math classsort add 1
	goto class_sort
	}
if %%classsort = Cloth Armor then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Cloth_Armor.LearningRate
	var %classsort_Ranks $Cloth_Armor.Ranks
	var %classsort_class Cloth Armor
	math classsort add 1
	goto class_sort
	}
if %%classsort = Composite Bow then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Composite_Bow.LearningRate
	var %classsort_Ranks $Composite_Bow.Ranks
	var %classsort_class Composite Bow
	math classsort add 1
	goto class_sort
	}
if %%classsort = Disarm Traps then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Disarm_Traps.LearningRate
	var %classsort_Ranks $Disarm_Traps.Ranks
	var %classsort_class Disarm Traps
	math classsort add 1
	goto class_sort
	}
if %%classsort = Empathy then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Empathy.LearningRate
	var %classsort_Ranks $Empathy.Ranks
	var %classsort_class Empathy
	math classsort add 1
	goto class_sort
	}
if %%classsort = Escaping then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Escaping.LearningRate
	var %classsort_Ranks $Escaping.Ranks
	var %classsort_class Escaping
	math classsort add 1
	goto class_sort
	}
if %%classsort = Evasion then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Evasion.LearningRate
	var %classsort_Ranks $Evasion.Ranks
	var %classsort_class Evasion
	math classsort add 1
	goto class_sort
	}
if %%classsort = First Aid then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname First_Aid.LearningRate
	var %classsort_Ranks $First_Aid.Ranks
	var %classsort_class First Aid
	math classsort add 1
	goto class_sort
	}
if %%classsort = Foraging then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Foraging.LearningRate
	var %classsort_Ranks $Foraging.Ranks
	var %classsort_class Foraging
	math classsort add 1
	goto class_sort
	}
if %%classsort = Halberds then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Halberds.LearningRate
	var %classsort_Ranks $Halberds.Ranks
	var %classsort_class Halberds
	math classsort add 1
	goto class_sort
	}
if %%classsort = Harness Ability then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Harness_Ability.LearningRate
	var %classsort_Ranks $Harness_Ability.Ranks
	var %classsort_class Harness Ability
	math classsort add 1
	goto class_sort
	}
if %%classsort = Heavy Blunt then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Heavy_Blunt.LearningRate
	var %classsort_Ranks $Heavy_Blunt.Ranks
	var %classsort_class Heavy Blunt
	math classsort add 1
	goto class_sort
	}
if %%classsort = Heavy Chain then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Heavy_Chain.LearningRate
	var %classsort_Ranks $Heavy_Chain.Ranks
	var %classsort_class Heavy Chain
	math classsort add 1
	goto class_sort
	}
if %%classsort = Heavy Crossbow then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Heavy_Crossbow.LearningRate
	var %classsort_Ranks $Heavy_Crossbow.Ranks
	var %classsort_class Heavy Crossbow
	math classsort add 1
	goto class_sort
	}
if %%classsort = Heavy Edged then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Heavy_Edged.LearningRate
	var %classsort_Ranks $Heavy_Edged.Ranks
	var %classsort_class Heavy Edged
	math classsort add 1
	goto class_sort
	}
if %%classsort = Heavy Plate then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Heavy_Plate.LearningRate
	var %classsort_Ranks $Heavy_Plate.Ranks
	var %classsort_class Heavy Plate
	math classsort add 1
	goto class_sort
	}
if %%classsort = Heavy Thrown then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Heavy_Thrown.LearningRate
	var %classsort_Ranks $Heavy_Thrown.Ranks
	var %classsort_class Heavy Thrown
	math classsort add 1
	goto class_sort
	}
if %%classsort = Hiding then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Hiding.LearningRate
	var %classsort_Ranks $Hiding.Ranks
	var %classsort_class Hiding
	math classsort add 1
	goto class_sort
	}
if %%classsort = Leather Armor then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Leather_Armor.LearningRate
	var %classsort_Ranks $Leather_Armor.Ranks
	var %classsort_class Leather Armor
	math classsort add 1
	goto class_sort
	}
if %%classsort = Light Blunt then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Light_Blunt.LearningRate
	var %classsort_Ranks $Light_Blunt.Ranks
	var %classsort_class Light Blunt
	math classsort add 1
	goto class_sort
	}
if %%classsort = Light Chain then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Light_Chain.LearningRate
	var %classsort_Ranks $Light_Chain.Ranks
	var %classsort_class Light Chain
	math classsort add 1
	goto class_sort
	}
if %%classsort = Light Crossbow then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Light_Crossbow.LearningRate
	var %classsort_Ranks $Light_Crossbow.Ranks
	var %classsort_class Light Crossbow
	math classsort add 1
	goto class_sort
	}
if %%classsort = Light Edged then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Light_Edged.LearningRate
	var %classsort_Ranks $Light_Edged.Ranks
	var %classsort_class Light Edged
	math classsort add 1
	goto class_sort
	}
if %%classsort = Light Plate then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Light_Plate.LearningRate
	var %classsort_Ranks $Light_Plate.Ranks
	var %classsort_class Light Plate
	math classsort add 1
	goto class_sort
	}
if %%classsort = Light Thrown then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Light_Thrown.LearningRate
	var %classsort_Ranks $Light_Thrown.Ranks
	var %classsort_class Light Thrown
	math classsort add 1
	goto class_sort
	}
if %%classsort = Lockpicking then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Lockpicking.LearningRate
	var %classsort_Ranks $Lockpicking.Ranks
	var %classsort_class Lockpicking
	math classsort add 1
	goto class_sort
	}
if %%classsort = Long Bow then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Long_Bow.LearningRate
	var %classsort_Ranks $Long_Bow.Ranks
	var %classsort_class Long Bow
	math classsort add 1
	goto class_sort
	}
if %%classsort = Magical Devices then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Magical_Devices.LearningRate
	var %classsort_Ranks $Magical_Devices.Ranks
	var %classsort_class Magical Devices
	math classsort add 1
	goto class_sort
	}
if %%classsort = Mechanical Lore then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Mechanical_Lore.LearningRate
	var %classsort_Ranks $Mechanical_Lore.Ranks
	var %classsort_class Mechanical Lore
	math classsort add 1
	goto class_sort
	}
if %%classsort = Medium Blunt then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Medium_Blunt.LearningRate
	var %classsort_Ranks $Medium_Blunt.Ranks
	var %classsort_class Medium Blunt
	math classsort add 1
	goto class_sort
	}
if %%classsort = Medium Edged then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Medium_Edged.LearningRate
	var %classsort_Ranks $Medium_Edged.Ranks
	var %classsort_class Medium Edged
	math classsort add 1
	goto class_sort
	}
if %%classsort = Multi Opponent then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Multi_Opponent.LearningRate
	var %classsort_Ranks $Multi_Opponent.Ranks
	var %classsort_class Multi Opponent
	math classsort add 1
	goto class_sort
	}
if %%classsort = Musical Theory then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Musical_Theory.LearningRate
	var %classsort_Ranks $Musical_Theory.Ranks
	var %classsort_class Musical Theory
	math classsort add 1
	goto class_sort
	}
if %%classsort = Offhand Weapon then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Offhand_Weapon.LearningRate
	var %classsort_Ranks $Offhand_Weapon.Ranks
	var %classsort_class Offhand Weapon
	math classsort add 1
	goto class_sort
	}
if %%classsort = Parry Ability then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Parry_Ability.LearningRate
	var %classsort_Ranks $Parry_Ability.Ranks
	var %classsort_class Parry Ability
	math classsort add 1
	goto class_sort
	}
if %%classsort = Perception then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Perception.LearningRate
	var %classsort_Ranks $Perception.Ranks
	var %classsort_class Perception
	math classsort add 1
	goto class_sort
	}
if %%classsort = Percussions then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Percussions.LearningRate
	var %classsort_Ranks $Percussions.Ranks
	var %classsort_class Percussions
	math classsort add 1
	goto class_sort
	}
if %%classsort = Pikes then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Pikes.LearningRate
	var %classsort_Ranks $Pikes.Ranks
	var %classsort_class Pikes
	math classsort add 1
	goto class_sort
	}
if %%classsort = Power Perceive then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Power_Perceive.LearningRate
	var %classsort_Ranks $Power_Perceive.Ranks
	var %classsort_class Power Perceive
	math classsort add 1
	goto class_sort
	}
if %%classsort = Primary Magic then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Primary_Magic.LearningRate
	var %classsort_Ranks $Primary_Magic.Ranks
	var %classsort_class Primary Magic
	math classsort add 1
	goto class_sort
	}
if %%classsort = Quarter Staff then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Quarter_Staff.LearningRate
	var %classsort_Ranks $Quarter_Staff.Ranks
	var %classsort_class Quarter Staff
	math classsort add 1
	goto class_sort
	}
if %%classsort = Scholarship then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Scholarship.LearningRate
	var %classsort_Ranks $Scholarship.Ranks
	var %classsort_class Scholarship
	math classsort add 1
	goto class_sort
	}
if %%classsort = Scouting then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Scouting.LearningRate
	var %classsort_Ranks $Scouting.Ranks
	var %classsort_class Scouting
	math classsort add 1
	goto class_sort
	}
if %%classsort = Shield Usage then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Shield_Usage.LearningRate
	var %classsort_Ranks $Shield_Usage.Ranks
	var %classsort_class Shield Usage
	math classsort add 1
	goto class_sort
	}
if %%classsort = Short Bow then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Short_Bow.LearningRate
	var %classsort_Ranks $Short_Bow.Ranks
	var %classsort_class Short Bow
	math classsort add 1
	goto class_sort
	}
if %%classsort = Skinning then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Skinning.LearningRate
	var %classsort_Ranks $Skinning.Ranks
	var %classsort_class Skinning
	math classsort add 1
	goto class_sort
	}
if %%classsort = Slings then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Slings.LearningRate
	var %classsort_Ranks $Slings.Ranks
	var %classsort_class Slings
	math classsort add 1
	goto class_sort
	}
if %%classsort = Staff Slings then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Staff_Slings.LearningRate
	var %classsort_Ranks $Staff_Slings.Ranks
	var %classsort_class Staff Slings
	math classsort add 1
	goto class_sort
	}
if %%classsort = Stalking then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Stalking.LearningRate
	var %classsort_Ranks $Stalking.Ranks
	var %classsort_class Stalking
	math classsort add 1
	goto class_sort
	}
if %%classsort = Stealing then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Stealing.LearningRate
	var %classsort_Ranks $Stealing.Ranks
	var %classsort_class Stealing
	math classsort add 1
	goto class_sort
	}
if %%classsort = Strings then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Strings.LearningRate
	var %classsort_Ranks $Strings.Ranks
	var %classsort_class Strings
	math classsort add 1
	goto class_sort
	}
if %%classsort = Swimming then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Swimming.LearningRate
	var %classsort_Ranks $Swimming.Ranks
	var %classsort_class Swimming
	math classsort add 1
	goto class_sort
	}
if %%classsort = Targeted Magic then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Targeted_Magic.LearningRate
	var %classsort_Ranks $Targeted_Magic.Ranks
	var %classsort_class Targeted Magic
	math classsort add 1
	goto class_sort
	}
if %%classsort = Teaching then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Teaching.LearningRate
	var %classsort_Ranks $Teaching.Ranks
	var %classsort_class Teaching
	math classsort add 1
	goto class_sort
	}
if %%classsort = Trading then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Trading.LearningRate
	var %classsort_Ranks $Trading.Ranks
	var %classsort_class Trading
	math classsort add 1
	goto class_sort
	}
if %%classsort = Twohanded Blunt then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Twohanded_Blunt.LearningRate
	var %classsort_Ranks $Twohanded_Blunt.Ranks
	var %classsort_class Twohanded Blunt
	math classsort add 1
	goto class_sort
	}
if %%classsort = Twohanded Edged then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Twohanded_Edged.LearningRate
	var %classsort_Ranks $Twohanded_Edged.Ranks
	var %classsort_class Twohanded Edged
	math classsort add 1
	goto class_sort
	}
if %%classsort = Vocals then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Vocals.LearningRate
	var %classsort_Ranks $Vocals.Ranks
	var %classsort_class Vocals
	math classsort add 1
	goto class_sort
	}
if %%classsort = Winds then 
	{
	var %classsort_name %classname%classsort
	var %classsort_rankname Winds.LearningRate
	var %classsort_Ranks $Winds.Ranks
	var %classsort_class Winds
	math classsort add 1
	goto class_sort
	}

sortskill:
delay 0.1
math current add 1
var skillcheck %skill%current
if %%sort_Ranks = \%%sort_Ranks then goto listen
else
}
if %%sort_Ranks < %skillcheck then
	{
	var shift %current
	math current subtract 1
	var next %current
	math current add 1
	gosub shift
	var skill%current %%sort_Ranks
	var skill%current_name %%sort_name
	var skill%current_rankname %%sort_rankname
	var skill%current_class %%sort_class
	var current 0
	math sort add 1
	goto sortskill
	}
else
	{
	goto sortskill
	}
}
goto listen

shift:
delay 0.1
if %sort = %shift then return
math shift add 1
math next add 1
var skillshift %skill%next
var skillshift_name %skill%next_name
var skillshift_rankname %skill%next_rankname
var skillshift_class %skill%next_class
var skill%shift %skillshift
var skill%shift_name %skillshift_name
var skill%shift_rankname %skillshift_rankname
var skill%shift_class %skillshift_class
goto shift

listen:
delay 0.1
if %Listening = YES then
	{
	put stop listen
	wait
	}
if %skill1_rankname = 9999_rankname then goto pauseclass
if ($%skill1_rankname < 12) then 
	{
	var currentlisten %skill1_rankname
	var currentname %skill1_name
	var currentclass %skill1_class
	VAR TEACH NO
	put listen to %skill1_name
	}
else
	{
	if (($%skill1_rankname = 12) && ($Teaching.LearningRate = 12) && (%classcount = 1)) then goto longpause
	if (($%skill1_rankname = 12) && (%classcount = 1)) then
		{
		var currentname %skill1_name
		var TEACH YES
		put listen to %skill1_name observe
		}
	else
		{
		if ($%skill2_rankname < 12) then
			{
			VAR currentlisten %skill2_rankname
			var currentname %skill2_name
			var currentclass %skill2_class
			VAR TEACH NO
			put listen to %skill2_name
			}
		else
			{
			If (($%skill2_rankname = 12) && (%classcount > 2)) then
				{
				var currentlisten %skill3_rankname
				var currentname %skill3_name
				var currentclass %skill3_class
				VAR TEACH NO
				put listen to %skill3_name
				}
				else
					{
					if (($%skill1_rankname = 12) && (($%skill2_rankname = 12) && ($%skill3_rankname = 12) && ($Teaching.LearningRate = 12) && (%classcount >= 3)) then goto longpause
					if (($%skill3_rankname = 12) && (%classcount = 3)) then
						{
						var currentname %skill3_name
						var TEACH YES
						put listen to %skill3_name observe
						}
					}
			else
				{
				if (($%skill1_rankname = 12) && (($%skill2_rankname = 12) && ($Teaching.LearningRate = 12) && (%classcount = 2)) then goto longpause
				if (($%skill2_rankname = 12) && (%classcount = 2) then
					{
					var currentname %skill2_name
					var TEACH YES
					put listen to %skill2_name observe
					}
				}
			}
		}
	}
match askperson invitation if you wish to join this class.
match pause You begin to listen
match unvarreset I could not find who you were
matchre listen ^\.\.\.wait|^Sorry, you may only type
matchwait

askperson:
delay 0.1
put whisper %currentname May I listen to your class?
if %autolisten = YES then goto pause
else
	{
	waitforre (.+) begins to lecture you on the proper usage of the (.+) skill.
	if TEACH = YES then 
		{
		put listen to %currentname observe
		goto pause
		}
	else
		{
		put listen to %currentname
		goto pause
		}

pause:
delay 60
put exp
waitfor EXP HELP for more information
if $%currentlisten = 0 then 
	{
	math pausecount add 1
	if %pausecount = 5 then
		{
		var pausecount 0
		goto unvarreset
		}
	}
elseif %pausecount != 0 then var pausecount 0
if %TEACH = YES then
	{
	echo *** Currently observing %currentname teach %currentclass ***
	if $Teaching.LearningRate = 12 then goto unvarreset
	}
else
	{
	echo *** Currently listening to %currentname teach %currentclass ***
	if $%currentlisten = 12 then goto unvarreset
	}
goto pause

unvarreset:
var varnumber 1
goto unvar