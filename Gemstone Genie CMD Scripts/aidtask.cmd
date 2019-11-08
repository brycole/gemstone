    if_1 goto %1

     action instant setvariable aid.done 1 when go find Zukir

     var food lollipop|sandwich|tart|cheesecake|cupcake| cake
     var drink juice|brew|tea|punch|grog|ale|wine|sherry|cider
#     goto aiding2
deliver.aid:
     var aid.done 0
put accept task
     pause 0.5
aiding:
put ask zuk for supplies;swap
     waitfor You move
aiding2:
     setvariable lockpicks 1
     setvariable flints 1
     setvariable torches 2
reroom:
     setvariable room 3
find.aid:
     if %room > 47 then goto reroom
     gosub move %room
     if "$roomobjs" = "" then goto next.aid
     var roomstuff $roomobjs
     eval roomstuff replacere("%roomstuff", " ,", "|")
     eval roomstuff replacere("%roomstuff", "You also see ", "")
     eval roomstuff replacere("%roomstuff", ", ", "|")
     eval roomstuff replacere("%roomstuff", " and ", "|")
     eval roomstuff replacere("%roomstuff", "ball and chain", "ball chain")
     eval roomstuff replace("%roomstuff", ".", "")
     eval stuffcount count("%roomstuff", "|")
     echo %roomstuff
     math stuffcount add 1
     var invItem 0
checkstuff:
     if %invItem = %stuffcount then goto next.aid
     eval result element("%roomstuff", %invItem)
     echo %result
     if matchre("%result"," ") then goto checkstuff-fail
     var npc %result
     goto supply.aid
checkstuff-fail:
     math invItem add 1
     goto checkstuff
next.aid:
     math room add 1
     goto find.aid

supply.aid:
     pause 0.1
study.npc:
     if %aid.done = 1 then goto done.aid
put study %npc
     match study.npc ...wait
     match study.npc type ahead
     match nope.npc about a number of topics
     match nope.npc a studious look
     match nope.npc see nothing special
     match give.torch need of torch
     match give.flint need of flint
     match give.lockpick need of lockpick
     match give.food Perhaps you could spare some food
     match give.drink sign of dehydration
     match nope.npc Study what
     matchwait


nope.npc:
     goto next.aid
give.food:
put look in my dirty sack
     matchre giving.food (lollipop|sandwich|tart|cheesecake|cupcake| cake)(,|\.)
     match restock.aid .
     matchwait
giving.food:
     var item $1
     gosub give.dat.shit %item
     goto study.npc
give.drink:
put look in my dirty sack
     matchre giving.drink (juice|brew|tea|punch|grog|ale|wine|sherry|cider|coffee|champagne)(,|\.)
     match restock.aid .
     matchwait
giving.drink:
     var item $1
     gosub give.dat.shit %item
     goto study.npc
give.torch:
     if %torches < 1 then goto restock.aid
     gosub give.dat.shit torch
     if %bad.give = 0 then math torches subtract 1
     goto study.npc
give.lockpick:
     if %lockpicks < 1 then goto restock.aid
     gosub give.dat.shit lockpick
     if %bad.give = 0 then math lockpicks subtract 1
     goto study.npc
give.flint:
     if %flints < 1 then goto restock.aid
     gosub give.dat.shit flint
     if %bad.give = 0 then math flints subtract 1
     goto study.npc

give.dat.shit:
     var bad.give 0
     var shit $0
put get my %shit;give %npc
     match bunk.give I'm not in need of any supplies
     match done.give.shit Roundtime
     matchwait
done.give.shit:
     pause 0.1
     return
bunk.give:
     var bad.give 1
put put my %shit in my dirty sack
     waitfor You put
     return
restock.aid:
     var backroom $roomid
put drop my dirty sack
     waitfor You drop
     gosub move 1
put ask zuk for supplies;swap
     waitfor You move
     setvariable lockpicks 1
     setvariable flints 1
     setvariable torches 2
     var room %backroom
     goto find.aid
     goto aiding


done.aid:
put drop my dirty sack
     waitfor You drop
     gosub move 1
put ask zuk about task complete
     pause 0.1
put #parse TASK COMPLETE
     exit




move.retry:
        math move.retry add 1
        if %move.retry > 3 then goto move.fail
        echo ***
        echo *** Retrying move to $1 $2 in %move.retry second(s).
        echo ***
        pause %move.retry
        goto move.goto
move:
        var move.skip 0
        var move.retry 0
        var move.fail 0
        var move.room $0
        echo Moving to $0
        put #statusbar Moving to $0
        if $roomid = %move.room then return
move.goto:
        matchre move.return ^YOU HAVE ARRIVED
        matchre move.skip ^SHOP CLOSED
        matchre move.retry ^MOVE FAILED
        matchre move.fail ^DESTINATION NOT FOUND
        matchre move.fail ^Destination not found
        put #goto %move.room
        matchwait
move.fail:
        var move.fail 1
        goto move.return
move.skip:
        var move.skip 1
move.return:
        return
