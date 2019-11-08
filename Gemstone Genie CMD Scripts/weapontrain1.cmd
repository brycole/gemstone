##debuglevel 10

include base.cmd

goto start.1

start.1:
put #var mob1 leucro
put #var mob2 viper
put #var mob3 marauder
put #var ritual preserve
##put #var room.bound 12|2
##put #var zoneb 7

start:
gosub put.1 "dodge" "^Roundtime:|But you are"
send .ambushcheck
gosub ss combat %1 thana
goto end

end:
put #parse weapontrain1.cmd done.
exit