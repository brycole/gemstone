#debuglevel 10


action var lineone $1 when (.+)
action var linetwo $1 when (.+)
action var linethree $1;echo %lineone;echo %linetwo;echo %linethree when $1 (.+)

start:

delay 300
end