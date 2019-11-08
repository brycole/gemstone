put #var findpawn White birch shelves, piled high with used weapons and armor, line the walls.
put #var pawntrash I have no need for that.
put #var pawnsell gives it a quick but thorough examination.
if_1 then setvar end.room 630


action goto aesryend1 when The Halfling-sized burrow must be closed for the night.

gosub move 107;## tanners
gosub steal "hide scraper" 4
##gosub move 104;## alchemist
##gosub steal "cebi root" 6
gosub move 608;## makoda cloth
gosub steal "linen tunic" 5
gosub move 607;## scriptorium
gosub steal "crimson scroll" 4
gosub move 606;## cleric supplies
gosub steal wine 6
gosub move 605;## origami
gosub steal "plain paper" 6
gosub move 604;## cambrinth shop
gosub steal "marble in bucket" 1
gosub move 603;## puzzles
gosub steal "satin clowns" 6
gosub move 602;## footwear
gosub steal "woolen tights" 6
gosub move 414;## general store
gosub steal hairbrush 4
gosub move 601;## flower shop
gosub steal "foxglove wristlet" 4
gosub move 600;## music
gosub steal bow 6
gosub move 51;## outrageous fortune
put kneel
pause 1
put go burrow
pause 1
gosub steal "small rocks" 2

aesryend:
pause
put go open
pause
put dance silly
pause
goto end

aesryend1:
put dance silly
goto end