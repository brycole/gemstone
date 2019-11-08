debuglevel 10
setvar favors 0
setvariable numfavors 50
setvariable god meraud
if_1 setvariable god %1
setvariable wep1
setvariable wep2

put #script abort favors
##goto bypass
#echo **********************************************************
#echo **********************************************************
#echo                                        
#echo          By default this script will get you  
#echo          favors until you have 10.  If you    
#echo          want more than 10 favors, change the  
#echo          first line of this script.            
#echo                                        
#echo          This script requires the .to (dir) and
#echo          .climb (climbing) scripts.
#echo                                        
#echo          START IN CROSSING WHERE DIR IS ACCESSIBLE      
#echo                                        
#echo **********************************************************
#echo **********************************************************

pause 2

##goto rub

gate_favors:
#echo ************** GETTING AN ORB **************
put .to favors
waitfor [Siergelde, Ruins]
getfavor:
put go stone
bypass:
put kneel
put pray
pause
put pray
put pray
pause
put '%god
pause
put stand
pause
put get %god orb
pause
put go arch
goto puzzle

puzzle:
pause
match fillfont You also see a granite altar with several candles and a water jug on it, and a granite font.
match lightcandle You also see some tinders, several candles, a granite font and a granite altar.
match cleanaltar You also see a granite altar with several candles on it, a granite font and a small sponge.
match pickflowers You also see a vase on top of the altar.
match openwindow A table sits against one wall, directly opposite an ancient window.  
matchre favors_gate \[Siergelde, Stone Grotto\]|\[Mausoleum, Alcove of the Font\]
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
pause
match openwindow Roundtime
match openwindow2 cool, swift breeze
put open window
matchwait
openwindow2:
pause
match openwindow closed window
match puzzle hoist yourself
put go window
matchwait

favors_gate:
put stow orb
evalmath favors (%favors + 1)
if %favors < %2 then goto getfavor
#echo ************** FILLING THE ORB **************
move e
goto get_favor
put .to amphi
waitfor [The Crossing Amphitheater, The Back Lawn]
put get my %god orb
goto rub

rub:
match gate_favors Rub what?
match rub not yet fully prepared.
match fill_pool lacking in the type of sacrifice the orb requires.
match get_favor your sacrifice is properly prepared.
put rub %god orb
matchwait

fill_pool:
put .climb 1
pause 5
waitfor [First Provincial Bank, Lobby]
put #script abort climb
goto rub

get_favor:
#echo ************** TO THE TEMPLE **************
put get my %god orb
put .to temple
waitfor [Resurrection Creche, Li Stil rae Kwego ia Kweld]
exit
put get my %god orb
waitfor You get
put put my %god orb on altar
pause
put .to amphi
waitfor [The Crossing Amphitheater, The Back Lawn]
match gate_favors EXP HELP
match done Favors: %numfavors
put exp
matchwait

done:
pause 2                                
#echo ************** YOU NOW HAVE %num_favors FAVORS! **************
exit