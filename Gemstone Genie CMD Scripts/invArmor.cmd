#debuglevel 10
var c 0
var invtemp
var armorlist mail gloves|hauberk|coat|mail gauntlets|leathers|balaclava|shield|buckler|

action var invtemp $1 when ^He is wearing (.+)\.
action var invtemp $1 when ^She is wearing (.+)\.
action var invtemp $1 when ^You are wearing (.+)\.

waitforre ^You are|^He is wearing|^She is wearing
start:
eval invtemp replace("%invtemp",", ", "|")
eval invtemp replace("%invtemp"," and a ","|")
eval item.max count("%invtemp", "|")
counter set 0

label:
if "%invtemp(%c)" = "" then goto done
if matchre("%invtemp(%c)@", (".+ (%armorlist@)") then echo $1
counter add 1
goto label
done: