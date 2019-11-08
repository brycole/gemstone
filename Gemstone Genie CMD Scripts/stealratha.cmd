stealratha:

return

stealratha.now:
## ** Level 3
	gosub goto jewelry
	gosub steal "armband" 3
	gosub goto Divine
	gosub steal "altar candle" 5

## ** Level 2	
	gosub goto tailor
	gosub steal "tartan badge" 6
	gosub goto hair
	gosub steal "hairbrush" 4
	gosub goto music
	gosub steal "cloth" 4
	
## ** Level 1	
	gosub goto alchemist
	gosub steal "oil" 6
	gosub goto general
	gosub steal "scale polish" 4

return

