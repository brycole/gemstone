toleucros:
	var leucdir toleucros
	goto trailactions
fromleucros:
	var leucdir fromleucros
	goto trailactions

togeni:
	var leucdir togeni
	goto trailactions

tovipers:
	var leucdir tovipers
	goto trailactions

	trailactions:
	var paths (80|81|82|83)
	var tracks (83|793)
	action var trails $0 when ^You find a faint (\S+)|You find very faint traces of an animal (\S+)|You find a feint animal (\S+)
	action var trails $0 when You find that the faint (\S+) is right where you found it before
	action var trails $0 when ^You find some faint animal (\S+)|^You find some animal (\S+)
	action var trails $0 when You find that the faint animal (\S+) are right where you found them before
	goto leucpathmain




# 69 outside leucros
# 80 inside NTR path
# 81 after first trail
# 82 after second trail
# 83 at the spot/tracks
# 84 after go spot
# 128 tracks into geni - outside geni
# 147 tracks out of geni - inside geni
# 149 tracks into geni - inside geni
# 793 in vipers just after track next to spot


leucpathmain:
	if "$zoneid" = "7b" then gosub move gate
	if $zoneid = 1 then gosub move NE gate
	if $roomid = 100 then goto ID69
	if $roomid = 1 then goto ID80
	if $roomid = 3 then goto ID81
	if $roomid = 4 then goto ID82
	if $roomid = 5 then goto ID83
	if $roomid = 6 then goto ID84
	if $roomid = 103 then goto ID128
	if $roomid = 119 then goto ID147
	if $roomid = 105 then goto ID149
	if $roomid = 36 then goto ID793
	gosub move LEUCPATHS
	goto leucpathmain






ID80:
	if "%leucdir" = "toleucros" then gosub go trail
	if "%leucdir" = "togeni" then gosub go trail
	if "%leucdir" = "tovipers" then gosub go trail
	if "%leucdir" = "fromleucros" then gosub go path
	goto leucpathmain
ID81:
	if "%leucdir" = "toleucros" then gosub go trail
	if "%leucdir" = "togeni" then gosub go trail
	if "%leucdir" = "tovipers" then gosub go trail
	if "%leucdir" = "fromleucros" then gosub put north
	goto leucpathmain
ID82:
	if "%leucdir" = "toleucros" then gosub go trail
	if "%leucdir" = "togeni" then gosub go trail
	if "%leucdir" = "tovipers" then gosub go trail
	if "%leucdir" = "fromleucros" then gosub put north
	goto leucpathmain
ID83:
	if "%leucdir" = "toleucros" then gosub go spot
	if "%leucdir" = "togeni" then gosub go spot
	if "%leucdir" = "tovipers" then gosub go tracks
	if "%leucdir" = "fromleucros" then gosub go trail
	goto leucpathmain

ID69:
	if "%leucdir" = "fromleucros" then return
	if "%leucdir" = "togeni" then gosub put go path
	if "%leucdir" = "toleucros" then gosub put go path
	if "%leucdir" = "tovipers" then gosub put go path
	goto leucpathmain
	
ID84:
	if "%leucdir" = "toleucros" then return
	if "%leucdir" = "togeni" then gosub move 103
	if "%leucdir" = "fromleucros" then gosub put northwest
	if "%leucdir" = "tovipers" then gosub put northwest
	goto leucpathmain

ID793:
	if "%leucdir" = "toleucros" then gosub go tracks
	if "%leucdir" = "togeni" then gosub go tracks
	if "%leucdir" = "fromleucros" then gosub go tracks
	if "%leucdir" = "tovipers" then return
	goto leucpathmain

ID128:
	if "%leucdir" = "toleucros" then gosub move 6
	if "%leucdir" = "togeni" then gosub go trail
	if "%leucdir" = "fromleucros" then gosub move 5
	if "%leucdir" = "tovipers" then gosub move 5
	goto leucpathmain
ID147:
	if "%leucdir" = "toleucros" then gosub go trail
	if "%leucdir" = "togeni" then return
	if "%leucdir" = "fromleucros" then gosub go trail
	if "%leucdir" = "tovipers" then gosub go trail
	goto leucpathmain
ID149:
	if "%leucdir" = "toleucros" then gosub move 119
	if "%leucdir" = "togeni" then return
	if "%leucdir" = "fromleucros" then gosub move 119
	if "%leucdir" = "tovipers" then gosub move 119
	goto leucpathmain



go:
#	if $roomid != %tracks then goto leucpathmain
	gosub khri sight
	if contains("$roomobjs", "$0" then var trails $0
	if contains("%trails", "$0") then {
		if $monstercount > 0 then gosub retreat
		gosub put go $0
		var trails no
		return
		}
	var tracks no
	gosub put search
	goto go
