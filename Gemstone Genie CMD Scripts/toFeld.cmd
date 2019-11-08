if_1 then goto %1

feld:
gosub move 211
gosub move 121
gosub move 131
goto exit

cros:
gosub move 45
gosub move 83
goto exit

exit:
exit

move:
put #var lastmove $1
put #mapper walk $1
waitfor @walk done.
return