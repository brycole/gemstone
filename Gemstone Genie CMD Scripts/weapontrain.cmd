##debuglevel 10
include base.cmd

if_2 then put #var mob1 %2
if_3 then put #var mob2 %3
if_4 then put #var mob3 %4

put #var room.bound @@

goto %1

le:
put #var skin 1

gosub move 555
if "$roomplayers" = "" then goto %1.start
else gosub move 556
if "$roomplayers" = "" then goto %1.start
else gosub move 557
if "$roomplayers" = "" then goto %1.start
goto end


le.start:
gosub put.1 "dodge" "^Roundtime:|But you are"
gosub ss combat le
goto end

hal:
gosub move 58
if "$roomplayers" = "" then goto %1.start
else gosub move 57
if "$roomplayers" = "" then goto %1.start
else gosub move 56
if "$roomplayers" = "" then goto %1.start
else gosub move 55
if "$roomplayers" = "" then goto %1.start
else gosub move 54
goto end

hal.start:
gosub ss combat hal
goto end

brawl:
gosub move 45
if "$roomplayers" = "" then goto %1.start
else gosub move 46
if "$roomplayers" = "" then goto %1.start
else gosub move 47
if "$roomplayers" = "" then goto %1.start
goto end

brawl.start:
gosub ss combat brawl
goto end

ht:
put #var room.bound 13
put #var zoneb 17

gosub spell.check

gosub move 16
if "$roomplayers" = "" then goto %1.start
else gosub move 17
if "$roomplayers" = "" then goto %1.start
else gosub move 18
if "$roomplayers" = "" then goto %1.start
goto end
	
ht.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat ht
goto end

me:
put #var skin 1
put #var room.bound @@
put #var zoneb @@

if "$roomplayers" = "" then goto %1.start
else gosub move 16
if "$roomplayers" = "" then goto %1.start
else gosub move 17
if "$roomplayers" = "" then goto %1.start
else goto end


me.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat me
goto end

he: 
put #var skin 1
put #var room.bound 104|115
put #var zoneb 106
 
gosub move 106
if "$roomplayers" = "" then goto %1.start
else gosub move 105
if "$roomplayers" = "" then goto %1.start
else gosub move 110
if "$roomplayers" = "" then goto %1.start
goto end

he.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat he
goto end

lx:
put #class spell_msg true
put #var spellup 1
put #var em 0
put #var stw 0
put #var skin 1
put #var room.bound @@
put #var zoneb @@

gosub move 228
if "$roomplayers" = "" then goto %1.start
else gosub move 230
if "$roomplayers" = "" then goto %1.start
else gosub move 232
if "$roomplayers" = "" then goto %1.start
else gosub move 233
if "$roomplayers" = "" then goto %1.start
else gosub move 231
if "$roomplayers" = "" then goto %1.start
else gosub move 229
if "$roomplayers" = "" then goto %1.start
else goto end

lx.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat lx
goto end

lt:
put #var skin 1
put #var room.bound @@
put #var zoneb @@

if "$roomplayers" = "" then goto %1.start
else gosub move 17
if "$roomplayers" = "" then goto %1.start
else gosub move 18
if "$roomplayers" = "" then goto %1.start
else goto end


lt.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat lt mall
goto end

tm:
put #var skin 1
put #var room.bound @@
put #var zoneb @@

gosub move 17
if "$roomplayers" = "" then goto %1.start
else gosub move 18
if "$roomplayers" = "" then goto %1.start
else gosub move 169
if "$roomplayers" = "" then goto %1.start
else goto end


tm.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat tm
goto end

pm:
## ** leucro
put #var room.bound 79|66|80|81
put #var zoneb 74
put #var skin 1
put #var spellup 1

#gosub spell.check

gosub move 71
if "$roomplayers" = "" then goto %1.start
else gosub move 74
if "$roomplayers" = "" then goto %1.start
else gosub move 73
if "$roomplayers" = "" then goto %1.start
goto end

pm.start:
gosub put.1 "dodge" "^Roundtime:|But you are"

gosub ss combat pm
goto end



end:
put #var mob1 @@
put #var mob2 @@
put #var mob3 @@
put #var room.bound @@
put #var zoneb @@
put #parse weapontrain.cmd done.