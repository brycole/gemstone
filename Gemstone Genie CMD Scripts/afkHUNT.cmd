startafk:
matchre talk kurav|Kurav
matchre talk erades|Erades
matchre talk says|explains|whispers,|You hear the voice
matchre asks asks
matchre endafk SEND
matchwait
 
exit:
delay 5
put quit
exit
 
asks:
put grunt
delay 1
put say Naw.
matchre talk2 says|explains|asks|whispers,|You hear the voice 
matchwait 300
goto startafk
 

talk:
put say Hiya.
delay 2
put smile
matchre talk2 says|explains|whispers,|You hear the voice 
matchwait 300
goto startafk
 
talk2:
put ponder
delay 3
put say Hmm.
delay 5
put grunt
delay 15
matchre talk3 says|explains|asks|whispers,|You hear the voice 
matchwait 300
goto startafk
 
talk3:
matchre endafk says|explains|asks|whispers,|You hear the voice 
matchwait 300
goto startafk
 
endafk:
pause
pause
put grunt
put #script abort geniehunter
put wear khuj
delay 2
put sheath blade
delay 2
put wear khuj
delay 2
put say Gotta run! See ya.
put quit
put #mapper
put look
pause
if $north = 1 then gosub mapmove n
if $northeast = 1 then gosub mapmove ne
if $east = 1 then gosub mapmove e
if $southeast = 1 then gosub mapmove se
if $south = 1 then gosub mapmove s
if $southwest = 1 then gosub mapmove sw
if $west = 1 then gosub mapmove w
if $northwest = 1 then gosub mapmove nw
if $up = 1 then gosub mapmove u
if $down = 1 then gosub mapmove d
 mapmove:
put retreat
put retreat
move $1
delay 2
send .link
exit 
 
put #mapper walk 126
waitfor @walk done.
send .idle
##put hide
##delay 300
##put info
##delay 300
##send .link