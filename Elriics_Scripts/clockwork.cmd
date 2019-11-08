include base.cmd

action var controlPanel $1 when ^You think you can do something to the (dial|gadget|gizmo|prong|slider)
action var buttonAction $1;var controlPanel $2 when ^You think you can (push|pull|pinch|poke|prod) the (dial|gadget|gizmo|prong|slider) to increase your chances
action var buttonAction $1 when ^You think you can (push|pull|pinch|poke|prod)
action var increasedOdds 1 when ^You're pretty sure you've improved your odds as much as you possibly can.
action var junkIt 1 when Some (fine|thin|average|thick|heavy)?\s?(felt|cotton|linen|wool|burlap|silk) cloth!
##action var junkIt 0 when Some (fine|thin|average|thick|heavy)?\s?(bourde|faradine|imperial weave|khaddar|ruazen wool|titanese) cloth!
action put #queue clear; send $1 $lastcommand when \.\.\.wait ([\d+]) seconds\.
action goto CLOCKWORK.LEVER when ^The machine rattles a bit.
action goto CLOCKWORK when you've missed your chance at getting fabric from it\.$



CLOCKWORK:
var buttonAction Unknown
var controlPanel Unknown
var increasedOdds 0
var junkIt 0


CLOCKWORK.START:
send push button
pause .5


CLOCKWORK.APPRAISE:
send appraise spinner
pause 5.5
gosub CLOCKWORK.subECHO

if %buttonAction != "Unknown" THEN if %controlPanel != "Unknown" THEN goto CLOCKWORK.PUZZLE
goto CLOCKWORK.APPRAISE


CLOCKWORK.LEVER:
pause
MATCHRE CLOCKWORK.POISON You are poisoned!$
MATCHRE CLOCKWORK.WEB You are webbed!$
MATCHRE CLOCKWORK.STOW You quickly take it from the contraption before the panel closes again.$
send pull lever
MATCHWAIT


CLOCKWORK.POISON:
echo ==============
echo ===POISONED===
echo ==============
gosub CLOCKWORK.subHEAL
goto CLOCKWORK.EXIT


CLOCKWORK.WEB:
waitforre ^You finally manage to free yourself from the webbing.
goto CLOCKWORK


CLOCKWORK.PUZZLE:
send %buttonAction %controlPanel
pause 1
if %increasedOdds = 1 THEN goto CLOCKWORK.LEVER
gosub CLOCKWORK.subCLEAR
goto CLOCKWORK.APPRAISE


CLOCKWORK.STOW:
pause 1
if %junkIt = 0 THEN echo You have gained valuable cloth!
if %junkIt = 1 then send put $righthandnoun in bucket
pause .5
if $righthand != "Empty" THEN send stow
if $lefthand != "Empty" THEN send stow left
pause .5
goto CLOCKWORK


CLOCKWORK.EXIT:
exit



CLOCKWORK.subECHO:
echo ======================================
echo Action:   %buttonAction
echo Control:  %controlPanel
echo ======================================
return

CLOCKWORK.subCLEAR:
var buttonAction Unknown
var controlPanel Unknown
return

CLOCKWORK.subHEAL:
gosub automove 299
put whisper Charise heal me
put whisper Charise poison
waitfor and feel certain that the nerve poison is gone.
gosub automove spinner
pause 1
goto CLOCKWORK
