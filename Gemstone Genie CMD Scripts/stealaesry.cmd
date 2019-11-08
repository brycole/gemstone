stealaesry:

return

stealaesry.now:
## ** Bottom half	
	gosub goto bard
	gosub steal "small case" 1
	gosub goto flower
	gosub steal "chain" 2
	gosub goto general
	gosub steal "hairbrush" 2
	#gosub goto weapon
	#gosub steal "telek" 1
	gosub goto footwear
	gosub steal "woolen tights" 2
	gosub goto puzzles
	gosub steal "satin clowns" 2
	
## ** Middle
	#gosub goto bowyer
	#gosub steal "wood shaper" 3
	
## ** Top half
	#gosub goto jewelry
	#gosub steal "earcuff" 2
	gosub goto origami
	gosub steal "plain paper" 2
	gosub goto cleric
	gosub steal "sacramental wine" 2
	gosub goto scriptorium
	gosub steal "crisp song scroll" 2
	gosub goto clothing
	gosub steal "britches" 1
	gosub goto alchemist
	gosub steal "plovik leaf" 2
	gosub goto tanning
	gosub steal "hide scraper" 2

return

