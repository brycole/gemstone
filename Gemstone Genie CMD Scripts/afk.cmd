debuglevel 10

startafk:
matchre talk says|explains,|whispers,|You hear the voice
matchre asks asks
matchre endafk SEND
matchwait

exit:
delay 5
put hide
pause
pause
send .afkpowerp
exit

asks:
put smile
put Hmmm.
delay 15
matchre talk2 says|explains,|asks|whispers,|You hear the voice 
matchwait 300
goto startafk


talk:
put say hiya
delay 10
put nod
matchre talk2 says|explains,|whispers,|You hear the voice 
matchwait 300
goto startafk

talk2:
put ponder
delay 5
matchre talk3 says|explains,|asks|whispers,|You hear the voice 
matchwait 300
goto startafk

talk3:
put say It's fien.
delay 1
put say fine.
delay 10
matchre endafk says|explains,|asks|whispers,|You hear the voice 
matchwait 300
goto startafk

endafk:
put #script abort all except afkk
pause
pause
put say Gotta run
move go gate
put enc
match exit Encumbrance :
matchwait 70
delay 3
put quit
exit
