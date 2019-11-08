action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action put path focus conserv when ^You so heavily 

counter set 0

put mutter summoning
put path focus conserv

CONC:
pause
send concentrate
match top You sense the Gauge Flow
match CASTGAF Roundtime
matchwait

top:
pause 1
send research %1 300
pause 1
send summon admitt
pause 1
send conc
pause 1
goto top



CASTGAF:
pause 1
send prep GAF 50
pause 1
send charge man 50
pause 1
send invoke man spell
waitfor You feel fully prepared to cast your spell.
pause 1
send cast
match top A distracting flurry of fiery mana momentarily blinds you.  As your eyes adjust, you notice local fluctuations in mana are being represented by burning graphs and sigils in the corners of your sight.
match CASTGAF Currently lacking the skill to complou e the pattern, your spell fails completely.
match CASTGAF backfires
matchwait
