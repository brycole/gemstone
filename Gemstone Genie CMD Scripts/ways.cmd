Zasko (3:46:27 AM): #ways



ECHO 

ECHO ==================================================================

ECHO *** Welcome to Auto Astral Travel by Ghodbane, modified by Toldorf

ECHO 

ECHO *** Rolagi - Crossing

ECHO *** Asharshpar'i - Oshu'errhsk manor

ECHO *** Emalerje - Lesser Fist

ECHO *** Taniendar - Riverhaven

ECHO *** Dinegavren - Therenborough

ECHO *** Mintais - Throne City

ECHO *** Marendin - Shard

ECHO *** Undarverjah - Taisgath

ECHO *** Tamigen - Dragon Priests Spire

ECHO *** Dor'na'torna - Hibarnhvidar

ECHO ===================================================

ECHO 



start:

pause

put prep moongate

match start ...wait

match focusorigin Moongate

matchwait



focusorigin:

put look

match focusorigin ...wait

match focusoriginrolagi [Observatory, Foyer]

match focusoriginasharshpari [Telpengi'hhs Sara'a, Embalming Chamber]

match focusoriginemalerje [Inside the Fortress, Stone Garden]

match focusorigintaniendar [Obsidian Spire, Roof]

match focusorigindinegavren [Gealeranendae College, Tear of Grazhir Exhibit]

match focusoriginmintais [Phelim's Sanctum, Tear of Grazhir]

match focusoriginundarverjah [Taisgath Guildhouse, Walk of the Winds]

match focusoriginmarendin [Moon Mage Guild, Atrium]

match focusorigintamigen [Cragstone Vale, Shrine of the Shell]

match focusorigindornatorna [The Spire, Chamber of Contemplation]

matchwait



focusoriginrolagi:

put focus shard rolagi

match focusoriginrolagi ...wait

match harnessrolagi You feel fully prepared

match startover concentration lapse

matchwait



focusoriginasharshpari:

put focus shard asharshpar'i

match focusoriginasharshpari ...wait

match harnessasharshpari You feel fully prepared

match startover concentration lapse

matchwait



focusoriginemalerje:

put focus shard emalerje

match focusoriginemalerje ...wait

match harnessemalerje You feel fully prepared

match startover concentration lapse

matchwait



focusorigintaniendar:

put focus shard taniendar

match focusorigintaniendar ...wait

match harnesstaniendar You feel fully prepared

match startover concentration lapse

matchwait



focusorigindinegavren:

put focus shard dinegavren

match focusorigindinegavren ...wait

match harnessdinegavren You feel fully prepared

match startover concentration lapse

matchwait



focusoriginmintais:

put focus shard mintais

match focusoriginmintais ...wait

match harnessmintais You feel fully prepared

match startover concentration lapse

matchwait



focusoriginmarendin:

put focus shard marendin

match focusoriginmarendin ...wait

match harnessmarendin You feel fully prepared

match startover concentration lapse

matchwait



focusoriginundarverjah:

put focus shard undarverjah

match focusoriginundarverjah ...wait

match harnessundarverjah You feel fully prepared

match startover concentration lapse

matchwait



focusorigintamigen:

put focus shard tamigen

match focusorigintamigen ...wait

match harnesstamigen You feel fully prepared

match startover concentration lapse

matchwait



focusorigindornatorna:

put focus shard dor'na'torna

match focusorigindornatorna ...wait

match harnessdornatorna You feel fully prepared

match startover concentration lapse

matchwait



startover:

ECHO 

ECHO ===================================================

ECHO *** You did not select a valid destination or are

ECHO *** not in a room with a Grazhir shard.

ECHO *** Please Try Again...

ECHO ===================================================

ECHO 

put release

exit



harnessrolagi:

put harness 30

match harnessrolagi ...wait

match fromrolagi You tap into the mana

matchwait



harnessasharshpari:

put harness 30

match harnessasharshpari ...wait

match fromasharshpari You tap into the mana

matchwait



harnessemalerje:

put harness 30

match harnessemalerje ...wait

match fromemalerje You tap into the mana

matchwait



harnesstaniendar:

put harness 30

match harnesstaniendar ...wait

match fromtaniendar You tap into the mana

matchwait



harnessdinegavren:

put harness 30

match harnessdinegavren ...wait

match fromdinegavren You tap into the mana

matchwait



harnessmintais:

put harness 30

match harnessmintais ...wait

match frommintais You tap into the mana

matchwait



harnessundarverjah:

put harness 30

match harnessundarverjah ...wait

match fromundarverjah You tap into the mana

matchwait



harnessmarendin:

put harness 30

match harnessmarendin ...wait

match frommarendin You tap into the mana

matchwait



harnesstamigen:

put harness 30

match harnesstamigen ...wait

match fromtamigen You tap into the mana

matchwait



harnessdornatorna:

put harness 30

match harnessdornatorna ...wait

match fromdornatorna You tap into the mana

matchwait



fromrolagi:

put cast rolagi

match fromrolagi ...wait

match micro Obvious exits

matchwait



fromasharshpari:

put cast asharshpar'i

match fromasharshpari ...wait

match micro Obvious exits

matchwait



fromemalerje:

put cast emalerje

match fromemalerje ...wait

match micro Obvious exits

matchwait



fromtaniendar:

put cast taniendar

match fromtaniendar ...wait

match micro Obvious exits

matchwait



fromdinegavren:

put cast dinegavren

match fromdinegavren ...wait

match micro Obvious exits

matchwait



frommintais:

put cast mintais

match frommintais ...wait

match micro Obvious exits

matchwait



frommarendin:

put cast marendin

match frommarendin ...wait

match micro Obvious exits

matchwait



fromundarverjah:

put cast undarverjah

match fromundarverjah ...wait

match micro Obvious exits

matchwait



fromtamigen:

put cast tamigen

match fromtamigen ...wait

match micro Obvious exits

matchwait



fromdornatorna:

put cast dor'na'torna

match fromdornatorna ...wait

match micro Obvious exits

matchwait



micro:

put perceive

match micro ...wait

match micro settling into new patterns

match microN the microcosm is to the north.

match microNE the microcosm is to the northeast.

match microE the microcosm is to the east.

match microSE the microcosm is to the southeast.

match microS the microcosm is to the south.

match microSW the microcosm is to the southwest.

match microW the microcosm is to the west.

match microNW the microcosm is to the northwest.

match micro settling into new patterns

matchwait



microN:

put north

match microN ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microNE:

put northeast

match microNE ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microE:

put east

match microE ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microSE:

put southeast

match microSE ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microS:

put south

match microS ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microSW:

put southwest

match microSW ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microW:

put west

match microW ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



microNW:

put northwest

match microNW ...wait

match micro none.

match pillar Pillar of

match pillar Broken Pillar

matchwait



pillar:

put west

put focus %1

match pillar ...wait

match pillarmove You can't go there.

match pillarmove cannot find the conduit you are looking

match shard none.

matchwait



pillarmove:

put west

match pillarfocus Broken Pillar

match pillarfocus Pillar of

matchwait



pillarmove1:

put up

match pillarfocus1 Broken Pillar

match pillarfocus1 Pillar of

matchwait



pillarmove2:

put west

match pillarfocus2 Broken Pillar

match pillarfocus2 Pillar of

matchwait



pillarmove3:

put down

match pillarfocus3 Broken Pillar

match pillarfocus3 Pillar of

matchwait



pillarmove4:

put west

match pillarfocus4 Broken Pillar

match pillarfocus4 Pillar of

matchwait



pillarfocus:

put focus %1

match pillarfocus ...wait

match pillarmove1 cannot find the conduit you are looking

match shard none.

matchwait



pillarfocus1:

put focus %1

match pillarfocus1 ...wait

match pillarmove2 cannot find the conduit you are looking

match shard none.

matchwait



pillarfocus2:

put focus %1

match pillarfocus2 ...wait

match pillarmove3 cannot find the conduit you are looking

match shard none.

matchwait



pillarfocus3:

put focus %1

match pillarfocus3 ...wait

match pillarmove4 cannot find the conduit you are looking

match shard none.

matchwait



pillarfocus4:

put focus %1

match pillarfocus4 ...wait

match pillarmove4 cannot find the conduit you are looking

match shard none.

matchwait



shard:

put perceive

match shard ...wait

match shard settling into new patterns

match shardN the conduit lies north.

match shardNE the conduit lies northeast.

match shardE the conduit lies east.

match shardSE the conduit lies southeast.

match shardS the conduit lies south.

match shardSW the conduit lies southwest.

match shardW the conduit lies west.

match shardNW the conduit lies northwest.

match shard settling into new patterns

matchwait



shardN:

put north

match shardN ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardNE:

put northeast

match shardNE ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardE:

put east

match shardE ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardSE:

put southeast

match shardSE ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardS:

put south

match shardS ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardSW:

put southwest

match shardSW ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardW:

put west

match shardW ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



shardNW:

put northwest

match shardNW ...wait

match moongate You also see the silvery-white shard

match shard none.

matchwait



moongate:

put prep moongate

match moongate ...wait

match focus Moongate spell.

matchwait



focus:

put focus %1

match focus ...wait

match cast You recognize this as the shard

matchwait



cast:

put cast %1

match cast ...wait

match release You are pulled through your

match release drawing your group

matchwait



release:



ECHO 

ECHO ===================================================

ECHO *** You made it!  Releasing held mana now.

ECHO ===================================================

ECHO 



put release

exit