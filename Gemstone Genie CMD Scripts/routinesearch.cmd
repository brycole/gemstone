routinesearch:
		
	var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bead|beryl|bloodgem|bloodstone|carnelian|chrysoberyl|carnelian|chalcedony
	var gems2 chrysoberyl|chrysoprase|citrine|coral|crystal|diamond|diopside|emerald|egg|eggcase|garnet|gem|goldstone|glossy malachite
	var gems3 (chunk of|some|piece of).*granite|hematite|iolite|ivory|jade|jasper|kunzite|lazuli|malachite stone|minerals|moonstone|morganite|onyx
	var gems4 opal|pearl|pebble|peridot|quartz|ruby|sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon
	var gemslist %gems1|%gems2|%gems3|%gems4
	var mineral (animite|audrualm|damite|darkstone|electrum|glaes|gold|haralun|icesteel|kertig|lumium|muracite|niello|niniam|orichalcum|platinum|silversteel|tyrium|vardite) (\w+)
	var coin (silver|bronze|copper) (coin|coins)
	var scroll scroll|tablet|vellum|ostracon|hhr'lav'geluhh bark|papyrus roll|smudged parchment|tattered papyrus|seishaka leaf
	var item %coin|%scroll|%gemslist|%mineral|map|ring|stones
	var skintype hoof|skin|hand|claw|paw|pelt|bones|sac|hide|tail|vertebra|hair

	return

skinning:
	if "%container" = "\%container" then echo NO GEM POUCH CONTAINER, please set \%container variable
	if "$righthandnoun" = "%ranged" then gosub retreat
search:
search.now:
	gosub emptyhands
	gosub put.1 "loot %loot" "^You search"
	var stowerror 0
	
loot.loop:
	var stowerror 0
	action var stowerror 1 when ^But that is already in your inventory|^Stow what|^You need a free hand
	
	if matchre("$roomobjs", ("\b(%item)\b(,|\.| \band\b)")) then
	{
	var lootitem $1
		gosub put.1 "stow %lootitem" "%stow.msg"
		if %stowerror = 1 then 
		{
			gosub put.1 "get %lootitem" "%get.msg"
			if matchre("%lootitem", "coin") then goto loot.loop
			if !matchre("$righthand|$lefthand", "%lootitem") then
			{
				put #echo >log Red Error, could not pick up loot! lootitem: %lootitem, room: $roomobjs 
				if ("$lefthand" = ""|"$righthand" = "") then gosub getammo
				goto exitquick
			}
			gosub put.1 "stow %lootitem" "%stow.msg"
			if matchre("$righthand|$lefthand", "%lootitem") then
			{
				put #echo >log Red Error, could not stow loot! lootitem: %lootitem, right: $righthand, left: $lefthand room: $roomobjs 
				if ("$lefthand" = ""|"$righthand" = "") then gosub getammo
				goto exitquick
			}
	    }
		goto loot.loop
	}
	
	action remove ^But that is already in your inventory|^Stow what|^You need a free hand
search.done:
	setvariable skin no
	math monstersdead add 1
	#gosub ammo
	#if "%pouchfull" = "yes" then gosub stowpouch
return

stowpouch:
	setvariable pouchfull no
	if "$lefthandnoun" = "lockpick" then gosub put put lockpick in my %container2
	if "$monstercount" > "%dancekill" then gosub retreat
	pause 0.1
	if "$lefthand" != "Empty" then gosub put put %treasure in my %container3
	gosub put remove my pouch
	pause 0.1
	if "$monstercount" > "%dancekill" then gosub retreat
	gosub put tie my pouch
	pause 0.1
	gosub put put my pouch in my %container1
	if "$monstercount" > "%dancekill" then gosub retreat
	gosub put get pouch from my %container2
	gosub put wear my pouch
	return
	goto mainloop

skinarray:
	if ((%noskin = 1) || (%doarise = 1)) then gosub searchonly
		else 
		{
			if matchre("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then gosub skinarrange
				else gosub searchonly
		}
		
return


searchonly:
	gosub search
return

skinarrange:
	var throwcheck 1
	#if $Skinning.LearningRate > 30 then goto searchonly
	gosub emptyhands
	gosub dodge
	if "$righthandnoun" = "crossbow" then gosub put.1 "tie my cross to toolstrap" "%wear.msg"
	if "$righthandnoun" = "longbow" then gosub wearbow
	gosub arrange
	gosub put.1 "get my knife from my bald" "%get.msg"
	gosub put.1 "skin" "^Roundtime|^Skin|cannot be skinned\."
	if $bundle = 1 then
	{
		gosub dobundle
		if matchre("$lefthandnoun", "(%skintype)") then gosub put.1 "put my $lefthandnoun in my bundle" "^You carefully fit"
		if matchre("$righthandnoun", "(%skintype)") then gosub put.1 "put my $righthandnoun in my bundle" "^You carefully fit"
	}	
	gosub emptyhands
	gosub search
return

arrange:
	action (arrangeall) var arrange.again 1 when ^That creature cannot
	action (arrangeall) on
	
	var arrange.again 0
	#gosub put.1 "arrange all for %arrange.first" "^Roundtime|^Arrange|cannot be skinned|^That creature cannot"
	#gosub put.1 "arrange for %arrange.first" "^Roundtime|^Arrange|cannot be skinned|^That creature cannot"
	#gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned|^That creature cannot"
	#gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned|^That creature cannot"
	#gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned|^That creature cannot"
	#gosub put.1 "arrange" "^Roundtime|^Arrange|cannot be skinned|^That creature cannot"
	#if %arrange.again = 1 then gosub put.1 "arrange all for %arrange.second" "^Roundtime|^Arrange|cannot be skinned|^That #creature cannot"
	
	action (arrangeall) off
return
