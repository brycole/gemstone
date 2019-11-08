start:
put #class rp on
put #class shop on
put #class combat off
put #class arrive off
put #var currency Lirums
put #var shopcity Riverhaven
send stop play
waitforre ^You stop|^In the name

send read listings board
waitforre shops? (is|are) open\.$

put #log >Shoplist.txt The following shops are at Riverhaven's Knight's Hall [$date $time]:
put #log >Shoplog.txt The following items are sold at Riverhaven's Knight's Hall and are priced in copper Lirums [$date $time]:

move north

Rose_Room:
gosub arch
gosub door
gosub entrance
move north

Warrior_Room:
gosub arch
gosub door
gosub entrance
move north

Food_Plaza:
gosub arch
gosub door
gosub entrance
move north

Childrens_Room:
gosub arch
gosub door
gosub entrance
move south
move south
move south
move south
move northeast

Theatre_Room:
gosub arch
gosub door
gosub entrance
move northeast

World_Room:
gosub arch
gosub door
gosub entrance
move northeast

The_Back_Room:
gosub arch
gosub door
gosub entrance
move southwest
move southwest
move southwest
move northwest

Keep_Room:
gosub arch
gosub door
gosub entrance
move northwest

Dungeon_Room:
gosub arch
gosub door
gosub entrance
move northwest

Storage_Area:
gosub arch
gosub door
gosub entrance
move southeast
move southeast
move southeast
goto done

arch:
setvariable portal arch
send look arch
matchre shopinv ^'.+'.+It is currently open\.$
matchre return ^'.+'.+It is currently closed\.$
matchwait 1
return

door:
setvariable portal door
send look door
matchre shopinv ^'.+'.+It is currently open\.$
matchre return ^'.+'.+It is currently closed\.$
matchwait 1
return

entrance:
setvariable portal entrance
send look entrance
matchre shopinv ^'.+'.+It is currently open\.$
matchre return ^'.+'.+It is currently closed\.$
matchwait 1
return

shopinv:
move go %portal
put .shop2
waitfor SCRIPT DONE
move out
return

return:
return

done:
put #class arrive on
put #class shop off
send hum $hum
exit