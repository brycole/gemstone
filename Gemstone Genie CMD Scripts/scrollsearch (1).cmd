var container %1
var type fine scroll|yellow scroll|moldering scroll|tattered scroll|leaf|wax tablet|clay tablet|bark|parchment|papyrus|vellum|ostracon|roll
var type.max count("%type","|")
var typeC 0
var ordinal first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth
var ordinal.max count("%ordinal","|")
var ordinalC 0
var sort 0
var searchlist Hand of

action var scrollname $1 when ^It is labeled "(.+)\."

loop:
	if %typeC > %type.max then exit
	if %ordinalC > %ordinal.max then gosub sort
	matchre nextType I could not find what you were referring to
	matchre nextOrd It is labeled
	put look at %ordinal(%ordinalC) %type(%typeC) in my %container
	matchwait

nextType:
	math typeC add 1
	var ordinalC 0
	var sort 0
	goto loop

nextOrd:
	if matchre("%scrollname", "%searchlist") then
	{
		put get my %ordinal(%ordinalC) %type(%typeC) in my %container
		pause
		put lower ground left
	}
	math ordinalC add 1
	goto loop
	
sort:
	put sort %type(%typeC) in my %container
	var ordinalC 0
	if %sort = 1 then goto nextType
	math sort add 1	
	return