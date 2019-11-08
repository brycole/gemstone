    if_1 goto %1

     if "$righthand" != "Empty" then if "$lefthand" != "Empty" then echo . [ Start by Zukir with both hands empty ]
     if "$righthand" != "Empty" then if "$lefthand" != "Empty" then exit



     var escort.array 2|3|4|5|7|8|9|20|21|22|23|24|25|26|27|28


get.task:
put ask zuk for task
     match decline.task You'll need to get your hands dirty and KILL the invaders to find them
     match decline.task Are you up to the task of SEARCHing the sewers to remove these threats
     match decline.task We could use some help thinning their numbers.
     match combo.task Each had a unique combination known only to select guardsmen and royals.
     match escort.task task you with finding these lost adventurers and leading them back to me for debriefing
     match search.task Will you SEARCH and recover these items, adventurer
     match aid.task won't have to search for your allies, they'll be on the front lines trying to complete their own
     match decline.task decline by typing DECLINE
     matchwait
decline.task:
put decline task
     waitfor paperwork from your last task has probably been finalized
     goto get.task

aid.task:
put .aidtask
     waitfor TASK COMPLETE
     goto get.task


combo.task:
put accept task
     pause 0.5
     gosub move 47

search.combo:
     pause 0.5
move climb ladder
searching.combo:
     pause 0.1
put search
     match crack.combo ...wait
     match bad.room You search around for a moment
     match bad.room you searched this area recently
     match crack.combo as you're about to give up, you flip over
     match crack.combo gleaming chest
     match searching.combo Roundtime
     matchwait
bad.room:
echo
echo . [ You have too recently found something in this room. Please move around the area and search. When you find the chest, tap it. ]
echo
pause 2
put put
     goto more.chests2
crack.combo:
     pause 0.5
     gosub crack red
     gosub crack blue
     gosub crack green
put pull latch
     pause 1
put look in chest;exp
     matchre good.chest you see .* (cloak|necklace|ring|robe|chart|gown)
     matchre shit.chest EXP HELP
     matchwait
good.chest:
     pause 0.1
     var item $1
put get %item in chest;stow %item
     pause
shit.chest:
put task
     match more.chests Lord Zukir wants you to crack
     match chest.done successfully acquired enough for now
     matchwait
more.chests:
echo
echo . [ You have one more chest to crack. I can not find my way in the sewers. Please check rooms and SEARCH for the chest. Once you find it, tap it. ]
echo
put get
more.chests2:
     action echo [ This is a spot! Keep searching here! ] when You poke and prod, but fail to find anything of interest
put #beep
     waitfor You tap a gleaming chest
     action remove You poke and prod, but fail to find anything of interest
     gosub crack red
     gosub crack blue
     gosub crack green
put pull latch
     pause 0.5
put look in chest;exp
     matchre good.chest2 you see .* (cloak|necklace|ring|robe|chart|gown)
     matchre shit.chest2 EXP HELP
     matchwait
good.chest2:
     pause 0.1
     var item $1
put get %item in chest;stow %item
     waitfor You put
shit.chest2:
echo
echo . [ Now that your task is complete please lead back to the ladder and tap it. ]
echo
put spin
put #beep
     waitfor You tap a ladder
     goto shit.chest

chest.done:
     move climb ladder
     pause 0.5
     gosub move 1
put ask zuk about task complete
     pause 0.5
     goto get.task

crack:
     var dial $1
cracking:
put turn %dial dial
     matchre cracking You turn the (\w+) dial to (\d+).$
     matchre cracking A faint tick can be heard from the mechanism.
     matchre cracked A faint click can be heard from the mechanism.
     match cracked You try to turn the dial
     matchwait
cracked:
put push %dial dial
     waitfor You push
     return



search.task:
put accept task
     waitforre Ulf'Hara Keep Ruins, (.+)
     gosub move $1
searching.task:
     pause 0.1
put search
     match searching.task ...wait
     match return.search quickly snatch it up before a foe
     match searching.task Roundtime
     matchwait
return.search:
     gosub move 1
put give zuk
     pause 0.5
     goto get.task

escort:
escort.task:
put accept task
     pause 0.5
     setvariable room 1
     action instant setvariable there 1 when following you
search.rooms:
     if %room = 6 then goto next.room
     if %room = 10 then var room 20
     gosub move %room
put search
     match next.room Roundtime
     match next.room You're pretty sure you searched this area
     matchwait 2
     goto escorting
next.room:
     pause 2
     math room add 1
     goto search.rooms
escorting:
     var there 0
     math room subtract 1
     if %room = 6 then goto escorting
     if %room = 19 then var room 9
     gosub move %room
     if %there = 0 then waitfor following you
     if %room = 1 then goto complete
     goto escorting
complete:
     waitfor ASK ZUKIR ABOUT TASK COMPLETE
put ask zuk about task complete
     pause 0.5
     goto get.task

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
