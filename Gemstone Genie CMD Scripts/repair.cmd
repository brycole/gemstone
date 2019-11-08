
	gosub routinecommon

	var armorlist greaves|vambraces|gloves|balaclava
	var armorvar 0
	var helm bala
	var glove glo
	var resonance moving
	var monitor no
	
	action var armorstatus 2 when badly damaged
	action var armorstatus 3 when heavily scratched and notched
	action var armorstatus 4 when several unsightly notches
	action var armorstatus 5 when dents and dings
	action var armorstatus 6 when minor scratches
	action var armorstatus 7 when rather scuffed up
	action var armorstatus 8 when good condition
	action var armorstatus 9 when practically in mint condition
	action var armorstatus 10 when pristine condition
	
	gosub put.2 "get %helm" "wear %helm" "^You put|^But"
	gosub put.2 "get %glove" "wear %glove" "^You slip|^But"
	
repairstart:
	var temparmor %armorlist(%armorvar)
	gosub put.1 "app my %temparmor" "^Roundtime:|^Appraise"
	math armorvar add 1
	if %armorstatus < 8 then gosub armor_repair
	
	if %armorvar > 3 then goto exitrepair
	goto repairstart

armor_repair:
	gosub put.1 "remove my %temparmor" "^You"

repair_again:
	gosub get my brush
	gosub put.1 "rub my %temparmor with my brush" "^Roundtime:"
	gosub stow brush
	gosub get my oil
	gosub put.1 "pour my oil on my %temparmor" "Roundtime:"
	gosub stow oil
	gosub put.1 "app my %temparmor" "^Roundtime:|^Appraise"
	if %armorstatus < 8 then gosub repair_again
	gosub put.1 "wear %temparmor" "^You"

return

exitrepair:

put #parse @repair done.

var resonance
var monitor

exit
include routinecommon.cmd 