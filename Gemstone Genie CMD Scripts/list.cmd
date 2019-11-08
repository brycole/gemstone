action put #echo green "  $1";put #parse @$2. when ^@([^,]+), (.+)\.
action var parse $1;goto parse when ^@([^,]+)\.
action var container $1 $2 $3;var parse $4;goto init when ^(On|In|You rummage through|You|He|She) (.+) (you see|and see|wearing) (.+)\.

loop:
    pause 10
    goto loop

parse:
    if contains("%parse", " and ") then
    {
        eval parse replace("%parse", " and ", ", ")
        put #parse @%parse.
    }
    else
    {
        put #echo green "  %parse"
    }
    goto loop

init:
    pause 0.1
    echo
    put #echo green %container:
    put #parse @%parse.
    goto loop
