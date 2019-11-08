If_1 goto 2
1:
put hum arpeg
put forage branch
  match 1 ...wait
  match foundone branch
  match 1 roundtime
 matchwait

foundone:
pause 1
put put my branch in my carry
  match foundone ...wait
  match 1 put your branch
  match 1 What were you referring to?
  match branchdone That's too heavy to go in there!
 matchwait

branchdone:
pause 1
pause 1
move go gate
move w
move w
move s
move s
move w
move w
move s
move w
move s
put s
wait
put s
wait
pause 1
move go baz

2:
put remove my carr
waitfor You take
put get my branch

gotbranch:
put give carry to mags
pause 1
put wear carry
pause 1
put put my branch in my carry
pause 1

donesell:
wait
move n
move n
put n
wait
put n
wait
pause 1
move e
move n
move e
move e
move n
move n
move e
move e
move go gate
goto 1


nomore:
Echo ***** 
Echo ***** YOU HAVE SOLD ALL THE BRANCHES YOU CAN.  TIME TO START TRADING FOR REAL
Echo ***** 
Echo ***** 
Echo ***** 
Echo *****