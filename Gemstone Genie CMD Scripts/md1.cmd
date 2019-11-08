    Here lemme help you btw
    #Cambrinth and PP
    
    if_4 goto camb
    ECHO ***************
    ECHO ***************
    ECHO USAGE IS: .ppcam  <item> <charge> <spell> <mana>
    ECHO ***************
    ECHO ***************
    exit
    
    camb:
    put remove my camb %1
    put perc
    pause 1
    put charge my cam %1 %2
    pause 1
    put charge my cam %1 %2
    pause 1
    put charge my cam %1 %2
    pause 1
    goto cambfocus
    
    
    cambfocus:
    put focus my cam %1
    goto cast
    
    cast:
    
    match prepwait spell.
    match prepwait already preparing
    match cast ...wait
    put prep %3 %4
    matchwait
    
    prepwait:
    waitfor fully prepared
    put cast
    waitfor You feel fully
    goto camb
    