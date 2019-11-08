action put #echo >log Green You just purchased the spell scroll $1! when ^The linen scroll contains a complete description of the (.+) spell\.

loop:
put order linen scroll
waitfor The sales
put read my scroll
waitforre The a linen|Roundtime|As you read the scroll
pause
put stow scroll in my haver
waitforre You put your|Stow what\?
goto loop