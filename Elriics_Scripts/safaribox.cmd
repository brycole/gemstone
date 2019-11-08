action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

include base.cmd
var whereDarkBox 2
goto get.junk

get.junk:
if "$righthand" = "roast onion" then gosub eat.onion
if "$lefthand" = "roast onion" then gosub eat.onion
if "$righthand" != "Empty" then send stow right
if "$lefthand" != "Empty" then send stow left
matchre dump.junk As you remove your hand from a darkbox you see .*(an amethyst phofe flower|some mosquito netting|a pearly shell|a severed hand|a mummified paw|an old bone|a rotting root|a palm leaf|a shark tooth|some dried seaweed)
matchre dump.junk As you remove your hand from a darkbox you see .*(a sand lirum|wooden disk|some green sea glass|a small stone|a bottle of purple sand|a bottle of green sand|a bottle of yellow sand|a bottle of red sand|a bottle of blue sand)
matchre drop.junk As you remove your hand from a darkbox you see .* (a rotten egg|a dead bug|an emerald dragon earcuff|a ruby-winged cambrinth cardinal with small onyx spots|a topaz and cambrinth starfish|a velvety jambu blossom|a bit of|a vibrant rainbow rose|a rotting root)
matchre drop.junk As you remove your hand from a darkbox you see .* (an emerald dragon pin|a simple durian token)
matchre keep.gem As you remove your hand from a darkbox you see a\s.+ (tiny copper pick with a starfish grip|pink lisianthus flower|moonstained wildflower|velvety jambu blossom|king protea blossom|red etlingera blossom|aldam lorma blossom|vibrant rainbow rose|rancid eggs|rancid greens|rancid chocolate|rancid worms|rotting tomatoes|putrid bacon|molded tarts|stinking meat|Imperial coral|Taisidon sunset garnet|Katamba spinel|faceted inferno\'s heart|forest fire jasper|sunstar jasper|sparkling tasialm|chocolate opal|brilliant yellow heliodor|scarlet emerald|seastar tourmaline|trillion-cut lava topaz|jungle turquoise|drake\'s heart amber|bit of green coral|bit of red coral|bit of purple coral|bit of yellow coral)
match seek.healing Unfortunately, your wounds make it impossible for you
send play darkbox
matchwait 2
goto get.junk

dump.junk:
if "$righthand" != "Empty" then 
 {
  send put $righthand in bucket
  waitforre ^You drop|^What were you referring to\?|^Perhaps you should be holding that first\.
 }
if "$lefthand" != "Empty" then
 {
  send put $lefthand in bucket
  waitforre ^You drop|^What were you referring to\?|^Perhaps you should be holding that first\.
 }
goto get.junk

drop.junk:
if "$righthand" != "Empty" then
 {
  send drop $righthand
  waitforre ^You drop|^What were you referring to\?|^Perhaps you should be holding that first\.
 }
if "$lefthand" != "Empty" then
 {
  send drop $lefthand
  waitforre ^You drop|^What were you referring to\?|^Perhaps you should be holding that first\.
 }
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
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo YOU ARE TOO INJURED TO WIN. FIX YOUR HANDS NOW.
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#  Put your healing solution here.
#
pause 20
goto get.junk
