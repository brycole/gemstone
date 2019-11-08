debuglevel 10

gosub routinecommon
gosub routinecombat
gosub routinenecroheal
gosub routinemagic
gosub routineclericbuffs

put #var bundle 1
var tmcast 1
var baseprep 1
var ritual preserve
var mob1 goblin
var mob2 hog
var c 0
var lowmana 50
var death 0
var cman draw
var noskin 1
var loot boxes
var globalexp 15
var currentbleeder right hand
var appfocus 0
var donefocus 0
var donebonus 0
var focustime
var gemsell 0
var pack toolkit
var docamb 1
var docharge 10
var camb fox

gosub quickspelltrain


exit
include routinecommon.cmd 
include routinenecroheal.cmd
include routinecombat.cmd
include routinemagic.cmd
include routineclericbuffs.cmd