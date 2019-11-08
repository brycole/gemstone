 if $charactername = "Elriic" then
 {
     setvariable ingot-type bronze
     setvariable main-storage lootsack
     setvariable unfinished-storage backpack
     setvariable town crossing
     setvariable hammer ball hammer
     setvariable tongs box tong
     setvariable pliers pliers
     setvariable shovel wide shovel
     setvariable autorepair on
     setvariable work-difficulty hard
     setvariable work-type armor
     setvariable train-scholarship off
     setvariable mass-volume-limit 300
     setvariable backup-ingotdeed-storage sack in silverweave lootsack
     setvariable train-foraging off
     setvariable to-collect wood chip
     setvariable follower Expert Trader Mofasah
     setvariable stamp-items on
     setvariable stamp basic stamp
     setvariable train-humming off
     setvariable hum-song-1 hymn loud
     setvariable hum-song-2 lament loud
     setvariable hum-song-3 rumba halting
 }
 if $charactername = "Mofasah" then
 {
     setvariable ingot-type bronze
     setvariable main-storage silverweave lootsack
     setvariable unfinished-storage mer pack
     setvariable town crossing
     setvariable hammer ball hammer
     setvariable tongs box tong
     setvariable pliers pliers
     setvariable shovel wide shovel
     setvariable autorepair on
     setvariable work-difficulty hard
     setvariable work-type black
     setvariable train-scholarship off
     setvariable mass-volume-limit 300
     setvariable backup-ingotdeed-storage sack in silverweave lootsack
     setvariable train-foraging off
     setvariable to-collect wood chip
     setvariable follower Guardian of Elements Elriic
     setvariable stamp-items on
     setvariable stamp basic stamp
     setvariable train-humming off
     setvariable hum-song-1 hymn loud
     setvariable hum-song-2 lament loud
     setvariable hum-song-3 rumba halting
 }




#%
#% PLEASE READ!!!   PLEASE READ!!!   PLEASE READ!!!   PLEASE READ!!!  PLEASE READ!!!  PLEASE READ!!!
#% PLEASE READ!!!   PLEASE READ!!!   PLEASE READ!!!   PLEASE READ!!!  PLEASE READ!!!  PLEASE READ!!!
#%
#% :)
#% ingot type = what material you'll be working with, this way the smith doesn't mix ingots up if you have multiple different ingots or deeds.
#% main-storage = where you keep your tools, book, etc.
#% unfinished-storage = where you keep things you're working on, this should be seperate from main storage as to ensure you dont mix up your forging tongs with any work order tongs you might be making for example.
#% town = where you'll be using it. current supported towns are crossing and kresh.
#% hammer = the type of forging hammer will be pounding with and should be 2 words as to not get it confused with any throwing hammers or anything you might have stashed somewhere.
#% tongs = the type of tongs you will be forging with and should be 2 words for the same reason as above.
#% shovel = you guessed it.
#% pliers = ditto.
#% autorepair = smithbot will autorepair your tools if this is on, it is advised to have on, and would be even better if you have the tool repair techniques.
#% work-difficulty = the difficulty of work orders you'll be doing. hard, challenging, or easy.
#% work-type = the type of work orders you will be doing. armor, weapons or blacksmith
#% train-scholarship = them crafting books teach great scholarship, if this is on then between work orders smithbot will browse the book a bit to train scholarship.
#% mass-volume-limit = to keep from burning up too much material too fast, mass-volume-limit was created. if the total volume that will be consumed by your work order is greater than mass-volume-limit then smithbot will get a different work order instead. example, if you get an order for 10 scimitars which take 6 volume each and have your limit set to 50, smithbot will say "6 x 10 = 60 > 50 so i need to get a different work order"
#% backup-ingotdeed-storage = where you keep your backup ingots, in deed form, for when you run out of material.
#% train-foraging = you can forage in the forge :D smithbot will collect piles in between work orders to bump foraging and perception up a bit.
#% follower = if you have someone following to listen or teach a class, this should be whatever you would see in the room, such as "Also here: Awesome Gavinne" follower should be Awesome Gavinne
#% stamp-items = stamping items improves the pay and the prestige you gain from work orders. if this is on, smithbot will stamp your items.
#% stamp = the type of stamp you have if you have one.
#% train-humming = if you wish to train vocals while running smithbot
#% hum-song-# = smithbot will select a song at random from the 3 songs you have selected when humming.
#%
#% IMPORTANT !
#% For self smithing (making items for yourself to sell or whatever) type...
#% .smithie WORKTYPE QUANTITY METALTYPE "ITEMFULLNAME"
#% EXAMPLE : .smithie weapon 6 steel "a metal scimitar"
#% Items full name must be fully typed out and in quotes.
#%
#% Start in first room of the forge, for example, if in xings, you go building to enter the forge, that room you are in after you go building is where you should start it.
#%
#%
#%
#%
#%
#% Don't touch anything below here :)
#% Don't touch anything below here :)
#% Don't touch anything below here :)
#% Don't touch anything below here :)
#% Don't touch anything below here :)
#% Don't touch anything below here :)
#%
#%
#%
#%
#%

     setvariable book %work-type book
     action instant setvariable test-item $2 when This logbook is tracking a work order requiring you to craft (a|an|some) metal (.+)\.  You must bundle and deliver
     action instant setvariable quantity $1 when You must bundle and deliver (\d+) more within
     action setvariable finished 1 when Applying the final touches, you complete working on
     action setvariable cool 1 when (appears ready for cooling in the slack tub|complete and ready for a quench hardening in the slack)
     action setvariable just.stow 1 when Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2
     action setvariable left-overs 1 when so you split the ingot and leave the portion you won't be using on the ground
     action setvariable are-you-humming 0 when You finish humming
     setvariable are-you-humming 0
     if "%train-humming" != "on" then setvariable are-you-humming 1
     action setvariable finish-mode 1 when toggle finish on
     action setvariable finish-mode 0 when toggle finish off
     setvariable finish-mode 0
     setvariable coin-intake 0
     setvariable orders-completed 0
     action instant math coin-intake add $1 when You hand .* your logbook and bundled items, and are given (\d+)
     action instant math coin-intake subtract $1 when pay the sales clerk (\d+)
     action instant setvariable oil-gone 1 when The oil is all used up, so you toss
     setvariable oil-gone 0
     setvariable repaired-stuff 0
     setvariable total-items-made 0
     setvariable total-volume-consumed 0
     setvariable average-volume-per-item 0
     setvariable average-profit-per-item 0
     setvariable average-profit-per-workorder 0
     setvariable self-smithing 0

     if_1 setvariable work-type %1
     if_1 setvariable book %1 book
     if_1 setvariable self-smithing 1
     if_1 goto if2check
     goto find-getwork-%town

if2check:
     if_2 setvariable quantity %2
     if_2 goto if3check
echo If you are running this to craft goods for yourself, please restart properly. For help, read the PLEASE READ section at the top of the script.
     exit
if3check:
     if_3 setvariable ingot-type %3
     if_3 goto if4check
echo If you are running this to craft goods for yourself, please restart properly. For help, read the PLEASE READ section at the top of the script.
     exit
if4check:

     if_4 setvariable full-item-name %4
     gosub test-set-base %full-item-name uber
     setvariable item-name %full-item-name
     setvariable item %item-basename
     echo Item Full Name : %full-item-name
     echo Item Base Name : %item-basename
     gosub verb get my %book
     setvariable book-chapter 0

turn-selfsmith-add:
     math book-chapter add 1
turn-selfsmith:
     pause 1
put turn my book to chapter %book-chapter
     matchre turn-selfsmith (type ahead|...wait)
     match selfsmithbook-fail does not have a chapter
     matchre read-selfsmith (You turn your book to|already turned to)
     matchwait
read-selfsmith:
     pause 0.1
put read my book;exp
     matchre setpage-selfsmith Page (\d+): %4
     match turn-selfsmith-add EXP HELP
     matchwait
selfsmithbook-fail:
     echo
     echo Could not find your item, %4, in your %book . Please check spelling and capitalization and try again. For more  help, read the PLEASE READ section at the top of the script.
     echo
     exit
setpage-selfsmith:
     setvariable item-chapter %book-chapter
     setvariable page $1
     echo Quantity %3
     echo Item %4
     echo Chapter %item-chapter
     echo Page %page
     gosub verb put my book in my %main-storage
     goto find-getwork-%town
     
find-getwork-shard:
     setvariable forge-1 657
     setvariable forge-2 652
     setvariable forge-3 648
     setvariable forge-4 660
     setvariable grindstone-1 657
     setvariable grindstone-2 652
     setvariable grindstone-3 648
     setvariable gridnstone-4 660
     setvariable supplies 653
     setvariable hunt-room 645
     setvariable master Serric
     gosub new-find-master
     gosub get-work
     goto find-anvil-shard
shard-wait:
     gosub move %supplies
     pause 60
find-anvil-shard:
     gosub move %forge-1
     if "$roomplayers" != "" then gosub move %forge-2
     if "$roomplayers" != "" then gosub move %forge-3
     if "$roomplayers" != "" then gosub move %forge-4
     if "$roomplayers" != "" then goto shard-wait
     goto anvil-found

find-turn.in-shard:
find-turn.in2-shard:
     gosub new-find-master
     gosub turn.in
     goto find-anvil-shard




new-find-master:
     gosub move %hunt-room
     if matchre("$roomobjs","%master") then return
     action setvariable tempdir $1 when To the (.+):
     action setvariable directions %tempdir when %master
put hunt
     waitfor Roundtime
     action remove To the (.+):
     action remove %master
     if matchre("$roomobjs","%master") then return
     eval directions replacere("%directions", ", ", "|")
     eval listCount count("%directions","|")
     math listCount add 1
     var invItem 0
listArray:
     if %invItem = %listCount then goto doneListingArray
     eval result element("%directions", %invItem)
move %result
     math invItem add 1
     goto listArray
doneListingArray:
     return

find-getwork-crossing:
find-getwork-crossings:
find-getwork-cross:
find-getwork-cros:
find-getwork-xing:
find-getwork-xings:
     if %self-smithing = 0 then echo . [ Finding Yalda to get work orders.. ]
     if %self-smithing = 1 then echo . [ Finding an empty forge room ... ]
     setvariable got-work 0
     setvariable master-there 0
     setvariable master Yalda
     if %self-smithing = 1 then setvariable got-work 1

     action instant setvariable master-there 1 when Forging Society Mistress Yalda
put look
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     if %got-work = 0 then pause 0.5
     put w
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put e
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put e
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put w
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     action remove Forging Society Mistress Yalda
     if %master-there = 0 then move n
     if %master-there = 0 then move n
     if %master-there = 0 then goto find-getwork-Xings
     goto find-anvil-%town

get-work:
     if %finish-mode = 1 then goto finish-up
     if %got-work = 1 then return
     gosub verb get logbook in my %main-storage
     gosub verb ask %master for %work-difficulty %work-type work
     gosub verb put my logbook in my %main-storage
     setvariable got-work 1
     return

find-anvil-crossing:
find-anvil-crossings:
find-anvil-cross:
find-anvil-cros:
find-anvil-xing:
find-anvil-xings:
echo . [ Finding empty forge.. ]
     setvariable forge-room nil
     gosub room-test go first arch
     if %taken = 0 then setvariable temp-room x1
     if %taken = 0 then goto anvil-found
     move go arch
     gosub room-test go second arch
     if %taken = 0 then setvariable temp-room x2
     if %taken = 0 then goto anvil-found
     move go arch
     gosub room-test go third arch
     if %taken = 0 then setvariable temp-room x3
     if %taken = 0 then goto anvil-found
     move go arch
     move n
     move n
     gosub room-test go door
     if %taken = 0 then setvariable temp-room x4
     if %taken = 0 then setvariable forge-room xings1
     if %taken = 0 then goto anvil-found
     move go building
     move s
     move s
echo . [ All forges currently in use, waiting 30 seconds then retrying.. ]
     pause 30
     goto find-anvil-Xings
anvil-found:
     goto read-logbook

analyze-ingot2:
     pause 0.5
put analyze %ingot-type ingot in my %unfinished-storage
     matchre analyze-ingot-true About (\d+) volume of metal was used in this
     match not-enough What were you referring
     matchwait
     goto analyze-ingot-true
analyze-ingot:
     pause 0.5
put analyze %ingot-type ingot in my %main-storage
     matchre analyze-ingot-true About (\d+) volume of metal was used in this
     match not-enough What were you referring
     match analyze-ingot2 Analyze what?
     matchwait
analyze-ingot-true:
     setvariable ingot-volume $1
     pause 0.5
     echo mass-volume %mass-volume
     echo volume %volume
     echo quantity %quantity
     setvariable temp-quant %quantity
     echo ingot-volume %ingot-volume
     if %volume > %ingot-volume then goto not-enough
     return
not-enough:
     echo . [ Not Enough Material To Make %quantity %item-name ! ]
     pause 0.5
put get %ingot-type deed in my %backup-ingotdeed-storage
     match got-backup-ingot You get
     matchre no-backup-ingot (could not find|What were you)
     matchwait
got-backup-ingot:
     if "%temp-room" = "x4" then move go building
     gosub verb tap my deed
     pause 0.5
put get ingot
     waitforre (You pick up|already holding)
     if "%temp-room" = "x4" then move go door
     gosub verb put my %ingot-type ingot in my %main-storage
     goto analyze-ingot
no-backup-ingot:
     echo . [ All out of back up materials ! ]
     exit


logbook-read:
     gosub verb put my book in my %main-storage
     setvariable to-make %quantity
book:
     gosub analyze-ingot
     if "%autorepair" = "on" then gosub repairs
     gosub verb get %ingot-type ingot in my %main-storage
     gosub verb get %ingot-type ingot in my %unfinished-storage
     gosub verb put my ingot on anvil
     gosub verb get my %book
     gosub verb study my book
     gosub verb put my book in my %main-storage
     gosub verb get my %hammer
     gosub verb get my %tongs

     setvariable left-overs 0
     setvariable just.stow 0
     setvariable finished 0
     setvariable cool 0
     setvariable verb-track 0
pound.p:
     pause 0.5
pound:
     if %left-overs = 1 then goto left-overs
     if %cool = 1 then goto tub
     if %verb-track = 0 then put pound ingot on anvil with my hammer
     if %verb-track = 1 then put pound %item on anvil with my hammer
     setvariable verb-track 1
     matchre pound.p (type ahead|...wait)
     match shovel the fire dies down and needs more fuel
     match shovel the fire dies down and appears to need some more fuel
     match bellows the fire flickers and is unable to consume its fuel
     match bellows fire dims and produces less heat from the stifled
     match turn could use some straighting along the horn of the anvil
     match turn could use some straightening along the horn of the anvil
     match turn would benefit from some soft reworking
     match turn The metal now looks ready to be turned into wire
     match tub The metal now appears ready for cooling in the slack tub
     match tub complete and ready for a quench hardening in the slack tub
     match turn must be transfered to plate molds and drawn into wire on a mandrel
     match turn drawn into wire on a mandrel
     match oil The worked metal looks to be in need of some oil to preserve and protect it
     match pound Roundtime
     matchwait
left-overs:
     gosub verb put my hammer in my %main-storage
     gosub verb get %ingot-type ingot
     gosub verb put my %ingot-type ingot in my %main-storage
     gosub verb get my %hammer in my %main-storage
     setvariable left-overs 0
     goto pound
shovel:
     gosub verb put my hammer in my %main-storage
     gosub verb get my %shovel in my %main-storage
     gosub verb push fuel with my shovel
     gosub verb put my shovel in my %main-storage
     gosub verb get %hammer in my %main-storage
     goto pound
bellows:
     gosub verb put my hammer in my %main-storage
     gosub verb get bellow in my %main-storage
     gosub verb push bellow
     gosub verb put my bellow in my %main-storage
     gosub verb get %hammer in my %main-storage
     goto pound
turn:
     gosub verb turn %item on anvil with my tong
     goto pound
tub:
     gosub verb push tub
     gosub verb put my hammer in my %main-storage
     gosub verb put my tong in my %main-storage
     gosub verb get %item on anvil
     if %shieldhandle > 0 then gosub handle-assembly

just.stow:
     gosub verb put my %item in my %unfinished-storage
     math to-make subtract 1
     if %to-make > 0 then goto book
     goto find-grindstone-%town

handle-assembly:
     gosub verb get handle in my %unfinished-storage
     pause 0.5
     gosub verb assemble my %item with my handle
     pause 0.5
     gosub verb put my %item on anvil
     pause 0.5
     gosub verb get %hammer in my %main-storage
     pause 0.5
     gosub verb get %tongs in my %main-storage
     pause 0.5
     gosub verb pound %item on anvil with my hammer
     pause 0.5
     gosub verb put my hammer in my %main-storage
     pause 0.5
     gosub verb put my tong in my %main-storage
     pause 0.5
     gosub verb get %item on anvil
     return


temper:
     pause
put put my %item on forge
     waitfor This process can make an item more durable
     pause 0.5
     gosub verb put my %item on forge
     gosub verb get %tongs in my %main-storage
temper-turn.p:
     pause 0.5
temper-turn:
put turn %item on forge with my tong
     matchre temper-bellows (the fire dims and produces less heat from the stifled coals|the fire flickers and is unable to consume its fuel)
     matchre temper-shovel (the fire dies down and needs more fuel|the fire dies down and appears to need some more fuel)
     matchre temper-done (looks to be in need of some oil to preserve and protect it|now needs to be cleaned of the clay by pouring oil on it)
     match temper-turn Roundtime
     matchwait
temper-shovel:
     gosub verb get %shovel in my %main-storage
     gosub verb push fuel with my shovel
     gosub verb put my shovel in my %main-storage
     goto temper-turn
temper-bellows:
     gosub verb get bellow in my %main-storage
     gosub verb push my bellow
     gosub verb put my bellow in my %main-storage
     goto temper-turn
temper-done:
     gosub verb get oil in my %main-storage
     gosub verb pour my oil on %item
     gosub verb put %item in my %main-storage
     return


find-grindstone-shard:
     gosub move %supplies
     setvariable placement first
     setvariable to-assemble %quantity

if %hilt = 1 then gosub assemble hilt
if %haft = 1 then gosub assemble haft
if %longcord = 1 then gosub assemble long cord
if %shortcord = 1 then gosub assemble short cord
if %longpole = 1 then gosub assemble long pole
if %shortpole = 1 then gosub assemble short pole
if %shieldboss = 1 then gosub assemble shield boss

if %largepad > 0 then gosub assemble-armor %largepad large padding
if %smallpad > 0 then gosub assemble-armor %smallpad small padding
if %leatherstrips > 0 then gosub assemble-armor %leatherstrips leather strips
if %smallback > 0 then gosub assemble-armor %smallback small backing
if %largeback > 0 then gosub assemble-armor %largeback large backing
     setvariable plier-pull 0
if %largepad = 1 then setvariable plier-pull 1
if %smallpad = 1 then setvariable plier-pull 1
if %leatherstrips = 1 then setvariable plier-pull 1
if %smallback = 1 then setvariable plier-pull 1
if %largeback = 1 then setvariable plier-pull 1

if %plier-pull = 1 then gosub plier-pull


     setvariable to-grind %quantity
         if !contains("%work-type","weapon") then goto oil-items
         gosub move 657
     goto grinding

find-grindstone-crossing:
find-grindstone-crossings:
find-grindstone-cross:
find-grindstone-cros:
find-grindstone-xing:
find-grindstone-xings:
     if "%forge-room" = "xings1" then move go building
     if "%forge-room" = "xings1" then move s
     if "%forge-room" != "xings1" then move go arch
     if "%forge-room" != "xings1" then move n
     move e
     setvariable placement first
     setvariable to-assemble %quantity

if %hilt = 1 then gosub assemble hilt
if %haft = 1 then gosub assemble haft
if %longcord = 1 then gosub assemble long cord
if %shortcord = 1 then gosub assemble short cord
if %longpole = 1 then gosub assemble long pole
if %shortpole = 1 then gosub assemble short pole
if %shieldboss = 1 then gosub assemble shield boss

if %largepad > 0 then gosub assemble-armor %largepad large padding
if %smallpad > 0 then gosub assemble-armor %smallpad small padding
if %leatherstrips > 0 then gosub assemble-armor %leatherstrips leather strips
if %smallback > 0 then gosub assemble-armor %smallback small backing
if %largeback > 0 then gosub assemble-armor %largeback large backing

     setvariable plier-pull 0
if %largepad = 1 then setvariable plier-pull 1
if %smallpad = 1 then setvariable plier-pull 1
if %leatherstrips = 1 then setvariable plier-pull 1
if %smallback = 1 then setvariable plier-pull 1
if %largeback = 1 then setvariable plier-pull 1

if %plier-pull = 1 then gosub plier-pull


     setvariable to-grind %quantity
     if !contains("%work-type","weapon") then goto oil-items
     move s
     goto grinding

oil-items:
     gosub verb get %item in my %unfinished-storage
     gosub verb get oil in my %main-storage
     setvariable oil-gone 0
     if "%item-basename" != "chest" then gosub verb pour my oil on my %item-basename
     if "%item-basename" = "chest" then gosub verb pour my oil on %item-basename
     if %oil-gone = 1 then put order 6
     if %oil-gone = 1 then waitfor The attendant says
     if %oil-gone = 1 then put order 6
     if %oil-gone = 1 then waitfor The attendant takes
     gosub verb put my oil in my %main-storage
     if "%stamp-items" = "on" then gosub stamp-items2-%town
     if %self-smithing = 1 then gosub verb put my %item-basename in my %main-storage
     if %self-smithing = 0 then gosub verb get logbook in my %main-storage
     if %self-smithing = 0 then gosub verb bundle my %item-basename with my logbook
     if %self-smithing = 0 then gosub verb put my logbook in my %main-storage
     math to-grind subtract 1
     if %to-grind > 0 then goto oil-items
     if %self-smithing = 1 then echo . ALL DONE!
     if %self-smithing = 1 then exit
     goto find-turn.in2-%town

stamp-items2-shard:
     gosub move 648
     if ($charactername = "Mofasah") then
      {
       gosub verb get %stamp in my mer loot
      }
     else
      {
       gosub verb get %stamp in my %main-storage
      }
     gosub verb mark my %item with my %stamp
     if ($charactername = "Mofasah") then
      {
       gosub verb put my %stamp in my mer loot
      }
     else
      {
       gosub verb put my %stamp in my %main-storage
      }
     gosub move %supplies
     return


stamp-items2-crossing:
stamp-items2-crossings:
stamp-items2-cross:
stamp-items2-cros:
stamp-items2-xing:
stamp-items2-xings:
     move w
     move s
     move go arch
     if ($charactername = "Mofasah") then
      {
       gosub verb get %stamp in my mer loot
      }
     else
      {
       gosub verb get %stamp in my %main-storage
      }
     gosub verb mark my %item with my %stamp
     if ($charactername = "Mofasah") then
      {
       gosub verb put my %stamp in my mer loot
      }
     else
      {
       gosub verb put my %stamp in my %main-storage
      }
     move go arch
     move n
     move e
     return

stamp-items2-kresh:
stamp-items2-merk:
stamp-items2-merkresh:
     move n
     move go curtain
     move w
     if ($charactername = "Mofasah") then
      {
       gosub verb get %stamp in my mer loot
      }
     else
      {
       gosub verb get %stamp in my %main-storage
      }
     gosub verb mark my %item with my %stamp
     if ($charactername = "Mofasah") then
      {
       gosub verb put my %stamp in my mer loot
      }
     else
      {
       gosub verb put my %stamp in my %main-storage
      }
     move e
     move go curtain
     move s
     return



assemble-armor:
     echo . [ Requiring $1 $2 $3 ]
     setvariable place-track %quantity
     setvariable temp-count-static $1
     setvariable temp-assembly $2 $3
     setvariable placement first
     setvariable temp-track %to-assemble

assemble-armor-check:
     pause 1
     if %place-track < 1 then goto assemble-armor-stow2
     setvariable temp-count %temp-count-static
     gosub verb get %placement %item-basename in my %unfinished-storage
     if "%placement" = "ninth" then setvariable placement tenth
     if "%placement" = "eighth" then setvariable placement ninth
     if "%placement" = "seventh" then setvariable placement eighth
     if "%placement" = "sixth" then setvariable placement seventh
     if "%placement" = "fifth" then setvariable placement sixth
     if "%placement" = "fourth" then setvariable placement fifth
     if "%placement" = "third" then setvariable placement fourth
     if "%placement" = "second" then setvariable placement third
     if "%placement" = "first" then setvariable placement second
     math place-track subtract 1


assemble-armor-loop:
put buy %temp-assembly
     pause 1
     gosub verb assemble my %item-basename with my %temp-assembly
     math temp-count subtract 1
     if %temp-count > 0 then goto assemble-armor-loop
     math temp-track subtract 1
     if %temp-track > 0 then goto assemble-armor-stow

assemble-armor-stow2:
     pause 0.5
     gosub verb put my %item-basename in my %unfinished-storage
     return

assemble-armor-stow:
     pause 0.5
     gosub verb put my %item-basename in my %unfinished-storage
     goto assemble-armor-check









assemble:
     setvariable assemble $0
     if "$0" = "long leather cord" then setvariable assemble long cord
     if "$0" = "short leather cord" then setvariable assemble short cord
     if "$0" = "small cloth padding" then setvariable assemble small padding
     if "$0" = "large cloth padding" then setvariable assemble large padding
     if "$0" = "small leather backing" then setvariable assemble small backing
     if "$0" = "large leather backing" then setvariable assemble large backing
     if "$0" = "small padding" then setvariable assemble small padding
     if "$0" = "large padding" then setvariable assemble large padding
     if "$0" = "small backing" then setvariable assemble small backing
     if "$0" = "large backing" then setvariable assemble large backing
     if "$0" = "short oak pole" then setvariable assemble short pole
     if "$0" = "long oak pole" then setvariable assemble long pole
     if "$0" = "haft" then setvariable assemble haft
     if "$0" = "hilt" then setvariable assemble hilt
     if "$0" = "leather strips" then setvariable assemble leather strips
     if "$0" = "shield boss" then setvariable assemble shield boss
     if "$0" = "shield handle" then setvariable assemble shield handle
     if "$0" = "long wooden pole" then setvariable assemble long pole
     if "$0" = "short wooden pole" then setvariable assemble short pole
assembling:
put buy %assemble
     pause 0.5
     gosub verb get %placement %item-basename in my %unfinished-storage
     if "%placement" = "ninth" then setvariable placement tenth
     if "%placement" = "eighth" then setvariable placement ninth
     if "%placement" = "seventh" then setvariable placement eighth
     if "%placement" = "sixth" then setvariable placement seventh
     if "%placement" = "fifth" then setvariable placement sixth
     if "%placement" = "fourth" then setvariable placement fifth
     if "%placement" = "third" then setvariable placement fourth
     if "%placement" = "second" then setvariable placement third
     if "%placement" = "first" then setvariable placement second
     gosub verb assemble my %item-basename with my %assemble
     gosub verb put my %item-basename in my %unfinished-storage
     math to-assemble subtract 1
     if %to-assemble > 0 then goto assembling
     return

grinding:
     gosub verb get %item-basename in my %unfinished-storage
     gosub verb turn grindstone
     gosub verb turn grindstone
     gosub verb turn grindstone
     gosub verb push grindstone with my %item-basename
     gosub verb get oil in my %main-storage
     setvariable oil-gone 0
     gosub verb pour my oil on my %item-basename
     if %oil-gone = 1 then gosub buy-more-oil-%town
     gosub verb put my oil in my %main-storage
     if "%stamp-items" = "on" then gosub stamp-items-%town
     if %self-smithing = 1 then gosub verb put my %item-basename in my %main-storage
     if %self-smithing = 0 then gosub verb get logbook in my %main-storage
     if %self-smithing = 0 then gosub verb bundle my %item-basename with my logbook
     if %self-smithing = 0 then gosub verb put my logbook in my %main-storage
     math to-grind subtract 1
     if %to-grind > 0 then goto grinding
     setvariable kresh-return 1
     if "%town" = "merkresh" then goto %anvil
     if "%town" = "merk" then goto %anvil
     if "%town" = "kresh" then goto %anvil
     if %self-smithing = 1 then echo . ALL DONE!
     if %self-smithing = 1 then exit
     goto find-turn.in-%town


stamp-items-crossing:
stamp-items-crossings:
stamp-items-cross:
stamp-items-cros:
stamp-items-xing:
stamp-items-xings:
     move n
     move w
     move s
     move go arch
     if ($charactername = "Mofasah") then
      {
       gosub verb get %stamp in my mer loot
      }
     else
      {
       gosub verb get %stamp in my %main-storage
      }
     gosub verb mark my %item with my %stamp
     if ($charactername = "Mofasah") then
      {
       gosub verb put my %stamp in my mer loot
      }
     else
      {
       gosub verb put my %stamp in my %main-storage
      }
     move go arch
     move n
     move e
     move s
     return

stamp-items-shard:
     gosub move 648
     if ($charactername = "Mofasah") then
      {
       gosub verb get %stamp in my mer loot
      }
     else
      {
       gosub verb get %stamp in my %main-storage
      }
     gosub verb mark my %item with my %stamp
     if ($charactername = "Mofasah") then
      {
       gosub verb put my %stamp in my mer loot
      }
     else
      {
       gosub verb put my %stamp in my %main-storage
      }
     gosub move 652
     return


stamp-items-kresh:
stamp-items-merkresh:
stamp-items-merk:
     if ($charactername = "Mofasah") then
      {
       gosub verb get %stamp in my mer loot
      }
     else
      {
       gosub verb get %stamp in my %main-storage
      }
     gosub verb mark my %item with my %stamp
     if ($charactername = "Mofasah") then
      {
       gosub verb put my %stamp in my mer loot
      }
     else
      {
       gosub verb put my %stamp in my %main-storage
      }
     return

buy-more-oil-crossing:
buy-more-oil-crossings:
buy-more-oil-cross:
buy-more-oil-cros:
buy-more-oil-xing:
buy-more-oil-xings:
     move n
put order 6
     waitfor The attendant says
put order 6
     waitfor The attendant takes
     move s
     return
     
buy-more-oil-shard:
     gosub move %supplies
put order 6
     waitfor The attendant says
put order 6
     waitfor The attendant takes
     gosub move 652
     return

buy-more-oil-merkresh:
buy-more-oil-merk:
buy-more-oil-kresh:
     goto buyoil-%anvil
buyoil-kresh5:
     move n
buyoil-kresh4:
     move n
buyoil-kresh3:
     move n
buyoil-kresh2:
     move n
buyoil-kresh1:
     move e
     move go curtain
     move s
put order 6
     waitfor The attendant says
put order 6
     waitfor The attendant takes
     move n
     move go curtain
     move w
     goto boughtoil-%anvil
boughtoil-kresh1:
     return
boughtoil-kresh2:
     move s
     return
boughtoil-kresh3:
     move s
     move s
     return
boughtoil-kresh4:
     move s
     move s
     move s
     return

find-turn.in2-crossing:
find-turn.in2-crossings:
find-turn.in2-cross:
find-turn.in2-cros:
find-turn.in2-xing:
find-turn.in2-xings:
echo . [ Finding Yalda to turn in work order.. ]
     setvariable got-work 0
     setvariable master-there 0
     setvariable master Yalda
     goto fti_x2

find-turn.in-crossing:
find-turn.in-crossings:
find-turn.in-cross:
find-turn.in-cros:
find-turn.in-xing:
find-turn.in-xings:
echo . [ Finding Yalda to turn in work order.. ]
     setvariable got-work 0
     setvariable master-there 0
     setvariable master Yalda
     move n
fti_x2:
     move w
     move n
     action instant setvariable master-there 1 when Forging Society Mistress Yalda
put look
     waitforre (Obvious path|Obvious exit)
     pause 0.5
     if %master-there = 1 then gosub turn.in
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     if %got-work = 0 then pause 0.5
     put w
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put e
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put e
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put w
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     action remove Forging Society Mistress Yalda
     if %master-there = 0 then move n
     if %master-there = 0 then move n
     if %master-there = 0 then goto find-turn.in-xings
     if "%train-scholarship" = "on" then gosub scholarship
     if "%train-foraging" = "on" then gosub train-foraging
     goto find-anvil-%town

train-foraging:
     random 2 10
     setvariable collect-limit %r
     setvariable collected 0
collect-loop:
     math collected add 1
     if %collected > %collect-limit then return
     gosub verb collect %to-collect
     gosub verb kick pile
     goto collect-loop

scholarship:
     gosub verb get my %work-type book in my %main-storage
     setvariable chapter 0
     gosub scholarshipxp
     if %chapter > 4 then goto scholarship-repair
scholarship-chapter-add:
     math chapter add 1
     setvariable page 1
scholarship-engine:
     if %chapter > 4 then goto scholarship-repair
     gosub verb turn my book to chapter %chapter
     gosub verb turn my book to page %page
     gosub verb study my book
     math page add 1
     if %page > 9 then gosub scholarshipxp
     if %page > 9 then goto scholarship-chapter-add
     if %chapter > 4 then goto scholarship-repair
     goto scholarship-engine
scholarship-repair:
     gosub verb put my book in my %main-storage
     return

scholarshipxp:
put skill scholarship
     matchre scholarshipxp-1 (mind lock|nearly lock)
     match scholarshipxp-2 EXP HELP
     matchwait
scholarshipxp-1:
     setvariable chapter 10
scholarshipxp-2:
     return

turn.in:
     if %got-work = 1 then return
     gosub verb get logbook in my %main-storage
     gosub verb give my logbook to %master
     math orders-completed add 1

     math total-items-made add %temp-quant
     math total-volume-consumed add %mass-volume
     setvariable average-volume-per-item %total-volume-consumed
     math average-volume-per-item divide %total-items-made
     setvariable average-profit-per-item %coin-intake
     math average-profit-per-item divide %total-items-made
     setvariable average-profit-per-volume %coin-intake
     math average-profit-per-volume divide %total-volume-consumed
     setvariable average-profit-per-workorder %coin-intake
     math average-profit-per-workorder divide %orders-completed
     setvariable average-volume-per-workorder %total-volume-consumed
     math average-volume-per-workorder divide %orders-completed

     if %finish-mode = 1 then goto finish-up
     gosub verb ask %master for %work-difficulty %work-type work
     gosub verb put my logbook in my %main-storage
     setvariable got-work 1
     echo
     echo . [ Coin Gained                : %coin-intake
     echo . [ Work Orders Completed      : %orders-completed
     echo . [ Avg. Coin Per Work Order   : %average-profit-per-workorder
     echo . [ Avg. Volume Per Work Order : %average-volume-per-workorder
     echo .
     echo . [ Total Volume Consumed      : %total-volume-consumed
     echo . [ Total Items Made           : %total-items-made
     echo . [ Avg. Volume Per Item       : %average-volume-per-item
     echo . [ Avg. Coin Per Volume       : %average-profit-per-volume
     echo
     setvariable repaired-stuff 0
     return


finish-up:
     gosub verb put my logbook in my %main-storage
     echo
     echo . [ Finished ! ]
     echo
     echo . [ Coin Gained                : %coin-intake
     echo . [ Work Orders Completed      : %orders-completed
     echo . [ Avg. Coin Per Work Order   : %average-profit-per-workorder
     echo . [ Avg. volume Per Work Order : %average-volume-per-workorder
     echo .
     echo . [ Total Volume Consumed      : %total-volume-consumed
     echo . [ Total Items Made           : %total-items-made
     echo . [ Avg. Volume Per Item       : %average-volume-per-item
     echo . [ Avg. Coin Per Volume       : %average-profit-per-volume
     echo
put #parse smithbot done
     exit


read-logbook:
     if %self-smithing   = 1 then goto done-set-chapter-selfsmith
     gosub verb get logbook in my %main-storage
put read my logbook
#%Weaponsmithing Book
     matchre set-chapter-1 This logbook is tracking a work order requiring you to craft (a metal dagger|a metal kythe|a metal carving knife|a metal oben|a metal briquet|a metal koummya|a metal stiletto|a metal rapier|a metal poignard|a metal pasabas|a metal pugio|a metal thrusting blade|a metal short sword|a metal scimitar|a metal katar|a metal sabre|a metal misericorde|a metal hanger|a metal kris|a metal parang|a metal takouba|a metal curlade|a metal jambiya|a metal adze|a metal leaf blade sword|a metal sashqa|a metal telek|a metal mambeli|a metal nehlata|a metal gladius|a metal falcata|a metal baselard|a metal throwing dagger|a light throwing axe|a metal dart|a metal hand axe|a metal foil|a metal hatchet|a metal sunblade|a metal cutlass|a metal kasai|a metal shotel|a metal dao)\.  You must bundle
     matchre set-chapter-2 This logbook is tracking a work order requiring you to craft (a metal broadsword|a metal namkomba|a metal arzfilt|a metal hunting sword|a metal kudalata|a metal nimsha|a metal spatha|a metal back-sword|a metal longsword|a metal recade|a metal round axe|a metal battle axe|a metal nehdalata|a metal robe sword|a metal condottiere|a metal falchion|a metal cinquedea|a metal schiavona|a metal abassi|a metal hurling axe|a metal dagasse)\.  You must bundle
     matchre set-chapter-3 This logbook is tracking a work order requiring you to craft (a metal two-handed sword|a metal kaskara|a metal warring axe|a metal shh'oi'ata|a metal marauder blade|a metal greatsword|a metal greataxe|a metal flamberge|a metal claymore|a metal periperiu sword|a metal karambit|a metal double axe|a metal twin-point axe|a metal igorat axe)\.  You must bundle
     matchre set-chapter-4 This logbook is tracking a work order requiring you to craft (a metal cudgel|a metal bola|a metal prod|a metal cuska|a metal cosh|a metal bulhawf|a metal gavel|a metal komno|a metal bludgeon|a metal hhr'tami|a metal hand mallet|a spiked metal club|a metal scepter|a spiked metal hammer|a metal zubke|a spiked metal mace|a spiked metal gauntlet|a metal marlingspike|a short metal hammer|a metal mace|a metal club|a metal belaying pin|a metal hand mace|a metal war hammer|a ridged metal gauntlet|a metal boomerang|a metal garz|a metal boko|a metal war club|a flanged metal mace|a metal mallet|a metal k'trinni sha-tai|a metal throwing club)\.  You must bundle
     matchre set-chapter-5 This logbook is tracking a work order requiring you to craft (a metal horseman's flail|a metal morning star|a heavy metal chain|a spiked metal hara|a metal ball and chain|a spiked ball and chain|a metal greathammer|a metal ukabi|a heavy metal mace|a metal throwing hammer|a metal imperial war hammer|a metal throwing mallet|a double-headed hammer|a hurlable war hammer|a metal hara|a metal hhr'ata|a heavy metal mallet|a metal sledgehammer)\.  You must bundle
     matchre set-chapter-6 This logbook is tracking a work order requiring you to craft (a metal footman's flail|a metal two-headed hammer|a metal akabo|a metal maul|double-sided ball and chain|a heavy sledgehammer|a metal war mattock|a metal dire mace|a metal vilks kodur|a giant metal mallet)\.  You must bundle
     matchre set-chapter-7 This logbook is tracking a work order requiring you to craft (a metal javelin|a two-pronged halberd|a light metal spear|a metal khuj|a metal scythe|a metal partisan|a metal bardiche|a metal military fork|a metal lochaber axe|a metal duraka skefne|a metal guisarme|a metal pole axe|a metal halberd|a metal fauchard|a metal tzece|a metal ngalio|a metal coresca|a metal pike|a metal awgravet ava|a metal lance|a metal hunthsleg|a metal spetum|a metal allarh|a metal ranseur|a metal spear|a metal ilglaiks skefne|a metal glaive)\.  You must bundle
     matchre set-chapter-8 This logbook is tracking a work order requiring you to craft (a metal cane|some metal elbow spikes|a metal nightstick|some metal knee spikes|a metal quarterstaff|some spiked metal knuckles|some metal knuckles|some metal hand claws|a metal pike staff)\.  You must bundle
     matchre set-chapter-9 This logbook is tracking a work order requiring you to craft (a metal throwing spike|a metal boarding axe|a metal bastard sword|a metal half-handled riste|a metal war sword|a thin-bladed metal fan|a metal broadaxe|a metal riste|a metal bar mace|a thick-bladed metal fan|a metal splitting maul)\.  You must bundle
#%Blacksmithing Book
     matchre set-chapter-1 This logbook is tracking a work order requiring you to craft (a smelted metal ingot|metal tool repair|metal tool tempering|metal item reclamation|a refined metal ingot)
     matchre set-chapter-2 This logbook is tracking a work order requiring you to craft (a straight-peen mallet|a diagonal-peen hammer|some metal bolt tongs|a curved metal shovel|a slender metal pickaxe|a metal cross-peen hammer|a ball-peen hammer|some straight metal tongs|a sturdy metal shovel|a stout metal pickaxe|a flat-headed metal pickaxe|some flat-bladed tongs|some segmented tongs|some curved metal tongs|a wide metal shovel|a square metal shovel|some box-jaw tongs|a narrow metal pickaxe|a weighted metal pickaxe|a straight-peen hammer|some articulated tongs|some angular metal tongs|a tapered metal shovel)
     matchre set-chapter-3 This logbook is tracking a work order requiring you to craft (some short metal chisels|some long metal chisels|some square metal rifflers|a thin metal rasp|a metal straight bone saw|some squat metal rifflers|some plain metal pliers|some sturdy metal chisels|a coarse metal rasp|some curved metal pliers|a metal curved bone saw|some reinforced chisels|some curved metal rifflers|a textured metal rasp|some rough metal pliers|a metal slender bow saw|some sharpened chisels|some elongated rifflers|a flat metal rasp|some thick metal pliers|a tapered metal rasp|some hooked metal pliers|a metal tapered bone saw|a metal serrated bone saw)
     matchre set-chapter-4 This logbook is tracking a work order requiring you to craft (a metal hide scraper|some squat knitting needles|some smooth knitting needles|some knobby sewing needles|a stout metal yardstick|a rectangular yardstick|some plain sewing needles|some bent metal scissors|some straight metal scissors|a serrated hide scraper|a curved hide scraper|a compact metal awl|a pointed metal awl|some polished knitting needles|some tapered knitting needle|a slender metal awl|a flat metal yardstick|a detailed yardstick|some curved metal scissors|some serrated scissors|some ribbed sewing needles|some thin sewing needles|a narrow metal awl)
     matchre set-chapter-5 This logbook is tracking a work order requiring you to craft (a flat mixing stick|a tapered pestle|a tapered mixing stick|a square wire sieve|a flat pestle|a round mixing stick|a triangular wire sieve|a round pestle|a grooved mixing stick|an oblong wire sieve|a grooved pestle|a trapezoidal wire sieve)
     matchre set-chapter-6 This logbook is tracking a work order requiring you to craft (a shallow metal cup|a metal lockpick ring|a slender metal rod|a metal herbal case|a tall metal mug|a metal jewelry box|a short metal mug|a metal flights box|a soft metal keyblank|a metal razor|a metal horseshoe|a large metal flask|a back scratcher|a metal armband|some metal barbells|a metal instrument case|a large metal horseshoe|a metal chest|a small metal flask|a metal backtube|a metal ankle band|a metal starchart tube|a metal lockpick case|some metal clippers|a metal origami case|a metal crown|a metal bolt box|a metal torque|a metal talisman case|a metal mask|a metal flask|a metal headdress|a metal oil lantern)
#%Armorsmithing Book
     matchre set-chapter-1 This logbook is tracking a work order requiring you to craft (a metal ring mask|a metal ring vest|a metal ring aventail|a metal ring mantle|some metal ring gloves|a metal ring lorica|a metal chain mask|some metal mail vambraces|a metal ring cap|some metal chain sleeves|a metal chain aventail|a metal mail tasset|some metal chain gloves|a metal chain vest|a metal mail mask|a metal chain mantle|a metal chain cap|a metal chain lorica|a metal mail aventail|a metal ring robe|a metal ring helm|a metal ring shirt|some metal ring greaves|a mail balaclava|a metal mail cap|some metal mail sleeves|a metal chain helm|a metal mail vest|a metal ring balaclava|a metal mail mantle|some metal chain greaves|a metal mail lorica|some metal ring vambraces|a metal chain robe|a metal ring tasset|a metal chain shirt|some metal mail gloves|a metal ring hauberk|a metal mail helm|a metal mail robe|a metal chain balaclava|a metal mail shirt|some metal mail greaves|a metal chain hauberk|some metal chain vambraces|a metal mail hauberk|some metal ring sleeves|a metal chain tasset|a metal bar-mail hauberk)\ from any material\.  You must bundle
     matchre set-chapter-2 This logbook is tracking a work order requiring you to craft (a metal scale mask|some brigandine sleeves|a metal scale aventail|a metal lamellar balaclava|some metal scale gloves|some lamellar vambraces|a metal brigandine mask|a metal lamellar tasset|a metal brigandine aventail|a metal scale vest|a metal scale cap|a metal scale mantle|some brigandine gloves|a metal scale lorica|some metal scale greaves|a brigandine shirt|a metal lamellar mask|a brigandine robe|a metal lamellar aventail|some lamellar sleeves|a metal brigandine cap|a metal brigandine vest|a metal scale helm|a metal brigandine mantle|some metal lamellar gloves|a metal brigandine lorica|some brigandine greaves|a metal scale robe|a metal lamellar cap|a metal scale shirt|a metal brigandine helm|a metal lamellar shirt|a metal scale balaclava|a brigandine hauberk|some metal scale vambraces|a metal lamellar robe|a metal scale tasset|a metal lamellar vest|some metal scale sleeves|a metal lamellar mantle|some lamellar greaves|a metal lamellar lorica|a metal lamellar helm|a metal scale hauberk|a brigandine balaclava|a lamellar hauberk|some brigandine vambraces|a metal brigandine tasset|a laminar hauberk)\ from any material\. *You must bundle
     matchre set-chapter-3 This logbook is tracking a work order requiring you to craft (a light plate mask|a metal sallet|a light plate aventail|some light plate greaves|a plate mask|a metal great helm|a metal dome helm|some heavy plate greaves|a plate aventail|some heavy plate vambraces|some light plate gauntlets|some plate sleeves|a heavy plate mask|a metal heavy backplate|a metal morion|a heavy plate fauld|a heavy plate aventail|a metal breastplate|some plate gauntlets|a light plate cuirass|a metal bascinet|some heavy plate sleeves|a metal barbute|a heavy breastplate|heavy plate gauntlets|a plate cuirass|a metal visored helm|some light field plate|some light plate vambraces|some light half plate|a light backplate|a heavy plate cuirass|a light plate fauld|some field plate|a metal closed helm|some half plate|a metal armet|some light full plate|some plate greaves|some heavy field plate|some plate vambraces|some full plate|some light plate sleeves|some heavy half plate|a metal backplate|some heavy full plate|a plate fauld|a light breastplate|some heavy fluted plate)\ from any material\. *You must bundle
     matchre set-chapter-4 This logbook is tracking a work order requiring you to craft (a metal shield handle|a metal ceremonial shield|a metal shield boss|a metal kite shield|a metal targe|a metal skirmisher's shield|a metal ordinary shield|a metal jousting shield|a metal round sipar|a metal tower shield|a metal medium shield|a metal warrior's shield|a metal triangular sipar|a metal aegis|a metal target shield|a metal heater shield|a metal oval shield|a metal battle shield|a metal medium buckler|a metal war shield|a metal circular buckler|a metal curved shield)
     matchwait

set-chapter-name:
     setvariable full-item-name $1
     echo . [ $1 ]
     gosub test-set-base %full-item-name uber
     setvariable item-name %full-item-name
     setvariable item %item-basename
     echo Item Full Name : %full-item-name
     echo Item Base Name : %item-basename
     echo Chapter Item Is In : %item-chapter
     echo Quantity Desired : %quantity
     goto done-set-chapter

test-set-base:
     if "$2" = "uber" then setvariable item-basename $1
     if "$3" = "uber" then setvariable item-basename $2
     if "$4" = "uber" then setvariable item-basename $3
     if "$5" = "uber" then setvariable item-basename $4
     if "$6" = "uber" then setvariable item-basename $5
     if "$7" = "uber" then setvariable item-basename $6
     if "$8" = "uber" then setvariable item-basename $7
     if "$9" = "uber" then setvariable item-basename $8
     if ("%full-item-name" = "a double-sided ball and chain") then setvariable item-basename ball
     if ("%full-item-name" = "a spiked ball and chain") then setvariable item-basename ball
     if ("%full-item-name" = "a ball and chain") then setvariable item-basename ball
     if contains("weapon", "%work-type") then if "%item" = "chain" then setvariable item ball
     setvariable item %item-basename
     return

set-chapter-1:
     setvariable item-chapter 1
     goto set-chapter-name
set-chapter-2:
     setvariable item-chapter 2
     goto set-chapter-name
set-chapter-3:
     setvariable item-chapter 3
     goto set-chapter-name
set-chapter-4:
     setvariable item-chapter 4
     goto set-chapter-name
set-chapter-5:
     setvariable item-chapter 5
     goto set-chapter-name
set-chapter-6:
     setvariable item-chapter 6
     goto set-chapter-name
set-chapter-7:
     setvariable item-chapter 7
     goto set-chapter-name
set-chapter-8:
     setvariable item-chapter 8
     goto set-chapter-name
set-chapter-9:
     setvariable item-chapter 9
     goto set-chapter-name

done-set-chapter:
     gosub verb put my logbook in my %main-storage
done-set-chapter-selfsmith:
     gosub verb get my %work-type book
     gosub verb turn my book to chapter %item-chapter
put read my book
     waitforre Page (\d+): %full-item-name
     setvariable page $1
     gosub verb turn my book to page %page
setvariable hilt 0
setvariable haft 0
setvariable longcord 0
setvariable shortcord 0
setvariable largepad 0
setvariable smallpad 0
setvariable leatherstrips 0
setvariable smallback 0
setvariable largeback 0
setvariable longpole 0
setvariable shortpole 0
setvariable shieldboss 0
setvariable shieldhandle 0

action instant setvariable hilt 1 when finished wooden hilt
action instant setvariable haft 1 when finished wooden haft
action instant setvariable longcord 1 when long leather cord
action instant setvariable shortcord 1 when short leather cord
action instant setvariable smallpad $1 when (\d+). finished small cloth padding
action instant setvariable largepad $1 when (\d+). finished large cloth padding
action instant setvariable leatherstrips $1 when (\d+) .* leather strips
action instant setvariable smallback $1 when (\d+). finished small leather backing
action instant setvariable largeback $1 when (\d+). finished large leather backing
action instant setvariable longpole 1 when long wooden pole
action instant setvariable shortpole 1 when short wooden pole
action instant setvariable shieldboss 1 when shield boss
action instant setvariable shieldhandle 1 when metal shield handle
     pause 0.1
put read my book
     waitforre metal ingot .(\d+) volume
     setvariable volume $1
     pause 0.1
action remove finished wooden hilt
action remove finished wooden haft
action remove long leather cord
action remove short leather cord
action remove (\d+). finished small cloth padding
action remove (\d+). finished large cloth padding
action remove (\d+). leather strips
action remove (\d+). finished small leather backing
action remove (\d+). finished large leather backing
action remove long wooden pole
action remove short wooden pole
action remove shield boss
action remove shield handle

     setvariable mass-volume %volume
     math mass-volume multiply %quantity

if %hilt = 1 then echo . [ Required : hilt ]
if %haft = 1 then echo . [ Required : haft ]
if %longcord = 1 then echo . [ Required : long cord ]
if %shortcord = 1 then echo . [ Required : short cord ]
if %largepad = 1 then echo . [ Required : large padding ]
if %smallpad = 1 then echo . [ Required : small padding ]
if %leatherstrips = 1 then echo . [ Required : leather strips ]
if %smallback = 1 then echo . [ Required : small backing ]
if %largeback = 1 then echo . [ Required : large backing ]
if %longpole = 1 then echo . [ Required : long pole ]
if %shortpole = 1 then echo . [ Required : short pole ]
if %shieldboss = 1 then echo . [ Required : shield boss ]
if %shieldhandle = 1 then echo . [ Required : shield handle ]

     if %mass-volume > %mass-volume-limit then goto mass-volume-over
     if %shieldhandle > 0 then goto get-shield-stuff
     if %shieldboss > 0 then goto get-shield-stuff
     goto logbook-read
     
gss-shard:
     setvariable returnroom $roomid
     gosub move %supplies
     setvariable shieldstuff %quantity
shard-xloop:
put buy shield handle
     pause 0.5
put put my handle in my %unfinished-storage
     pause 0.5
     math shieldstuff subtract 1
     if %shieldstuff > 0 then goto shard-xloop
     gosub move %returnroom
     goto logbook-read


get-shield-stuff:
     goto gss-%town
gss-crossing:
gss-crossings:
gss-cross:
gss-cros:
gss-xing:
gss-xings:
     goto gss-%temp-room
gss-x1:
gss-x2:
gss-x3:
     move go arch
     move north
     move east
     goto xbuyhandle
gss-x4:
     move go building
     move south
     move east
xbuyhandle:
     setvariable shieldstuff %quantity
gss-xloop:
put buy shield handle
     pause 0.5
put put my handle in my %unfinished-storage
     pause 0.5
     math shieldstuff subtract 1
     if %shieldstuff > 0 then goto gss-xloop
     move w
     move s
     if "%temp-room" = "x1" then move go arch
     if "%temp-room" = "x2" then move go second arch
     if "%temp-room" = "x3" then move go third arch
     if "%temp-room" = "x4" then move north
     if "%temp-room" = "x4" then move north
     if "%temp-room" = "x4" then move go door
     goto logbook-read



gss-merkresh:
gss-merk:
gss-kresh:
     goto gss-%anvil
gss-kresh5:
     move n
gss-kresh4:
     move n
gss-kresh3:
     move n
gss-kresh2:
     move n
gss-kresh1:
     move e
     move go curtain
     move s
     setvariable shieldstuff %quantity
gss-kloop:
put buy shield handle
     pause 0.5
put put my handle in my %unfinished-storage
     pause 0.5
     math shieldstuff subtract 1
     if %shieldstuff > 0 then goto gss-kloop

     move n
     move go curtain
     move w
     goto gss2-%anvil
gss2-kresh1:
     goto logbook-read
gss2-kresh2:
     move s
     goto logbook-read
gss2-kresh3:
     move s
     move s
     goto logbook-read
gss2-kresh4:
     move s
     move s
     move s
     goto logbook-read
gss2-kresh5:
     move s
     move s
     move s
     move s
     goto logbook-read





mass-volume-over:
     goto mvo-%town
mvo-crossing:
mvo-crossings:
mvo-cross:
mvo-cros:
mvo-xing:
mvo-xings:
     if "%forge-room" = "xings1" then move go building
     if "%forge-room" = "xings1" then goto mvo-wait
     move go arch
     move north
     move north
     goto mvo-wait

mvo-merkresh:
mvo-merk:
mvo-kresh:
     goto mvo-%anvil
mvo-kresh5:
     move n
mvo-kresh4:
     move n
mvo-kresh3:
     move n
mvo-kresh2:
     move n
mvo-kresh1:
     move e
     move go curtain
     move s
     move se
     move w
     goto mvo-wait

mvo-wait:
     gosub verb put my book in my %main-storage
echo
echo . [ Mass Volume Over Desired Limit ... ]
echo . [ Pausing for a moment then getting a new work order ... ]
echo
     pause 60
     goto find-getwork-%town




test-1:
     if "$2" = "0" then setvariable item-name $1
     if "$2" = "0" then setvariable item-basename $1
     if "$3" = "0" then setvariable item-name $1 $2
     if "$3" = "0" then setvariable item-basename $2
     if "$4" = "0" then setvariable item-name $1 $2 $3
     if "$4" = "0" then setvariable item-basename $3
     if "$5" = "0" then setvariable item-name $1 $2 $3 $4
     if "$5" = "0" then setvariable item-basename $4
     if "$6" = "0" then setvariable item-name $1 $2 $3 $4 $5
     if "$6" = "0" then setvariable item-basename $5
     setvariable item %item-basename
     return

repairs:
     if %repaired-stuff = 1 then return
     setvariable repaired-stuff 1
     gosub repairing %hammer
     gosub repairing %shovel
     gosub repairing %tongs
     gosub repairing bellow
     if "%stamp-items" = "on" then gosub repairing %stamp
     return


repairing:
     setvariable repair $0
     if "%repair" = "basic stamp" then
      {
       if ($charactername = "Mofasah") then
        {
         gosub verb get %stamp in my mer loot
        }
       else
       {
        gosub verb get %stamp in my %main-storage
       }
      }
     else
      {
       gosub verb get %repair in my %main-storage
      }
     gosub verb get brush in my %main-storage
     gosub verb rub my %repair with my wire brush
     gosub verb put my brush in my %main-storage
     setvariable oil-gone 0
     gosub verb get oil in my %main-storage
     gosub verb pour my oil on my %repair
     if %oil-gone = 0 then gosub verb put oil in my %main-storage
     if "%repair" = "basic stamp" then
      {
       if ($charactername = "Mofasah") then
        {
         gosub verb put %repair in my mer loot
        }
       else
       {
        gosub verb put %repair in my %main-storage
       }
      }
     else
      {
       gosub verb put %repair in my %main-storage
      }
     return

verb:
     setvariable verb $0
     if %are-you-humming = 0 then gosub hum-that-shit
     goto verb.a
verb.p:
     pause 0.5
verb.a:
put %verb
     match verb.p type ahead
     match verb.p ...wait
     matchre verb.d (You get|You put|You pick up|Roundtime|This process can make an item more durable|thin coat of clay to the metal and then place|Roundtime|STOW HELP|completely undamaged and does not need repair|cannot figure out how to do that|not damaged enough to warrant repair|bundle them with your logbook and then give|you just received a work order|You turn your book|You notate|You hand|You slide|You place|You have no idea how to craft|Perhaps try doing that to some refined metal|The book is already turned|What were you referring|You take a step back|could not find|An attendant arrives, takes your deed|already turned to)
     matchwait
verb.d:
     return
     
hum-that-shit:
     pause 0.1
     random 1 3
     if %r = 1 then put hum %hum-song-1
     if %r = 2 then put hum %hum-song-2
     if %r = 3 then put hum %hum-song-3
     pause 0.5
     setvariable are-you-humming 1
     return




find-getwork-merkresh:
find-getwork-merk:
find-getwork-kresh:
     if %self-smithing = 0 then echo . [ Finding Kapric to get work orders.. ]
     if %self-smithing = 1 then echo . [ Finding empty room ... ]
     setvariable got-work 0
     setvariable master-there 0
     setvariable master Kapric
     if %self-smithing = 1 then setvariable got-work 1
     action instant setvariable master-there 1 when Forging Society Master Kapric
put look
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put east
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put nw
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put east
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put sw
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
put west
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub get-work
     if %got-work = 0 then goto find-getwork-kresh
     action remove Forging Society Master Kapric
     goto find-anvil-%town

find-anvil-merkresh:
find-anvil-merk:
find-anvil-kresh:
echo . [ Finding empty forge.. ]
     setvariable kresh-return 0

     move east
     move nw
     move north
     move go curtain
     gosub room-test west
     setvariable anvil kresh1
     if %taken = 0 then setvariable temp-room k1
     if %taken = 0 then goto anvil-found
     gosub room-test south
     setvariable anvil kresh2
     if %taken = 0 then setvariable temp-room k2
     if %taken = 0 then goto anvil-found
     setvariable anvil kresh3
     gosub room-test south
     if %taken = 0 then setvariable temp-room k3
     if %taken = 0 then goto anvil-found
     setvariable anvil kresh4
     gosub room-test south
     if %taken = 0 then setvariable temp-room k4
     if %taken = 0 then goto anvil-found
     setvariable anvil kresh5
     gosub room-test south
     if %taken = 0 then setvariable temp-room k5
     if %taken = 0 then goto anvil-found
kresh5:
     move n
kresh4:
     move n
kresh3:
     move n
kresh2:
     move n
kresh1:
     move e
     move go curtain
     move s
     move se
     move w
     if %kresh-return = 1 then goto find-turn.in-kresh
     pause 60
     goto find-anvil-kresh


find-grindstone-merkresh:
find-grindstone-merk:
find-grindstone-kresh:
     goto sup-%anvil
sup-kresh5:
     move n
sup-kresh4:
     move n
sup-kresh3:
     move n
sup-kresh2:
     move n
sup-kresh1:
     move e
     move go curtain
     move s
     setvariable placement first
     setvariable to-assemble %quantity
if %hilt = 1 then gosub assemble hilt
if %haft = 1 then gosub assemble haft
if %longcord = 1 then gosub assemble long cord
if %shortcord = 1 then gosub assemble short cord
if %longpole = 1 then gosub assemble long pole
if %shortpole = 1 then gosub assemble short pole
if %shieldboss = 1 then gosub assemble shield boss

if %largepad > 0 then gosub assemble-armor %largepad large padding
if %smallpad > 0 then gosub assemble-armor %smallpad small padding
if %leatherstrips > 0 then gosub assemble-armor %leatherstrips leather strips
if %smallback > 0 then gosub assemble-armor %smallback small backing
if %largeback > 0 then gosub assemble-armor %largeback large backing

     setvariable plier-pull 0
if %largepad = 1 then setvariable plier-pull 1
if %smallpad = 1 then setvariable plier-pull 1
if %leatherstrips = 1 then setvariable plier-pull 1
if %smallback = 1 then setvariable plier-pull 1
if %largeback = 1 then setvariable plier-pull 1

if %plier-pull = 1 then gosub plier-pull

     setvariable to-grind %quantity
     if !contains("%work-type","weapon") then goto oil-items
     move n
     move go curtain
     move w
     goto ret1-%anvil
ret1-kresh1:
     goto grinding
ret1-kresh2:
     move s
     goto grinding
ret1-kresh3:
     move s
     move s
     goto grinding
ret1-kresh4:
     move s
     move s
     move s
     goto grinding
ret1-kresh5:
     move s
     move s
     move s
     move s
     goto grinding


plier-pull:
     setvariable tracker %quantity
     setvariable placement first
     gosub verb get %pliers in my %main-storage
     if %quantity = 1 then setvariable placement first
     if %quantity = 2 then setvariable placement second
     if %quantity = 3 then setvariable placement third
     if %quantity = 4 then setvariable placement fourth
     if %quantity = 5 then setvariable placement fifth
     if %quantity = 6 then setvariable placement sixth
     if %quantity = 7 then setvariable placement seventh
     if %quantity = 8 then setvariable placement eighth
     if %quantity = 9 then setvariable placement ninth
     if %quantity = 10 then setvariable placement tenth
     echo . [ Quantity %quantity - Placement %placement ]
plier-pull-get:
ppg-p:
     pause 0.5
ppgg:
put get %placement %item-basename in my %unfinished-storage
     match ppg-p type ahead
     match ppg-p ...wait
     match plier-loop You get
     match ppgd (could not find|What were you)
     matchwait
ppgd:
     setvariable place-track 0
     goto plier-done
plier-loop:
     pause 0.5
put pull my %item with my pliers
     match plier-loop type ahead
     match plier-loop ...wait
     match plier-done some oil to preserve and protect it
     match plier-loop Roundtime
     matchwait
plier-done:
     pause
     gosub verb put my %item-basename in my %unfinished-storage
     math tracker subtract 1
     if %tracker > 0 then goto ppg-p
plier-done2:
     gosub verb put my pliers in my %main-storage
     return


find-turn.in-merkresh:
find-turn.in-merk:
find-turn.in-kresh:
     goto findkap-%anvil
findkap-kresh5:
     move n
findkap-kresh4:
     move n
findkap-kresh3:
     move n
findkap-kresh2:
     move n
findkap-kresh1:
     move e
     move go curtain
     move s
find-turn.in2-merkresh:
find-turn.in2-merk:
find-turn.in2-kresh:
     move se
     move w

find-turn.in-kresh-playback:
echo . [ Finding Kapric to turn in work order.. ]
     setvariable got-work 0
     setvariable master-there 0
     setvariable master Kapric
     action instant setvariable master-there 1 when Forging Society Master Kapric
put look
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put east
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put nw
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put n
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put s
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put east
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put sw
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
put west
     waitforre (Obvious path|Obvious exit)
     if %got-work = 0 then pause 0.5
     if %master-there = 1 then gosub turn.in
     if %got-work = 0 then goto find-turn.in-kresh
     action remove Forging Society Master Kapric
     if "%train-scholarship" = "on" then gosub scholarship
     if %master-there = 0 then goto find-turn.in-kresh-playback
     goto find-getwork-merkresh

room-test:
     setvariable taken 0
     pause 0.1
put $0
     matchre room-test-fail Also here: (.+)\.
     matchre room-test-fail Also in room: (.+)\.
     matchre room-test-fail Also in the room: (.+)\.
     match room-test-pass Obvious paths:
     match room-test-pass Obvious exits:
     matchwait
room-test-fail:
     setvariable peoples $1
     echo . [ peoples = %peoples ]
     if "%peoples" != "%follower" then setvariable taken 1
room-test-pass:
     pause 0.1
     return


new-repair:
     setvariable to-repair $0
     gosub verb get %to-repair in my %main-storage
     gosub verb get wire brush in my %main-storage
     goto new-repair-action
new-repair-p:
     pause 0.5
new-repair-action:
put rub my %to-repair with my brush
     matchre new-repair-p (type ahead|...wait)
     matchre new-repair-false (is not damaged enough to warrant repair|You have no idea how to craft|Perhaps try doing that to some refined metal)
     match new-repair-true Roundtime
     matchwait
new-repair-true:
     gosub verb put my brush in my %main-storage
     gosub verb get oil in my %main-storage
     gosub verb pour my oil on my %to-repair
     gosub verb put my oil in my %main-storage
     gosub verb put my %to-repair in my %main-storage
     return
new-repair-false:
     gosub verb put my brush in my %main-storage
     gosub verb put my %to-repair in my %main-storage
     return


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