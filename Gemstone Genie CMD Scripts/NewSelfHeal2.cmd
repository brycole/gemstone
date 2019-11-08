debuglevel 5
SetVariables:
var head (head|forehead|skull)
var nerves (numbness in your|difficulty controlling actions|paralysis of the entire body|severe twitching|some minor twitching)
var skin (skin|rash|sores)
var abdomen (abdomen|emaciated look|look of starvation|death pallor)
var GenLocs (neck|chest|back|right arm|left arm|right hand|left hand|right eye|left eye|right leg|left leg)
var AllLocs (head|skull|forehead|scars|slashes|wounds|neck|away|area|hole|flesh|back|bone|arm|leg|hand|holes|eye|socket|rash|skin|tone|discoloration|body|organs|ears|breathing|pain|bursts|rearranged|look|starvation|weight|abdomen)
var ExtWouMajor (an ugly stump|a pulpy stump|cracked|crushed|shattered|useless|gaping holes|destroyed|gouged|pulpy cavity|sores)
var IntWouMajor (bloated|protruding|appears useless to hold up|shattered rib|bloated and discolored|shattered spinal|bruised and cloudy|bruised and blind|severe paralysis|conplete paralysis)
var ExtScMajor (a stump|flesh stump|mangled and malformed|filled with ugly chunks|nearly all flesh|overgrown with bits|stiff and shriveled|skin loss)
var IntScMajor (blank stare|confused look|severely paralyzed|completely paralyzed|painful|pallor|clouded|blind|general numbness)
var ExtWouModerate (deep cuts|deep slashes|bruised and swollen|swollen and bleeding|large skin rash|body rash)
var IntWouModerate (major swelling|badly bruised|bruised|difficulty controlling actions|partial paralysis|severe twitching)
var ExtScModerate (severe scarring|deeply scarred|scarred gashes|punctured and shriveled|skin discoloration)
var IntScModerate (occasional twitch |partially paralyzed|constant twitching |somewhat emaciated|difficulty moving|clouded eye|fingers and toes|arms and legs)
var ExtWouMinor (cuts and bruises|tiny scratches|minor abrasions|black and blue|small skin rash)
var IntWouMinor (bruised|swelling|twitching)
var ExtScMinor (minor scars|tiny scars|nearly invisible scars|minor scarring|loss of skin tone)
var IntScMinor (numbness|twitching (?!compounded)|twitch\s)
Actions:
action var WoundList $1 when ^You have (?!no)(.+)
action var CurLoc $1 when ^CurLoc is (.*?)(,\s|\.) 
action var WoundList $1 when ^Updated WoundList is .*?(?:,\s(.+)|(\.)$)
matchre WoundSet ^You have (some|a|an|minor|major|slight|numbness|general|difficulty|partial|severe|complete|severely|deep|cuts|gaping|tiny|loss)
matchre Done ^You have no significant injuries\.
put health
matchwait
WoundSet:
if ("%WoundList" = "."|"") then goto Recheck
send #parse CurLoc is %WoundList
pause 0.5
var HealSpot none
if ($mana < 50) then goto WaitForMana
if matchre("%CurLoc", "%skin") && (%HealSpot = none) then var HealSpot skin
elseif matchre("%CurLoc", "%nerves") && (%HealSpot = none) then var HealSpot nerves
elseif matchre("%CurLoc", "%head") && (%HealSpot = none) then var HealSpot head
elseif matchre("%CurLoc", "%abdomen") && (%HealSpot = none) then var HealSpot abdomen
elseif matchre("%CurLoc", ("%GenLocs")) && (%HealSpot = none) then var HealSpot $1
var Severity none
if matchre("%CurLoc", "%IntScMajor") && (%Severity = none) then var Severity (int|scar|major)
elseif matchre("%CurLoc", "%ExtScMajor") && (%Severity = none) then var Severity (ext|scar|major)
elseif matchre("%CurLoc", "%IntWouMajor") && (%Severity = none) then var Severity (int|wound|major)
elseif matchre("%CurLoc", "%ExtWouMajor") && (%Severity = none) then var Severity (ext|wound|major)
elseif matchre("%CurLoc", "%IntScModerate") && (%Severity = none) then var Severity (int|scar|moderate)
elseif matchre("%CurLoc", "%ExtScModerate") && (%Severity = none) then var Severity (ext|scar|moderate)
elseif matchre("%CurLoc", "%IntWouModerate") && (%Severity = none) then var Severity (int|wound|moderate)
elseif matchre("%CurLoc", "%ExtWouModerate") && (%Severity = none) then var Severity (ext|wound|moderate)
elseif matchre("%CurLoc", "%IntScMinor") && (%Severity = none) then var Severity (int|scar|minor)
elseif matchre("%CurLoc", "%ExtScMinor") && (%Severity = none) then var Severity (ext|scar|minor)
elseif matchre("%CurLoc", "%IntWouMinor") && (%Severity = none) then var Severity (int|wound|minor)
elseif matchre("%CurLoc", "%ExtWouMinor") && (%Severity = none) then var Severity (ext|wound|minor)
Casting:
if matchre("%Severity", "scar") then var Spell HS
elseif matchre ("%Severity", "wound") then var Spell HW
if matchre("%Severity", "major") then var Harness 20
elseif matchre("%Severity", "moderate") then var Harness 15
elseif matchre("%Severity", "minor") then var Harness 10
if matchre("%Severity", "int") then var Place int
elseif matchre("%Severity", "ext") then var Place ext
if ("%HealSpot" = "nerves") then var Place int
elseif ("%HealSpot" = "skin") then var Place ext
var CurHarness 0
if ("%Place" = "ext" && "%Spell" = "HW" && %Harness = 20) then
	{
	echo 
	echo *** Saftety Cast on Scars ***
	echo 
	put prep HS
	put har 5
	waitfor Roundtime
	put har 5
	waitfor Roundtime
	put cast %HealSpot %Place
	}
pause 0.5
echo 
echo *** Healing %CurLoc ***
echo 
put prep %Spell
Harness:
if (%CurHarness < %Harness) then
	{
	put har 5
	waitfor Roundtime
	math CurHarness add 5
	goto Harness
	}
Cast:
put cast %HealSpot %Place
send #parse Updated WoundList is %WoundList
pause 0.5
goto WoundSet
WaitForMana:
echo 
echo *** Waiting for Mana ***
echo 
delay 15
goto WoundSet
Recheck:
matchre WoundSet ^You have (some|a|an|minor|major|slight|numbness|general|difficulty|partial|severe|complete|severely|deep|cuts|gaping|tiny)
matchre Done ^You have no significant injuries\.
put health
matchwait
Done:
echo *************** 
echo ***\ All Clean /***
echo ***************
send .fullclean
exit
