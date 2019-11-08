debuglevel 10

action math list add 1;setvariable name1.%list $1;setvariable name2.%list $2;setvariable name3.%list $3;setvariable name4.%list $4 when ^(\w+)\s+(\w+)\s+(\w+)\s+(\w+)$
action math list add 1;setvariable name1.%list $1;setvariable name2.%list $2;setvariable name3.%list $3 when ^(\w+)\s+(\w+)\s+(\w+)\s+$
action math list add 1;setvariable name1.%list $1;setvariable name2.%list $2 when ^(\w+)\s+(\w+)\s+$
action math list add 1;setvariable name1.%list $1 when ^(\w+)\s+$
action setvar max.list %list when Staff on

put who full
waitfor Active Players

setvar z 0
setvar x 1
counter.add:
math z add 1

put prep locate
pause 3
put cast %name%x.%z
match counter.add You gesture.
matchwait
