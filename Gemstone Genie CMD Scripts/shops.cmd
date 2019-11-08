start:
put #class rp on
put #class shop on
put #class combat off
put #class arrive off
put #var currency Dokoras
put #var shopcity Shard
send stop play
waitforre ^You stop|^In the name

send read listings board
waitforre shops? (is|are) open\.$

put #log >Shoplist.txt The following shops are at Shard's Crystal Plaza [$date $time]:
put #log >Shoplog.txt The following items are sold at Shard's Crystal Plaza and are priced in copper Dokoras [$date $time]:

move north
move north

Play_Yard:
gosub arch
gosub door
gosub entrance
move south
move northeast

Prism_Room:
gosub arch
gosub door
gosub entrance
move southwest
move east

Oak_Room:
gosub arch
gosub door
gosub entrance
move west
move southeast

Luminous_Room:
gosub arch
gosub door
gosub entrance
move northwest
move southwest

Storage:
gosub arch
gosub door
gosub entrance
move northeast
move west

Food_Court:
gosub arch
gosub door
gosub entrance
move east
move northwest

The_Sea:
gosub arch
gosub door
gosub entrance
move southeast
move south
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