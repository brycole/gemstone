
var objects stairs|table| sign| bin| drum| bucket| chest| curtain| cot| bed| desk| chair| cup| window| door| chalice| crate| bench| basket| trunk| couch| pedestal| lamp| iron| tree| painting| easel| pot| mat| plant| steps| stairs| step| stair| pond| lake| river| hole| torch| pit| rock| stool| boulder| curtain| screen| rack| hook| shelf| shelves| swing| bar| crack| slab| wall| sconce| candle| counter| couch| couches| rug| sign| portrait| plant| book| paper| cage| board| chandelier| cart
 
roomcheck:
 var tempobjects %objects
checking-room:
 var item nil
 if matchre("$roomdesc","%tempobjects") then gosub check-item $0
 if "%item" != "nil" then goto checking-room
 var tempobjects %objects
checking-room2:
 var item nil
 if matchre("$roomdobjs","%tempobjects") then gosub check-item $0
 if "%item" != "nil" then goto checking-room2
 echo Room Checked!
 exit
 

check-item:
 var item $0
put look on %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look in %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look under %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look behind %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)

put look on second %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look in second %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look under second %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look behind second %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)

put look on third %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look in third %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look under third %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
put look behind third %item
 waitforre (You see nothing|There is nothing|I could not find|What were you)
eval tempobjects replace("%tempobjects", "%item", "pink bunnies of doom")
 return