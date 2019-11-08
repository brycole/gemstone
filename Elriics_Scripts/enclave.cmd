            #Enclave 11/03/05
 # -- This script was created by Kraelyst the Hand
 # -- Most current version of this script available at
 # -- http://www.lurksponge.com/travel

ECHO
ECHO ===============================
ECHO *** USAGE:  .enclave [pilot]
ECHO ===============================
ECHO

if_1 goto enclave
pause
ECHO
ECHO ======================
ECHO *** You must enter your PILOT NAME.  See usage above
ECHO ======================
ECHO
pause
EXIT

enclave:
save enclave
match har-enc moored to a sandy beach
match finish moored to the Sumilo dock
match finish moored to the Raenaden dock
match toenclave You glance
match pause ...wait
match pause type ahead
put look
put glance
matchwait

toenclave:
put command %1 to sail for Hara'jaal
match enclave Sailors quickly tie
match enclave barks the order to tie off
matchwait

har-enc:
put command %1 to launch
pause
ECHO
ECHO *** Estimated travel time by brig: 4 roisaen
ECHO
waitfor calls out, "Cast off!"
put command %1 to sail towards Tyvalger Bay
put command %1 to trim
save 2-har-enc
goto trim
2-har-enc:
pause 8
put command %1 to ease full
put command %1 to trim
put command %1 to trim
pause
put command %1 to trim
put command %1 to trim
3-har-enc:
pause 2
match 4-har-enc afloat in Tyvalger Bay
match 3-har-enc afloat in The Reshal Sea
match 3-har-enc ...wait
put look
matchwait
4-har-enc:
pause 2
match finish moored to the Sumilo dock
match finish moored to the Raenaden dock
match 4b-har-enc Tyvalger Bay (
match 4c-har-enc the open ocean (
match 4-har-enc ...wait
put look
matchwait
4b-har-enc:
pause
put command %1 to sail toward Tyvalger Bay
put command %1 to trim
put command %1 to trim
goto 4-har-enc
4c-har-enc:
pause
put command %1 to sail toward Raenaden dock
put command %1 to trim
goto 4-har-enc

echo =========================
trim:
pause
match trim sails to trim
match trim raising sail
match trim setting all yards
match pause working the ship to sail trim
match pause maximum capability
match trim ...wait
put command %1 to trim
put command %1 to trim
matchwait

ease:
pause
pause
put command %1 to ease full
put command %1 to trim
goto pause

pause:
pause
goto %s

finish:
pause
put set room
put set desc
pause
ECHO
ECHO *** You have arrived ***
ECHO
