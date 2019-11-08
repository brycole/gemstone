##debuglevel 10
include base.cmd

## Self adjusting instrument/hum script
## by Haldrik 11/19/2009
## Modified from Mystarria's hum script

put stop play

put #var instr_type %1


gosub instrument.setup

var adjust_up ^You begin to hum|^You begin some|^You effortlessly begin|^You begin a
var adjust_down ^You fumble slightly|^You struggle

var temp1 %$instr_type
var temp2 %temp1(0)
var temp3 %temp1(3)
var temp4 %temp1(2)
evalmath play ($%temp2 \ %temp3)
var learn.play %temp1(1)
var play_comm hum
var play.song 0
var pause.song 0

action var play.song 1 when ^You finish playing|^You finish humming
action var pause.song 1 when ^You finish playing|^You finish humming|^You begin|^You continue|^You concentrate|^You maneuver|^You find yourself|^You concentrate|^Your voice

if "%1" != "vocals" then
{
	var play_comm play
	#gosub put.1 "chant care" "^With a sharp cut|^You're|^As you begin|^You are unable|^With a quick"
	gosub put.1 "sing lilt" ".+"
	gosub put.2 "get my cloth" "clean my %temp4 with my cloth" "dry it off|^\[Roundtime:|not in need of cleaning\."
	gosub put.1 "stow my cloth" "^You put"
	gosub put.1 "app my %temp4" "^Roundtime"
	gosub put.1 "assess my %temp4" "^Roundtime"
	
}

var ranks 0|5|10|22|29|36|43|50|59|63|76|90|103|117|137|156|175|192|210|229|248|270|325|358|380|410|460|490|540|600|654|720|800
var style Scales halt|Scales|Arpeggios|Ditty|Folk|Ballad|Waltz|Lullaby|March|Jig|Lament|Wedding|Hymn|Rumba|Polka|Battle|Reel|Elegy|Serenade|Minuet|Psalm|Dirge|Gavotte|Tango|Tarantella|Bolero|Nocturne|Requiem|Fantasia|Rondo|Aria|Sonata|Concerto
var min 0
skillcheck:
if (%play > %ranks(%min)) then
	{
	math min add 1
	goto skillcheck
	}
else
	{
	var song %style(%min)
	goto hum.1
	}

hum.1:
if ($%learn.play > 33) then goto end
	matchre hum %retry.command.triggers
	match songset with only the slightest hint of difficulty.
	matchre adjust (%adjust_up|%adjust_down)
	put %play_comm %song
	matchwait

songset:
	put #var %1_song %song
	goto play.s

adjust:
if (("%style(%min)" = "Scales halt") && ("$1" = "You struggle")) then goto songset
if (("%style(%min)" = "Scales halt") && ("$1" = "You fumble slightly")) then goto songset
	gosub put.1 "stop play" "^You stop|^But"
	if contains("%adjust_up", ("$1") then math min add 1
	elseif contains("%adjust_down", ("$1") then math min subtract 1
	var song %style(%min)
	goto hum.1

play.l:
if %play.song = 1 then
{
	gosub put.1 "%play_comm %song" "^You|^You're"
	var play.song 0
}
play.s:
	if "%2" = "stop" then goto end
	if %pause.song = 0 then
		{
			delay 1
			gosub roundtimedone
			goto play.s
		}
		gosub instrument.setup
var learn.play %temp1(1)
if $%learn.play >= 34 then goto end
goto collect.start
goto play.l

end:
if %play.song != 1 then gosub m.input splay
put #parse playtrain.cmd done.
exit

collect.start:
action goto delay when ^You are still stunned\.
if (($Perception.LearningRate < 34) || ($Foraging.LearningRate < 34)) then gosub put.1 "collect $collect" "^Roundtime:"
else goto play.l

kp:
gosub put.1 "kick pile" "^You take a step back|^I could not"
goto play.l

delay:
delay 10
gosub put.1 "dance silly" "^You leap to your|^Your wounds"
if $standing != 1 then goto delay
goto kp

## instrument difficulty is the 3rd array section(0-3), based on a base difficulty of vocals, 1.
instrument.setup:
	var strings Strings.Ranks|Strings.LearningRate|lyre|1
	var winds Winds.Ranks|Winds.LearningRate|jug|1
	var percussions Percussions.Ranks|Percussions.LearningRate|stick|1
	var vocals Vocals.Ranks|Vocals.LearningRate|0|1
return