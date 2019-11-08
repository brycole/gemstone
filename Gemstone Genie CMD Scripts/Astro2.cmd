#debuglevel 10
astro.actions:
action var circle $1 when Circle: (\d+)
action var season $2 when (It's|It is) currently (\S+)
action var time day when sunrise|dawn|morning|noon|afternoon|midday|daytime
action var time night when dusk|night|midnight|sunset|evening

astro.begin:
if ($Astrology.LearningRate > 33) then goto end
put info
put time
pause 1
counter set 1
echo
echo Time: %time
echo Season: %season
echo Circle: %circle
echo
if "%time" = "day" then goto day.set
if "%time" = "night" then goto season.check
if "$PG" = "off" then gosub PG
if "$CV" = "off" then gosub CV

season.check:
var obs1 xibar
var obs2 yavash
var obs3 kat
var obs4 heart
if %circle >= 2 then var obs5 wolf
else var obs5 none
if "%season" = "spring" then goto spring.set
if "%season" = "summer" then goto summer.set
if "%season" = "fall" then goto fall.set
if "%season" = "winter" then goto winter.set

spring.set:
if %circle >= 4 then var obs6 raven
else var obs6 none
if %circle >= 5 then var obs7 unicorn
else var obs7 none
if %circle >= 8 then var obs8 cobra
else var obs8 none
if %circle >= 11 then var obs9 wren
else var obs9 none
goto astro

summer.set:
if %circle >= 4 then var obs6 raven
else var obs6 none
if %circle >= 6 then var obs7 boar
else var obs7 none
if %circle >= 9 then var obs8 ox
else var obs8 none
if %circle >= 20 then var obs9 king snake
else var obs9 none
goto astro

fall.set:
if %circle >= 3 then var obs6 lion
else var obs6 none
if %circle >= 4 then var obs7 raven
else var obs7 none
if %circle >= 7 then var obs8 panther
else var obs8 none
if %circle >= 9 then var obs9 ox
else var obs9 none
goto astro

winter.set:
if %circle >= 4 then var obs6 raven
else var obs6 none
if %circle >= 5 then var obs7 unicorn
else var obs7 none
if %circle >= 14 then var obs8 dolphin
else var obs8 none
if %circle >= 22 then var obs8 albatross
else var obs9 none
var obs9 none
goto astro

day.set:
var obs1 sun
var obs2 xibar
var obs3 yavash
var obs4 kat
var obs5 none
var obs6 none
var obs7 none
var obs8 none
var obs9 none
goto astro

astro:
match need.pg Clouds obscure the sky
match astro still stunned.
match predict Clouds obscure the sky
matchre predict learned a little bit|gain a complete view|learned something useful
matchre return are unable to make use of|is foiled by|fruitless|could not find|see nothing|not pondered your last
put obs %obs%c
matchwait

return:
counter add 1
if "%obs%c" = "none" then goto astro.begin
else goto astro

predict:
match predict.2 the mists of time
match return remains a dark mystery
if "%obs%c" = "sun" then put predict future $charactername offense
if "%obs%c" = "kat" then put predict future $charactername defense
if "%obs%c" = "xibar" then put predict future $charactername lore
if "%obs%c" = "yavash" then put predict future $charactername magic
if "%obs%c" = "heart" then put predict future $charactername lore
if "%obs%c" = "wolf" then put predict future $charactername lore
if "%obs%c" = "lion" then put predict future $charactername defense
if "%obs%c" = "raven" then put predict future $charactername survival
if "%obs%c" = "unicorn" then put predict future $charactername survival
if "%obs%c" = "boar" then put predict future $charactername offense
if "%obs%c" = "panther" then put predict future $charactername
if "%obs%c" = "cobra" then put predict future $charactername lore
if "%obs%c" = "ox" then put predict future $charactername survival
if "%obs%c" = "scorpion" then put predict future $charactername defense
if "%obs%c" = "wren" then put predict future $charactername magic
if "%obs%c" = "cat" then put predict future $charactername survival
if "%obs%c" = "ram" then put predict future $charactername lore
if "%obs%c" = "dolphin" then put predict future $charactername lore
if "%obs%c" = "nightingale" then put predict future $charactername defense
if "%obs%c" = "shardstar" then put predict future $charactername
if "%obs%c" = "wolverine" then put predict future $charactername offense
if "%obs%c" = "centaur" then put predict future $charactername offense
if "%obs%c" = "magpie" then put predict future $charactername defense
matchwait

predict.2:
put predict anal $charactername
wait
pause
goto return

need.pg:
pause
send prep PG 8
send obs moons
wait
pause
send cast
wait
goto astro

end:
put #parse Astro done
exit

