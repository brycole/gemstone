#Heal with herbs
# based on the DR Secrets script "medicine.txt"
# expressions tested with http://regexhero.net/
# Herb checking by jalika
# -Barnacus 

setvar herb_container pyra

IF_1 GOTO %1
GOTO INIT
CHE:
CHECK:
#Initialize Supplies
setvar need_plovik 1
setvar need_eghmok 1
setvar need_nemoih 1
setvar need_ithor 1
setvar need_nilos 1
setvar need_muljin 1
setvar need_hulnik 1
setvar need_junliar_or_blocil 1
setvar need_georin 1
setvar need_riolur 1
setvar need_jadice 1
setvar need_yelith 1
setvar need_sufil 1
setvar need_aevaes 1
setvar need_lujeakave 1
setvar need_cebi 1
setvar need_hisan 1
setvar need_aloe 1

action setvariable need_yelith 0 when You rummage.*yelith
action setvariable need_jadice 0 when You rummage.*jadice
action setvariable need_nemoih 0 when You rummage.*nemoih
action setvariable need_georin 0 when You rummage.*georin
action setvariable need_eghmok 0 when You rummage.*eghmok
action setvariable need_riolur 0 when You rummage.*riolur
action setvariable need_plovik 0 when You rummage.*plovik
action setvariable need_ithor 0 when You rummage.*ithor
action setvariable need_nilos 0 when You rummage.*nilos
action setvariable need_muljin 0 when You rummage.*muljin
action setvariable need_hulnik 0 when You rummage.*hulnik
action setvariable need_junliar_or_blocil 0 when You rummage.*junliar
action setvariable need_sufil 0 when You rummage.*sufil
action setvariable need_cebi 0 when You rummage.*cebi
action setvariable need_hisan 0 when You rummage.*hisan
action setvariable need_aevaes 0 when You rummage.*aevaes
action setvariable need_lujeakave 0 when You rummage.*lujeakave
action setvariable need_aloe 0 when You rummage.*aloe

put rummage my %herb_container
waitfor You rummage
GOTO supplies

ScriptError:
ECHO *********************************
ECHO *** Usage:
ECHO *** To see what herbs you need:
ECHO ***     .healme check
ECHO *** To heal:
ECHO ***     .healme
ECHO *********************************
EXIT

INIT:

#Initialize Supplies
setvar need_plovik 0
setvar need_eghmok 0
setvar need_nemoih 0
setvar need_ithor 0
setvar need_nilos 0
setvar need_muljin 0
setvar need_hulnik 0
setvar need_junliar_or_blocil 0
setvar need_georin 0
setvar need_riolur 0
setvar need_jadice 0
setvar need_yelith 0
setvar need_sufil 0
setvar need_aevaes 0
setvar need_lujeakave 0
setvar need_cebi 0
setvar need_hisan 0
setvar need_aloe 0

# Initialize wound variables
setvar ext_head 0
setvar int_head 0
setvar ext_chest 0
setvar int_chest 0
setvar ext_abdomen 0
setvar int_abdomen 0
setvar ext_back 0
setvar int_back 0
setvar ext_neck 0
setvar int_neck 0
setvar ext_limb 0
setvar int_limb 0
setvar ext_eye 0
setvar int_eye 0
setvar nerves 0
setvar skin 0
setvar ext_scar 0
setvar int_scar 0

# Initialize actions
ACTION setvar ext_head 1 WHEN (?!bruis)(\s|\w)*(about the|to the|malformed)+(\s|\w)*head|skull
ACTION setvar int_head 1 WHEN (bruis|bloat)(\w|\s)*head
ACTION setvar ext_chest 1 WHEN (,| )some((?!bruis(ed|ing))(\s|\w))*(\bchest\b)(\s|\w)*(\.|,|$)
ACTION setvar int_chest 1 WHEN (\w|\s)*bruis(\w|\s)+chest
ACTION setvar ext_abdomen 1 WHEN (,| )some ((?!bruis(ed|ing))(\s|\w))*(\babdomen\b)(\s|\w)*(\.|,|$)
ACTION setvar int_abdomen 1 WHEN  (\w|\s)*(bruis|disco)(\w|\s)+abdomen
ACTION setvar ext_back 1 WHEN (,| )(a|some) ((?!bruis(ed|ing))(\s|\w))*(\bback\b)(\s|\w)*(\.|,|$)
ACTION setvar int_back 1 WHEN (\w|\s)*(bruis|disco)(\w|\s)+back
ACTION setvar ext_neck 1 WHEN (,| )(a|some) ((?!(bruis|bloat)(ed|ing))(\s|\w))*(\bneck\b)(\s|\w)*(\.|,|$)
ACTION setvar int_neck 1 WHEN (\w|\s)*(bruis|disco)(\w|\s)+neck
ACTION setvar ext_limb 1 WHEN (,| )(a|some) ((?!(bloat|bruis)(ed|ing))(\s|\w))*((left|right) (leg|arm|hand))(\s|\w)*(\.|,|$)
ACTION setvar int_limb 1 WHEN (\w|\s)*(bruis|disco|swollen)(\w|\s)+((left|right) (leg|arm|hand))
ACTION setvar ext_eye 1 WHEN (?!bruis)(\s|\w)*(bleed|shatt|to the|for a)+(\s|\w)*eye
ACTION setvar int_eye 1 WHEN (\w|\s)*(bruis|swollen)(\w|\s)+eye\b

ACTION setvar nerves 1 WHEN (slight numbness in your fingers and toes|some minor twitching|severe twitching|difficulty controlling actions|paralysis of the entire body)
ACTION setvar skin 1 WHEN (rash|sores)

#These also get set when any internal or external wound is healed, since a scar will result.
ACTION setvar ext_scar 1 WHEN (mangled and malformed|severe scarring|minor scars|some tiny scars|few nearly invisible scars|difficulty getting a breath without pain|scarring|scarred|scarred|painfully mangled|malformed|socket overgrown with bits of odd shaped flesh|punctured and shriveled|paralyzed|clouded|skin tone|skin discoloration|folded skin|shriveled skin|skin loss)
ACTION setvar int_scar 1 WHEN (difficulty getting a breath without pain|twitching|twitch|somewhat emaciated look|socket overgrown with bits of odd shaped flesh|punctured and shriveled|paralyzed|clouded|numbness)

#Secondary resupply action
ACTION setvar need_%s 1 WHEN ^That was the last of your

#Figure out what needs healing
PUT health
wait

#Take herbs for anything that picked up by the triggers
ext_head:
	if (%ext_head = 1) then GOTO heal_ext_head
	GOTO int_head

heal_ext_head:
	SAVE nemoih
	setvar ext_scar 1
	match heal_ext_head ...wait
	match heal_ext_head2 What were you referring to
	match int_head You eat
	put eat my nemoih root 
	matchwait

heal_ext_head2:
	match heal_ext_head2 ...wait
	match int_head You drink
	match need_nemoih Drink what?
	put drink my nemoih potion
	matchwait
need_nemoih:
	setvar need_nemoih 1

int_head:
	if (%int_head = 1) then GOTO heal_int_head
	GOTO ext_chest

heal_int_head:
	SAVE eghmok
	setvar int_scar 1
	match heal_int_head ...wait
	match heal_int_head2 Drink what?
	match ext_chest You drink
	put drink my eghmok potion 
	matchwait

heal_int_head2:
	match heal_int_head2 ...wait
	match ext_chest You eat
	match need_eghmok What were you referring to
	put eat my eghmok moss
	matchwait
need_eghmok:
	setvar need_eghmok 1

ext_chest:
	if (%ext_chest = 1) then GOTO heal_ext_chest
	GOTO int_chest

heal_ext_chest:
	SAVE plovik
	setvar ext_scar 1
	match heal_ext_chest ...wait
	match heal_ext_chest2 What were you referring
	match int_chest You eat
	put eat my plovik leaf 
	matchwait

heal_ext_chest2:
	match heal_ext_chest2 ...wait
	match int_chest You drink
	match need_plovik Drink what?
	put drink my plovik tea
	matchwait
need_plovik:
	setvar need_plovik 1

int_chest:
	if (%int_chest = 1) then GOTO heal_int_chest
	GOTO ext_abdomen

heal_int_chest:
	SAVE ithor
	setvar int_scar 1
	match heal_int_chest ...wait
	match ext_abdomen You drink
	match need_ithor Drink what?
	put drink my ithor potion 
	matchwait
need_ithor:
	setvar need_ithor 1

ext_abdomen:
	if (%ext_abdomen = 1) then GOTO heal_ext_abdomen
	GOTO int_abdomen

heal_ext_abdomen:
	SAVE nilos
	setvar ext_scar 1
	match heal_ext_abdomen ...wait
	match heal_ext_abdomen2 What were you referring
	match int_abdomen You eat
	put eat my nilos grass 
	matchwait

heal_ext_abdomen2:
	match heal_ext_abdomen2 ...wait
	match int_abdomen You eat
	match need_nilos What were you referring
	put eat my nilos salve 
	matchwait
need_nilos:
	setvar need_nilos 1

int_abdomen:
	if (%int_abdoment = 1) then GOTO heal_int_abdomen
	GOTO ext_back

heal_int_abdomen:
	SAVE muljin
	setvar int_scar 1
	match heal_int_abdomen ...wait
	match heal_int_abdomen2 What were you referring
	match ext_back You eat
	put eat my muljin sap 
	matchwait

heal_int_abdomen2:
	match heal_int_abdomen2 ...wait
	match ext_back You eat
	match need_muljin What were you referring
	put eat my muljin paste 
	matchwait
need_muljin:
	setvar need_muljin 1

ext_back:
	if (%ext_back = 1) then GOTO heal_ext_back
	GOTO int_back

heal_ext_back:
	SAVE hulnik
	setvar ext_scar 1
	match heal_ext_back ...wait
	match heal_ext_back2 What were you referring
	match int_back You eat
	put eat my hulnik grass
	matchwait

heal_ext_back2:
	match heal_ext_back2 ...wait
	match int_back You eat
	match need_hulnik What were you referring
	put eat my hulnik salve
	matchwait
need_hulnik:
	setvar need_hulnik 1

int_back:
	if (%int_back = 1) then GOTO heal_int_back
	GOTO ext_neck

heal_int_back:
	SAVE junliar_or_blocil
	setvar int_scar 1
	match heal_int_back ...wait
	match heal_int_back2 What were you referring
	match ext_neck You eat
	put eat my junliar stem
	matchwait

heal_int_back2:
	match heal_int_back2 ...wait
	match ext_neck You drink
	match heal_int_back3 Drink what?
	put drink my junliar solution
	matchwait

heal_int_back3:
	match heal_int_back3 ...wait
	match ext_neck You drink
	match heal_int_back4 Drink what?
	put drink my blocil potion
	matchwait

heal_int_back4:
	match heal_int_back4 ...wait
	match ext_neck You eat
	match need_junliar_or_blocil What were you referring
	put eat my blocil berries
	matchwait
need_junliar_or_blocil:
	setvar need_junliar_or_blocil 1

ext_neck:
	if (%ext_neck = 1) then GOTO heal_ext_neck
	GOTO int_neck

heal_ext_neck:
	SAVE georin
	setvar ext_scar 1
	match heal_ext_neck ...wait
	match heal_ext_neck2 What were you referring
	match int_neck You eat
	put eat my georin grass
	matchwait

heal_ext_neck2:
	match heal_ext_neck2 ...wait
	match int_neck You eat
	match need_georin What were you referring
	put eat my georin salve
	matchwait
need_georin:
	setvar need_georin 1

int_neck:
	if (%int_neck = 1) then GOTO heal_int_neck
	GOTO ext_limb

heal_int_neck:
	SAVE riolur
	setvar int_scar 1
	match heal_int_neck ...wait
	match heal_int_neck2 What were you referring
	match ext_limb You eat
	put eat my riolur leaf
	matchwait

heal_int_neck2:
	match heal_int_neck2 ...wait
	match ext_limb You drink
	match need_riolur Drink what?
	put drink my riolur tea
	matchwait
need_riolur:
	setvar need_riolur 1

ext_limb:
	if (%ext_limb = 1) then GOTO heal_ext_limb
	GOTO int_limb

heal_ext_limb:
	SAVE jadice
	setvar ext_scar 1
	match heal_ext_limb ...wait
	match heal_ext_limb2 What were you referring
	match int_limb You eat
	put eat my jadice flower 
	matchwait

heal_ext_limb2:
	match heal_ext_limb2 ...wait
	match int_limb You drink
	match need_jadice Drink what?
	put drink my jadice potion
	matchwait
need_jadice:
	setvar need_jadice 1

int_limb:
	if (%int_limb = 1) then GOTO heal_int_limb
	GOTO ext_eye

heal_int_limb:
	SAVE yelith
	setvar int_scar 1
	match heal_int_limb ...wait
	match ext_eye You eat
	match need_yelith What were you referring
	put eat my yelith root
	matchwait
need_yelith:
	setvar need_yelith 1

ext_eye:
	if (%ext_eye = 1) then GOTO heal_ext_eye
	GOTO int_eye

heal_ext_eye:
	SAVE sufil
	setvar ext_scar 1
	match heal_ext_eye ...wait
	match int_eye You eat
	match need_sufil What were you referring
	put eat my sufil sap 
	matchwait
need_sufil:
	setvar need_sufil 1

int_eye:
	if (%int_eye = 1) then GOTO heal_int_eye
	GOTO skin

heal_int_eye:
	SAVE aevaes
	setvar int_scar 1
	match heal_int_eye ...wait
	match skin You drink
	match need_aevaes Drink what
	put drink my aevaes solution 
	matchwait
need_aevaes:
	setvar need_aevaes 1

skin:
	if (%skin = 1) then GOTO heal_skin
	GOTO nerves
heal_skin:
	SAVE aloe
	setvar ext_scar 1
	match heal_skin ...wait
	match nerves You eat
	match heal_skin2 What were you referring
	PUT eat aloe balm
	matchwait
heal_skin2:
	match heal_skin2 ...wait
	match nerves You eat
	match need_aloe What were you referring
	PUT eat aloe leaf
	matchwait
need_aloe:
	setvar need_aloe 1

nerves:
	if (%nerves = 1) then GOTO heal_nerves
	GOTO supplies

heal_nerves:
	SAVE lujeakave
	setvar int_scar 1
	match heal_nerves ...wait
	match supplies You drink
	match need_lujeakave Drink what
	put drink lujeakave elixir 
	matchwait
need_lujeakave:
	setvar need_lujeakave 1

#Report on missing herbs
supplies:
	if (%need_plovik = 1) then
	{
		ECHO *** Need to get plovik
	}
	if (%need_eghmok = 1) then
	{
		ECHO *** Need to get eghmok
	}
	if (%need_nemoih = 1) then
	{
		ECHO *** Need to get nemoih
	}
	if (%need_ithor = 1) then
	{
		ECHO *** Need to get ithor
	}
	if (%need_nilos = 1) then
	{
		ECHO *** Need to get nilos
	}
	if (%need_muljin = 1) then
	{
		ECHO *** Need to get muljin
	}
	if (%need_hulnik = 1) then
	{
		ECHO *** Need to get hulnik
	}
	if (%need_junliar_or_blocil = 1) then
	{
		ECHO *** Need to get junliar or blocil
	}
	if (%need_georin = 1) then
	{
		ECHO *** Need to get georin
	}
	if (%need_riolur = 1) then
	{
		ECHO *** Need to get riolur
	}
	if (%need_jadice = 1) then
	{
		ECHO *** Need to get jadice
	}
	if (%need_yelith = 1) then
	{
		ECHO *** Need to get yelith
	}
	if (%need_sufil = 1) then
	{
		ECHO *** Need to get sufil
	}
	if (%need_aevaes = 1) then
	{
		ECHO *** Need to get aevaes
	}
	if (%need_lujeakave = 1) then
	{
		ECHO *** Need to get lujeakave
	}
	if (%need_aloe = 1) then
	{
		ECHO *** Need to get aloe
	}
end:
	EXIT