#debuglevel 10
##Specific Spell Info
##Cage Of Light	-	Must have the Time & Moon Plugin written by pbombard, and make sure you have
##					Log Game Events checked in the options for that plugin.
##Benediction	-	Make sure you set the buff.immortal variable
##Rutilor's Edge	-	Currently does not support offhand use.
##Bond Armaments	-	Currently does not support offhand use.
##Quicken the Earth - Should work
##SET THE FOLLOWING VARIABLES IN THE SCRIPT THAT IS INCLUDING THIS ONE
##
##buff.trace	-	Set to YES if you are a Paladin with the Glyph of Mana ability, and you wish to use it in this script.
##					set to NO if you don't want to use it
##buff.spell	-	These are the spells you wish to cast in array form.  The spells must be listed to correspond with the variables for the spells
##					and this is usually the shortened version of the spell name.  ie.  COUR = Courage, AS = Anti Stun,  so the variable would be
##					COUR|AS
##buff.prep		-	This is the amount of mana you want to prep the corresponding spell to.  This is also in array form.  Working with the
##					above example where buff.spell is COUR|AS  buff.prep 12|10  would prepare courage at 12, and anti stun at 10
##buff.charge.total	-	This is the amount you're going to charge a cambrinth item to.  Array format
##buff.charge.increment	-	This is how much the script will charge the cambrinth per attempt, up to the max. You can either put seperate amounts for each spell
##							or you can put only 1 amount and that will work for all spells.  Note, if you do it in array format, but put more or less than the number of spells
##							you're using, it will assume you want to use 1 number for all spells, which will be the first one in the array.
##							Ie.  buff.charge.increment 12|5|7 or buff.charge.increment 5
##buff.harness	-	Yes or No, whether to harness or not in script
##buff.harness.total	-	This is the total amount you are going to harness to.  Can be used in addition to or in place of charging cambrinth
##buff.harness.incriment	-	This is the amount to harness each time up to buff.harness.total amount.   You can either put seperate amounts for each spell
##							or you can put only 1 amount and that will work for all spells.  Note, if you do it in array format, but put more or less than the number of spells
##							you're using, it will assume you want to use 1 number for all spells, which will be the first one in the array.
##							Ie.  buff.harness.increment 12|5|7 or buff.harness.increment 5
##buff.cambrinth	-	The verb for whatever cambrinth item you are using.  Set to NO to use no cambrinth.
##buff.worn	-	Is the cambrinth item specified above worn
##buff.remove	-	If the cambrinth is set as worn in the above script, do you need to remove it to charge/invoke.  Need roughly 180 ranks or more of
##					arcana to use a worn cambrinth item w/o removing it.
##buff.prep.message	-	The messaging for your character when they begin to prepare a spell.
##buff.continue	-	Set to yes if you want the script to cast all spells before returning to the script that included this one.
##					IE. If you set to no in geniehunter it will cast a single spell, then return to geniehunter.  If set to yes, it will cast
##					every spell in the list before returning to geniehunter.  Only set it to yes if you are certain you have enough mana attunement
##					to handle casting all the spells w/o a break to regain attunement.  Not useful in geniehunter, useful for other scripts.
##buff.manalevel	-	If using Glyph of Mana it will trace at this level or lower
##buff.immortal	-	Use this to set which Immortal to cast Benediction at.
##buff.ba.thrown	-	Set to Yes or No.  Yes only uses the Bond Armaments spell on thrown weapons, No uses it on all
##OM.DELAY	-	The number of seconds the script will wait before renewing OM.  Will not renew if spell ends.  Number.
##minprep	-	Global variable.  The number of seconds to wait before casting a spell.  Note, due to harnessing or charging/focusing roundtimes
##				this script might go beyond this number before casting.
##var buff.trace 1
##var buff.spell COURAGE|DA|HES|RW|SR
##var buff.prep $min.courage|$min.da|$min.hes|$min.rw|$min.sr
##var buff.charge.total 20|20|20|20|20
##var buff.spell CLARITY|COURAGE|DA|DIG|HES|MO|RUE|RW|SR|EASE|AS|BA|LW|MAF|AA|SP
##var buff.prep $min.clarity|$min.courage|$min.da|$min.dig|$min.hes|$min.mo|$min.rue|$min.rw|$min.sr|$min.ease|$min.as|$min.ba|$min.lw|$min.maf|$min.aa|$min.sp
##var buff.charge.total $max.clarity|$max.courage|$max.da|$max.dig|$max.hes|$max.mo|$max.rue|$max.rw|$max.sr|$max.ease|$max.as|$max.ba|$max.lw|$max.maf|$max.aa|$max.sp
##var buff.charge.increment 10
##var buff.harness.total 0|0|0|0|0|0|0
##var buff.harness.increment 10
##var buff.cambrinth $cambrinth
##var buff.worn YES
##var buff.remove NO
##var buff.harness NO
##var buff.prep.message You begin chanting a prayer to invoke
##var buff.continue no
##var buff.held NO
##var buff.manalevel 10
##var buff.ba.thrown yes
##put #var minprep 20



buff.start:
counter set 0
action #send 5 $lastcommand when ^You are still stunned
action instant var buff.trace YES when ^You sense the holy power return to normal
#error checking
eval buff.total count("%buff.spell", "|")
eval buff.total.prep count("%buff.prep", "|")
if %buff.total != %buff.total.prep then goto variable.error
eval buff.charge.increment.total count("%buff.charge.increment", "|")
eval buff.harness.increment.total count("%buff.harness.increment", "|")


var buff.righthand $righthandnoun
var buff.lefthand $lefthandnoun

var non.RUE.weapons Bow|Crossbow|Heavy_Thrown|Light_Thrown|Slings
var thrown.weapons Heavy_Thrown|Light_Thrown
var buff.special.casts Benediction|Cage of Light|Rutilor's Edge|Bond Armaments|Osrel Meraud|Bless


buff.magic:
if matchre("%WEAPON_EXP", "%non.RUE.weapons") then put #var RUE $righthand
if "$RUE" != "$righthand" then put #var RUE OFF
if toupper("%buff.ba.thrown") = "YES" then
	{
	if !matchre("%WEAPON_EXP", "%thrown.weapons") then put #var BA $righthand
	}
if "$BA" != "$righthand" then put #var BA OFF
if "%buff.spell(%c)" = "RUE" && "$righthand" = "Empty" then put #var RUE $righthand
if "%buff.spell(%c)" = "BA" && "$righthand" = "Empty" then put #var BA $righthand
if "%buff.spell(%c)" != "OM" && toupper("$%buff.spell(%c)") != "OFF" then
{
	counter add 1
	if %c > %buff.total then return
	goto buff.magic
}

if "%buff.spell(%c)" = "OM" then
{
	if $gametime !> $OM then
	{
	counter add 1
	goto buff.magic
	}
}
if toupper("%buff.spell(%c)") = "COL" && ($Time.isKatambaUp = 0 && $Time.isYavashUp = 0 && $Time.isXibarUp = 0) then
{
put #var COL ON
return
}
if "$%buff.spell(%c)" = "" then return
if $mana.level <= %buff.manalevel && "%buff.trace" = "YES" then gosub m.inputuff.trace
gosub m.inputuff.release
if "$GH_BUFF_DANGER" = "ON" then
{
put #send ret
put #send ret
pause .5
}
gosub m.inputuff.prepare
if toupper("%buff.cambrinth") != "NO" && %buff.charge.total(%c) > 0 then
	{
	if toupper("%buff.worn") = "NO" then
		{
		if "%buff.righthand" != "" || "%buff.lefthand" != "" then gosub m.inputuff.empty.hands
		gosub m.inputuff.get
		}
	if toupper("%buff.worn") = "YES" then
		{
		if toupper("%buff.remove") = "NO" then
			{
			if "%buff.righthand" != "" && "%buff.lefthand" != "" then
				{
				if "%buff.spell(%c)" = "RUE" || "%buff.spell(%c)" = "BA" then gosub m.inputuff.empty.hands left
				else
				gosub m.inputuff.empty.hands right
				}
			}
			if toupper("%buff.remove") = "YES" then
			{
			if "%buff.righthand" != "" || "%buff.lefthand" != "" then gosub m.inputuff.empty.hands
			gosub m.inputuff.remove
			}
		}
	gosub m.inputuff.charge
	gosub m.inputuff.invoke
	}

if toupper("%buff.harness") = "YES" && %buff.harness.total(%c) > 0 then gosub m.inputuff.harness
gosub m.inputuff.cast
if toupper("%buff.cambrinth") != "NO" && %buff.charge.total(%c) > 0 then
	{
	if toupper("%buff.worn") = "NO" then
		{
		if "%buff.righthand" != "" || "%buff.lefthand" != "" then gosub m.inputuff.reequip
		gosub m.inputuff.stow
		}
	if toupper("%buff.worn") = "YES" then
		{
		if toupper("%buff.remove") = "NO" then
			{
			if "$righthand" = "Empty" && "%buff.righthand" != "" then gosub m.inputuff.reequip right
			if "$lefthand" = "Empty" && "%buff.lefthand" != "" then gosub m.inputuff.reequip left
			}
		if toupper("%buff.remove") = "YES" then
			{
			gosub m.inputuff.wear
			if "%buff.righthand" != "" || "%buff.lefthand" != "" then gosub m.inputuff.reequip
			}
		}
	}
if toupper("%buff.continue") = "YES" then goto buff.magic
return

buff.trace:
matchre buff.trace ^\.\.\.wait|^Sorry, you may
matchre buff.trace.success ^You begin to trace the|^You trace a
matchre buff.no.trace ^An empty feeling pervades your soul
put glyph mana
matchwait

buff.no.trace:
action remove ^You sense the holy power return to normal
buff.trace.success:
put #var buff.trace NO
return

buff.prepare:
if $humming = 1 then
{
put stop play
pause .5
}
matchre buff.prepare ^\.\.\.wait|^Sorry, you may
matchre buff.return %buff.prep.message
put prep %buff.spell(%c) %buff.prep(%c)
matchwait

buff.empty.hands:
if "%buff.righthand" != "Empty" && "$1" != "left" then
{
	if "$BA" = "$righthandnoun" then
	{
	put #send release bond
	waitforre ^You sense|^You are not|^Release what
	}
put sheath my %buff.righthand
pause .5
put wear my %buff.righthand
pause .5
put stow my %buff.righthand
pause
}
if "$1" = "right" then return
if "%buff.lefthand" != "Empty" then
{
put sheath my %buff.lefthand
pause .5
put wear my %buff.lefthand
pause .5
put stow my %buff.lefthand
pause
}
return

buff.get:
matchre buff.get ^\.\.\.wait|^Sorry, you may
matchre buff.return ^You get a
put get my %buff.cambrinth
matchwait

buff.remove:
matchre buff.remove ^\.\.\.wait|^Sorry, you may
matchre buff.return ^You remove|^You slide
put remove my %buff.cambrinth
matchwait

buff.charge:
var buff.charge.current 0

buff.charge.1:
 if %buff.charge.total(%c) > %buff.charge.current then
{
if %buff.charge.increment.total = %buff.total then put charge my %buff.cambrinth %buff.charge.increment(%c)
else
put charge my %buff.cambrinth %buff.charge.increment(0)
waitforre (^The .+\.$|^\.\.\.wait|^Sorry, you)
var buff.cambrinth.result $0
if matchre ("%buff.cambrinth.result", "absorbs") then
{
if %buff.charge.increment.total = %buff.total then math buff.charge.current add %buff.charge.increment(%c)
else
math buff.charge.current add %buff.charge.increment(0)
goto buff.charge.1
}
if matchre ("%buff.cambrinth.result", "resists|is already") then
{
var buff.charge.current %buff.charge.total(%c)
goto buff.charge.1
}
if matchre ("%buff.cambrinth.result", "...wait|Sorry, you") then goto buff.charge.1
}
return

buff.invoke:
matchre buff.invoke ^\.\.\.wait|^Sorry, you may
matchre buff.return ^The .+ pulses with \w+ energy\.  You reach for its center and forge a magical link to it|^Your link to the .+ is intact
put invoke my %buff.cambrinth
matchwait

buff.harness:
var buff.harness.current 0

buff.harness.1:
if %buff.harness.total(%c) <= %buff.harness.current then return

buff.harness.2:
matchre buff.harness.2 ^\.\.\.wait|^Sorry, you may
matchre buff.harness.success You tap into
matchre buff.harness.fail You strain
if %buff.harness.increment.total = %buff.total then put harness %buff.harness.increment(%c)
else
put harness %buff.harness.increment(0)
matchwait

buff.harness.success:
if %buff.harness.increment.total = %buff.total then math buff.harness.current add %buff.harness.increment(%c)
else
math buff.harness.current add %buff.harness.increment(0)
goto buff.harness.1

buff.harness.fail:
echo Failed to harness.  Skipping the harness subroutine this round
return

buff.cast:
evalmath timediff $minprep - $spelltime
if %timediff > 0 then pause %timediff


if "$preparedspell" = "Quicken the Earth" then
{
gosub m.inputuff.cut
gosub m.inputuff.forage dirt
pause .5
}
buff.cast.2:
matchre buff.cast.2 ^\.\.\.wait|^Sorry, you may
matchre buff.return ^A soft silver glow|^Disregarding the pain, you grind the dirt brutally|^You can't cast Rutilor's Edge on yourself|^You can't enhance the|^You clasp your hands|^You don't have|^You gesture|^You let your concentration|^You make a holy gesture|^You reach with both^Your .+ emits a loud \*snap\* as it discharges all its power to aid your spell|soft silver glow that is absorbed into it\.$|Your spell backfires
if "$preparedspell" = "Benediction" then put cast %buff.immortal
if "$preparedspell" = "Cage of Light" then
{
   if $Time.isKatambaUp = 1 then put cast Katamba
   if $Time.isYavashUp = 1 then put cast Yavash
   if $Time.isXibarUp = 1 then put cast Xibar
   if $Time.isKatambaUp = 0 && $Time.isYavashUp = 0 && $Time.isXibarUp = 0 then put release
}
if "$preparedspell" = "Rutilor's Edge" || "$preparedspell" = "Bond Armaments" then put cast $righthandnoun
if "$preparedspell" = "Osrel Meraud" then put cast orb
if "$preparedspell" = "Bless" then
{
	if "%WEAPON_EXP" = "Brawling" then put cast $charactername
	else
	put cast $righthandnoun
}
if !matchre("$preparedspell", "%buff.special.casts") then put cast
matchwait

buff.stow:
matchre buff.stow ^\.\.\.wait|^Sorry, you may
matchre buff.return ^You put
put stow my %buff.cambrinth
matchwait

buff.wear:
matchre buff.wear ^\.\.\.wait|^Sorry, you may
matchre buff.return ^You attach|^You wear
put wear my %buff.cambrinth
matchwait

buff.reequip:
if "%buff.righthand" != "Empty" && "$1" != "left" then
{
put wield my %buff.righthand
pause .2
put remove my %buff.righthand
pause .2
put get my %buff.righthand
pause .2
}
if "$1" = "right" then return
if "%buff.lefthand" != "Empty" && "$1" != "right" then
{
put wield my %buff.lefthand
pause .2
put remove my %buff.lefthand
pause .2
put get my %buff.lefthand
pause .2
}
return

buff.forage:
var buff.forage $1
buff.forage.2:
if "$righthand" = "dirt" || "$lefthand" = "dirt" then return
put ret
put ret
wait
matchre buff.forage.2 ^\.\.\.wait|^Sorry, you|^You cannot forage
matchre buff.return some dirt\.$
put forage %buff.forage
matchwait

buff.cut:
matchre buff.cut ^\.\.\.wait|^Sorry, you
matchre buff.return ^Roundtime|^You've already performed
put perform cut
matchwait

buff.release:
matchre buff.release ^\.\.\.wait|^Sorry, you may
matchre buff.return ^You aren't harnessing any mana|^You aren't preparing a spell|^You have no cyclic spell active to release
send release spell;release mana
matchwait

variable.error:
echo Something wrong with your variables.  Some variable did not pass test.  Check to make sure there are the proper number in each array variable
return

buff.return:
action remove ^You are still stunned
return