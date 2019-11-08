	gosub routinecommon
	gosub routinemoonbuffs
	gosub routineenchant

	var shard %1
	var item %2
	var totalmind %3
	var mindcount 0
	var pageburn 0
	var astralshard Marendin

	if "%1" = "red" then var moon Yavash
	if "%1" = "blue" then var moon Xibar
	if "%1" = "black" then var moon Katamba
	
	if "%1" = "grazhir" then var moon Grazhir
	if "%1" = "grazhir" then var shard red

	action goto guide.exit when The burin twists and cracks, making it useless!
	action math pageburn add 1 when but the page crinkles and turns black afterwards
	
	gosub put.1 "power" "^Roundtime"
	
	if "%1" = "cradle" then goto cradle
	gosub put.1 "align moon sever" "^Roundtime|^You cannot"
	gosub put.1 "align moon %moon" "^Roundtime"
		
crystalmind:
	if %mindcount >= %totalmind then goto guide.done
	if %pageburn > 0 then goto guide.done
	gosub put.1 "get %shard shard" "^You get"
	if "$righthandnoun" != "shard" then goto guide.exit

	gosub sigil.check white 10 Shrew
	gosub sigil.check black 8 Unicorn
	gosub sigil.check black 2 Durgaulda
	gosub sigil.check blue 5 Scales
	
	gosub put.1 "invoke crystal" "^Roundtime"
	gosub put.1 "touch %astralshard with crystal"
	
	gosub put.1 "focus cry" "^Roundtime"
	gosub put.1 "put cry in bag" "%stow.msg"

	waitforre ^Your psyche feels whole again.
	put #beep
	put #flash
	math mindcount add 1
	echo %1 %2 crystal mind created.
	echo Ready to make another mind!

concentrationloop:
	if $concentration < 75 then
	{	 
		delay 3
		goto concentrationloop
	}	
	goto crystalmind
	
guide.exit:
	echo Out of %1 shards!
guide.done:
	echo %pageburn pages burned.
	echo Created %mindcount minds!
	put #beep
	put #beep
	put #flash
	gosub put.1 "align moon sever" "^Roundtime|^You cannot
exit	

cradle:
#goto cradlegoto
	gosub prep imbue 15
	delay 7
	gosub cast %item
	gosub prep imbue 15
	delay 7
	gosub cast %item

	gosub sigil.check white 3 Katamba
	gosub sigil.check blue 1 Yavash
cradlegoto:
	gosub sigil.check white 4 Xibar
	
exit
	
include routinecommon.cmd
include routinemoonbuffs.cmd
include routineenchant.cmd