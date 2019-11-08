VarSetting:
##if matchre("$Guild", ("Moon Mage|Ranger|Thief|Necromancer|Empath")) then var Style careful
##else var Style 
evalmath Ranks $Foraging.Ranks + $Perception.Ranks/10
put kneel

goto $charactername.forage

Stoh.forage:
var Style careful
put prep cv 40
pause 20
put cast
pause
if_1 then goto forage.start
gosub rf
goto forage.start

Kurav.forage:
var Style
goto forage.start


forage.start:
if_1 then goto SkillCheck
##gosub Hum
SkillCheck:
if (%Ranks < 0) then goto end.forage
if (%Ranks >= 0) && (%Ranks < 10) then var ForageList berries, fish bone, branch, dust bunny, wood chip, bread crumb, grass, leaf, rock, root, shell, broken shell, wood splinter, stick	, twig.
else if (%Ranks >= 10) && (%Ranks < 20) then var ForageList torch, shoe tack, sea shell, acorn, cattail, dirt.
else if (%Ranks >= 20) && (%Ranks < 30) then var ForageList grungy feather, seaweed, stem, jadice flower, corn, limb, log, rusty nail, peat, sap, scallion.
else if (%Ranks >= 30) && (%Ranks < 40) then var ForageList snail shell, taffelberries, vine, weed, torn cloth, georin grass, blueberries, strawberry, cherry, clam shell, blue flower, red flower, tree root.
else if (%Ranks >= 40) && (%Ranks < 50) then var ForageList shark tooth, fana shell, nedoren shell, jasmine blossom.
else if (%Ranks >= 50) && (%Ranks < 60) then var ForageList branch, spruce branch, aloe leaf.
else if (%Ranks >= 60) && (%Ranks < 70) then var ForageList pine limb, spruce limb, pine stick, spruce stick, briar berries, phelim shell, asarwuden shell, nemoih root, yelith root, apple, apple branch, wild carrot, clam, lemon.
else if (%Ranks >= 70) && (%Ranks < 80) then var ForageList apple limb, orange, apple stick, alder branch, alder limb, alder stick, toadstool, seolarn weed, clover, ash branch, birch branch, fir branch, ash limb, birch limb, fir limb, rose, ash stick.
else if (%Ranks >= 80) && (%Ranks < 90) then var ForageList birch stick, fir stick, chamomile, gooseberries, turnip, draconaeia blossom, lavender, moss, cherry branch, hickory branch.
else if (%Ranks >= 90) && (%Ranks < 100) then var ForageList cherry limb, hickory limb, cherry stick, hickory stick, almond, nilos grass, plovik leaf, sage, junliar stem, tea leaf, white rose.
else if (%Ranks >= 100) && (%Ranks < 110) then var ForageList green moss, ebony branch, elm branch, mahogany branch, maple branch, oak branch, rosewood branch, teak branch, hulnik grass, riolur leaf, ebony limb, elm limb, mahogany limb, maple limb, oak limb.
else if (%Ranks >= 110) && (%Ranks < 120) then var ForageList rosewood limb, teak limb, walnut limb, willow limb, briarberry root, pig root.
else if (%Ranks >= 120) && (%Ranks < 135) then var ForageList sufil sap, ebony stick, elm stick, mahogany stick, maple stick, oak stick, rosewood stick, teak stick, walnut stick, willow stick, blocil berries, glaysker flower, redwood branch, walnut branch, redwood limb, redwood stick, red rose.
else if (%Ranks >= 135) && (%Ranks < 150) then var ForageList willow branch, mistle toe, eghmok moss.
else if (%Ranks >= 150) && (%Ranks < 175) then var ForageList old button, wild orchid, muljin sap, coffee bean.
else if (%Ranks >= 175) && (%Ranks < 200) then var ForageList yew branch, yew limb, yew stick.
else if (%Ranks >= 200) && (%Ranks < 220) then var ForageList mistwood branch, mistwood limb, mistwood stick, honey comb.
else if (%Ranks >= 220) && (%Ranks < 240) then var ForageList sage branch, osage limb, osage stick.
else if (%Ranks >= 240) && (%Ranks < 250) then var ForageList bloodwood branch, bloodwood limb, bloodwood stick, butterfly orchid, jadice pollen, qun pollen, cebi root.
else if (%Ranks >= 250) then var ForageList genich stem, nuloe stem, imperial coin.
var LastItem NO

Actions:
action var Item $1;var ForageList $2 when ^ForageList (\w+\s\w+),\s(.+\.)
action var Item $1;var ForageList $2 when ^ForageList (\w+),\s(.+\.)
action var Item $1;var ForageList $2 when ^ForageList (\w+\s\w+)(\.)
action var Item $1;var ForageList $2 when ^ForageList (\w+)(\.)

Foragable.Set:
pause 0.2
if ("%LastItem" = "NO") then put #parse ForageList %ForageList
if ("%LastItem" = "YES") && (("%ForageList" = "") || ("%ForageList" = ".")) then goto NewList
else if ("%LastItem" = "NO") && (("%ForageList" = "") || ("%ForageList" = ".")) then var LastItem YES

Forage.Found:
pause
if ($Foraging.LearningRate > 20) then goto end.forage
if $charactername = dgd then 
{
	if ("$lefthand" != "Empty") then put give my $lefthandnoun to servant
	if ("$lefthand" != "Empty") then put give my $righthandnoun to servant
}
else 
{
	if ("$lefthand" != "Empty") then put put my $lefthandnoun in $garbage
	if ("$righthand" != "Empty") then put put my $righthandnoun in $garbage
}
pause 1
matchre Forage.Found %Item\.
match Foragable.Set Roundtime
match end.forage You cannot forage while
match end.forage too cluttered
put hum $Hum_Song
put forage %Item %Style
matchwait

NewList:
math Ranks subtract 15
goto SkillCheck

end.forage:
pause
if $charactername = sfsf then 
{
	if ("$lefthand" != "Empty") then put give my $lefthandnoun to servant
	if ("$righthand" != "Empty") then put give my $righthandnoun to servant
}
else 
{
	if ("$lefthand" != "Empty") then put put my $lefthandnoun in $garbage
	if ("$righthand" != "Empty") then put put my $righthandnoun in $garbage
}
pause 1
put stand
