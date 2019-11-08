stealcrossing:
	if $invisible = 0 then gosub put khri start silence

	if "$zoneid" = "7b" then gosub move gate
	if $zoneid = 11 then gosub fromleucros
	if $zoneid = 7 then gosub move crossing
	if $zoneid != 1 then gosub move NE gate


	gosub khri plunder
	gosub khri hasten
	pause 0.5
	gosub move 205
	var keywords 0
	gosub move jewelry shop
	gosub steal gold ring, 2
	gosub move cleric shop
	gosub steal bell, 2
	gosub move general store
	gosub steal scabbard, 6
	gosub move weapon shop
	gosub steal rocks, 5
	gosub move armor shop
	gosub steal chain helm, 4
	gosub move music shop
	gosub steal kit, 2
	gosub move flower shop
	gosub steal potion, 3
	gosub move herb shop
	gosub steal potion, 4
	gosub move alchemist
	gosub steal mortar, 6
	return



