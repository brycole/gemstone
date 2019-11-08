start:
put #class rp on
put #class shop on
put #class combat off
put #class arrive off
put #var currency Kronars
put #var shopcity Crossing
send stop play
waitforre ^You stop|^In the name

send read listings board
waitforre shops? (is|are) open\.$

put #log >Shoplist.txt The following shops are at Crossing's Market Plaza [$date $time]:
put #log >Shoplog.txt The following items are sold at Crossing's Market Plaza and are priced in copper Kronars [$date $time]:

move north

Sun_Room:
gosub arch
gosub door
gosub entrance
move east

Water_Room:
gosub arch
gosub door
gosub entrance
move northeast

Grass_Room:
gosub arch
gosub door
gosub entrance
move northwest

Solarium:
gosub arch
gosub door
gosub entrance
move southwest
move northwest

Forest_Room:
gosub arch
gosub door
gosub entrance
move southwest

Dimly-Lit_Storage:
gosub arch
gosub door
gosub entrance
move southeast

Meeting_Room:
gosub arch
gosub door
gosub entrance
move east
move southeast

Moon_Room:
gosub arch
gosub door
gosub entrance
move east

Armor_Room:
gosub arch
gosub door
gosub entrance
move west
move south

Lodge_Room:
gosub arch
gosub door
gosub entrance
move north
move northwest
move southwest

Gladiolus_Room:
gosub arch
gosub door
gosub entrance
move west

Fire_Room:
gosub arch
gosub door
gosub entrance
move east
move south

Library:
gosub arch
gosub door
gosub entrance
move north
move northeast
move go spiral ramp

Volcano_Room:
gosub arch
gosub door
gosub entrance
move east

Palm_Room:
gosub arch
gosub door
gosub entrance
move northeast

Ocean_Room:
gosub arch
gosub door
gosub entrance
move northwest

Tundra_Room:
gosub arch
gosub door
gosub entrance
move southwest

Jungle_Room:
gosub arch
gosub door
gosub entrance
move northwest

Savannah_Room:
gosub arch
gosub door
gosub entrance
move southwest

Desert_Room:
gosub arch
gosub door
gosub entrance
move southeast

River_Room:
gosub arch
gosub door
gosub entrance
move east
move go spiral ramp
move climb marble staircase

Tasting_Room:
gosub arch
gosub door
gosub entrance
move north

Bottle_Room:
gosub arch
gosub door
gosub entrance
move north

Stomping_Room:
gosub arch
gosub door
gosub entrance
move east

Barrel_Room:
gosub arch
gosub door
gosub entrance
move west
move north

Fermentation_Room:
gosub arch
gosub door
gosub entrance
move south
move west

Cooper_Room:
gosub arch
gosub door
gosub entrance
move east
move south
move south
move climb marble staircase
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