goto retreat.end
retreat.start:

retreatm:
pause
put retreat
matchre pole You retreat
matchre cont1 You are already
match retreatm Roundtime
matchwait 5

poler:
pause
pole:
put retreat
matchre cont1 You retreat|You are already
match poler Roundtime
matchwait 5

cont1:
return

retreat.end: