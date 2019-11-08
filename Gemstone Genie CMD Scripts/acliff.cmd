goto %1

1:
move climb ledge
if $stamina < 100 then waiteval $stamina = 100
move climb ledge
if $stamina < 100 then waiteval $stamina = 100
move climb rock
if $stamina < 100 then waiteval $stamina = 100
move n
move climb perch
if $stamina < 100 then waiteval $stamina = 100
move climb shelf
if $stamina < 100 then waiteval $stamina = 100
move climb crev
if $stamina < 100 then waiteval $stamina = 100
move go tunn
move climb ledge
if $stamina < 100 then waiteval $stamina = 100
move climb crev
if $stamina < 100 then waiteval $stamina = 100
move climb hole
if $stamina < 100 then waiteval $stamina = 100
move climb top
if $stamina < 100 then waiteval $stamina = 100
goto exit

2:
move climb hole
if $stamina < 100 then waiteval $stamina = 100
move climb crev
if $stamina < 100 then waiteval $stamina = 100
move climb down
if $stamina < 100 then waiteval $stamina = 100
move climb down
move go tun
if $stamina < 100 then waiteval $stamina = 100
move climb down
if $stamina < 100 then waiteval $stamina = 100
move climb shelf
if $stamina < 100 then waiteval $stamina = 100
move climb down
if $stamina < 100 then waiteval $stamina = 100
move s
move climb ledge
if $stamina < 100 then waiteval $stamina = 100
move climb ledge
if $stamina < 100 then waiteval $stamina = 100
move climb down
if $stamina < 100 then waiteval $stamina = 100
	
exit:
	put #parse acliff.cmd done.
	