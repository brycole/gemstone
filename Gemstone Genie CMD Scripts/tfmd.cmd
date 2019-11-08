 start:
put stop play
put rel
goto eshield
 
eshield:
put pre es
put charge my med 15
waitfor Roundtime
pause
put foc my med
waitfor Roundtime
pause
put cast
goto mof
 
mof:
put prep es
pause
put cast
put pre mof 10
put charge my bracer 15
waitfor Roundtime
pause
put foc my bracer
waitfor Roundtime
pause
put cast
goto checkmd
 
checkmd:
put exp skill arcana
match pm mind lock
match mof Time Development
matchwait
 
pm:
put prep es
pause
put cast
put prep mof
pause 2
put harn 10
waitfor Roundtime
pause
put harn 10
waitfor Roundtime
pause
put cast
goto checkpm
 
checkpm:
put exp skill pm
match done mind lock
match pm Time Development
matchwait
 
done:
exit 