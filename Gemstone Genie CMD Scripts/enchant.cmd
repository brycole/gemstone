#debuglevel 10

gosub routinecommon
gosub routinemagic
gosub routinemoonbuffs
gosub routineenchant
	
gosub put.1 "power" "^Roundtime"

goto %1
	
unbendsigil:

	var item silver sigil
	gosub sigil.check red 6 Durgaulda
	gosub put.1 "drop 10 silver kronar"
	gosub get burin
	if "$righthandnoun" != "burin" then gosub put.1 "swap" "^You move"
	gosub put.1 "scribe coin" "^Roundtime"
	gosub stow burin
	gosub stow silver sigil
	gosub sigil.check red 1 Morleena
	gosub get burin
	if "$righthandnoun" != "burin" then gosub put.1 "swap" "^You move"
	gosub get silver sigil
	gosub sigil.bind
	gosub put.1 "put my sigil in my back" "%put.msg"
	
goto unbendsigil
exit
	
include routinecommon.cmd
include routinemoonbuffs.cmd
include routineenchant.cmd
include routinemagic.cmd