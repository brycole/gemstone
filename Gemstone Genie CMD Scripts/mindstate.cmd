var sleep 0

start:
if ($MindState > 2) then put sleep
if ($MindState > 1) then {
pause
	if (%sleep = 0) then {
		put sleep
		var sleep 1
		}
}
else {
	if ($MindState = 0) then {
		if (%sleep = 1) then {
			put awaken
			var sleep 0
		}
	}
}
delay 10
goto start