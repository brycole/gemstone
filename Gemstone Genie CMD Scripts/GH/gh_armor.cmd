##If the armor has a full name like gleaming silver armor, but the full noun for it is different
##If the armor has a full name like gleaming silver armor, but the full noun for it is different
## like gleaming armor, then set the armor name as an array ie. armor1_torso gleaming silver armor|gleaming armor
## set armor1 - armor7 as the type of armor you're using.  Must be hp lp hc lc bone leather cloth nothing
## armor3 - armor7 must be nothing if you're not using those types
## set the check variable to the area of armor you want the script to check to see which setup you're using
## IE.  If your chest armor stays the same, but your leg armor changes, set the check to legs
## set the pieces in each set up.  Leave them as nothing if you're not changing that piece.
##      VARIABLES
##You need to create 2 global variables.
##swap.learningrate	-	Number from 1 to 33  this is the learning rate at which the script will change armors.
##						This variable is REQUIRED
##swap.increaserate	-	Number from 1 - 333  This number is the amount the swap.learningrate
##						variable increase each time the swap script goes throug a set.  IE.  You set
##						swap.learningrate to 5, and swap.increaserate to 2.  Everytime the script changes from the
##						last armor to the first armor in the script, it will add 2 to swap.learningrate, up to a
##						maximum of 33.  Use this if you're training too small a number of armors for the
##						learning rate to drain down to 0 before it gets back to that armor.  This variable is OPTIONAL

gh_armor.start:
#put #var DA OFF
put #var GH_ARMOR.INCLUDE 1
var gh.counter %c
var gh.save %s
var armor.location armor pack

if "$charactername" = "Celeres" then
{
var armor1 leather
var armor2 hc
var armor3 lc
var armor4 lp
var armor5 bone
var armor6 nothing
var armor7 nothing
var check torso

#armor 1 pieces
var armor1_head nothing
var armor1_eyes nothing 
var armor1_neck nothing 
var armor1_torso leathers
var armor1_arms nothing
var armor1_hands nothing
var armor1_legs nothing

#armor 2 pieces
var armor2_head nothing
var armor2_eyes nothing
var armor2_neck nothing
var armor2_torso hauberk
var armor2_arms nothing
var armor2_hands nothing
var armor2_legs nothing

#armor 3 pieces
var armor3_head nothing
var armor3_eyes nothing
var armor3_neck nothing
var armor3_torso chain
var armor3_arms nothing
var armor3_hands nothing
var armor3_legs nothing

#armor 4 pieces
var armor4_head nothing
var armor4_eyes nothing
var armor4_neck nothing
var armor4_torso breastplate
var armor4_arms vambraces
var armor4_hands nothing
var armor4_legs greaves

#armor 5 pieces
var armor5_head nothing
var armor5_eyes nothing
var armor5_neck nothing
var armor5_torso bone armor
var armor5_arms nothing
var armor5_hands nothing
var armor5_legs nothing

#armor 6 pieces
var armor6_head nothing
var armor6_eyes nothing
var armor6_neck nothing
var armor6_torso nothing
var armor6_arms nothing
var armor6_hands nothing
var armor6_legs nothing

#armor 7 pieces
var armor7_head nothing
var armor7_eyes nothing
var armor7_neck nothing
var armor7_torso nothing
var armor7_arms nothing
var armor7_hands nothing
var armor7_legs nothing
}
if "$charactername" = "Maialen" then
{
var armor1 leather
var armor2 lc
var armor3 nothing
var armor4 nothing
var armor5 nothing
var armor6 nothing
var armor7 nothing
var check torso

#armor 1 pieces
var armor1_head nothing
var armor1_eyes nothing 
var armor1_neck nothing 
var armor1_torso leathers
var armor1_arms nothing
var armor1_hands nothing
var armor1_legs nothing

#armor 2 pieces
var armor2_head nothing
var armor2_eyes nothing
var armor2_neck nothing
var armor2_torso hauberk
var armor2_arms nothing
var armor2_hands nothing
var armor2_legs nothing

#armor 3 pieces
var armor3_head nothing
var armor3_eyes nothing
var armor3_neck nothing
var armor3_torso nothing
var armor3_arms nothing
var armor3_hands nothing
var armor3_legs nothing

#armor 4 pieces
var armor4_head nothing
var armor4_eyes nothing
var armor4_neck nothing
var armor4_torso nothing
var armor4_arms nothing
var armor4_hands nothing
var armor4_legs nothing

#armor 5 pieces
var armor5_head nothing
var armor5_eyes nothing
var armor5_neck nothing
var armor5_torso nothing
var armor5_arms nothing
var armor5_hands nothing
var armor5_legs nothing

#armor 6 pieces
var armor6_head nothing
var armor6_eyes nothing
var armor6_neck nothing
var armor6_torso nothing
var armor6_arms nothing
var armor6_hands nothing
var armor6_legs nothing

#armor 7 pieces
var armor7_head nothing
var armor7_eyes nothing
var armor7_neck nothing
var armor7_torso nothing
var armor7_arms nothing
var armor7_hands nothing
var armor7_legs nothing
}

if %armor1 = nothing then goto gh_armor.error
else
{
save 1
gosub %armor1
}
if %armor2 = nothing then goto gh_armor.error
else
{
save 2
gosub %armor2
put #var GH_ARMOR_TOTAL 2
}
if %armor3 = nothing then goto check
else
{
save 3
gosub %armor3
put #var GH_ARMOR_TOTAL 3
}
if %armor4 = nothing then goto check
else
{
save 4
gosub %armor4
put #var GH_ARMOR_TOTAL 4
}
if %armor5 = nothing then goto check
else
{
save 5
gosub %armor5
put #var GH_ARMOR_TOTAL 5
}
if %armor6 = nothing then goto check
else
{
save 6
gosub %armor6
put #var GH_ARMOR_TOTAL 6
}
if %armor7 = nothing then goto check
else
{
save 7
gosub %armor7
put #var GH_ARMOR_TOTAL 7
}
goto check

gh_armor.error:
put #echo gotta set at least 2 armor variables or else what's the point?
return

heavyplate:
heavy_plate:
hp:
var armor%s.skill Plate_Armor.LearningRate
return

lightplate:
light_plate:
lp:
var armor%s.skill Brigandine.LearningRate
return

heavychain:
heavy_chain:
hc:
var armor%s.skill Chain_Armor.LearningRate
return

lightchain:
light_chain:
lc:
var armor%s.skill Chain_Armor.LearningRate
return

leatherarmor:
leather_armor:
leather:
leat:
leath:
la:
var armor%s.skill Light_Armor.LearningRate
return

clotharmor:
cloth_armor:
cloth:
ca:
var armor%s.skill Light_Armor.LearningRate
return

nothing:
return

remove:
var location $1
var armor.temp %armor%s_%location
eval armor_count count("%armor.temp", "|"))
remove.remove:
if %armor_count = 1 then put remove my %armor.temp(1)
else
put remove my %armor.temp
waitforre (^You|^\.\.\.wait|^Sorry, you)
if matchre("$1", "...wait|^Sorry, you") then goto remove.remove
remove.stow:
if %armor_count = 1 then put stow my %armor.temp(1) in my %armor.location
else
put stow my %armor.temp in my %armor.location
waitforre (^You|^\.\.\.wait|^Sorry, you)
if matchre("$1", "...wait|^Sorry, you") then goto remove.stow
return

armor.wear:
var location $1
var armor.temp %armor%s_%location
eval armor_count count("%armor.temp", "|"))
wear.get:
if %armor_count = 1 then put get my %armor.temp(1) in my %armor.location
else
put get my %armor.temp in my %armor.location
waitforre (^You|^\.\.\.wait|^Sorry, you)
if matchre("$1", "...wait|^Sorry, you") then goto wear.get
wear.wear:
if %armor_count = 1 then put wear my %armor.temp(1)
else
put wear my %armor.temp
waitforre (^You|^The|^\.\.\.wait|^Sorry, you)
if matchre("$1", "...wait|^Sorry, you") then goto wear.wear
return


swap.retreat:
matchre swap.retreat ^\.\.\.wait|^Sorry
matchre return You retreat|You are
put retreat
matchwait 1
return

check:
put #echo *** check ***
put sort auto head
waitforre ^Your inventory
put inv
waitforre ^You are wearing (.+)
var wearing $1
pause .1
if matchre("%wearing", "%armor1_%check") then goto armor1
if matchre("%wearing", "%armor2_%check") then goto armor2
if matchre("%wearing", "%armor3_%check") then goto armor3
if matchre("%wearing", "%armor4_%check") then goto armor4
if matchre("%wearing", "%armor5_%check") then goto armor5
if matchre("%wearing", "%armor6_%check") then goto armor6
if matchre("%wearing", "%armor7_%check") then goto armor7
echo gh_armor check: match error
exit

gh_armor.start.2:
goto %swap.armormindlock

armor1:
save 1
var swap.armor armor1
put #statusbar 9 %armor1.skill
if $%armor1.skill >= $swap.learningrate then goto armor1mindlock
goto swap.done

armor1mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 1
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
save 2
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor2.skill
goto swap.done

armor2:
save 2
var swap.armor armor2.skill
put #statusbar 9 %armor2.skill
if $%armor2.skill >= $swap.learningrate then goto armor2mindlock
goto swap.done

armor2mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 2
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
if %armor3 = nothing then save 1
else
{
save 3
}
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor%s.skill
goto swap.done

armor3:
save 3
var swap.armor armor3.skill
put #statusbar 9 %armor3.skill
if $%armor3.skill >= $swap.learningrate then goto armor3mindlock
goto swap.done

armor3mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 3
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
if %armor4 = nothing then save 1
else
{
save 4
}
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor%s.skill
goto swap.done

armor4:
save 4
var swap.armor armor4.skill
put #statusbar 9 %armor4.skill
if $%armor4.skill >= $swap.learningrate then goto armor4mindlock
goto swap.done

armor4mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 4
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
if %armor5 = nothing then save 1
else
{
save 5
}
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor%s.skill
goto swap.done

armor5:
save 5
var swap.armor armor5.skill
put #statusbar 9 %armor5.skill
if $%armor5.skill >= $swap.learningrate then goto armor5mindlock
goto swap.done

armor5mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 5
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
if %armor6 = nothing then save 1
else
{
save 6
}
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor%s.skill
goto swap.done

armor6:
save 6
var swap.armor armor6.skill
put #statusbar 9 %armor6.skill
if $%armor6.skill >= $swap.learningrate then goto armor6mindlock
goto swap.done

armor6mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 6
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
if %armor7 = nothing then save 1
else
{
save 7
}
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor%s.skill
goto swap.done

armor7:
save 7
var swap.armor armor7.skill
put #statusbar 9 %armor7.skill
if $%armor7.skill >= $swap.learningrate then goto armor7mindlock
goto swap.done

armor7mindlock:
put #math GH_ARMOR_COUNT add 1
gosub swap.retreat
gosub swap.retreat
save 7
if "%armor%s_head" != "nothing" then gosub remove head
if "%armor%s_eyes" != "nothing" then gosub remove eyes
if "%armor%s_neck" != "nothing" then gosub remove neck
if "%armor%s_torso" != "nothing" then gosub remove torso
if "%armor%s_arms" != "nothing" then gosub remove arms
if "%armor%s_hands" != "nothing" then gosub remove hands
if "%armor%s_legs" != "nothing" then gosub remove legs
pause .1
save 1
if "%armor%s_head" != "nothing" then gosub armor.wear head
if "%armor%s_eyes" != "nothing" then gosub armor.wear eyes
if "%armor%s_neck" != "nothing" then gosub armor.wear neck
if "%armor%s_torso" != "nothing" then gosub armor.wear torso
if "%armor%s_arms" != "nothing" then gosub armor.wear arms
if "%armor%s_hands" != "nothing" then gosub armor.wear hands
if "%armor%s_legs" != "nothing" then gosub armor.wear legs
var swap.armor armor1.skill
goto swap.done

swap.done:
put #statusbar 9 %armor%s.skill
if %s = 1 then
{
put #math swap.learningrate add $swap.increaserate
if $swap.learningrate > 33 then put #var swap.learningrate 33
}
counter set %gh.counter
save %gh.save
pause
return