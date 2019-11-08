debuglevel 10

action var townguard $1 when ^A (town guard|^Riverhaven Warden) (ambles|strides) (\w+).

loop:
	delay .5
	put accuse jessalyne necromancy
	if !matchre("$roomobjs", "warden") then 
	{
		put %townguard
		delay .5
	}
goto loop