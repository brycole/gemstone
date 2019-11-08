if $pawn = 1 then goto pawnexit
Variables:
var container backpack

Actions:
action var contents $1 when ^In the .+ you see (.+)
action var last_item $1 when You get (.+) from inside your
action var item $1;goto Sell when ^Contains .+ (\S+)(?:\.|,| and)

put l in my %container
pause .5

Item_Set:
put #parse Contains %contents

Sell:
put get %item from my %container
match Trash $pawntrash
match Next_Item $pawnsell
put sell my %item
matchwait

Trash:
put drop %item
##put %item in $Garbage

Next_Item:
matchre Update_Contents The New Variable is (.+)
put .setremove "%contents" "%last_item"
matchwait

Update_Contents:
if ($1 = "") then goto exit
var contents $1
goto Item_Set

exit:
put #var pawn 1
echo Pawning done!
echo Starting swim.
send .$pawnswim
pawnexit: