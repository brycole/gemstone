debuglevel 10

action math list add 1;setvariable name1.%list $1;setvariable name2.%list $2;setvariable name3.%list $3;setvariable name4.%list $4 when ^(\w+)\s+(\w+)\s+(\w+)\s+(\w+)$
action math list add 1;setvariable name1.%list $1;setvariable name2.%list $2;setvariable name3.%list $3 when ^(\w+)\s+(\w+)\s+(\w+)\s+$
action math list add 1;setvariable name1.%list $1;setvariable name2.%list $2 when ^(\w+)\s+(\w+)\s+$
action math list add 1;setvariable name1.%list $1 when ^(\w+)\s+$
action setvar max.list %list when Staff on
action setvar guild $1 when Guild: (\w+)
action setvar circle $1 when Circle: (\w+)
action setvar stance $1 when PvP Stance: (\w+)

## stat tracking
action math closed add 1 when PvP Stance: Closed
action math guarded add 1 when PvP Stance: Guarded
action math open add 1 when PvP Stance: Open

put who full
waitfor Active Players

setvar z 0
setvar x 1
counter.add:
math z add 1

create.sub:
setvar guild 0
setvar circle 0
put profile %name%x.%z
match next PvP Stance
match endcheck I could not find
matchwait
next:
if %stance = "Closed" then setvar stance C
if %stance = "Guarded" then setvar stance G
if %stance = "Open" then setvar stance O
if %guild != 0 then
{
		if %guild = "Empath" then setvar guild Emp
		if %guild = "Cleric" then setvar guild Cle
		if %guild = "Moon" then setvar guild Mag
		if %guild = "Ranger" then setvar guild Rng
		if %guild = "Thief" then setvar guild Thi
		if %guild = "Warrior" then setvar guild War
		if %guild = "Paladin" then setvar guild Pal
		if %guild = "Necromancer" then setvar guild Nec
		if %guild = "Barbarian" then setvar guild Bar
		if %guild = "Trader" then setvar guild Tra
		if %guild = "Bard" then setvar guild Brd
}
## ELSE CHECK FOR GLOBAL NAME VARIABLES TO SET!!!!!!
## GLOBAL CIRCLE HERE

if ((%guild = 0) && (%circle = 0)) then 
{ 
	put #subs {\b%name%x.%z\b} {%name%x.%z(%stance)} {profilePVP}	
	goto endcheck
}
if ((%guild != 0) && (%circle != 0)) then
{
	put #subs {\b%name%x.%z\b} {%name%x.%z(%stance)(%guild)(%circle)} {profilePVP}
	goto endcheck
}
if ((%guild != 0) then
{
	put #subs {\b%name%x.%z\b} {%name%x.%z(%stance)(%guild)} {profilePVP}
}
else put #subs {\b%name%x.%z\b} {%name%x.%z(%stance)(%circle)} {profilePVP}
	
endcheck:
if %max.list = %z then goto name.shift
goto counter.add

name.shift:
math x add 1
setvar z 0
if %x > 4 then goto exit
goto counter.add

exit:
evalmath totalp (%closed + %guarded + %open)
evalmath cperc round(((%closed / %totalp) * 100), 2)
evalmath gperc round(((%guarded / %totalp) * 100), 2)
evalmath operc round(((%open / %totalp) * 100), 2)
echo Profile subs done!
echo Listing player breakdown by profile setting.
delay 1
echo $datetime
echo %totalp active players.
echo %closed closed players. These players make up %cperc% of total active counted.
echo %guarded guarded  players. These players make up %gperc% of total active counted.
echo %open open players. These players make up %operc% of total active counted.
echo Profile subs done!
echo Listing player breakdown by profile setting.
echo Logging...
#log 
#log $datetime
#log Break down by %.
#log %totalp active players.
#log %closed closed players. These players make up %cperc% of total active counted.
#log %guarded guarded  players. These players make up %gperc% of total active counted.
#log %open open players. These players make up %operc% of total active counted.
#log 
#log

