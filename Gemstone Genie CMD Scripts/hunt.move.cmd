##debuglevel 10
goto hunt.end
hunt.room:
	action math ROOMNUMBER add 1 when ^To the .+:

	var ROOM8OCCUPIED FALSE
	var ROOM7OCCUPIED FALSE
	var ROOM6OCCUPIED FALSE
	var ROOM5OCCUPIED FALSE
	var ROOM4OCCUPIED FALSE
	var ROOM3OCCUPIED FALSE
	var ROOM2OCCUPIED FALSE
	var ROOM1OCCUPIED FALSE
	action var ROOM%ROOMNUMBEROCCUPIED TRUE when ^  \d+\)   \w+$|^  \d+\)   A hidden \w+$
	action var ROOM%ROOMNUMBEROCCUPIED TRUE when ^  --\)   Signs of something hidden from sight\.

	var ROOM8MOBS 0
	var ROOM7MOBS 0
	var ROOM6MOBS 0
	var ROOM5MOBS 0
	var ROOM4MOBS 0
	var ROOM3MOBS 0
	var ROOM2MOBS 0
	var ROOM1MOBS 0

	action math ROOM%ROOMNUMBERMOBS add 1 when ^  \d+\)   (a|an).+($mob1|$mob2|$mob3)
	action var ROOM%ROOMNUMBERTARGET $1 when ^  (\d+)\)

	var ROOMNUMBER 0
	gosub put.1 "hunt" "^Roundtime:|^You find yourself unable to"

	action remove ^To the .+:
	action remove ^  \d+\)   \w+$|^  \d+\)   A hidden \w+$
	action remove ^  --\)   Signs of something hidden from sight\.
	action remove ^  \d+\)   (a|an) thunder ram
	action remove ^  (\d+)\)

	if "%ROOM8OCCUPIED" = "TRUE" then var ROOM8MOBS 0
	if "%ROOM7OCCUPIED" = "TRUE" then var ROOM7MOBS 0
	if "%ROOM6OCCUPIED" = "TRUE" then var ROOM6MOBS 0
	if "%ROOM5OCCUPIED" = "TRUE" then var ROOM5MOBS 0
	if "%ROOM4OCCUPIED" = "TRUE" then var ROOM4MOBS 0
	if "%ROOM3OCCUPIED" = "TRUE" then var ROOM3MOBS 0
	if "%ROOM2OCCUPIED" = "TRUE" then var ROOM2MOBS 0
	if "%ROOM1OCCUPIED" = "TRUE" then var ROOM1MOBS 0

	var BESTMOBCOUNT 0
	var ROOMNUMBER 0
	if %ROOM8MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM8MOBS
		var ROOMNUMBER %ROOM8TARGET
	}
	if %ROOM7MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM7MOBS
		var ROOMNUMBER %ROOM7TARGET
	}
	if %ROOM6MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM6MOBS
		var ROOMNUMBER %ROOM6TARGET
	}
	if %ROOM5MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM5MOBS
		var ROOMNUMBER %ROOM5TARGET
	}
	if %ROOM4MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM4MOBS
		var ROOMNUMBER %ROOM4TARGET
	}
	if %ROOM3MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM3MOBS
		var ROOMNUMBER %ROOM3TARGET
	}
	if %ROOM2MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM2MOBS
		var ROOMNUMBER %ROOM2TARGET
	}
	if %ROOM1MOBS > %BESTMOBCOUNT then
	{
		var BESTMOBCOUNT %ROOM1MOBS
		var ROOMNUMBER %ROOM1TARGET
	}
	if %ROOMNUMBER = 0 then goto RANDOM_MOVE

	HUNT_MOVE:
			if contains("$roomobjs", "%lxammo")) then
			{
				gosub put.1 "stow %lxammo.short" "^You put"	
				goto HUNT_MOVE
			}
			if $room.bound != 0 then
			{
				if matchre("$room.bound", "$roomid") then
				{
				put #goto $zoneb
				waitfor @walk done.
				goto CHECK_OCCUPIED
				}
			}
			if contains("$roomobjs", "a rock")) then gosub put.1 "stow rock" "^You put|^Stow"	
			matchre HUNT_MOVE %rt.com
			matchre RANDOM_MOVE lumpy bundle|pyramid|dense unnatural fog|ogre
			matchre RANDOM_MOVE You don't have that target currently available|Your prey seems to have completely vanished|You were unable to locate|The traces
			matchre RANDOM_MOVE ^Also here
			matchre hunt.engaged You'll need to disengage first|While in combat\?
			matchre FOUND_ROOM Obvious
		put hunt %ROOMNUMBER
		matchwait
	
	hunt.engaged:
	gosub retreat.start
	goto HUNT_MOVE
		
	RANDOM_MOVE:
		delay .5
		var exits 0
		if $north = 1 then math exits add 1
		if $northeast = 1 then math exits add 1
		if $east = 1 then math exits add 1
		if $southeast = 1 then math exits add 1
		if $south = 1 then math exits add 1
		if $southwest = 1 then math exits add 1
		if $west = 1 then math exits add 1
		if $northwest = 1 then math exits add 1
		if $up = 1 then math exits add 1
		if $down = 1 then math exits add 1
		if (%exits = 0) then 
        {
			if matchre("$roomexits", "(north|south|east|west|northeast|northwest|southeast|southwest|up|down)(,|$)") then 
			{
				var fogexit $1
				delay 1
				gosub walk %fogexit
				goto CHECK_OCCUPIED
			}
		}
		
		random 1 10
		var move_cycles 0
		goto MOVE_%r

	MOVE_1:
		if ($north = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "south")) then
			{
				var direction north
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction north
				goto GOOD_DIRECTION
			}			
		}
	MOVE_2:
		if ($northeast = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "southwest")) then
			{
				var direction northeast
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction northeast
				goto GOOD_DIRECTION
			}
		}
	MOVE_3:
		if ($east = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "west")) then
			{
				var direction east
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction east
				goto GOOD_DIRECTION
			}
		}
	MOVE_4:
		if ($southeast = 1) then
		{
			if ((%exits > 1) and (("%lastdirection" != "northwest")) then
			{
				var direction southeast
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction southeast
				goto GOOD_DIRECTION
			}
		}
	MOVE_5:
		if ($south = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "north")) then
			{
				var direction south
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction south
				goto GOOD_DIRECTION
			}
		}
	MOVE_6:
		if ($southwest = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "northeast")) then
			{
				var direction southwest
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction southwest
				goto GOOD_DIRECTION
			}
		}
	MOVE_7:
		if ($west = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "east")) then
			{
				var direction west
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction west
				goto GOOD_DIRECTION
			}
		}
	MOVE_8:
		if ($northwest = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "southeast")) then
			{
				var direction northwest
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction northwest
				goto GOOD_DIRECTION
			}
		}
	MOVE_9:
		if ($up = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "down")) then
			{
				var direction up
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction up
				goto GOOD_DIRECTION
			}
		}
	MOVE_10:
		if ($down = 1) then
		{
			if ((%exits > 1) && ("%lastdirection" != "up")) then
			{
				var direction down
				goto GOOD_DIRECTION
			} elseif (%exits = 1) then
			{
				var direction down
				goto GOOD_DIRECTION
			}
		}
	if (%move_cycles <= 5) then
	{
		math move_cycles add 1
		goto MOVE_1
	} else goto RANDOM_MOVE
GOOD_DIRECTION:
	var lastdirection %direction
	MOVING:
	if contains("$roomobjs", "%lxammo")) then
	{
		gosub put.1 "stow %lxammo.short" "^You put"	
		goto MOVING
	}
	if contains("$roomobjs", "a rock")) then gosub put.1 "stow rock" "^You put|^Stow"	
	if $room.bound != 0 then
	{
		if matchre("$room.bound", "$roomid") then
		{
			put #goto $zoneb
			waitfor @walk done.
			goto CHECK_OCCUPIED
		}
	}
			matchre MOVING %rt.com
			matchre RANDOM_MOVE lumpy bundle|pyramid|dense unnatural fog|ogre
			matchre RANDOM_MOVE ^Also here
			matchre engaged.walk You are engaged
			matchre FOUND_ROOM ^Obvious
		put %direction
		matchwait 10
		goto CHECK_OCCUPIED
FOUND_ROOM:
	echo
	echo *** FOUND_ROOM: ***
	echo
	put #var pp 0
	if matchre("$room.bound", "$roomid") then
				{
				put #goto $zoneb
				waitfor @walk done.
				goto CHECK_OCCUPIED
				}
	put #var empty.room 1
	goto target.find
engaged.walk:
gosub retreat.start	
goto MOVING
CHECK_OCCUPIED:
	if ("$roomplayers" = "") then goto FOUND_ROOM
	else
	{
		put #var empty.room 0
		gosub retreat.start
		goto RANDOM_MOVE
	}
goto target.find
hunt.end:
