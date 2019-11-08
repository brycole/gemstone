stealshard:

return

stealshard.now:
#goto stealbypass1
	## ** 160 shard stealing
	
	if $Time.isDay = 1 then
	{
	gosub goto stitchery
	gosub steal "tunic" 4
	}
	
	gosub goto general
	gosub steal "scabbard" 4

	gosub goto alchemy
	gosub steal "large bowl" 4
	
	gosub goto herbs
	gosub steal "qun pollen" 2
	
	gosub goto cleric
	gosub steal "bracelet" 4
	
	if $Time.isDay = 1 then
	{
	#gosub goto bard
	#gosub steal "long pouch" 2
	
	gosub goto armor
	gosub steal "leather mask" 4
	
	}
	
## ** outside shard
	gosub move 132
	
	gosub goto tannery
	gosub steal "hide scraper" 4
	
## ** survivalist supplies
	gosub move 33
	gosub steal "scraper" 4
	
	gosub move 232
	gosub steal "pestle" 1
	
## ** Fayrin's rest

	gosub move 193
	gosub steal "jadice flower" 3
	
	gosub move 150
	gosub steal "cloth scabbard" 4
	
	gosub move 149
	gosub steal "rapier" 2
	
	## ** return to town to pawn
	if %pawn = 1 then
	{
		gosub move 43
		gosub move 216
	}

return