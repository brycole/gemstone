action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

include base.cmd
var whereDarkBox 2
var casterguilds Warrior Mage|Cleric|Empath|Ranger|Moon Mage|Necromancer|Paladin|Bard
put stow left
put stow right
pause .5
if %1>0 then
 {
  %whereDarkBox = %1
  goto Returnto.Darkbox
 }
goto get.junk

get.junk:
if "$righthand" = "roast onion" then gosub eat.onion
if "$lefthand" = "roast onion" then gosub eat.onion
if "$righthand" != "Empty" then send stow right
if "$lefthand" != "Empty" then send stow left
matchre dump.junk As you remove your hand from the Darkbox you see .*(kelp|sharkskin|rockweed|cambrinth)
matchre dump.junk As you remove your hand from the Darkbox you see .*(a silver-inlaid seax|a copper coin|some jadice flowers)
matchre dump.junk As you remove your hand from the Darkbox you see .*(some hisan flowers|some gargoyle-hide boots with hammered bronze heels|some cebi root|some yelith root|a dragon-headed mace|a short acanth-hafted halberd tipped with a razor-sharp steel head|an ebony-hilted dagger set with a large teardrop ruby|a hickory-hilted greatsword with the World Dragon engraved down the blade)
match seek.healing Unfortunately, your wounds make it impossible for you
send play darkbox
matchre Move.Darkbox ^Play on what instrument\?
matchwait 2
goto get.junk

dump.junk:
send put my $lefthandnoun in bin
send put my $righthandnoun in bin
pause .5
goto get.junk

drop.junk:
send drop my $1
goto get.junk

keep.gem:
send stow $1
goto get.junk


eat.onion:
pause
send eat my onion
send eat my onion
matchre eat.onion ^You take a bite of the onion
matchre return ^What were you referring to\?
matchwait 5
goto return

return:
return

seek.healing:
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!m
echo YOU ARE TOO INJURED TO WIN. FIX YOUR HANDS NOW.
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
gosub automove ang
put whisper Charise heal me
pause 40
if matchre ("$guild", "\b(%casterguilds)\b") then goto check.burden
goto Returnto.Darkbox

check.burden:
matchre cast.ease (Burdened|Heavy Burden|Very Heavy Burden|Extremely Overburdened|Tottering Under Burden|Are you even able to move\?|It\'s amazing you aren\'t squashed!)
send enc
matchwait 1
goto Returnto.Darkbox

cast.ease:
pause 1
send prep ease 25
waitfor You feel fully prepared to cast your spell.
pause 1
send harness 25
pause 1
send harness 25
pause 1
send harness 25
pause 1
send cast
match Returnto.Darkbox Pale yellow sparks flicker around your torso.  Your possessions suddenly feel lighter and easier to carry.
match Returnto.Darkbox Currently lacking the skill to complete the pattern, your spell fails completely.
match Returnto.Darkbox Something in the area interferes with your spell preparations.
match cast.ease backfires
matchwait 25
send cast
goto Returnto.Darkbox

Returnto.Darkbox:
echo WHERE: %whereDarkBox
gosub automove %whereDarkBox
goto get.junk

Move.Darkbox:
if %whereDarkbox>133 then var whereDarkBox 2
else math whereDarkBox add 1
gosub automove %whereDarkBox
goto get.junk