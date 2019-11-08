##debuglevel 10
include base.cmd 

var con1 bag
var con2 apron
var t1 0

start.scroll:
matchre start.scroll %rt.com
match setcon What were you referring to?
match study You get
put get my scroll from my bag
matchwait

study:
if (%t1 != 0) then gosub m.input get scroll %con1
var t1 1
if ($Astrology.LearningRate != 34) then
{
	gosub put.1 "read my scroll" "^Roundtime|^What were you|^You'll"
}
scroll.check:
match studyend What were you referring to?
match study You put
matchre scroll.check %rt.com
put put my scroll in my %con2
matchwait


setcon:
setvar t1 1
setvar con1 apron
setvar con2 bag
goto study

studyend:
echo Scroll reading is done.
put #parse studys.cmd done.
