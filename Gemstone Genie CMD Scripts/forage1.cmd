########################################################
# monkeedu's Foraging Script v2.0
#

  echo *************************************************
  echo *** Foraging
  echo *************************************************
  echo
  debug off
  counter set 0
  if_1 goto glance
  goto trash

#******************************************************#
#  Messaging

 done:
  echo *************************************************
  echo *** Done.
  echo *************************************************
  echo
  exit

 trash:
  echo *************************************************
  echo *** You need to give a trash can as variable 1.
  echo *************************************************
  echo
  goto done

 full:
  echo *************************************************
  echo *** Your need to empty your hands.
  echo *************************************************
  echo
  goto done

 clutter:
  echo *************************************************
  echo *** This area is too cluttered to forage in.
  echo *************************************************
  echo
  goto done

 report:
  echo *************************************************
  echo *** Foraged '%temp%' %c% times.
  echo *************************************************
  echo
  goto done

#******************************************************#
#  Main

 glance:
  pause .2
  match full in your right hand
  match guild You glance down at your empty hands.
  put glance
  matchwait

 guild:
  pause .2
  matchre normal /: Bard|: Cleric|: Paladin|: Warrior/
  match careful Wealth:
  put info
  matchwait

 normal:
  save  
  goto check

 careful:
  save careful

 check:
  if_2 setvariable temp %2
  if_2 goto empty
  goto skill

 forage1:
  pause 1
  match full hands are full
  match clutter cluttered
  match forage2 You manage to find
  matchre forage1 /(Roundtime:|...wait)/
  put forage %temp %s
  matchwait

 forage2:
  pause 1
  match full hands are full
  match clutter cluttered
  match empty You manage to find
  matchre forage2 /(Roundtime:|...wait)/
  put forage %temp %s
  matchwait

 empty:
  counter add 2
  pause 2
  put put my %temp in %1
  pause 1
  put put my %temp in %1
  matchre report /mind lock|daze|bewild/
  match forage1 Points:
  put exp skill forag
  matchwait

#******************************************************#
#  Set Forage Item

 skill:
  pause .2
  matchre done /mind lock|dazed|bewild/
  matchre 320 /g:    5|g:    4|g:    39|g:    38|g:    37|g:    36|g:    35|g:    34|g:    33|g:    32|g:    31/
  matchre 300 /g:    30|g:    29/
  matchre 280 /g:    28|g:    279|g:    278|g: 277|g: 276|g: 275/
  matchre 275 /g:    27|g:    26|g:    25/
  matchre 240 /g:    24|g:    23/
  matchre 220 /g:    22|g:    21/
  matchre 200 /g:    20|g:    199|g:    198|g:    197|g:    196|g:    195/
  matchre 195 /g:    19|g:    18|g:    179|g:    178|g:    177|g:    176|g:    175/
  matchre 175 /g:    17|g:    16/
  matchre 150 /g:    15|g:    14|g:    13/
  match 120 g:    12
  match 110 g:    11
  match 100 g:    10
  match 90 g:     9
  match 80 g:     8
  match 70 g:     7
  matchre 65 /g:     69|g:     68|g:     67|g:     66|g:     65/
  match 60 g:     6
  match 50 g:     5
  match 40 g:     4
  match 30 g:     3
  match 20 g:     2
  match 10 g:     1
  matchre 0 /g:   |skill!/
  put exp skill forag
  matchwait

 setforage:
  pause 1
  match full hands are full
  match clutter cluttered
  match setempty You manage to find
  match setforage ...wait
  match %next Roundtime:
  put forage %last %s
  matchwait

 setempty:
  pause 1
  setvariable temp %last
  put put my %last in %1
  goto forage1

#******************************************************#
#  Forage List

 320:
 silverwoodstick:
  setvariable last silverwood stick
  setvariable next silverwoodlimb
  goto setforage
 silverwoodlimb:
  setvariable last silverwood limb
  setvariable next silverwoodbranch
  goto setforage
 300:
 silverwoodbranch:
  setvariable last silverwood branch
  setvariable next coin
  goto setforage
 coin:
  setvariable last coin
  setvariable next copperwoodstick
  goto setforage
 copperwoodstick:
  setvariable last copperwood stick
  setvariable next copperwoodlimb
  goto setforage
 copperwoodlimb:
  setvariable last copperwood limb
  setvariable next copperwoodbranch
  goto setforage
 280:
 copperwoodbranch:
  setvariable last copperwood branch
  setvariable next nuloestem
  goto setforage
 275:
 nuloestem:
  setvariable last nuloe stem
  setvariable next genichstem
  goto setforage
 genichstem:
  setvariable last genich stem
  setvariable next cebiroot
  goto setforage
 cebiroot:
  setvariable last cebi root
  setvariable next qunpollen
  goto setforage
 qunpollen:
  setvariable last qun pollen
  setvariable next jadicepollen
  goto setforage
 jadicepollen:
  setvariable last jadice pollen
  setvariable next butterflyorchid
  goto setforage
 240:
 butterflyorchid:
  setvariable last butterfly orchid
  setvariable next bloodwoodstick
  goto setforage
 bloodwoodstick:
  setvariable last bloodwood stick
  setvariable next bloodwoodlimb
  goto setforage
 bloodwoodlimb:
  setvariable last bloodwood limb
  setvariable next bloodwoodbranch
  goto setforage
 220:
 bloodwoodbranch:
  setvariable last bloodwood branch
  setvariable next osagestick
  goto setforage
 osagestick:
  setvariable last osage stick
  setvariable next osagelimb
  goto setforage
 osagelimb:
  setvariable last osage limb
  setvariable next osagebranch
  goto setforage
 osagebranch:
  setvariable last osage branch
  setvariable next honeycomb
  goto setforage
 200:
 honeycomb:
  setvariable last honey comb
  setvariable next mistwoodstick
  goto setforage
 mistwoodstick:
  setvariable last mistwood stick
  setvariable next mistwoodlimb
  goto setforage
 mistwoodlimb:
  setvariable last mistwood limb
  setvariable next mistwoodbranch
  goto setforage
 mistwoodbranch:
  setvariable last mistwood branch
  setvariable next yewstick
  goto setforage
 195:
 yewstick:
  setvariable last yew stick
  setvariable next yewlimb
  goto setforage
 yewlimb:
  setvariable last yew limb
  setvariable next yewbranch
  goto setforage
 yewbranch:
  setvariable last yew branch
  setvariable next coffeebean
  goto setforage
 175:
 coffeebean:
  setvariable last coffee bean
  setvariable next muljinsap
  goto setforage
 muljinsap:
  setvariable last muljin sap
  setvariable next wildorchid
  goto setforage
 wildorchid:
  setvariable last wild orchid
  setvariable next eghmokmoss
  goto setforage
 eghmokmoss:
  setvariable last eghmok moss
  setvariable next mistletoe
  goto setforage
 150:
 mistletoe:
  setvariable last mistle toe
  setvariable next willowbranch
  goto setforage
 willowbranch:
  setvariable last willow branch
  setvariable next redrose
  goto setforage
 120:
 redrose:
  setvariable last red rose
  setvariable next redwoodstick
  goto setforage
 redwoodstick:
  setvariable last redwood stick
  setvariable next redwoodlimb
  goto setforage
 redwoodlimb:
  setvariable last redwood limb
  setvariable next walnutbranch
  goto setforage
 walnutbranch:
  setvariable last walnut branch
  setvariable next redwoodbranch
  goto setforage
 redwoodbranch:
  setvariable last redwood branch
  setvariable next glayskerflower
  goto setforage
 glayskerflower:
  setvariable last glaysker flower
  setvariable next blocilberries
  goto setforage
 blocilberries:
  setvariable last blocil berries
  setvariable next willowstick
  goto setforage
 willowstick:
  setvariable last willow stick
  setvariable next walnutstick
  goto setforage
 walnutstick:
  setvariable last walnut stick
  setvariable next teakstick
  goto setforage
 teakstick:
  setvariable last teak stick
  setvariable next rosewoodstick
  goto setforage
 rosewoodstick:
  setvariable last rosewood stick
  setvariable next oakstick
  goto setforage
 oakstick:
  setvariable last oak stick
  setvariable next maplestick
  goto setforage
 maplestick:
  setvariable last maple stick
  setvariable next mahoganystick
  goto setforage
 mahoganystick:
  setvariable last mahogany stick
  setvariable next elmstick
  goto setforage
 elmstick:
  setvariable last elm stick
  setvariable next ebonystick
  goto setforage
 ebonystick:
  setvariable last ebony stick
  setvariable next sufilsap
  goto setforage
 sufilsap:
  setvariable last sufil sap
  setvariable next pigroot
  goto setforage
 110:
 pigroot:
  setvariable last pig root
  setvariable next briarberryroot
  goto setforage
 briarberryroot:
  setvariable last briarberry root
  setvariable next willowlimb
  goto setforage
 willowlimb:
  setvariable last willow limb
  setvariable next walnutlimb
  goto setforage
 walnutlimb:
  setvariable last walnut limb
  setvariable next teaklimb
  goto setforage
 teaklimb:
  setvariable last teak limb
  setvariable next rosewoodlimb
  goto setforage
 rosewoodlimb:
  setvariable last rosewood limb
  setvariable next oaklimb
  goto setforage
 100:
 oaklimb:
  setvariable last oak limb
  setvariable next maplelimb
  goto setforage
 maplelimb:
  setvariable last maple limb
  setvariable next mahoganylimb
  goto setforage
 mahoganylimb:
  setvariable last mahogany limb
  setvariable next elmlimb
  goto setforage
 elmlimb:
  setvariable last elm limb
  setvariable next ebonylimb
  goto setforage
 ebonylimb:
  setvariable last ebony limb
  setvariable next riolurleaf
  goto setforage
 riolurleaf:
  setvariable last riolur leaf
  setvariable next hulnikgrass
  goto setforage
 hulnikgrass:
  setvariable last hulnik grass
  setvariable next teakbranch
  goto setforage
 teakbranch:
  setvariable last teak branch
  setvariable next rosewoodbranch
  goto setforage
 rosewoodbranch:
  setvariable last rosewood branch
  setvariable next oakbranch
  goto setforage
 oakbranch:
  setvariable last oak branch
  setvariable next maplebranch
  goto setforage
 maplebranch:
  setvariable last maple branch
  setvariable next mahoganybranch
  goto setforage
 mahoganybranch:
  setvariable last mahogany branch
  setvariable next elmbranch
  goto setforage
 elmbranch:
  setvariable last elm branch
  setvariable next ebonybranch
  goto setforage
 ebonybranch:
  setvariable last ebony branch
  setvariable next elmbranch
  goto setforage
 greenmoss:
  setvariable last green moss
  setvariable next whiterose
  goto setforage
 90:
 whiterose:
  setvariable last white rose
  setvariable next tealeaf
  goto setforage
 tealeaf:
  setvariable last tea leaf
  setvariable next oldbutton
  goto setforage
 oldbutton:
  setvariable last old button
  setvariable next junliarstem
  goto setforage
 junliarstem:
  setvariable last junliar stem
  setvariable next sage
  goto setforage
 sage:
  setvariable last sage
  setvariable next plovikleaf
  goto setforage
 plovikleaf:
  setvariable last plovik leaf
  setvariable next nilosgrass
  goto setforage
 nilosgrass:
  setvariable last nilos grass
  setvariable next almond
  goto setforage
 almond:
  setvariable last almond
  setvariable next hickorystick
  goto setforage
 hickorystick:
  setvariable last hickory stick
  setvariable next cherrystick
  goto setforage
 cherrystick:
  setvariable last cherry stick
  setvariable next hickorylimb
  goto setforage
 hickorylimb:
  setvariable last hickory limb
  setvariable next cherrylimb
  goto setforage
 cherrylimb:
  setvariable last cherry limb
  setvariable next hickorybranch
  goto setforage
 hickorybranch:
  setvariable last hickory branch
  setvariable next cherrybranch
  goto setforage
 80:
 cherrybranch:
  setvariable last cherry branch
  setvariable next moss
  goto setforage
 moss:
  setvariable last moss
  setvariable next lavendar
  goto setforage
 lavendar:
  setvariable last lavendar
  setvariable next draconaeiablossom
  goto setforage
 draconaeiablossom:
  setvariable last draconaeia blossom
  setvariable next turnip
  goto setforage
 turnip:
  setvariable last turnip
  setvariable next gooseberries
  goto setforage
 gooseberries:
  setvariable last gooseberries
  setvariable next chamomile
  goto setforage
 chamomile:
  setvariable last chamomile
  setvariable next firstick
  goto setforage
 firstick:
  setvariable last fir stick
  setvariable next birchstick
  goto setforage
 birchstick:
  setvariable last birch stick
  setvariable next ashstick
  goto setforage
 70:
 ashstick:
  setvariable last ash stick
  setvariable next rose
  goto setforage
 rose:
  setvariable last rose
  setvariable next firlimb
  goto setforage
 firlimb:
  setvariable last fir limb
  setvariable next birchlimb
  goto setforage
 birchlimb:
  setvariable last birch limb
  setvariable next ashlimb
  goto setforage
 ashlimb:
  setvariable last ash limb
  setvariable next firbranch
  goto setforage
 firbranch:
  setvariable last fir branch
  setvariable next birchbranch
  goto setforage
 birchbranch:
  setvariable last birch branch
  setvariable next ashbranch
  goto setforage
 ashbranch:
  setvariable last ash branch
  setvariable next clover
  goto setforage
 clover:
  setvariable last clover
  setvariable next seolarnweed
  goto setforage
 seolarnweed:
  setvariable last seolarn weed
  setvariable next toadstool
  goto setforage
 toadstool:
  setvariable last toadstool
  setvariable next alderstick
  goto setforage
 alderstick:
  setvariable last alder stick
  setvariable next alderlimb
  goto setforage
 alderlimb:
  setvariable last alder limb
  setvariable next alderbranch
  goto setforage
 alderbranch:
  setvariable last alder branch
  setvariable next applestick
  goto setforage
 applestick:
  setvariable last apple stick
  setvariable next orange
  goto setforage
 orange:
  setvariable last orange
  setvariable next applelimb
  goto setforage
 applelimb:
  setvariable last apple limb
  setvariable next lemon
  goto setforage
 65:
 lemon:
  setvariable last lemon
  setvariable next clam
  goto setforage
 clam:
  setvariable last clam
  setvariable next wildcarrot
  goto setforage
 wildcarrot:
  setvariable last wild carrot
  setvariable next applebranch
  goto setforage
 applebranch:
  setvariable last apple branch
  setvariable next apple
  goto setforage
 apple:
  setvariable last apple
  setvariable next yelithroot
  goto setforage
 60:
 yelithroot:
  setvariable last yelith root
  setvariable next nemoihroot
  goto setforage
 nemoihroot:
  setvariable last nemoih root
  setvariable next asarwudenshell
  goto setforage
 asarwudenshell:
  setvariable last asarwuden shell
  setvariable next phelimshell
  goto setforage
 phelimshell:
  setvariable last phelim shell
  setvariable next briarberries
  goto setforage
 briarberries:
  setvariable last briar berries
  setvariable next sprucestick
  goto setforage
 sprucestick:
  setvariable last spruce stick
  setvariable next pinestick
  goto setforage
 pinestick:
  setvariable last pine stick
  setvariable next sprucelimb
  goto setforage
 sprucelimb:
  setvariable last spruce limb
  setvariable next pinelimb
  goto setforage
 pinelimb:
  setvariable last pine limb
  setvariable next aloeleaf
  goto setforage
 50:
 aloeleaf:
  setvariable last aloe leaf
  setvariable next sprucebranch
  goto setforage
 sprucebranch:
  setvariable last spruce branch
  setvariable next pinebranch
  goto setforage
 pinebranch:
  setvariable last pine branch
  setvariable next jasmineblossom
  goto setforage
 40:
 jasmineblossom:
  setvariable last jasmine blossom
  setvariable next nedorenshell
  goto setforage
 nedorenshell:
  setvariable last nedoren shell
  setvariable next fanashell
  goto setforage
 fanashell:
  setvariable last fana shell
  setvariable next sharktooth
  goto setforage
 sharktooth:
  setvariable last shark tooth
  setvariable next treeroot
  goto setforage
 30:
 treeroot:
  setvariable last tree root
  setvariable next redflower
  goto setforage
 redflower:
  setvariable last red flower
  setvariable next blueflower
  goto setforage
 blueflower:
  setvariable last blue flower
  setvariable next clamshell
  goto setforage
 clamshell:
  setvariable last clam shell
  setvariable next cherry
  goto setforage
 cherry:
  setvariable last cherry
  setvariable next strawberry
  goto setforage
 strawberry:
  setvariable last strawberry
  setvariable next blueberries
  goto setforage
 blueberries:
  setvariable last blueberries
  setvariable next georingrass
  goto setforage
 georingrass:
  setvariable last georin grass
  setvariable next torncloth
  goto setforage
 torncloth:
  setvariable last torn cloth
  setvariable next weed
  goto setforage
 weed:
  setvariable last weed
  setvariable next vine
  goto setforage
 vine:
  setvariable last vine
  setvariable next taffelberries
  goto setforage
 taffelberries:
  setvariable last taffelberries
  setvariable next snailshell
  goto setforage
 snailshell:
  setvariable last snail shell
  setvariable next scallion
  goto setforage
 20:
 scallion:
  setvariable last scallion
  setvariable next sap
  goto setforage
 sap:
  setvariable last sap
  setvariable next peat
  goto setforage
 peat:
  setvariable last peat
  setvariable next rustynail
  goto setforage
 rustynail:
  setvariable last rusty nail
  setvariable next log
  goto setforage
 log:
  setvariable last log
  setvariable next limb
  goto setforage
 limb:
  setvariable last limb
  setvariable next corn
  goto setforage
 corn:
  setvariable last corn
  setvariable next jadiceflower
  goto setforage
 jadiceflower:
  setvariable last jadice flower
  setvariable next stem
  goto setforage
 stem:
  setvariable last stem
  setvariable next seaweed
  goto setforage
 seaweed:
  setvariable last seaweed
  setvariable next grungyfeather
  goto setforage
 grungyfeather:
  setvariable last grungy feather
  setvariable next dirt
  goto setforage
 10:
 dirt:
  setvariable last dirt
  setvariable next cattail
  goto setforage
 cattail:
  setvariable last cattail
  setvariable next acorn
  goto setforage
 acorn:
  setvariable last acorn
  setvariable next seashell
  goto setforage
 seashell:
  setvariable last sea shell
  setvariable next shoetack
  goto setforage
 shoetack:
  setvariable last shoe tack
  setvariable next torch
  goto setforage
 torch:
  setvariable last torch
  setvariable next twig
  goto setforage
 0:
 twig:
  setvariable last twig
  setvariable next stick
  goto setforage
 stick:
  setvariable last stick
  setvariable next woodsplinter
  goto setforage
 woodsplinter:
  setvariable last wood splinter
  setvariable next brokenshell
  goto setforage
 brokenshell:
  setvariable last broken shell
  setvariable next shell
  goto setforage
 shell:
  setvariable last shell
  setvariable next root
  goto setforage
 root:
  setvariable last root
  setvariable next rock
  goto setforage
 rock:
  setvariable last rock
  setvariable next leaf
  goto setforage
 leaf:
  setvariable last leaf
  setvariable next grass
  goto setforage
 grass:
  setvariable last grass
  setvariable next breadcrumb
  goto setforage
 breadcrumb:
  setvariable last bread crumb
  setvariable next woodchip
  goto setforage
 woodchip:
  setvariable last wood chip
  setvariable next dustbunny
  goto setforage
 dustbunny:
  setvariable last dust bunny
  setvariable next branch
  goto setforage
 branch:
  setvariable last branch
  setvariable next fishbone
  goto setforage
 fishbone:
  setvariable last fish bone
  setvariable next berries
  goto setforage
 berries:
  setvariable temp berries
  goto forage

#******************************************************#
