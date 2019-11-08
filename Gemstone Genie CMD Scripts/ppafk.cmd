start.pp:
gosub pp servant
gosub move 168;## sheep dog
gosub pp "sheep dog"
gosub pp puppy
gosub move 217;## ela
gosub pp "stablemaster ela"
gosub move 202;## birds
gosub pp falcon
gosub pp eagle
gosub pp "second eagle"
gosub pp "red-winged hawk"
gosub pp kestrel
gosub pp merlin
gosub move 206
goto end.pp
move:
put #var $lastmove $1
match RETURN YOU HAVE ARRIVED AT YOUR DESTINATION
put #mapper walk $1
matchwait

end.pp:
delay 450
goto start.pp

pp:
put perc $1
pause
pause .5
return

RETURN:
return