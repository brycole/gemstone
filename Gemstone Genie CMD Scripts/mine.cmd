debuglevel 10
### User Defined Settings

# Which sizes of stone to deed
var StoneDeed (boulder|rock|stone)
# Which sizes of stone to stow
var StoneStow pebble

# List of materials to keep
var MaterialKeepList (animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|kertig|lumium|niniam|muracite|platinum) (\w*)

# How long to wait after mining before min++ing again.
# Too small a value may cause dangers to happen before they can be corrected.
var SaftyPause 8

############################################################################
###Variable declaration.

# Did we find stone or metal on that last mine?
var FoundStone 0
var FoundMetal 0

# How many times in a row have we failed to find anything?
var MineFailure 0

# How many times have we found something since the last time we prospected?
var MineSuccess 0

# How much metal/stone is left in the room.
var MaterialLevel 0
var careful 0

# Are there workers available to deed stone?
var DeedWorkers 0

# Variable used for data tracking
var TotalStone 0
var TotalMetal 0

############################################################################
###Trigger setup

# If roundtime wasn't up try sending the last command again.
action (Retry) pause, put $lastcommand when ...wait
action var careful 1 when ^A diagram on the wall shows the location of additional resources still available for mining.
# Check if we find anything when mining
action (Mining) %FoundStone = 1 when topples free\.
action (Mining) %FoundStone = 1;%FoundMetal = 1 when are visible on the ground\.
action (Mining) %FoundMetal = 1 when falls to the ground\!

# Update the amount of material left in the room when prospecting.
action (Prospect) %MaterialLevel = 6 when enormous quantity remains to be found
action (Prospect) %MaterialLevel = 5 when substantial quantity remains to be found.
action (Prospect) %MaterialLevel = 4 when good quantity remains to be found.
action (Prospect) %MaterialLevel = 3 when decent quantity remains to be found.
action (Prospect) %MaterialLevel = 2 when small quantity remains to be found.
action (Prospect) %MaterialLevel = 1 when scattering of resources remains to be found.

# Does the room have workers to deed stone, or do we have to provide our own?
action (Prospect) %DeedWorkers = 0 when This area has no workers present to help haul away your items.
action (Prospect) %DeedWorkers = 1 when Miners stand ready to trade resources in for deeds.

# Immediately handle any dangerous conditions when they pop up.
action goto Danger when A bitter smell seeps into the air.
action goto Danger when The ground rumbles ominously.
action goto Danger when The floor shudders briefly, causing pebbles and bits of stone to cascade to the ground.

############################################################################

Main:
        action (Retry) off
        action (Mining) off

        gosub Prospect
MainLoop:
				if %careful = 0 then
					{
						if %MaterialLevel = 1 then
							{
								put prospect careful
								pause
								var careful 1
							}
					} 
        if ( %MineSuccess >= %MaterialLevel ) then
        {
                echo *** MineSuccess >= MaterialLevel
                gosub Prospect
        }

        else
        {	
        	var maxfailure 10
        	if %MaterialLevel < 3 then var maxfailure 5
                if ( %MineFailure > %maxfailure ) then
                {
                        echo *** MineFailure >= 5
                        gosub Prospect
                }
                else
                {
                        echo *** Else
                        gosub Mine
                }
        }
        
        goto MainLoop
        

Prospect:
        %MineFailure = 0
        %MineSuccess = 0
        action (Prospect) on
        action (Retry) on

        match ProspectContinue Studying the geology
        match RoomEmpty Roundtime:
        put prospect
        matchwait

ProspectContinue:
        action (Prospect) off
        action (Retry) off

        return


# Perform MINE action
Mine:
				gosub Collect
        action (Mining) on
        action (Retry) on

        %FoundStone = 0
        %FoundMetal = 0

        put mine
        pause %SaftyPause

        action (Mining) off
        action (Retry) off
        
        if %FoundStone == 1 or %FoundMetal == 1 then
        {
                %MineFailure = 0
                math MineSuccess add 1
                
                if %FoundStone == 1 then math TotalStone add 1
                if %FoundMetal == 1 then math TotalMetal add 1
                
                %FoundStone = 0
                %FoundMetal = 0
                
                gosub Collect
        }
        else
        {
                math MineFailure add 1
        }
        
        echo *** MineFailure = %MineFailure
        echo *** MineSuccess = %MineSuccess
        echo *** MaterialLevel = %MaterialLevel
        return


Collect:
        if matchre("$roomobjs", ("%MaterialKeepList")) then
        {
        				delay 1
                var result $0
#               if ( matchre("%result", ("%StoneDeed") ) then gosub Deed %result
#               else
                {
                        action (Retry) on
                        put stow %result
                        action (Retry) off
                }
        }
        return

Deed:
        var item $0
        
        action (Retry) on
        if ( %DeedWorkers = 1 ) then
        {
                put push $1
                pause
                put stow deed
        }
        else
        {
                put take packet
                pause
                put push %item with packet
                pause
                put stow packet
                pause
                put stow deed
        }
        action (Retry) off
        return
        


Danger:
        put #queue clear
        pause
        
        if %FountStone == 1 then math TotalStone add 1
        if %FoundMetal == 1 then math TotalMetal add 1

        #Might have dug something up on the last mine
        gosub Collect

DangerFailure:
        action (Prospect) on
        match DangerFailure Unfortunately, you are unable to find any way around the instability in the geology.
        match DangerClear Using a discarded stone you make several notations on the wall both to remind yourself and to direct other miners.
        put prospect danger
        matchwait

DangerClear:
        action (Prospect) on
        action (Retry) on
        match MainLoop Studying the geology, you are certain that continued mining will be quite safe.
        match StillDanger Roundtime:
        put prospect
        matchwait
        

StillDanger:
        echo WARNING: CONTINUED MINING WILL BE DANGEROUS!
RoomEmpty:
        echo ===Total stone mined = %TotalStone
        echo ===Total metal mined = %TotalMetal
        put #parse @DONE
        exit