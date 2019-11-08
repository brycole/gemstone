#Favor puzzle

goto favor.end

pray:
put pray
put pray
pause
put pray
pause
put pray
pause
put 'Urrem'tier
pause
put stand
put get orb
pause
put go arch

puzzle:
match fillfont You also see a granite altar with several candles and a water jug on it, and a granite font.
match lightcandle You also see some tinders, several candles, a granite font and a granite altar.
match cleanaltar You also see a granite altar with several candles on it, a granite font and a small sponge.
match pickflowers You also see a vase on top of the altar.
match openwindow A table sits against one wall, directly opposite an ancient window.  
matchre DONE \[Siergelde, Stone Grotto\]|\[Mausoleum, Alcove of the Font\]

put look
matchwait

fillfont:
pause
put fill font
pause
match fillfont With a practiced eye, you begin to check the various acoutrements around you.
match fillfont2 You reach the top of the stairway, and notice that the door has swung open of its own accord!  
put go stair
matchwait
fillfont2:
put go door
goto puzzle

pickflowers:
pause
put pick flowers
pause
put go tree
goto puzzle

lightcandle:
pause
put light candle
pause
match lightcandle With a practiced eye, you begin to check the various acoutrements around you.
match lightcandle2 You reach the top of the stairway, and notice that the door has swung open of its own accord!
put go stair
matchwait
lightcandle2:
put go door
goto puzzle

cleanaltar:
pause
put clean altar
pause
match cleanaltar With a practiced eye, you begin to check the various acoutrements around you.
match cleanaltar2 You reach the top of the stairway, and notice that the door has swung open of its own accord!  
put go stair
matchwait
cleanaltar2:
put go door
goto puzzle

openwindow:
put drop orb
goto pray

DONE:
pause
put stow my orb
delay 1
return

favor.end: