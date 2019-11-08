#MyCombat
#debuglevel 5
if_1 goto VarSetting
echo
echo .Combat <weapon/brawling/empath/tm plus optional switch. Also available are lootstyle/backtrain>
echo
echo (example: .Combat backtrain.treasure.jambiya stealth.short bow fullaim chest.crossbow chest stealth.TM fullaim chest.brawling.)
echo *** All groups must be followed by a period, order doesn't matter
echo
echo  Valid switches include:
echo * backtrain
echo * stealth 
echo * fullaim
echo * offhand
echo * necro
echo * body part (any)
echo * thrown
echo * loot style (boxes, treasure, junk, coins, equipment, all)
echo   - if not specified it does default loot
exit

VarSetting:
if ("%1" = "last") && ("$mycombat" != "") then var commands $mycombat
else var commands %0
var oldcommands %commands
var commandcount 0
var commandlength 0
put #var mycombat %commands

#----------------------------
#Set below to suit your needs
#----------------------------
var shield buckler
var offhandweapon hairbrush
var spell bolt
var necrospell acs
var stealthspell vivi
var camb anklet
var cambworn 1
#var spellprep 8
var fullaimprep 8
#var cambcharge 5
var dirtcontainer reticule

#----------------------------
#DO NOT TOUCH the below
#----------------------------
action put #var Guild $1 when Name\: .*? Race\: .*? Guild\: (.+)
action put #var Circle $1 when Gender\: .*? Age\: .*? Circle\: (\d+)
var Magic_Guilds Moon|Warrior|Ranger|Paladin|Cleric|Empath|Bard|Necromancer
put inf
pause .3
if (matchre("$Guild", "(%Magic_Guilds)") then
	{
	var Mage 1
	var cambcharge $Arcana.Ranks
	math cambcharge divide 22
	eval cambcharge replacere("%cambcharge", "\.\d+", "")
	if (%cambcharge < 2) then var cambcharge 2
	var spellprep $Harness_Ability.Ranks
	math spellprep divide 17
	eval spellprep replacere("%spellprep", "\.\d+", "")
	if (%spellprep < 3) then var spellprep 3
	if ("%camb" = "") then
		{
		var camb $camb(0)
		if ("$camb(1)" = "worn") then var cambworn 1
		else var cambworn 0
		}
	}
var waittime 0
var ritprepo on
var combolength 0
var multi 0
var necro 0
var offhand 0
var heal 0
var healspot
var Wtype
var backtrain 0
var stealth 0
var bundling 0
var bundle
var dirt 0
var ammo
var looting 0
var loottype
var homeroom $roomid

if matchre("%commands", "backtrain") then
	{
	var backtrain 1
	eval commands replacere("%commands" "backtrain\." "")
	}
if matchre("%commands", "necro") then
	{
	var necro 1
	eval commands replacere("%commands" "necro\." "")
	}
if matchre("%commands", "offhand") then
	{
	var offhand 1
	eval commands replacere("%commands" "offhand\." "")
	}
if matchre("%commands", "(bundle|bundling)") then
	{
	var bundling 1
	eval commands replacere("%commands" "$1\." "")
	}
if (matchre("%commands", "(all|treasure|box|gem|junk|equipment)\.")) then
	{
	var loottype $1
	eval commands replacere("%commands" "%loottype\." "")
	}
eval commands replace("%commands" "." "|")
eval commandlength count("%commands", "|")
math commandlength subtract 1
if %commandlength > 0 then var multi 1
timer clear
timer start
var Hunt_Timer %t
var PP_Timer %t
var Loot_Timer 0
var target none
var direction
var oppdirection
var stunned $stunned
var Kills $Kills


var hides skin|hide|pelt|fang|tusk|tooth|claw|sac|hoof|scale|scalp
var Two_Handed Twohanded|Quarter|Pike|Halberd|Bow|bow|Empath
var WornWeaps Quarter|Pike|Halberd|Bow|bow
var Bows shortbow|longbow|composite bow|short bow|long bow

Actions:
	action var target $2 when The formation of the target pattern around .*? (\w+) has completed\.|You begin to weave mana lines into a target pattern around .*? (\w+)\.|You turn to face .*? (\w+)\.|You begin to advance on .*? (\w+)\.|You begin to target .*? (\w+)\.
	action var target none when eval $monstercount = 0
	action var waittime $1 when Roundtime.*?(\d+) sec
	action var stunned 1 when eval $stunned = 1
	action var webbed 1 when eval $webbed = 1
	action var heal 1 when ^You have .*? (head|twitching|controlling actions|chest|back|abdomen|pallor|neck|left eye|right eye|left leg|right leg|left arm|right arm|left hand|right hand)
	action var heal 1 when eval $health < 100
	action If ($stunned = 0) then put dance when eval $standing = 0
	
	action if ($standing = 0) then put dance;var stunned 0 when eval $stunned = 0
	action math Kills add 1;send #var Kills %Kills when You search the
	#action math Kills add 1;var looting 0;send #var Kills %Kills when decays away\.
	
	action var direction $1 when The force of the impact sends you flying (\w+)\!
	action var oppdirection east when eval "%direction" = "west"
	action var oppdirection west when eval "%direction" = "east"
	action var oppdirection north when eval "%direction" = "south"
	action var oppdirection south when eval "%direction" = "north"
	action var oppdirection northwest when eval "%direction" = "southeast"
	action var oppdirection northeast when eval "%direction" = "southwest"
	action var oppdirection southwest when eval "%direction" = "northeast"
	action var oppdirection southwest when eval "%direction" = "northwest"
	action if (%stunned = 0) then put %oppdirection;var oppdirection when eval $standing = 1

WeaponGet:
put health
var typecounter 0
var combocounter 0
var thrown 0
var ranged 0
var fullaim 0
var partaim 0
var TM 0
var targetloc
var Wtype

var Weapon %commands(%commandcount)
if matchre("%Weapon", "thrown") then
	{
	var thrown 1
	eval Weapon replacere("%Weapon" "( thrown|thrown )" "")
	}
if matchre("%Weapon", "fullaim") then
	{
	var fullaim 1
	eval Weapon replacere("%Weapon" "( fullaim|fullaim )" "")
	}
if matchre("%Weapon", "partaim") then
	{
	var partaim 1
	eval Weapon replacere("%Weapon" "( partaim|partaim )" "")
	}
if matchre("%Weapon", "stealth") then
	{
	var stealth 1
	eval Weapon replacere("%Weapon" "( stealth|stealth )" "")
	}
if matchre("%Weapon", "dirt") then
	{
	var dirt 1
	eval Weapon replacere("%Weapon" "( dirt|dirt )" "")
	}
if matchre("%Weapon", "(head|chest|left leg|right leg|left arm|right arm|left eye|right eye|neck|abdomen|back)") then
	{
	var targetloc $1
	eval Weapon replacere("%Weapon" "( %targetloc|%targetloc )" "")
	}
if (!matchre("$righthand", "%Weapon")) then gosub Sheathe right
if ("%Weapon" = "TM") then goto WeaponCheck
if (!matchre("$righthand|$lefthand", "%Weapon")) && (!matchre("%Weapon", "(brawl|empath|TM)")) then gosub do wield my %Weapon
if ("$righthand" = "Empty") && (!matchre("%Weapon", "brawl|empath|TM")) then gosub do rem my %Weapon
if matchre("%Weapon", "brawl") then gosub do hold my buckler

WeaponCheck:
#Brawling
if matchre("%Weapon", "(brawl|empath)") then
	{
	var Weapon_Exp Brawling
	if ("$1" = "brawl") then var Combo dodge|gouge|claw|elbow|punch|slam
	else var Combo bob|shove|circle|weave|bob
	goto Melee
	}
#Target Magic
elseif (matchre("%Weapon", "TM")) then
	{
	var Weapon_Exp Targeted_Magic
	var Combo prep|target|cast
	var TM 1
	gosub do "rt" "dodge"
	goto TM
	}
#Backstab
elseif (matchre("%Weapon", "BS|Backstab")) then
	{
	var Weapon_Exp Backstab
	var BS 1
	var Stealth 1
	goto BS
	}
	
#Melee/Pole Weapons
var Types light edged|medium edged|heavy edged|two-handed edged|light blunt|medium blunt|heavy blunt|two-handed blunt|short staff|quarter staff|pike|halberd
var Exp_Types Light_Edged|Medium_Edged|Heavy_Edged|Twohanded_Edged|Light_Blunt|Medium_Blunt|Heavy_Blunt|Twohanded_Blunt|Short_Staff|Quarter_Staff|Pikes|Halberds

#Ranged Weapons
var Ranged_Types short bow|long bow|composite bow|light crossbow|heavy crossbow|staff sling|(?!staff )sling|light thrown|heavy thrown
var RangedExp_Types Short_Bow|Long_Bow|Composite_Bow|Light_Crossbow|Heavy_Crossbow|Staff_Sling|Slings|Light_Thrown|Heavy_Thrown

#Thrown Weapons
var Thrown_Types light thrown|heavy thrown
var ThrownExp_Types Light_Thrown|Heavy_Thrown

TypeActions:
	action var Wtype $1 when (light edged|medium edged|heavy edged|two-handed edged|light blunt|medium blunt|heavy blunt|two-handed blunt|short staff|quarter staff|pike|halberd)
	action if %thrown = 1 then var Wtype $1 when (light thrown|heavy thrown)
	action if "%Wtype" = "" then var Wtype $1 when (short bow|long bow|composite bow|light crossbow|heavy crossbow|staff sling|(?!staff )sling)

put app my %Weapon
waitfor Roundtime

Exp_Setting:
	action remove (short bow|long bow|composite bow|light crossbow|heavy crossbow|staff sling|(?!staff )sling)
	action remove (light thrown|heavy thrown)
	action remove (light edged|medium edged|heavy edged|two-handed edged|light blunt|medium blunt|heavy blunt|two-handed blunt|short staff|quarter staff|pike|halberd)
Exp_Setting2:
if (%thrown = 1) && ("%Thrown_Types(%typecounter)" = "%Wtype") then
	{
	var Weapon_Exp %ThrownExp_Types(%typecounter)
	gosub do "rt" "dodge"
	goto Thrown
	}
if ("%Ranged_Types(%typecounter)" = "%Wtype") then
	{
	var Weapon_Exp %RangedExp_Types(%typecounter)
	var ranged 1
	gosub do "rt" "dodge"
	goto Ranged
	}
if "%Types(%typecounter)" = "%Wtype" then
	{
	var Weapon_Exp %Exp_Types(%typecounter)
	goto Combo_Setting
	}
math typecounter add 1
goto Exp_Setting2

Combo_Setting:
#Melee Weapon Combos
var Twohanded_Edged bob|feint|draw|sweep|slice|chop
var Heavy_Edged bob|feint|draw|sweep|slice|chop
if (matchre("$righthand","adze|axe|cleaver|curlade|cutlass|hanger|hatchet|lata'oloh|mallet|mirror blade|nimsha|parang|sapara|scimitar|scythe-blade|shotel|sword|tei'oloh'ata|telo")) then
	{
	#ME Slice
	var Medium_Edged bob|feint|draw|sweep|slice|chop
	}
elseif (matchre("$righthand","blade|foil|gladius|nambeli|pasabas|rapier|sabre|shashqa|yataghan")) then
	{
	#ME Stab
	var Medium_Edged bob|feint|draw|sweep|thrust
	}
elseif (matchre("$righthand","iltesh")) then
	{
	#ME Iltesh
	var Medium_Edged feint|draw|sweep|slice|chop|lunge|thrust|jab
	}
elseif (matchre("$righthandnoun", "dao|jambiya|kanabu|katar|knife|kounmya|kris|kythe|nehlata|oben|tago|uenlata")) then
	{
	#LE Slice
	var Light_Edged bob|feint|draw|slice|chop|sweep
	}
elseif (matchre("$righthandnoun", "bin|blade|bodkin|dagger|dirk|kasai|kindjal|lata|marlinspike|misericorde|pick|poignard|pugio|shavi|shriike|stiletto|takouba|telek|sword")) then
	{
	#LE Stab
	var Light_Edged bob|feint|lunge|thrust|jab
	}
else
	{
	var Twohanded_Blunt dodge|feint|bash|sweep|draw|swing
	var Heavy_Blunt dodge|feint|bash|sweep|draw|swing
	var Medium_Blunt dodge|feint|bash|sweep|draw|swing
	var Light_Blunt dodge|feint|bash|sweep|draw|jab|swing
	var Halberds dodge|feint|thrust|sweep|chop|jab
	var Pikes dodge|jab|sweep|thrust|lunge
	var Short_Staff bob|thrust|sweep|chop|jab
	var Quarter_Staff bob|thrust|sweep|bash|draw|slice
	}
var Combo %%Weapon_Exp
if (!matchre("$lefthand", "%offhandweapon")) && (!matchre("%Weapon_Exp", "(%Two_Handed)")) && (%offhand = 1) then gosub do wield left my %offhandweapon
goto Melee

Melee:
pause .2
var curlabel Melee
gosub clear
var currentmove %Combo(%combocounter)
eval combolength count("%Combo", "|")
gosub generalcheck
if ((%offhand = 1) && (!matchre("%Weapon_Exp", "(%Two_Handed)"))  && (($Brawling.LearningRate < 34) || ($Offhand_Weapon.LearningRate < 34))) then gosub Offhand
if (((%stealth = 1) && ($Hiding.LearningRate < 34)) && (!matchre("%currentmove", "bob|dodge"))) then gosub Stealth
if "%currentmove" = "" then var currentmove %lastmove
gosub do "rt" "%currentmove"
var lastmove %currentmove
math combocounter add 1
gosub clear
if (%combocounter > %combolength) then var combocounter 0
goto Melee

Thrown:
pause .2
var curlabel Thrown
gosub clear
if (!matchre("$righthand", "%Weapon")) then gosub throwncheck
gosub generalcheck
if ((%offhand = 1) && (($Brawling.LearningRate < 34) || ($Offhand_Weapon.LearningRate < 34))) then gosub Offhand
if (!matchre("$righthand", "%Weapon")) then gosub throwncheck
if ((%stealth = 1) && ($Hiding.LearningRate < 34)) then gosub Stealth
gosub do "rt" "throw %targetloc"
goto Thrown

Ranged:
pause .2
var curlabel Ranged
var ammo
var Combo load|aim|fire
if matchre("%Weapon", "crossbow") then var ammo $xbowammo
elseif matchre("%Weapon", "sling") then var ammo $slingammo
elseif matchre("%Weapon", "(%Bows)") then var ammo $bowammo
elseif matchre("%Weapon", "stone bow") then var ammo $slingammo

	Ranged2:
	gosub clear
	var currentmove %Combo(%combocounter)
	eval combolength count("%Combo", "|")
	gosub generalcheck
	if ("%currentmove" = "load") && (matchre("$roomobjs", "%ammo")) then gosub do get %ammo
	if ("%currentmove" = "fire") then
		{
		if (%fullaim = 1) then waitfor You think you have your best shot possible now.
		if ((%stealth = 1) && ($Hiding.LearningRate < 34)) then
			{
			gosub Stealth
			var currentmove poach
			}
		if (matchre("%Weapon", "(%Bows)")) then gosub Shield unequip
		}
	if (matchre("%currentmove", "(load|fire)") then gosub do "rt" "%currentmove"
	else gosub do %currentmove
	if ("%currentmove" = "fire" && (matchre("%Weapon", "(%Bows)"))) then gosub Shield equip
	var lastmove %currentmove
	math combocounter add 1
	if (%combocounter > %combolength) then var combocounter 0
	goto Ranged2

TM:
var curlabel TM
if ("$preparedspell" != "None") then gosub do release
var combocounter 0

	TM2:
	pause .2
	gosub clear
	var currentmove %Combo(%combocounter)
	eval combolength count("%Combo", "|")
	gosub generalcheck
	if ("%currentmove" = "prep") then
		{
		if ("$Guild" = "Necromancer" && %necro = 1) then
			{
			if ($playercount = 0 || (%playercount = 1 && (matchre("%players", "Fyrn")))) then
				{
				if (($Circle > 30) && (%stealth = 1) && ($Hiding.LearningRate < 34)) then var spell %stealthspell
				else var spell %necrospell
				}
			}
		else var spell %spell
		gosub do %currentmove %spell %spellprep
		}
	elseif ("%currentmove" = "target") then
		{
		if ((%fullaim = 1) && (!matchre("$righthand", "%camb"))) then
			{
			if (%cambworn = 1) then gosub do rem my %camb
			else gosub do get my %camb
			}
		if (%partaim = 1) then delay 4
		gosub do %currentmove %targetloc
		if (%fullaim = 1) then
			{
			if (matchre("$lefthand", "%offhandweapon")) && (%offhand = 1) then gosub do shea my %offhandweapon
			gosub do charge my %camb %cambcharge
			gosub do focus my %camb
			}
		}
	elseif ("%currentmove" = "cast") then
		{
		if ((%stealth = 1) && ($Hiding.LearningRate < 34)) then gosub Stealth
		if (%fullaim = 0) then delay 1
		if (matchre("$preparedspell", "Acid Splash|Vivisection")) then
			{
			if (($playercount = 0) || (%playercount = 1 && (matchre("%players", "Fyrn")))) then gosub do "rt" "%currentmove"
			else gosub do release
			if ($hidden = 1) then gosub do unhide
			}
		else gosub do "rt" "%currentmove"
		}
	if ((%offhand = 1) && (!matchre("%currentmove", "(target|prep)")) && (($Brawling.LearningRate < 34) || ($Offhand_Weapon.LearningRate < 34))) then gosub Offhand
	gosub clear
	var lastmove %currentmove
	math combocounter add 1
	if (%combocounter > %combolength) then var combocounter 0
goto TM2

BS:
pause .2
var curlabel BS
gosub clear
gosub generalcheck
gosub Stealth
gosub do "rt" "backstab"
gosub Offhand
goto BS

Offhand:
if (matchre("$lefthandnoun", "(%hides)")) then gosub do empty left
if ((matchre("$lefthandnoun", "%offhandweapon")) && ($Offhand_Weapon.LearningRate > 33)) then gosub Sheathe left
elseif (($Brawling.LearningRate > 33) && ("$lefthand" = "Empty")) then gosub do wield left my %offhandweapon
gosub do "rt" "feint left"
if (matchre("1", "(%TM|%ranged|%thrown|%BS)")) then gosub do "rt" "dodge"
return

Stealth:
	gosub do "rt" "hide"
	gosub stalk
return

generalcheck:
if %stunned = 1 then gosub recover stunned
if %webbed = 1 then gosub recover webbed
if %homeroom != $roomid then
	{
	put #goto %homeroom
	waitfor You have arrived
	}
if (%Loot_Timer != 0) && (%t > %Loot_Timer) then gosub lootingcheck
if ($monstercount > $MaxCritters) || ($stamina < 80) then gosub retreat
if (matchre("$roomobjs", "(\S+) (that|which) appears dead") && (%looting = 0) then
	{
	var target $1
	gosub dead
	}
if (%multi = 1) && ($%Weapon_Exp.LearningRate > 33) then gosub WeaponSwitch
if ((($Perception.LearningRate < 34) || ($Stalking.LearningRate < 34)) && (%t >= %Hunt_Timer) && (%backtrain = 0) && ($hidden = 0) && (!matchre("%currentmove", "(cast|target)")))  then gosub hunt
if (%Mage = 1) && ($Power_Perceive.LearningRate < 34) && (%t >= %PP_Timer) && ($hidden = 0) && (!matchre("%currentmove", "(cast|target)")) then gosub pp
if $monstercount = 0 && %stunned = 0 && %webbed = 0 then gosub train
if (%Loot_Timer != 0) && (%t > %Loot_Timer) then gosub lootingcheck
if ($stamina < 95) then waiteval $stamina > 97
if ($mana < 95) then waiteval $mana > 97
return

lootingcheck:
var Loot_Timer 0
var looting 0
return

throwncheck:
	put enc
	gosub do get %Weapon
return

do:
var dotype $1
if "%dotype" = "rt" then
	{
	var action $2
	goto dort
	}
var action $0
	do2:
	pause .5
	if %stunned = 1 then gosub stunned
		match advance You aren't close enough
		matchre facenext (You can't cast .*? on yourself|You are not engaged to)
		matchre do2 (\.\.\.wait) 
		match train There is nothing else
		matchre return $prompt
	put %action
	matchwait 1.5
	return

	dort:
	pause .5
	if %stunned = 1 then gosub stunned
		match advance You aren't close enough
		matchre dort (\.\.\.wait)
		match dead balanced.]
		match dead balanced]
		match train There is nothing else
		matchre facenext (You are not engaged to anything|I could not find what)
		matchre return ($prompt|Roundtime|You don't have a spell|already performed this ritual|But you are already)
	put %action
	matchwait %waittime

	return:
	pause .2
	return

facenext:
if $monstercount = 0 then
	{
	delay 5
	goto facenext
	}
gosub do face next
gosub do engage
goto do2

advance:
gosub do advance
if (%dirt = 1 && %stealth = 1 && $hidden = 1) then
	{
	waitfor pole weapon range
	gosub do push my %dirtcontainer
	if ("$Guild" = "Thief") then gosub do "rt" "ambush sight"
	else
		{
		if ("$lefthandnoun" = "dirt") then gosub do "rt" "throw left"
		elseif ("$righthandnoun" = "dirt") then gosub do "rt" "throw right"
		}
	}
waitforre (stops you|You close to melee|You are already at melee|\])
return

recover:
var affliction $1
echo *** You are %affliction!.... waiting it out***
if $%affliction = 1 then waiteval $%affliction = 0
var %affliction 0
return

retreat:
pause .2
	matchre return You retreat from combat|You are already
	matchre retreat You retreat back|Roundtime|\.\.\.wait
put ret
matchwait

stalk:
pause .2
	matchre return (You move into position to stalk|You're already stalking|Stalking is an inherently stealthy|alerts others of your attempt)
	match facenext Stalk what?
	matchre stalk (You fail to|.\.\.wait)
put stalk
matchwait

TimedActions:
	hunt:
		if ($hidden = 1) then return
		gosub do "rt" "hunt"
		var Hunt_Timer %t
		math Hunt_Timer add 90
	return

	pp:
		gosub do "rt" "perc"
		var PP_Timer %t
		math PP_Timer add 60
		if (!matchre("%target", "(none|$)")) then gosub do "rt" "app %target"
	return


MonsterDead:	
	dead:
	gosub clear
	if %stunned then gosub stunned
	if (%thrown = 1) then
		{
		put enc
		gosub do get %Weapon
		}
	var looting 1
	var lefthand ""
	var righthand ""
	if ("$lefthand" != "Empty") && (matchre("$lefthand", "%offhandweapon")) then
		{
		var lefthand $lefthandnoun
		gosub do Sheathe left
		}
	var ritualtarget %target

	rituals:
	if (("$Guild" != "Necromancer") || (%necro = 0)) then goto skinning
	if $Circle < 15 then var rituals preserve
	if $Circle > 14 && $Circle < 20 then var rituals consume|preserve
	if $Circle > 19 then var rituals consume|preserve|arise
	var ritlength
	eval ritlength count("%rituals", "|")
	var ritcount 0
	var ritual
	var failmsg \.\.\.wait|but are unable to discern|but fail to cut its body
	var succeedmsg precise motions with your ritual|precise cuts with your ritual|This corpse has already
	var skipmsg This ritual may only be performed on a|Rituals do not work upon the undead\.|The consumption ritual|A failed or completed ritual|A skinned creature is
	if ("$preparedspell" != "None") then put release
	
		rituals2:
		pause .5
		gosub clear
		if %ritcount > %ritlength then goto skinning
		var ritual %rituals(%ritcount)
		if ("%ritual" = "consume") then
			{
			if (%heal = 0) then
				{
				math ritcount add 1
				goto rituals2
				}
			matchre consume You have .*? (head|twitching|controlling actions|chest|back|abdomen|pallor|neck|left eye|right eye|left leg|right leg|left arm|right arm|left hand|right hand)
			put health
			matchwait 2
			gosub nextritual healed
			}
		elseif ("%ritual" = "arise" && %backtrain = 0) then goto skinning
		if ($Thanatology.LearningRate > 32) then goto skinning

		ritualdo:
		pause .5		
			if (($playercount = 0) || (%playercount = 1 && (matchre("%players", "Fyrn")))) then
				{
				if (matchre("$roomobjs", "(\S+) (that|which) appears dead") then var ritualtarget $1
				matchre ritualdo (%failmsg)
				matchre nextritual (%succeedmsg) 
				matchre skinning (%skipmsg)
				put perform %ritual %ritprepo %ritualtarget
				matchwait
				}

		nextritual:
		if ("$1" = "healed") then
			{
			var ritual "" 
			var heal 0
			}
		if ("%ritual" = "consume") then goto consumecast
		math ritcount add 1
		goto rituals2

		consume:
		var healspot $1
		if (matchre("%healspot", "(twitching|controlling actions)")) then var healspot skin
		elseif ("%healspot" = "pallor") then var healspot abdomen
		gosub do prep cf 10
		goto ritualdo

		consumecast:
		delay 5
		put resync;look
		gosub do cast %healspot
		pause .5
		goto loot

	skinning:
		arrange:
		if %backtrain = 1 then goto loot
			match skin has already been arranged
			matchre loot cannot be skinned|Try killing the|already been skinned|Arrange what\?
			matchre arrange Roundtime|\.\.\.wait
		put arrange 
		matchwait
		skin:
			gosub do "rt" "skin"
			if (%bundling = 0) then
				{
				if (matchre("$lefthand", "(%hides)") then gosub do empty left
				if (matchre("$righthand", "(%hides)")) then gosub do empty right
				}
			else gosub m.inputundling
			pause .2

	loot:
	if ("$preparedspell" != "None") then gosub do release
	put loot %loottype
	if ("%loottype" = "all") then put search %ritprepo %ritualtarget
	wait
		graball:
		if (matchre("$roomobjs", ("\b($gems|$junk)(,|\.)"))) then
			{
			gosub do stow $1
			goto graball
			}

		ammo:
		if ((%ranged = 1) && "%ammo" != "" && (matchre("$roomobjs", "%ammo(,|\.)"))) then
			{
			gosub do stow %ammo
			goto ammo
			}
		if ("%curlabel" = "WeaponSwitch") then return

		coins:
		if matchre("$roomobjs", ("(gold|silver|bronze|copper) (coin|coins)")) then
			{
			gosub do stow $0
			goto coins
			}
			
		lootend:
		if ((%offhand = 1) && ("%lefthand" != "")) then
			{
			gosub do wield left my %offhandweapon
			var lefthand ""
			}
		if ("%righthand" != "") then gosub do wield my %Weapon
		gosub clear
		var Loot_Timer %t
		math Loot_Timer add 5
		goto %curlabel

Shield:
if ("$0" = "unequip") then var eactions remove|stow
else var eactions get|wear
gosub Retreat
gosub do %eactions(0) my %shield
gosub do %eactions(1) my %shield
return

Sheathe:
var hand $1
if (matchre("%hand", "(left|both)") then
	{
	if (!matchre("$lefthand", "Empty") then
		{
		if (matchre("%Weapon_Exp", "Brawling")) then gosub do wear my %shield
		if (matchre("$lefthand", "%offhandweapon")) then gosub do sheathe left
		if (!matchre("$lefthand", "Empty") then gosub do stow my $lefthandnoun
		}
	}
if (matchre("%hand", "(right|both)") then
	{
	if (!matchre("$righthand", "Empty") then
		{
		if (matchre("$righthand", "%camb")) then
			{
			if (%cambworn = 1) then gosub do wear my %camb
			else gosub do stow my %camb
			}
		if ((matchre("%Weapon_Exp", "(Staff$|Halberds$|Pikes$|Bow$)")) || (matchre("$righthand", "bundle"))) then gosub do wear my $righthandnoun
		else gosub do sheathe right
		if (!matchre("$righthand", "Empty") then gosub do stow my $righthandnoun
		}
	}
return

Bundling:
	bundlecheck:
	if ("%bundle" = "") then
		{
		var bundleaction
		action var bundleaction $1 when (wearing|have|pull)
		gosub do pull bundle
		wait
		if ("%bundleaction" = "wearing") then var bundle worn
		if ("%bundleaction" = "have") then var bundle ground
		if ("%bundleaction" = "pull") then var bundle none
		action remove (wearing|have|pull)
		}
	if ("%bundle" = "worn") then
		{
		if (!matchre("Empty", "($lefthand|$righthand)")) then
			{
			var righthand $righthandnoun
			gosub Sheathe right
			}
		gosub do rem my bundle
		}
	if ("%bundle" = "none") then goto rope

	bundledo:
	if (matchre("$righthand", "%Weapon")) then
		{
		var righthand $righthandnoun
		gosub Sheathe right
		}
	if ("%bundle" = "ground") && (!matchre("$lefthand|$righthand", "(bundle|rope)")) then gosub do get bundle
		match bundledrop You stuff
		matchre rope (a new bundle|You try to stuff)
	put bundle
	matchwait
	
	bundledrop:
	gosub do drop my bundle
	var bundle ground
	pause .5
	if (("%righthand" != "") && ("$righthand" = "Empty")) then
		{
		gosub do wield my %Weapon
		var righthand
		}
	return

	rope:
	if (matchre("$lefthand|$righthand", "bundle")) then gosub do drop my bundle
	if ("$righthand" != "Empty") then 
		{
		var righthand $righthandnoun
		gosub Sheathe right
		}
		match norope What were you referring to?
	put get my rope
	matchwait .5
	goto bundledo
	
	norope:
	var bundling 0
	return

WeaponSwitch:
var curlabel WeaponSwitch
if (matchre("%Weapon_Exp", "(Bow|Sling|bow)")) then gosub do "rt" "unload"
if (%ranged = 1) && (%thrown != 1) && (matchre("$roomobjs", "%ammo")) then gosub ammo
if (matchre("%Weapon_Exp", "(Bow|Sling)")) then gosub Shield equip
math commandcount add 1
if (%commandcount > %commandlength) then var commandcount 0
gosub Sheathe both
gosub clear
goto WeaponGet

NoMonsters:		
	train:
	var train_actions app my gem pouch|collect rock
	var traincount 0
	var righthand $righthandnoun
	var lefthand $lefthandnoun
	if (matchre("Empty", "(%righthand|%lefthand)")) then
		{
		gosub Sheathe both
		}

	train2:
	pause .2
	var train %train_actions(%traincount)
	if $monstercount > 0 then goto trainend
	gosub do "rt" "%train"
	if ("%train" = "collect rock") then gosub do kick pile
	math traincount add 1
	if ("%train_actions(%traincount)" = "") then var traincount 0
	goto train2

	trainend:
	if ("%righthand" != "") then
		{
		if (matchre("%Weapon_Exp", "(%WornWeaps)")) then gosub do rem my %righthand
		else gosub do wield my %righthand
		}
	if ("%lefthand" != "") then
		{
		if (matchre("%offhandweapon", "%lefthand")) then gosub do wield my %offhandweapon
		else
			{
			gosub do wield my %lefthand
			gosub do rem my %lefthand
			}
		}
	pause .2
	return