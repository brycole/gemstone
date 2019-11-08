gosub routinecommon
gosub routinemoonbuffs

var resonance climbing
var monitor no
var shardform 0
var imbuespell dazzle
var totalshard %2
var shardcount 0
if "%1" = "katamba" then var imbuespell shadows

action var shardform 1 when ^You focus your attention on the shard, causing it to float over into your hand.
action goto beaconexit when far too broken to scribe anything.|fail to find it
action goto newshard when then falls to the (floor|ground)

gosub put.1 "power" "^Roundtime"
	
bigloop:
	echo %shardcount toal shards created!
	if %shardcount >= %totalshard then goto beaconexit
	
	gosub prep pg 15
	gosub put.1 "harness 15" "^Roundtime"
	delay 3
	gosub cast
	
	gosub prep cv 15
	gosub put.1 "harness 15" "^Roundtime"
	delay 3
	gosub cast

newshard:
	gosub release
	var shardform 0

	
	gosub prep fm
	gosub put.1 "harness 10" "^Roundtime"
	gosub cast %1
	gosub prep imbue
	delay 3
	gosub cast

shardloop:
	if %shardform = 1 then goto shardformed
	gosub put.1 "charge shard 11" "^You harness"
	gosub prep %imbuespell 18
	gosub put.1 "charge shard 11" "^You harness"
	gosub put.1 "harness 18" "^Roundtime"
	gosub cast shard
	goto shardloop

shardformed:
	gosub put.1 "swap" "^You move"
	gosub put.1 "study cat" "^Roundtime"
	gosub get burin
	if "%Aura" = "off" then gosub aus
	gosub put.1 "scribe shard" "^Roundtime"
	var sigilobject magpie
bindsigil:
	gosub put.1 "study %sigilobject" "^Roundtime"
	if "%Aura" = "off" then gosub aus
	gosub put.1 "scribe shard" "^Roundtime"
	gosub prep %imbuespell 12
	delay 2
	gosub cast shard
	gosub put.1 "Stow burin" "^You put"
	gosub put.1 "focus shard" "^Roundtime"
	gosub put.1 "focus shard" "^Roundtime"
	gosub get burin
	if "%sigilobject" = "%1" then goto chargeshard
	var sigilobject %1
	goto bindsigil

chargeshard:
	gosub put.1 "stow burin" "^You put"
	gosub put.1 "charge shard 11" "^You harness"
	gosub put.1 "charge shard 11" "^You harness"
	gosub put.1 "focus shard" "^Roundtime"
	gosub stow shard
	math shardcount add 1
		
goto bigloop
	
beaconexit:

put #beep
put #flash
exit


include routinecommon.cmd
include routinemoonbuffs.cmd