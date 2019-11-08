	action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
	action put listen to $1 when ^(\S+) begins to lecture you



        action put #send tend $1 "left hand" when ^The bandages binding (\w+)'s left hand soak through with blood
        action put #send tend $1 "left arm" when ^The bandages binding (\w+)'s left arm soak through with blood
        action put #send tend $1 "left leg" when ^The bandages binding (\w+)'s left leg soak through with blood
        action put #send tend $1 "right hand" when ^The bandages binding (\w+)'s right hand soak through with blood
        action put #send tend $1 "right arm" when ^The bandages binding (\w+)'s right arm soak through with blood
        action put #send tend $1 "right leg" when ^The bandages binding (\w+)'s right leg soak through with blood
        action put #send tend $1 "left eye" when ^The bandages binding (\w+)'s left eye soak through with blood
        action put #send tend $1 "right eye" when ^The bandages binding (\w+)'s right eye soak through with blood
        action put #send tend $1 back when ^The bandages binding (\w+)'s back soak through with blood
        action put #send tend $1 chest when ^The bandages binding (\w+)'s chest soak through with blood
        action put #send tend $1 abdomen when ^The bandages binding (\w+)'s abdomen soak through with blood
        action put #send tend $1 head when ^The bandages binding (\w+)'s head soak through with blood
	action put #send tend $1 neck when ^The bandages binding (\w+)'s neck soak through with blood
	action put #send tend $1 tail when ^The bandages binding (\w+)'s tail soak through with blood
        
        MAIN:
        pause 60
        put EXP
        goto MAIN
    