#put #script debug 5
var boxes \bbox\b|caddy|casket|chest|coffer|crate|skippet|strongbox|trunk
var petboxstorage case
var CURRENTBOX null
######OPTIONAL SECTION FOR BURDEN, FEEL FREE TO COMMENT OUT######
######REMEMBER TO ALSO REMOVE THE CORRESPONDING SECTION BELOW####
put #goto teller
match NEXT barred windows faces you
matchwait

NEXT: 
send deposit all
pause .5
send withdraw 50000 copper kronars
pause
put out
pause 
put out
pause 
put #goto n gate
match NEXT2 the road deteriorates still further 
matchwait

NEXT2:
#################################################################
#####LOOT VARIABLES (Exported from GenieHunter)#####
	var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bead|beryl|bloodgem|bloodstone|carnelian|chalcedony|chrysoberyl|chrysoprase|citrine
	var gems2 crystal|diamond|diopside|\begg\b|eggcase|emerald|garnet|\bgem\b|glossy malachite|goldstone|(chunk of|some|piece of).*granite|hematite|iolite|ivory
	var gems3 jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|onyx|opal|pearl|pebble|peridot|#quartz|ruby
	var gems4 sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon
	var gweths jadeite stones
	var boxtype brass|copper|deobar|driftwood|iron|ironwood|mahogany|oaken|pine|steel|wooden
	var boxes \bbox\b|caddy|casket|chest|coffer|crate|skippet|strongbox|trunk
	var junkloot hhr'lav'geluhh bark|ostracon|package|papyrus roll|scroll|sheiska leaf|smudged parchment|jadice flower|stout lockpick|tablet|vellum|kirmhiro draught|map
	var collectibles albredine ring|(?<!crossbow) \bbolts?\b|crystal ring|\bdira\b|flarmencrank|\bgear\b|glarmencoupler|kirmhiro draught|\bmap\b|\bnuts?\b|package|rackensprocket|soulstone|spangleflange
	var boxloot %gems1|%gems2|%gems3|%gems4|coin|%junkloot|%gweths|%collectibles

START:	
	if $Locksmithing.LearningRate > 30 then goto DONE
	if $righthand != ("Empty"|%boxes) then send stow right
	pause
	if $lefthand != ("Empty"|%boxes) then send stow left
	pause
	matchre LOCK2 %boxes
	put look in my %petboxstorage
	matchwait 3

	echo ***OUT OF BOXES***
	echo ***OUT OF BOXES***
	echo ***OUT OF BOXES***
	goto DONE

	LOCK2:
	if $Locksmithing.LearningRate > 30 then goto DONE
	var CURRENTBOX $0
	if $righthand = "Empty" then send get my %CURRENTBOX
	pause	
	matchre NEWBOX click|not even locked
	match LOCK2 Roundtime
	put pick my %CURRENTBOX blind
	matchwait 
	
	NEWBOX:
	send open my %CURRENTBOX
	pause
	matchre BOXLOOTSET %boxloot
	put look in my %CURRENTBOX
	matchwait 2
	send drop my %CURRENTBOX
	pause	
	goto START

	BOXLOOTSET:
	var PRIZE $0
	send get %PRIZE
	pause
	send stow %PRIZE
	pause
	goto NEWBOX

	DONE:
########OPTIONAL################
	if $righthand != Empty then send stow right
	if $lefthand != Empty then send stow left
	pause
	put #goto crossing
	pause 2
	put #goto teller
	waitfor barred windows faces you
	send deposit all 
	echo DONE WITH LOCKPICKING
	