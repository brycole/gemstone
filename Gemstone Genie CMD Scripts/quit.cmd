##action goto exit when just arrived.
matchre exit kurav|Kurav
##matchre exit stoh|Stoh
matchre exit says|explains|whispers|You hear the voice 
matchre exit SEND
matchwait

exit:
Echo WORKS!
goto %1
delay 500

1:
put wear khuj
pause
put smile
wait 5
put wave
put say I gotta run! Have fun.
delay %2
put get bundle
pause
put get bundle
pause
put get bundle
pause
put quit
put quit
put quit
exit

2:
put smile
wait 2
put say How is everything?
wait 10
waitforre says|explains|asks|whispers
delay 1
put say mmm.... good.
waitforre says|explains|asks|whispers
delay 5
put say gotta run for a bit.
put quit
exit