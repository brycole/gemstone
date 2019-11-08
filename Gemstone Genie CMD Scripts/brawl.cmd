include base.cmd

action goto death when balance\]|balanced\]|^There is nothing

start:
gosub put.1 "kick" "^\[Roundtime"
gosub put.1 "slice" "^\[Roundtime"
gosub put.1 "punch" "^\[Roundtime"
gosub put.1 "claw" "^\[Roundtime"
goto start

death:
pause
goto harvest
gosub put.1 "wield skin knife" "^With a flick"
gosub put.1 "arrange" "^Roundtime|^Arrange"
gosub put.1 "arrange" "^Roundtime|^Arrange"
#gosub put.1 "arrange" "^Roundtime|^Arrange"
gosub put.1 "skin" "^Roundtime"
gosub put.1 "loot" "^You search|^I could not"
gosub put.1 "sheath skin knife" "^With a flick"
gosub put.1 "bundle" ".+"
##gosub harv %1
harvest:
gosub ritual %1
gosub put.1 "loot" "^You search|^I could not"
if "$righthandnoun" = "material" then gosub put.1 "empty right" "^You drop"
if "$lefthandnoun" = "material" then gosub put.1 "empty left" "^You drop"
goto start

