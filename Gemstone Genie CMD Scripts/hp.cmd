start:
put prep hp 2
put harness 2
pause
put cast %1
pause
if (%t >= %cut_time) then
{
	gosub put.1 "perf cut" "^Roundtime:|^You've"
	gosub cut.timer
}

goto start