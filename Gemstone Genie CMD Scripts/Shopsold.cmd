#debuglevel 10
Shops.Setup:
#Aesry
if ($zoneid = 99) then
	{
	if "$charactername" = "Pravia" then
		{
		var destination_names herb shop|clothing shop|cleric shop|general store
		var destinations 104|432|424|414
		var items small.vial 2|britches 0|sage 6|flint 6
		}
	}
#Crossing
if ($zoneid = 1) then
	{
	if ("$charactername" = "Pravia") then
		{
		var destination_names alchemist|herbalist|general store|cleric shop|bathhouse|locksmith|bard shop|armory|weapon shop|jeweler|stitchery|cobbler
		var destinations 227|220|190|517|344|219|510|193|192|398|552|553
		var items pestle 2|jadice.flower 2|flint 4|incense 4|scraping.reed 4|slim.lockpick 4|rag 4|leather.aventail 4|cudgel 4|hairpin 4|beret 4|anklets 4
		}
	if ("$charactername" = "Kaelara" then
		{
		var destination_names alchemist|flower shop|general store|bard shop|armory
		var destinations alchem|flower|general|cleric shop|bard shop|armor
		var items grain.alcohol 4|poppy 4|envelope 4|chamomile 4|pick 4|gloves 4
		}
	}
#Ratha
if ($zoneid = 90) then
	{
	if "$charactername" = "Kaelara" then
		{
		var destination_names alchemist|general store|bait shop
		var destinations alchem|chand|bait
		var items grain.alcohol 4|dried.beef 4|handmade.flies 4
		}
	}
var cur_dest 0

Shops.Run:
if "%destinations(%cur_dest)" = "" then goto Shops.Done
put #goto %destinations(%cur_dest)
waitfor You have arrived
gosub Steal %items(%cur_dest)
math cur_dest add 1
pause
goto Shops.Run

Shops.Done:
pause
put #parse Shops Done
pause .5
put #parse Shops Done
exit

Shops.Includes:
include steal.cmd
