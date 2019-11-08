debuglevel 10
#Heal with herbs
# based on the DR Secrets script "medicine.txt"
# expressions tested with http://regexhero.net/

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
ACTION setvar int_abdomen 1 WHEN (\w|\s)*(bruis|disco)(\w|\s)+abdomen
ACTION setvar ext_back 1 WHEN (,| )(a|some) ((?!bruis(ed|ing))(\s|\w))*(\bback\b)(\s|\w)*(\.|,|$)
ACTION setvar int_back 1 WHEN (\w|\s)*(bruis|disco)(\w|\s)+back
ACTION setvar ext_neck 1 WHEN (,| )(a|some) ((?!(bruis|bloat)(ed|ing))(\s|\w))*(\bneck\b)(\s|\w)*(\.|,|$)
ACTION setvar int_neck 1 WHEN (\w|\s)*(bruis|disco)(\w|\s)+neck
ACTION setvar ext_limb 1 WHEN (,| )(a|some) ((?!(bloat|bruis)(ed|ing))(\s|\w))*((left|right) (leg|arm|hand))(\s|\w)*(\.|,|$)
ACTION setvar int_limb 1 WHEN (\w|\s)*(bruis|disco|swollen)(\w|\s)+((left|right) (leg|arm|hand))
ACTION setvar ext_eye 1 WHEN (?!bruis)(\s|\w)*(bleed|shatt|to the|for a)+(\s|\w)*eye
ACTION setvar int_eye 1 WHEN (\w|\s)*(bruis|swollen)(\w|\s)+eye\b

ACTION setvar nerves 1 WHEN (slight numbness in your fingers and toes|some minor twitching|severe twitching|difficulty controlling actions|paralysis of the entire body)
#No idea what the skin wounds are...
#ACTION setvar skin 1 WHEN

#These also get set when any internal or external wound is healed, since a scar will result.
ACTION setvar ext_scar 1 WHEN (mangled and malformed|severe scarring|minor scars|some tiny scars|few nearly invisible scars|difficulty getting a breath without pain|scarring|scarred|scarred|painfully mangled|malformed|socket overgrown with bits of odd shaped flesh|punctured and shriveled|paralyzed|clouded)
ACTION setvar int_scar 1 WHEN (difficulty getting a breath without pain|twitching|twitch|somewhat emaciated look|socket overgrown with bits of odd shaped flesh|punctured and shriveled|paralyzed|clouded)

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

#Figure out what needs healing
PUT health
wait

#Take herbs for anything that picked up by the triggers
ext_head:
if (%ext_head = 1) then GOTO heal_ext_head
GOTO int_head

heal_ext_head:
setvar ext_scar 1
match heal_ext_head ...wait
match heal_ext_head2 What were you referring
match int_head You eat
put eat my nemoih root
matchwait

heal_ext_head2:
match heal_ext_head2 ...wait
match int_head You drink
put drink my nemoih potion
matchwait .5
setvar need_nemoih 1

int_head:
if (%int_head = 1) then GOTO heal_int_head
GOTO ext_chest

heal_int_head:
setvar int_scar 1
match heal_int_head ...wait
match heal_int_head2 What were you referring to
match ext_chest You eat
put eat my eghmok moss
matchwait

heal_int_head2:
match heal_int_head2 ...wait
match ext_chest You drink
put drink my eghmok potion
matchwait .5
setvar need_eghmok 1

ext_chest:
if (%ext_chest = 1) then GOTO heal_ext_chest
GOTO int_chest

heal_ext_chest:
setvar ext_scar 1
match heal_ext_chest ...wait
match heal_ext_chest2 What were you referring
match int_chest You eat
put eat my plovik leaf
matchwait

heal_ext_chest2:
match heal_ext_chest2 ...wait
match int_chest You drink
put drink my plovik tea
matchwait .5
setvar need_plovik 1

int_chest:
if (%int_chest = 1) then GOTO heal_int_chest
GOTO ext_abdomen

heal_int_chest:
setvar int_scar 1
match heal_int_chest ...wait
match ext_abdomen You drink
put drink my ithor potion
matchwait .5
setvar need_ithor 1

ext_abdomen:
if (%ext_abdomen = 1) then GOTO heal_ext_abdomen
GOTO int_abdomen

heal_ext_abdomen:
setvar ext_scar 1
match heal_ext_abdomen ...wait
match heal_ext_abdomen2 What were you referring
match int_abdomen You eat
put eat my nilos grass
matchwait

heal_ext_abdomen2:
match heal_ext_abdomen2 ...wait
match int_abdomen You eat
put eat my nilos salve
matchwait .5
setvar need_nilos 1

int_abdomen:
if (%int_abdoment = 1) then GOTO heal_int_abdomen
GOTO ext_back

heal_int_abdomen:
setvar int_scar 1
match heal_int_abdomen ...wait
match heal_int_abdomen2 What were you referring
match ext_back You eat
put eat my muljin sap
matchwait

heal_int_abdomen2:
match heal_int_abdomen2 ...wait
match ext_back you eat
put eat my muljin paste
matchwait .5
setvar need_muljin 1

ext_back:
if (%ext_back = 1) then GOTO heal_ext_back
GOTO int_back

heal_ext_back:
setvar ext_scar 1
match heal_ext_back ...wait
match heal_ext_back2 What were you referring
match int_back You eat
put eat my hulnik grass
matchwait

heal_ext_back2:
match heal_ext_back2 ...wait
match int_back You drink
put drink my hulnik salve
matchwait .5
setvar need_hulnik 1

int_back:
if (%int_back = 1) then GOTO heal_int_back
GOTO ext_neck

heal_int_back:
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
put eat my blocil berries
matchwait .5
setvar need_junliar_or_blocil 1

ext_neck:
if (%ext_neck = 1) then GOTO heal_ext_neck
GOTO int_neck

heal_ext_neck:
setvar ext_scar 1
match heal_ext_neck ...wait
match heal_ext_neck2 What were you referring
match int_neck You eat
put eat my georin grass
matchwait

heal_ext_neck2:
match heal_ext_neck2 ...wait
match int_neck You eat
put eat my georin salve
matchwait .5
setvar need_georin 1

int_neck:
if (%int_neck = 1) then GOTO heal_int_neck
GOTO ext_limb

heal_int_neck:
setvar int_scar 1
match heal_int_neck ...wait
match heal_int_neck2 What were you referring
match ext_limb You eat
put eat my riolur leaf
matchwait

heal_int_neck2:
match heal_int_neck2 ...wait
match ext_limb You drink
put drink my riolur tea
matchwait .5
setvar need_riolur 1

ext_limb:
if (%ext_limb = 1) then GOTO heal_ext_limb
GOTO int_limb

heal_ext_limb:
setvar ext_scar 1
match heal_ext_limb ...wait
match heal_ext_limb2 What were you referring
match int_limb You eat
put eat my jadice flower
matchwait

heal_ext_limb2:
match heal_ext_limb2 ...wait
match int_limb You drink
put drink my jadice potion
matchwait .5
setvar need_jadice 1

int_limb:
if (%int_limb = 1) then GOTO heal_int_limb
GOTO ext_eye

heal_int_limb:
setvar int_scar 1
match heal_int_limb ...wait
match ext_eye You eat
put eat my yelith root
matchwait .5
setvar need_yelith 1

ext_eye:
if (%ext_eye = 1) then GOTO heal_ext_eye
GOTO int_eye

heal_ext_eye:
setvar ext_scar 1
match heal_ext_eye ...wait
match int_eye You eat
put eat my sufil sap
matchwait .5
setvar need_sufil 1

int_eye:
if (%int_eye = 1) then GOTO heal_int_eye
GOTO nerves

heal_int_eye:
setvar int_scar 1
match heal_int_eye ...wait
match nerves You drink
put drink my aevaes solution
matchwait .5
setvar need_aevaes 1

nerves:
if (%nerves = 1) then GOTO heal_nerves
GOTO ext_scar

heal_nerves:
match heal_nerves ...wait
match scars You drink
put drink lujeakave elixir
matchwait .5
setvar need_lujeakave 1

ext_scar:
if (%ext_scar = 1) then GOTO heal_ext_scar
GOTO int_scar

heal_ext_scar:
match heal_ext_scar ...wait
match int_scar You eat
put eat my cebi root
matchwait 1
setvar need_cebi 1

int_scar:
if (%int_scar = 1) then GOTO heal_int_scar
GOTO supplies

heal_int_scar:
match heal_int_scar ...wait
match end You eat
put eat my hisan salve
matchwait .5
setvar need_hisan 1

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
if (%need_cebi = 1) then
{
ECHO *** Need to get cebi
}
if (%need_hisan = 1) then
{
ECHO *** Need to get hisan
}
end:
EXIT