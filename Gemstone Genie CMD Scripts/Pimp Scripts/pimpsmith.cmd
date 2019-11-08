


     if_1 goto setautolink

put #window add pimpSMITH


settings:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **


put #statusbar _P_______
pause 0.15
put #statusbar ___I_____
pause 0.15
put #statusbar _____M___
pause 0.15
put #statusbar _______P_
pause 0.15
put #statusbar _P_I_M_P_
pause 0.15
put #statusbar _P_I_M_P_ smith
pause 0.15
put #statusbar _P_I_M_P_ Smith
pause 0.15
put #statusbar _P_I_M_P_ SMith
pause 0.15
put #statusbar _P_I_M_P_ SMIth
pause 0.15
put #statusbar _P_I_M_P_ SMITh
pause 0.15
put #statusbar _P_I_M_P_ SMITH
pause 0.15
put #statusbar _P_I_M_P_SMITH
pause 0.15
put #statusbar _P_I_MP_SMITH
pause 0.15
put #statusbar _P_IMP_SMITH
pause 0.15
put #statusbar _PIMP_SMITH
pause 0.15
put #statusbar _PIMP/SMITH
pause 0.15
put #statusbar _PIMP|SMITH
pause 0.15
put #statusbar _PIMP|SMITH|
pause 0.15
put #statusbar _PIMP|SMITH/
pause 0.15
put #statusbar _PIMp|SMITH/
pause 0.15
put #statusbar _PImp|SMITH/
pause 0.15
put #statusbar _Pimp|SMITH/
pause 0.15
put #statusbar _pimp|SMITH_
pause 0.15



     goto failedlink


setautolink:
     matchre autolink (Blacksmithing|Weaponsmithing|Armorsmithing) (Easy|Challenging|Hard) (\w+) (on|off) (on|off) (\d+)
put #parse %0
put echo %0
     matchwait 3
     goto failedlink
autolink:
     echo Quick Start Enabled
     var worktype $1
     var difficulty $2
     var material $3
     var repairs $4
     var stamp $5
     var max-volume-limit $6

     goto goodsetup
failedlink:
     if_1 echo To use autostart you must type .pimpsmith Worktype Difficulty Material repairs stamp MAXVOLUME
     if_1 echo Example : .pimpsmith Weaponsmithing Hard Bronze on on 40
put #echo >pimpSMITH Aqua --- Work Type ---
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Armorsmithing} {#parse SET Armorsmithing}
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Weaponsmithing} {#parse SET Weaponsmithing}
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Blacksmithing} {#parse SET Blacksmithing}
     waitforre SET (\w+)
     var worktype $1
     pause 0.1
     
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Work Difficulty ---
put #echo >pimpSMITH
     pause 0.1
put #link >pimpSMITH {Easy} {#parse SET Easy}
put #echo >pimpSMITH
     pause 0.1
put #link >pimpSMITH {Challenging} {#parse SET Challenging}
put #echo >pimpSMITH
     pause 0.1
put #link >pimpSMITH {Hard} {#parse SET Hard}
     waitforre SET (\w+)
     var difficulty $1
materialopt1:
     pause 0.1
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Material ---
put #echo >pimpSMITH
     pause 0.1
put #link >pimpSMITH {Bronze or Bronze-Alloy} {#parse SET Bronze}
put #link >pimpSMITH {Brass or Brass-Alloy} {#parse SET Brass}
put #link >pimpSMITH {Pewter or Pewter-Alloy} {#parse SET Pewter}
put #link >pimpSMITH {Steel or Steel-Alloy} {#parse SET Steel}
put #link >pimpSMITH {Iron or Iron-Alloy} {#parse SET Iron}
put #link >pimpSMITH {Tin or Tin-Alloy} {#parse SET Tin}
put #link >pimpSMITH {Copper or Copper-Alloy} {#parse SET Copper}
put #echo >pimpSMITH
     pause 0.1
     put #link >pimpSMITH {More Material Types} {#parse MORE TYPES}
     matchre materialset SET (\w+)
     match materialopt2 MORE TYPES
     matchwait

materialopt2:
     pause 0.1
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Material ---
put #echo >pimpSMITH
     pause 0.1
put #link >pimpSMITH {Zinc or Zinc-Alloy} {#parse SET Zinc}
put #link >pimpSMITH {Lead or Lead-Alloy} {#parse SET Lead}
put #link >pimpSMITH {Nickel or Nickel-Alloy} {#parse SET Nickel}
put #link >pimpSMITH {Lumium or Lumium-Alloy} {#parse SET Lumium}
put #link >pimpSMITH {Niniam or Niniam-Alloy} {#parse SET Niniam}
put #link >pimpSMITH {Gold or Gold--Alloy} {#parse SET Gold}
put #link >pimpSMITH {Silver or Silver-Alloy} {#parse SET Silver}
put #echo >pimpSMITH
     pause 0.1
     put #link >pimpSMITH {More Material Types} {#parse MORE TYPES}
     matchre materialset SET (\w+)
     match materialopt3 MORE TYPES
     matchwait

materialopt3:
     pause 0.1
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Material ---
put #echo >pimpSMITH
     pause 0.1
put #link >pimpSMITH {Platinum or Platinum-Alloy} {#parse SET Platinum}
put #link >pimpSMITH {Electrum or Electrum-Alloy} {#parse SET Electrum}
put #link >pimpSMITH {Animite or Animite-Alloy} {#parse SET Animite}
put #link >pimpSMITH {Oravir or Oravir-Alloy} {#parse SET Oravir}
put #link >pimpSMITH {Covellite or Covellite-Alloy} {#parse SET Covellite}
     pause 0.1
put #echo >pimpSMITH
put #echo >pimpSMITH
put #echo >pimpSMITH
     pause 0.1
     put #link >pimpSMITH {More Material Types} {#parse MORE TYPES}
     matchre materialset SET (\w+)
     match materialopt1 MORE TYPES
     matchwait

materialset:
     var material $1
     pause 0.1
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Repairs ---
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Auto Repair Tools ON} {#parse SET on}
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Auto Repair Tools OFF} {#parse SET off}
     waitforre SET (\w+)
     var repairs $1
     pause 0.1


put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Marking ---
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Stamp Items} {#parse SET on}
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Do Not Stamp Items} {#parse SET off}
     waitforre SET (\w+)
     var stamp $1
volopt1:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {20} {#parse SET 20}
put #link >pimpSMITH {30} {#parse SET 30}
put #link >pimpSMITH {40} {#parse SET 40}
put #link >pimpSMITH {50} {#parse SET 50}
put #link >pimpSMITH {60} {#parse SET 60}
put #link >pimpSMITH {70} {#parse SET 70}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt2 MORE
     matchwait
volopt2:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {80} {#parse SET 80}
put #link >pimpSMITH {90} {#parse SET 90}
put #link >pimpSMITH {100} {#parse SET 100}
put #link >pimpSMITH {110} {#parse SET 110}
put #link >pimpSMITH {120} {#parse SET 120}
put #link >pimpSMITH {130} {#parse SET 130}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt3 MORE
     matchwait
volopt3:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {140} {#parse SET 140}
put #link >pimpSMITH {150} {#parse SET 150}
put #link >pimpSMITH {160} {#parse SET 160}
put #link >pimpSMITH {170} {#parse SET 170}
put #link >pimpSMITH {180} {#parse SET 180}
put #link >pimpSMITH {190} {#parse SET 190}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt4 MORE
     matchwait
volopt4:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {200} {#parse SET 200}
put #link >pimpSMITH {210} {#parse SET 210}
put #link >pimpSMITH {220} {#parse SET 220}
put #link >pimpSMITH {230} {#parse SET 230}
put #link >pimpSMITH {240} {#parse SET 240}
put #link >pimpSMITH {250} {#parse SET 250}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt5 MORE
     matchwait
volopt5:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {260} {#parse SET 260}
put #link >pimpSMITH {270} {#parse SET 270}
put #link >pimpSMITH {280} {#parse SET 280}
put #link >pimpSMITH {290} {#parse SET 290}
put #link >pimpSMITH {300} {#parse SET 300}
put #link >pimpSMITH {310} {#parse SET 310}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt6 MORE
     matchwait
volopt6:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {320} {#parse SET 320}
put #link >pimpSMITH {330} {#parse SET 330}
put #link >pimpSMITH {340} {#parse SET 340}
put #link >pimpSMITH {350} {#parse SET 350}
put #link >pimpSMITH {360} {#parse SET 360}
put #link >pimpSMITH {370} {#parse SET 370}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt7 MORE
     matchwait
volopt7:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {380} {#parse SET 380}
put #link >pimpSMITH {390} {#parse SET 390}
put #link >pimpSMITH {400} {#parse SET 400}
put #link >pimpSMITH {410} {#parse SET 410}
put #link >pimpSMITH {420} {#parse SET 420}
put #link >pimpSMITH {430} {#parse SET 430}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt8 MORE
     matchwait
volopt8:
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Maximum Volume ---
put #echo >pimpSMITH Maximum Allowable Volume Per Work Order
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {440} {#parse SET 440}
put #link >pimpSMITH {450} {#parse SET 450}
put #link >pimpSMITH {460} {#parse SET 460}
put #link >pimpSMITH {470} {#parse SET 470}
put #link >pimpSMITH {480} {#parse SET 480}
put #link >pimpSMITH {490} {#parse SET 490}
put #link >pimpSMITH {500} {#parse SET 500}
put #link >pimpSMITH {More} {#parse MORE}
     matchre vollimit SET (\d+)
     match volopt1 MORE
     matchwait

vollimit:
     var max-volume-limit $1
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH Aqua --- Settings Display ---
put #echo >pimpSMITH
put #echo >pimpSMITH You have chosen to do :
put #echo >pimpSMITH %difficulty %worktype from %material
put #echo >pimpSMITH Maximum Allowable Volume : %max-volume-limit
     if "%stamp" = "on" then put #echo >pimpSMITH You have chosen to stamp finished items.
     if "%stamp" = "off" then put #echo >pimpSMITH You have chosen not to stamp finished items.
put #echo >pimpSMITH Auto Self Repair : %repairs
put #echo >pimpSMITH
put #echo >pimpSMITH Is this all correct?
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {Yes} {#parse SET YES}
     pause 0.1
put #echo >pimpSMITH
put #link >pimpSMITH {No} {#parse SET NO}
     waitforre SET (\w+)
     if "$1" = "NO" then goto settings
goodsetup:

     var master nil
     if "$zonename" = "The Crossing" then gosub move 6
     if "$zonename" = "The Crossing" then move go building
     if "$zonename" = "The Crossing" then pause

     if "$zonename" = "Crossing Crafting Societies" then var forges 21|22|23
     if "$zonename" = "Crossing Crafting Societies" then var grindstones 17|18
     if "$zonename" = "Crossing Crafting Societies" then var supplies 14
     if "$zonename" = "Crossing Crafting Societies" then var huntroom 13|13|13
     if "$zonename" = "Crossing Crafting Societies" then var master Yalda

     if "$zonename" = "Crossing Forging Society" then var forges 21|22|23
     if "$zonename" = "Crossing Forging Society" then var grindstones 17|18
     if "$zonename" = "Crossing Forging Society" then var supplies 14
     if "$zonename" = "Crossing Forging Society" then var huntroom 13|13|13
     if "$zonename" = "Crossing Forging Society" then var master Yalda

     if "$zonename" = "The Crossing" then var forges 921|922|923
     if "$zonename" = "The Crossing" then var grindstones 919|918
     if "$zonename" = "The Crossing" then var supplies 917
     if "$zonename" = "The Crossing" then var huntroom 913|913|913
     if "$zonename" = "The Crossing" then var master Yalda

     if "$zonename" = "Riverhaven" then var forges 35|403|405|407|409
     if "$zonename" = "Riverhaven" then var grindstones 35|403|405|407|409
     if "$zonename" = "Riverhaven" then var supplies 399
     if "$zonename" = "Riverhaven" then var huntroom 399|399|399
     if "$zonename" = "Riverhaven" then var master Fereldrin

     if "$zonename" = "Shard" then var forges 657|652|648|660
     if "$zonename" = "Shard" then var grindstones 657|652|648|660
     if "$zonename" = "Shard" then var supplies 653
     if "$zonename" = "Shard" then var huntroom 645|653|646
     if "$zonename" = "Shard" then var master Serric

     if "$zonename" = "Hibarnhvidar" then var forges 416|417|418|419
     if "$zonename" = "Hibarnhvidar" then var grindstones 418|419
     if "$zonename" = "Hibarnhvidar" then var supplies 413
     if "$zonename" = "Hibarnhvidar" then var huntroom 408|417|410
     if "$zonename" = "Hibarnhvidar" then var master Juln

    if "$zonename" = "Mer'Kresh" then var forges 348|347|346|345|344
    if "$zonename" = "Mer'Kresh" then var grindstones 348|347|346|345
    if "$zonename" = "Mer'Kresh" then var supplies 336
    if "$zonename" = "Mer'Kresh" then var huntroom 335|345|345
    if "$zonename" = "Mer'Kresh" then var master Kapric

    if "$zonename" = "Ratha" then var forges 831|832|830
    if "$zonename" = "Ratha" then var grindstones 822|821|823
    if "$zonename" = "Ratha" then var supplies 819
    if "$zonename" = "Ratha" then var huntroom 819|819|819
    if "$zonename" = "Ratha" then var master Grimbly


     if "$zonename" = "Northern Trade Road" then var forges 781|785|784|783
     if "$zonename" = "Northern Trade Road" then var grindstones 782|754|786
     if "$zonename" = "Northern Trade Road" then var supplies 777
     if "$zonename" = "Northern Trade Road" then var huntroom 781|781|781
     if "$zonename" = "Northern Trade Road" then var master Borneas

     if "%master" = "nil" then goto startuperror
     

     
put skill app
     waitforre Appraisal: *(\d+)
     var AppRanks $1

put whisper group TESTING
     matchre setgroup You whisper to (.+), "TESTING
     match nogroup You have no group
     matchwait
nogroup:
     var grouped Christopher Hitchens|Neil Degrass Tyson
     goto groupdone
setgroup:
     pause
     var grouped $1
     eval grouped replacere("%grouped", " and", ",")
     eval grouped replacere("%grouped", " ,", ",")
     eval grouped replacere("%grouped", ",", "|")
     eval listCount count("%grouped","|")
     if %listCount = 0 then var grouped %grouped|Christopher Hitchens|Neil Degrass Tyson
groupdone:
     action instant setvariable test-item $2 when This logbook is tracking a work order requiring you to craft (a|an|some) metal (.+) from
     action instant setvariable quantity $1 when You must bundle and deliver (\d+) more within
     action setvariable finished 1 when Applying the final touches, you complete working on
     action setvariable cool 1 when (appears ready for cooling in the slack tub|complete and ready for a quench hardening in the slack)
     action setvariable just.stow 1 when Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2
     action setvariable left-overs 1 when so you split the ingot and leave the portion you won't be using on the ground
     action instant math coin-intake add $1 when You hand .* your logbook and bundled items, and are given (\d+)
     action instant math coin-intake subtract $1 when pay the sales clerk (\d+)
     action instant setvariable oil-gone 1 when The oil is all used up, so you toss
     setvariable finishmode 0
     action instant setvariable finishmode 1;put #echo skyblue [ Finish Mode Toggled ON ] when END PIMPSMITH
     setvariable oil-gone 0
     setvariable total-items-made 0
     setvariable total-volume-used 0
     setvariable coin-intake 0
     setvariable total-workorders 0
     setvariable displaytracker 0
     
     action instant setvariable app.focus 1 when you think that you've grasped a new approach for the subtleties of
     action instant setvariable app.focus 0 when focused insight of .* has been fully explored
     var app.focus 0     

     if "$lefthand" != "Empty" then gosub verb stow left
     if "$righthand" != "Empty" then gosub verb stow right


     gosub verb get my forg logbook
loop:
     var looptrack 0
     gosub display
     if %finishmode = 1 then put #statusbar .
     if %finishmode = 1 then gosub display3
     if %finishmode = 1 then put #window remove pimpSMITH
     if %finishmode = 1 then exit
     put #statusbar Getting Work Order ...
     gosub get-work
     put #statusbar Checking Work Order ...
     gosub read-logbook
     put #statusbar Locating Item In Book ...
     gosub getpage
     put #statusbar Checking Assembled Parts ...
     gosub checkassembly
     if "$lefthand" != "Empty" then gosub verb stow left
     if "$righthand" != "Empty" then gosub verb stow right
     gosub check-volume
     if %temp1 > %max-volume-limit then goto loop
looping:
     math looptrack add 1
     put #statusbar Buying Assembled Parts ...
     gosub buy-assembly
refind-forge:
     put #statusbar Locating Empty Forge ...
     gosub find-forge
     put #statusbar Pounding %item (%looptrack of %quantity)...
     gosub pounding
     if %used-anvil = 1 then goto refind-forge
     put #statusbar Assembling %item (%looptrack of %quantity)...
     gosub assembling
     if "%worktype" = "Weaponsmithing" then put #statusbar Locating Grindstone ...
     if "%worktype" = "Weaponsmithing" then gosub find-grindstone
     if "%worktype" = "Weaponsmithing" then put #statusbar Grinding %item (%looptrack of %quantity)...
     if "%worktype" = "Weaponsmithing" then gosub grinding
     put #statusbar Finishing %item (%looptrack of %quantity)...
     gosub oil-item
     if "%stamp" = "on" then put #statusbar Marking %item (%looptrack of %quantity)...
     if "%stamp" = "on" then gosub stamp
     put #statusbar Bundling %item (%looptrack of %quantity)...
     gosub bundle
     math total-items-made add 1
     math total-volume-used add %volume
     gosub display
     math temp-quantity subtract 1
     if %temp-quantity > 0 then goto looping
     put #statusbar Turning In Logbook ...
     gosub turn-in
     put #statusbar Complete!
     math total-workorders add 1
     if_1 goto exp.check.stuff
     goto loop
     
exp.check.stuff:
     pause 0.1
put skill forging
     waitforre (\d+)/34
     if $1 > 32 then goto user.finish
     goto loop
     
user.finish:
echo Mind Locked
put #parse MOD DONE SCRIPT DONE
     exit

check-volume:
     var temp1 %volume
     math temp1 multiply %quantity
     echo . [ Volume Per Item : %volume - Quantity Desire : %quantity ]
     echo . [ Total Volume Consumed Will Be %temp1 ]
     if %temp1 > %max-volume-limit then put #statusbar Volume Over Allowable Limit ...
     if %temp1 > %max-volume-limit then pause 5
     if %temp1 > %max-volume-limit then put #statusbar Getting New Work Order In 30 Seconds ...
     if %temp1 > %max-volume-limit then pause 5
     if %temp1 > %max-volume-limit then put #statusbar Getting New Work Order In 25 Seconds ...
     if %temp1 > %max-volume-limit then pause 5
     if %temp1 > %max-volume-limit then put #statusbar Getting New Work Order In 20 Seconds ...
     if %temp1 > %max-volume-limit then pause 5
     if %temp1 > %max-volume-limit then put #statusbar Getting New Work Order In 15 Seconds ...
     if %temp1 > %max-volume-limit then pause 5
     if %temp1 > %max-volume-limit then put #statusbar Getting New Work Order In 10 Seconds ...
     if %temp1 > %max-volume-limit then pause 5
     if %temp1 > %max-volume-limit then put #statusbar Getting New Work Order In 5 Seconds ...
     if %temp1 > %max-volume-limit then pause 5
     return

bundle:
     gosub verb get my forg logbook
     gosub verb bundle my %item-basename with my logbook
     gosub verb stow logbook
     return
     
pounding:
     var used-anvil 0
     if "%repairs" = "on" then gosub repairs
     pause 0.1
put get my %material ingot
     match ingot-anvil You get
     match ingot-anvil already holding
     match new-ingot could not find
     match new-ingot What were you
     matchwait
ingot-anvil:
     pause 0.1
put put my ingot on anvil
     matchre ingot-anvil (type ahead|\.\.\.wait)
     matchre used-anvil The anvil already has .* on it
     match prepound You put your ingot on
     matchwait
used-anvil:
     var pplcheck pass
     if "$roomplayers" != "" then gosub peopleinroom
     if "%pplcheck" = "pass" then put clean anvil
     if "%pplcheck" = "pass" then pause 0.1
     if "%pplcheck" = "pass" then gosub verb clean anvil
     if "%pplcheck" = "pass" then goto pounding
     var used-anvil 1
     gosub verb stow my ingot
     return
prepound:
     gosub verb get my %worktype book
     if %app.focus = 0 then gosub app.focus
     gosub verb study my book
     gosub verb stow my book
     gosub verb get my hammer
     gosub verb get my tongs
     setvariable left-overs 0
     setvariable just.stow 0
     setvariable finished 0
     setvariable cool 0
     setvariable verb-track 0
put pound ingot on anvil with my hammer
     match new-ingot need a larger volume of metal
     match shovel the fire dies down and needs more fuel
     match shovel the fire dies down and appears to need some more fuel
     match bellows the fire flickers and is unable to consume its fuel
     match bellows fire dims and produces less heat from the stifled
     match turn could use some straighting along the horn of the anvil
     match turn could use some straightening along the horn of the anvil
     match turn would benefit from some soft reworking
     match turn The metal now looks ready to be turned into wire
     match tub The metal now appears ready for cooling in the slack tub
     match tub complete and ready for a quench hardening in the slack tub
     match turn must be transfered to plate molds and drawn into wire on a mandrel
     match turn drawn into wire on a mandrel
     match oil The worked metal looks to be in need of some oil to preserve and protect it
     match pound Roundtime
     matchwait
new-ingot:
     if "$lefthand" != "Empty" then gosub verb stow left
     if "$righthand" != "Empty" then gosub verb stow right
     pause 0.1
put get ingot on anvil;stow my ingot
     waitforre (You put|STOW HELP)
     if "$zonename" = "Riverhaven" then gosub move %supplies
put get my %material deed
     match got-backup-ingot You get
     matchre no-backup-ingot (could not find|What were you)
     matchwait
tap.deed.p:
     pause 60
got-backup-ingot:
     pause 0.1
put tap my deed
     matchre got-backup-ingot (type ahead|\.\.\.wait)
     match tap.deed.p available in the Society's depot for another
     match deed.tapped The workers carefully load
     matchwait
deed.tapped:
     pause 0.1
     if matchre("$roomobjs","ingot") then gosub verb get ingot
     if "$zonename" = "Riverhaven" then gosub move %result
     goto ingot-anvil
no-backup-ingot:
     gosub display3
     echo . [ All out of back up materials ! ]
     put #window remove pimpSMITH
     put #statusbar .
     exit


pound.p:
     pause 0.5
pound:
     if %left-overs = 1 then goto left-overs
     if %cool = 1 then goto tub
put pound %item-basename on anvil with my hammer
     setvariable verb-track 1
     matchre pound.p (type ahead|...wait)
     match shovel the fire dies down and needs more fuel
     match shovel the fire dies down and appears to need some more fuel
     match bellows the fire flickers and is unable to consume its fuel
     match bellows fire dims and produces less heat from the stifled
     match turn could use some straighting along the horn of the anvil
     match turn could use some straightening along the horn of the anvil
     match turn would benefit from some soft reworking
     match turn The metal now looks ready to be turned into wire
     match tub The metal now appears ready for cooling in the slack tub
     match tub complete and ready for a quench hardening in the slack tub
     match turn must be transfered to plate molds and drawn into wire on a mandrel
     match turn drawn into wire on a mandrel
     match oil The worked metal looks to be in need of some oil to preserve and protect it
     match pound Roundtime
     matchwait
left-overs:
     gosub verb stow my hammer
     gosub verb get %material ingot
     gosub verb stow my ingot
     gosub verb get my hammer
     setvariable left-overs 0
     goto pound
shovel:
     gosub verb stow my hammer
     gosub verb get my shovel
     gosub verb push fuel with my shovel
     gosub verb stow my shovel
     gosub verb get my hammer
     goto pound
bellows:
     gosub verb stow my hammer
     gosub verb get my bellow
     gosub verb push bellow
     gosub verb stow my bellow
     gosub verb get my hammer
     goto pound
turn:
     pause 0.5
     gosub verb turn %item-basename on anvil with my tong
     goto pound
tub:
     pause 0.5
     gosub verb push tub
     gosub verb stow my hammer
     gosub verb stow my tong
     gosub verb get %item on anvil
     return


get-work:
     if "$righthand" != "Empty" then gosub verb stow right
     if "$lefthand" != "Empty" then gosub verb stow left
     gosub find-master
     var mastercheck 0
     if matchre("$roomobjs","%master") then var mastercheck 1
     if %mastercheck = 0 then goto get-work
     gosub verb get my forg logbook
     var mastercheck 0
     if matchre("$roomobjs","%master") then var mastercheck 1
     if %mastercheck = 0 then goto get-work     
     gosub verb ask %master for %difficulty %worktype work
     return
find-master:
     random 0 2
     eval result element("%huntroom", %r)
     gosub move %result
     if matchre("$roomobjs","%master") then return
     var directions nil
     action setvariable tempdir $1 when To the (.+):
     action setvariable directions %tempdir when %master
put hunt
     waitfor Roundtime
     pause
     if $roundtime > 0 then pause
     if $roundtime > 0 then pause
     action remove To the (.+):
     action remove %master
     if matchre("$roomobjs","%master") then return
     if "%directions" = "nil" then goto find-master
     eval directions replacere("%directions", ", ", "|")
     eval listCount count("%directions","|")
     math listCount add 1
     var temp 0
masterarray:
     if %temp = %listCount then goto found-master
     eval result element("%directions", %temp)
move %result
     math temp add 1
     goto masterarray
found-master:
     return

turn-in:
     if "$righthand" = "Empty" then put swap
     gosub find-master
     if "$righthand" = "Empty" then gosub verb get my forg logbook
     var mastercheck 0
     if matchre("$roomobjs","%master") then var mastercheck 1
     if %mastercheck = 0 then goto turn-in
     gosub verb give my logbook to %master
     return


find-forge:
     eval ForgeCount count("%forges","|")
     math ForgeCount add 1
     var temp 0
forgearray:
     if %temp = %ForgeCount then goto found-forge
     eval result element("%forges", %temp)
     gosub move %result
     if "$roomplayers" = "" then goto found-forge
     if "$roomplayers" != "" then gosub peopleinroom
     if "%pplcheck" = "pass" then goto found-forge
     math temp add 1
     goto forgearray
found-forge:
     var pplcheck pass
     if "$roomplayers" != "" then gosub peopleinroom
     if "%pplcheck" = "fail" then goto full-forge
     return
full-forge:
     eval gothere element("%huntroom", 0)
     gosub move %gothere
     pause 60
     goto find-forge

find-grindstone:
     eval listCount count("%grindstones","|")
     math listCount add 1
     random 1 %listCount
     var temp %r
     eval result element("%grindstones", %temp)
     gosub move %result
     return

read-logbook:
put read my logbook
     waitforre This logbook is tracking a work order requiring you to craft (.+) from
     setvariable full-item-name $1
     gosub test-set-base %full-item-name uber
     setvariable item-name %full-item-name
     setvariable item %item-basename
     echo Item Full Name : %full-item-name
     echo Item Base Name : %item-basename
     echo Quantity Desired : %quantity
     var temp-quantity %quantity
     goto done-set-name
test-set-base:
     if "$2" = "uber" then setvariable item-basename $1
     if "$3" = "uber" then setvariable item-basename $2
     if "$4" = "uber" then setvariable item-basename $3
     if "$5" = "uber" then setvariable item-basename $4
     if "$6" = "uber" then setvariable item-basename $5
     if "$7" = "uber" then setvariable item-basename $6
     if "$8" = "uber" then setvariable item-basename $7
     if "$9" = "uber" then setvariable item-basename $8
     if "%full-item-name" = "double-sided ball and chain" then setvariable item-basename ball
     if "%full-item-name" = "spiked ball and chain" then setvariable item-basename ball
     if "%full-item-name" = "ball and chain" then setvariable item-basename ball
     if "%full-item-name" = "a spiked ball and chain" then setvariable item-basename ball
     if "%full-item-name" = "a ball and chain" then setvariable item-basename ball
     if "%worktype" = "Weaponsmithing" then if "%item" = "chain" then setvariable item ball
     return
done-set-name:
     gosub verb stow my logbook
     return

getpage:
     gosub verb get my %worktype book
     var chapter 0
findchapter:
     pause 0.1
     math chapter add 1
     gosub verb turn my book to chapter %chapter
     random 1 5
     if %r = 1 then put read my book;exp
     if %r = 2 then put read my book;enc
     if %r = 3 then put read my book;agility
     if %r = 4 then put read my book;wisdom
     if %r = 5 then put read my book;strength
     matchre foundchapter Page (\d+): %full-item-name\b
     match findchapter Encumbrance
     match findchapter Your base
     match findchapter EXP HELP
     matchwait
foundchapter:
     gosub verb turn my book to page $1
     return

grinding:
     gosub verb turn grindstone
     gosub verb turn grindstone
     gosub verb turn grindstone
     gosub verb turn grindstone
     gosub verb push grindstone with my %item-basename
     return


oil-item:
     gosub verb get my oil
     setvariable oil-gone 0
     gosub verb pour my oil on %item-basename
     if %oil-gone = 1 then gosub buy-more-oil
     gosub verb stow my oil
     return
buy-more-oil:
     var temproom $roomid
     gosub move %supplies
put order
     waitforre (\d+).* flask of oil
     var order $1
     pause 0.1
put order %order;order %order
     waitfor The attendant takes
     gosub move %temproom
     return
stamp:
     var temproom $roomid
     if matchre("%forges","$roomid") then goto stamp-forge
     eval listCount count("%forges","|")
     math listCount add 1
     random 1 %listCount
     var temp %r
     eval result element("%forges", %temp)
     gosub move %result
stamp-forge:
     gosub verb get my stamp
     gosub verb mark my %item-basename with my stamp
     gosub verb stow my stamp
     if $roomid != %temproom then gosub move %temproom
     return


checkassembly:
     setvariable hilt 0
     setvariable haft 0
     setvariable longcord 0
     setvariable shortcord 0
     setvariable largepad 0
     setvariable smallpad 0
     setvariable leatherstrips 0
     setvariable smallback 0
     setvariable largeback 0
     setvariable longpole 0
     setvariable shortpole 0
     setvariable shieldboss 0
     setvariable shieldhandle 0
     action instant setvariable hilt 1 when finished wooden hilt
     action instant setvariable haft 1 when finished wooden haft
     action instant setvariable longcord 1 when long leather cord
     action instant setvariable shortcord 1 when short leather cord
     action instant setvariable smallpad $1 when (\d+). finished small cloth padding
     action instant setvariable largepad $1 when (\d+). finished large cloth padding
     action instant setvariable leatherstrips $1 when (\d+) .* leather strips
     action instant setvariable smallback $1 when (\d+). finished small leather backing
     action instant setvariable largeback $1 when (\d+). finished large leather backing
     action instant setvariable longpole 1 when long wooden pole
     action instant setvariable shortpole 1 when short wooden pole
     action instant setvariable shieldboss 1 when shield boss
     action instant setvariable shieldhandle 1 when metal shield handle
     pause 0.1
put read my book
     waitforre metal ingot .(\d+) volume
     setvariable volume $1
     pause 0.1
     action remove finished wooden hilt
     action remove finished wooden haft
     action remove long leather cord
     action remove short leather cord
     action remove (\d+). finished small cloth padding
     action remove (\d+). finished large cloth padding
     action remove (\d+). leather strips
     action remove (\d+). finished small leather backing
     action remove (\d+). finished large leather backing
     action remove long wooden pole
     action remove short wooden pole
     action remove shield boss
     action remove shield handle
     if %hilt = 1 then echo . [ Required : hilt ]
     if %haft = 1 then echo . [ Required : haft ]
     if %longcord = 1 then echo . [ Required : long cord ]
     if %shortcord = 1 then echo . [ Required : short cord ]
     if %largepad = 1 then echo . [ Required : large padding ]
     if %smallpad = 1 then echo . [ Required : small padding ]
     if %leatherstrips = 1 then echo . [ Required : leather strips ]
     if %smallback = 1 then echo . [ Required : small backing ]
     if %largeback = 1 then echo . [ Required : large backing ]
     if %longpole = 1 then echo . [ Required : long pole ]
     if %shortpole = 1 then echo . [ Required : short pole ]
     if %shieldboss = 1 then echo . [ Required : shield boss ]
     if %shieldhandle = 1 then echo . [ Required : shield handle ]
     return

buy-assembly:
     gosub move %supplies
     if %hilt = 1 then gosub buy %hilt oak hilt
     if %haft = 1 then gosub buy %haft oak haft
     if %longcord = 1 then gosub buy %longcord long cord
     if %shortcord = 1 then gosub buy %shortcord short cord
     if %longpole = 1 then gosub buy %longpole long pole
     if %shortpole = 1 then gosub buy %shortpole short pole
     if %shieldboss = 1 then gosub buy %shieldboss shield boss
     if %largepad > 0 then gosub buy %largepad large padding
     if %smallpad > 0 then gosub buy %smallpad small padding
     if %leatherstrips > 0 then gosub buy %leatherstrips leather strips
     if %smallback > 0 then gosub buy %smallback small backing
     if %largeback > 0 then gosub buy %largeback large backing
     if %shieldhandle > 0 then gosub buy %shieldhandle shield handle
     return
buy:
     var thismany $1
     var tobuy $2 $3
buying:
put buy %tobuy;stow %tobuy
     waitfor You put
     math thismany subtract 1
     if %thismany > 0 then goto buying
     return

assembling:
     var plier-pull 0
     if %largepad > 0 then var plier-pull 1
     if %smallpad > 0 then var plier-pull 1
     if %leatherstrips > 0 then var plier-pull 1
     if %smallback > 0 then var plier-pull 1
     if %largeback > 0 then var plier-pull 1

     if %hilt = 1 then gosub assemble %hilt oak hilt
     if %haft = 1 then gosub assemble %haft oak haft
     if %longcord = 1 then gosub assemble %longcord long cord
     if %shortcord = 1 then gosub assemble %shortcord short cord
     if %longpole = 1 then gosub assemble %longpole long pole
     if %shortpole = 1 then gosub assemble %shortpole short pole
     if %shieldboss = 1 then gosub assemble %shieldboss shield boss

     if %largepad > 0 then gosub assemble %largepad large padding
     if %smallpad > 0 then gosub assemble %smallpad small padding
     if %leatherstrips > 0 then gosub assemble %leatherstrips leather strips
     if %smallback > 0 then gosub assemble %smallback small backing
     if %largeback > 0 then gosub assemble %largeback large backing

     if %shieldhandle > 0 then gosub assemble %shieldhandle shield handle
     if %shieldhandle > 0 then gosub handle-assembly
     if %plier-pull > 0 then gosub plier-pull
     return
assemble:
     var thismany $1
     var tobuy $2 $3
assembleloop:
     gosub verb get my %tobuy
     gosub verb assemble my %item-basename with my %tobuy
     math thismany subtract 1
     if %thismany > 0 then goto assembleloop
     return

handle-assembly:
     gosub verb put my %item on anvil
     gosub verb get my hammer
     gosub verb get my tongs
     gosub verb pound %item on anvil with my hammer
     gosub verb stow my hammer
     gosub verb stow my tong
     gosub verb get %item on anvil
     return
     
plier-pull:
     gosub verb get my pliers
plier-loop:
     pause 0.5
put pull my %item-basename with my pliers
     match plier-loop type ahead
     match plier-loop ...wait
     match plier-done some oil to preserve and protect it
     match plier-loop Roundtime
     matchwait
plier-done:
     gosub verb stow my pliers
     return


repairs:
     gosub repairing hammer
     gosub repairing shovel
     gosub repairing tongs
     gosub repairing bellow
     if "%stamp" = "on" then gosub repairing stamp
     if "$lefthand" != "Empty" then gosub verb stow left
     return
repairing:
     setvariable repair $0
     gosub verb get my %repair
     if "$lefthandnoun" != "brush" then gosub verb get my brush
put rub my %repair with my wire brush
     match repair1 not damaged enough
     match repair2 Roundtime
     matchwait
repair1:
     gosub verb stow my %repair
     return
repair2:
     gosub verb stow my brush
     setvariable oil-gone 0
     gosub verb get my oil
     gosub verb pour my oil on my %repair
     if %oil-gone = 1 then gosub buy-more-oil
     gosub verb stow my oil
     gosub verb stow my %repair
     return

verb:
     setvariable verb $0
     goto verb.a
verb.p:
     pause 0.5
verb.a:
put %verb
     match verb.p type ahead
     match verb.p ...wait
     matchre verb.d (You toss the water into|You get|You put|You pick up|Roundtime|This process can make an item more durable|thin coat of clay to the metal and then place|Roundtime|STOW HELP|completely undamaged and does not need repair|cannot figure out how to do that|not damaged enough to warrant repair|bundle them with your logbook and then give|you just received a work order|You turn your book|You notate|You hand|You slide|You place|You have no idea how to craft|Perhaps try doing that to some refined metal|The book is already turned|What were you referring|You take a step back|could not find|An attendant arrives, takes your deed|already turned to|You attach|You remove)
     matchwait
verb.d:
     return

move.retry:
        math move.retry add 1
        if %move.retry > 3 then goto move.fail
        echo ***
        echo *** Retrying move to $1 $2 in %move.retry second(s).
        echo ***
        pause %move.retry
        goto move.goto
move:
        var move.skip 0
        var move.retry 0
        var move.fail 0
        var move.room $0
        echo Moving to $0
move.goto:
        matchre move.return ^YOU HAVE ARRIVED
        matchre move.skip ^SHOP CLOSED
        matchre move.retry ^MOVE FAILED
        matchre move.fail ^DESTINATION NOT FOUND
        matchre move.fail ^Destination not found
        put #goto %move.room
        matchwait
move.fail:
        var move.fail 1
        goto move.return
move.skip:
        var move.skip 1
move.return:
        return
        

display:
     math displaytracker add 1
     if %displaytracker > 1 then goto display2
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH
put #echo >pimpSMITH skyblue Total Work Orders  : %total-workorders
put #echo >pimpSMITH Total Items Made   : %total-items-made
     var avg1 0
     var avg2 0
     if %total-workorders > 0 then var tempavg %total-volume-used
     if %total-workorders > 0 then math tempavg divide %total-workorders
     if %total-workorders > 0 then var avg1 %tempavg
     if %total-volume-used > 0 then var tempavg %total-volume-used
     if %total-volume-used > 0 then math tempavg divide %total-items-made
     if %total-volume-used > 0 then var avg2 %tempavg
put #echo >pimpSMITH skyblue Total Volume Used  : %total-volume-used
put #echo >pimpSMITH Total Profit       : %coin-intake
put #echo >pimpSMITH
put #echo >pimpSMITH skyblue Avg. Vol / WO      : %avg1
put #echo >pimpSMITH Avg. Vol / Item    : %avg2
     var tempavg 0
     if %coin-intake > 0 then var tempavg %coin-intake
     if %coin-intake > 0 then math tempavg divide %total-workorders
put #echo >pimpSMITH skyblue Avg. Profit / WO   : %tempavg
     var tempavg 0
     if %coin-intake > 0 then var tempavg %coin-intake
     if %coin-intake > 0 then math tempavg divide %total-items-made
put #echo >pimpSMITH Avg. Profit / Item : %tempavg
put #echo >pimpSMITH SpringGreen for Finish Mode type END PIMPSMITH
     return


display2:
     var displaytracker 0
put #clear pimpSMITH
put #echo >pimpSMITH SpringGreen ** ~pimpSMITH~ **
put #echo >pimpSMITH
put #echo >pimpSMITH Total Work Orders  : %total-workorders
put #echo >pimpSMITH skyblue Total Items Made   : %total-items-made
     var avg1 0
     var avg2 0
     if %total-workorders > 0 then var tempavg %total-volume-used
     if %total-workorders > 0 then math tempavg divide %total-workorders
     if %total-workorders > 0 then var avg1 %tempavg
     if %total-volume-used > 0 then var tempavg %total-volume-used
     if %total-volume-used > 0 then math tempavg divide %total-items-made
     if %total-volume-used > 0 then var avg2 %tempavg
put #echo >pimpSMITH Total Volume Used  : %total-volume-used
put #echo >pimpSMITH skyblue Total Profit       : %coin-intake
put #echo >pimpSMITH
put #echo >pimpSMITH Avg. Vol / WO      : %avg1
put #echo >pimpSMITH skyblue Avg. Vol / Item    : %avg2
     var tempavg 0
     if %coin-intake > 0 then var tempavg %coin-intake
     if %coin-intake > 0 then math tempavg divide %total-workorders
put #echo >pimpSMITH Avg. Profit / WO   : %tempavg
     var tempavg 0
     if %coin-intake > 0 then var tempavg %coin-intake
     if %coin-intake > 0 then math tempavg divide %total-items-made
put #echo >pimpSMITH skyblue Avg. Profit / Item : %tempavg
put #echo >pimpSMITH SpringGreen for Finish Mode type END PIMPSMITH
     return

display3:
echo Total Work Orders  : %total-workorders
echo Total Items Made   : %total-items-made
     var avg1 0
     var avg2 0
     if %total-workorders > 0 then var tempavg %total-volume-used
     if %total-workorders > 0 then math tempavg divide %total-workorders
     if %total-workorders > 0 then var avg1 %tempavg
     if %total-volume-used > 0 then var tempavg %total-volume-used
     if %total-volume-used > 0 then math tempavg divide %total-items-made
     if %total-volume-used > 0 then var avg2 %tempavg
echo Total Volume Used  : %total-volume-used
echo Total Profit       : %coin-intake
echo
echo Avg. Vol / WO      : %avg1
echo Avg. Vol / Item    : %avg2
     var tempavg 0
     if %coin-intake > 0 then var tempavg %coin-intake
     if %coin-intake > 0 then math tempavg divide %total-workorders
echo Avg. Profit / WO   : %tempavg
     var tempavg 0
     if %coin-intake > 0 then var tempavg %coin-intake
     if %coin-intake > 0 then math tempavg divide %total-items-made
echo Avg. Profit / Item : %tempavg
     return

startuperror:
echo
echo You must start this in one of the forging society buildings.
echo
     put #window remove pimpSMITH
     put #statusbar .
     exit

peopleinroom:
     setvariable players $roomplayers
     eval players replace("$roomplayers", "Also here: ", ", ")
     eval players replacere("%players", " who is kneeling,", ",")
     eval players replacere("%players", " who is lying down,", ",")
     eval players replacere("%players", " who is sitting,", ",")
     eval players replacere("%players", " who is behind a plexus of azure lines,", ",")
     eval players replacere("%players", " who is emanating a benevolent holy aura,", ",")
     eval players replacere("%players", " who is emanating a bright holy aura,", ",")
     eval players replacere("%players", " who is emanating a malevolent holy aura,", ",")
     eval players replacere("%players", " who is surrounded by a hellish inferno,", ",")
     eval players replacere("%players", " who is in a fiery crimson cage,", ",")
     eval players replacere("%players", " who is in a geometric azure cage,", ",")
     eval players replacere("%players", " who is radiating a glowing aura,", ",")
     eval players replacere("%players", " who is shrouded in ghostly flames,", ",")
     eval players replacere("%players", " who is surrounded by a fiery mantle,", ",")
     eval players replacere("%players", " who is surrounded by a shimmering shield,", ",")
     eval players replacere("%players", " who is surrounded by one circling blade of ice,", ",")
     eval players replacere("%players", " who is surrounded by two circling blades of ice,", ",")
     eval players replacere("%players", " who is surrounded by three circling blades of ice,", ",")
     eval players replacere("%players", " who is surrounded by four circling blades of ice,", ",")
     eval players replacere("%players", " who is surrounded by five circling blades of ice,", ",")
     eval players replacere("%players", " and", ",")
     eval players replacere("%players", "\.", "")
     eval players replacere("%players", ", [\w'-]+ ", ", ")
     eval players replacere("%players", ", [\w'-]+ ", ", ")
     eval players replacere("%players", ", [\w'-]+ ", ", ")
     eval players replace("%players", ", ", "|")
     eval len length("%players")
     math len subtract 1
     eval players substr("%players",1,%len)
     eval pplCount count("%players","|")
     math pplCount add 1
     if %pplCount = 1 then var players %players|Christopher Hitchens|Neil Degrass Tyson
     var ppltrack 0
listArray:
     if %ppltrack = %pplCount then goto doneListingArray
     eval mofos element("%players", %ppltrack)
     var pplcheck fail
     if matchre("%grouped","%mofos") then var pplcheck pass
     if "%pplcheck" = "fail" then return
     math ppltrack add 1
     goto listArray
doneListingArray:
     return

group-vs-ppl:
     echo Grouped: %grouped
     eval GroupCount count("%grouped","|")
     math GroupCount add 1
     var GroupTrack 0
gvp:
     if %GroupTrack = %GroupCount then return
     eval person element("%grouped", %GroupTrack)
     if "%person" = "Neil Degrass Tyson" then var pplcheck pass
     if "%person" = "Christopher Hitchens" then var pplcheck pass
     if "%person" = "Neil Degrass Tyson" then return
     if "%person" = "Christopher Hitchens" then return
     echo . [ Comparing %result to %person ... ]
     var pplcheck pass
     if "%person" != "%result" then var pplcheck fail
     if "%pplcheck" = "pass" then return
     math GroupTrack add 1
     goto gvp
     
app.focus:
     if %AppRanks < 200 then var app.focus 1
     if %AppRanks < 200 then return
     pause 0.1
put app focus %worktype book
     matchre app.focus (type ahead|\.\.wait)
     match focus.skip are already under the effects of an appraisal
     match apprecheck You are already focusing
     match focus.fail you're too mentally tired from researching similar
     match apprecheck Roundtime     
     matchwait
apprecheck:
     var appcheck 0
focus.wait:
     pause 1
     if %app.focus = 1 then return
     math appcheck add 1
     if %appcheck > 60 then put exp
     if %appcheck > 60 then goto apprecheck
     goto focus.wait
focus.skip:
     var app.focus 1
focus.fail:
     return