echo [This script brought to you by Kraggur]
echo [Start at Truffenyi's Green]

start:
counter set 0
match there receptacle
match error obvious
put look
matchwait


there:
move w
put go path
pause
move nw
move nw
move sw
move w
move w
move nw
move nw
move nw
move n
move w
move w
move sw
put go path
pause
move nw
put go door
pause
put go arch
pause
put go pool
pause
echo [Eluned's Temple]
pause 5

expcheck:
 pause
 match report mind lock
 match report dazed
 match report bewildered
 match report bewildering
 match swimdown EXP HELP
 counter add 1
 put exp skill swim
 matchwait

swimdown:
move d
move d
put go crevice
pause

swimup1:
put up
waitfor roundtime
match swimup1 rock protrudes
match swimup2 down from above
put look
matchwait

swimup2:
put up
waitfor roundtime
match swimup2 down from above
match swimup3 slate sign
put look
matchwait

swimup3:
echo [Waiting for a moment]
pause 5
put stand
goto expcheck

error:
echo [Not starting at Truffenyi's Green]
goto done

report:
 echo You swam "%1%" %c laps to get to mind lock.
 echo
 echo [Returing to Truffenyi's Green]
 pause 10

return:
put climb edge
pause
put go arch
pause
put climb step
pause
move se
move se
move ne
move e
move e
move s
move se
move se
move se
move e
move e
move ne
move se
move se
move e
move e

done:
echo [Completed]