# Requires two command line variables.
# first = material you are carving(stone, boulder, etc.)
# second = item you are making

var container bag
######################
action goto Done when Applying the final touches, you complete working on

FirstCarve:
matchre Polish Upon finishing you see some discolored areas on the \w*'s surface\.
matchre Riffler Upon completion you notice several rough, jagged edges protruding from the \w*\.
matchre Rasp When you have finished working, you heft the \w* and determine it is no longer level\.
matchre Rasp Once finished you realize the \w* has developed an uneven texture along its surface\.
match Carve Roundtime:
put carve %1 with my chisel
matchwait 5

Carve:
#matchre Polish Upon finishing you see some discolored areas on the \w*'s surface\.
#matchre Riffler Upon completion you notice several rough, jagged edges protruding from the \w*\.
#matchre Rasp When you have finished working, you heft the \w* and determine it is no longer level\.
#matchre Rasp Once finished you realize the \w* has developed an uneven texture along its surface\.
matchre Done Applying the final touches, you complete working on .*\.
match Carve Roundtime:
put carve %2 with my chisel
matchwait

Polish:
put take my polish
match Polish ...wait
matchre Done Applying the final touches, you complete working on .*\.
match StowLeft Roundtime:
put apply polish to %2
matchwait

Riffler:
put take my riffler
match Riffler ...wait
matchre Done Applying the final touches, you complete working on .*\.
match StowLeft Roundtime:
put rub %2 with my riffler
matchwait

Rasp:
put take my rasp
match Rasp ...wait
matchre Done Applying the final touches, you complete working on .*\.
match StowLeft Roundtime:
put scrape %2 with my rasp
matchwait

StowLeft:
match StowLeft ...wait
match Carve You put your
put put $lefthandnoun in %container
matchwait

Done: