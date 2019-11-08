action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

var SortingContainer basket

var WarMageContainer case in basket
var AnalagousContainer second case in basket
var ClericContainer third case in basket
var PaladinContainer fourth case in basket
var MoonMageContainer fifth case in basket
var EmpathContainer sixth case in basket
var RangerContainer seventh case in basket
var NecromancerContainer eighth case in basket
var BardContainer ninth case in basket

Get.Scroll:
put get scroll from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get bark from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get vellum from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get parchment from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get papyrus from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get tablet from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get roll from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get ostracon from my %SortingContainer
match Run.sort You get
matchwait 1
pause .5
put get leaf from my %SortingContainer
match Run.sort You get
matchwait 1
goto End

Run.sort:
matchre Sort.necro (Call from Beyond|Necrotic Reconstruction|Reverse Putrefaction|Quicken the Earth|Blood Burst|Heighten Pain|Siphon Vitality|Visions of Darkness|Petrifying Visions|Eyes of the Blind|Obfuscation|Rite of Contrition|Acid Splash|Vivisection|Viscous Solution|Researcher\'s Insight|Universal Solvent|Butcher\'s Eye|Calcified Hide|Philosopher\'s Preservation|Consume Flesh|Worm\'s Mist|Kura-Silma|Spiteful Rebirth|Ivory Mask|Devour)
matchre Sort.ranger (Essence of Yew|Wolf Scent|See the Wind|Cheetah Swiftness|Bear Strength|Grizzly Claws|Sense of the Tiger|Wisdom of the Pack|Claws of the Cougar|Hands of Lirisa|Earth Meld|Blend|Athleticism|Memory of Nature|Compost|Swarm|Harawep\'s Bonds|Awaken Forest|Branch Break|Eagle\'s Cry|Devitalize|Curse of the Wilds|Stampede|Carrion Call|Devolve)
matchre Sort.moonard (Clear Vision|Piercing Gaze|Locate|Distant Gaze|Seer\'s Sense|Aura Sight|Tenebrous Sense|Calm|Mental Blast|Mind Shout|Sleep|Hypnotize|Telekinetic Throw|Telekinetic Storm|Psychic Shield|Rend|Shear|Thoughtcast|Shadows|Focus Moonbeam|Dazzle|Refractive Field|Steps of Vuan|Burn|Moonblade|Empower Moonblade|Shape Moonblade|Dinazen Olkar|Cage of Light|Shift Moonbeam|Shadowling|Shadow Servant|Partial Displacement|Teleport|Whole Displacement|Moongate|Riftal Summons|Contingency|Starlight Sphere|Invocation of the Spheres|Shadewatch Mirror|Sever Thread|Tangled Fate|Sovereign Destiny|Tezirah\'s Veil)
matchre Sort.warmage (Ethereal Shield|Aether Cloak|Ward Break|Substratum|Ethereal Fissure|Elementalism|Arc Light|Tingle|Lightning Bolt|Chain Lightning|Gar Zeng|Grounding Field|Fire Shards|Fire Ball|Dragon\'s Breath|Mantle of Flame|Fire Rain|Flame Shockwave|Ignite|Mark of Arhat|Frostbite|Ice Patch|Rising Mists|Fortress of Ice|Geyser|Veil of Ice|Frost Scythe|Rimefang|Tremor|Sure Footing|Aegis of Granite|Stone Strike|Anther\'s Call|Ring of Spears|Magnetic Ballista|Zephyr|Tailwind|Paeldryth\'s Wrath|Shockwave|Swirling Winds|Vertigo|Air Lash|Thunderclap|Y\'ntrel Sechra|Air Bubble|Blufmor Garaen)
matchre Sort.cleric (Protection from Evil|Minor Physical Protection|Shield of Light|Benediction|Major Physical Protection|Ghost Shroud|Halo|Soul Shield|Sanyu Lyba|Rejuvenation|Vigil|Soul Bonding|Auspice|Centering|Soul Attrition|Chill Spirit|Soul Sickness|Eylhaar\'s Feast|Bitter Feast|Bless|Harm Evil|Phelim\'s Sanction|Divine Radiance|Harm Horde|Curse of Zachriedek|Hand of Tenemlor|Malediction|Horn of the Black Unicorn|Ring of Blessings|Fists of Faenella|Hydra|Aesrela Everild|Heavenly Fires|Resurrection|Glythtide\'s Gift|Murrula\'s Flames|Fire of Ushnish|Sanctify Pattern|Uncurse|Huldah\'s Pall|Persistence of Mana|Osrel Meraud|Meraud\'s Cry|Idon\'s Theft|Spite of Dergati)
matchre Sort.empath (Vitality Healing|Heal Wounds|Heal Scars|Heal|Regenerate|Fountain of Creation|Blood Staunching|Flush Poisons|Cure Disease|Adaptive Curing|Heart Link|Refresh|Raise Power|Gift of Life|Vigor|Paralysis|Lethargy|Innocence|Aesandry Darlaeth|Guardian Spirit|Iron Constitution|Aggressive Stance|Circle of Sympathy|Nissa\'s Binding|Mental Focus|Compel|Tranquility|Awaken)
matchre Sort.bard (Abandoned Heart|Aether Wolves|Albreda\'s Balm|Breath of Storms|Blessing of the Fae|Caress of the Sun|Damaris\' Lullaby|Demrris\' Resolve|Desert Maelstrom|Drums of the Snake|Echoes of Aether|Eillie\'s Cry|Eye of Kertigen|Faenella\'s Grace|Glythtide\'s Joy|Harmony|Hodierna\'s Lilt|Misdirection|Naming of Tears|Nexus|Phoenix\'s Pyre|Rage of the Clans|Redeemer\'s Pride|Resonance|Sanctuary|Soul Ablaze|Whispers of the Muse|Will of Winter|Words of the Wind)
matchre Sort.paladin (Courage|Righteous Wrath|Divine Guidance|Truffenyi\'s Rally|Sentinel\'s Resolve|Veteran Insight|Anti-Stun|Heroic Strength|Soldier\'s Prayer|Divine Armor|Marshal Order|Bond Armaments|Halt|Stun Foe|Shatter|Banner of Truce|Hands of Justice|Rutilor\'s Edge|Holy Warrior|Rebuke|Clarity|Smite Horde|Footman\'s Strike|Alamhif\'s Gift|Aspirant\'s Aegis|Vessel of Salvation)
matchre Sort.analagous (Ease Burden|Strange Arrow|Manifest Force|Lay Ward|Dispel|Imbue|Burden|Seal Cambrinth)
matchre Sort.dump There is nothing there to read.
send read my $righthand
matchwait 2

Sort.necro:
pause 2
put #ECHO RED NECRO SCROLL FOUND!
put #log >necro.scroll.csv $righthand,$1
put put my $righthand in my %NecromancerContainer
goto Get.Scroll

Sort.ranger:
pause 2
put #ECHO RED RANGER SCROLL FOUND!
put #log >ranger.scroll.csv $righthand,$1
put put my $righthand in my %RangerContainer
goto Get.Scroll

Sort.moonard:
pause 2
put #ECHO RED MOON MAGE SCROLL FOUND!
put #log >moonmage.scroll.csv $righthand,$1
put put my $righthand in my %MoonMageContainer
goto Get.Scroll

Sort.warmage:
pause 2
put #ECHO RED WARRIOR MAGE SCROLL FOUND!
put #log >warmage.scroll.csv $righthand,$1
put put my $righthand in my %WarMageContainer
goto Get.Scroll

Sort.cleric:
pause 2
put #ECHO RED CLERIC SCROLL FOUND!
put #log >cleric.scroll.csv $righthand,$1
put put my $righthand in my %ClericContainer
goto Get.Scroll

Sort.empath:
pause 2
put #ECHO RED EMPATH SCROLL FOUND!
put #log >empath.scroll.csv $righthand,$1
put put my $righthand in my %EmpathContainer
goto Get.Scroll

Sort.bard:
pause 2
put #ECHO RED BARD SCROLL FOUND!
put #log >bard.scroll.csv $righthand,$1
put put my $righthand in my %BardContainer
goto Get.Scroll

Sort.paladin:
pause 2
put #ECHO RED PALADIN SCROLL FOUND!
put #log >paladin.scroll.csv $righthand,$1
put put my $righthand in my %PaladinContainer
goto Get.Scroll

Sort.analagous:
pause 2
put #ECHO RED ANALOGOUS SCROLL FOUND!
put #log >analagous.scroll.csv $righthand,$1
put put my $righthand in my %AnalagousContainer
goto Get.Scroll

Sort.dump:
pause 2
put empty right
put empty left

End:
put #ECHO RED End of Scrolls