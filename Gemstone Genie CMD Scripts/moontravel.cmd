gosub routinecommon

put #var pvpalert no

var resonance roomrecovery

	if "$zoneid" = "1" then gosub move 172
	if "$zoneid" = "4" then gosub move 87
	if "$zoneid" = "4a" then 
	{
		gosub move 59
		gosub put.1 "prep teleport" "%prep.msg"
		pause 2
		gosub put.1 "cast %1" "%cast.msg"
		pause 2
		gosub walk south
	}
	if "$zoneid" = "63" then
	{
		gosub walk east
		gosub put.1 "turn sconce" "^Roundtime|^Turn what"
		gosub move 112
	}
	if "$zoneid" = "62" then 
	{
		gosub move 2
		gosub put.1 "prep teleport" "%prep.msg"
		pause 2
		gosub put.1 "cast %1" "%cast.msg"
		pause 2
	}

exit

include routinecommon.cmd