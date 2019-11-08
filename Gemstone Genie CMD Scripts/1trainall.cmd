##debuglevel 10
include base.cmd

mainstart:
## Master script trainer.

goto $charactername

##********* Character- Stoh
##*********
Stoh:
put #var combat 0
gosub put.1 "dodge" "^Roundtime:|But you are"
send .afkk
send .death
gosub ss playtrain vocals stop
##goto bypass

## priorties: stalking, hiding, magic, astro

## leave base area
gosub m.input release
gosub m.input rf
gosub move 102

## moving to train stalking/hiding
gosub move 81
gosub m.input release
gosub m.input spell shadows 30 10 30
gosub m.input rf

## map 6, crossing arch
gosub ss hidestalk beast oaf


## move to undead, NTR
gosub move 99
gosub move 118
gosub m.input release

## training PM
gosub ss weapontrain pm goblin
gosub ss weapontrain ht goblin

## learn magic in combat
gosub ss magic ease 1 orb 12
##gosub ss powerp

## return to base
gosub m.input rf
gosub move 49
gosub move 80
gosub move 71
gosub m.input release

## study non combats
gosub ss observe1
gosub ss studyc
gosub ss braid 34
gosub ss collect 34



goto Stoh
 
##********* Character- Kurav
##*********
Kurav:
put #var charpath 2

gosub put.1 "dodge" "^Roundtime:|But you are"

send .afkk
send .death
gosub ss hum
gosub ss seordwall
gosub ss hidetrain
gosub ss ppwalk
goto k.mainend

##********* Character- Iseru
##*********
Eajil:
gosub put.1 "dodge" "^Roundtime:|But you are"
send .afkk
send .death
gosub ss playtrain vocals stop

## leave base area
gosub move 1

## weapon train
gosub ss weapontrain me rat
gosub ss weapontrain tm rat
gosub ss weapontrain le rat
gosub ss weapontrain lt rat

## weapon train done

## return to base area
gosub move 212
gosub move 228

gosub ss ppwalk
## move to braiding room
gosub move 35
gosub ss braid 34
gosub ss collect 34

## move to mana combat room
gosub move 4
gosub ss magic ease 1 ring 3

goto Eajil


##********* Character- Iseru
##*********
Iseru:

gosub put.1 "dodge" "^Roundtime:|But you are"
send .afkk
send .death
gosub ss playtrain vocals

## weapon training
put #var skin 1
put #var bundle 0
##put #var room.bound 100|82
##put #var zoneb 89

gosub move 1
gosub ss weapontrain ht
gosub ss weapontrain me
gosub ss weapontrain tm
gosub ss weapontrain he
gosub ss weapontrain brawl

gosub move 1
gosub move 72
if "$roomplayers" != "" then gosub move 71
if "$roomplayers" != "" then goto skip.magic
gosub ss dance
gosub ss magic ease 4 ring 3

## weapon section done, head back to training area
##gosub ss arthsurv

skip.magic:
gosub move 228

gosub ss ppwalk
gosub move 21
gosub ss braid 34
gosub ss collect 34
gosub ss instrument_all

goto Iseru

##********* Character- Erades
##*********
Erades:

gosub put.1 "dodge" "^Roundtime:|But you are"
send .afkk
send .death
gosub ss playtrain vocals stop

## *** weapon training ***
put #var skin 1
put #var bundle 0

gosub move 1

gosub put.2 "stop play" "stop play" "^You stop|^But"
gosub put.1 "mana song 1" "^Your enchante"
put #var curr.song chant rage
gosub put.1 "$curr.song" ".+"
gosub ss weapontrain me cougar
gosub ss weapontrain he cougar

gosub put.2 "stop play" "stop play" "^You stop|^But"
gosub put.1 "mana song 1" "^Your enchante"
put #var curr.song sing lilt
gosub put.1 "$curr.song" ".+"



## hard creatures, balm required
gosub put.2 "stop play" "stop play" "^You stop|^But"
gosub put.1 "mana song 1" "^Your enchante"
put #var curr.song sing balm
gosub put.1 "$curr.song" ".+"
gosub ss weapontrain ht wolf
gosub ss weapontrain tm wolf ogre
gosub ss weapontrain lt ogre

## *** weapon section done ***

gosub move 2
gosub put.2 "climb trail" "east" "^Obvious"

gosub move 1
gosub move 15
gosub move 213
gosub move 99
gosub move 118
if "$roomplayers" != "" then put say Heya, mind if I train some magics here? Just going to cast ease burden and let them wack on me.  Thanks!
gosub ss magic ease 1 medal 6

gosub move 81
gosub move 24
gosub move 212
gosub move 228



skip.magic:
##gosub move 228

if "$guild" = "Bard" then 
{
gosub put.1 "mana song 1" "^Your enchante"
gosub put.1 "sing mere" ".+"
}
gosub ss ppwalk
gosub move 35
gosub ss braid 34
gosub ss collect 34
gosub move 4
gosub put.2 "stop play" "stop play" "^You stop|^But"
gosub ss studyc
gosub ss instrument_all

goto Erades

##********* End character section.
##*********

k.mainend:
put #parse trainall.cmd done.
exit

mainend:
goto mainstart