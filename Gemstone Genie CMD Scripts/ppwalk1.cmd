action send $lastcommand when ^\.\.\.wait|^Sorry, you may only type
    
    pow:
    send pow
    waitfor Roundtime:
    goto moverandom
    
    moverandom:
    random 1 8
    if %r = 1 and $north = 0 then goto moverandom
    if %r = 2 and $northeast = 0 then goto moverandom
    if %r = 3 and $east = 0 then goto moverandom
    if %r = 4 and $southeast = 0 then goto moverandom
    if %r = 5 and $south = 0 then goto moverandom
    if %r = 6 and $southwest = 0 then goto moverandom
    if %r = 7 and $west = 0 then goto moverandom
    if %r = 8 and $northwest = 0 then goto moverandom
    
    if %r = 1 then var direction north
    if %r = 2 then var direction northeast
    if %r = 3 then var direction east
    if %r = 4 then var direction southeast
    if %r = 5 then var direction south
    if %r = 6 then var direction southwest
    if %r = 7 then var direction west
    if %r = 8 then var direction northwest
    
    move %direction
    
    goto pow