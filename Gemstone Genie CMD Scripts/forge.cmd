#debug 10
#if_4 goto setup

#echo First must be item being made, second is chapter in book, third is page, fourth is number of items being made, fifth is optional, the ingredient needed
#exit

#Need 2 triggers below



var ordinal zeroth|first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth

setup:
counter set 0


var ingredient no

var modifier no

action put #queue clear;put #send 1 $lastcommand when ^Sorry,|^\.\.\.wait
action (book) var page $1 when Page (\d+): a $item
action (book) var ingredient $1 when wooden (hilt|haft|pole)$
action (book) var modifier $1 when (long|short) wooden pole$


begin:
action (book) on
put get my weapon book
waitforre ^You get|^You are
if %c > 0 then goto study
put turn my book to chapter $chapter
waitforre ^You turn|^The book
put read my book
waitforre Chapter
pause
put turn book to page %page
waitforre ^You turn|^You are
put read my book
waitforre A list of ingredients is provided
action (book) off
pause

put #var item {#eval {replacere("$item", "metal", "")}}

action var tool bellows;var action push my bellows when ^As you finish working the fire dims and produces less heat from the stifled coals\.
action var tool tongs;var action turn $item with my tong when ^You notice the .+ would benefit from some soft reworking\.|^The .+ could use some straighting along the horn of the anvil\.
action var tool shovel;var action push fuel with my shovel when ^As you complete working the fire dies down and appears to need some more fuel\.
action var tool hammer;var action push tub with $item when  ^The .+ is complete and ready for a quench hardening in the slack tub\.
action var tool complete when ^The .+ now appears ready for grinding and polishing on a grinding wheel\.
action var tool hammer;var action pound $item with my hammer when ^push my bellows|^turn $item with my tong|^push fuel with my shovel|^push tub with $item
action var assemble YES when ^\[Ingredients can
action var extra yes when ^You realize the .+ will not require as much metal as you have, and so you split the ingot and leave the portion you won't be using on the ground\.

if "%modifier" != "no" then var ingredient %modifier %ingredient

if "%ingredient" != "no" then
{
gosub count.ingredients
if %purchase > 0 then gosub move forging tools
gosub m.inputuy.ingredient
counter set 0
if matchre("$roomobjs", "forge") then put #send 2 nod
echo Nod when you're at an anvil ready to forge.
waitforre ^You nod
}

study:
put study my book
waitforre ^Roundtime
pause
put stow my book

var tool hammer
var action pound $item with my hammer
var first yes
#action (pound) off

setup.anvil:
put get my ingot
waitforre ^You get|^You are
put put my ingot on anvil
waitforre ^You put your
put get my hammer
waitforre ^You get
put get my tongs
waitforre ^You get
put pound ingot with my hammer
waitforre ^Roundtime
pause .5

if "%extra" = "yes" then
{
put stow my hammer
waitforre ^You
put stow ingot
waitforre ^You pick
put get my hammer
waitforre ^You get
}

work:
#action (pound) off
if "$righthandnoun" != "%tool" then gosub get %tool
if "$lefthandnoun" != "tongs" then gosub get tongs
#if "%tool" != "hammer" then action (pound) on
put %action
waitforre ^Roundtime
pause .5
if "%tool" = "complete" then goto finish
goto work

get:
if "%tool" = "tongs" then return
if "$righthand" != "Empty" then gosub stow right
put get my $1
waitforre ^You get|^You are
return

stow:
put stow right
waitforre ^You put
return

buy.ingredient:
if %purchase = 0 then return
put buy %ingredient
waitforre ^The sales clerk
put stow my %ingredient
waitforre ^You put|^You stow
counter add 1
if %c = %purchase then return
goto buy.ingredient

count.ingredients:
var temp $number
count.ingredients.2:
put tap my %ordinal($number) %ingredient
waitforre ^(I could not|You tap)
if matchre("$1", "You tap") then
{
evalmath purchase %temp - $number
put #var number %temp
return
}
put #math number subtract 1
if $number = 0 then
{
var purchase %temp
put #var number %temp
return
}
goto count.ingredients.2

finish:
put stow right
waitforre ^You put|^Stow what
put stow left
waitforre ^You put|^Stow what
put get $item
if "%assemble" = "YES" then
{
put get %ingredient
waitforre ^You get
put assemble %ingredient with $item
wait
}
if matchre("$roomobjs", "grindstone") then goto turn.grindstone
put #play arrive.wav
echo look for a grindstone, then NOD when ready to proceed
waitforre ^You nod\.$


turn.grindstone:
matchre push.grindstone ^Straining a bit less you add force to the grindstone, making it spin even faster\.|^Straining a bit less you maintain force to the grindstone, keeping it spinning fast\.
matchre turn.grindstone ^Roundtime
put turn grindstone
matchwait

push.grindstone:
put push grind with my $item
waitforre ^Roundtime
pause .5
put get my oil
waitforre ^You get
put pour oil on my $item
waitforre ^Roundtime
pause .5
put stow my oil
waitforre ^You put
put get my forg logbook
waitforre ^You get
put bundle my $item with my logbook
counter add 1
if %c = $number then goto done
put stow right
waitforre ^You put|^Stow what
put stow left
waitforre ^You put|^Stow what
if matchre("$roomobjs", "forge") then goto begin
echo Return to forge, nod when done
put #play arrive.wav
waitforre ^You nod\.$
goto begin

done:
put #var item empty
echo Completed work order, turn it in
exit

includes:
include move.cmd