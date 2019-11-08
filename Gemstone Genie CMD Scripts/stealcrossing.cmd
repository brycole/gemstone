stealcrossing:

return

stealcross.now:
	## ** 150 stealing
	gosub goto alch
	gosub steal "large bowl" 4

	gosub goto herb
	gosub steal "jadice flower" 2
	
	gosub goto florist
	gosub steal "crown" 1
	
	gosub goto shoes
	gosub steal "riding boots" 4
	
	gosub goto clothing
	gosub steal "cloak" 2
	
	gosub goto weapon
	gosub steal "foil" 4
	
	gosub goto armor
	gosub steal "mail gloves" 4
	
	gosub goto general
	gosub steal "razor" 4
	
	gosub goto grisgonda
	gosub steal "crown" 4
	
	gosub goto orem
	gosub steal "hand towel on stand" 4

	gosub goto durantine
	gosub steal "silver vial" 4
	
	gosub goto music
	gosub steal "lyre" 1
	
	#gosub goto locksmith
	#gosub steal "lockpick ring" 2
	
	gosub goto haber
	gosub steal "jerkin" 4
	
	gosub goto tann
	gosub steal "bone bodkin" 1
	
	#gosub move 223;## ** Artifacts
	#gosub steal "talisman" 1

return

## ** 50-100ish stealing
	#goto stealbypass
	gosub goto alch
	gosub steal "pestle" 2

	gosub goto herb
	gosub steal "jadice flower" 1
	
	#gosub goto florist
	#gosub steal "lily" 4
	
	gosub goto shoes
	gosub steal "hose" 2
	
	gosub goto clothing
	gosub steal "hair bow" 2
	
	gosub goto weapon
	gosub steal "dagger" 2
	
	gosub goto armor
	gosub steal "leather aventail" 2
	
	gosub goto general
	gosub steal "lace handkerchief" 2
	
	gosub goto grisgonda
	gosub steal "stud" 2
	
	gosub goto orem
	gosub steal "steal towel on stand" 2
stealbypass:	
	gosub goto durantine
	gosub steal "incense" 2
	
	gosub goto music
	gosub steal "cloth" 2
	
	gosub goto locksmith
	gosub steal "stout lockpick" 2
	
	#gosub goto haber
	#gosub steal "jerkin" 4
	
	gosub goto tann
	gosub steal "stout thread" 2
	
	#gosub move 223;## ** Artifacts
	#gosub steal "talisman" 1
