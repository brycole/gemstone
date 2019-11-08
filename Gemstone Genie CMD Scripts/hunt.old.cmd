setvar:
var melee_w khuj
var skin_w blade

actions:
action goto start when Arrange what?

start:

match death balanced]
match death balance]
matchwait 500

death:
pause
gosub arrange
gosub skin
gosub loot
goto start

arrange:
put arrange
pause
put arrange
pause
put arrange
pause
return

skin:
gosub skin_w
put skin
pause
gosub m.inputundle
put sheath %skin_w
put remove %melee_w
return

skin_w:
put wear %melee_w
put wield %skin_w
return

bundle:
## saved for bundle error checking/creation
put bundle
wait
return

loot:
put loot all
return
