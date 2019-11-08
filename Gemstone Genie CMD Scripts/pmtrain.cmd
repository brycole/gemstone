#debuglevel 10	
	
	gosub routinecommon 

initialize: 
var monitor atk
var monitor no
var resonance 2
var ignorerooms 2
  
pmtrain1: 
	gosub put prep sod 12
pause 7
if $mana < 100 then waiteval $mana = 100
	gosub put cast
	
if $Primary_Magic.LearningRate < 34 then goto pmtrain1


magicend:
	gosub m.inputooks "weapon book" 1 9
	gosub put stow my book
	gosub m.inputooks "armor book" 1 4
	gosub put stow my book


echo Lunar magic training done.
put #parse pmtrain.cmd done.
exit


include routinecommon.cmd 