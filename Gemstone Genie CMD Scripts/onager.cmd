include base.cmd

action var load 1 when ^That is as far


turn:
gosub put.1 "turn lever" "^\[Roundtime:|^That is as far"
if %load = 1 then goto load
goto turn

load:
gosub put.2 "get stone" "load onager" "^Roundtime:"
echo Onager loaded!