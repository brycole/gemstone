

#%
#%           INSTRUCTIONS !!!!!!!!
#%                       INSTRUCTIONS !!!!!!!!
#%                                 INSTRUCTIONS !!!!!!!!
#%                                         INSTRUCTIONS !!!!!!!!
#%                                                INSTRUCTIONS !!!!!!!!
#%
#% - type .gsell2 install             to reinstall
#% - type .gsell2                     to run fully automated
#% - type .gsell2 Person              to sell a pouch your already holding and tip Person (name must be CAPITOLIZED and FULLY TYPED ! EXAMPLE : .gsell2 Gavinne)
#% - type .gsell2 display             to bring up your personal statistics on screen
#% - type .gsell2 display Person      to display the stats of that person
#% - set the variable named whisper right below to OFF if you dont want to whisper gain to customers
#%

SetVariable whisper on
#%
#% - if whisper is on then pouchbot will whisper to its costomers and conversate
#%

SetVariable skim off
SetVariable skim.percent 1
SetVariable skim.newbs on
SetVariable newb.limit 5
SetVariable no.skim.1 Markhor
SetVariable no.skim.2 Dreadnym
SetVariable no.skim.3 Yotionblade
SetVariable no.skim.4 Mekage
SetVariable no.skim.5 Rudius
SetVariable no.skim.6 none
SetVariable no.skim.7 none
SetVariable no.skim.8 none
SetVariable no.skim.9 none
SetVariable no.skim.10 none
#%
#% - if skim is on, then pouchbot will auto keep skim.percent of the pouch when selling for someone
#%
#% - if skim.newbs is on then pouchbot will only skim from peoples pouches its only sold less than skim.limit for commulatively
#%
#% - pouchbot will never skim from the pouches it sells for people whos name is on the no.skim.1 to no.skim.10 list
#% - pouchbot will never accept tips from people whos name is on the no.skim.1 to no.skim.10 list
#%

SetVariable accept.tips off
#%
#% - if accept.tips is turned on the pouchbot will accept tips
#%

SetVariable use.finesse on
SetVariable finesse.limit 30000
#%
#% - PouchBoT will use Spec Finesse if use.finesse is ON when selling any pouch appraising for more than finesse.limit
#%
#% - Thus if finesse is on and someone hands you a 4 plat gem pouch and finesse limit is set at 30000 then pouch bot would use spec finesse to super boost pouch
#%
#% - If you dont have spec finesse ability (which you should !!) then set use.finesse to off
#%

SetVariable hum off
SetVariable hum1 ballad confident
SetVariable hum2 ballad masterful
SetVariable hum3 waltz confident
SetVariable hum4 waltz romantic
SetVariable hum5 lullaby quiet
#%
#% - PouchBoT will train vocals by humming if hum is set to on.
#%
#% - hum1, hum2, hum3, hum4 and hum5 are the styles to hum if hum is set to on.
#%

SetVariable train.app off
SetVariable app.item.1 crown
SetVariable app.item.2 skinning knife
SetVariable app.item.3 none
SetVariable app.item.4 none
SetVariable app.item.5 none
SetVariable app.item.6 none
SetVariable app.item.7 none
SetVariable app.item.8 none
SetVariable app.item.9 none
SetVariable app.item.10 none
#%
#% - Pouchbot will train appraisal by appraising your items randomly if train.app is set to on
#%
#% - app.item.1 to app.item.10 are the items to train appraisal with, and can be either stowed or worn, any that you arent using should be set to none
#%

#%
#%
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%
#%
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%      DO NOT TOUCH ANYTHING BELOW HERE !!!
#%
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
#%_________________________________________________________
SetVariable selling 0
SetVariable finesse 0
SetVariable humming 0
SetVariable someone.tipping 0
SetVariable vocals 0
SetVariable app.exp 0
SetVariable total.app 0
SetVariable accept.pouch 0
SetVariable confirm 0
SetVariable listen none
Action instant SetVariable whos.tipping $1 when (\w+) offers you a tip of
Action instant SetVariable someone.tipping 1 when (ACCEPT TIP|DECLINE TIP)
Action instant SetVariable finesse 1 when (feel your confidence grow as you realize you are able to act with|you are already putting your best appearance)
Action instant SetVariable finesse 0 when feel your concentration on your finesse slip away
Action (Sell) instant SetVariable PaidFor $1 when hands you (\d+) (kronar|dokora|lirum)
Action (Name) instant SetVariable Person $1 when You accept (\w+)\'s offer and are now holding
Action (App) instant SetVariable AppFor $1 when worth a total of about (\d+) (lirum|kronar|dokora)
Action (Accept) instant SetVariable accept.pouch 1 when (The offer will expire in 30 seconds|ACCEPT to accept the offer or DECLINE)
Action (Selling) instant SetVariable selling 1 when offer will expire in 30 seconds
Action (App) instant SetVariable denomination $2 when (\d+) (kronar|dokora|lirum)
Action (Confirm) instant SetVariable confirm 1 when sell (some|a) (gem|pouch)
Action (Confirm) instant SetVariable confirm 1 when asks, "selling?
Action (Confirm) instant SetVariable confirm 1 when (anyone|you|ya|ye|someone) (selling|sellin) (pouch|gem)
Action (Confirm) instant SetVariable confirm 1 when sell .* (few|couple|bunch of|buncha|gem|pouch|some) (gem|pouch)
Action (Confirm) instant SetVariable confirm 1 when sell (a few|some|a couple|a bunch of|a buncha|buncha|alot of|alotta|lotta|lot of) (gem|pouch)
Action instant SetVariable listen $1 when you must LISTEN TO (\w+)
Action instant SetVariable vocals 1 when Vocals: (.....|......|.......|......|........|.........) (mind lock|dazed|bewildered)
Action instant SetVariable vocals 0 when Vocals: (.....|......|.......|......|........|.........) (learning|pondering|concen|muddled|very|perplex|bewildering)
Action instant SetVariable app.exp 1 when Appraisal: (.....|......|.......|......|........|.........) (mind lock|dazed|bewildered)
Action instant SetVariable app.exp 0 when Appraisal: (.....|......|.......|......|........|.........) (learning|pondering|concen|muddled|very|perplex|bewildering)
Action (Sell) inactivate
Action (App) inactivate
Action (Selling) inactivate
    If "%hum" = "on" then Action Instant SetVariable humming 0 when You finish humming
    If "%hum" != "on" then SetVariable humming 1
    if_1 Goto Start
put exp
     WaitFor EXP HELP
Start:
    If %pouch.bot.install != 1 then Goto install
    If_1 SetVariable 1test %1
    If "%1test" = "install" then Goto install
    If "%1test" = "display" then Goto display.short
    If_1 Goto justsell
    If %someone.tipping = 1 then Gosub accept.tip
    If %humming = 0 then Gosub hum
    If %selling = 1 then Put dec
    if %selling = 1 then put say sorry, try again?
    if %selling = 1 then waitfor You say
    If %selling = 1 then SetVariable selling 0
    if %vocals = 1 then if %humming = 1 then gosub stop.hum
    random 40 160
    SetVariable time.check %r
    timer reset
    timer start
check.loop:
    Pause 1
    If "%listen" != "none" then Gosub listen
    If %confirm = 1 then Goto confirm
    If %someone.tipping = 1 then Gosub accept.tip
    If %humming = 0 then Gosub hum
    if %accept.pouch = 1 then Goto accept
    If %t > %time.check then Gosub idle
    Goto check.loop
stop.hum:
put stop hum
     waitforre (You stop|in the name of)
     return
listen:
put listen %listen
     WaitFor You
     SetVariable listen none
     Return
hum.p:
    Pause 0.5
hum:
    If "%hum" != "on" then return
    If %vocals = 1 then return
    random 1 6
    if %r = 1 then put hum %hum1
    if %r = 2 then put hum %hum2
    if %r = 3 then put hum %hum3
    if %r = 4 then put hum %hum4
    if %r = 5 then put hum %hum5
    if %r = 6 then Return
    MatchRE hum.p (type ahead|...wait)
    MatchRE hum.d (You are already performing something|You .* hum)
    MatchWait
hum.d:
    SetVariable humming 1
    Return
tip.person.check:
    SetVariable tip.get 0
    If "%whos.tipping" = "%no.skim.1" then return
    If "%whos.tipping" = "%no.skim.2" then return
    If "%whos.tipping" = "%no.skim.3" then return
    If "%whos.tipping" = "%no.skim.4" then return
    If "%whos.tipping" = "%no.skim.5" then return
    If "%whos.tipping" = "%no.skim.6" then return
    If "%whos.tipping" = "%no.skim.7" then return
    If "%whos.tipping" = "%no.skim.8" then return
    If "%whos.tipping" = "%no.skim.9" then return
    If "%whos.tipping" = "%no.skim.10" then return
    SetVariable tip.get 1
    Return
accept.tip.p:
    pause 0.5
accept.tip:
    Gosub tip.person.check
    if "%accept.tips" != "on" then put decline tip
    if %tip.get = 1 then if "%accept.tips" = "on" then put accept tip
    if %tip.get = 0 then if "%accept.tips" = "on" then put decline tip
    MatchRE accept.tip.p (type ahead|...wait)
    MatchRE accept.tip.t (You decline|You accept)
    MatchWait
accept.tip.t:
    SetVariable someone.tipping 0
    if "%accept.tips" = "on" then if %get.tip = 0 then put whisper %whos.tipping I'll not take tips from a friend, thank ye though.
    if "%accept.tips" = "on" then if %get.tip = 0 then WaitFor You whisper
    if "%accept.tips" = "on" then if %get.tip = 0 then return
    if "%accept.tips" != "on" then put whisper %whos.tipping no tips needed, thank ye.
    if "%accept.tips" != "on" then waitfor You whisper
    if "%accept.tips" != "on" then return
    random 1 14
    if %r = 1 then put whisper %whos.tipping Many thanks, %whos.tipping !
    if %r = 2 then put whisper %whos.tipping My praises, very generous of ye.
    if %r = 3 then put whisper %whos.tipping Very kind of ye, much thanks !
    if %r = 4 then put praise %whos.tipping
    if %r = 5 then put shake hand %whos.tipping
    if %r = 6 then put cheer %whos.tipping
    if %r = 7 then put say /cheerful Much appriciated, %whos.tipping
    if %r = 8 then put say }%whos.tipping /quietly Many thanks, friend. Stop by anytime.
    if %r = 9 then put beam %whos.tipping
    if %r = 10 then put express joy
    if %r = 11 then put nod %whos.tipping court
    if %r = 12 then put say }%whos.tipping /cheerful Praise be to ye, many thanks.
    if %r = 13 then put bow %whos.tipping
    if %r = 14 then put say /quietly Thank ye very much, friend %whos.tipping
    pause 0.5
    Return
sort.app.items:
    if "%app.item.1" != "none" then SetVariable total.app 1
    if "%app.item.2" != "none" then SetVariable total.app 2
    if "%app.item.3" != "none" then SetVariable total.app 3
    if "%app.item.4" != "none" then SetVariable total.app 4
    if "%app.item.5" != "none" then SetVariable total.app 5
    if "%app.item.6" != "none" then SetVariable total.app 6
    if "%app.item.7" != "none" then SetVariable total.app 7
    if "%app.item.8" != "none" then SetVariable total.app 8
    if "%app.item.9" != "none" then SetVariable total.app 9
    if "%app.item.10" != "none" then SetVariable total.app 10
    Return
train.app:
    if %app.exp = 1 then return
    if %total.app = 0 then Gosub sort.app.items
    random 1 100
    if %r > 69 then goto app.complete
    random 1 %total.app
    if %r = 1 then SetVariable item.to.app %app.item.1
    if %r = 2 then SetVariable item.to.app %app.item.2
    if %r = 3 then SetVariable item.to.app %app.item.3
    if %r = 4 then SetVariable item.to.app %app.item.4
    if %r = 5 then SetVariable item.to.app %app.item.5
    if %r = 6 then SetVariable item.to.app %app.item.6
    if %r = 7 then SetVariable item.to.app %app.item.7
    if %r = 8 then SetVariable item.to.app %app.item.8
    if %r = 9 then SetVariable item.to.app %app.item.9
    if %r = 10 then SetVariable item.to.app %app.item.10
    Goto get.app
get.app.p:
    pause 0.5
get.app:
put get my %item.to.app
    MatchRE get.app.p (type ahead|...wait)
    MatchRE get.app.d (You get|already holding)
    Match remove.app that is already in your inventory
    Matchwait
get.app.d:
    SetVariable item.return stow
    goto go.app
remove.app.p:
    pause 0.5
remove.app:
put remove my %item.to.app
    Matchre remove.app.p (type ahead|...wait)
    Matchre remove.app.d (You sling|You slide|You take|You slip|You detach|You remove|You unhook|You unlatch|You unlock|You heav|You lift|You attach|You put|You hook|You latch|You lock|You hang|You pull|You aren't wearing that|You put|You get|You place|You drape|You unwrap|You wrap|You dangle|You set|You tie|You untie|You pluck|You careful|You yank|You affix)
    MatchWait
remove.app.d:
    SetVariable item.return wear
    goto go.app
go.app.p:
    pause 0.5
go.app:
    If prone then Gosub sit.down
    random 1 3
    If %r = 1 then put app my %item.to.app quick
    If %r = 2 then put app my %item.to.app
    If %r = 3 then put app my %item.to.app careful
    Matchre go.app.p (type ahead|...wait)
    Match go.app.d Roundtime
    Matchwait
go.app.d:
    pause 0.5
put %item.return my %item.to.app
    Matchre go.app.d (type ahead|...wait)
    Matchre app.complete (You sling|You slide|You take|You slip|You detach|You remove|You unhook|You unlatch|You unlock|You heav|You lift|You attach|You put|You hook|You latch|You lock|You hang|You pull|You aren't wearing that|You put|You get|You place|You drape|You unwrap|You wrap|You dangle|You set|You tie|You untie|You pluck|You careful|You yank|You affix)
    MatchWait
app.complete:
    SetVariable app.done 1
    Return
idle:
    SetVariable app.done 0
    if "%train.app" = "on" then Gosub train.app
    if %app.done = 1 then random 1 100
    if %app.done = 1 then if %humming = 1 then put ex
    if %app.done = 1 then if %humming = 1 then WaitFor EXP HELP
    if %app.done = 1 then if %humming != 1 then if %r > 50 then put exp
    if %app.done = 1 then if %humming != 1 then if %r > 50 then WaitFor EXP HELP
    if %app.done = 1 then Goto idle.d
    random 1 20
    If %r = 1 then Put exp
    If %r = 2 then Put look
    If %r = 3 then Put inv comb
    If %r = 4 then Put info
    If %r = 5 then Put sort auto head
    If %r = 6 then Put inv
    If %r = 7 then Put enc
    If %r = 8 then Put health
    If %r = 9 then Put inv check
    If %r = 10 then Put ex
    If %r = 11 then Put lo
    If %r = 12 then Put exp
    If %r = 13 then Put loo
    If %r = 14 then Put exp lore
    If %r = 15 then Put l
    If %r = 16 then Put ex
    If %r = 17 then Put look
    If %r = 18 then Put exp
    If %r = 19 then Put l
    if %r = 20 then Put exp survival
idle.d:
    random 60 150
    SetVariable time.check %r
    timer reset
    timer start
    Return
justsell:
    SetVariable Person %1
    Goto App
sit.down.p:
    pause 0.5
sit.down:
put sit
    matchre sit.down.p (type ahead|...wait)
    matchre sit.down.d (You are already sitting|You sit)
    matchwait
sit.down.d:
    Return
install:
Echo
Echo .______________________________________________
Echo .   [ Installing And Configuring PouchBoT ]
Echo .______________________________________________
Put #SetVariable LifeTimeApp 0
Put #SetVariable LifeTimePaidFor 0
Put #SetVariable LifeTimeGain 0
Put #SetVariable LifeTimePercent 0
Put #SetVariable LifeTimeCount 0
Put #SetVariable pouch.bot.install 1
Put #savevariables
Echo
Echo .______________________________________________
Echo .    [ PouchBoT Successfully Installed ! ]
Echo .______________________________________________
Echo
    Exit
confirm:
    SetVariable confirm 0
    Pause
Put nod
    WaitFor You nod
Put smile
    WaitFor You smile
    If %someone.tipping = 1 then Gosub accept.tip
    Goto Start
accept:
    SetVariable accept.pouch 0
    Action (Confirm) inactivate
    timer stop
    timer reset
    Pause
    Action (Selling) activate
    Action (Name) activate
Put accept
    WaitFor You accept
    Pause
    Action (Name) inactivate
    Action (Accept) inactivate
    If "%lhand" != "Empty" then Gosub pouch.put
    If prone then Gosub sit.down
    If %someone.tipping = 1 then Gosub accept.tip
    If %humming = 0 then Gosub hum
    If "%listen" != "none" then Gosub listen
    Action (App) activate
    Goto App
pouch.put:
    If "%lhand" = " " then return
Put put my second pouch in bucket
    WaitForRE (You drop|Perhaps you should be holding that|could not find|What were you)
    if "%lhand" != "Empty" then if "%lhand" != " " then put stow left
    pause 0.3
put can
    WaitFor cancel
    Return
AppP:
    Pause
App:
Put app my pouch quick
    MatchRE AppP (type ahead|...wait)
    Match OpenP need to open the
    Match Empty appear to be anything
    Match Bunk.Items if you removed the items that
    Match SellPouch Roundtime
    MatchWait
Bunk.Items.p:
    Pause 0.5
Bunk.Items:
    If %someone.tipping = 1 then Gosub accept.tip
Put give %Person
    MatchRE Bunk.Items.p (type ahead|...wait)
    MatchRE Bunk.Items.d (You offer|have an outstanding offer|You give|You hand)
    MatchWait
Bunk.Items.d:
    random 1 10
    If %r = 1 then Put whisper %Person theres stuff in here besides gems, might wanna sift through it and take em out
    If %r = 2 then Put whisper %Person got some things in here that aint gems
    If %r = 3 then Put whisper %Person im afraid there are items in here that the gem shop wont buy
    If %r = 4 then Put whisper %Person sometimes things just dont go your way, got some stuff in here that dont belong in a gem pouch
    If %r = 5 then Put whisper %Person tryin to pull a fast one on me? ya slipped a thing or two in this pouch that dont belong
    If %r = 6 then Put whisper %Person sorry but the gem shop only buys gems, you got some things in here that wont sell
    If %r = 7 then Put whisper %Person dont think the shop will buy this one, ya seem to have some junk in here that aint gem shop material
    If %r = 8 then Put whisper %Person confuse yer herb pouch with yer gem pouch perhaps? got a few things in here that aint normally seen in a gem pouch
    If %r = 9 then Put whisper %Person maybe you need the pawn shop for this one, gem shop only buys gems. ya gotta take out the items that arent gems
    If %r = 10 then Put whisper %Person looks like theres some items in this pouch that are not gems, perhaps ya should clean it out a bit so i can sell it, yes?
    WaitFor You whisper
    Action (Sell) activate
    Action (Confirm) activate
    Goto Start
Empty:
    Action (App) inactivate
    random 1 10
    If %r = 1 then Put whisper %Person theres nothing in this pouch im afriad
    If %r = 2 then Put whisper %Person ye handed me an empty pouch
    If %r = 3 then Put whisper %Person this pouch is as vacant as boar clan is during an invasion
    If %r = 4 then Put whisper %Person tis empty
    If %r = 5 then Put whisper %Person if there be gems in this pouch they be too small for my eyes to see
    If %r = 6 then Put whisper %Person ye might have handed me the wrong pouch, this one has nothin in it
    If %r = 7 then Put whisper %Person if I had a topaz for everytime someone handed me an empty pouch, I'd be rich by now
    If %r = 8 then Put whisper %Person ya need to hunt more and fill this one before ya gimme it
    If %r = 9 then Put whisper %Person this is a very zen pouch, it's one with nothing for sure
    If %r = 10 then Put whisper %Person no gems inside this one
    WaitFor You whisper
    Pause
    If %someone.tipping = 1 then Gosub accept.tip
Put give %Person
    Pause
    Action (Sell) activate
    Action (Confirm) activate
    Action (Accept) activate
    Goto Start
OpenXP:
    Pause
OpenP:
Put open my pouch
    Match App You open
    MatchRE OpenXP (...wait|type ahead)
    MatchWait
SellPouchXP:
    Pause 0.5
    Goto selling.pouch
SellPouch:
    If %AppFor > %finesse.limit then Gosub finesse
Action (Sell) activate
Action (App) inactivate
selling.pouch:
    If %someone.tipping = 1 then Gosub accept.tip
    If %humming = 0 then Gosub hum
Put sell my pouch
    MatchRE SellPouchXP (...wait|type ahead)
    MatchRE Start.Figure (The Dwarven appraiser scrutinizes|briskly examines)
    MatchRE Start.Figure hands you .* (Lir|Dok|Kron)
    MatchWait
finesse.p:
    Pause 0.5
finesse:
    If "%use.finesse" != "on" then return
    If %finesse = 1 then return
Put spec finesse
    MatchRE finesse.p (type ahead|...wait|distracted|distraction|fail)
    MatchRE finesse.d (realize you are able to act|already putting your best appearance|seem to concentrate on that right)
    MatchWait
finesse.d:
    Return
Start.Figure:
    Pause 0.2
Action (Sell) inactivate
Action (App) inactivate
#% math for life time appraisal
    SetVariable TempLTapp %LifeTimeApp
    math TempLTapp add %AppFor
#% math for life time sold for
    SetVariable TempLTPaidFor %LifeTimePaidFor
    math TempLTPaidFor add %PaidFor
#% math for this pouches gain
    SetVariable figure1 %AppFor
    SetVariable figure2 %PaidFor
    math figure2 subtract %figure1
    SetVariable PouchGain %figure2
    pause 0.1
#% math for life time pouch gain
    SetVariable TempLTgain %LifeTimeGain
    math TempLTgain add %PouchGain
#% math for this pouches percent boost
    SetVariable figure1 %AppFor
    SetVariable figure2 %PouchGain
    math figure2 divide %figure1
    math figure2 multiply 100
    SetVariable PercentBoost %figure2
    pause 0.1
#% math for life time percent boost
    SetVariable figure1 %LifeTimeApp
    SetVariable figure2 %LifeTimeGain
    pause 0.1
    math figure2 divide %figure1
    math figure2 multiply 100
#% counter for life time pouches
    SetVariable TempLTcount %LifeTimeCount
    math TempLTcount add 1
#% procedure for rounding the decimal off on the percent boost
check.percent:
    SetVariable percentcount 50
    SetVariable percent.tracker 1
check.per2:
    math percentcount subtract 1
    If %percentcount < %PercentBoost then Goto check.per.done
    math percent.tracker add 1
    if %percent.tracker > 14 then pause 0.1
    if %percent.tracker > 14 then SetVariable percent.tracker 1
    Goto check.per2
check.per.done:
    SetVariable percentspecific %PercentBoost
    SetVariable PercentBoost %percentcount
#% procedure for sorting names and how many pouches in your LifeTime youve sold for them
figure.Person:
    Gosub name.check %Person
    Goto done.name
name.check:
    If %$1 > 0 then Goto set.name
Echo .______________________________________________
Echo . [ $1 Not Found, Creating New Cell For Customer. ]
Echo .______________________________________________
Put #SetVariable $1 0
Put #savevariables
    Goto set.name
set.name:
    SetVariable tempname %$1
    SetVariable namevalue %$1
    math tempname add 1
Put #SetVariable $1 %tempname
Put #SetVariable LifeTimeApp %TempLTapp
Put #SetVariable LifeTimePaidFor %TempLTPaidFor
Put #SetVariable LifeTimeGain %TempLTgain
Put #SetVariable LifeTimePercent %figure2
Put #SetVariable LifeTimeCount %TempLTcount
Put #savevariables
    Return
skimming:
    SetVariable %skim.ammount 0
    SetVariable skim.grade 0
    If "%skim.newbs" = "on" then if %tempname > %newb.limit then return
    If "%Person" = "%no.skim.1" then return
    If "%Person" = "%no.skim.2" then return
    If "%Person" = "%no.skim.3" then return
    If "%Person" = "%no.skim.4" then return
    If "%Person" = "%no.skim.5" then return
    If "%Person" = "%no.skim.6" then return
    If "%Person" = "%no.skim.7" then return
    If "%Person" = "%no.skim.8" then return
    If "%Person" = "%no.skim.9" then return
    If "%Person" = "%no.skim.10" then return
    SetVariable pre.skim %PouchGain
    math pre.skim divide %PercentBoost
    math pre.skim multiply %skim.percent
    SetVariable skim.ammount %pre.skim
    SetVariable skim.count 0
    SetVariable skim.track 0
    Gosub Sort.Skim
    SetVariable skim.ammount %skim.count
    math skim.ammount subtract 10
    math PercentBoost subtract %skim.percent
    math PouchGain subtract %skim.ammount
    math PaidFor subtract %skim.ammount
    SetVariable skim.grade %skim.percent
    Return
sort.skim:
    math skim.track add 1
    math skim.count add 10
    if %skim.track = 25 then pause 0.1
    if %skim.track > 24 then SetVariable skim.track 0
    if %skim.count < %skim.ammount then goto sort.skim
    if %skim.count > %skim.ammount then return
    if %skim.count = %skim.ammount then return
done.name:
Echo .______________________________________________
Echo .                * Statistics *
Echo .______________________________________________
Echo . Average boost             : % %LifeTimePercent
Echo . Total sold by PouchBoT    : %LifeTimeCount
Echo . This Pouch Appraised For  : %AppFor
Echo . This Pouch Sold For       : %PaidFor
Echo . This Pouches Gain         : %PouchGain
Echo . This Pouches Boost        : % %PercentBoost
    If "%skim" = "on" then Gosub skimming
    If "%skim" = "on" then If "%skim.newbs" = "on" then if %tempname > %newb.limit then Echo . Repeat Costomer, No Skimming on %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.1" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.2" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.3" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.4" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.5" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.6" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.7" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.8" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.9" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    If "%skim" = "on" then If "%Person" = "%no.skim.10" then Echo . Pouch Sold For Friend, No Skimming On %Persons Pouch.
    if "%skim" != "on" then goto display.stat.fin
    If %skim.ammount = 0 then Goto display.stat.fin
    If "%skim" = "on" then Echo . Percent Skimmed           : % %skim.grade
    If "%skim" = "on" then Echo . Ammount Kept              : %skim.ammount
display.stat.fin:
Echo .______________________________________________
Echo . [ PouchBoT has sold %tempname pouches for %Person ]
Echo .______________________________________________
    If %someone.tipping = 1 then Gosub accept.tip
done.display:
    If "%whisper" != "on" then Goto no.whisper
    If %tempname < 2 then Put whisper visi %Person This is the first pouch I've sold for you, %Person. From an appraisal of %AppFor the appraiser paid me %PaidFor, which is a gain of %PouchGain copper (about % %PercentBoost bonus)
    If %tempname < 2 then Pause 0.5
    If %tempname < 2 then Goto no.whisper
    random 1 9
    If %r = 1 then Put whisper visi %Person Many thanks %Person ! Your pouch appraised for %AppFor and sold for %PaidFor I've gained you %PouchGain, a little over %PercentBoost percent boost.
    If %r = 2 then Put whisper visi %Person I got you a % %PercentBoost on this pouch, which was about a %PouchGain gain on the %AppFor that it appraised for.
    If %r = 3 then Put whisper visi %Person And yet another awesome pouch sold by yours truely, starting with an appraisal of %AppFor and selling for %PaidFor after an increase of %PouchGain which is about a % %PercentBoost boost.
    If %r = 4 then Put whisper visi %Person Not too shabby at all, your %AppFor pouch sold for %PaidFor (%PouchGain increase, roughly a % %PercentBoost boost)
    If %r = 5 then Put whisper visi %Person The appraiser must be in a good mood today, he paid %PaidFor for your %AppFor pouch, a gain of %PouchGain (% %PercentBoost bonus)
    If %r = 6 then Put whisper visi %Person I gained a % %PercentBoost bonus on your pouch %Person, bringing it from %AppFor to %PaidFor which is about a difference of %PouchGain copper.
    If %r = 7 then Put whisper visi %Person Nice pouch %Person, based of %AppFor appraisal, the gem shop paid %PaidFor (about a % %PercentBoost gain).
    If %r = 8 then Put whisper visi %Person I've sold %tempname pouches for you over time, %Person. This pouch appraised for %AppFor and sold for %PaidFor gettin you a bonus of %PouchGain copper, a little over a % %PercentBoost bonus.
    If %r = 9 then Put whisper visi %Person Welcome back %Person, I've sold %tempname pouches for you over time so far, this pouch appraised for %AppFor and sold for %PaidFor gainin a bonus of % %PercentBoost (%PouchGain copper)
    WaitFor You whisper
no.whisper:
Put tip %Person %PaidFor %denomination
    Wait
    If %someone.tipping = 1 then Gosub accept.tip
    If %humming = 0 then Gosub hum
    Action (Selling) inactivate
    Action (Accept) activate
    Action (Confirm) activate
Put give %Person
    WaitForRE (You offer your|nothing in your|You may only have one outstanding)
Put swap
    If_1 Goto end.script
    WaitForRE (accepts your tip|You have nothing to swap|You move)
    Goto Start
end.script:
    Exit
display.short:
Echo .______________________________________________
Echo .                * Statistics *
Echo .______________________________________________
Echo . Average boost             : % %LifeTimePercent
Echo . Total sold by PouchBoT    : %LifeTimeCount
    If_2 Goto dis.short.2
    Exit
dis.short.2:
Echo .______________________________________________
Echo .            * Customer Statistics *
Echo .______________________________________________
Echo . Customer Name  : %2
    Gosub dis.short %2
    Exit
dis.short:
Echo . [ PouchBoT has sold %$1 pouches for %2 ]
Echo .______________________________________________
    Return