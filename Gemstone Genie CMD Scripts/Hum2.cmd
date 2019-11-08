## Self Adjusting Hum Script
## written by: Mystarria
## date: July 10th 2009

Hum:
#debuglevel 5
put stop hum
pause 0.2
var HumRanks 0|22|29|36|43|50|59|63|76|90|103|117|137|156|175|192|210|229|248|270|325|358|380|410|460|490|540|600|654|720|800
var HumStyle Arpeggios|Ditty|Folk|Ballad|Waltz|Lullaby|March|Jig|Lament|Wedding|Hymn|Rumba|Polka|Battle|Reel|Elegy|Serenade|Minuet|Psalm|Dirge|Gavotte|Tango|Tarantella|Bolero|Nocturne|Requiem|Fantasia|Rondo|Aria|Sonata|Concerto
var HumMin 0

Hum.SkillCheck:
if ($Vocals.Ranks > %HumRanks(%HumMin)) then
	{
	math HumMin add 1
	goto Hum.SkillCheck
	}
else
	{
	var Song %HumStyle(%HumMin)
	goto Hum.Song
	}

Hum.Song:
if ($Vocals.LearningRate > 33) then goto Hum.Done
	match Hum.SongSet with only the slightest hint of difficulty.
	matchre Hum.Adjust ^You (begin to hum|fumble slightly)
	put hum %Song
	matchwait

Hum.SongSet:
	put #var Hum_Song %Song
	goto Hum.Done
	waitfor You finish humming
	goto Hum.Song

Hum.Adjust:
	put stop hum
	wait
	if ("$1" = "begin to hum") then math HumMin add 1
	elseif ("$1" = "fumble slightly") then math HumMin subtract 1
	var Song %HumStyle(%HumMin)
	goto Hum.Song

Hum.Done:
return