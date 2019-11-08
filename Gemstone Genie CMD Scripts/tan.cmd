include base.cmd

action var scrape 0 when ^The skin looks
action var lotion 0 when ^That seems to be

scrape:
var scrape 1
gosub put.1 "scrape %1 with scraper careful" "^You carefully"
if %scrape = 1 then goto scrape
gosub put.1 "stow scrape" "^You put"
gosub put.1 "get lot" "^You get"

lotion:
var lotion 1
gosub put.1 "pour lot on %1" "^You pour"
if %lotion = 1 then goto lotion