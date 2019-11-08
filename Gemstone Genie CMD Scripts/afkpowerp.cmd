action put quit when eval $health < 50

if "$guild" = "Moon" then goto moonstart
goto roomstart

moonstart:
	gosub perc xibar
	gosub perc yavash
	gosub perc katamba
	gosub perc moonlight
	gosub perc transduction
	gosub perc psychic
	gosub perc perception
	gosub perc stellar
	gosub perc planets
	delay 300
goto moonstart
goto exit.powerp

roomstart:
	gosub perc
	delay 60
goto roomstart

perc:
	put perc $1
	pause
	pause .1
return

exit.powerp:
