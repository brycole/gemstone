include base.cmd

## tanner
gosub rf
## muspari gosub move 196
gosub move 275

action goto end.sell when ^Remove what

bund.sell:
gosub rel
gosub put.2 "remove bund" "sell bund" "^You ask|^Sell what"
gosub stow rope
goto bund.sell

end.sell:
put #var bund.loc1 0
put #var bund.loc5 0

## Going to the bank
delay 1
#gosub rf
## ** Ratha bank 
gosub move 256
## ** muspari bank gosub move 202
gosub rel
gosub put.1 "exchange all dokoras for lirums"
gosub put.1 "exchange all kronars for lirums"
## ** muspari bank gosub move 201
gosub put.1 "info" "^Wealth"
gosub put.1 "check balance" "^The clerk pages"
gosub put.1 "deposit all" "^The clerk slides|^You don't"
gosub put.1 "check balance" "^The clerk pages"
##gosub move 172
gosub move 48
put #parse sellbund.cmd done.
exit


