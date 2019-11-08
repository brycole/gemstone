gosub routineingot
gosub routinecommon
gosub routinemoonbuffs


var resonance stealing
put #var monitor no

if "%1" = "repair" then gosub repairtools
if "%1" = "ticket" then gosub ticketrepairloop

gosub ingot %1

exit

repairtools:
	gosub get my forg hammer
	gosub put.2 "give ham to clerk" "give ham to clerk" "^You hand|I will not repair|^What is|A clerk says"
	var keywords 0
	gosub get my tong
	gosub put.2 "give tong to clerk" "give tong to clerk" "^You hand|I will not repair|^What is|A clerk says"
	var keywords 0
	gosub emptyhands
	gosub get my shov
	gosub put.2 "give shov to clerk" "give shov to clerk" "^You hand|I will not repair|^What is|A clerk says"
	var keywords 0
	gosub get my bellow
	gosub put.2 "give bell to clerk" "give bell to clerk" "^You hand|I will not repair|^What is|A clerk says"
	var keywords 0
	gosub emptyhands
	gosub get my rod
	gosub put.2 "give rod to clerk" "give rod to clerk" "^You hand|I will not repair|^What is|A clerk says"
	var keywords 0
	gosub emptyhands

	exit

ticketrepairloop:
	gosub put.1 "get ticket" "^You get|^What were"
	if (("$lefthandnoun" != "ticket") && ("$righthandnoun" != "ticket")) then goto repairloopdone
giveticketloop:	
	gosub put.1 "give ticket to clerk" "^You hand"
	var keywords 0
	gosub emptyhands
	if (("$lefthandnoun" = "ticket") || ("$righthandnoun" = "ticket")) then
	{
		gosub pause 15
		goto giveticketloop
	}
	goto ticketrepairloop
repairloopdone:

exit
	

include ingot.cmd
include routinecommon.cmd
include routinemoonbuffs.cmd
exit
