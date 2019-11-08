setvar endo 0
setvar newe 0
action var endo 1 when You make the final fold
action var newe 1 when That was the last sheet.

put release
pause 1

put get my primer
put swap
pause 1
pull.paper:
pause
put pull my env
put study flower ins
pause
start.orig:
if %endo = 1 then goto end.orig
put fold my paper
pause
goto start.orig

end.orig:
pause
put exh $shape
if $Mechanical_Lore.LearningRate > 25 then goto end.orig1
setvar endo 0
if %newe = 1 then
{
put remove env
put drop env
setvar newe 0
}
goto pull.paper
end.orig1:
put stow my primer