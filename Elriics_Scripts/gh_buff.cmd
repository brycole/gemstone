gh_buff.start:
## SET THESE VARIABLES
## set the trace variable to 0 if you're a Paladin AND you want to use Glyph of Mana
## The spell abbreviations to use have to be the same as the variable for the spell fron the trigger
## Make sure you have the same number of items in each of the spell, prep, and charge.total variables
## If you don't want to use a cambrinth, set the cambrinth variable to NO
## If you want to harness, set the harness variable to YES, and the increment variable to a number
## The amount to charge each pulse
## Make sure the amount of harness.total is a factor of the increment.  It is the total amount to harness
## The prep.message variable is your spell prep messaging.  Just paste in enough of the beginning messaging
## so that the script will catch it

if $guild = Bard then
{
var buff.trace 1
var buff.spell SPELL1|SPELL2|SPELL3
var buff.prep PREP1|PREP2|PREP3
var buff.charge.total TOTAL1|TOTAL2|TOTAL3
#var buff.spell EASE|LW|MAF
#var buff.prep 1|6|5
#var buff.charge.total 98|110|101
var buff.charge.increment 10
var buff.harness.total 0|0|0|0|0|0
var buff.harness.increment 10
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message Bard spell prep goes here
var buff.continue no
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 22
}

if $guild = Cleric then
{
var buff.trace 1
var buff.spell CENTERING|MAF|MPP|DR|EASE|AUSPICE|GG|BLESS
var buff.prep 5|5|5|5|5|5|5|5
var buff.charge.total 2|2|2|2|2|2|2|2
var buff.charge.increment 1
var buff.harness.total 0|0|0|0|0|0|0|0|0
var buff.harness.increment 0
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message You begin chanting
var buff.continue NO
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 20
}

if $guild = Empath then
{
var buff.trace 1
var buff.spell SPELL1|SPELL2|SPELL3|SPELL4|SPELL5
var buff.prep PREP1|PREP2|PREP3|PREP4|PREP5
var buff.charge.total TOTAL1|TOTAL2|TOTAL3|TOTAL4|TOTAL5
#var buff.spell REFRESH|GOL|AGS|MEF|VIGOR|EASE|TRANQUILITY|BS|FP|CD|INNOCENCE|AWAKEN|LW|MAF|IC
#var buff.prep 1|6|5|5|17|1|15|1|13|14|5|15|6|5|5
#var buff.charge.total 102|101|100|100|100|98|100|100|100|99|95|100|110|101|100
var buff.charge.increment 10
var buff.harness.total TOTAL1|TOTAL2|TOTAL3|TOTAL4|TOTAL5
var buff.harness.increment 10
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message With tense movements you prepare your body for
var buff.continue no
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 20
}

if $guild = Moon Mage then
{
var buff.trace 1
var buff.spell MAF|EASE
var buff.prep 15|15
var buff.charge.total 20|20
#var buff.charge.total 0|0|0|0|0|0
#var buff.spell EASE|LW|MAF
#var buff.prep 1|6|5
#var buff.charge.total 98|110|101
var buff.charge.increment 5
#var buff.charge.increment 0
var buff.harness.total 0|0
var buff.harness.increment 10
#var buff.cambrinth NO
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message You raise your head skyward, chanting
var buff.continue no
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 20
}

if $guild = Necromancer then
{
var buff.trace 1
var buff.spell EASE|LW|MAF
var buff.prep 5|5|5
var buff.charge.total 5|5|5
#var buff.spell EASE|LW|MAF
#var buff.prep 1|6|5
#var buff.charge.total 98|110|101
var buff.charge.increment 5
var buff.harness.total 0|0|0
var buff.harness.increment 10
var buff.cambrinth NO
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message You raise your arms skyward
var buff.continue no
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 20
}

if $guild = Paladin then
{
var buff.trace 1
var buff.spell CLARITY|COURAGE|DA|DIG|AA|HES|MO|SR|HOJ|MAF|EASE
var buff.prep 20|20|20|20|20|20|20|20|20|20|25
var buff.charge.total 20|20|20|20|20|20|20|20|10|20|20
#var buff.spell CLARITY|COURAGE|DA|DIG|HES|MO|RUE|RW|SR|EASE|AS|BA|LW|MAF|AA|SP
#var buff.prep 15|5|15|5|1|15|15|5|5|1|15|10|6|5|1|15
#var buff.charge.total 100|100|100|100|100|100|100|100|100|98|100|100|110|101|100|100
var buff.charge.increment 10
var buff.harness.total 0|0|0|0|0|0|0|0|0
var buff.harness.increment 0
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message You begin chanting
var buff.continue NO
var buff.held NO
var buff.manalevel 10
var buff.ba.thrown yes
put #var minprep 20
}

if $guild = Ranger then
{
var buff.trace 1
var buff.spell SPELL1|SPELL2|SPELL3
var buff.prep PREP1|PREP2|PREP3
var buff.charge.total TOTAL1|TOTAL2|TOTAL3
#var buff.spell EASE|LW|MAF
#var buff.prep 1|6|5
#var buff.charge.total 98|110|101
var buff.charge.increment 10
var buff.harness.total 0|0|0|0|0|0
var buff.harness.increment 10
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message Ranger spell prep goes here
var buff.continue no
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 20
}

if $guild = Warrior Mage then
{
var buff.trace 1
#
################
## BUFF SET 1 ##
################
#echo ##
#echo ## BUFF SET 1 (ETF|MAF|SUF|SW|EASE|YS|ZEPHYR|AEG|AB|DB|IGNITE)
#echo ##
#
var buff.spell ETF|MAF|SUF|SW|EASE|YS|ZEPHYR|AEG|AB|DB|IGNITE
var buff.prep 30|30|30|30|30|30|30|425|30|30|30
var buff.charge.total 30|40|40|40|40|40|40|0|40|30|40
#
################
## BUFF SET 2 ##
################
#echo ##
#echo ## BUFF SET 1 (VOI|ETF|MAF|SUF|SW|EASE|YS|ZEPHYR|AEG|AB|DB|IGNITE)
#echo ##
#
#var buff.spell VOI|ETF|MAF|SUF|SW|EASE|YS|ZEPHYR|AEG|AB|DB|IGNITE
#var buff.prep 30|30|30|30|30|30|30|30|425|30|30|30
#var buff.charge.total 20|30|40|40|40|40|40|40|0|40|30|40
#
################
## BUFF SET 3 ##
################
#echo ##
#echo ## BUFF SET 3 (LW|ES|SUF|SW|MAF|EASE)
#echo ##
#
#var buff.spell LW|ES|SUF|SW|MAF|EASE
#var buff.prep 30|30|30|30|30|30
#var buff.charge.total 40|40|40|40|40|40|40
#
################
## BUFF SET 4 ##
################
#echo ##
#echo ## BUFF SET 4 (EASE|MAF|SW|SUF|IGNITE|BG|ZEPHYR)
#echo ##
#
#var buff.spell EASE|MAF|SW|SUF|IGNITE|BG|ZEPHYR
#var buff.prep 30|30|30|30|30|30|30
#var buff.charge.total 40|40|40|40|30|0|40
#
################
## BUFF SET 5 ##
################
#
#echo ##
#echo ## BUFF SET 5 (SUF|SW|MAF|ES|EASE)
#echo ##
#var buff.spell SUF|SW|MAF|ES|EASE
#var buff.prep 30|30|30|30|30
#var buff.charge.total 40|40|40|40|40|40
#

var buff.charge.increment 10
var buff.harness.total 0|0|0|0|0
var buff.harness.increment 10
var buff.cambrinth $cambrinth
var buff.worn YES
var buff.remove NO
var buff.harness NO
var buff.prep.message Heatless orange flames blaze between your fingertips
var buff.continue NO
var buff.held NO
var buff.manalevel 10
#var buff.ba.thrown no
put #var minprep 20
}


## Don't edit below here
var gh.counter %c
gosub buff.start
counter set %gh.counter
return

gh_buff.include:
include buff.cmd