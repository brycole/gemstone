put open my %1
wait

setvariable yelith 0
setvariable jadice 0
setvariable nemoih 0
setvariable eghmok 0
setvariable georin 0
setvariable riolur 0
setvariable plovik 0
setvariable ithor 0
setvariable nilos 0
setvariable muljin 0
setvariable hulnik 0
setvariable junliar 0
setvariable sufil 0
setvariable cebi 0
setvariable hisan 0
setvariable aevaes 0
setvariable lujeakave 0

action setvariable yelith 1 when You rummage.*yelith
action setvariable jadice 1 when You rummage.*jadice
action setvariable nemoih 1 when You rummage.*nemoih
action setvariable georin 1 when You rummage.*georin
action setvariable eghmok 1 when You rummage.*eghmok
action setvariable riolur 1 when You rummage.*riolur
action setvariable plovik 1 when You rummage.*plovik
action setvariable ithor 1 when You rummage.*ithor
action setvariable nilos 1 when You rummage.*nilos
action setvariable muljin 1 when You rummage.*muljin
action setvariable hulnik 1 when You rummage.*hulnik
action setvariable junliar 1 when You rummage.*junliar
action setvariable sufil 1 when You rummage.*sufil
action setvariable cebi 1 when You rummage.*cebi
action setvariable hisan 1 when You rummage.*hisan
action setvariable aevaes 1 when You rummage.*aevaes
action setvariable lujeakave 1 when You rummage.*lujeakave


put rummage %1
waitfor You rummage
if %yelith = 0 then echo NEED YELITH
if %jadice = 0 then echo NEED JADICE
if %nemoih = 0 then ECHO NEED NEMOIH
if %georin = 0 then ECHO NEED GEORIN
if %eghmok = 0 then ECHO NEED EGHMOK
if %eghmok = 0 then setvariable havenherb eghmok potion
if %riolur = 0 then ECHO NEED RIOLUR
if %plovik = 0 then ECHO NEED PLOVIK
if %ithor = 0 then ECHO NEED ITHOR
if %nilos = 0 then ECHO NEED NILOS
if %muljin = 0 then ECHO NEED MULJIN
if %hulnik = 0 then ECHO NEED HULNIK
if %junliar = 0 then ECHO NEED JUNLIAR
if %sufil = 0 then ECHO NEED SUFIL
if %cebi = 0 then ECHO NEED CEBI
if %hisan = 0 then ECHO NEED HISAN
if %aevaes = 0 then ECHO NEED AEVAES
if %lujeakave = 0 then ECHO NEED LUJEAKAVE

exit