## Created by drtyprior
## debuglevel 10
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
var storage silverweave lootsack

if_1 then goto FLUX
goto ROD
FLUX:
	send get flux
	pause
	send pour flux in cru
	match SHOVEL As you complete working the fire dies down and needs more fuel
	match BELLOWS As you finish the fire flickers and is unable to consume its fuel
	match CRUCIBLE Upon finishing you observe clumps of molten metal
	matchre END You can only mix|What were you referring to
	matchre ROD Roundtime
	matchre ROD ^\.\.\.wait|^Sorry
	matchwait


ROD:
	if $righthandnoun = flux then put put my flux in my %storage
	if $lefthandnoun = flux then put put my flux in my %storage
	put get rod
	pause
	pause
	goto MIX

MIX:
	pause
	if $righthandnoun = flux then put put my flux in my %storage
	if $lefthandnoun = flux then put put my flux in my %storage
	send mix cruc with rod
	match SHOVEL As you complete working the fire dies down and needs more fuel
	match BELLOWS As you finish the fire flickers and is unable to consume its fuel
	match CRUCIBLE Upon finishing you observe clumps of molten metal
	matchre END You can only mix|What were you referring to
	matchre MIX Roundtime
	matchre MIX ^\.\.\.wait|^Sorry
	matchwait

SHOVEL:
	if $righthandnoun = flux then put put my flux in my %storage
	if $lefthandnoun = flux then put put my flux in my %storage
	put put rod in my %storage
	pause
	put get shovel
	pause
	put push fuel with shovel
	pause
	put put shovel in my %storage
	pause
	put get rod
	goto MIX

BELLOWS:
	if $righthandnoun = flux then put put my flux in my %storage
	if $lefthandnoun = flux then put put my flux in my %storage
	put put my rod in my %storage
	pause
	put get bellow
	pause
	put push bellow
	pause
	put put my bellow in my %storage
	pause
	put get rod
	goto MIX

CRUCIBLE:
	put turn the crucible
	pause
	if $righthandnoun = flux then put put my flux in my %storage
	if $lefthandnoun = flux then put put my flux in my %storage
	if $righthand != stirring rod AND $lefthand != stirring rod then put get my stirring rod
	goto MIX

END:
	put put my rod in my %storage
	if $righthandnoun = flux then put put my flux in my %storage
	if $lefthandnoun = flux then send put my flux in my %storage
	put #echo BLUE *** INGOT IS FINISHED! ***
	put #parse SMELTDONE
