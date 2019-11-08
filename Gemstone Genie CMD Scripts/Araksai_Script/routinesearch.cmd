	routinesearch:
	action setvariable pouchfull yes when ^There isn't any more room in the|^There aren't any components in
	action setvariable pouchfull yes when ^You can't fit anything else in the|You have to be holding or wearing.*pouch
	action setvariable pouchfull yes when has been tied off.  Once you sell the contents
	action setvariable pouchfull yes when ^You think the.*gem pouch is too full to fit another gem into.
	action setvariable pouchfull yes when The.*pouch is too full to fit any more gems
	action setvariable pouchfull yes when ^You've already got a wealth of gems in there!  You'd better tie it up before putting more gems inside
	action put tie my pouch when pouch is too valuable to leave untied.  You'll need to tie it up before putting more gems inside
	action setvariable mypouch closed when Open yo.*pouch first
	action setvariable dropcopperlirum $1 when and ([\S ]+) copper Lirums \(
	action setvariable dropcopperdokar $1 when and ([\S ]+) copper Dokoras \(
	action setvariable dropcopperkronar $1 when and ([\S ]+) copper Kronars \(
	action setvariable dropbronzedokar $1 when silver, ([\S ]+) bronze,.*copper Dokoras \(
	action setvariable dropbronzelirum $1 when silver, ([\S ]+) bronze,.*copper Lirums \(
	action setvariable dropbronzekronar $1 when silver, ([\S ]+) bronze,.*copper Kronars \(
	action setvariable skin warrior when An Adan'f blood warrior screams out, "Adan'f inja ssskramur!" before its death rattle echoes through the forest
	action setvariable skin warrior when An Adan'f blood warrior falls to the ground with a crash and screams, "Adan'f inja ssskramur!" before its death rattle echoes
	action setvariable skin mage when The shadow mage sinks to the ground in a rustle of cloth and covers its face with the hood of its cloak.  Slowly the 
	action setvariable skin mage when The shadow mage hisses in rage and covers its face with the hood of its cloak
	action setvariable skin assassin when items vanish in a haze of blue lightning
	action setvariable skin dancer when An obsidian war mattock falls from the dancer's grasp and shatters on the ground
	action setvariable skin dancer when The spirit dancer sinks to the ground, gasping out a final breath as the madnes
	action setvariable skin dryad when The deadwood dryad thrashes about madly, soon ceasing all movement
	action setvariable skin dryad when The deadwood dryad slumps to the ground amidst the many snaps and pops of shattering
	action setvariable skin nyad when The eerie glow in her eyes flares before flickering out as.*nyad collapses
 	action setvariable skin sprite when A sand sprite moans in despair before finally taking her last breath
	action setvariable skin Reaver when The faenrae reaver lets loose an ear-shattering scream
	action setvariable skin hound when The wind hound lets loose a scream like a howling blizzard
	action setvariable skin hatchling when A kra'hei hatchling's tail thrashes as it venomously hisses
	action setvariable skin none when An Adan'f spirit dancer howls in rage and drags the
	action put tie my pouch when You put your.*in your dark gem pouch\.
	return

skinning:
	if "%container" = "\%container" then echo NO GEM POUCH CONTAINER, please set \%container variable
	if "$righthandnoun" = "%ranged" then gosub retreat
search:
search.now:
	matchre search.now \.\.\.wait
	matchre search.done has already been searched 
	matchre search.now ^Sorry, you may only type ahead
	matchre search.done ^You're not in any condition
	matchre search.done ^You don't find anything of interest
	matchre search.done ^It's not dead yet
	matchre search.done ^It's already been picked clean
	matchre search.done ^You move closer to a dead
	matchre search.done ^You move over to
	matchre search.done ^Search what\?
	matchre search.done ^You should probably wait until
	matchre search.done ^You find nothing of special
	matchre search.done ^You find nothing of interest
	matchre search.done ^It carried nothing of interest
	matchre search.done ^I could not find what you were referring to
	matchre search.done ^What were you referring to?
	matchre search.loot ^(The.*was carrying .+)
	matchre search.loot ^(You also find .+)
	put search %skin
	matchwait 5
search.done:
	setvariable skin no
	var dirt no
	math monstersdead add 1
	gosub ammo
	if "%pouchfull" = "yes" then gosub stowpouch
	goto mainloop

search.loot:
	var dirt no
	setvariable searchloot $0
	if $Disarm_Traps.LearningRate > 20 then goto skipdisarm
	if contains("%searchloot", "strongbox") then gosub treasureget strongbox
	if contains("%searchloot", " box") then gosub treasureget box
	if contains("%searchloot", "trunk") then gosub treasureget trunk
	if contains("%searchloot", "chest") then gosub treasureget chest
	if contains("%searchloot", "caddy") then gosub treasureget caddy
	if contains("%searchloot", "crate") then gosub treasureget crate
	if contains("%searchloot", "coffer") then gosub treasureget coffer
	if contains("%searchloot", "casket") then gosub treasureget casket
	if contains("%searchloot", "skippet") then gosub treasureget skippet
	skipdisarm:

#	if contains("%searchloot", "runestone") then gosub treasureget runestone
#	if contains("%searchloot", "label") then gosub treasureget label
#	if contains("%searchloot", "card") then gosub treasureget card
#	if contains("%searchloot", "stout lockpick") then gosub treasureget lockpick
#	if contains("%searchloot", "stones") then gosub treasureget stones
	if contains("%searchloot", "agate") then gosub treasure agate
	if contains("%searchloot", "onyx") then gosub treasure onyx
	if contains("%searchloot", "ivory") then gosub treasure ivory
	if contains("%searchloot", "coral") then gosub treasure coral
	if contains("%searchloot", "morganite") then gosub treasure morganite
	if contains("%searchloot", "bloodstone") then gosub treasure bloodstone
	if contains("%searchloot", "moonstone") then gosub treasure moonstone
	if contains("%searchloot", "turquoise") then gosub treasure turquoise
	if contains("%searchloot", "hematite") then gosub treasure hematite
	if contains("%searchloot", "chalcedony") then gosub treasure chalcedony
	if contains("%searchloot", "nugget") then gosub treasure nugget
	if contains("%searchloot", "beryl") then gosub treasure beryl
	if contains("%searchloot", "lazuli") then gosub treasure lazuli
	if contains("%searchloot", "kunzite") then gosub treasure kunzite
	if contains("%searchloot", "chrysoprase") then gosub treasure chrysoprase
	if contains("%searchloot", "andalusite") then gosub treasure andalusite
	if contains("%searchloot", "iolite") then gosub treasure iolite
	if contains("%searchloot", "citrine") then gosub treasure citrine
	if contains("%searchloot", "aquamarine") then gosub treasure aquamarine
	if contains("%searchloot", "tanzanite") then gosub treasure tanzanite
	if contains("%searchloot", "spinel") then gosub treasure spinel
	if contains("%searchloot", "garnet") then gosub treasure garnet
	if contains("%searchloot", "tourmaline") then gosub treasure tourmaline
	if contains("%searchloot", "chrysoberyl") then gosub treasure chrysoberyl
	if contains("%searchloot", "emerald") then gosub treasure emerald
	if contains("%searchloot", "carnelian") then gosub treasure carnelian
	if contains("%searchloot", "minerals") then gosub treasure minerals
	if contains("%searchloot", "bar") then gosub treasure bar
	if contains("%searchloot", "pearl") then gosub treasure pearl
	if contains("%searchloot", "peridot") then gosub treasure peridot
	if contains("%searchloot", "sapphire") then gosub treasure sapphire
	if contains("%searchloot", "tsavorite") then gosub treasure tsavorite
	if contains("%searchloot", "tanzanite") then gosub treasure tanzanite
	if contains("%searchloot", "jadeite gwethdesuan") then gosub treasureget jadeite gwethdesuan
	if contains("%searchloot", "kyanite gwethdesuan") then gosub treasureget kyanite gwethdesuan
	if contains("%searchloot", "ring bearing the crest") then gosub treasureget ring
	if contains("%searchloot", "scroll") then gosub treasureget scroll
	if contains("%searchloot", "parchment") then gosub treasureget parchment
	if contains("%searchloot", "tablet") then gosub treasureget tablet
	if contains("%searchloot", "ostracon") then gosub treasureget ostracon
	if contains("%searchloot", "bark") then gosub treasureget bark
	if contains("%searchloot", "roll") then gosub treasureget roll
	if contains("%searchloot", "copper coin") then gosub treasurecoin coin
	if contains("%searchloot", "bronze coin") then gosub treasurecoin coin
	if contains("%searchloot", "silver coin") then gosub treasurecoin coin
	if contains("%searchloot", "gold coin") then gosub treasurecoin gold coin
	if contains("%searchloot", "platinum coin") then gosub treasurecoin platinum coin
	if contains("%searchloot", "mineral") then gosub treasureget mineral
	if contains("%searchloot", "kertig fist") then gosub treasureget fist
	if contains("%searchloot", "kertig tear") then gosub treasureget tear
	if contains("%searchloot", "glaes shard") then gosub treasureget shard
	if contains("%searchloot", "niniam fragment") then gosub treasureget fragment
	if contains("%searchloot", "damite lump") then gosub treasureget lump
	if contains("%searchloot", "circle of glowing sun") then gosub treasureget sunstone
	if contains("%searchloot", "lumium nugget") then gosub treasureget nugget
	if contains("%searchloot", "alexandrite") then gosub treasure alexandrite
	if contains("%searchloot", "amber") then gosub treasure amber
	if contains("%searchloot", "amethyst") then gosub treasure amethyst
	if contains("%searchloot", "bead") then gosub treasure bead
	if contains("%searchloot", "bloodgem") then gosub treasure bloodgem
	if contains("%searchloot", "bloodstone") then gosub treasure bloodstone
	if contains("%searchloot", "crystal") then gosub treasure crystal
	if contains("%searchloot", "diopside") then gosub treasure diopside
	if contains("%searchloot", "topaz") then gosub treasure topaz
	if contains("%searchloot", "gem") then gosub treasure gem
	if contains("%searchloot", "jasper") then gosub treasure jasper
	if contains("%searchloot", "malachite stone") then gosub treasure stone
	if contains("%searchloot", "opal") then gosub treasure opal
	if contains("%searchloot", "pearl") then gosub treasure pearl
	if contains("%searchloot", "pebble") then gosub treasure pebble
	if contains("%searchloot", "quartz") then gosub treasure quartz
	if contains("%searchloot", "ruby") then gosub treasure ruby
	if contains("%searchloot", "sapphire") then gosub treasure sapphire
	if contains("%searchloot", "sunstone") then gosub treasure sunstone
	if contains("%searchloot", " jade") then gosub treasure jade
	if contains("%searchloot", "diamond") then gosub treasure diamond
	if contains("%searchloot", "turquoise stone") then gosub treasure stone
	if contains("%searchloot", "zircon") then gosub treasure zircon
	if contains("%searchloot", "%ammo") then gosub ammo
	goto search.done



checkground:
	if contains("$roomobjs", "agate") then gosub treasure agate
	if contains("$roomobjs", "onyx") then gosub treasure onyx
	if contains("$roomobjs", "ivory") then gosub treasure ivory
	if contains("$roomobjs", "coral") then gosub treasure coral
	if contains("$roomobjs", "morganite") then gosub treasure morganite
	if contains("$roomobjs", "bloodstone") then gosub treasure bloodstone
	if contains("$roomobjs", "moonstone") then gosub treasure moonstone
	if contains("$roomobjs", "turquoise") then gosub treasure turquoise
	if contains("$roomobjs", "hematite") then gosub treasure hematite
	if contains("$roomobjs", "chalcedony") then gosub treasure chalcedony
	if contains("$roomobjs", "nugget") then gosub treasure nugget
	if contains("$roomobjs", "beryl") then gosub treasure beryl
	if contains("$roomobjs", "lazuli") then gosub treasure lazuli
	if contains("$roomobjs", "kunzite") then gosub treasure kunzite
	if contains("$roomobjs", "chrysoprase") then gosub treasure chrysoprase
	if contains("$roomobjs", "andalusite") then gosub treasure andalusite
	if contains("$roomobjs", "iolite") then gosub treasure iolite
	if contains("$roomobjs", "citrine") then gosub treasure citrine
	if contains("$roomobjs", "aquamarine") then gosub treasure aquamarine
	if contains("$roomobjs", "tanzanite") then gosub treasure tanzanite
	if contains("$roomobjs", "spinel") then gosub treasure spinel
	if contains("$roomobjs", "garnet") then gosub treasure garnet
	if contains("$roomobjs", "tourmaline") then gosub treasure tourmaline
	if contains("$roomobjs", "chrysoberyl") then gosub treasure chrysoberyl
	if contains("$roomobjs", "emerald") then gosub treasure emerald
	if contains("$roomobjs", "carnelian") then gosub treasure carnelian
	if contains("$roomobjs", "minerals") then gosub treasure minerals
	if contains("$roomobjs", "bar") then gosub treasure bar
	if contains("$roomobjs", "pearl") then gosub treasure pearl
	if contains("$roomobjs", "peridot") then gosub treasure peridot
	if contains("$roomobjs", "sapphire") then gosub treasure sapphire
	if contains("$roomobjs", "tsavorite") then gosub treasure tsavorite
	if contains("$roomobjs", "tanzanite") then gosub treasure tanzanite
	if contains("$roomobjs", "jadeite gwethdesuan") then gosub treasureget jadeite gwethdesuan
	if contains("$roomobjs", "kyanite gwethdesuan") then gosub treasureget kyanite gwethdesuan
	if contains("$roomobjs", "ring bearing the crest") then gosub treasureget ring
	if contains("$roomobjs", "scroll") then gosub treasureget scroll
	if contains("$roomobjs", "parchment") then gosub treasureget parchment
	if contains("$roomobjs", "tablet") then gosub treasureget tablet
	if contains("$roomobjs", "ostracon") then gosub treasureget ostracon
	if contains("$roomobjs", "bark") then gosub treasureget bark
	if contains("$roomobjs", "roll") then gosub treasureget roll
	if contains("$roomobjs", "copper coin") then gosub treasurecoin coin
	if contains("$roomobjs", "bronze coin") then gosub treasurecoin coin
	if contains("$roomobjs", "silver coin") then gosub treasurecoin coin
	if contains("$roomobjs", "gold coin") then gosub treasurecoin gold coin
	if contains("$roomobjs", "platinum coin") then gosub treasurecoin platinum coin
	if contains("$roomobjs", "mineral") then gosub treasureget mineral
	if contains("$roomobjs", "kertig fist") then gosub treasureget fist
	if contains("$roomobjs", "kertig tear") then gosub treasureget tear
	if contains("$roomobjs", "glaes shard") then gosub treasureget shard
	if contains("$roomobjs", "niniam fragment") then gosub treasureget fragment
	if contains("$roomobjs", "damite lump") then gosub treasureget lump
	if contains("$roomobjs", "circle of glowing sun") then gosub treasureget sunstone
	if contains("$roomobjs", "lumium nugget") then gosub treasureget nugget
	if contains("$roomobjs", "alexandrite") then gosub treasure alexandrite
	if contains("$roomobjs", "amber") then gosub treasure amber
	if contains("$roomobjs", "amethyst") then gosub treasure amethyst
	if contains("$roomobjs", "bead") then gosub treasure bead
	if contains("$roomobjs", "bloodgem") then gosub treasure bloodgem
	if contains("$roomobjs", "bloodstone") then gosub treasure bloodstone
	if contains("$roomobjs", "crystal") then gosub treasure crystal
	if contains("$roomobjs", "diopside") then gosub treasure diopside
	if contains("$roomobjs", "topaz") then gosub treasure topaz
	if contains("$roomobjs", "gem") then gosub treasure gem
	if contains("$roomobjs", "jasper") then gosub treasure jasper
	if contains("$roomobjs", "malachite stone") then gosub treasure stone
	if contains("$roomobjs", "opal") then gosub treasure opal
	if contains("$roomobjs", "pearl") then gosub treasure pearl
	if contains("$roomobjs", "pebble") then gosub treasure pebble
	if contains("$roomobjs", "quartz") then gosub treasure quartz
	if contains("$roomobjs", "ruby") then gosub treasure ruby
	if contains("$roomobjs", "sapphire") then gosub treasure sapphire
	if contains("$roomobjs", "sunstone") then gosub treasure sunstone
	if contains("$roomobjs", " jade") then gosub treasure jade
	if contains("$roomobjs", "diamond") then gosub treasure diamond
	if contains("$roomobjs", "turquoise stone") then gosub treasure stone
	if contains("$roomobjs", "zircon") then gosub treasure zircon
	if contains("$roomobjs", "%ammo") then gosub ammo
	var clutter none
	return




treasure:
	setvariable treasure $0
	if contains("$righthandnoun", "short bow") then gosub put retreat
	gosub put get %treasure
	gosub put put %treasure in my pouch
	if "%fullpouch" = "yes" then gosub stowpouch
	return
treasureget:
	setvariable treasure $0
	if contains("$righthandnoun", "short bow") then gosub put retreat
	gosub put stow %treasure
	return
treasurecoin:
	setvariable treasure $0
	if contains("$righthandnoun", "short bow") then gosub put retreat
	gosub put get %treasure
	return

stowpouch:
	setvariable pouchfull no
	if "$lefthandnoun" = "lockpick" then gosub put put lockpick in my %container2
	if "$monstercount" > "%dancekill" then gosub retreat
	pause 0.1
	if "$lefthand" != "Empty" then gosub put put %treasure in my %container3
	gosub put remove my pouch
	pause 0.1
	if "$monstercount" > "%dancekill" then gosub retreat
	gosub put tie my pouch
	pause 0.1
	gosub put put my pouch in my %container1
	if "$monstercount" > "%dancekill" then gosub retreat
	gosub put get pouch from my %container2
	gosub put wear my pouch
	return
	goto mainloop

dropwealth:
	setvariable dropcopperkronar 0
	setvariable dropcopperlirum 0
	setvariable dropcopperdokar 0
	setvariable dropbronzekronar 0
	setvariable dropbronzelirum 0
	setvariable dropbronzedokar 0
	gosub put wealth
	pause 0.1
	pause 0.1
	if %dropcopperkronar > 0 then gosub put drop %dropcopperkronar copper kronar
	if %dropcopperlirum > 0 then gosub put drop %dropcopperlirum copper lirum
	if %dropcopperdokar > 0 then gosub put drop %dropcopperdokar copper dok
	if %dropbronzekronar > 0 then gosub put drop %dropbronzekronar bronze kronar
	if %dropbronzelirum > 0 then gosub put drop %dropbronzelirum bronze lirum
	if %dropbronzedokar > 0 then gosub put drop %dropbronzedokar bronze dok
	pause 0.1
return


