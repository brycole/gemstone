stealhibarn:
	gosub khri plunder
	gosub khri hasten
	pause 0.5

	var keywords 0
	gosub move cleric shop
	gosub steal alb charm, 2
	gosub move music
	gosub steal cornet on racks, 2
	gosub move lamp
	gosub steal fae lamp, 2
	gosub move sundries
	gosub steal scrim knife, 4
	gosub move herb
	gosub steal luj elixir, 4
	gosub move toggery
	gosub steal wax, 3
	gosub move shield shop
	gosub steal medium shield, 2
	if $zoneid != 127 then gosub move boar
	if $zoneid != 127 then gosub move boar
	gosub move weapon
	gosub steal club on rack, 2
	return
