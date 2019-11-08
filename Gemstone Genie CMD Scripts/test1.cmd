debuglevel 10

gosub routinecommon
gosub routinecombat
gosub routineclericbuffs
gosub routinemagic

var monitor no
#var resonance climbing
put #var bundle 1
var tmcast 1
var baseprep 1
var ritual preserve
var mob1 goblin
var mob2 eel
var targetspells Energy Bolt|Acid Splash|Fist of Faenella|Divine Radiance|Siphon Vitality
var c 0
var lowmana 50
var death 0
var cman draw
var noskin 0
var loot treasure
var globalexp 30
var newburin 0
var cc 4
var tempitem NONE
var camb medallion
var ritualon 1
var dokill skinning
var doarise 0
var docharge 5
var castcamb 1
var releasetrain 0
var collect rock
var train_now forging
var clericswitch 1
gosub put.1 "power" "^Roundtime"

gosub debil.fight
	
exit
include routinecommon.cmd 
include routinecombat.cmd
include routineclericbuffs.cmd