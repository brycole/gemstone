debuglevel 10

var donotcastlist Moonstone
var Destination east
var returnhome 0

	if (((matchre("$roomobjs", "exchange rate board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) then echo TRUE DO NOT CAST
else echo FALSE CAST EOTB
