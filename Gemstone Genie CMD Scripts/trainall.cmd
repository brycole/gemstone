#debuglevel 10
## Master script trainer.

## set combat var to control combats/afk scripts
put #var combat 0
include base.cmd

mainstart:


goto $charactername

##********* Character- Stoh
##*********
Stoh:
	
## initialize script
gosub put.1 "dodge" "^Roundtime:|But you are"
send .afkk
send .gmcheck
send .death
gosub ss playtrain vocals stop
##goto bypass

## priorties: stalking, hiding, magic, astro

## leave base area
## moving to train stalking/hiding
##gosub prep shadows 20
##gosub harness 10 40
#delay 7
#gosub cast
#gosub rf
## **move to silver leucros
##gosub move 668
##gosub move 67

## ** muspari combat
#gosub move 366


## training PM
#gosub m.input release
#gosub ss weapontrain pm tightwad pinchfist skinflint
#gosub ss magic
#gosub ss shield

## return to base
#gosub rf
##gosub move 1

## selling bundles & gems
#gosub move 247
#gosub ss sellgem
#gosub ss sellbund
#gosub rf


##put #script pause afkk

## ** Auto Empath
##gosub put.1 "go gate" "^Obvious"
##gosub walk north
#gosub move 148

##check.path:
#if "$roomplayers" = "" then gosub put.1 "lie" "^You lie"
#else 
#		{
#			delay 10
#			goto check.path
#		}
#		gosub rel
#waitforre ^You sit up.
#gosub put.1 "dance" "^You leap"
#put #script resume afkk
#if "$roomplayers" != "" then gosub put.1 "wave" ".+"

## ** run to the ratha green
##gosub move 49
##gosub rf
##gosub move 387

## ** run to muspari town center
#gosub move 3
#gosub rel

## study non combats
gosub ss learnteach
gosub ss magic
gosub ss pmtrain
gosub ss observe1
gosub ss studyc
gosub ss braid 20
gosub ss collect 20
bypass:
## move to climbing
put #script abort gmcheck
gosub rf
gosub move 348

gosub ss climbpractice

gosub move 53
gosub move 277

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

##********* Character- Ishram
##*********
Ishram:
gosub put.1 "dodge" "^Roundtime:|But you are"
send .afkk
send .death
gosub ss playtrain vocals stop
put #var skin 1
put #var bundle 1

## priorties: ??
##gosub ss lockpick

#put #var spellup 0
## running to rock trolls
gosub move 14
gosub move 173
gosub move 99
## rock troll entrance
gosub move 137

gosub ss weapontrain tm troll
gosub ss weapontrain lt troll
gosub ss weapontrain me troll

## from NTR to N gate
gosub move 36
gosub move 81
gosub move 24

gosub walk e
gosub ss sellbund

## parry/shield evasion training training
## running to reavers
gosub move 173
gosub move 99
gosub move 135
gosub ss shield
gosub ss hidestalk reaver hound

## moving to goblin area from NTR
gosub move 49
gosub move 81
gosub move 24
gosub move 172

##gosub ss parry
gosub ss goblinbrook

gosub move 14
gosub move 173
gosub move 99
## rock troll entrance
gosub move 137

gosub ss weapontrain tm troll
gosub ss weapontrain lt troll
gosub ss weapontrain me troll

## from NTR to N gate
gosub move 36
gosub move 81
gosub move 24

gosub walk e
gosub ss sellbund
gosub move 172

## study non combats
gosub move 13
gosub ss instrumentall
gosub ss braid 34
delay 5
gosub ss collect 34

## study magics
gosub ss ppwalk


goto Ishram

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

#skip.magic:
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



#skip.magic:
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