	action put exit when dead
	action put exit when stunned
	action var Boat Galley when ^The galley.*glides into the dock
	action var Boat Degan when ^The Degan ties off to the
	action var Dock Pier when ^Captain.*barks the order to tie off the Degan to the pier
	action var Dock Dock when ^The galley.* reaches the dock.  The crew ties it off and runs out the gangplank
	var Boat None
	var Dock None
	var monitor no
	gosub routinecommon


	put .afk
	if_1 goto BoatLoop
	DockLoop:
	pause 5
	if %Boat = Galley then gosub put go galley
	if %Boat = Degan then gosub put go degan
	if %Boat = None then goto DockLoop

	BoatLoop:
	pause 5
	if %Dock = Dock then gosub put go dock
	if %Dock = Pier then
		{
		if contains("$roomobjs", "Fever Point") then gosub put go point
		if contains("$roomobjs", "Acenamacra Pier") then gosub put go pier
		if contains("$roomobjs", "the beach") then gosub put go beach
		}
	if %Dock = None then goto BoatLoop








	put hide
	pause 3
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 60
	pause 1
	put quit
	exit








include routinecommon.cmd