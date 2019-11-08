debuglevel 10
	START:
       ECHO
       ECHO
       ECHO *******************
       ECHO *** DAMNED HEALING
       ECHO *** By: Kalic
       ECHO *******************
       ECHO
       ECHO
       goto glance

    GLANCE:
       match health You glance down to see
       match NOWEAP You glance down at
       put glance
       matchwait
       
    NOWEAP:
       ECHO
       ECHO
       ECHO
       ECHO *** HOW CAN A NECROLORD PROPERLY FUNCTION WITHOUT A BLADE? ***
       ECHO
       ECHO
       ECHO
       GOTO end

    HEALTH:
       match done You have no significant injuries
       match rightarm right arm
       match leftarm left arm
       match righthand right hand
       match lefthand left hand
       match rightleg right leg
       match leftleg left leg
       match rightfoot right foot
       match leftfoot left foot
       match abdomen abdomen
       match chest chest
       match back back
       match neck neck
       match head head
       match righteye right eye
       match lefteye left eye
       matchre nonheal /paralysis|twitch|twitching|rash/
       put health
       matchwait

    RIGHTARM:
       setvariable area right arm
       goto dodge
    LEFTARM:
       setvariable area left arm
       goto dodge
    RIGHTHAND:
       setvariable area right hand
       goto dodge
    LEFTHAND:
       setvariable area left hand
       goto dodge
    RIGHTLEG:
       setvariable area right leg
       goto dodge
    LEFTLEG:
       setvariable area left leg
       goto dodge
    RIGHTFOOT:
       setvariable area right foot
       goto dodge
    LEFTFOOT:
       setvariable area left foot
       goto dodge
    ABDOMEN:
       setvariable area abdomen
       goto dodge
    CHEST:
       setvariable area chest
       goto dodge
    BACK:
       setvariable area back
       goto dodge
    NECK:
       setvariable area neck
       goto dodge
    HEAD:
       setvariable area head
       goto dodge
    RIGHTEYE:
       setvariable area right eye
       goto dodge
    LEFTEYE:
       setvariable area left eye
       goto dodge
       

       
    DODGE:
        match dodge ...wait
        match feint Roundtime
        match feint But you are
        put dodge
        matchwait

    FEINT:
        match feint ...wait
        match draw Roundtime
        match adv What do you want
        match adv2 You begin to
        match wait There is nothing
        match prep balanced]
        match prep balance]
        put feint
        matchwait

    DRAW:
        match draw ...wait
        match slice Roundtime
        match adv What do you want
        match adv2 You begin to
        match wait There is nothing
        match prep balanced]
        match prep balance]
        put draw
        matchwait

    SLICE:
        match slice ...wait
        match standcheck Roundtime
        match adv What do you want
        match adv2 You begin to
        match wait There is nothing
        match prep balanced]
        match prep balance]
        put slice
        matchwait

    ADV:
        match adv2 You are already
        match feint You will have to
        match adv2 You begin to
        match feint You spin around
        match wait2 What do you want
        put adv %1
        put adv %2
        matchwait

    ADV2:
        pause 10
        goto feint

    PREP:
        match prep ...wait
        match look the Consume Flesh spell.
        match wait You are unable to harness
        put prep cf
        matchwait

    look:
        match search Also here:
        match ritual Obvious path
        put look
        matchwait

    RITUAL:
        match castwait allow you to drain the body
        match search This ritual may only be
        put perform consume on %1
        put perform consume on %2
        matchwait

    CASTWAIT:
        match look2 You feel fully prepared
        matchwait
       
    LOOK2:
        match wait Also here:
        match cast Obvious path
        put look
        matchwait

    CAST:
        match cast ...wait
        matchre search /completely destroyed already|as your own mends|Lacking any ritually prepared/
        match wait You are unable to harness
        put cast %area
        matchwait

    SEARCH:
        match search ...wait
        match health You search
        match health You should
        match health I could not find
        put search %1
        put search %2
        matchwait

    WAIT:
       put release
       pause 200
       ECHO
       ECHO
       ECHO
       ECHO *** YOUR NIGHTMARE-BLACK MANA HAS RUN DRY. PAUSING 200 SECONDS ***
       ECHO
       ECHO
       ECHO
       goto health

    WAIT2:
       match adv %1
       match adv %2
       put look
       ECHO
       ECHO
       ECHO
       ECHO *** THERE IS NOTHING LEFT TO FEAST UPON. WAITING FOR NEXT VICTIM ***
       ECHO
       ECHO
       ECHO
       matchwait
       
    STANDCHECK:
        match standcheck ...wait
        match standcheck Roundtime
        match dodge You are already
        put stand
        matchwait
       
    NONHEAL:
        ECHO
        ECHO
        ECHO
        ECHO  *** SOMETHING AILS YOU THAT NO AMOUNT OF PUPPY SACRIFICES CAN HEAL ***
        ECHO
        ECHO
        ECHO
        goto EXIT
       
    DONE:
        ECHO
        ECHO
        ECHO
        ECHO  *** PRAISE BE TO DEAD PUPPIES. THIS NECROLORD IS HEALED ***
        ECHO
        ECHO
        ECHO
        goto exit
       
    END:
        ECHO
        ECHO
        ECHO
        ECHO  *** PULL OUT YOUR SACRIFICIAL LE WEAPON AND RETRY ***
        ECHO
        ECHO
        ECHO
        goto exit
       
    EXIT:
