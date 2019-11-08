start:
move w
move nw
move n
move w
move w
put go bri
move w
move w
move w
move w
move w
move w
put cli ladder
move s
put cli practice embra
waitfor You finish practicing your climbing skill
move n
put cli ladder
move n
move ne
move ne
move ne
move e
move e
put cli ladder
move w
put cli practice embra
waitfor You finish practicing your climbing skill
move e
put cli ladder
move e
move e
move se
move se
move se
move s
put cli ladder
move n
put cli practice embra
waitfor You finish practicing your climbing skill
move s
put cli ladder
move w
move w
move w
move w
move w
put go bri
move w
move w
move w
move s
move sw
move w
goto exp

exp:
put skill climb
match end mind lock
match start EXP HELP
matchwait

end:
end