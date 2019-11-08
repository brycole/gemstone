#Weapon grinding.

var weapon %1

if_1 goto getweapon
echo Usage is: .grind <weapon>
exit

GetWeapon:
        pause
        pause 1
        send get %weapon in my bag
        match turnwheel You get
        match end What were you referring
        matchwait

TurnWheel:
        pause
        pause 1
        send turn grind
        match grindweapon keeping it spinning fast
        match turnwheel Roundtime:
        matchwait

GrindWeapon:
        pause
        pause 1
        send push grind with %weapon
        match finishweapon  pouring oil on it
        match grindweapon Roundtime:
        matchwait

FinishWeapon:
        pause
        pause 1
        send get oil
        send pour oil on %weapon
        pause
        pause 1
        send put oil in my bag
        send put %weapon in my bag
        

End:
        echo All weapons ground. Script complete.
        exit