     setvariable finish off
     include traderai.variables.cmd
     include commodity.triggers.cmd
     include traderai.travel2.cmd
     include traderai.skills.cmd
     pause 0.5
core:
     if "%commodity.toggle" = "on" then setvariable commodity.toggle 1
     if "%commodity.toggle" = "off" then setvariable commodity.toggle 0
     if "%commodity.toggle" = "On" then setvariable commodity.toggle 1
     if "%commodity.toggle" = "Off" then setvariable commodity.toggle 0
     if "%commodity.toggle" = "ON" then setvariable commodity.toggle 1
     if "%commodity.toggle" = "OFF" then setvariable commodity.toggle 0
     if "%local.toggle" = "on" then setvariable local.toggle 1
     if "%local.toggle" = "off" then setvariable local.toggle 0
     if "%local.toggle" = "On" then setvariable local.toggle 1
     if "%local.toggle" = "Off" then setvariable local.toggle 0
     if "%local.toggle" = "ON" then setvariable local.toggle 1
     if "%local.toggle" = "OFF" then setvariable local.toggle 0
     if "%interprov.toggle" = "on" then setvariable interprov.toggle 1
     if "%interprov.toggle" = "off" then setvariable interprov.toggle 0
     if "%interprov.toggle" = "On" then setvariable interprov.toggle 1
     if "%interprov.toggle" = "Off" then setvariable interprov.toggle 0
     if "%interprov.toggle" = "ON" then setvariable interprov.toggle 1
     if "%interprov.toggle" = "OFF" then setvariable interprov.toggle 0
     if "%auto.reconnect" = "on" then setvariable auto.reconnect 1
     if "%auto.reconnect" = "off" then setvariable auto.reconnect 0
     if "%auto.reconnect" = "On" then setvariable auto.reconnect 1
     if "%auto.reconnect" = "Off" then setvariable auto.reconnect 0
     if "%auto.reconnect" = "ON" then setvariable auto.reconnect 1
     if "%auto.reconnect" = "OFF" then setvariable auto.reconnect 0
     if "%sound.alerts" = "on" then setvariable sound.alerts 1
     if "%sound.alerts" = "off" then setvariable sound.alerts 0
     if "%sound.alerts" = "On" then setvariable sound.alerts 1
     if "%sound.alerts" = "Off" then setvariable sound.alerts 0
     if "%sound.alerts" = "ON" then setvariable sound.alerts 1
     if "%sound.alerts" = "OFF" then setvariable sound.alerts 0
     if "%ship.toggle" = "on" then setvariable ship.toggle 1
     if "%ship.toggle" = "off" then setvariable ship.toggle 0
     if "%ship.toggle" = "On" then setvariable ship.toggle 1
     if "%ship.toggle" = "Off" then setvariable ship.toggle 0
     if "%ship.toggle" = "ON" then setvariable ship.toggle 1
     if "%ship.toggle" = "OFF" then setvariable ship.toggle 0
     if "%use.achaedi.crystal" = "on" then setvariable use.achaedi.crystal 1
     if "%use.achaedi.crystal" = "off" then setvariable use.achaedi.crystal 0
     if "%use.achaedi.crystal" = "On" then setvariable use.achaedi.crystal 1
     if "%use.achaedi.crystal" = "Off" then setvariable use.achaedi.crystal 0
     if "%use.achaedi.crystal" = "ON" then setvariable use.achaedi.crystal 1
     if "%use.achaedi.crystal" = "OFF" then setvariable use.achaedi.crystal 0
     if "%train.appraisal" = "on" then setvariable train.appraisal 1
     if "%train.appraisal" = "off" then setvariable train.appraisal 0
     if "%train.appraisal" = "On" then setvariable train.appraisal 1
     if "%train.appraisal" = "Off" then setvariable train.appraisal 0
     if "%train.appraisal" = "ON" then setvariable train.appraisal 1
     if "%train.appraisal" = "OFF" then setvariable train.appraisal 0
     if "%sneak" = "on" then setvariable sneak 1
     if "%sneak" = "off" then setvariable sneak 0
     if "%sneak" = "On" then setvariable sneak 1
     if "%sneak" = "Off" then setvariable sneak 0
     if "%sneak" = "ON" then setvariable sneak 1
     if "%sneak" = "OFF" then setvariable sneak 0
     if "%auto.disband" = "on" then setvariable auto.disband 1
     if "%auto.disband" = "off" then setvariable auto.disband 0
     if "%auto.disband" = "On" then setvariable auto.disband 1
     if "%auto.disband" = "Off" then setvariable auto.disband 0
     if "%auto.disband" = "ON" then setvariable auto.disband 1
     if "%auto.disband" = "OFF" then setvariable auto.disband 0
     if "%train.perception" = "on" then setvariable train.perception 1
     if "%train.perception" = "off" then setvariable train.perception 0
     if "%train.perception" = "On" then setvariable train.perception 1
     if "%train.perception" = "Off" then setvariable train.perception 0
     if "%train.perception" = "ON" then setvariable train.perception 1
     if "%train.perception" = "OFF" then setvariable train.perception 0
     if "%stay.hidden" = "on" then setvariable stay.hidden 1
     if "%stay.hidden" = "off" then setvariable stay.hidden 0
     if "%stay.hidden" = "On" then setvariable stay.hidden 1
     if "%stay.hidden" = "Off" then setvariable stay.hidden 0
     if "%stay.hidden" = "ON" then setvariable stay.hidden 1
     if "%stay.hidden" = "OFF" then setvariable stay.hidden 0
     if "%train.vocals" = "on" then setvariable train.vocals 1
     if "%train.vocals" = "off" then setvariable train.vocals 0
     if "%train.vocals" = "On" then setvariable train.vocals 1
     if "%train.vocals" = "Off" then setvariable train.vocals 0
     if "%train.vocals" = "ON" then setvariable train.vocals 1
     if "%train.vocals" = "OFF" then setvariable train.vocals 0
     if "%train.compendium" = "on" then setvariable train.compendium 1
     if "%train.compendium" = "off" then setvariable train.compendium 0
     if "%train.compendium" = "On" then setvariable train.compendium 1
     if "%train.compendium" = "Off" then setvariable train.compendium 0
     if "%train.compendium" = "ON" then setvariable train.compendium 1
     if "%train.compendium" = "OFF" then setvariable train.compendium 0
     if %sound.alerts = 1 then goto sound.triggers
main.engine:
     pause 0.5
echo .
echo .
echo . ______________________________________________________________________________________
echo . |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
echo . |------------------------------------------------------------------------------------|
echo . |                      ~ Genie Pro Version 1.0 ~                ____________________ |
echo . |  _________   _  _         _      _  _      _  _  _   _  _     | . . . . . . . . .| |
echo . | [.........] [.][.]_     _[.]_   [.][.]_   [.][.][.] [.][.]_   |. .____ . ._____. | |
echo . |     [.]     [.]  [.]   [.] [.]  [.]  [.]  [.]       [.]  [.]  | ./*/\*\ .[o   o].| |
echo . |     [.]     [.] _[.]  [.] _ [.] [.]   [.] [.] _     [.] _[.]  |.|*|__|*| . | | . | |
echo . |     [.]     [.][.]    [.][.][.] [.]   [.] [.][.]    [.][.]    | |o|--|o|. .| |. .| |
echo . |     [.]     [.] [.]   [.]   [.] [.]   [.] [.]       [.] [.]   |.|*|. |*| . | | . | |
echo . |     [.]     [.]  [.]  [.]   [.] [.] _[.]  [.] _  _  [.]  [.]  | |*| .|*|.[o___o].| |
echo . |     [.]     [.]   [.] [.]   [.] [.][.]    [.][.][.] [.]   [.] |. . . . . . . . . | |
echo . |                                                               |__________________| |
echo . |                                                              (c)2006 Gavinne White |
echo . |____________________________________________________________________________________|
echo . |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
echo . |____________________________________________________________________________________|
echo .
echo .
     put #play cleanup.wav
     gosub logo.startup
     gosub installation.test
     if "%1" = "instal" then goto install
     if "%1" = "install" then goto install
     echo .
     echo .  ____________________________________
     if %local.toggle = 1 then echo . [ Local Contracts            Enabled ]
     if %local.toggle = 0 then echo . [ Local Contracts           Disabled ]
     if %interprov.toggle = 1 then echo . [ Interprovential Contracts  Enabled ]
     if %interprov.toggle = 0 then echo . [ Interprovential Contracts Disabled ]
     if %commodity.toggle = 1 then echo . [ Commodities                Enabled ]
     if %commodity.toggle = 1 then echo . [ Minimum Profit Per Unit  %minimum.unit.gain Kronar ]
     if %commodity.toggle = 0 then echo . [ Commodities               Disabled ]
     if %auto.reconnect = 1 then echo . [ Auto Reconnect             Enabled ]
     if %auto.reconnect = 0 then echo . [ Auto Reconnect            Disabled ]
     if %auto.disband = 1 then echo . [ Auto Disband               Enabled ]
     if %auto.disband = 0 then echo . [ Auto Disband              Disabled ]
     if %sound.alerts = 1 then echo . [ Sound Alerts               Enabled ]
     if %sound.alerts = 0 then echo . [ Sound Alerts              Disabled ]
     if %ship.toggle = 1 then echo . [ Personal Ship              Enabled ]
     if %ship.toggle = 0 then echo . [ Personal Ship             Disabled ]
     if %use.achaedi.crystal = 1 then echo . [ Achaedi Crystal            Enabled ]
     if %use.achaedi.crystal = 0 then echo . [ Achaedi Crystal           Disabled ]
     if %train.appraisal = 1 then echo . [ Appraisal                  Enabled ]
     if %train.appraisal = 0 then echo . [ Appraisal                 Disabled ]
     if %train.perception = 0 then echo . [ Perception                Disabled ]
     if %train.compendium = 1 then echo . [ Compendium                 Enabled ]
     if %train.compendium = 0 then echo . [ Compendium                Disabled ]
     if %train.vocals = 0 then echo . [ Vocals                    Disabled ]
     if %train.vocals = 1 then gosub hide.sneak.check.start
     if %train.perception = 1 then gosub stay.hidden.check.start
     if %sneak = 1 then echo . [ Sneak                      Enabled ]
     if %sneak = 0 then echo . [ Sneak                     Disabled ]
     if %stay.hidden = 1 then echo . [ Hiding                     Enabled ]
     if %stay.hidden = 0 then echo . [ Hiding                    Disabled ]
echo . |____________________________________|
echo . |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
     if %train.perception = 1 then action instant setvariable train.perception 0 when Your injuries make juggling impossible
     if %auto.reconnect = 1 then action put #connect %account.name %account.password %toon.name \p\p\p\p\p\p\plook when (Connection closed. \[|Connection lost. \[)
     if %train.vocals = 1 then action instant setvariable humming 1 when (You begin to hum|You .* begin to hum|You are already performing something)
     if %train.vocals = 1 then action instant setvariable humming 0 when (You stop playing your song|You finish humming|You decide that now isn't the best time to be playing)
     if %sneak = 1 then action instant setvariable temp.sneak 0 when (reveals your location|revealing your location|points to you|points you out|pointing you out|Your location is reveal|hiding place is revealed|You slip out of hiding to play|You are a bit too busy performing)
     echo . [ Setting Up Basic Data          ... ]
	 
     setvariable real.profit 0
     setvariable total.contracts.local 0
     setvariable total.contracts.interprov 0
     setvariable total.commodities.delivered 0
     setvariable interprov.to.shard 0
     setvariable interprov.from.shard 0
     setvariable interprov.to.xings 0
     setvariable interprov.from.xings 0
     setvariable interprov.to.riverhaven 0
     setvariable interprov.from.riverhaven 0
     setvariable xings.interprov.destined.for nil
     setvariable leth.destined.for nil
     setvariable xings.destined.for nil
     setvariable sc.destined.for nil
     setvariable dirge.destined.for nil
     setvariable wc.destined.for nil
     setvariable tc.destined.for nil
     setvariable arthe.destined.for nil
     setvariable riverhaven.destined.for nil
     setvariable shard.destined.for nil
     setvariable last.skill nil
     setvariable skill.track 0

     setvariable shard.interprov.track %limit.till.shard
     setvariable coin.on.you 0
     setvariable humming 0
     setvariable thiefname nil
     setvariable pay.clerk.commod 0
     setvariable finesse.on 0
     setvariable temp.sneak 0
     setvariable caravan.fast 0

     action instant setvariable caravan.there 1 when Your .* caravan .* following you.
     action instant put listen $1 when you must LISTEN TO (\w+)
     action instant setvariable finish 1 when ^toggle finish on
     action instant setvariable finish 0 when ^toggle finish off
     action instant setvariable commodity.toggle 1 when ^toggle commodities on
     action instant setvariable commodity.toggle 0 when ^toggle commodities off
     action instant setvariable interprov.toggle 1 when ^toggle interprov on
     action instant setvariable interprov.toggle 0 when ^toggle interprov off
     action instant setvariable local.toggle 1 when ^toggle local on
     action instant setvariable local.toggle 0 when ^toggle local off
     action instant setvariable local.limit $1 when ^toggle local limit (\d+)
     action instant setvariable interprov.limit $1 when ^toggle interprov limit (\d+)
     action instant setvariable commodity.limit $1 when ^toggle commodity limit (\d+)
     action instant setvariable train.appraisal 1 when ^toggle appraisal on
     action instant setvariable train.appraisal 0 when ^toggle appraisal off
     action instant setvariable train.perception 1 when ^toggle perception on
     action instant setvariable train.perception 0 when ^toggle perception off
     action instant setvariable train.vocals 1 when ^toggle vocals on
     action instant setvariable train.vocals 0 when ^toggle vocals off
     action instant setvariable train.compendium 1 when ^toggle compendium on
     action instant setvariable train.compendium 0 when ^toggle compendium off
     action instant setvariable stay.hidden 1 when ^toggle stay.hidden on
     action instant setvariable stay.hidden 0 when ^toggle stay.hidden off
     action instant setvariable sneak 1 when ^toggle sneak on
     action instant setvariable sneak 0 when ^toggle sneak off
     action instant echo [ Local : Crossing - To:%local.to.xings From:%local.from.xings | Arthe - To:%local.to.arthe From:%local.from.arthe | Stone Clan - To:%local.to.sc From:%local.from.sc | Dirge - To:%local.to.dirge From:%local.from.dirge | Leth - To:%local.to.leth From:%local.from.leth | Wolf Clan - To:%local.to.wc From:%local.from.wc | Tiger Clan - To:%local.to.tc From:%local.from.tc *** Interprov : Crossing - To:%interprov.to.xings From:%interprov.from.xings | Shard - To:%interprov.to.shard From:%interprov.from.shard | Riverhaven - To:%interprov.to.riverhaven From:%interprov.from.riverhaven ] . . . . .  -|$|- REAL PROFFIT %real.profit Kronar ! -|$|- when (You were born on|EXP HELP)
     action instant setvariable thiefname $1 when You glance down and catch (\w+)
     action instant put #parse TraderAI whispers, "ALERT! - You caught %thiefname stealing from you." when in the act of trying to pick your pocket
     action instant setvariable engaged 1 when (closes to pole weapon range on you|You retreat back to pole range)
     action instant setvariable engaged 2 when (closes to melee range on you|You are engaged)
     action instant setvariable engaged 0 when (You retreat from combat|You are already as far away as you can get)
     setvariable carried.diamonds 0
     setvariable carried.gold 0
     setvariable carried.ironore 0
     setvariable carried.amber 0
     setvariable carried.cinnamon 0
     setvariable carried.slate 0
     setvariable carried.lead 0
     setvariable carried.bronze 0
     setvariable carried.cotton 0
     setvariable carried.velvet 0
     setvariable carried.deobaroil 0
     setvariable carried.salt 0
     setvariable carried.purpledye 0
     setvariable carried.wheat 0
     setvariable carried.corn 0
     setvariable carried.taffelberries 0
     setvariable carried.pearls 0
     setvariable carried.silver 0
     setvariable carried.charcoal 0
     setvariable carried.saffron 0
     setvariable carried.papyrus 0
     setvariable carried.limes 0
     setvariable carried.brass 0
     setvariable carried.copper 0
     setvariable carried.silk 0
     setvariable carried.wool 0
     setvariable carried.lace 0
     setvariable carried.myrrh 0
     setvariable carried.indigo 0
     setvariable carried.barley 0
     setvariable carried.oats 0
     setvariable carried.acanth 0
     setvariable carried.apples 0
     setvariable carried.oranges 0
     setvariable crossings.bank.balance 0
     setvariable dirge.bank.balance 0
     setvariable leth.bank.balance 0
     setvariable shard.bank.balance 0
     setvariable riverhaven.bank.balance 0
     setvariable total.coin 0
     echo . [ Setting Up Advanced Data       ... ]
  
     gosub setup.outposts
     gosub startup.check
     gosub info.check
     gosub ledger.check
     gosub coin.carried.check %coin.carried
     gosub money.check
     echo .
     echo . [ Set Up Complete !!! ]
     echo .
     echo .
     echo . [ Race         :             %race ]
     echo . [ Gender       :              %gender ]
     echo . [ Age          :                 %age ]
     echo . [ Circle       :                  %circle ]
     echo . [ Strength     : %strength    Stamina  : %stam ]
     echo . [ Agility      : %agility    Reflexes : %reflex ]
     echo . [ Intelligence : %intel      Wisdom : %wisdom ]
     echo . [ Charisma     : %charisma  Discipline : %disc ]
     echo . [ Favors       : %favors                  ]
     echo . [ Coin Carried : %coin.carried   ( %carried.converted Kronar ) ]
     echo . [ Applied Trading Without Speculate Finesse : %applied.trading ]
     echo . [ Applied Trading With Speculate Finesse    : %with.finesse ]
     echo .

     gosub ekko.stats
start:
     match start.riverhaven the rise of some steep steps you hear frenzied cries of business from the Pit
     match start.shard Brickwell Tower, Dispatch
	match start.tiger.clan the shipping clerk and the Tiger Clan trade minister
	match start.tiger.clan Tiger Clan, Trader's Guild Outpost
	match start.crossings Traders' Guild, Shipment Center
	match start.arthe Swotting Hall, Trader's Center
	match start.stone.clan Stone Clan, Trader's Guild Outpost
	match start.dirge Darkstone Inn, Stables
	match start.leth Eshar's Trading Post, Main Room
	match start.wolf.clan Wolf Clan Trader Outpost
	match start.gondola.north an aerie forgotten in the wilderness, the platform remains despite being abandoned by its creators
	match start.gondola.south greying wooden boards of the platform have been replaced by paving stones
	match arthe.stable Arthe Hollow Inn, Caravan Stable
	match xings.stable Haldofurd's Barn, Caravan Stable
	match sc.stable stable was obviously built with Dwarven stature in mind.
	match wc.stable Wolf Clan Home, Caravan Barn
	match vpfail Obvious paths:
	match vpfail Obvious exits:
put look
     matchwait
vpfail:
     echo You Must Start In One Of The OutPosts Or Guild
     exit
info.check:
     echo . [ Setting Up Character           ... ]
     
     action instant setvariable race $1 when Race: (\S+) *Guild:
     action instant setvariable gender $1 when Gender: *(Female|Male)
     action instant setvariable age $1 when Age: *(\d+)
     action instant setvariable circle $1 when Circle: *(\d+)
     action instant setvariable strength $1 when Strength : *(\d+)
     action instant setvariable reflex $1 when Reflex : *(\d+)
     action instant setvariable agility $1 when Agility : *(\d+)
     action instant setvariable charisma $1 when Charisma : *(\d+)
     action instant setvariable disc $1 when Discipline : *(\d+)
     action instant setvariable wisdom $1 when Wisdom : *(\d+)
     action instant setvariable intel $1 when Intelligence : *(\d+)
     action instant setvariable stam $1 when Stamina : *(\d+)
     action instant setvariable favors $1 when Favors: *(\d+)
     action instant setvariable trading $1 when Trading: *(\d+) \d
     action instant setvariable appraisal $1 when Appraisal: *(\d+) \d
put info
     waitfor Encumbrance
put exp 1
     waitfor EXP HELP
     pause 0.5
     action remove Trading: *(\d+) \d
     action remove Appraisal: *(\d+) \d
     action remove Race: (\S+) *Guild:
     action remove Gender: *(Female|Male)
     action remove Age: *(\d+)
     action remove Circle: *(\d+)
     action remove Strength : *(\d+)
     action remove Reflex : *(\d+)
     action remove Agility : *(\d+)
     action remove Charisma : *(\d+)
     action remove Discipline : *(\d+)
     action remove Wisdom : *(\d+)
     action remove Intelligence : *(\d+)
     action remove Stamina : *(\d+)
     action remove Favors: *(\d+)
     setvariable temp.app %appraisal
     setvariable temp.char %charisma
     math temp.char multiply 5
     math temp.app multiply 0.33
     setvariable applied.trading %trading
     math applied.trading add %temp.char
     math applied.trading add %temp.app
     setvariable with.finesse %applied.trading
     math with.finesse multiply 0.5
     math with.finesse add %applied.trading
     return
start.shard:
     gosub rent.caravan
     gosub core.move go door
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver|could not find|What were you|must be in the same room|have nothing to command at this)
     gosub core.move go door
shard:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place shard
     if %humming = 1 then gosub stop.hum
     gosub turn-in.interprov shard
     setvariable interprov.to.shard 0
     gosub ask-for.interprov
     gosub ask-for.interprov
     gosub ekko.stats
     gosub ekko.statusbar
     gosub ekko.statusbar.2
     gosub core.move go door
     if %finesse.on = 1 then gosub spec.finesse.stop
echo . [ Destination Set, Going From %place To leth ! ]
     goto shard.to.gondola
start.riverhaven:
     gosub rent.caravan
     gosub core.move out
start.riverhaven.1:
put tell caravan to wait
     matchre riverhaven.caravan.true (You pass on the order|You tell your driver)
     matchre riverhaven.caravan.false (could not find|What were you|must be in the same room|have nothing to command at this)
     matchwait
riverhaven.caravan.false:
     gosub core.move go door
put return cara
     waitfor caravan
     gosub tell.caravan follow
     gosub tell.caravan go fast
     gosub movement out
     goto start.riverhaven.1
riverhaven.caravan.true:
     gosub core.move go alley
riverhaven:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place riverhaven
     if %humming = 1 then gosub stop.hum
     gosub turn-in.interprov riverhaven
     setvariable interprov.to.riverhaven 0
     pause 1
     if %interprov.from.riverhaven = 0 then gosub core.move out
     if %interprov.from.riverhaven = 0 then gosub core.move ne
     if %interprov.from.riverhaven = 0 then gosub core.move n
     if %interprov.from.riverhaven = 0 then gosub core.move n
     if %interprov.from.riverhaven = 0 then gosub core.move go bank
     if %interprov.from.riverhaven = 0 then gosub core.move go arch
     if %interprov.from.riverhaven = 0 then gosub core.move go deobar door
     if %interprov.from.riverhaven = 0 then put exch all kron to lir
     if %interprov.from.riverhaven = 0 then pause 2
     if %interprov.from.riverhaven = 0 then gosub core.move go deobar door
     if %interprov.from.riverhaven = 0 then gosub m.inputank.core nil
     if %interprov.from.riverhaven = 0 then gosub core.move go arch
     if %interprov.from.riverhaven = 0 then gosub core.move out
     if %interprov.from.riverhaven = 0 then gosub core.move s
     if %interprov.from.riverhaven = 0 then gosub core.move s
     if %interprov.from.riverhaven = 0 then gosub core.move sw
     if %interprov.from.riverhaven = 0 then gosub core.move go alley
     gosub ask-for.interprov
     gosub ekko.stats
     gosub ekko.statusbar
     gosub ekko.statusbar.2
     gosub core.move out
     if %finesse.on = 1 then gosub spec.finesse.stop
     goto riverhaven.to.dirge
start.crossings:
     gosub rent.caravan
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go door
crossings:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place xings
     if %humming = 1 then gosub stop.hum
     gosub money.check
     if %bank.run = 1 then goto crossings.get.coin
crossings.have.coin:
     if "%thiefname" != "nil" then echo .
     if "%thiefname" != "nil" then echo . [ Accusing %thiefname For Stealing ... ]
     if "%thiefname" != "nil" then echo .
     if "%thiefname" != "nil" then gosub core.move e
     if "%thiefname" != "nil" then put accuse %thiefname
     if "%thiefname" != "nil" then Pause 0.5
     if "%thiefname" != "nil" then gosub core.move w
     if "%thiefname" != "nil" then gosub core.move out
     if "%thiefname" != "nil" then gosub core.move s
     if "%thiefname" != "nil" then gosub core.move go house
     if "%thiefname" != "nil" then put accuse %thiefname
     if "%thiefname" != "nil" then Pause 0.5
     if "%thiefname" != "nil" then gosub core.move out
     if "%thiefname" != "nil" then gosub core.move n
     if "%thiefname" != "nil" then gosub core.move go iron door
     if "%thiefname" != "nil" then gosub thief.track stolen.from.by-%thiefname
     if %commodity.toggle = 1 then gosub core.move s
     if %commodity.toggle = 1 then goto read.board
done.read.board.xings:
     gosub ekko.board
     if %commodity.toggle = 1 then echo . [ Comparing Board To Other Outposts ... ]
     if %commodity.toggle = 1 then gosub compare.commods
done.compare.commods-xings:
     if %commodity.toggle = 1 then gosub core.move n
     if %commodity.toggle = 1 then echo . [ Comparing Board To Commodities Your Carrying ... ]
     if %commodity.toggle = 1 then gosub compare.carried
     if %pay.clerk.commod = 1 then gosub pay.clerk.commod
     if %commodity.toggle = 1 then gosub ekko.statusbar
     if %interprov.to.xings > 0 then gosub turn-in.local crossing
     if %local.to.xings > 0 then gosub turn-in.local crossing
     if %local.toggle = 0 then goto local.done.xings
     if %local.from.xings = 0 then gosub ask-for.local
local.done.xings:
     if %interprov.toggle = 0 then goto interprov.done.xings
     if %interprov.toggle = 1 then gosub ask-for.interprov
interprov.done.xings:
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.xings
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move out
     if %train.vocals = 1 then gosub vocals.main
     if %auto.disband = 1 then put leave
     if "%destination" = "wc" then goto crossings.to.westgate
     if "%destination" = "tc" then goto crossings.to.westgate
westside:
     if "%destination" = "wc" then goto crossings.to.wolfclan
     if "%destination" = "tc" then goto crossings.to.tigerclan
     if "%destination" = "sc" then goto crossings.to.stoneclan
     if "%destination" = "arthe" then goto crossings.to.arthe
     if "%destination" = "dirge" then goto crossings.to.dirge
     if "%destination" = "leth" then goto crossings.to.leth
start.arthe:
     gosub rent.caravan
     gosub core.move go door
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go door
     gosub core.move go door
arthe:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place arthe
     if %humming = 1 then gosub stop.hum
     if %commodity.toggle = 1 then gosub core.move w
     if %commodity.toggle = 1 then goto read.board
done.read.board.arthe:
     gosub ekko.board
     echo . [ Comparing Commodities To Other Outposts ... ]
     if %commodity.toggle = 1 then gosub compare.commods
done.compare.commods-arthe:
     if %commodity.toggle = 1 then gosub core.move e
     echo . [ Comparing Commodities To Commodities Your Carrying ... ]
     if %commodity.toggle = 1 then gosub compare.carried
     if %pay.clerk.commod = 1 then gosub pay.clerk.commod
     if %commodity.toggle = 1 then gosub ekko.statusbar
     if %local.to.arthe > 0 then gosub turn-in.local arthe
     if %local.toggle = 0 then goto local.done.arthe
     if %local.from.arthe = 0 then gosub ask-for.local
local.done.arthe:
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.arthe
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move go door
     gosub core.move out
     if %auto.disband = 1 then put leave
     gosub feed.check
     if %train.vocals = 1 then gosub vocals.main
     if "%destination" = "xings" then goto arthe.to.crossings
     if "%destination" = "sc" then goto arthe.to.stoneclan
     if "%destination" = "dirge" then goto arthe.to.dirge
start.stone.clan:
     gosub rent.caravan
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go outpost
stone.clan:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place sc
     if %humming = 1 then gosub stop.hum
     if %local.to.sc > 0 then gosub turn-in.local stone
     setvariable local.to.sc 0
     if %local.toggle = 0 then goto local.done.sc
     if %local.from.sc = 0 then gosub ask-for.local
local.done.sc:
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.sc
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move out
     if %train.vocals = 1 then gosub vocals.main
     if %auto.disband = 1 then put leave
     if "%destination" = "xings" then goto sc.to.crossings
     if "%destination" = "arthe" then goto sc.to.arthe
     if "%destination" = "dirge" then goto sc.to.dirge
start.dirge:
     gosub rent.caravan
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go stable
dirge:
     setvariable place dirge
     if %humming = 1 then gosub stop.hum
     if %local.to.dirge > 0 then gosub turn-in.local dirge
     if %local.toggle = 0 then goto local.done.dirge
     if %local.from.dirge = 0 then gosub ask-for.local
local.done.dirge:
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.dirge
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move out
     if %train.vocals = 1 then gosub vocals.main
     if %auto.disband = 1 then put leave
     if %sneak = 1 then setvariable temp.sneak 1
     goto dirge.exit
back.from.dirge:
     setvariable place dirge
     gosub leaving.dirge
     gosub money.check
dirge.done.exit:
     gosub feed.check
     if %train.vocals = 1 then gosub vocals.main
     if "%destination" = "xings" then goto dirge.to.crossings
     if "%destination" = "arthe" then goto dirge.to.arthe
     if "%destination" = "sc" then goto dirge.to.sc
     if "%destination" = "riverhaven" then goto dirge.to.riverhaven
start.tiger.clan:
     gosub rent.caravan
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go outpost
tiger.clan:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place tc
     if %humming = 1 then gosub stop.hum
     if %local.to.tc > 0 then gosub turn-in.local tiger
     if %local.toggle = 0 then goto local.done.tc
     if %local.from.tc = 0 then gosub ask-for.local
local.done.tc:
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.tc
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move out
     if %auto.disband = 1 then put leave
     gosub feed.check
     if %train.vocals = 1 then gosub vocals.main
     goto tigerclan.exit
tigerclan.out:
     if "%destination" = "xings" then goto tc.to.crossings
     if "%destination" = "wc" then goto tc.to.wc
wc.stable:
     pause 0.5
put return caravan
     waitfor barbarian
     pause 0.5
put tell caravan to follow
     waitforre (You pass on the order|You tell your driver)
move out
     waitfor following you
move e
     waitfor following you
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go outpost
     goto wolf.clan
start.wolf.clan:
     gosub rent.caravan
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go outpost
wolf.clan:
     if %sneak = 1 then setvariable temp.sneak 1
     setvariable place wc
     if %humming = 1 then gosub stop.hum
     if %local.to.wc > 0 then gosub turn-in.local wolf
     if %local.toggle = 0 then goto local.done.wc
     if %local.from.wc = 0 then gosub ask-for.local
local.done.wc:
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.wc
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move out
     if %auto.disband = 1 then put leave
     gosub feed.check
     if %train.vocals = 1 then gosub vocals.main
     goto wolfclan.exit
wolfclan.out:
     if "%destination" = "xings" then goto wc.to.crossings
     if "%destination" = "tc" then goto wc.to.tc
start.leth:
     gosub rent.caravan
     gosub core.move out
put tell caravan to wait
     waitforre (You pass on the order|You tell your driver)
     gosub core.move go shanty
leth:
     setvariable place leth
     if %humming = 1 then gosub stop.hum
     gosub money.check
     if %bank.run = 1 then gosub leth.deposit-core
     if %sneak = 1 then setvariable temp.sneak 1
     if %commodity.toggle = 1 then gosub core.move w
     if %commodity.toggle = 1 then goto read.board
done.read.board.leth:
     gosub ekko.board
     echo . [ Comparing Commodities To Other Outposts ... ]
     pause 0.2
     if %commodity.toggle = 1 then gosub compare.commods
done.compare.commods-leth:
     if %commodity.toggle = 1 then gosub core.move e
     echo . [ Comparing Commodities To Commodities Your Carrying ... ]
     pause 0.2
     if %commodity.toggle = 1 then gosub compare.carried
     if %pay.clerk.commod = 1 then gosub pay.clerk.commod
     if %commodity.toggle = 1 then gosub ekko.statusbar
     if %local.to.leth > 0 then gosub turn-in.local leth
     if %local.toggle = 0 then goto local.done.leth
     if %local.from.leth = 0 then gosub ask-for.local
local.done.leth:
     setvariable local.to.leth 0
     gosub ekko.stats
     gosub ekko.statusbar
     gosub leaving.leth
     gosub money.check
     gosub ekko.statusbar.2
     gosub core.move out
     if %train.vocals = 1 then gosub vocals.main
     if %auto.disband = 1 then put leave
     if "%destination" = "xings" then goto leth.to.crossings
     if "%destination" = "shard" then goto leth.to.shard
thief.track:
     return
     setvariable thiefname nil
     if %$1 > 0 then goto add.thief
put #setvariable $1 1
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
     return
add.thief:
     setvariable temp.x $1
     if %front.end = 2 then setvariable temp.thief %$1
     if %front.end = 3 then setvariable temp.thief $%temp.x
     math temp.thief add 1
put #setvariable $1 %temp.thief
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
     return
leaving.arthe:
     setvariable local.to.arthe 0
     setvariable local.from.arthe 1
     setvariable destination xings
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     if %local.to.dirge > 0 then setvariable destination dirge
     if %local.from.dirge = 0 then setvariable destination dirge
     if %local.to.sc > 0 then setvariable destination sc
     if %local.from.sc = 0 then setvariable destination sc
     if %finish = 1 then gosub arthe.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
leaving.sc:
     setvariable local.to.sc 0
     setvariable local.from.sc 1
     setvariable destination xings
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     if %local.to.arthe > 0 then setvariable destination arthe
     if %local.from.arthe = 0 then setvariable destination arthe
     if %local.from.dirge = 0 then setvariable destination dirge
     if %local.to.dirge > 0 then setvariable destination dirge
     if %finish = 1 then gosub sc.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
leaving.dirge:
     setvariable local.to.dirge 0
     setvariable local.from.dirge 1
     setvariable destination xings
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     if %local.to.arthe > 0 then setvariable destination arthe
     if %local.from.arthe = 0 then setvariable destination arthe
     if %local.to.sc > 0 then setvariable destination sc
     if %local.from.sc = 0 then setvariable destination sc
     if %interprov.to.riverhaven > 0 then setvariable destination riverhaven
     if %interprov.toggle = 1 then gosub check.from.interprov %interprov.from.riverhaven riverhaven
     if %finish = 1 then gosub dirge.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
leaving.wc:
     setvariable local.to.wc 0
     setvariable local.from.wc 1
     setvariable destination xings
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     if %local.to.tc > 0 then setvariable destination tc
     if %local.from.tc = 0 then setvariable destination tc
     if %finish = 1 then gosub wc.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
leaving.tc:
     setvariable local.to.tc 0
     setvariable local.from.tc 1
     setvariable destination xings
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     if %local.to.wc > 0 then setvariable destination wc
     if %local.from.wc = 0 then setvariable destination wc
     if %finish = 1 then gosub tc.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
leaving.leth:
     setvariable local.from.leth 1
     setvariable local.to.leth 0
     setvariable destination xings
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     if %interprov.to.shard >= %shard.interprov.track then setvariable destination shard
     if %finish = 1 then gosub leth.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
leaving.xings:
     setvariable local.to.xings 0
     setvariable local.from.xings 1
     setvariable interprov.to.xings 0
     setvariable interprov.from.xings 1
     setvariable destination arthe
     if %train.vocals = 1 then gosub vocals.main
     if %finesse.on = 1 then gosub spec.finesse.stop
     gosub xings.departure
     if %local.to.leth > 1 then setvariable destination leth
     setvariable toggle.test 0
     if %local.toggle = 0 then math toggle.test add 1
     if %commodity.toggle = 0 then math toggle.test add 1
     if %toggle.test = 2 then setvariable destination dirge
     if %finish = 1 then gosub xings.finish
echo . [ Destination Set, Going From %place To %destination ! ]
     return
xings.departure:
     setvariable temp.west 0
     math temp.west add %local.to.tc
     if %local.from.tc = 0 then math temp.west add 1
     math temp.west add %local.to.wc
     if %local.from.wc = 0 then math temp.west add 1
     setvariable temp.east 0
     math temp.east add %local.to.arthe
     if %local.from.arthe = 0 then math temp.east add 1
     math temp.east add %local.to.dirge
     if %local.from.dirge = 0 then math temp.east add 1
     math temp.east add %local.to.sc
     if %local.from.sc = 0 then math temp.east add 1
     setvariable temp.south 0
     math temp.south add %local.to.leth
     math temp.south add %interprov.to.shard
     if %temp.east >= %temp.west then setvariable temp.dir %temp.east
     if %temp.east >= %temp.west then setvariable destination arthe
     if %temp.west >= %temp.east then setvariable temp.dir %temp.west
     if %temp.west >= %temp.east then setvariable destination tc
     if %temp.south >= %temp.dir then setvariable temp.dir %temp.south
     if %temp.south >= %temp.dir then setvariable destination leth
     if "%destination" = "arthe" then gosub xings.departure.arthe
     if "%destination" = "sc" then gosub xings.departure.sc
     if "%destination" = "dirge" then gosub xings.departure.dirge
     if "%destination" = "tc" then gosub xings.departure.tc
     if "%destination" = "wc" then gosub xings.departure.wc
     return
xings.departure.arthe:
     counter set 0
     if %local.to.arthe = 0 then counter add 1
     if %local.from.arthe > 0 then counter add 1
     if %c = 2 then setvariable destination sc
     return
xings.departure.sc:
     counter set 0
     if %local.to.sc = 0 then counter add 1
     if %local.from.sc > 0 then counter add 1
     if %c = 2 then setvariable destination dirge
     return
xings.departure.dirge:
     counter set 0
     if %local.to.dirge = 0 then counter add 1
     if %local.from.dirge > 0 then counter add 1
     if %c = 2 then setvariable destination tc
     return
xings.departure.tc:
     counter set 0
     if %local.to.tc = 0 then counter add 1
     if %local.from.tc > 0 then counter add 1
     if %c = 2 then setvariable destination wc
     return
xings.departure.wc:
     counter set 0
     if %local.to.wc = 0 then counter add 1
     if %local.from.wc > 0 then counter add 1
     if %c = 2 then setvariable destination arthe
     return
finish.test:
     setvariable temp.1 0
     math temp.1 add %local.to.arthe
     math temp.1 add %local.to.dirge
     math temp.1 add %local.to.xings
     math temp.1 add %local.to.sc
     math temp.1 add %local.to.wc
     math temp.1 add %local.to.leth
     math temp.1 add %local.to.tc
     math temp.1 add %interprov.to.xings
     math temp.1 add %interprov.to.riverhaven
     math temp.1 add %interprov.to.shard
     if %temp.1 = 0 then action remove (Connection closed. \[|Connection lost. \[)
     if %temp.1 = 0 then put quit
     if %temp.1 = 0 then exit
     return
turn-in.interprov:
     setvariable type $1
     goto get.my.interprov
get.my.interprov.p:
     pause 0.5
get.my.interprov:
put get my %type contract
     matchre get.my.interprov.p (type ahead|wait *\d+)
     matchre give.my.interprov (You get|already holding)
     matchre get.my.interprov.d (could not find|What were you)
     matchwait
get.my.interprov.d:
     gosub set.delivery %place
     return
give.my.interprov.p:
     pause 0.5
give.my.interprov:
put give clerk
     matchre give.my.interprov.p (type ahead|wait *\d+)
     matchre give.my.interprov.d handing you your payment of (\d+) (Dokora|Lirum|Kronar)
     matchre give.my.interprov.b (Nope, not for us|sure this is the right|shipment clerk shakes his head and)
     matchre give.my.interprov.s (clerk ignores your offer|The shipping clerk ignores)
     match get.my.interprov.a What is it you
     matchwait
give.my.interprov.d:
     setvariable coin.1 $1
     if "$2" = "Dokora" then math coin.1 multiply 1.385
     if "$2" = "Lirum" then math coin.1 multiply 1.25
     math real.profit add %coin.1
     gosub set.up.profit %coin.1
     math total.contracts.interprov add 1
     gosub set.up.interprov
     gosub ekko.statusbar
     goto get.my.interprov
give.my.interprov.b:
     math total.contracts.interprov add 1
     gosub set.up.interprov
put drop %type contract
     pause 0.5
     goto get.my.interprov
give.my.interprov.s:
put stow left
     pause 0.5
put stow right
     pause 0.5
     goto get.my.interprov
ask-for.interprov:
     if %finish = 1 then return
     if %interprov.toggle = 0 then return
     if "%place" = "xings" then gosub core.move n
     if "%place" = "shard" then gosub core.move e
     if "%place" = "shard" then gosub core.move go ivory door
     if "%place" = "riverhaven" then gosub core.move go step
     if "%place" = "riverhaven" then gosub core.move out
     if "%place" = "riverhaven" then gosub core.move e
     goto ask.broker
ask.broker.p:
     pause 0.5
ask.broker:
     gosub spec.finesse
put ask broker for contract
     matchre ask.broker.p (type ahead|wait *\d+)
     match pay.clerk.pre.interprov reminds you that you still owe
     match ask-for.interprov.s still have another contract we issued
     matchre ask.broker.d for a total of (\d+)
     matchwait
pay.clerk.pre.interprov:
     if "%place" = "shard" then gosub core.move out
     if "%place" = "shard" then gosub core.move w
     if "%place" = "xings" then gosub core.move s
     if "%place" = "riverhaven" then gosub core.move w
     if "%place" = "riverhaven" then gosub core.move go gate
     if "%place" = "riverhaven" then gosub core.move go step
     goto pay.clerk.pre.interprov.a
pay.clerk.pre.interprov.p:
     pause 0.5
pay.clerk.pre.interprov.a:
put pay clerk
     matchre pay.clerk.pre.interprov.p (type ahead|wait *\d+)
     matchre pay.clerk.pre.interprov.d (You count out some|do not owe|The clerk scowls)
     matchwait
pay.clerk.pre.interprov.d:
     if "%place" = "xings" then gosub core.move n
     if "%place" = "shard" then gosub core.move e
     if "%place" = "shard" then gosub core.move go ivory door
     if "%place" = "riverhaven" then gosub core.move go step
     if "%place" = "riverhaven" then gosub core.move out
     if "%place" = "riverhaven" then gosub core.move e
     goto ask.broker
ask-for.interprov.d:
ask-for.interprov.s:
     if "%place" = "xings" then gosub core.move s
     if "%place" = "shard" then gosub core.move out
     if "%place" = "shard" then gosub core.move w
     if "%place" = "riverhaven" then gosub core.move w
     if "%place" = "riverhaven" then gosub core.move go gate
     if "%place" = "riverhaven" then gosub core.move go step
     return
set.from.interprov:
     setvariable interprov.from.$1 1
     return
ask.broker.d:
     setvariable coin.1 $1
     if "%place" = "shard" then math coin.1 multiply 1.385
     if "%place" = "riverhaven" then math coin.1 multiply 1.25
     math real.profit subtract %coin.1
     gosub set.down.profit %coin.1
     if "%place" = "shard" then gosub core.move out
     if "%place" = "shard" then gosub core.move w
     if "%place" = "xings" then gosub core.move s
     if "%place" = "riverhaven" then gosub core.move w
     if "%place" = "riverhaven" then gosub core.move go gate
     if "%place" = "riverhaven" then gosub core.move go step
     gosub give.clerk.pre
     gosub pay.clerk
     pause 0.2
     if "$righthand" = "Crossing contract" then math interprov.to.xings add 1
     if "$righthand" = "Crossings contract" then math interprov.to.xings add 1
     if "%rhand" = "Crossings contract" then math interprov.to.xings add 1
     if "%rhand" = "Crossing contract" then math interprov.to.xings add 1
     if "%rhand" = "Shard contract" then math interprov.to.shard add 1
     if "$righthand" = "Shard contract" then math interprov.to.shard add 1
     if "%rhand" = "RiverHaven contract" then math interprov.to.riverhaven add 1
     if "$righthand" = "RiverHaven contract" then math interprov.to.riverhaven add 1
     if "$righthand" = "Riverhaven contract" then math interprov.to.riverhaven add 1
     if "%place" = "xings" then gosub set.rhand xings
     if "%place" = "riverhaven" then gosub set.rhand riverhaven
     if "%place" = "shard" then gosub set.rhand shard
     gosub set.from.interprov %place
     pause 0.2
put stow contract in my %stow.place
     waitforre (You put|STOW HELP)
     return
set.rhand:
     if "$righthand" = "RiverHaven contract" then setvariable $1.interprov.destined.for riverhaven
     if "$righthand" = "Riverhaven contract" then setvariable $1.interprov.destined.for riverhaven
     if "$righthand" = "Shard contract" then setvariable $1.interprov.destined.for shard
     if "$righthand" = "Crossing contract" then setvariable $1.destined.for xings
     if "$righthand" = "RiverHaven contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "$righthand" = "Riverhaven contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "$righthand" = "Shard contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "$righthand" = "Crossing contract" then put #statusbar 1 [ Set : From %place Destined For %$1.destined.for
     if "%rhand" = "RiverHaven contract" then setvariable $1.interprov.destined.for riverhaven
     if "%rhand" = "Riverhaven contract" then setvariable $1.interprov.destined.for riverhaven
     if "%rhand" = "Shard contract" then setvariable $1.interprov.destined.for shard
     if "%rhand" = "Crossing contract" then setvariable $1.destined.for xings
     if "%rhand" = "RiverHaven contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "%rhand" = "Shard contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "%rhand" = "Crossing contract" then put #statusbar 1 [ Set : From %place Destined For %$1.destined.for
     pause 0.2
put #statusbar 1 [
     pause 0.05
     if "%rhand" = "RiverHaven contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "%rhand" = "Shard contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "%rhand" = "Crossing contract" then put #statusbar 1 [ Set : From %place Destined For %$1.destined.for

     if "$righthand" = "RiverHaven contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "$righthand" = "Shard contract" then put #statusbar 1 [ Set : From %place Destined For %$1.interprov.destined.for
     if "$righthand" = "Crossing contract" then put #statusbar 1 [ Set : From %place Destined For %$1.destined.for
     pause 0.2
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
ask-for.local:
     if %finish = 1 then return
     if %local.toggle = 0 then return
     if "%place" = "xings" then gosub core.move e
     if "%place" = "dirge" then gosub core.move climb stair
     goto ask.minister
ask.minister.p:
     pause 0.5
ask.minister:
     gosub spec.finesse
put ask minister for contract
     matchre ask.minister.p (type ahead|wait *\d+)
     match pay.clerk.pre minister reminds you that you still owe
     match ask-for.local.s still have another contract we issued
     matchre ask.minister.d for a total of (\d+)
     matchwait
pay.clerk.pre:
     if "%place" = "xings" then gosub core.move w
     if "%place" = "dirge" then gosub core.move climb stair
     goto pay.clerk.pre.a
pay.clerk.pre.p:
     pause 0.5
pay.clerk.pre.a:
put pay clerk
     matchre pay.clerk.pre.p (type ahead|wait *\d+)
     matchre pay.clerk.pre.d (You count out some|do not owe|The clerk scowls)
     matchwait
pay.clerk.pre.d:
     if "%place" = "xings" then gosub core.move e
     if "%place" = "dirge" then gosub core.move climb stair
     goto ask.minister
ask-for.local.s:
     gosub set.from.local %place
ask-for.local.d:
     if "%place" = "xings" then gosub core.move w
     if "%place" = "dirge" then gosub core.move climb stair
     return
set.from.local:
     setvariable local.from.$1 1
     return
ask.minister.d:
     setvariable temp.1 $1
     math real.profit subtract %temp.1
     gosub set.down.profit %temp.1
     if "%place" = "xings" then gosub core.move w
     if "%place" = "dirge" then gosub core.move climb stair
     gosub give.clerk.pre
     gosub pay.clerk
     if %train.vocals = 1 then gosub vocals.main
     pause 0.5
     if "%rhand" = "Crossings contract" then math local.to.xings add 1
     if "%rhand" = "Crossing contract" then math local.to.xings add 1
     if "%rhand" = "Dirge contract" then math local.to.dirge add 1
     if "%rhand" = "Arthe Dale contract" then math local.to.arthe add 1
     if "%rhand" = "Stone Clan contract" then math local.to.sc add 1
     if "%rhand" = "Wolf Clan contract" then math local.to.wc add 1
     if "%rhand" = "Tiger Clan contract" then math local.to.tc add 1
     if "%rhand" = "Leth Deriel contract" then math local.to.leth add 1

     if "$righthand" = "Crossings contract" then math local.to.xings add 1
     if "$righthand" = "Crossing contract" then math local.to.xings add 1
     if "$righthand" = "Dirge contract" then math local.to.dirge add 1
     if "$righthand" = "Arthe Dale contract" then math local.to.arthe add 1
     if "$righthand" = "Stone Clan contract" then math local.to.sc add 1
     if "$righthand" = "Wolf Clan contract" then math local.to.wc add 1
     if "$righthand" = "Tiger Clan contract" then math local.to.tc add 1
     if "$righthand" = "Leth Deriel contract" then math local.to.leth add 1
     gosub check.delivery %place
     gosub set.from.local %place
     pause 0.2
put stow contract in my %stow.place
     waitforre (You put|STOW HELP)
     return
check.delivery:
     if "%rhand" = "Arthe Dale contract" then setvariable $1.destined.for arthe
     if "%rhand" = "Dirge contract" then setvariable $1.destined.for dirge
     if "%rhand" = "Stone Clan contract" then setvariable $1.destined.for sc
     if "%rhand" = "Tiger Clan contract" then setvariable $1.destined.for tc
     if "%rhand" = "Wolf Clan contract" then setvariable $1.destined.for wc
     if "%rhand" = "Leth Deriel contract" then setvariable $1.destined.for leth
     if "%rhand" = "Crossing contract" then setvariable $1.destined.for xings
     if "%rhand" = "Crossings contract" then setvariable $1.destined.for xings

     if "$righthand" = "Arthe Dale contract" then setvariable $1.destined.for arthe
     if "$righthand" = "Dirge contract" then setvariable $1.destined.for dirge
     if "$righthand" = "Stone Clan contract" then setvariable $1.destined.for sc
     if "$righthand" = "Tiger Clan contract" then setvariable $1.destined.for tc
     if "$righthand" = "Wolf Clan contract" then setvariable $1.destined.for wc
     if "$righthand" = "Leth Deriel contract" then setvariable $1.destined.for leth
     if "$righthand" = "Crossing contract" then setvariable $1.destined.for xings
     if "$righthand" = "Crossings contract" then setvariable $1.destined.for xings
     pause 0.05
put #statusbar 1 [ Set : From %place Destined For %$1.destined.for
     pause 0.05
put #statusbar 1 [
     pause 0.05
put #statusbar 1 [ Set : From %place Destined For %$1.destined.for
     pause 0.05
put #statusbar 1 [
     pause 0.05
put #statusbar 1 [ Set : From %place Destined For %$1.destined.for
     pause 0.05
put #statusbar 1 [
     pause 0.05
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
give.clerk.pre.p:
     pause 0.5
give.clerk.pre:
put give clerk
     matchre give.clerk.pre.p (type ahead|wait *\d+)
     matchre give.clerk.pre.d (The shipment clerk accepts your contract|for transportation additions)
     matchwait
give.clerk.pre.d:
     return
pay.clerk.p:
     pause 0.5
pay.clerk:
put pay clerk
     matchre pay.clerk.p (type ahead|wait *\d+)
     matchre pay.clerk.d (You count out some|do not owe|The clerk scowls)
     matchwait
pay.clerk.d:
     return
turn-in.local:
     setvariable type $1
     goto get.my.local
get.my.local.p:
     pause 0.5
get.my.local:
put get my %type contract
     matchre get.my.local.p (type ahead|wait *\d+)
     matchre give.my.local (You get|already holding)
     matchre get.my.local.d (could not find|What were you)
     matchwait
get.my.local.d:
     gosub set.delivery %place
     return
set.delivery:
     if "%xings.destined.for" = "%place" then setvariable local.from.xings 0
     if "%xings.destined.for" = "%place" then setvariable xings.destined.for nil
     if "%arthe.destined.for" = "%place" then setvariable local.from.arthe 0
     if "%arthe.destined.for" = "%place" then setvariable arthe.destined.for nil
     if "%dirge.destined.for" = "%place" then setvariable local.from.dirge 0
     if "%dirge.destined.for" = "%place" then setvariable dirge.destined.for nil
     if "%sc.destined.for" = "%place" then setvariable local.from.sc 0
     if "%sc.destined.for" = "%place" then setvariable sc.destined.for nil
     if "%tc.destined.for" = "%place" then setvariable local.from.tc 0
     if "%tc.destined.for" = "%place" then setvariable tc.destined.for nil
     if "%wc.destined.for" = "%place" then setvariable local.from.wc 0
     if "%wc.destined.for" = "%place" then setvariable wc.destined.for nil
     if "%leth.destined.for" = "%place" then setvariable local.from.leth 0
     if "%leth.destined.for" = "%place" then setvariable leth.destined.for nil
     if "%riverhaven.destined.for" = "%place" then setvariable interprov.from.riverhaven 0
     if "%riverhaven.destined.for" = "%place" then setvariable riverhaven.destined.for nil
     if "%shard.destined.for" = "%place" then setvariable interprov.from.shard 0
     if "%shard.destined.for" = "%place" then setvariable shard.destined.for nil
     if "%xings.interprov.destined.for" = "%place" then setvariable interprov.from.xings 0
     if "%xings.interprov.destined.for" = "%place" then setvariable xings.interprov.destined.for nil
     pause 0.2
     return
give.my.local.p:
     pause 0.5
give.my.local:
put give clerk
     matchre give.my.local.p (type ahead|wait *\d+)
     matchre give.my.local.d handing you your payment of (\d+)
     match give.my.local.expired disgust he orders his assistants to toss the crate
     matchre give.my.local.b (Nope, not for us|sure this is the right|shipment clerk shakes his head and)
     matchre give.my.local.s (clerk ignores your offer|The shipping clerk ignores)
     match get.my.local.a What is it you
     matchwait
give.my.local.d:
     setvariable temp.1 $1
     math real.profit add %temp.1
     gosub set.up.profit %temp.1
give.my.local.expired:
     math total.contracts.local add 1
     gosub set.up.local
     gosub give.my.local.%place
     gosub ekko.statusbar
     goto get.my.local
give.my.local.xings:
     if %interprov.to.xings > 0 then math total.contracts.local subtract 1
     if %interprov.to.xings > 0 then math total.contracts.interprov add 1
     if %interprov.to.xings > 0 then gosub set.up.interprov
     if %interprov.to.xings > 0 then math interprov.to.xings subtract 1
     if %local.to.xings > 0 then math local.to.xings subtract 1
     return
give.my.local.sc:
give.my.local.wc:
give.my.local.tc:
give.my.local.leth:
give.my.local.dirge:
give.my.local.arthe:
     gosub give.my.local.set %place
     return
give.my.local.set:
     if %local.to.$1 > 0 then math local.to.$1 subtract 1
     return
give.my.local.b:
     math total.contracts.local add 1
     gosub set.up.local
put drop %type contract
     pause 0.5
     goto get.my.local
give.my.local.s:
put stow left
     pause 0.5
put stow right
     pause 0.5
     goto get.my.local
setup.outposts:
     setvariable commodity.track 0
     setvariable carried.diamonds 0
     setvariable carried.gold 0
     setvariable carried.ironore 0
     setvariable carried.amber 0
     setvariable carried.cinnamon 0
     setvariable carried.slate 0
     setvariable carried.lead 0
     setvariable carried.bronze 0
     setvariable carried.cotton 0
     setvariable carried.velvet 0
     setvariable carried.deobaroil 0
     setvariable carried.salt 0
     setvariable carried.purpledye 0
     setvariable carried.wheat 0
     setvariable carried.corn 0
     setvariable carried.taffelberries 0
     setvariable carried.pearls 0
     setvariable carried.silver 0
     setvariable carried.charcoal 0
     setvariable carried.saffron 0
     setvariable carried.papyrus 0
     setvariable carried.limes 0
     setvariable carried.brass 0
     setvariable carried.copper 0
     setvariable carried.silk 0
     setvariable carried.wool 0
     setvariable carried.lace 0
     setvariable carried.myrrh 0
     setvariable carried.indigo 0
     setvariable carried.barley 0
     setvariable carried.oats 0
     setvariable carried.acanth 0
     setvariable carried.apples 0
     setvariable carried.oranges 0
     setvariable sell.diamonds 0
     setvariable sell.gold 0
     setvariable sell.ironore 0
     setvariable sell.amber 0
     setvariable sell.cinnamon 0
     setvariable sell.slate 0
     setvariable sell.lead 0
     setvariable sell.bronze 0
     setvariable sell.cotton 0
     setvariable sell.velvet 0
     setvariable sell.deobaroil 0
     setvariable sell.salt 0
     setvariable sell.purpledye 0
     setvariable sell.wheat 0
     setvariable sell.corn 0
     setvariable sell.taffelberries 0
     setvariable sell.pearls 0
     setvariable sell.silver 0
     setvariable sell.charcoal 0
     setvariable sell.saffron 0
     setvariable sell.papyrus 0
     setvariable sell.limes 0
     setvariable sell.brass 0
     setvariable sell.copper 0
     setvariable sell.silk 0
     setvariable sell.wool 0
     setvariable sell.lace 0
     setvariable sell.myrrh 0
     setvariable sell.indigo 0
     setvariable sell.barley 0
     setvariable sell.oats 0
     setvariable sell.acanth 0
     setvariable sell.apples 0
     setvariable sell.oranges 0
     setvariable buy.diamonds 0
     setvariable buy.gold 0
     setvariable buy.ironore 0
     setvariable buy.amber 0
     setvariable buy.cinnamon 0
     setvariable buy.slate 0
     setvariable buy.lead 0
     setvariable buy.bronze 0
     setvariable buy.cotton 0
     setvariable buy.velvet 0
     setvariable buy.deobaroil 0
     setvariable buy.salt 0
     setvariable buy.purpledye 0
     setvariable buy.wheat 0
     setvariable buy.corn 0
     setvariable buy.taffelberries 0
     setvariable buy.pearls 0
     setvariable buy.silver 0
     setvariable buy.charcoal 0
     setvariable buy.saffron 0
     setvariable buy.papyrus 0
     setvariable buy.limes 0
     setvariable buy.brass 0
     setvariable buy.copper 0
     setvariable buy.silk 0
     setvariable buy.wool 0
     setvariable buy.lace 0
     setvariable buy.myrrh 0
     setvariable buy.indigo 0
     setvariable buy.barley 0
     setvariable buy.oats 0
     setvariable buy.acanth 0
     setvariable buy.apples 0
     setvariable buy.oranges 0
     setvariable local.to.arthe 0
     setvariable local.from.arthe 0
     setvariable local.to.xings 0
     setvariable local.from.xings 0
     setvariable local.to.leth 0
     setvariable local.from.leth 0
     echo . [ Setting Up Leth                ... ]
     
     setvariable leth.price.diamonds 0
     setvariable leth.supply.diamonds 0
     setvariable leth.price.gold 0
     setvariable leth.supply.gold 0
     setvariable leth.price.ironore 0
     setvariable leth.supply.ironore 0
     setvariable leth.price.amber 0
     setvariable leth.supply.amber 0
     setvariable leth.price.cinnamon 0
     setvariable leth.supply.cinnamon 0
     setvariable leth.price.oranges 0
     setvariable leth.supply.oranges 0
     setvariable leth.price.slate 0
     setvariable leth.supply.slate 0
     setvariable leth.price.lead 0
     setvariable leth.supply.lead 0
     setvariable leth.price.bronze 0
     setvariable leth.supply.bronze 0
     setvariable leth.price.cotton 0
     setvariable leth.supply.cotton 0
     setvariable leth.price.velvet 0
     setvariable leth.supply.velvet 0
     setvariable leth.price.deobaroil 0
     setvariable leth.supply.deobaroil 0
     setvariable leth.price.salt 0
     setvariable leth.supply.salt 0
     setvariable leth.price.purpledye 0
     setvariable leth.supply.purpledye 0
     setvariable leth.price.wheat 0
     setvariable leth.supply.wheat 0
     setvariable leth.price.corn 0
     setvariable leth.supply.corn 0
     setvariable leth.price.taffelberries 0
     setvariable leth.supply.taffelberries 0
     setvariable leth.price.pearls 0
     setvariable leth.supply.pearls 0
     setvariable leth.price.silver 0
     setvariable leth.supply.silver 0
     setvariable leth.price.charcoal 0
     setvariable leth.supply.charcoal 0
     setvariable leth.price.saffron 0
     setvariable leth.supply.saffron 0
     setvariable leth.price.papyrus 0
     setvariable leth.supply.papyrus 0
     setvariable leth.price.limes 0
     setvariable leth.supply.limes 0
     setvariable leth.price.brass 0
     setvariable leth.supply.brass 0
     setvariable leth.price.copper 0
     setvariable leth.supply.copper 0
     setvariable leth.price.silk 0
     setvariable leth.supply.silk 0
     setvariable leth.price.wool 0
     setvariable leth.supply.wool 0
     setvariable leth.price.lace 0
     setvariable leth.supply.lace 0
     setvariable leth.price.myrrh 0
     setvariable leth.supply.myrrh 0
     setvariable leth.price.indigo 0
     setvariable leth.supply.indigo 0
     setvariable leth.price.barley 0
     setvariable leth.supply.barley 0
     setvariable leth.price.oats 0
     setvariable leth.supply.oats 0
     setvariable leth.price.acanth 0
     setvariable leth.supply.acanth 0
     setvariable leth.price.apples 0
     setvariable leth.supply.apples 0
     echo . [ Setting Up Arthe Dale          ... ]
     
     setvariable arthe.price.diamonds 0
     setvariable arthe.supply.diamonds 0
     setvariable arthe.price.gold 0
     setvariable arthe.supply.gold 0
     setvariable arthe.price.ironore 0
     setvariable arthe.supply.ironore 0
     setvariable arthe.price.amber 0
     setvariable arthe.supply.amber 0
     setvariable arthe.price.cinnamon 0
     setvariable arthe.supply.cinnamon 0
     setvariable arthe.price.oranges 0
     setvariable arthe.supply.oranges 0
     setvariable arthe.price.slate 0
     setvariable arthe.supply.slate 0
     setvariable arthe.price.lead 0
     setvariable arthe.supply.lead 0
     setvariable arthe.price.bronze 0
     setvariable arthe.supply.bronze 0
     setvariable arthe.price.cotton 0
     setvariable arthe.supply.cotton 0
     setvariable arthe.price.velvet 0
     setvariable arthe.supply.velvet 0
     setvariable arthe.price.deobaroil 0
     setvariable arthe.supply.deobaroil 0
     setvariable arthe.price.salt 0
     setvariable arthe.supply.salt 0
     setvariable arthe.price.purpledye 0
     setvariable arthe.supply.purpledye 0
     setvariable arthe.price.wheat 0
     setvariable arthe.supply.wheat 0
     setvariable arthe.price.corn 0
     setvariable arthe.supply.corn 0
     setvariable arthe.price.taffelberries 0
     setvariable arthe.supply.taffelberries 0
     setvariable arthe.price.pearls 0
     setvariable arthe.supply.pearls 0
     setvariable arthe.price.silver 0
     setvariable arthe.supply.silver 0
     setvariable arthe.price.charcoal 0
     setvariable arthe.supply.charcoal 0
     setvariable arthe.price.saffron 0
     setvariable arthe.supply.saffron 0
     setvariable arthe.price.papyrus 0
     setvariable arthe.supply.papyrus 0
     setvariable arthe.price.limes 0
     setvariable arthe.supply.limes 0
     setvariable arthe.price.brass 0
     setvariable arthe.supply.brass 0
     setvariable arthe.price.copper 0
     setvariable arthe.supply.copper 0
     setvariable arthe.price.silk 0
     setvariable arthe.supply.silk 0
     setvariable arthe.price.wool 0
     setvariable arthe.supply.wool 0
     setvariable arthe.price.lace 0
     setvariable arthe.supply.lace 0
     setvariable arthe.price.myrrh 0
     setvariable arthe.supply.myrrh 0
     setvariable arthe.price.indigo 0
     setvariable arthe.supply.indigo 0
     setvariable arthe.price.barley 0
     setvariable arthe.supply.barley 0
     setvariable arthe.price.oats 0
     setvariable arthe.supply.oats 0
     setvariable arthe.price.acanth 0
     setvariable arthe.supply.acanth 0
     setvariable arthe.price.apples 0
     setvariable arthe.supply.apples 0
     echo . [ Setting Up Crossings           ... ]
     
     setvariable xings.price.diamonds 0
     setvariable xings.supply.diamonds 0
     setvariable xings.price.gold 0
     setvariable xings.supply.gold 0
     setvariable xings.price.ironore 0
     setvariable xings.supply.ironore 0
     setvariable xings.price.amber 0
     setvariable xings.supply.amber 0
     setvariable xings.price.cinnamon 0
     setvariable xings.supply.cinnamon 0
     setvariable xings.price.oranges 0
     setvariable xings.supply.oranges 0
     setvariable xings.price.slate 0
     setvariable xings.supply.slate 0
     setvariable xings.price.lead 0
     setvariable xings.supply.lead 0
     setvariable xings.price.bronze 0
     setvariable xings.supply.bronze 0
     setvariable xings.price.cotton 0
     setvariable xings.supply.cotton 0
     setvariable xings.price.velvet 0
     setvariable xings.supply.velvet 0
     setvariable xings.price.deobaroil 0
     setvariable xings.supply.deobaroil 0
     setvariable xings.price.salt 0
     setvariable xings.supply.salt 0
     setvariable xings.price.purpledye 0
     setvariable xings.supply.purpledye 0
     setvariable xings.price.wheat 0
     setvariable xings.supply.wheat 0
     setvariable xings.price.corn 0
     setvariable xings.supply.corn 0
     setvariable xings.price.taffelberries 0
     setvariable xings.supply.taffelberries 0
     setvariable xings.price.pearls 0
     setvariable xings.supply.pearls 0
     setvariable xings.price.silver 0
     setvariable xings.supply.silver 0
     setvariable xings.price.charcoal 0
     setvariable xings.supply.charcoal 0
     setvariable xings.price.saffron 0
     setvariable xings.supply.saffron 0
     setvariable xings.price.papyrus 0
     setvariable xings.supply.papyrus 0
     setvariable xings.price.limes 0
     setvariable xings.supply.limes 0
     setvariable xings.price.brass 0
     setvariable xings.supply.brass 0
     setvariable xings.price.copper 0
     setvariable xings.supply.copper 0
     setvariable xings.price.silk 0
     setvariable xings.supply.silk 0
     setvariable xings.price.wool 0
     setvariable xings.supply.wool 0
     setvariable xings.price.lace 0
     setvariable xings.supply.lace 0
     setvariable xings.price.myrrh 0
     setvariable xings.supply.myrrh 0
     setvariable xings.price.indigo 0
     setvariable xings.supply.indigo 0
     setvariable xings.price.barley 0
     setvariable xings.supply.barley 0
     setvariable xings.price.oats 0
     setvariable xings.supply.oats 0
     setvariable xings.price.acanth 0
     setvariable xings.supply.acanth 0
     setvariable xings.price.apples 0
     setvariable xings.supply.apples 0
     echo . [ Setting Up Dirge               ... ]
     
     setvariable local.to.dirge 0
     setvariable local.from.dirge 0
     echo . [ Setting Up Stone Clan          ... ]
     
     setvariable local.to.sc 0
     setvariable local.from.sc 0
     echo . [ Setting Up Wolf Clan           ... ]
     
     setvariable local.to.wc 0
     setvariable local.from.wc 0
     echo . [ Setting Up Tiger Clan          ... ]
     
     setvariable local.to.tc 0
     setvariable local.from.tc 0
     echo . [ Setting Up Other Data          ... ]
    
     setvariable inteprov.to.xings 0
     setvariable interprov.from.xings 0
     setvariable inteprov.to.shard 0
     setvariable interprov.from.shard 0
     setvariable inteprov.to.riverhaven 0
     setvariable interprov.from.riverhaven 0
     return
compare.carried:
     pause 0.2
     gosub compare.carried.price %place
     if %sell.diamonds > 0 then gosub sell.commodity diamonds
     if %sell.gold > 0 then gosub sell.commodity gold
     if %sell.ironore > 0 then gosub sell.commodity ironore
     if %sell.amber > 0 then gosub sell.commodity amber
     if %sell.cinnamon > 0 then gosub sell.commodity cinnamon
     if %sell.slate > 0 then gosub sell.commodity slate
     if %sell.lead > 0 then gosub sell.commodity lead
     if %sell.bronze > 0 then gosub sell.commodity bronze
     if %sell.cotton > 0 then gosub sell.commodity cotton
     if %sell.velvet > 0 then gosub sell.commodity velvet
     if %sell.deobaroil > 0 then gosub sell.commodity deobaroil
     if %sell.salt > 0 then gosub sell.commodity salt
     if %sell.purpledye > 0 then gosub sell.commodity purpledye
     if %sell.wheat > 0 then gosub sell.commodity wheat
     if %sell.corn > 0 then gosub sell.commodity corn
     if %sell.taffelberries > 0 then gosub sell.commodity taffelberries
     if %sell.pearls > 0 then gosub sell.commodity pearls
     if %sell.silver > 0 then gosub sell.commodity silver
     if %sell.charcoal > 0 then gosub sell.commodity charcoal
     if %sell.saffron > 0 then gosub sell.commodity saffron
     if %sell.papyrus > 0 then gosub sell.commodity papyrus
     if %sell.limes > 0 then gosub sell.commodity limes
     if %sell.brass > 0 then gosub sell.commodity brass
     if %sell.copper > 0 then gosub sell.commodity copper
     if %sell.silk > 0 then gosub sell.commodity silk
     if %sell.wool > 0 then gosub sell.commodity wool
     if %sell.lace > 0 then gosub sell.commodity lace
     if %sell.myrrh > 0 then gosub sell.commodity myrrh
     if %sell.indigo > 0 then gosub sell.commodity indigo
     if %sell.barley > 0 then gosub sell.commodity barley
     if %sell.oats > 0 then gosub sell.commodity oats
     if %sell.acanth > 0 then gosub sell.commodity acanth
     if %sell.apples > 0 then gosub sell.commodity apples
     if %sell.oranges > 0 then gosub sell.commodity oranges
     setvariable sell.diamonds 0
     setvariable sell.gold 0
     setvariable sell.ironore 0
     setvariable sell.amber 0
     setvariable sell.cinnamon 0
     setvariable sell.slate 0
     setvariable sell.lead 0
     setvariable sell.bronze 0
     setvariable sell.cotton 0
     setvariable sell.velvet 0
     setvariable sell.deobaroil 0
     setvariable sell.salt 0
     setvariable sell.purpledye 0
     setvariable sell.wheat 0
     setvariable sell.corn 0
     setvariable sell.taffelberries 0
     setvariable sell.pearls 0
     setvariable sell.silver 0
     setvariable sell.charcoal 0
     setvariable sell.saffron 0
     setvariable sell.papyrus 0
     setvariable sell.limes 0
     setvariable sell.brass 0
     setvariable sell.copper 0
     setvariable sell.silk 0
     setvariable sell.wool 0
     setvariable sell.lace 0
     setvariable sell.myrrh 0
     setvariable sell.indigo 0
     setvariable sell.barley 0
     setvariable sell.oats 0
     setvariable sell.acanth 0
     setvariable sell.apples 0
     setvariable sell.oranges 0
     return
check.carried.value:
     if %carried.$2 < %$1.price.$2 then setvariable sell.$2 1
     return
compare.carried.price:
     put #statusbar 1 [ Comparing Current Stock  (=      ) ]
     if %carried.diamonds > 0 then gosub check.carried.value $1 diamonds
     if %carried.gold > 0 then gosub check.carried.value $1 gold
     if %carried.ironore > 0 then gosub check.carried.value $1 ironore
     if %carried.amber > 0 then gosub check.carried.value $1 amber
     if %carried.cinnamon > 0 then gosub check.carried.value $1 cinnamon
     put #statusbar 1 [ Comparing Current Stock  (==     ) ]
     if %carried.oranges > 0 then gosub check.carried.value $1 oranges
     if %carried.slate > 0 then gosub check.carried.value $1 slate
     if %carried.lead > 0 then gosub check.carried.value $1 lead
     if %carried.bronze > 0 then gosub check.carried.value $1 bronze
     if %carried.cotton > 0 then gosub check.carried.value $1 cotton
     put #statusbar 1 [ Comparing Current Stock  (===    ) ]
     if %carried.velvet > 0 then gosub check.carried.value $1 velvet
     if %carried.deobaroil > 0 then gosub check.carried.value $1 deobaroil
     if %carried.salt > 0 then gosub check.carried.value $1 salt
     if %carried.purpledye > 0 then gosub check.carried.value $1 purpledye
     if %carried.wheat > 0 then gosub check.carried.value $1 wheat
     put #statusbar 1 [ Comparing Current Stock  (====   ) ]
     if %carried.corn > 0 then gosub check.carried.value $1 corn
     if %carried.taffelberries > 0 then gosub check.carried.value $1 taffelberries
     if %carried.pearls > 0 then gosub check.carried.value $1 pearls
     if %carried.silver > 0 then gosub check.carried.value $1 silver
     if %carried.charcoal > 0 then gosub check.carried.value $1 charcoal
     put #statusbar 1 [ Comparing Current Stock  (=====  ) ]
     if %carried.saffron > 0 then gosub check.carried.value $1 saffron
     if %carried.papyrus > 0 then gosub check.carried.value $1 papyrus
     if %carried.limes > 0 then gosub check.carried.value $1 limes
     if %carried.brass > 0 then gosub check.carried.value $1 brass
     if %carried.copper > 0 then gosub check.carried.value $1 copper
     put #statusbar 1 [ Comparing Current Stock  (====== ) ]
     if %carried.silk > 0 then gosub check.carried.value $1 silk
     if %carried.wool > 0 then gosub check.carried.value $1 wool
     if %carried.lace > 0 then gosub check.carried.value $1 lace
     if %carried.myrrh > 0 then gosub check.carried.value $1 myrrh
     if %carried.indigo > 0 then gosub check.carried.value $1 indigo
     if %carried.barley > 0 then gosub check.carried.value $1 barley
     if %carried.oats > 0 then gosub check.carried.value $1 oats
     if %carried.acanth > 0 then gosub check.carried.value $1 acanth
     if %carried.apples > 0 then gosub check.carried.value $1 apples
     put #statusbar 1 [ Comparing Current Stock  (=======) ] COMPLETE
     pause 0.2
     return
unit.ekko:
     echo . [ Chosen To Sell $1 To %place ]
     echo . [ Paid %carried.$1 Per Unit, Selling For %$2.price.$1 Per Unit ]
     setvariable temp.carried %carried.$1
     if "%place" = "xings" then setvariable temp.cost %xings.price.$1
     if "%place" = "arthe" then setvariable temp.cost %arthe.price.$1
     if "%place" = "leth" then setvariable temp.cost %leth.price.$1
     math temp.cost subtract %temp.carried
     echo . [ Estimated %temp.cost Kronar Profit Per Unit ]
     pause 0.2
     return
check.price.carried:
     if "%place" = "xings" then setvariable temp.price %xings.price.$2
     if "%place" = "leth" then setvariable temp.price %leth.price.$2
     if "%place" = "arthe" then setvariable temp.price %arthe.price.$2
     setvariable temp.value %carried.$2
     math temp.price subtract %temp.value
     setvariable no.sell 0
     if %temp.price < %minimum.unit.gain then echo . [ Profit Unacceptable ( %temp.price Kronar Per Unit Profit) Will not sell %temp.commod ]
     if %temp.price < %minimum.unit.gain then setvariable no.sell 1
     return
sell.commodity:
     setvariable temp.commod $1
     setvariable temp.a $1
     setvariable temp.b 5
     gosub check.price.carried %place %temp.a
     if %no.sell = 1 then return
     gosub unit.ekko $1 %place
     if "%temp.a" = "purpledye" then setvariable temp.a purple dye
     if "%temp.a" = "ironore" then setvariable temp.a iron ore
     if "%temp.a" = "deobaroil" then setvariable temp.a deobar oil
     goto selling.commodity
selling.commodity.p1:
     setvariable temp.1 $1
     math real.profit add %temp.1
     gosub set.up.profit %temp.1
     math total.commodities.delivered add %temp.b
     gosub set.up.commodities %temp.b
selling.commodity.p:
     pause 0.5
selling.commodity:
     if %temp.b = 0 then return
put sell %temp.b %temp.a
     matchre selling.commodity.p1 can pay you (\d+)
     matchre selling.commodity.p (type ahead|wait *\d+)
     matchre done.selling.commodity (you don't seem to have any|not in the market)
     matchre single.sell.commodity You only have (\d+) .
     matchre single.sell.commodity can only afford to buy (\d+) .
     matchre cant.sell.commodity (afford to buy any more|bought that here)
     matchwait
single.sell.commodity:
     setvariable temp.b $1
     goto selling.commodity.p
single.sell.commodity2:
     setvariable temp.b 1
     goto selling.commodity.p
done.selling.commodity:
     setvariable carried.%temp.commod 0
cant.sell.commodity:
     setvariable sell.%temp.commod 0
     return
compare.commods:
     if %finish = 1 then return
     put #statusbar 1 [ Comparing Other Outposts (=      ) ]
     if "%place" = "xings" then goto compare-xings.arthe
compare-xings.arthe-d:
     if "%place" = "xings" then setvariable target arthe
     if "%place" = "xings" then gosub m.inputuy.stock.test
     put #statusbar 1 [ Comparing Other Outposts (==     ) ]
     if "%place" = "xings" then goto compare-xings.leth
compare-xings.leth-d:
     if "%place" = "xings" then setvariable target leth
     if "%place" = "xings" then gosub m.inputuy.stock.test
     put #statusbar 1 [ Comparing Other Outposts (===    ) ]
     if "%place" = "arthe" then goto compare-arthe.xings
compare-arthe.xings-d:
     if "%place" = "arthe" then setvariable target xings
     if "%place" = "arthe" then gosub m.inputuy.stock.test
     put #statusbar 1 [ Comparing Other Outposts (====   ) ]
     if "%place" = "arthe" then goto compare-arthe.leth
compare-arthe.leth-d:
     if "%place" = "arthe" then setvariable target leth
     if "%place" = "arthe" then gosub m.inputuy.stock.test
     put #statusbar 1 [ Comparing Other Outposts (=====  ) ]
     if "%place" = "leth" then goto compare-leth.xings
compare-leth.xings-d:
     if "%place" = "leth" then setvariable target xings
     if "%place" = "leth" then goto buy.stock.test
     put #statusbar 1 [ Comparing Other Outposts (====== ) ]
     if "%place" = "leth" then goto compare-leth.arthe
compare-leth.arthe-d:
     if "%place" = "leth" then setvariable target arthe
     if "%place" = "leth" then gosub m.inputuy.stock.test
     put #statusbar 1 [ Comparing Other Outposts (=======) ] COMPLETE
     goto done.compare.commods-%place
buy.stock.test:
     if %buy.diamonds > 0 then gosub check.single.commod %place %target diamonds
     if %buy.gold > 0 then gosub check.single.commod %place %target gold
     if %buy.ironore > 0 then gosub check.single.commod %place %target ironore
     if %buy.amber > 0 then gosub check.single.commod %place %target amber
     if %buy.cinnamon > 0 then gosub check.single.commod %place %target cinnamon
     if %buy.oranges > 0 then gosub check.single.commod %place %target oranges
     if %buy.slate > 0 then gosub check.single.commod %place %target slate
     if %buy.lead > 0 then gosub check.single.commod %place %target lead
     if %buy.bronze > 0 then gosub check.single.commod %place %target bronze
     if %buy.cotton > 0 then gosub check.single.commod %place %target cotton
     if %buy.velvet > 0 then gosub check.single.commod %place %target velvet
     if %buy.deobaroil > 0 then gosub check.single.commod %place %target deobaroil
     if %buy.salt > 0 then gosub check.single.commod %place %target salt
     if %buy.purpledye > 0 then gosub check.single.commod %place %target purpledye
     if %buy.wheat > 0 then gosub check.single.commod %place %target wheat
     if %buy.corn > 0 then gosub check.single.commod %place %target corn
     if %buy.taffelberries > 0 then gosub check.single.commod %place %target taffelberries
     if %buy.pearls > 0 then gosub check.single.commod %place %target pearls
     if %buy.silver > 0 then gosub check.single.commod %place %target silver
     if %buy.charcoal > 0 then gosub check.single.commod %place %target charcoal
     if %buy.saffron > 0 then gosub check.single.commod %place %target saffron
     if %buy.papyrus > 0 then gosub check.single.commod %place %target papyrus
     if %buy.limes > 0 then gosub check.single.commod %place %target limes
     if %buy.brass > 0 then gosub check.single.commod %place %target brass
     if %buy.copper > 0 then gosub check.single.commod %place %target copper
     if %buy.silk > 0 then gosub check.single.commod %place %target silk
     if %buy.wool > 0 then gosub check.single.commod %place %target wool
     if %buy.lace > 0 then gosub check.single.commod %place %target lace
     if %buy.myrrh > 0 then gosub check.single.commod %place %target myrrh
     if %buy.indigo > 0 then gosub check.single.commod %place %target indigo
     if %buy.barley > 0 then gosub check.single.commod %place %target barley
     if %buy.oats > 0 then gosub check.single.commod %place %target oats
     if %buy.acanth > 0 then gosub check.single.commod %place %target acanth
     if %buy.apples > 0 then gosub check.single.commod %place %target apples
     setvariable buy.diamonds 0
     setvariable buy.gold 0
     setvariable buy.ironore 0
     setvariable buy.amber 0
     setvariable buy.cinnamon 0
     setvariable buy.slate 0
     setvariable buy.lead 0
     setvariable buy.bronze 0
     setvariable buy.cotton 0
     setvariable buy.velvet 0
     setvariable buy.deobaroil 0
     setvariable buy.salt 0
     setvariable buy.purpledye 0
     setvariable buy.wheat 0
     setvariable buy.corn 0
     setvariable buy.taffelberries 0
     setvariable buy.pearls 0
     setvariable buy.silver 0
     setvariable buy.charcoal 0
     setvariable buy.saffron 0
     setvariable buy.papyrus 0
     setvariable buy.limes 0
     setvariable buy.brass 0
     setvariable buy.copper 0
     setvariable buy.silk 0
     setvariable buy.wool 0
     setvariable buy.lace 0
     setvariable buy.myrrh 0
     setvariable buy.indigo 0
     setvariable buy.barley 0
     setvariable buy.oats 0
     setvariable buy.acanth 0
     setvariable buy.apples 0
     setvariable buy.oranges 0
     pause 0.2
     return
check.single.commod:
     pause 0.2
     setvariable price.here %$1.price.$3
     setvariable price.there %$2.price.$3
     setvariable supply.here %$1.supply.$3
     setvariable supply.there %$2.supply.$3
     setvariable temp.product $3
     echo . [ Found $3 As Possible Buy, Checking Price|Demand Against $2 ... ]
     if %carried.$3 > 0 then setvariable buy.$3 0
     if %carried.$3 > 0 then return
     if %supply.here < 2 then setvariable buy.$3 0
     if %supply.here < 2 then return
     if %supply.there = 5 then setvariable buy.$3 0
     if %supply.there = 5 then return
     setvariable temp.there %price.there
     math price.there subtract %minimum.unit.gain
     if %price.here > %price.there then setvariable buy.$3 0
     if %price.here > %price.there then return
     if %commodity.track > 3 then setvariable buy.$3 0
     if %commodity.track > 3 then return
     gosub check.single.commod.demand $3
     return
check.single.commod.demand:
     setvariable pre.price %price.here
     setvariable to.buy nil
     if %supply.here = 5 then gosub check.surplus
     if %supply.here = 4 then gosub check.goodstores
     if %supply.here = 3 then gosub check.goingfast
     if %supply.here = 2 then gosub check.nearlyout
     if "%to.buy" != "nil" then gosub m.inputuy.commodity %to.buy
     pause 0.2
     return
check.surplus:
     if %supply.there = 1 then setvariable to.buy 25 %temp.product
     if %supply.there = 2 then setvariable to.buy 20 %temp.product
     if %supply.there = 3 then setvariable to.buy 15 %temp.product
     if %supply.there = 4 then setvariable to.buy 10 %temp.product
     pause 0.2
     return
check.goodstores:
     if %supply.there = 4 then setvariable to.buy 5 %temp.product
     if %supply.there = 3 then setvariable to.buy 10 %temp.product
     if %supply.there = 2 then setvariable to.buy 15 %temp.product
     if %supply.there = 1 then setvariable to.buy 20 %temp.product
     pause 0.2
     return
check.goingfast:
     if %supply.there = 4 then setvariable to.buy 4 %temp.product
     if %supply.there = 3 then setvariable to.buy 7 %temp.product
     if %supply.there = 2 then setvariable to.buy 10 %temp.product
     if %supply.there = 1 then setvariable to.buy 15 %temp.product
     pause 0.2
     return
check.nearlyout:
     if %supply.there = 4 then setvariable to.buy 5 %temp.product
     if %supply.there = 3 then setvariable to.buy 5 %temp.product
     if %supply.there = 2 then setvariable to.buy 5 %temp.product
     if %supply.there = 1 then setvariable to.buy 5 %temp.product
     pause 0.2
     return
buy.commodity:
     if %carried.$2 > 0 then return
     setvariable temp.units $1
     if "%place" = "xings" then setvariable temp.cost %xings.price.$2
     if "%place" = "arthe" then setvariable temp.cost %arthe.price.$2
     if "%place" = "leth" then setvariable temp.cost %leth.price.$2
     setvariable temp.gain %temp.there
     math temp.gain subtract %temp.cost
     math temp.gain multiply %temp.units
     math temp.cost multiply %temp.units
     math temp.units multiply %temp.there
     math temp.gain subtract 50
     echo . [ Chosen To Buy $1 Units Of $2 For %pre.price Unit Kronar, Total Of %temp.cost Kronar. ]
     echo . [ %temp.there Unit Kronar Estimated Upon Delivery, Total Of %temp.units Kronar : %temp.gain Profit. ]
     setvariable temp.commod $2
     setvariable temp.a $1
     setvariable temp.b $2
     if "%temp.b" = "purpledye" then setvariable temp.b purple dye
     if "%temp.b" = "ironore" then setvariable temp.b iron ore
     if "%temp.b" = "deobaroil" then setvariable temp.b deobar oil
     goto buy.commodity.a
buy.commodity.p:
     pause 0.5
buy.commodity.a:
     if %temp.a = 0 then return
put buy %temp.a %temp.b
     match done.buy.off guild master has passed down a decree that he
     matchre buy.commodity.p (type ahead|wait *\d+)
     matchre good.buy (The clerk nods in approval at your|He accepts your payment)
     matchre lower.buy I'm sorry, we only have (\d+) .
     matchre done.buy (See me again when you have|Order a positive amount)
     matchwait
good.buy:
     setvariable carried.%temp.commod %price.here
     setvariable temp.b %pre.price
     math temp.b multiply %temp.a
     setvariable pay.clerk.commod 1
done.buy:
     return
done.buy.off:
     setvariable commodity.toggle 0
     return
lower.buy:
     setvariable temp.a $1
     goto buy.commodity.p
pay.clerk.commod.p:
     pause 0.5
pay.clerk.commod:
put pay clerk
     matchre pay.clerk.commod.p (type ahead|wait *\d+)
     matchre pay.clerk.commod.d (You count out some|do not owe|The clerk scowls)
     matchwait
pay.clerk.commod.d:
     setvariable pay.clerk.commod 0
     return
feed.check:
     setvariable forage.verb forage grass
     setvariable forage.track 0
     pause 0.5
put look in my feedbag
     match feed.check.d some grass, some grass, some grass, some grass, some grass, some grass, some grass, some grass, some grass and some grass.
     matchre forage.feed (and some grass|tuft of grass|nothing in there|empty|nothing in particular)
     matchwait
feed.check.d:
     return
forage.feed.p:
     pause 0.5
forage.feed:
put %forage.verb
     matchre forage.feed.p (type ahead|wait *\d+)
     match stock.grass You manage to find
     match swap.forage Roundtime
     matchwait
swap.forage:
     setvariable forage.verb forage grass careful
     goto forage.feed
stock.grass.p:
     pause
stock.grass:
put put my grass in my feedbag
     matchre stock.grass.p (type ahead|wait *\d+)
     matchre stock.grass.d (You put|Put what|could not find|What were you)
     matchwait
stock.grass.d:
     math forage.track add 1
     if %forage.track < 3 then goto forage.feed
     goto feed.check
startup.check:
     echo . [ Setting Up Existing Contracts  ... ]
    
     setvariable toggle.check 0
     if %local.toggle = 0 then math toggle.check add 1
     if %interprov.toggle = 0 then math toggle.check add 1
     if %toggle.check = 2 then return
     gosub read.contract crossing
     gosub read.contract arthe
     gosub read.contract dirge
     gosub read.contract stone
     gosub read.contract wolf
     gosub read.contract tiger
     gosub read.contract riverhaven
     gosub read.contract shard
     gosub read.contract leth
     action remove Contract Issued by: *(Riverhaven|RiverHaven|Shard|Crossing|Dirge|Arthe|Stone|Wolf|Tiger|Leth)
     return
set.temp.type:
     if "$1" = "crossing" then setvariable temp.type crossing
     if "$2" = "crossing" then setvariable temp.type crossing
     if "$1" = "wolf" then setvariable temp.type wolf
     if "$2" = "wolf" then setvariable temp.type wolf
     if "$1" = "tiger" then setvariable temp.type tiger
     if "$2" = "tiger" then setvariable temp.type tiger
     if "$1" = "leth" then setvariable temp.type leth
     if "$2" = "leth" then setvariable temp.type leth
     if "$1" = "dirge" then setvariable temp.type dirge
     if "$2" = "dirge" then setvariable temp.type dirge
     if "$1" = "stone" then setvariable temp.type stone
     if "$2" = "stone" then setvariable temp.type stone
     if "$1" = "arthe" then setvariable temp.type arthe
     if "$2" = "arthe" then setvariable temp.type arthe
     if "$1" = "shard" then setvariable temp.type shard
     if "$2" = "shard" then setvariable temp.type shard
     if "$1" = "riverhaven" then setvariable temp.type riverhaven
     if "$2" = "riverhaven" then setvariable temp.type riverhaven
     return
read.contract:
     setvariable type $0
     setvariable temp.type $0
     setvariable placement 1
     action instant setvariable issued.by $1 when Contract Issued by:.*(Riverhaven|RiverHaven|Shard|Crossing|Dirge|Arthe|Stone|Wolf|Tiger|Leth)
reading.contract.1:
     pause 0.5
put read %type contract in my %stow.place
     matchre reading.contract.1 (type ahead|wait *\d+)
     match reading.contract.2 estimate these goods are currently worth
     match reading.contract.next contract is now useless
     match reading.contract.d2 could not find
     matchwait
reading.contract.next:
     pause 0.5
     setvariable issued.by nil
     math placement add 1
     if "%temp.type" = "xings" then setvariable temp.type crossing
     if "%temp.type" = "wc" then setvariable temp.type wolf
     if "%temp.type" = "tc" then setvariable temp.type tiger
     if "%temp.type" = "sc" then setvariable temp.type stone
     if %placement = 2 then setvariable type second %temp.type
     if %placement = 3 then setvariable type third %temp.type
     if %placement = 4 then setvariable type fourth %temp.type
     if %placement = 5 then setvariable type fifth %temp.type
     if %placement = 6 then setvariable type sixth %temp.type
     if %placement = 7 then setvariable type seventh %temp.type
     if %placement = 8 then setvariable type eighth %temp.type
     goto reading.contract.1
reading.contract.2:
     if "%issued.by" = "nil" then goto reading.contract.1
     if "%issued.by" = "Crossing" then setvariable issued.by xings
     if "%issued.by" = "Shard" then goto check.existing.interprov
     if "%temp.type" = "crossing" then setvariable temp.type xings
     if "%issued.by" = "RiverHaven" then goto check.existing.interprov
     if "%issued.by" = "Riverhaven" then goto check.existing.interprov
     if "%temp.type" = "shard" then goto check.existing.interprov
     if "%temp.type" = "riverhaven" then goto check.existing.interprov
     if "%issued.by" = "xings" then goto check.existing.xings
     if "%issued.by" = "Wolf" then goto check.existing.local
     if "%issued.by" = "Tiger" then goto check.existing.local
     if "%issued.by" = "Leth" then goto check.existing.local
     if "%issued.by" = "Dirge" then goto check.existing.local
     if "%issued.by" = "Stone" then goto check.existing.local
     if "%issued.by" = "Arthe" then goto check.existing.local
     goto reading.contract.1
check.existing.local:
     if "%issued.by" = "Wolf" then gosub set.existing.local %temp.type wc
     if "%issued.by" = "Tiger" then gosub set.existing.local %temp.type tc
     if "%issued.by" = "Leth" then gosub set.existing.local %temp.type leth
     if "%issued.by" = "Dirge" then gosub set.existing.local %temp.type dirge
     if "%issued.by" = "Stone" then gosub set.existing.local %temp.type sc
     if "%issued.by" = "Arthe" then gosub set.existing.local %temp.type arthe
     goto reading.contract.d
check.existing.xings:
     if "%temp.type" = "shard" then gosub set.existing.interprov shard xings
     if "%temp.type" = "riverhaven" then gosub set.existing.interprov riverhaven xings
     if "%temp.type" = "wolf" then gosub set.existing.local wc xings
     if "%temp.type" = "tiger" then gosub set.existing.local tc xings
     if "%temp.type" = "stone" then gosub set.existing.local sc xings
     if "%temp.type" = "dirge" then gosub set.existing.local dirge xings
     if "%temp.type" = "arthe" then gosub set.existing.local arthe xings
     if "%temp.type" = "leth" then gosub set.existing.local leth xings
     goto reading.contract.d
set.existing.local:
     setvariable local.from.$2 1
     setvariable temp.from $2
     if "%temp.type" = "wolf" then goto set.existing.local.2
     if "%temp.type" = "tiger" then goto set.existing.local.2
     if "%temp.type" = "stone" then goto set.existing.local.2
     math local.to.$1 add 1
     setvariable $2.destined.for $1
     setvariable temp.to $1
     setvariable temp.destined.for %$2.destined.for
     return
set.existing.local.2:
     if "%temp.type" = "wolf" then math local.to.wc add 1
     if "%temp.type" = "wolf" then setvariable $2.destined.for wc
     if "%temp.type" = "wolf" then setvariable temp.to wc
     if "%temp.type" = "tiger" then math local.to.tc add 1
     if "%temp.type" = "tiger" then setvariable $2.destined.for tc
     if "%temp.type" = "tiger" then setvariable temp.to tc
     if "%temp.type" = "stone" then math local.to.sc add 1
     if "%temp.type" = "stone" then setvariable $2.destined.for sc
     if "%temp.type" = "stone" then setvariable temp.to sc
     setvariable temp.destined.for %$2.destined.for
     return
check.existing.interprov:
     setvariable temp.from $2
     setvariable temp.to $1
     if "%temp.type" = "crossing" then setvariable temp.type xings
     if "%issued.by" = "Shard" then gosub set.existing.interprov %temp.type shard
     if "%issued.by" = "RiverHaven" then gosub set.existing.interprov %temp.type riverhaven
     if "%issued.by" = "RiverHaven" then goto reading.contract.d
     if "%issued.by" = "Riverhaven" then gosub set.existing.interprov %temp.type riverhaven
     if "%issued.by" = "xings" then gosub set.existing.interprov %temp.type xings
reading.contract.d:
     echo . [ Recognized Contract From %temp.from To %temp.to ! ]
     pause 0.05
put #statusbar 1 [ Set : From %temp.from Destined For %temp.to
     pause 0.02
put #statusbar 1 [
     pause 0.02
put #statusbar 1 [ Set : From %temp.from Destined For %temp.to
     pause 0.02
put #statusbar 1 [
     pause 0.02
put #statusbar 1 [ Set : From %temp.from Destined For %temp.to
     pause 0.02
put #statusbar 1 [
     pause 0.02
put #statusbar 1 [
     pause 0.02
     goto reading.contract.next
reading.contract.d2:
     return
set.existing.interprov:
     setvariable temp.from $2
     setvariable temp.to $1
     if "$2" = "xings" then setvariable xings.interprov.destined.for $1
     if "$2" = "xings" then setvariable temp.destined.for $1
     if "$2" = "xings" then setvariable interprov.from.xings 1
     math interprov.to.$1 add 1
     if "$2" = "xings" then return
     setvariable $2.destined.for $1
     setvariable temp.destined.for %$2.destined.for
     setvariable interprov.from.$2 1
     return
logo.startup:

     return




ledger.check:
     echo . [ Setting Up Current Commodities ... ]

put get my ledger
     waitfor You get
put open my ledger
     waitfor You open
put turn my ledger to chapter 5
     waitfor You flip
put turn my ledger to page 1
     waitfor You turn
     action instant setvariable carried.diamonds $1 when diamonds *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.gold $1 when gold *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.ironore $1 when iron ore *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.amber $1 when amber *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.cinnamon $1 when cinnamon *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.slate $1 when slate *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.lead $1 when lead *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.bronze $1 when bronze *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.cotton $1 when cotton *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.velvet $1 when velvet *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.deobaroil $1 when deobar oil *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.salt $1 when salt *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.purpledye $1 when purple dye *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.wheat $1 when wheat *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.corn $1 when corn *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.taffelberries $1 when taffelberries *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.pearls $1 when pearls *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.silver $1 when silver *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.charcoal $1 when charcoal *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.saffron $1 when saffron *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.papyrus $1 when papyrus *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.limes $1 when limes *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.brass $1 when brass *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.copper $1 when copper *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.silk $1 when silk *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.wool $1 when wool *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.lace $1 when lace *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.myrrh $1 when myrrh *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.indigo $1 when indigo *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.barley $1 when barley *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.oats $1 when oats *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.acanth $1 when acanth *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.apples $1 when apples *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action instant setvariable carried.oranges $1 when oranges *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
put read my ledger
     waitfor Contracts and Commodities
     pause 2
     action remove diamonds *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove gold *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove iron ore *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove amber *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove cinnamon *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove slate *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove lead *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove bronze *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove cotton *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove velvet *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove deobar oil *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove salt *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove purple dye *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove wheat *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove corn *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove taffelberries *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove pearls *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove silver *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove charcoal *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove saffron *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove papyrus *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove limes *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove brass *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove copper *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove silk *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove wool *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove lace *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove myrrh *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove indigo *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove barley *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove oats *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove acanth *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove apples *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
     action remove oranges *(\d+) *(Arthe|Leth|Stone|Dirge|Crossing|River|Shard|Tiger|Wolf|The)
put close my ledger
     waitfor You close
put stow my ledger in my %stow.place
     waitforre (You put|STOW HELP)
     return
ekko.stats:
echo .
     if %commodity.toggle = 0 then goto ekko.stats.2
echo . _____________________________________
echo . | ~ Commodities ~    Price Paid
echo . |____________________________________
echo . |
     if %carried.diamonds > 0 then echo . | Diamonds      -    %carried.diamonds
     if %carried.gold > 0 then echo . | Gold          -    %carried.gold
     if %carried.ironore > 0 then echo . | Iron Ore      -    %carried.ironore
     if %carried.amber > 0 then echo . | Amber         -    %carried.amber
     if %carried.cinnamon > 0 then echo . | Cinnamon      -    %carried.cinnamon
     if %carried.slate > 0 then echo . | Slate         -    %carried.slate
     if %carried.lead > 0 then echo . | Lead          -    %carried.lead
     if %carried.bronze > 0 then echo . | Bronze        -    %carried.bronze
     if %carried.cotton > 0 then echo . | Cotton        -    %carried.cotton
     if %carried.velvet > 0 then echo . | Velvet        -    %carried.velvet
     if %carried.deobaroil > 0 then echo . | Deobar Oil    -    %carried.deobaroil
     if %carried.salt > 0 then echo . | Salt          -    %carried.salt
     if %carried.purpledye > 0 then echo . | Purple Dye    -    %carried.purpledye
     if %carried.wheat > 0 then echo . | Wheat         -    %carried.wheat
     if %carried.corn > 0 then echo . | Corn          -    %carried.corn
     if %carried.taffelberries > 0 then echo . | Taffelberries -    %carried.taffelberries
     if %carried.pearls > 0 then echo . | Pearls        -    %carried.pearls
     if %carried.silver > 0 then echo . | Silver        -    %carried.silver
     if %carried.charcoal > 0 then echo . | Charcoal      -    %carried.charcoal
     if %carried.saffron > 0 then echo . | Saffron       -    %carried.saffron
     if %carried.papyrus > 0 then echo . | Papyrus       -    %carried.papyrus
     if %carried.limes > 0 then echo . | Limes         -    %carried.limes
     if %carried.brass > 0 then echo . | Brass         -    %carried.brass
     if %carried.copper > 0 then echo . | Copper        -    %carried.copper
     if %carried.silk > 0 then echo . | Silk          -    %carried.silk
     if %carried.wool > 0 then echo . | Wool          -    %carried.wool
     if %carried.lace > 0 then echo . | Lace          -    %carried.lace
     if %carried.myrrh > 0 then echo . | Myrrh         -    %carried.myrrh
     if %carried.indigo > 0 then echo . | Indigo        -    %carried.indigo
     if %carried.barley > 0 then echo . | Barley        -    %carried.barley
     if %carried.oats > 0 then echo . | Oats          -    %carried.oats
     if %carried.acanth > 0 then echo . | Acanth        -    %carried.acanth
     if %carried.apples > 0 then echo . | Apples        -    %carried.apples
     if %carried.oranges > 0 then echo . | Oranges       -    %carried.oranges
ekko.stats.2:
     if %local.toggle = 0 then goto ekko.stats.3
echo . |____________________________________
echo . |
echo . | ~ Contracts ~    From   To
echo . |____________________________________
echo . | * Local *
     setvariable town Crossings     -
     gosub ekko.local %local.from.xings %local.to.xings %xings.destined.for
     setvariable town Leth          -
     gosub ekko.local %local.from.leth %local.to.leth %leth.destined.for
     setvariable town Arthe Dale    -
     gosub ekko.local %local.from.arthe %local.to.arthe %arthe.destined.for
     setvariable town Stone Clan    -
     gosub ekko.local %local.from.sc %local.to.sc %sc.destined.for
     setvariable town Dirge         -
     gosub ekko.local %local.from.dirge %local.to.dirge %dirge.destined.for
     setvariable town Wolf Clan     -
     gosub ekko.local %local.from.wc %local.to.wc %wc.destined.for
     setvariable town Tiger Clan    -
     gosub ekko.local %local.from.tc %local.to.tc %tc.destined.for
ekko.stats.3:
     setvariable temp.cell 0
     math temp.cell add %interprov.from.shard
     math temp.cell add %interprov.to.shard
     math temp.cell add %interprov.from.xings
     math temp.cell add %interprov.to.xings
     math temp.cell add %interprov.from.riverhaven
     math temp.cell add %interprov.to.riverhaven
     echo . | * Interprov *
     if %temp.cell = 0 then echo . [ * Currently None * ]
     setvariable town Shard         -
     if %interprov.toggle = 1 then gosub ekko.interprov %interprov.from.shard %interprov.to.shard %shard.destined.for
     setvariable town Riverhaven    -
     if %interprov.toggle = 1 then gosub ekko.interprov %interprov.from.riverhaven %interprov.to.riverhaven %riverhaven.destined.for
     setvariable town Crossings     -
     if %interprov.toggle = 1 then gosub ekko.interprov %interprov.from.xings %interprov.to.xings %xings.interprov.destined.for
echo . |____________________________________
echo . |
     if %total.contracts.local > 0 then echo . | Total Local Contracts Delivered     : %total.contracts.local
     if %total.commodities.delivered > 0 then echo . | Total Commodity Units Delivered     : %total.commodities.delivered
     if %total.contracts.interprov > 0 then echo . | Total Interprov Contracts Delivered : %total.contracts.interprov
     if %real.profit != 0 then echo . | Total Real Profit                  : %real.profit
echo . |____________________________________
     if %total.coin = 0 then return
echo . | ~ Banks ~
echo . |____________________________________
     setvariable total.coin 0
     math total.coin add %crossings.bank.balance
     math total.coin add %leth.bank.balance
     math total.coin add %dirge.bank.balance
     math total.coin add %shard.bank.balance
     math total.coin add %riverhaven.bank.balance
     math total.coin add %coin.on.you
     if %crossings.bank.balance > 0 then echo . | Crossings  :  %crossings.bank.balance
     if %dirge.bank.balance > 0 then echo . | Dirge      :  %dirge.bank.balance
     if %leth.bank.balance > 0 then echo . | Leth       :  %leth.bank.balance
     if %shard.bank.balance > 0 then echo . | Shard      :  %shard.bank.balance
     if %riverhaven.bank.balance > 0 then echo . | RiverHaven :  %riverhaven.bank.balance
     if %coin.on.you > 0 then echo . | On You     :  %coin.on.you
echo . | Total      :  %total.coin
echo . |____________________________________
echo . |       Cummulative Information
echo . |       _______________________
     if %front.end = 2 then gosub ekko.fe.2
     if %front.end = 3 then gosub ekko.fe.3
     return
ekko.fe.2:
     if %traderai.profit > 0 then echo . | Profit Made         : %traderai.profit
     if %traderai.local > 0 then echo . | Local Contracts     : %traderai.local
     if %traderai.interprov > 0 then echo . | Interprov Contracts : %traderai.interprov
     if %traderai.commodities > 0 then echo . | Commodities Sold    : %traderai.commodities
echo . |____________________________________
     pause 0.5
     return
ekko.fe.3:
     if $traderai.profit > 0 then echo . | Profit Made         : $traderai.profit
     if $traderai.local > 0 then echo . | Local Contracts     : $traderai.local
     if $traderai.interprov > 0 then echo . | Interprov Contracts : $traderai.interprov
     if $traderai.commodities > 0 then echo . | Commodities Sold    : $traderai.commodities
echo . |____________________________________
     pause 0.5
     return
ekko.interprov:
     setvariable temp.ekko 0
     math temp.ekko add $1
     math temp.ekko add $2
     if %temp.ekko = 0 then return
echo . | %town   $1    $2
     return
ekko.local:
     setvariable temp.ekko 0
     math temp.ekko add $1
     math temp.ekko add $2
     if %temp.ekko = 0 then return
echo . | %town   $1    $2
     return
ekko.statusbar:
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
ekko.statusbar.2:
     if %total.contracts.local > %local.limit then setvariable finish 1
     if %total.contracts.interprov > %interprov.limit then setvariable finish 1
     if %total.commodities.delivered > %commodity.limit then setvariable finish 1
     pause 0.05
     put #statusbar 1 [ Trader AI - To %destination ]
     pause 0.05
     put #statusbar 1 [
     pause 0.05
     put #statusbar 1 [ Trader AI - To %destination ]
     pause 0.05
     put #statusbar 1 [
     pause 0.05
     put #statusbar 1 [ Trader AI - To %destination ]
     pause 0.05
     put #statusbar 1 [
     pause 0.05
     put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
spec.finesse:
     action instant setvariable finesse.on 1 when feel your confidence grow as you realize you are able to act with greater finesse
     if %finesse.on = 1 then return
put speculate finesse
     pause 1
     return
spec.finesse.stop:
     action remove feel your confidence grow as you realize you are able to act with greater finesse
     setvariable finesse.on 0
put speculate finesse stop
     pause 1
     return
check.to.finish:
     setvariable temp.d $2
     setvariable temp.c $1
     if %temp.c > 0 then setvariable destination %temp.d
     return
check.no.finish:
     setvariable temp.d $2
     setvariable temp.c $1
     if %temp.c = 0 then setvariable destination %temp.d
     return
check.from.interprov:
     setvariable temp.d $2
     setvariable temp.c $1
     if %temp.c = 0 then setvariable destination %temp.d
     return
ekko.board:
     return
echo .
echo .
echo . Commodity        Crossings                 Arthe                  Leth
echo .______________________________________________________________________________
echo .
echo . Diamonds      %xings.price.diamonds  %xings.supply.diamonds  %arthe.price.diamonds  %arthe.supply.diamonds  %leth.price.diamonds  %leth.supply.diamonds
echo . Gold          %xings.price.gold  %xings.supply.gold  %arthe.price.gold  %arthe.supply.gold  %leth.price.gold  %leth.supply.gold
echo . Silver        %xings.price.silver   %xings.supply.silver  %arthe.price.silver   %arthe.supply.silver  %leth.price.silver   %leth.supply.silver
echo . Pearls        %xings.price.pearls   %xings.supply.pearls  %arthe.price.pearls   %arthe.supply.pearls  %leth.price.pearls   %leth.supply.pearls
echo . Iron Ore      %xings.price.ironore   %xings.supply.ironore  %arthe.price.ironore   %arthe.supply.ironore  %leth.price.ironore   %leth.supply.ironore
echo . Bronze        %xings.price.bronze   %xings.supply.bronze  %arthe.price.bronze   %arthe.supply.bronze  %leth.price.bronze   %leth.supply.bronze
echo . Copper        %xings.price.copper   %xings.supply.copper  %arthe.price.copper   %arthe.supply.copper  %leth.price.copper   %leth.supply.copper
echo . Brass         %xings.price.brass   %xings.supply.brass  %arthe.price.brass   %arthe.supply.brass  %leth.price.brass   %leth.supply.brass
echo . Lead          %xings.price.lead   %xings.supply.lead  %arthe.price.lead   %arthe.supply.lead  %leth.price.lead   %leth.supply.lead
echo . Slate         %xings.price.slate   %xings.supply.slate  %arthe.price.slate   %arthe.supply.slate  %leth.price.slate   %leth.supply.slate
echo . Amber         %xings.price.amber   %xings.supply.amber  %arthe.price.amber   %arthe.supply.amber  %leth.price.amber   %leth.supply.amber
echo . Charcoal      %xings.price.charcoal    %xings.supply.charcoal  %arthe.price.charcoal    %arthe.supply.charcoal  %leth.price.charcoal    %leth.supply.charcoal
echo . Indigo        %xings.price.indigo   %xings.supply.indigo  %arthe.price.indigo   %arthe.supply.indigo  %leth.price.indigo   %leth.supply.indigo
echo . Purple Dye    %xings.price.purpledye   %xings.supply.purpledye  %arthe.price.purpledye   %arthe.supply.purpledye  %leth.price.purpledye   %leth.supply.purpledye
echo . Myrrh         %xings.price.myrrh   %xings.supply.myrrh  %arthe.price.myrrh   %arthe.supply.myrrh  %leth.price.myrrh   %leth.supply.myrrh
echo . Deobar Oil    %xings.price.deobaroil   %xings.supply.deobaroil  %arthe.price.deobaroil   %arthe.supply.deobaroil  %leth.price.deobaroil   %leth.supply.deobaroil
echo . Cotton        %xings.price.cotton   %xings.supply.cotton  %arthe.price.cotton   %arthe.supply.cotton  %leth.price.cotton   %leth.supply.cotton
echo . Velvet        %xings.price.velvet   %xings.supply.velvet  %arthe.price.velvet   %arthe.supply.velvet  %leth.price.velvet   %leth.supply.velvet
echo . Silk          %xings.price.silk   %xings.supply.silk  %arthe.price.silk   %arthe.supply.silk  %leth.price.silk   %leth.supply.silk
echo . Wool          %xings.price.wool    %xings.supply.wool  %arthe.price.wool    %arthe.supply.wool  %leth.price.wool    %leth.supply.wool
echo . Lace          %xings.price.lace   %xings.supply.lace  %arthe.price.lace   %arthe.supply.lace  %leth.price.lace   %leth.supply.lace
echo . Saffron       %xings.price.saffron   %xings.supply.saffron  %arthe.price.saffron   %arthe.supply.saffron  %leth.price.saffron   %leth.supply.saffron
echo . Acanth        %xings.price.acanth   %xings.supply.acanth  %arthe.price.acanth   %arthe.supply.acanth  %leth.price.acanth   %leth.supply.acanth
echo . Papyrus       %xings.price.papyrus   %xings.supply.papyrus  %arthe.price.papyrus   %arthe.supply.papyrus  %leth.price.papyrus   %leth.supply.papyrus
echo . Taffelberries %xings.price.taffelberries   %xings.supply.taffelberries  %arthe.price.taffelberries   %arthe.supply.taffelberries  %leth.price.taffelberries   %leth.supply.taffelberries
echo . Apples        %xings.price.apples    %xings.supply.apples  %arthe.price.apples    %arthe.supply.apples  %leth.price.apples    %leth.supply.apples
echo . Oranges       %xings.price.oranges   %xings.supply.oranges  %arthe.price.oranges   %arthe.supply.oranges  %leth.price.oranges   %leth.supply.oranges
echo . Salt          %xings.price.salt    %xings.supply.salt  %arthe.price.salt    %arthe.supply.salt  %leth.price.salt    %leth.supply.salt
echo . Limes         %xings.price.limes   %xings.supply.limes  %arthe.price.limes   %arthe.supply.limes  %leth.price.limes   %leth.supply.limes
echo . Cinnamon      %xings.price.cinnamon   %xings.supply.cinnamon  %arthe.price.cinnamon   %arthe.supply.cinnamon  %leth.price.cinnamon   %leth.supply.cinnamon
echo . Wheat         %xings.price.wheat    %xings.supply.wheat  %arthe.price.wheat    %arthe.supply.wheat  %leth.price.wheat    %leth.supply.wheat
echo . Corn          %xings.price.corn    %xings.supply.corn  %arthe.price.corn    %arthe.supply.corn  %leth.price.corn    %leth.supply.corn
echo . Barley        %xings.price.barley    %xings.supply.barley  %arthe.price.barley    %arthe.supply.barley  %leth.price.barley    %leth.supply.barley
echo . Oats          %xings.price.oats   %xings.supply.oats  %arthe.price.oats   %arthe.supply.oats  %leth.price.oats   %leth.supply.oats
     pause 0.2
     return
exp.level:
     setvariable exp.app 0
     setvariable exp.vocals 0
     setvariable exp.perception 0
     setvariable exp.scholarship 0
     setvariable exp.fa 0
     action instant setvariable exp.fa 1 when First Aid: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action instant setvariable exp.fa 0 when First Aid: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     action instant setvariable exp.scholarship 1 when Scholarship: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action instant setvariable exp.scholarship 0 when Scholarship: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     action instant setvariable exp.app 1 when Appraisal: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action instant setvariable exp.app 0 when Appraisal: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     action instant setvariable exp.vocals 1 when Vocals: *(\d+) *(\d+). *(mind lock|dazed|bewilder)
     action instant setvariable exp.vocals 0 when Vocals: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex)
     action instant setvariable exp.perception 0 when Perception: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action instant setvariable exp.perceptoin 1 when Perception: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
put exp
     waitfor EXP HELP
     action remove Perception: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action remove Perception: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     action remove Vocals: *(\d+) *(\d+). *(mind lock|dazed|bewilder)
     action remove Vocals: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex)
     action remove Appraisal: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action remove Appraisal: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     action remove Scholarship: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action remove Scholarship: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     action remove First Aid: *(\d+) *(\d+). *(mind lock|dazed|bewildered)
     action remove First Aid: *(\d+) *(\d+). *(learning|thoughtful|pondering|concentrating|muddled|very|perplex|bewildering|clear)
     return
bank.core:
     setvariable temp.ammount $0
     if "%place" != "riverhaven" then put deposit all
     if "%place" != "riverhaven" then waitfor clerk
     if "%place" != "riverhaven" then pause 0.1
     if "%place" != "riverhaven" then put withdraw %temp.ammount
     if "%place" != "riverhaven" then waitfor clerk
     if "%place" != "riverhaven" then setvariable coin.on.you %carried.converted
     pause 0.1
     setvariable copper 0
     setvariable bronze 0
     setvariable silver 0
     setvariable gold 0
     setvariable platinum 0
put balance
     pause 0.5
     return
     matchre bank.core.d Your current balance is (\d+) (platinum|gold|silver|bronze|copper), (\d+) (platinum|gold|silver|bronze|copper), (\d+) (platinum|gold|silver|bronze|copper), (\d+) (platinum|gold|silver|bronze|copper)
     matchre bank.core.d Your current balance is (\d+) (platinum|gold|silver|bronze|copper), (\d+) (platinum|gold|silver|bronze|copper), (\d+) (platinum|gold|silver|bronze|copper), and (\d+) (platinum|gold|silver|bronze|copper)
     matchre bank.core.d Your current balance is (\d+) (platinum|gold|silver|bronze|copper), (\d+) (platinum|gold|silver|bronze|copper), and (\d+) (platinum|gold|silver|bronze|copper)
     matchre bank.core.d Your current balance is (\d+) (platinum|gold|silver|bronze|copper), and (\d+) (platinum|gold|silver|bronze|copper)
     matchre bank.core.d Your current balance is (\d+) (platinum|gold|silver|bronze|copper) *(Kron|Dok|Lir)
     matchwait
bank.core.d:
     if "$2" = "platinum" then setvariable platinum $1
     if "$2" = "gold" then setvariable gold $1
     if "$2" = "silver" then setvariable silver $1
     if "$2" = "bronze" then setvariable bronze $1
     if "$2" = "copper" then setvariable copper $1
     if "$4" = "gold" then setvariable gold $3
     if "$4" = "silver" then setvariable silver $3
     if "$4" = "bronze" then setvariable bronze $3
     if "$4" = "copper" then setvariable copper $3
     if "$6" = "silver" then setvariable silver $5
     if "$6" = "bronze" then setvariable bronze $5
     if "$6" = "copper" then setvariable copper $5
     if "$8" = "bronze" then setvariable bronze $7
     if "$8" = "copper" then setvariable copper $7
     if %platinum > 0 then setvariable platinum %platinum0000
     if %gold > 0 then setvariable gold %gold000
     if %silver > 0 then setvariable silver %silver00
     if %bronze > 0 then setvariable bronze %bronze0
     math copper add %bronze
     math copper add %silver
     math copper add %gold
     math copper add %platinum
     if "%place" = "shard" then math copper multiply 1.385
     if "%place" = "riverhaven" then math copper multiply 1.25
     if "%place" = "xings" then setvariable crossings.bank.balance %copper
     if "%place" = "leth" then setvariable leth.bank.balance %copper
     if "%place" = "dirge" then setvariable dirge.bank.balance %copper
     if "%place" = "shard" then setvariable shard.bank.balance %copper
     if "%place" = "riverhaven" then setvariable riverhaven.bank.balance %copper
     setvariable total.coin 0
     math total.coin add %crossings.bank.balance
     math total.coin add %leth.bank.balance
     math total.coin add %dirge.bank.balance
     math total.coin add %shard.bank.balance
     math total.coin add %riverhaven.bank.balance
     echo . [ Balance in %place bank is %copper Kronar ]
     return
vocals.main.p:
     pause 0.5
vocals.main:
     if %humming = 1 then goto vocals.main.d
     if %exp.vocals = 1 then goto vocals.main.d
     gosub exp.level
     if %exp.vocals = 1 then goto vocals.main.d
put hum %song.to.hum
     matchre vocals.main.p (type ahead|wait *\d+)
     matchre vocals.main.d (begin to hum|You should stop that)
     matchwait
vocals.main.d:
     return
rent.caravan:
     pause 0.5
put rent caravan
     pause 1
     return
money.check:
     setvariable platinum 0
     setvariable gold 0
     setvariable silver 0
     setvariable bronze 0
     setvariable copper 0
put wealth kronar
     matchre money.check.d Kronars .(\d+) copper Kronars
     match money.check.d no Kronars
     matchwait
money.check.d:
     setvariable copper $1
     echo . [ You have %copper Kronar currently on you. ]
     setvariable coin.on.you %copper
     setvariable total.coin 0
     math total.coin add %crossings.bank.balance
     math total.coin add %leth.bank.balance
     math total.coin add %dirge.bank.balance
     math total.coin add %shard.bank.balance
     math total.coin add %riverhaven.bank.balance
     math total.coin add %coin.on.you
     return
coin.carried.check:
     setvariable quantity $1
     setvariable type $2
     if "%type" = "plat" then math quantity multiply 10000
     if "%type" = "platinum" then math quantity multiply 10000
     if "%type" = "platinu" then math quantity multiply 10000
     if "%type" = "platin" then math quantity multiply 10000
     if "%type" = "plati" then math quantity multiply 10000
     if "%type" = "pla" then math quantity multiply 10000
     if "%type" = "pl" then math quantity multiply 10000
     if "%type" = "p" then math quantity multiply 10000
     if "%type" = "gol" then math quantity multiply 1000
     if "%type" = "gold" then math quantity multiply 1000
     if "%type" = "silver" then math quantity multiply 100
     if "%type" = "sil" then math quantity multiply 100
     if "%type" = "silv" then math quantity multiply 100
     if "%type" = "silve" then math quantity multiply 100
     if "%type" = "bro" then math quantity multiply 10
     if "%type" = "bron" then math quantity multiply 10
     if "%type" = "bronz" then math quantity multiply 10
     if "%type" = "bronze" then math quantity multiply 10
     setvariable carried.converted %quantity
     return
leth.deposit-core:
     gosub core.move out
     gosub core.move n
     gosub core.move e
     gosub core.move go dep
     gosub core.move up
     gosub m.inputank.core %coin.carried
     gosub core.move down
     gosub core.move out
     gosub core.move w
     gosub core.move s
     gosub core.move go shanty
     return
stop.hum.p:
     pause 0.5
stop.hum:
put stop hum
     matchre stop.hum.p (type ahead|wait *\d+)
     matchre stop.hum.d (In the name of love|You stop playing)
     matchwait
stop.hum.d:
     return
leth.finish:
     setvariable destination xings
     if %interprov.to.shard > 0 then setvariable destination shard
     return
dirge.finish:
     setvariable destination xings
     if %local.to.arthe > 0 then setvariable destination arthe
     if %local.to.sc > 0 then setvariable destination sc
     if %interprov.to.riverhaven > 0 then setvariable destination riverhaven
     return
sc.finish:
     setvariable destination xings
     if %local.to.arthe > 0 then setvariable destination arthe
     if %local.to.dirge > 0 then setvariable destination dirge
     if %interprov.to.riverhaven > 0 then setvariable destination dirge
     return
arthe.finish:
     setvariable destination xings
     if %interprov.to.riverhaven > 0 then setvariable destination dirge
     if %local.to.dirge > 0 then setvariable destination dirge
     if %local.to.sc > 0 then setvariable destination sc
     return
wc.finish:
     setvariable destination xings
     if %local.to.tc > 0 then setvariable destination tc
     return
tc.finish:
     setvariable destination xings
     if %local.to.wc > 0 then setvariable destination wc
     return
xings.finish:
     setvariable destination nil
     if %interprov.to.shard > 0 then setvariable destination leth
     if %local.to.leth > 0 then setvariable destination leth
     if %interprov.to.riverhaven > 0 then setvariable destination dirge
     if %local.to.dirge > 0 then setvariable destination dirge
     if %local.to.sc > 0 then setvariable destination sc
     if %local.to.arthe > 0 then setvariable destination arthe
     if %local.to.wc > 0 then setvariable destination wc
     if %local.to.tc > 0 then setvariable destination tc
     if "%destination" = "nil" then goto end.finish
     return
end.finish:
     gosub core.move out
put tell caravan to follow
     waitforre (You pass on the order|You tell your driver|could not find|What were you|must be in the same room|have nothing to command at this)
     gosub core.move n
     waitfor following you
     gosub core.move n
     waitfor following you
     gosub core.move n
     waitfor following you
     gosub core.move n
     waitfor following you
     gosub core.move n
     waitfor following you
     gosub core.move n
     waitfor following you
     gosub core.move w
     waitfor following you
     gosub core.move go stable
     waitfor following you
put pay 400
     pause 1
put quit
     exit
install:
echo .
echo . [ Installing Trader AI ... ]
     put #setvariable traderai.install 1
     put #setvariable traderai.profit 0
     put #setvariable traderai.local 0
     put #setvariable traderai.interprov 0
     put #setvariable traderai.commodities 0
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
echo . [ Trader AI Successfully Installed ! ]
     exit
set.up.profit:
     setvariable temp.1 $1
     if %front.end = 2 then counter set %traderai.profit
     if %front.end = 3 then counter set $traderai.profit
     counter add %temp.1
     put #setvariable traderai.profit %c
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
set.down.profit:
     setvariable temp.1 $1
     if %front.end = 2 then counter set %traderai.profit
     if %front.end = 3 then counter set $traderai.profit
     counter subtract %temp.1
     put #setvariable traderai.profit %c
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
set.up.local:
     if %front.end = 2 then counter set %traderai.local
     if %front.end = 3 then counter set $traderai.local
     counter add 1
     put #setvariable traderai.local %c
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
set.up.interprov:
     if %front.end = 2 then counter set %traderai.interprov
     if %front.end = 2 then counter set $traderai.interprov
     counter add 1
     put #setvariable traderai.interprov %c
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
set.up.commodities:
     setvariable temp.1 $1
     if %front.end = 2 then counter set %traderai.commodities
     if %front.end = 2 then counter set $traderai.commodities
     counter add %temp.1
     put #setvariable traderai.commodities %c
     if %front.end = 2 then put #savevariables
     if %front.end = 3 then put #save variables
put #statusbar 1 [ Total Real Profit : %real.profit   Local Delivered : %total.contracts.local   Interprov Delivered : %total.contracts.interprov   Commodity Units Delivered : %total.commodities.delivered ]
     return
core.move:
     setvariable direction $0
     goto core.move.a
core.move.p:
     pause 0.5
core.move.a:
put %direction
     matchre core.move.p (type ahead|wait *\d+)
     matchre core.move.d (Obvious path|Obvious exit)
     matchwait
core.move.d:
     return
hide.sneak.check.start:
     echo . [ Vocals                     Enabled ]
     if %sneak = 1 then echo . [ Overiding Sneak For Vocals     ... ]
     if %stay.hidden = 1 then echo . [ Overriding Hide For Vocals     ... ]
     if %sneak = 1 then setvariable sneak 0
     if %stay.hidden = 1 then setvariable stay.hidden 0
     return
stay.hidden.check.start:
     echo . [ Perception                 Enabled ]
     if %stay.hidden = 1 then echo . [ Overriding Hide For Perception ... ]
     if %stay.hidden = 1 then setvariable stay.hidden 0
     return
front.end.test:
     setvariable tempa 1
     setvariable tempb 1
     setvariable tempc 1
echo . [ Auto Detecting Front End       ... ]
     setvariable front.end 3
     if %tempa = 1 then if %tempb = 1 then if %tempc = 1 then setvariable front.end 2
     if %front.end = 2 then echo . [ Genie Professional 2 Detected  ... ]
     if %front.end = 3 then echo . [ Genie Professional 3 Detected  ... ]
     return
installation.test:
     if %front.end = 2 then setvariable temp.install %traderai.install
     if %front.end = 3 then setvariable temp.install $traderai.install
     if %temp.install = 1 then return
     goto install