debuglevel 10

gosub routinecommon

put #var monitor no
var resonance roomrecovery

action var scrollnow $1 when The .+ contains a complete description of the (.+) spell

var warriormagespells Air Lash|Geyser|Stone Strike|Gar Zeng|Fire Shards|Ethereal Shield|Elementalism|Zephyr|Tailwind|Paeldryth's Wrath|Frostbite|Ice Patch|Sure Footing|Anther's Call|Arc Light|Tingle|Substratum|Ward Break|Ignite|Fire Ball|Air Bubble|Swirling Winds|Y'ntrel Sechra|Vertigo|Thunderclap|Rising Mists|Veil of Ice|Rimefang|Tremor|Lightning Bolt|Ethereal Fissure|Mark of Arhat|Blufmor Garaen|Shockwave|Fortress of Ice|Magnetic Ballista|Chain Lightning|Grounding Field|Aether Cloak|Dragon's Breath|Flame Shockwave|Ring of Spears|Aegis of Granite|Mantle of Flame|Fire Rain|Quick Infusions|Icy Infusions|Reinforced Infusions|Shocking Infusions|Expansive Infusions|Fiery Infusions

var bardspells Glythtide's Joy|Aura of Tongues|Eillie's Cry|Faenella's Grace|Caress of the Sun|Eye of Kertigen|Blessing of the Fae|Aether Wolves|Hodierna's Lilt|Demrris' Resolve|Words of the Wind|Damaris' Lullaby|Whispers of the Muse|Redeemer's Pride|Breath of Storms|Sanctuary|Echoes of Aether|Nexus|Naming of Tears|Drums of the Snake|Resonance|Abandoned Heart|Misdirection|Desert's Maelstrom|Phoenix's Pyre|Will of Winter|Harmony|Albreda's Balm|Rage of the Clans|Soul Ablaze

var empathspells Heal Wounds|Heal Scars|Vitality Healing|Blood Staunching|Mental Focus|Iron Constitution|Refresh|Heal|Flush Poisons|Cure Disease|Compel|Awaken|Tranquility|Innocence|Gift of Life|Lethargy|Regenerate|Fountain of Creation|Adaptive Curing|Absolution|Heart Link|Circle of Sympathy|Nissa's Binding|Perseverance of Peri'el|Vigor|Paralysis|Aggressive Stance|Guardian Spirit|Raise Power|Aesandry Darlaeth

var rangerspells Compost|Eagle's Cry|See the Wind|Athleticism|Branch Break|Carrion Call|Devitalize|Harawep's Bonds|Instinct|Wolf Scent|Essence of Yew|Hands of Lirisa|Sense of the Tiger|Awaken Forest|Stampede|Devolve|Swarm|Grizzly Claws|Wisdom of the Pack|Forestwalker's Boon|Earth Meld|Cheetah Swiftness|Claws of the Cougar|Curse of the Wilds|Blend|Bear Strength|Skein of Shadows|Memory of Nature

var moonmagespells Partial Displacement|Whole Displacement|Clear Vision|Shadows|Telekinetic Throw|Calm|Sever Thread|Tangled Fate|Piercing Gaze|Aura Sight|Focus Moonbeam|Dinazen Olkar|Dazzle|Telekinetic Storm|Rend|Psychic Shield|Sleep|Hypnotize|Sovereign Destiny|Tezirah's Veil|Teleport|Locate|Distant Gaze|Artificer's Eye|Tenebrous Sense|Unleash|Burn|Refractive Field|Moonblade|Shear|Thoughtcast|Contingency|Moongate|Seer's Sense|Shadewatch Mirror|Shift Moonbeam|Starlight Sphere|Cage of Light|Steps of Vuan|Shape Moonblade|Empower Moonblade|Mental Blast|Invocation of the Spheres|Shadow Servant|Shadowling|Riftal Summons|Mind Shout

var necromancerspells Quicken the Earth|Heighten Pain|Acid Splash|Obfuscation|Necrotic Reconstruction|Call from Beyond|Ivory Mask|Siphon Vitality|Researcher's Insight|Viscous Solution|Visions of Darkness|Petrifying Visions|Reverse Putrefaction|Kura Silma|Butcher's Eye|Blood Burst|Consume Flesh|Vivisection|Eyes of the Blind|Calcified Hide|Worm's Mist|Philosopher's Preservation|Chirurgia|Devour|Universal Solvent|Rite of Grace|Rite of Contrition|Spiteful Rebirth

var clericspells Revelation|Centering|Glythtide's Gift|Minor Physical Protection|Bless|Auspice|Soul Sickness|Rejuvenation|Protection from Evil|Sanyu Lyba|Major Physical Protection|Divine Radiance|Hand of Tenemlor|Horn of the Black Unicorn|Fists of Faenella|Uncurse|Sanctify Pattern|Aesrela Everild|Eylhaar's Feast|Chill Spirit|Vigil|Soul Shield|Ghost Shroud|Benediction|Halo|Shield of Light|Harm Evil|Phelim's Sanction|Fire of Ushnish|Malediction|Curse of Zachriedek|Hydra Hex|Huldah's Pall|Persistence of Mana|Osrel Meraud|Heavenly Fires|Bitter Feast|Soul Attrition|Soul Bonding|Ring of Blessings|Harm Horde|Idon's Theft|Meraud's Cry|Spite of Dergati|Resurrection|Murrula's Flames

var paladinspells Aspirant's Aegis|Heroic Strength|Stun Foe|Vessel of Salvation|Sentinel's Resolve|Righteous Wrath|Courage|Divine Guidance|Hands of Justice|Halt|Footman's Strike|Alamhif's Gift|Crusader's Challenge|Soldier's Prayer|Veteran Insight|Anti-Stun|Marshal Order|Clarity|Banner of Truce|Shatter|Rutilor's Edge|Rebuke|Divine Armor|Truffenyi's Rally|Smite Horde|Bond Armaments|Holy Warrior

var apspells Ease Burden|Strange Arrow|Gauge Flow|Burden|Manifest Force|Lay Ward|Seal Cambrinth|Dispel|Imbue

var scroll_list Shadows

scroll_loop:

	gosub put.1 "get %2 from %1" "^You get"
	gosub put.1 "read %2" "^Roundtime"

	if matchre("%scrollnow", "%scroll_list") then
	{
		gosub put.1 "put %2 in haver" "^You put"
		put #echo >log Green %scrollnow
	}
	if matchre("%warriormagespells", "%scrollnow") then gosub put.1 "put %2 in red box" "^You put"
	if matchre("%bardspells", "%scrollnow") then gosub put.1 "put %2 in gold box" "^You put"
	if matchre("%empathspells", "%scrollnow") then gosub put.1 "put %2 in white box" "^You put"
	if matchre("%rangerspells", "%scrollnow") then gosub put.1 "put %2 in green box" "^You put"
	if matchre("%moonmagespells", "%scrollnow") then gosub put.1 "put %2 in blue box" "^You put"
	if matchre("%necromancerspells", "%scrollnow") then gosub put.1 "put %2 in black box" "^You put"
	if matchre("%clericspells", "%scrollnow") then gosub put.1 "put %2 in silver box" "^You put"
	if matchre("%paladinspells", "%scrollnow") then gosub put.1 "put %2 in grey box" "^You put"
	if matchre("%apspells", "%scrollnow") then gosub put.1 "put %2 in brown box" "^You put"
	if "$lefthand" != "Empty" then gosub put.1 "put %2 in hav" "^You put"
goto scroll_loop

include routinecommon.cmd 
