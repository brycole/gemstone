jail:
delay 1
put #script abort automapper
put #script pause all except jail
waitfor PLEAD INNOCENT
put stand
put plead guilty
waitfor releases you,
put open my sack
put get my khu
waitfor You get a slender khuj
put wear khu
delay 1
put drop sack
put #mapper walk 142
waitfor @walk done.
put deposit all
put withdraw 5 gold
delay 1
put #script resume all
put #mapper walk $lastmove
waitfor @walk done.
put #parse Roundtime