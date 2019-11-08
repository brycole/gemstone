##debuglevel 10

include base.cmd

start.app:
var appraise first|second|third|fourth|fifth|sixth|seventh|END
var c 0

if_1 then put #var mob1 %1
if_2 then put #var mob2 %2
if_3 then put #var mob3 %3
if_4 then put #var mob4 %4

mob.count:
var mob.temp $monsterlist 
var mob1.c 0
var mob2.c 0
var mob3.c 0
var mob4.c 0
eval mob.temp replace("%mob.temp", ", ", "|")
eval mob.temp replace("%mob.temp", " and ","|")
eval mob.temp replace("%mob.temp", ".", "|")
eval mob1.c count("%mob.temp", "$mob1")
eval mob2.c count("%mob.temp", "$mob2")
eval mob3.c count("%mob.temp", "$mob3")
eval mob4.c count("%mob.temp", "$mob4")
eval totalmob (%mob1.c + %mob2.c + %mob3.c + %mob4.c)

mob1.c:
if %mob1.c != 0 then 
{
gosub m.input app %appraise(%c) $mob1 quick
evalmath c (%c +1 )
if %c < %mob1.c then goto mob1.c
var c 0
}

mob2.c:
if %mob2.c != 0 then 
{
gosub m.input app %appraise(%c) $mob2 quick
evalmath c (%c +1 )
if %c < %mob2.c then goto mob2.c
var c 0
}

mob3.c:
if %mob3.c != 0 then 
{
gosub m.input app %appraise(%c) $mob3 quick
evalmath c (%c +1 )
if %c < %mob3.c then goto mob3.c
var c 0
}

mob4.c:
if %mob4.c != 0 then 
{
gosub m.input app appraise(%c) $mob4 quick
evalmath c (%c +1 )
if %c < %mob4.c then goto mob4.c
var c 0
}

if %totalmob = 0 then delay 5
if $Appraisal.LearningRate = 34 then goto end
goto start.app

end:
echo Appraisal done.
put #parse comapp.cmd done.