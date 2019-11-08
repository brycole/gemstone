	action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
	action put listen to $1 when ^(\S+) begins to lecture you


        action put #send tend my "left hand" when ^The bandages binding your left hand soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "left arm" when ^The bandages binding your left arm soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "left leg" when ^The bandages binding your left leg soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "right hand" when ^The bandages binding your right hand soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "right arm" when ^The bandages binding your right arm soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "right leg" when ^The bandages binding your right leg soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "left eye" when ^The bandages binding your left eye soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "right eye" when ^The bandages binding your right eye soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "back" when ^The bandages binding your back soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "chest" when ^The bandages binding your chest soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "abdomen" when ^The bandages binding your abdomen soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "head" when ^The bandages binding your head soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "neck" when ^The bandages binding your neck eye soak through with blood becoming useless and you begin bleeding again.
        action put #send tend my "tail" when ^The bandages binding your tail eye soak through with blood becoming useless and you begin bleeding again.




        MAIN:
        pause 60
        put EXP
        goto MAIN
