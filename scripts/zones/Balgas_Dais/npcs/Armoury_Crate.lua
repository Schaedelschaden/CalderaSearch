-----------------------------------
-- Area: Balgas Dais
-- NPC:  Armoury Crate
-- Balgas Dais Burning Cicrcle Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local loot =
{
    -- BCNM Steamed Sprouts
    [97] =
    {
        {
            {itemid =   748, droprate =  500}, -- gold_beastcoin
            {itemid =   749, droprate =  500}, -- mythril_beastcoin
        },
        {
            {itemid =     0, droprate =  750}, -- nothing
            {itemid =  4174, droprate =  250}, -- vile_elixir
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 13237, droprate =  100}, -- survival_belt
            {itemid = 13127, droprate =  100}, -- guarding_gorget
            {itemid = 13405, droprate =  100}, -- enhancing_earring
            {itemid = 12349, droprate =  100}, -- balance_buckler
        },
        {
            {itemid =   776, droprate =  125}, -- white_rock
            {itemid =   773, droprate =  125}, -- translucent_rock
            {itemid =   774, droprate =  125}, -- purple_rock
            {itemid =   769, droprate =  125}, -- red_rock
            {itemid =   770, droprate =  125}, -- blue_rock
            {itemid =   771, droprate =  125}, -- yellow_rock
            {itemid =   772, droprate =  125}, -- green_rock
            {itemid =   775, droprate =  125}, -- black_rock
        },
        {
            {itemid =   790, droprate =   50}, -- garnet
            {itemid =   793, droprate =   50}, -- black_pearl
            {itemid =   811, droprate =   50}, -- ametrine
            {itemid =   797, droprate =   50}, -- painite
            {itemid =   792, droprate =   50}, -- pearl
            {itemid =   699, droprate =  100}, -- oak_log
            {itemid =   808, droprate =  100}, -- goshenite
            {itemid =   815, droprate =  100}, -- sphene
            {itemid =   701, droprate =  100}, -- rosewood_log
            {itemid =   798, droprate =  100}, -- turquoise
            {itemid =   794, droprate =  100}, -- sapphire
            {itemid =   788, droprate =  150}, -- peridot
        },
        {
            {itemid =     0, droprate =  125}, -- nothing
            {itemid =  4717, droprate =  125}, -- scroll_of_refresh
            {itemid =  4896, droprate =  125}, -- fire_spirit_pact
            {itemid =  4751, droprate =  125}, -- scroll_of_erase
            {itemid =  4874, droprate =  125}, -- scroll_of_absorb-str
            {itemid =  4714, droprate =  125}, -- scroll_of_phalanx
            {itemid =  4858, droprate =  125}, -- scroll_of_ice_spikes
            {itemid =  4947, droprate =  125}, -- scroll_of_utsusemi_ni
        },
    },
    -- BCNM Divine Punishers
    [98] =
    {
        {
            {itemid = 16726, droprate =  250}, -- forsetis_axe
            {itemid = 17647, droprate =  250}, -- aramiss_rapier
            {itemid = 17491, droprate =  250}, -- spartan_cesti
            {itemid = 17429, droprate =  250}, -- dominion_mace
        },
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid = 13054, droprate =  100}, -- fuma_kyahan
            {itemid = 13555, droprate =  200}, -- peace_ring
            {itemid = 13624, droprate =  200}, -- enhancing_mantle
            {itemid = 13236, droprate =  150}, -- master_belt
            {itemid = 13952, droprate =  100}, -- ochiudos_kote
        },
        {
            {itemid =     0, droprate =  850}, -- nothing
            {itemid =  4173, droprate =  100}, -- hi-reraiser
            {itemid =  4175, droprate =   50}, -- vile_elixir_+1
        },
        {
            {itemid =   774, droprate =  166}, -- purple_rock
            {itemid =   773, droprate =  166}, -- translucent_rock
            {itemid =   769, droprate =  167}, -- red_rock
            {itemid =   775, droprate =  167}, -- black_rock
            {itemid =   771, droprate =  167}, -- yellow_rock
            {itemid =   776, droprate =  167}, -- white_rock
        },
        {
            {itemid =   797, droprate =  125}, -- painite
            {itemid =   791, droprate =  125}, -- aquamarine
            {itemid =   810, droprate =  125}, -- fluorite
            {itemid =   805, droprate =  125}, -- zircon
            {itemid =   803, droprate =  125}, -- sunstone
            {itemid =   801, droprate =  125}, -- chrysoberyl
            {itemid =   802, droprate =  125}, -- moonstone
            {itemid =   784, droprate =  125}, -- jadeite
        },
        {
            {itemid =     0, droprate =  517}, -- nothing
            {itemid =   700, droprate =  333}, -- mahogany_log
            {itemid =   702, droprate =  150}, -- ebony_log
        },
        {
            {itemid =   652, droprate =  350}, -- steel_ingot
            {itemid =   653, droprate =  150}, -- mythril_ingot
            {itemid =   654, droprate =  150}, -- darksteel_ingot
            {itemid =   745, droprate =  350}, -- gold_ingot
        },
    },
    -- BCNM Treasure and Tribulations
    [100] =
    {
        {
            {itemid = 13292, droprate =   75}, -- Guardians Ring
            {itemid = 13287, droprate =   32}, -- Kampfer Ring
            {itemid = 13300, droprate =   54}, -- Conjurers Ring
            {itemid = 13298, droprate =   32}, -- Shinobi Ring
            {itemid = 13293, droprate =   97}, -- Slayers Ring
            {itemid = 13289, droprate =   75}, -- Sorcerers Ring
            {itemid = 13286, droprate =  108}, -- Soldiers Ring
            {itemid = 13294, droprate =   22}, -- Tamers Ring
            {itemid = 13296, droprate =   65}, -- Trackers Ring
            {itemid = 13299, droprate =   32}, -- Drake Ring
            {itemid = 13290, droprate =   32}, -- Fencers Ring
            {itemid = 13295, droprate =   86}, -- Minstrels Ring
            {itemid = 13288, droprate =   86}, -- Medicine Ring
            {itemid = 13291, droprate =   75}, -- Rogues Ring
            {itemid = 13297, droprate =   11}, -- Ronin Ring
            {itemid = 13447, droprate =   32}, -- Platinum Ring
        },
        {
            {itemid = 13548, droprate =  376}, -- Astral Ring
            {itemid = 13447, droprate =   22}, -- Platinum Ring
            {itemid =  4818, droprate =   65}, -- Scroll Of Quake
            {itemid =   859, droprate =   10}, -- Ram Skin
            {itemid =  4172, droprate =   11}, -- Reraiser
            {itemid =   653, droprate =   22}, -- Mythril Ingot
            {itemid =  4902, droprate =   10}, -- Light Spirit Pact
            {itemid =  4814, droprate =   32}, -- Scroll Of Freeze
            {itemid =  4719, droprate =   43}, -- Scroll Of Regen Iii
            {itemid =  4621, droprate =   32}, -- Scroll Of Raise Ii
            {itemid =   703, droprate =   11}, -- Petrified Log
            {itemid =   887, droprate =   11}, -- Coral Fragment
            {itemid =   700, droprate =   11}, -- Mahogany Log
            {itemid =   738, droprate =   43}, -- Chunk Of Platinum Ore
            {itemid =   737, droprate =  108}, -- Chunk Of Gold Ore
            {itemid =   645, droprate =   32}, -- Chunk Of Darksteel Ore
            {itemid =   644, droprate =   65}, -- Chunk Of Mythril Ore
            {itemid =   745, droprate =   10}, -- Gold Ingot
            {itemid =   654, droprate =   11}, -- Darksteel Ingot
            {itemid =   746, droprate =   11}, -- Platinum Ingot
            {itemid =   702, droprate =   11}, -- Ebony Log
            {itemid =   895, droprate =   11}, -- Ram Horn
            {itemid =   902, droprate =   11}, -- Demon Horn
            {itemid =  1116, droprate =    9}, -- Manticore Hide
            {itemid =  1122, droprate =   11}, -- Wyvern Skin
            {itemid =   866, droprate =   11}, -- Handful Of Wyvern Scales
        },
    },
    -- BCNM Creeping Doom
    [104] =
    {
        {
            {itemid =   816, droprate = 1000}, -- spool_of_silk_thread
        },
        {
            {itemid = 65535, droprate = 1000, amount = 3000}, -- gil
        },
        {
            {itemid =     0, droprate =  700}, -- nothing
            {itemid =   816, droprate =  300}, -- spool_of_silk_thread
        },
        {
            {itemid =     0, droprate =  900}, -- nothing
            {itemid =   816, droprate =  100}, -- spool_of_silk_thread
        },
        {
            {itemid =     0, droprate =  300}, -- nothing
            {itemid = 14733, droprate =   40}, -- singers_earring
            {itemid = 14735, droprate =   50}, -- ashigaru_earring
            {itemid = 14738, droprate =   50}, -- magicians_earring
            {itemid = 13439, droprate =   50}, -- warlocks_earring
            {itemid = 13437, droprate =   40}, -- healers_earring
            {itemid = 14730, droprate =   45}, -- esquires_earring
            {itemid = 13438, droprate =   50}, -- wizards_earring
            {itemid = 14737, droprate =   40}, -- wyvern_earring
            {itemid = 13435, droprate =   50}, -- mercenarys_earring
            {itemid = 14731, droprate =   45}, -- killer_earring
            {itemid = 13436, droprate =   45}, -- wrestlers_earring
            {itemid = 14736, droprate =   50}, -- genin_earring
            {itemid = 14734, droprate =   50}, -- beaters_earring
            {itemid = 14729, droprate =   45}, -- pilferers_earring
            {itemid = 14732, droprate =   50}, -- trimmers_earring
        },
        {
            {itemid =     0, droprate =  700}, -- nothing
            {itemid = 14733, droprate =   20}, -- singers_earring
            {itemid = 14735, droprate =   20}, -- ashigaru_earring
            {itemid = 14738, droprate =   20}, -- magicians_earring
            {itemid = 13439, droprate =   20}, -- warlocks_earring
            {itemid = 13437, droprate =   20}, -- healers_earring
            {itemid = 14730, droprate =   20}, -- esquires_earring
            {itemid = 13438, droprate =   20}, -- wizards_earring
            {itemid = 14737, droprate =   20}, -- wyvern_earring
            {itemid = 13435, droprate =   20}, -- mercenarys_earring
            {itemid = 14731, droprate =   20}, -- killer_earring
            {itemid = 13436, droprate =   20}, -- wrestlers_earring
            {itemid = 14736, droprate =   20}, -- genin_earring
            {itemid = 14734, droprate =   20}, -- beaters_earring
            {itemid = 14729, droprate =   20}, -- pilferers_earring
            {itemid = 14732, droprate =   20}, -- trimmers_earring
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1134, droprate =  400}, -- sheet_of_bast_parchment
            {itemid =  4116, droprate =  100}, -- hi-potion
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   694, droprate =  250}, -- chestnut_log
            {itemid =  4132, droprate =  250}, -- hi-ether
        },
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =  4751, droprate =  150}, -- scroll_of_erase
            {itemid =  4868, droprate =  200}, -- scroll_of_dispel
            {itemid =  5070, droprate =  250}, -- scroll_of_magic_finale
            {itemid =  4947, droprate =  150}, -- scroll_of_utsusemi_ni
        },
        {
            {itemid =     0, droprate =  300}, -- nothing
            {itemid =   814, droprate =   50}, -- amber_stone
            {itemid =   645, droprate =   50}, -- chunk_of_darksteel_ore
            {itemid =   690, droprate =   50}, -- elm_log
            {itemid =   651, droprate =   50}, -- iron_ingot
            {itemid =   643, droprate =   50}, -- chunk_of_iron_ore
            {itemid =   795, droprate =   50}, -- lapis_lazuli
            {itemid =   653, droprate =   50}, -- mythril_ingot
            {itemid =   644, droprate =   50}, -- chunk_of_mythril_ore
            {itemid =   799, droprate =   50}, -- onyx
            {itemid =   807, droprate =   50}, -- sardonyx
            {itemid =   744, droprate =   50}, -- silver_ingot
            {itemid =   736, droprate =   50}, -- chunk_of_silver_ore
            {itemid =   652, droprate =   50}, -- steel_ingot
            {itemid =   806, droprate =   50}, -- tourmaline
            {itemid =   796, droprate =   50}, -- light opal
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   814, droprate =   30}, -- amber_stone
            {itemid =   645, droprate =   40}, -- chunk_of_darksteel_ore
            {itemid =   690, droprate =   30}, -- elm_log
            {itemid =   651, droprate =   30}, -- iron_ingot
            {itemid =   643, droprate =   40}, -- chunk_of_iron_ore
            {itemid =   795, droprate =   30}, -- lapis_lazuli
            {itemid =   653, droprate =   40}, -- mythril_ingot
            {itemid =   644, droprate =   40}, -- chunk_of_mythril_ore
            {itemid =   799, droprate =   30}, -- onyx
            {itemid =   807, droprate =   30}, -- sardonyx
            {itemid =   744, droprate =   40}, -- silver_ingot
            {itemid =   736, droprate =   30}, -- chunk_of_silver_ore
            {itemid =   652, droprate =   30}, -- steel_ingot
            {itemid =   806, droprate =   30}, -- tourmaline
            {itemid =   796, droprate =   30}, -- light opal
        },
    },
    -- BCNM Charming Trio
    [105] =
    {
        {
            {itemid = 1603, droprate = 1000}, -- Mannequin Hands
        },
        {
            {itemid = 915, droprate = 250},  -- Jar Of Toad Oil
            {itemid = 4112, droprate = 300}, -- Potion
            {itemid = 4113, droprate = 180}, -- Potion +1
            {itemid = 4898, droprate = 130}, -- Air Spirit Pact
            {itemid = 825, droprate = 280},  -- Square Of Cotton Cloth
        },
        {
            {itemid = 749, droprate = 250},  -- Mythril Beastcoin
            {itemid = 17786, droprate = 190}, -- Ganko
            {itemid = 827, droprate = 270},  -- Square Of Wool Cloth
            {itemid = 18171, droprate = 145}, -- Platoon Disc
            {itemid = 824, droprate = 295},  -- Square Of Grass Cloth
            {itemid = 826, droprate = 260},  -- Square Of Linen Cloth
        },
        {
            {itemid = 0, droprate = 800},    -- Nothing
            {itemid = 18209, droprate = 167}, -- Platoon Cutter
        },
        {
            {itemid = 0, droprate = 500},    -- Nothing
            {itemid = 924, droprate = 500},  -- Vial Of Fiend Blood
        },
        {
            {itemid = 0, droprate = 500},    -- Nothing
            {itemid = 924, droprate = 500},  -- Vial Of Fiend Blood
        },
        {
            {itemid = 18170, droprate = 235}, -- Platoon Edge
            {itemid = 17271, droprate = 235}, -- Platoon Gun
            {itemid = 17692, droprate = 235}, -- Platoon Spatha
            {itemid = 17571, droprate = 235}, -- Platoon Pole
            {itemid = 17820, droprate = 255}, -- Gunromaru
            {itemid = 1601, droprate = 260}, -- Mannequin Head
            {itemid = 4853, droprate = 250}, -- Scroll Of Drain
            {itemid = 930, droprate = 190},  -- Vial Of Beastman Blood
        },
    },
    -- BCNM Harem Scarem
    [106] =
    {
        {
            {itemid =   857, droprate = 1000}, -- dhalmel_hide
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =   893, droprate =  500}, -- giant_femur
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  4359, droprate =  500}, -- slice_of_dhalmel_meat
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 13659, droprate =  150}, -- mercenary_mantle
            {itemid = 13669, droprate =  150}, -- beaters_mantle
            {itemid = 13665, droprate =  150}, -- esquires_mantle
            {itemid = 13661, droprate =  150}, -- healers_mantle
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 12392, droprate =  200}, -- wizards_shield
            {itemid = 12397, droprate =  200}, -- trimmers_aspis
            {itemid = 12402, droprate =  200}, -- wyvern_targe
        },
        {
            {itemid =     0, droprate =  200}, -- nothing
            {itemid =  4751, droprate =  200}, -- scroll_of_erase
            {itemid =  4868, droprate =  200}, -- scroll_of_dispel
            {itemid =  5070, droprate =  200}, -- scroll_of_magic_finale
            {itemid =  4947, droprate =  200}, -- scroll_of_utsusemi_ni
        },
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =   828, droprate =  250}, -- square_of_velvet_cloth
            {itemid =   826, droprate =  250}, -- square_of_linen_cloth
            {itemid =   827, droprate =  250}, -- square_of_wool_cloth
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid =  1601, droprate =  200}, -- mannequin_head
            {itemid =  1603, droprate =  200}, -- mannequin_hands
        },
    },
    -- KSNM Early Bird Catches the Wyrm
    [107] =
    {
        {
            {itemid = 6183, droprate = 1000},  -- Pluton Box (15-30 Plutons)
        },
        {
            {itemid = 21689, droprate = 180},  -- Montante +1
            {itemid = 20528, droprate = 180},  -- Fists of Fury +1
            {itemid = 20805, droprate = 180},  -- Perun +1
            {itemid = 20614, droprate = 180},  -- Pukulatmuj +1
            {itemid = 20981, droprate = 180},  -- Raicho +1
            {itemid = 21163, droprate = 100},  -- Pouwhenua +1
        },
        {
            {itemid = 20612, droprate = 180},  -- Sangarius +1
            {itemid = 20988, droprate = 180},  -- Tancho +1
            {itemid = 20680, droprate = 180},  -- Tanmogayi +1
            {itemid = 20604, droprate = 180},  -- Ternion Dagger +1
            {itemid =  21691, droprate = 180}, -- Ushenzi +1
            {itemid =  21076, droprate = 100}, -- Septoptic +1
        },
        {
            {itemid = 26943, droprate = 110},  -- Agony Jerkin +1
            {itemid = 25681, droprate = 110},  -- Cohort Cloak +1
            {itemid = 26871, droprate = 110},  -- Emet Harness +1
            {itemid = 26873, droprate = 110},  -- Hime Domaru +1
            {itemid = 26897, droprate = 110},  -- Lugra Cloak +1
            {itemid = 25710, droprate = 110},  -- Obviation Cuirass +1
            {itemid = 26869, droprate = 110},  -- Rosette Jaseran +1
            {itemid = 26888, droprate = 110},  -- Shomonjijoe +1
            {itemid = 25733, droprate = 120},  -- Tatenashi Haramaki +1
        },
        {
            {itemid = 21417, droprate = 100},  -- Refined Grip +1
            {itemid = 21419, droprate = 100},  -- Rigorous Grip +1
            {itemid = 27639, droprate = 100},  -- Ajax +1
            {itemid = 27637, droprate = 100},  -- Evalach +1
            {itemid = 27641, droprate = 100},  -- Deliverance +1
            {itemid = 26402, droprate = 100},  -- Forfend +1
            {itemid = 22121, droprate = 100},  -- Imati +1
            {itemid = 21484, droprate = 100},  -- Malison +1
            {itemid = 21220, droprate = 100},  -- Paloma +1
            {itemid = 22267, droprate = 100},  -- Antitail +1
        },
        {
			{itemid =    0, droprate = 250},   -- Nothing
            {itemid = 4069, droprate = 150},   -- Rem Chapt 6
            {itemid = 4070, droprate = 150},   -- Rem Chapt 7
            {itemid = 4071, droprate = 150},   -- Rem Chapt 8
            {itemid = 4072, droprate = 150},   -- Rem Chapt 9
            {itemid = 4073, droprate = 150},   -- Rem Chapt 10
        },
        {
			{itemid =    0, droprate = 250},   -- Nothing
            {itemid = 4069, droprate = 150},   -- Rem Chapt 6
            {itemid = 4070, droprate = 150},   -- Rem Chapt 7
            {itemid = 4071, droprate = 150},   -- Rem Chapt 8
            {itemid = 4072, droprate = 150},   -- Rem Chapt 9
            {itemid = 4073, droprate = 150},   -- Rem Chapt 10
        },
        {
            {itemid = 8732, droprate = 1000},  -- Kupon I S-3
        },
        {
            {itemid = 8747, droprate = 111},   -- Ra'Kaznar Ore
			{itemid = 4077, droprate = 111},   -- Moonbow Steel
			{itemid = 4079, droprate = 111},   -- Moonbow Leather
			{itemid = 4080, droprate = 111},   -- Moonbow Urushi
			{itemid = 4081, droprate = 111},   -- Moonbow Stone
			{itemid = 4078, droprate = 111},   -- Moonbow CLoth
			{itemid = 9251, droprate = 111},   -- Khoma Thread
			{itemid = 9255, droprate = 111},   -- Cyan Coral
			{itemid = 4082, droprate = 112},   -- Moonlight Coral
			
        },
        {
            {itemid = 8747, droprate = 111},  -- Ra'Kaznar Ore
			{itemid = 4077, droprate = 111},  -- Moonbow Steel
			{itemid = 4079, droprate = 111},  -- Moonbow Leather
			{itemid = 4080, droprate = 111},  -- Moonbow Urushi
			{itemid = 4081, droprate = 111},  -- Moonbow Stone
			{itemid = 4078, droprate = 111},  -- Moonbow CLoth
			{itemid = 9251, droprate = 111},  -- Khoma Thread
			{itemid = 9255, droprate = 111},  -- Cyan Coral
			{itemid = 4082, droprate = 112},  -- Moonlight Coral
			
        },
    },
    -- BCNM Royal Succession
    [108] =
    {
	    -- {
            -- {itemid = 65535, droprate = 1000, amount = 1000000}, -- gil
        -- },
        {
            {itemid =  20851, droprate = 125}, -- Aizkora
            {itemid =  20606, droprate = 125}, -- Anathema Harpe
            {itemid =  20806, droprate = 125}, -- Buramgh
            {itemid =  20942, droprate = 125}, -- Gae Derg
            {itemid =  20608, droprate = 125}, -- Jugo Kurki
            {itemid =  21034, droprate = 125}, -- Kunimune
            {itemid =  22266, droprate = 125}, -- Antitail
            {itemid =  20611, droprate = 125}, -- Sangarius
        },
        {
            {itemid = 26714, droprate =  145}, -- Adorned Helm
            {itemid = 26786, droprate =  145}, -- Alhazen Hat
            {itemid = 25601, droprate =  145}, -- Blistering Sallet
            {itemid = 26784, droprate =  145}, -- Hike Khat
            {itemid = 26709, droprate =  145}, -- Imperial Wing Hairpin
            {itemid = 25635, droprate =  130}, -- Loess Barbuta
            {itemid = 26731, droprate =  145}, -- Stinger Helm
        },
        {
            {itemid =  3972, droprate =  1000}, -- Kupon I S-2
        },
        {
			{itemid =  0,    droprate = 850},  -- Nothing
            {itemid =  3972, droprate =  150}, -- Kupon I S-2
        },
        {
            {itemid = 4069, droprate = 1000},  -- Rem Chapt 6
        },
        {
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 4069, droprate = 150},   -- Rem Chapt 6
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 4028, droprate = 150},   -- Akaso Cloth
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 8751, droprate = 150},   -- Ancestral Cloth
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 812, droprate = 150},   -- Deathstone
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 8728, droprate = 150},   -- Sif's Macrame
        },		
		{
            {itemid = 8728, droprate = 1000},   -- Sif's Macrame
        },	
    },
    -- BCNM Rapid Raptors
    [109] =
    {
        {
            {itemid =   853, droprate = 1000}, -- raptor_skin
        },
        {
            {itemid =   655, droprate = 1000}, -- adaman_ingot
        },
        {
            {itemid =     0, droprate =  190}, -- nothing
            {itemid = 14845, droprate =  110}, -- sly_gauntlets
            {itemid = 14843, droprate =  120}, -- spiked_finger_gauntlets
            {itemid = 14844, droprate =  140}, -- rush_gloves
            {itemid = 15149, droprate =  140}, -- rival_ribbon
            {itemid = 15148, droprate =  150}, -- mana_circlet
            {itemid = 14842, droprate =  150}, -- ivory_mitts
        },
        {
            {itemid =     0, droprate =   30}, -- nothing
            {itemid = 13167, droprate =  100}, -- storm_gorget
            {itemid = 13168, droprate =  100}, -- intellect_torque
            {itemid = 13169, droprate =  120}, -- benign_necklace
            {itemid = 13676, droprate =  130}, -- heavy_mantle
            {itemid = 13166, droprate =  170}, -- hateful_collar
            {itemid = 13677, droprate =  170}, -- esoteric_mantle
            {itemid = 13679, droprate =  180}, -- templars_mantle
        },
        {
            {itemid =     0, droprate =  230}, -- nothing
            {itemid =   653, droprate =  200}, -- mythril_ingot
            {itemid =   643, droprate =  200}, -- chunk_of_iron_ore
            {itemid =   703, droprate =  370}, -- petrified_log
        },
        {
            {itemid =     0, droprate =  560}, -- nothing
            {itemid =  4172, droprate =  440}, -- reraiser
        },
    },
    -- BCNM Wild Wild Whiskers
    [110] =
    {
	    -- {
            -- {itemid = 65535, droprate = 1000, amount = 500000}, -- gil
        -- },
		{
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  21285, droprate = 300}, -- Camaraderie Gun
			{itemid =  21003, droprate = 300}, -- Camaraderie Katana
			{itemid =  21050, droprate = 300}, -- Camaraderie Tachi
        },
        {
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  28642, droprate = 300}, -- Contriver's Cape
			{itemid =  28582, droprate = 300}, -- Locus Ring
			{itemid =  21388, droprate = 300}, -- Dashavatara Sachet
        },
        {
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  28199, droprate = 300}, -- Manibozho Brais
			{itemid =  28200, droprate = 300}, -- Bokwus Slops
			{itemid =  28198, droprate = 300}, -- Mikinaak Cuisses
        },
        {
            {itemid =  4065, droprate = 1000}, -- Rems Chapt 2
        },
        {
			{itemid = 0,     droprate = 850},  -- Nothing
            {itemid =  4065, droprate = 150},  -- Rems Chapt 2
        },
        {
            {itemid = 0,    droprate =  900},  -- Nothing
            {itemid = 1178, droprate =  100},  -- Lachesis Orb
        },
        {
           {itemid = 8734, droprate = 1000},   -- Kupon I S-1
        },
        {
			{itemid = 0,   droprate = 850},    -- Nothing
           {itemid = 8734, droprate = 150},    -- Kupon I S-1
        },
		{
			{itemid = 0,    droprate = 800},   -- Nothing
            {itemid = 837,  droprate = 200},   -- Malboro Fiber
        },
    },
    -- KSNM Moa Constrictors
    [113] =
    {
		{ -- Accessories, 1 is guaranteed.
            {itemid = 28369, droprate =  40}, -- Arciela's Grace +1
            {itemid = 28378, droprate =  60}, -- Arciela's Grace
            {itemid = 28365, droprate = 100}, -- Nefarious Collar +1
            {itemid = 10958, droprate = 125}, -- Nefarious Collar 
            {itemid = 10398, droprate = 175}, -- Weike Torque
            {itemid = 10784, droprate = 200}, -- Dhanurveda Ring
            {itemid = 28573, droprate = 300}, -- Wuji Ring
        },
        
        { -- Tier 1-3 mats, 1 guaranteed
            {itemid =  4074, droprate =  25}, -- Thought Crystal
            {itemid =  9003, droprate =  60}, -- Plovid Flesh
            {itemid =  9002, droprate =  60}, -- Plovid Effluvium
            {itemid =  9258, droprate =  90}, -- Azure Cermet
            {itemid =  9248, droprate = 105}, -- Niobium Ingot
            {itemid =  9256, droprate = 105}, -- Cyan Orb
            {itemid =  9250, droprate = 105}, -- Khoma Cloth
            {itemid =  9247, droprate = 150}, -- Niobium Ore
            {itemid =  9255, droprate = 150}, -- Cyan Coral
            {itemid =  9251, droprate = 150}, -- Khoma Thread
        },
        
        { -- Tier 1-3 mats, 50/50 to get something
            {itemid =     0, droprate = 500}, -- Nothing
            {itemid =  4074, droprate =  12}, -- Thought Crystal
            {itemid =  9003, droprate =  30}, -- Plovid Flesh
            {itemid =  9002, droprate =  30}, -- Plovid Effluvium
            {itemid =  9258, droprate =  45}, -- Azure Cermet
            {itemid =  9248, droprate =  52}, -- Niobium Ingot
            {itemid =  9256, droprate =  53}, -- Cyan Orb
            {itemid =  9252, droprate =  53}, -- Khoma Cloth
            {itemid =  9247, droprate =  75}, -- Niobium Ore
            {itemid =  9255, droprate =  75}, -- Cyan Coral
            {itemid =  9251, droprate =  75}, -- Khoma Thread
        },
        
        { -- Tier 4 mats, 1 is guaranteed.
            {itemid =  3980, droprate = 100}, -- Bztavian Stinger
            {itemid =  3981, droprate = 100}, -- Bztavian Wing
            {itemid =  3979, droprate = 100}, -- Rockfin Tooth
            {itemid =  3977, droprate = 100}, -- Gabbrath Horn
            {itemid =  4014, droprate = 100}, -- Yggdreant Bole
            {itemid =  4015, droprate = 100}, -- Yggdreant Root
            {itemid =  4012, droprate = 100}, -- Waktza Rostrum
            {itemid =  4013, droprate = 100}, -- Waktza Crest
            {itemid =  8752, droprate = 100}, -- Cehuetzi Claw
            {itemid =  8754, droprate = 100}, -- Cehuetzi Pelt
        },
        
        { -- Tier 4 mats, 50% to get, 50% nothing.
            {itemid =     0, droprate = 500}, -- Nothing
            {itemid =  4012, droprate = 100}, -- Waktza Rostrum
            {itemid =  4013, droprate = 100}, -- Waktza Crest
            {itemid =  8752, droprate = 100}, -- Cehuetzi Claw
            {itemid =  8754, droprate = 100}, -- Cehuetzi Pelt
            {itemid =  3977, droprate = 100}, -- Gabbrath Horn
        },
        {
            {itemid =  9783, droprate = 330}, -- Abdjhalis Gem
            {itemid =  9784, droprate = 330}, -- Abdjhalis Anima
            {itemid =  9782, droprate = 330}, -- Abdjhalis Nugget
            {itemid =     0, droprate =  10}, -- Nothing
        },
        
        {
            {itemid =  9783, droprate = 70}, -- Abdjhalis Gem
            {itemid =  9784, droprate = 70}, -- Abdjhalis Anima
            {itemid =  9782, droprate = 70}, -- Abdjhalis Nugget
            {itemid =     0, droprate = 790}, -- Nothing
        },
    },
}
function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        tpz.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
