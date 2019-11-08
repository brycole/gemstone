action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

include base.cmd
var whereDarkBox 2

gosub automove %whereDarkbox
goto Move.Darkbox


Move.Darkbox:
math whereDarkbox add 1
gosub automove %whereDarkbox
goto Find.Darkbox

Find.Darkbox:
 if (contains("$roomobjs", "Darkbox")) then
  {
    put #ECHO YAY
  }
 else
  {
    goto Move.Darkbox
  }