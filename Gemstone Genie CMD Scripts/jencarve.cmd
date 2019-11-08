

setvariable trash recep
setvariable stick.type cherry
setvariable collect.2 cherry stick
if_1 setvariable stick.type %1

setvariable mech 0
setvariable forage 0
setvariable astro 0
setvariable md 0



action instant setvariable md 1 when Magical Devices: *(\d+) ... learning
action (exp) instant setvariable md 2 when Magical Devices: *(\d+) ... thoughtful
action (exp) instant setvariable md 3 when Magical Devices: *(\d+) ... pondering
action (exp) instant setvariable md 4 when Magical Devices: *(\d+) ... con
action (exp) instant setvariable md 5 when Magical Devices: *(\d+) ... muddled
action (exp) instant setvariable md 6 when Magical Devices: *(\d+) ... very muddled
action (exp) instant setvariable md 7 when Magical Devices: *(\d+) ... perplexing
action (exp) instant setvariable md 8 when Magical Devices: *(\d+) ... perplexed
action (exp) instant setvariable md 9 when Magical Devices: *(\d+) ... bewildering
action (exp) instant setvariable md 10 when Magical Devices: *(\d+) ... bewildered
action (exp) instant setvariable md 11 when Magical Devices: *(\d+) ... dazed
action (exp) instant setvariable md 12 when Magical Devices: *(\d+) ... mind lock

action (exp) instant setvariable mech 1 when Mechanical Lore: *(\d+) ... learning
action (exp) instant setvariable mech 2 when Mechanical Lore: *(\d+) ... thoughtful
action (exp) instant setvariable mech 3 when Mechanical Lore: *(\d+) ... pondering
action (exp) instant setvariable mech 4 when Mechanical Lore: *(\d+) ... con
action (exp) instant setvariable mech 5 when Mechanical Lore: *(\d+) ... muddled
action (exp) instant setvariable mech 6 when Mechanical Lore: *(\d+) ... very muddled
action (exp) instant setvariable mech 7 when Mechanical Lore: *(\d+) ... perplexing
action (exp) instant setvariable mech 8 when Mechanical Lore: *(\d+) ... perplexed
action (exp) instant setvariable mech 9 when Mechanical Lore: *(\d+) ... bewildering
action (exp) instant setvariable mech 10 when Mechanical Lore: *(\d+) ... bewildered
action (exp) instant setvariable mech 11 when Mechanical Lore: *(\d+) ... dazed
action (exp) instant setvariable mech 12 when Mechanical Lore: *(\d+) ... mind lock


action (exp) instant setvariable forage 1 when Foraging: *(\d+) ... learning
action (exp) instant setvariable forage 2 when Foraging: *(\d+) ... thoughtful
action (exp) instant setvariable forage 3 when Foraging: *(\d+) ... pondering
action (exp) instant setvariable forage 4 when Foraging: *(\d+) ... con
action (exp) instant setvariable forage 5 when Foraging: *(\d+) ... muddled
action (exp) instant setvariable forage 6 when Foraging: *(\d+) ... very muddled
action (exp) instant setvariable forage 7 when Foraging: *(\d+) ... perplexing
action (exp) instant setvariable forage 8 when Foraging: *(\d+) ... perplexed
action (exp) instant setvariable forage 9 when Foraging: *(\d+) ... bewildering
action (exp) instant setvariable forage 10 when Foraging: *(\d+) ... bewildered
action (exp) instant setvariable forage 11 when Foraging: *(\d+) ... dazed
action (exp) instant setvariable forage 12 when Foraging: *(\d+) ... mind lock

action (exp) instant setvariable astro 1 when Astrology: *(\d+) ... learning
action (exp) instant setvariable astro 2 when Astrology: *(\d+) ... thoughtful
action (exp) instant setvariable astro 3 when Astrology: *(\d+) ... pondering
action (exp) instant setvariable astro 4 when Astrology: *(\d+) ... con
action (exp) instant setvariable astro 5 when Astrology: *(\d+) ... muddled
action (exp) instant setvariable astro 6 when Astrology: *(\d+) ... very muddled
action (exp) instant setvariable astro 7 when Astrology: *(\d+) ... perplexing
action (exp) instant setvariable astro 8 when Astrology: *(\d+) ... perplexed
action (exp) instant setvariable astro 9 when Astrology: *(\d+) ... bewildering
action (exp) instant setvariable astro 10 when Astrology: *(\d+) ... bewildered
action (exp) instant setvariable astro 11 when Astrology: *(\d+) ... dazed
action (exp) instant setvariable astro 12 when Astrology: *(\d+) ... mind lock

action (exp) inactivate
action instant setvariable forage 1 when state of mind.* (fluid|murky|dense|very|frozen|stagnant)
action instant setvariable broken 1 when bow snaps in your
action instant setvariable kick 1 when You manage to collect a pile

start:
     if %mana = 100 then gosub cast.cv
     setvariable broken 0
forage:
     gosub exp.check
     setvariable kick 0
     if %forage < 12 then gosub verb collect %stick.type stick
     if %kick = 0 then gosub collect.2
     if %kick = 1 then gosub verb kick pile
     if prone then gosub verb stand
     if kneeling then gosub verb stand
     if not standing then gosub verb stand
     if sitting then gosub verb stand
     if %forage >= %mech then gosub verb get my carving knife
     if %forage < 11 then gosub verb forage %stick.type stick careful
     if %forage > 10  then gosub verb forage %stick.type stick
     if %forage < %mech then gosub verb put my stick in %trash
     if %forage < %mech then goto forage
     pause
     gosub verb shape short bow from my stick
     if %broken = 1 then goto reset
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb put knife in my quiver
     gosub verb get my shaper
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb put shaper in my quiver
     gosub verb get my carving knife
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb put knife in my quiver
     gosub verb get my shaper
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb put shaper in my quiver
     gosub verb get my carving knife
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb shape bow
     if %broken = 1 then goto reset
     gosub verb put bow in %trash
     gosub verb put knife in my quiver
     gosub exp.check
     if %astro < 11 then gosub verb per yava
     if %astro < 11 then gosub verb per xiba
     if %astro < 11 then gosub verb per katam
     if %astro < 11 then gosub verb study sky
     if %astro < 11 then gosub verb observe yava
     if %astro < 11 then gosub verb observe katamb
     if %astro < 11 then gosub verb observe xiba
     goto start
collect.2:
     if %forage < 12 then gosub verb collect %collect.2 stick
     return
exp.check:
     setvariable mech 0
     setvariable forage 0
     setvariable astro 0
     action (exp) activate
put exp
     waitfor EXP HELP
     action (exp) inactivate
     if %mech > 10 then exit
     return
reset:
     pause
put put knife in my quiver
     pause 0.5
put put shaper in my quiver
     pause 0.5
     setvariable broken 0
     goto start
cast.cv:
     if %md < 11 then gosub verb charge my amu 11
     if %md < 11 then gosub verb charge my amu 11
     if %md < 11 then gosub verb charge my amu 11
     if %md < 11 then gosub verb focus my amulet
     if %md < 11 then gosub verb charge my ank 11
     if %md < 11 then gosub verb charge my ank 11
     if %md < 11 then gosub verb charge my ank 11
     if %md < 11 then gosub verb focus my ank
     pause
     if %md < 11 then put prep cv
     if %md > 10 then put prep cv 50
     waitfor fully prepared
put cast
     waitfor You gesture
     pause 0.5
put prep psy 50
     waitfor fully prepared
put cast
     waitfor You
     pause 1
     return
verb:
     setvariable verb $0
     goto verb.a
verb.p:
     pause 0.5
verb.a:
put %verb
     matchre verb.p (type ahead|...wait)
     matchre verb.d (snaps in your hand|Roundtime|You get|You put|could not find what you were referring|to your left hand|you fail to find any signs|need the proper tool to continue|already shaped|You drop|need the right tool|You stand|You are already|Xibar|Katamba|Yavash|You feel it is too soon|You are unable to sense)
     matchwait
verb.d:
     pause 0.5
     return