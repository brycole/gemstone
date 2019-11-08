## setremove ##
## usage: .setremove "<list>" "<value>" ##

VarSet:
var NewVar %1
var a ""
var d ""
var b %2
Actions:
action var d $1;goto Beginning when ^%b(?:,| and)(.+)
action var a $1;var d $2;goto Middle when (.+)%b(?:,| and)(.+)
action var a $1;goto End when (.+)(?:,| and) %b\$
action var a $1;var d $2;goto End when (.+)(?:,| and) %b(\.)\$
pause .5
put #parse %NewVar
Beginning:
var NewVar %d
goto Done
Middle:
if ("%d" = ".") then goto End
var NewVar %a%d
goto Done
End:
if ("%d" = ".") then var NewVar %a.
else
	var NewVar %a
goto Done
Done:
put #parse The New Variable is %NewVar
exit