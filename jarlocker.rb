#Will stick gems into jars (will also do bottles and beakers)- useful for adventure guild gem hoarding
#Origional script by Craig O'Brien ~~ Edited by Blueland (Joseph@Joseph.net)


gemdb = [ "some blue lapis lazuli","n'ayanad crystal","ayanad crystal","tiny golden seed","banded agate", "blue lace agate", "chameleon agate", "cloud agate", "fire agate", "frost agate", "moss agate", "mottled agate", "tigereye agate", "piece of golden amber", "deep purple amethyst", "azurite", "azure blazestar", "crimson blazestar", "golden blazestar", "emerald blazestar", "bloodjewel", "bloodstone", "bright bluerock", "red carbuncle", "chalcedony", "ridge coral", "paw coral", "flower coral", "black coral", "blue coral", "pink coral", "red coral", "blue cordierite", "corestone", "cinnabar crystal", "glaesine crystal", "quartz crystal", "rock crystal", "dragonmist crystal", "tigerfang crystal", "deathstone", "scarlet despanal", "blue diamond", "dragon\'s-tear diamond", "dwarf-cut diamond", "black diamond", "yellow diamond", "uncut diamond", "maernstrike diamond", "star-of-tamzyrr diamond", "star diopside", "doomstone", "black dreamstone", "blue dreamstone", "green dreamstone", "pink dreamstone", "red dreamstone", "yellow dreamstone", "white dreamstone", "gold dust", "dragonfire emerald", "dragon\'s-tear emerald", "dwarf-cut emerald", "uncut emerald", "eye-of-Koar emerald", "star emerald", "blue eostone", "olivine faenor-bloom", "bronze fang", "copper fang", "gold fang", "iron fang", "mithril fang", "platinum fang", "silver fang", "steel fang", "urglaes fang", "violet feystone", "periwinkle feystone", "firestone", "almandine garnet", "red garnet", "green garnet", "spessartine garnet", "wyrm\'s-eye garnet", "ametrine gem", "aquamarine gem", "chrysoberyl gem", "blue gem", "red gem", "beryl gem", "chrysoprase gem", "lilac glimaerstone", "cerulean glimaerstone", "clear glimaerstone", "golden glimaerstone", "green glimaerstone", "peach glimaerstone", "smoky glimaerstone", "ultramarine glimaerstone", "petrified haon", "yellow heliodor", "yellow hyacinth", "polished ivory", "fiery jacinth", "brown jade", "green jade", "white jade", "black jasper", "red jasper", "yellow jasper", "blue lapis", "black marble", "green marble", "pink marble", "white marble", "mica", "mithril-bloom", "pale blue moonstone", "cats-eye moonstone", "golden moonstone", "opaline moonstone", "pale green moonstone", "silvery moonstone", "mother-of-pearl", "gold nugget", "platinum nugget", "obsidian", "spiderweb obsidian", "banded onyx", "black onyx", "piece of onyx", "aster opal", "black opal", "boulder opal", "dragonfire opal", "fire opal", "moonglae opal", "white opal", "frost opal", "purple opal", "green ora-bloom", "firemote orb", "shadowglass orb", "fire pearl", "iridescent pearl", "black pearl", "grey pearl", "pink pearl", "white pearl", "peridot", "pyrite", "blue quartz", "carnelian quartz", "eye quartz", "citrine quartz", "rose quartz", "rainbow quartz", "tangerine quartz", "golden rhimar-bloom", "riftshard", "riftstone", "rosespar", "dragon\'s-tear ruby", "dwarf-cut ruby", "star ruby", "uncut ruby", "sylvarraend ruby", "sandsilver", "blue sapphire", "blue shimmarglin sapphire", "clear sapphire", "dragonsbreath sapphire", "dragonseye sapphire", "blue mermaid\'s-tear sapphire", "dwarf-cut sapphire", "green sapphire", "lavender shimmarglin sapphire", "pale water sapphire", "pink sapphire", "star sapphire", "violet sapphire", "yellow sapphire", "umber sard", "sardonyx", "shimmertine shard", "viridian soulstone", "black sphene", "brown sphene", "white sphene", "yellow sphene", "spherine", "blue spinel", "pink spinel", "red spinel", "violet spinel", "sardonyx stone", "alexandrite stone", "adventure stone", "malachite stone", "labradorite stone",  "morganite stone", "rhodochrosite stone", "jet stone", "turquoise stone", "sunstone", "sapphire talon", "purple thunderstone", "blue topaz", "clear topaz", "golden topaz", "errisian topaz", "imperial topaz", "pink topaz", "smoky topaz", "black tourmaline", "blue tourmaline", "clear tourmaline", "green tourmaline", "pink tourmaline", "spiderweb turquoise", "argent vultite-bloom", "wyrdshard", "brown zircon", "clear zircon", "green zircon", "snowflake zircon", "yellow zircon" ]

if script.vars.find { |val| val =~ /\bhelp\b/i }
	echo("Will stick gems into jars (will also do bottles and beakers) - useful for adventure guild gem hoarding")
	echo("You MUST can change the hardcoded container settings to use this script!")
	exit
end
#  container1 = Unprocessed gems - will default to greatcloak if not defined
#	container2 = Your primary jar container (not full jars) - 
#	container3 = Empty jar container - 
#	container4 = Full jar container (full jar storage) - 
$jargem_gemsack = "orc sack"
$jargem_primejarsack = "locker"
$jargem_emptyjarsack = "mantle"
$jargem_fulljarsack = "back"

fput "look in #{$jargem_gemsack}"
contents = waitfor("In the .+ you see").gsub(/ and (?:an|a|some)/, ',')
$jargem_gems = contents.scan(/\b(?:#{gemdb.join('|')})(?=,|\.)/)

def jargem_get_empty
	fput "get jar from my #{$jargem_emptyjarsack}"
	emptyresult = waitfor("Get what", "You remove")
	if emptyresult =~ /Get what/
		fput "get bottle from my #{$jargem_emptyjarsack}"
		botresult = waitfor("Get what", "You remove")
		if botresult =~ /Get what/
			fput "get beaker from my #{$jargem_emptyjarsack}"
			beakresult = waitfor("Get what", "You remove")
			if beakresult =~ /Get what/
				echo ("You are out of empty jars")
				exit
			else
				$jargem_contain = 'beaker'
			end
		else
			$jargem_contain = 'bottle'
		end
	else
		$jargem_contain = 'jar'
	end
end
def gem_to_jar
	if $jargem_gem2 
		fput "put my #{$jargem_gem2} in #{$jargem_contain}"
	else
		fput "put my #{$jargem_gem} in #{$jargem_contain}"
	end
	jarresult = waitfor("into your jar", "into your beaker", "into your bottle", "to the contents of", "into your empty", "full", "better of mixing", "holding the beaker", "holding the jar", "holding the bottle")
	if jarresult =~ /into your empty|into your beaker|into your jar|into your bottle|to the contents of/
		fput "put my #{$jargem_contain} in #{$jargem_primejarsack}"
	elsif jarresult =~ /better of mixing/
		fput "put my #{$jargem_contain} in #{$jargem_gemsack}"
	elsif jarresult =~ /full/
		fput "put my #{$jargem_contain} in #{$jargem_fulljarsack}"
		jargem_get_empty
	end
end

until ($jargem_gems.length == 0) 
	$jargem_gem = $jargem_gems.shift
	$jargem_gem2 = nil
	if $jargem_gem =~ /pale blue sapphire/
		$jargem_gem2 = 'pale sapphire'
	elsif $jargem_gem =~ /pale blue moonstone/
		$jargem_gem2 = 'blue moonstone'
	elsif $jargem_gem =~ /pale green moonstone/
		$jargem_gem2 = 'green moonstone'
	elsif $jargem_gem =~ /deep purple amethyst/
		$jargem_gem2 = 'deep amethyst'
	elsif $gem =~ /blue shimmarglin sapphire/
		$jargem_gem2 = 'shimmarglin sapphire'
	elsif $gem =~ /piece of golden amber/
		$jargem_gem = 'golden amber'
		$jargem_gem2 = 'golden amber'
	elsif $jargem_gem =~ /pale water sapphire/
		$jargem_gem2 = 'water sapphire'
	elsif $jargem_gem =~ /lavender shimmarglin sapphire/
		$jargem_gem2 = 'shimmarglin sapphire'
	elsif $jargem_gem =~ /tiny golden seed/
		$jargem_gem2 = 'golden seed'
	elsif $jargem_gem =~ /blue lapis lazuli/
		$jargem_gem2 = 'blue lapis'
	elsif $jargem_gem =~ /red garnet/
		$jargem_gem2 = 'blood garnet'
	elsif $jargem_gem =~ /blue lace agate/
		$jargem_gem2 = 'blue agate'
	elsif $jargem_gem =~ /piece of golden amber/
		$jargem_gem2 = 'golden amber'
	end
	if $jargem_gem2 
		fput "take my #{$jargem_gem2} from my #{$jargem_gemsack}"
	else
		fput "take my #{$jargem_gem} from my #{$jargem_gemsack}"
	end
	result = waitfor("You remove", "Get what", "need a free hand")
	if result =~ /need a free hand/
		fput "stow all"
	end
	if result =~ /You remove/
		put "rummage in #{$jargem_primejarsack} ingredient #{$jargem_gem}"
		newresult = waitfor("jar", "bottle", "beaker", "seem to locate any ingredient like that")
		if newresult =~ /jar|bottle|beaker/
			if newresult =~ /jar/
				$jargem_contain = 'jar'
			elsif newresult =~ /bottle/
				$jargem_contain = 'bottle'
			elsif newresult =~ /beaker/
				$jargem_contain = 'beaker'
			end
		elsif newresult =~ /seem to locate any ingredient like that/
			#jargem_get_empty
		if $jargem_gem2 
			fput "put my #{$jargem_gem2} in #{$jargem_gemsack}"
				else
					fput "put my #{$jargem_gem} in #{$jargem_gemsack}"
				end
		end
		if newresult =~ /seem to locate any ingredient like that/
			else
				gem_to_jar
		end
	elsif result =~ /Get what/
		echo ("there is a problem with your gem setup, double check, exiting")
		exit
	end
end
echo ("And we're done!  Exiting.")
exit
