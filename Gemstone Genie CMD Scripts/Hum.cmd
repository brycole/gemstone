## Self Adjusting Hum Script
## written by: Mystarria
## date: July 10th 2009

#debuglevel 5
put stop hum
pause 0.2
var HumRanks 0|22|29|36|43|50|59|63|76|90|103|117|137|156|175|192|210|229|248|270|325|358|380|410|460|490|540|600|654|720|800
var HumStyle Arpeggios|Ditty|Folk|Ballad|Waltz|Lullaby|March|Jig|Lament|Wedding|Hymn|Rumba|Polka|Battle|Reel|Elegy|Serenade|Minuet|Psalm|Dirge|Gavotte|Tango|Tarantella|Bolero|Nocturne|Requiem|Fantasia|Rondo|Aria|Sonata|Concerto
var HumMin 0

SkillCheck:
if ($Vocals.Ranks > %HumRanks(%HumMin)) then
	{
	math HumMin add 1
	goto SkillCheck
	}
else
	{
	var Song %HumStyle(%HumMin)
	goto Hum
	}

Hum:
if ($Vocals.LearningRate > 33) then goto Done
	match SongSet with only the slightest hint of difficulty.
	matchre Adjust ^You (begin to hum|fumble slightly)
	put hum %Song
	matchwait

SongSet:
	put #var Hum_Song %Song
	goto Done
	goto Hum

Adjust:
	put stop hum
	wait
	if ("$1" = "begin to hum") then math HumMin add 1
	elseif ("$1" = "fumble slightly") then math HumMin subtract 1
	var Song %HumStyle(%HumMin)
	goto Hum

Done:
put #parse hum.cmd done.
exit