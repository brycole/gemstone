stealarthe:
	if $invisible = 0 then gosub put khri start silence

	if $zoneid = 11 then gosub fromleucros
	if $zoneid = 1 then gosub move NE gate
	if $zoneid = 7 then gosub move arthe dale
	if "$zoneid" != "7b" then goto stealarthe


	gosub khri plunder
	gosub khri hasten
	pause 0.5
	gosub move embroidery shop
	gosub steal bobbin, 5
	gosub move clothing shop
	gosub steal cape, 6
	gosub move odds n ends
	gosub steal fan, 3
	gosub move music shop
	gosub steal kit, 1
	gosub move weapons
	gosub steal sling, 5
	return


