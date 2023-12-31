-----------------------------------
-- Area: Horlais Peak
-- NPC:  Armoury Crate
-------------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
-------------------------------------

local loot =
{
    -- BCNM Tails of Woe -- Off
    [1] =
    {
        {
            {itemid = 13553, droprate = 150}, -- blitz Ring
            {itemid = 0,     droprate = 850}, -- Nothing
        },
        {
            {itemid = 13554, droprate = 300}, -- aegis Ring
            {itemid = 13625, droprate = 200}, -- tundra mantle
            {itemid = 13238, droprate = 200}, -- druids rope
            {itemid = 0,     droprate = 300}, -- Nothing
        },
        {
            {itemid = 4896, droprate = 145}, -- firespirit
            {itemid = 4751, droprate = 165}, -- erase
            {itemid = 4714, droprate = 140}, -- phalanx
            {itemid = 4874, droprate = 123}, -- absorb-str
            {itemid = 788,  droprate =  94}, -- peridot
            {itemid = 792,  droprate =  94}, -- pearl
            {itemid = 772,  droprate =  13}, -- green rock
            {itemid = 811,  droprate =  53}, -- ametrine
            {itemid = 748,  droprate =  70}, -- gold beastcoin
            {itemid = 749,  droprate =  50}, -- mythril beastcoin
            {itemid = 771,  droprate =  53}, -- yellow rock
            {itemid = 0,    droprate =   0}, -- nothing
        },
        {
            {itemid = 4751, droprate = 125}, -- erase
            {itemid = 4714, droprate = 110}, -- phalanx
            {itemid = 4874, droprate = 104}, -- absorb-str
            {itemid = 788,  droprate =  94}, -- peridot
            {itemid = 792,  droprate =  94}, -- pearl
            {itemid = 772,  droprate =  53}, -- green rock
            {itemid = 811,  droprate =  73}, -- ametrine
            {itemid = 748,  droprate =  70}, -- gold beastcoin
            {itemid = 749,  droprate =  70}, -- mythril beastcoin
            {itemid = 771,  droprate =  73}, -- yellow rock
            {itemid = 0,    droprate =  94}, -- nothing
        },
        {
            {itemid = 4896, droprate = 174}, -- firespirit
            {itemid = 4751, droprate =  16}, -- vile elixir
            {itemid = 4714, droprate = 114}, -- icespikes
            {itemid = 4874, droprate = 174}, -- refresh
            {itemid = 4947, droprate = 138}, -- utsusemi ni
            {itemid = 772,  droprate =  18}, -- green rock
            {itemid = 775,  droprate =  18}, -- black rock
            {itemid = 770,  droprate =  17}, -- blue rock
            {itemid = 769,  droprate =  16}, -- red rock
            {itemid = 774,  droprate =  16}, -- purple rock
            {itemid = 776,  droprate =  16}, -- white rock
            {itemid = 771,  droprate =  17}, -- yellow rock
            {itemid = 773,  droprate =  17}, -- translucent rock
            {itemid = 4172, droprate =  21}, -- reraiser
            {itemid = 699,  droprate =  22}, -- oak log
            {itemid = 701,  droprate =  18}, -- rosewood log
            {itemid = 748,  droprate = 120}, -- gold beastcoin
            {itemid = 749,  droprate = 102}, -- mythril beastcoin
            {itemid = 792,  droprate =  21}, -- pearl
            {itemid = 798,  droprate =  23}, -- Turquoise
            {itemid = 808,  droprate =  19}, -- Goshenite
            {itemid = 793,  droprate =  18}, -- Black pearl
            {itemid = 815,  droprate =  17}, -- sphene
            {itemid = 790,  droprate =  20}, -- garnet
            {itemid = 811,  droprate =  18}, -- ametrine
            {itemid = 0,    droprate =   0}, -- nothing
        },
        {
            {itemid = 4714, droprate = 87}, -- icespikes
            {itemid = 4874, droprate = 75}, -- refresh
            {itemid = 4947, droprate = 75}, -- utsusemi ni
            {itemid =  699, droprate = 80}, -- oak log
            {itemid =  701, droprate = 97}, -- rosewood log
            {itemid =  792, droprate = 86}, -- pearl
            {itemid =  798, droprate = 88}, -- Turquoise
            {itemid =  808, droprate = 79}, -- Goshenite
            {itemid =  793, droprate = 93}, -- Black pearl
            {itemid =  815, droprate = 79}, -- sphene
            {itemid =  790, droprate = 71}, -- garnet
            {itemid =  811, droprate = 90}, -- ametrine
            {itemid =    0, droprate =  0}, -- nothing
        },
    },

    -- BCNM Dismemberment Brigade -- Off
    [2] =
    {
        {
            {itemid = 16684, droprate =  250}, -- kabrakans_axe
            {itemid = 17190, droprate =  250}, -- sarnga
            {itemid = 17648, droprate =  250}, -- dragvandil
            {itemid = 17379, droprate =  250}, -- hamelin_flute
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 13128, droprate =  200}, -- spectacles
            {itemid = 13403, droprate =  200}, -- assault_earring
            {itemid = 13555, droprate =  200}, -- peace_ring
        },
        {
            {itemid =     0, droprate =  200}, -- nothing
            {itemid =   773, droprate =  200}, -- translucent_rock
            {itemid =   772, droprate =  200}, -- green_rock
            {itemid =   771, droprate =  200}, -- yellow_rock
            {itemid =   774, droprate =  200}, -- purple_rock
        },
        {
            {itemid =   797, droprate =  100}, -- painite
            {itemid =   784, droprate =  100}, -- jadeite
            {itemid =   653, droprate =  100}, -- mythril_ingot
            {itemid =   652, droprate =  100}, -- steel_ingot
            {itemid =   810, droprate =  100}, -- fluorite
            {itemid =   745, droprate =  100}, -- gold_ingot
            {itemid =   805, droprate =  100}, -- zircon
            {itemid =   801, droprate =  100}, -- chrysoberyl
            {itemid =   654, droprate =  100}, -- darksteel_ingot
            {itemid =   802, droprate =  100}, -- moonstone
        },
        {
            {itemid =     0, droprate =  900}, -- nothing
            {itemid =  4175, droprate =  100}, -- vile_elixir_+1
        },
    },

    -- BCNM Hostile Herbivores -- Off
    [4] =
    {
        {
            {itemid = 0, droprate = 50},     -- Nothing
            {itemid = 13251, droprate = 95}, -- Ocean Belt
            {itemid = 13254, droprate = 95}, -- Jungle Belt
            {itemid = 13253, droprate = 95}, -- Steppe Belt
            {itemid = 13255, droprate = 95}, -- Desert Belt
            {itemid = 13252, droprate = 95}, -- Forest Belt
            {itemid = 13256, droprate = 95}, -- Ocean Stone
            {itemid = 13259, droprate = 95}, -- Jungle Stone
            {itemid = 13258, droprate = 95}, -- Steppe Stone
            {itemid = 13260, droprate = 95}, -- Desert Stone
            {itemid = 13257, droprate = 95}, -- Forest Stone
        },
        {
            {itemid = 13292, droprate = 64}, -- Guardians Ring
            {itemid = 13287, droprate = 65}, -- Kampfer Ring
            {itemid = 13300, droprate = 65}, -- Conjurers Ring
            {itemid = 13298, droprate = 65}, -- Shinobi Ring
            {itemid = 13293, droprate = 65}, -- Slayers Ring
            {itemid = 13289, droprate = 65}, -- Sorcerers Ring
            {itemid = 13286, droprate = 64}, -- Soldiers Ring
            {itemid = 13294, droprate = 65}, -- Tamers Ring
            {itemid = 13296, droprate = 64}, -- Trackers Ring
            {itemid = 13299, droprate = 65}, -- Drake Ring
            {itemid = 13290, droprate = 65}, -- Fencers Ring
            {itemid = 13295, droprate = 65}, -- Minstrels Ring
            {itemid = 13288, droprate = 64}, -- Medicine Ring
            {itemid = 13291, droprate = 65}, -- Rogues Ring
            {itemid = 13297, droprate = 64}, -- Ronin Ring
            {itemid = 13447, droprate = 30}, -- Platinum Ring
        },
        {
            {itemid = 0, droprate = 100},    -- Nothing
            {itemid = 4818, droprate = 176}, -- Scroll Of Quake
            {itemid = 4902, droprate = 10},  -- Light Spirit Pact
            {itemid = 4814, droprate = 176}, -- Scroll Of Freeze
            {itemid = 4719, droprate = 176}, -- Scroll Of Regen Iii
            {itemid = 4172, droprate = 60},  -- Reraiser
            {itemid = 4174, droprate = 60},  -- Vile Elixir
            {itemid = 4621, droprate = 176}, -- Scroll Of Raise Ii
        },
        {
            {itemid = 0, droprate = 100},    -- Nothing
            {itemid = 4818, droprate = 176}, -- Scroll Of Quake
            {itemid = 4902, droprate = 10},  -- Light Spirit Pact
            {itemid = 4814, droprate = 176}, -- Scroll Of Freeze
            {itemid = 4719, droprate = 176}, -- Scroll Of Regen Iii
            {itemid = 4172, droprate = 60},  -- Reraiser
            {itemid = 4174, droprate = 60},  -- Vile Elixir
            {itemid = 4621, droprate = 176}, -- Scroll Of Raise Ii
        },
        {
            {itemid = 895, droprate = 59},   -- Ram Horn
            {itemid = 700, droprate = 59},   -- Mahogany Log
            {itemid = 653, droprate = 200},  -- Mythril Ingot
            {itemid = 1116, droprate = 59},  -- Manticore Hide
            {itemid = 866, droprate = 90},   -- Handful Of Wyvern Scales
            {itemid = 1122, droprate = 90},  -- Wyvern Skin
            {itemid = 703, droprate = 176},  -- Petrified Log
            {itemid = 654, droprate = 59},   -- Darksteel Ingot
            {itemid = 859, droprate = 59},   -- Ram Skin
            {itemid = 746, droprate = 90},   -- Platinum Ingot
        },
        {
            {itemid = 0, droprate = 100},    -- Nothing
            {itemid = 895, droprate = 59},   -- Ram Horn
            {itemid = 700, droprate = 59},   -- Mahogany Log
            {itemid = 653, droprate = 200},  -- Mythril Ingot
            {itemid = 1116, droprate = 59},  -- Manticore Hide
            {itemid = 866, droprate = 90},   -- Handful Of Wyvern Scales
            {itemid = 1122, droprate = 90},  -- Wyvern Skin
            {itemid = 703, droprate = 176},  -- Petrified Log
            {itemid = 654, droprate = 59},   -- Darksteel Ingot
            {itemid = 859, droprate = 59},   -- Ram Skin
            {itemid = 746, droprate = 90},   -- Platinum Ingot
        },
    },

    -- BCNM Carapace Combatants -- Off
    [8] =
    {
        {
            {itemid =   894, droprate = 1000}, -- beetle_jaw
        },
        {
            {itemid =   889, droprate = 1000}, -- beetle_shell
        },
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid = 15282, droprate =  150}, -- katana_obi
            {itemid = 15274, droprate =  150}, -- staff_belt
            {itemid = 15280, droprate =  150}, -- song_belt
            {itemid = 15272, droprate =  150}, -- cestus_belt
            {itemid = 15279, droprate =  150}, -- pick_belt
        },
        {
            {itemid =     0, droprate =  125}, -- nothing
            {itemid = 14736, droprate =  125}, -- genin_earring
            {itemid = 14738, droprate =  125}, -- magicians_earring
            {itemid = 14729, droprate =  125}, -- pilferers_earring
            {itemid = 13439, droprate =  125}, -- warlocks_earring
            {itemid = 13436, droprate =  125}, -- wrestlers_earring
            {itemid = 14737, droprate =  125}, -- wyvern_earring
            {itemid = 14731, droprate =  125}, -- killer_earring
        },
        {
            {itemid =     0, droprate =  160}, -- nothing
            {itemid =   645, droprate =  140}, -- chunk_of_darksteel_ore
            {itemid =   653, droprate =  140}, -- mythril_ingot
            {itemid =   744, droprate =  140}, -- silver_ingot
            {itemid =   652, droprate =  140}, -- steel_ingot
            {itemid =   644, droprate =  140}, -- chunk_of_mythril_ore
            {itemid =   807, droprate =  140}, -- sardonyx
        },
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =  4868, droprate =  125}, -- scroll_of_dispel
            {itemid =  4947, droprate =  125}, -- scroll_of_utsusemi_ni
            {itemid =  4753, droprate =  125}, -- scroll_of_fire_ii
            {itemid =  5070, droprate =  125}, -- scroll_of_magic_finale
            {itemid =  4877, droprate =  125}, -- scroll_of_absorb-agi
            {itemid =  4878, droprate =  125}, -- scroll_of_absorb-int
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid = 17873, droprate =  500}, -- jug_of_scarlet_sap
        },
        {
            {itemid =     0, droprate =  750}, -- nothing
            {itemid = 17873, droprate =  250}, -- jug_of_scarlet_sap
        },
        {
            {itemid =     0, droprate =  900}, -- nothing
            {itemid =  4132, droprate =  100}, -- hi-ether
        },
    },

    -- BCNM Shooting Fish -- Off
    [9] =
    {
        {
            {itemid =  1601, droprate = 1000}, -- mannequin_head
        },
        {
            {itemid =  4484, droprate = 1000}, -- shall_shell
        },
        {
            {itemid =   749, droprate =  300}, -- mythril_beastcoin
            {itemid =   775, droprate =   70}, -- black_rock
            {itemid =   774, droprate =   30}, -- purple_rock
            {itemid =   776, droprate =  100}, -- white_rock
            {itemid = 17202, droprate =  100}, -- platoon_bow
            {itemid = 17462, droprate =  100}, -- platoon_mace
            {itemid = 18171, droprate =  150}, -- platoon_disc
            {itemid = 17271, droprate =  150}, -- platoon_gun
        },
        {
            {itemid =   749, droprate =  310}, -- mythril_beastcoin
            {itemid =   772, droprate =   50}, -- green_rock
            {itemid =   771, droprate =   40}, -- yellow_rock
            {itemid =   770, droprate =   40}, -- blue_rock
            {itemid =   769, droprate =   40}, -- red_rock
            {itemid =   773, droprate =  110}, -- translucent_rock
            {itemid = 17519, droprate =  130}, -- platoon_cesti
            {itemid = 18209, droprate =  100}, -- platoon_cutter
            {itemid = 17692, droprate =   80}, -- platoon_spatha
            {itemid = 18045, droprate =  100}, -- platoon_zaghnal
        },
        {
            {itemid =     0, droprate =  670}, -- nothing
            {itemid =   868, droprate =  190}, -- handful_of_pugil_scales
            {itemid =  4484, droprate =  140}, -- shall_shell
        },
        {
            {itemid =     0, droprate =  930}, -- nothing
            {itemid =  1602, droprate =   70}, -- mannequin_body
        },
        {
            {itemid =  4857, droprate =  180}, -- scroll_of_blaze_spikes
            {itemid =  4984, droprate =  510}, -- scroll_of_horde_lullaby
            {itemid =  4900, droprate =  280}, -- thunder_spirit_pact
            {itemid =  4869, droprate =   30}, -- scroll_of_warp
        },
    },

    -- BCNM Dropping Like Flies -- Off
    [10] =
    {
        {
            {itemid = 65535, droprate = 1000, amount = 4000}, -- Gil
        },
        {
            {itemid = 846, droprate = 1000}, -- Insect Wing
        },
        {
            {itemid = 1601, droprate = 1000}, -- Mannequin Head
        },
        {
            {itemid = 0, droprate = 636},    -- Nothing
            {itemid = 12486, droprate = 364}, -- Emperor Hairpin
        },
        {
            {itemid = 12400, droprate = 175}, -- Ashigaru Targe
            {itemid = 12399, droprate = 175}, -- Beaters Aspis
            {itemid = 12395, droprate = 175}, -- Varlets Targe
            {itemid = 12390, droprate = 175}, -- Wrestlers Aspis
            {itemid = 809, droprate = 100},  -- Clear Topaz
            {itemid = 795, droprate = 100},  -- Lapis Lazuli
            {itemid = 796, droprate = 100},  -- Light Opal
        },
        {
            {itemid = 13659, droprate = 250}, -- Mercenary Mantle
            {itemid = 13668, droprate = 250}, -- Singers Mantle
            {itemid = 13662, droprate = 250}, -- Wizards Mantle
            {itemid = 13672, droprate = 250}, -- Wyvern Mantle
        },
        {
            {itemid = 4947, droprate = 70},  -- Scroll Of Utsusemi Ni
            {itemid = 5070, droprate = 70},  -- Scroll Of Magic Finale
            {itemid = 17863, droprate = 150}, -- Jug Of Quadav Bug Broth
            {itemid = 799, droprate = 100},  -- Onyx
            {itemid = 795, droprate = 100},  -- Lapis Lazuli
            {itemid = 796, droprate = 100},  -- Light Opal
            {itemid = 4868, droprate = 150}, -- Scroll Of Dispel
            {itemid = 4751, droprate = 100}, -- Scroll Of Erase
            {itemid = 690, droprate = 90},   -- Elm Log
            {itemid = 1602, droprate = 70},  -- Mannequin Body
        },
    },

    -- KSNM Horns of War
    [11] =
    {
        {
            {itemid = 6183, droprate = 1000},  -- Pluton Box (15-30 Plutons)
        },
        {
            {itemid = 20852, droprate = 167}, 	-- Aizkora +1
            {itemid = 20607, droprate = 167},	-- Anathema Harpe +1
            {itemid = 20807, droprate = 167}, 	-- Buramgh +1
            {itemid = 20697, droprate = 167}, 	-- Combuster +1
            {itemid = 20508, droprate = 166}, 	-- Comeuppances +1
			{itemid = 21165, droprate = 166}, 	-- Ababinili +1
        },
        {
            {itemid = 20943, droprate = 167}, 	-- Gae Derg +1
            {itemid = 20609, droprate = 167}, 	-- Jugo Kukri +1
            {itemid = 21035, droprate = 167},	-- Kunimune +1
            {itemid = 20800, droprate = 167},	-- Mdomo Axe +1
            {itemid = 21696, droprate = 166},	-- Nullis +1
			{itemid = 22058, droprate = 166},	-- Contemplator +1
        },
        {
            {itemid = 26715, droprate = 145},	-- Adorned Helm +1
            {itemid = 26787, droprate = 145},	-- Alhazen Hat +1
            {itemid = 25602, droprate = 145},	-- Blistering Sallet +1
            {itemid = 26785, droprate = 145},	-- Hike Khat +1
            {itemid = 26710, droprate = 145},	-- Imperial Wing Hairpin +1
            {itemid = 25636, droprate = 130},	-- Loess Barabuta +1
            {itemid = 26732, droprate = 145},	-- Stinger Helm +1
        },
        {
            {itemid = 27107, droprate = 145},	-- Asteria Mitts +1
            {itemid = 27151, droprate = 145},	-- Gazu Bracelets +1
            {itemid = 27051, droprate = 145},	-- Kachimusha Kote +1
            {itemid = 27109, droprate = 145},	-- Lamassu Mitts +1
            {itemid = 27996, droprate = 145},	-- Shigure Tekko +1
            {itemid = 27994, droprate = 130},	-- Macabre Gauntlets +1
            {itemid = 27149, droprate = 145},	-- Tatenashi Gate +1
        },
        {
            {itemid = 4069, droprate = 150},	-- Rem Chapt 6
            {itemid = 4070, droprate = 150},	-- Rem Chapt 7
            {itemid = 4071, droprate = 150},	-- Rem Chapt 8
            {itemid = 4072, droprate = 150},	-- Rem Chapt 9
            {itemid = 4073, droprate = 150},	-- Rem Chapt 10
			{itemid =    0, droprate = 250},	-- Nothing
        },
        {
            {itemid = 4069, droprate = 150},	-- Rem Chapt 6
            {itemid = 4070, droprate = 150},	-- Rem Chapt 7
            {itemid = 4071, droprate = 150},	-- Rem Chapt 8
            {itemid = 4072, droprate = 150},	-- Rem Chapt 9
            {itemid = 4073, droprate = 150},	-- Rem Chapt 10
			{itemid =    0, droprate = 250},	-- Nothing
        },
        {
            {itemid = 8732, droprate = 1000},	-- Kupon I S-3
        },
        {
            {itemid = 8747, droprate = 111},	-- Ra'Kaznar Ore
			{itemid = 4077, droprate = 111},	-- Moonbow Steel
			{itemid = 4079, droprate = 111},	-- Moonbow Leather
			{itemid = 4080, droprate = 111},	-- Moonbow Urushi
			{itemid = 4081, droprate = 111},	-- Moonbow Stone
			{itemid = 4078, droprate = 111},	-- Moonbow CLoth
			{itemid = 9251, droprate = 111},	-- Khoma Thread
			{itemid = 9255, droprate = 111},	-- Cyan Coral
			{itemid = 4082, droprate = 112},	-- Moonlight Coral
			
        },
        {
            {itemid = 8747, droprate = 111},	-- Ra'Kaznar Ore
			{itemid = 4077, droprate = 111},	-- Moonbow Steel
			{itemid = 4079, droprate = 111},	-- Moonbow Leather
			{itemid = 4080, droprate = 111},	-- Moonbow Urushi
			{itemid = 4081, droprate = 111},	-- Moonbow Stone
			{itemid = 4078, droprate = 111},	-- Moonbow CLoth
			{itemid = 9251, droprate = 111},	-- Khoma Thread
			{itemid = 9255, droprate = 111},	-- Cyan Coral
			{itemid = 4082, droprate = 112},	-- Moonlight Coral
			
        },
    },

    -- BCNM Under Observation  -- Off
    [12] =
    {
        {
            {itemid = 0, droprate = 910},    -- Nothing
            {itemid = 13056, droprate = 90}, -- Peacock Charm
        },
        {
            {itemid = 0, droprate = 467},    -- Nothing
            {itemid = 18086, droprate = 48}, -- Behourd Lance
            {itemid = 18046, droprate = 61}, -- Mutilator
            {itemid = 18210, droprate = 46}, -- Raifu
            {itemid = 15286, droprate = 302}, -- Tilt Belt
            {itemid = 18350, droprate = 76}, -- Tourney Patas
        },
        {
            {itemid = 0, droprate = 413},    -- Nothing
            {itemid = 17696, droprate = 42}, -- Buzzard Tuck
            {itemid = 17936, droprate = 77}, -- De Saintres Axe
            {itemid = 17693, droprate = 73}, -- Grudge Sword
            {itemid = 15287, droprate = 258}, -- Mantra Belt
            {itemid = 4717, droprate = 68},  -- Scroll Of Refresh
            {itemid = 4947, droprate = 55},  -- Scroll Of Utsusemi Ni
            {itemid = 4858, droprate = 14},  -- Scroll Of Ice Spikes
        },
        {
            {itemid = 4858, droprate = 114}, -- Scroll Of Ice Spikes
            {itemid = 4717, droprate = 174}, -- Scroll Of Refresh
            {itemid = 4947, droprate = 138}, -- Scroll Of Utsusemi Ni
            {itemid = 769, droprate = 16},   -- Red Rock
            {itemid = 770, droprate = 17},   -- Blue Rock
            {itemid = 771, droprate = 17},   -- Yellow Rock
            {itemid = 772, droprate = 18},   -- Green Rock
            {itemid = 773, droprate = 17},   -- Translucent Rock
            {itemid = 774, droprate = 16},   -- Purple Rock
            {itemid = 775, droprate = 18},   -- Black Rock
            {itemid = 776, droprate = 16},   -- White Rock
            {itemid = 749, droprate = 102},  -- Mythril Beastcoin
            {itemid = 748, droprate = 120},  -- Gold Beastcoin
            {itemid = 699, droprate = 22},   -- Oak Log
            {itemid = 811, droprate = 18},   -- Ametrine
            {itemid = 793, droprate = 18},   -- Black Pearl
            {itemid = 790, droprate = 20},   -- Garnet
            {itemid = 808, droprate = 19},   -- Goshenite
            {itemid = 792, droprate = 21},   -- Pearl
            {itemid = 788, droprate = 35},   -- Peridot
            {itemid = 815, droprate = 17},   -- Sphene
            {itemid = 798, droprate = 23},   -- Turquoise
            {itemid = 4172, droprate = 21},  -- Reraiser
            {itemid = 4174, droprate = 16},  -- Vile Elixir
        },
        {
            {itemid = 4896, droprate = 116}, -- Fire Spirit Pact
            {itemid = 4874, droprate = 113}, -- Scroll Of Absorb-str
            {itemid = 4751, droprate = 137}, -- Scroll Of Erase
            {itemid = 4858, droprate = 67},  -- Scroll Of Ice Spikes
            {itemid = 4714, droprate = 99},  -- Scroll Of Phalanx
            {itemid = 811, droprate = 58},   -- Ametrine
            {itemid = 793, droprate = 52},   -- Black Pearl
            {itemid = 790, droprate = 51},   -- Garnet
            {itemid = 808, droprate = 65},   -- Goshenite
            {itemid = 792, droprate = 61},   -- Pearl
            {itemid = 788, droprate = 63},   -- Peridot
            {itemid = 815, droprate = 55},   -- Sphene
            {itemid = 798, droprate = 62},   -- Turquoise
        },
        {
            {itemid = 939, droprate = 1000}, -- Hecteyes Eye
        },
        {
            {itemid = 914, droprate = 1000}, -- Vial Of Mercury
        },
    },

    -- BCNM Eye of the Tiger
    [13] =
    {
	    -- {
            -- {itemid = 65535, droprate = 1000, amount = 1000000}, -- gil
        -- },
        {
            {itemid =  21688, droprate = 111}, -- Montante
            {itemid =  20527, droprate = 111}, -- Fists of Fury
            {itemid =  20804, droprate = 111}, -- Perun
            {itemid =  20613, droprate = 111}, -- Pukulatmuj
            {itemid =  20980, droprate = 111}, -- Raicho
            {itemid =  21162, droprate = 111}, -- Pouwhenua
            {itemid =  21416, droprate = 111}, -- Refined Grip
            {itemid =  21690, droprate = 111}, -- Ushenzi
			{itemid =  21164, droprate = 112}, -- Ababinili
        },
        {
            {itemid = 26942, droprate =  125}, -- Agony Jerkin
            {itemid = 25680, droprate =  125}, -- Cohort Cloak
            {itemid = 26870, droprate =  125}, -- Emet Harness
            {itemid = 26872, droprate =  125}, -- Hime Domaru
            {itemid = 26896, droprate =  125}, -- Lugra Cloak
            {itemid = 25709, droprate =  125}, -- Obviation Cuirass
            {itemid = 26868, droprate =  125}, -- Rosette Jaseran
            {itemid = 25732, droprate =  125}, -- Tatenashi Haramaki
        },
        {
            {itemid = 4073, droprate = 1000},  -- Rem Chapt 10
        },
        {
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 4073, droprate = 150},   -- Rem Chapt 10
        },
        {
            {itemid = 3972, droprate = 1000},  -- Kupon I S-2
        },
        {
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 3972, droprate = 150},   -- Kupon I S-2
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 2275, droprate = 150},   -- Scintillant Ingot
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 8751, droprate = 150},   -- Square of Ancestral Cloth
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 782, droprate = 150},   -- Selenite
        },
		{
			{itemid =  0,   droprate = 850},   -- Nothing
            {itemid = 8722, droprate = 150},   -- Hepatizon Ingot
        },		
		{
            {itemid = 8722, droprate = 1000},   -- Hepatizon Ingot
        },	
    },

    -- BCNM Shots in the Dark -- Off
    [14] =
    {
        {
            {itemid =   748, droprate =  500}, -- gold_beastcoin
            {itemid =   749, droprate =  500}, -- mythril_beastcoin
        },
        {
            {itemid =   652, droprate =  500}, -- steel_ingot
            {itemid =   791, droprate =  500}, -- aquamarine
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  4224, droprate =  500}, -- demon_quiver
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 14661, droprate =  200}, -- teleport_ring_holla
            {itemid = 14664, droprate =  200}, -- teleport_ring_vahzl
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 13687, droprate =  200}, -- sapient_cape
            {itemid = 14870, droprate =  200}, -- trainers_wristbands
        },
    },

    -- KSNM Double Dragonian
    [15] =
    {
	    -- {
            -- {itemid = 65535, droprate = 1000, amount = 500000}, -- gil
        -- },
		{
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  20545, droprate = 300}, -- Camaraderie Knuckles
			{itemid =  20823, droprate = 300}, -- Camaraderie Axe
			{itemid =  20869, droprate = 300}, -- Camaraderie Reaver
        },
        {
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  28524, droprate = 300}, -- Lifestorm Earring
			{itemid =  28525, droprate = 300}, -- Psystorm Earring
			{itemid =  28403, droprate = 300}, -- Inquisitor Bead Necklace
        },
        {
            {itemid =  0,     droprate = 100}, -- Nothing
			{itemid =  27778, droprate = 300}, -- Bokwus Circlet
			{itemid =  27776, droprate = 300}, -- Mikinaak Helm
			{itemid =  27777, droprate = 300}, -- Manibozho Beret
        },
        {
            {itemid = 0,      droprate = 900}, -- Nothing
            {itemid = 1178, droprate = 100},   -- Lachesis Orb
        },
        {
            {itemid = 8734, droprate = 1000},  -- Kupon I S-1
        },
        {
			{itemid = 0,    droprate = 850},   -- Nothing
            {itemid = 8734, droprate = 150},   -- Kupon I S-1
        },
        {
            {itemid = 4067, droprate = 1000},  -- Rems Chapt 4
        },
		{
			{itemid = 0,    droprate = 850},   -- Nothing
            {itemid = 4067, droprate = 150},   -- Rems Chapt 4
        },
		{
			{itemid = 0,    droprate = 800},   -- Nothing
            {itemid = 836,  droprate = 200},   -- Damascene Cloth
        },
    },
    -- BCNM Today's Horoscope  -- Off
    [16] =
    {
        {
            {itemid =  21688, droprate = 125}, -- Montante
            {itemid =  20527, droprate = 125}, -- Fists of Fury
            {itemid =  20804, droprate = 125}, -- Perun
            {itemid =  20613, droprate = 125}, -- Pukulatmuj
            {itemid =  20980, droprate = 125}, -- Raicho
            {itemid =  21162, droprate = 125}, -- Pouwhenua
            {itemid =  21416, droprate = 125}, -- Refined Grip
            {itemid =  21690, droprate = 125}, -- Ushenzi
        },
        {
            {itemid = 26941, droprate =  110}, -- Agony Jerkin
            {itemid = 25680, droprate =  110}, -- Cohort Cloak
            {itemid = 26870, droprate =  110}, -- Emet Harness
            {itemid = 26872, droprate =  110}, -- Hime Domaru
            {itemid = 26896, droprate =  110}, -- Lugra Cloak
            {itemid = 25709, droprate =  110}, -- Obviation Cuirass
            {itemid = 26868, droprate =  110}, -- Rosette Jaseran
            {itemid = 26887, droprate =  110}, -- Shimonjijoe
            {itemid = 27534, droprate =  120}, -- Tatenashi Haramaki

        },
        {
            {itemid =     0, droprate =  1000}, -- nothing

        },
        {
            {itemid =     0, droprate =  1000}, -- nothing

        },
        {
            {itemid =     0, droprate =  1000}, -- nothing

        },
        {
            {itemid =     0, droprate =  1000}, -- nothing
        },
    },
    -- KSNM Contaminated Colosseum 
    [17] =
    {
        { -- Accessories, 1 is guaranteed.
            {itemid = 27555, droprate =  40}, -- Warden's Ring
            {itemid = 26215, droprate =  60}, -- Menelaus's Ring
            {itemid = 28530, droprate = 100}, -- Dumakulem's Ring
            {itemid = 26221, droprate = 125}, -- Sroda Ring
            {itemid = 28456, droprate = 175}, -- Kasiri Belt
            {itemid = 10945, droprate = 200}, -- Waylayer's Scarf
            {itemid = 26217, droprate = 300}, -- Ligeia Ring
        },
        
        { -- Tier 1-3 mats, 1 guaranteed
            {itemid =  9062, droprate =  25}, -- Dark Matter
            {itemid =  9064, droprate =  60}, -- Tartarian Chain
            {itemid =  9061, droprate =  60}, -- Hades' Claw
            {itemid =  9258, droprate =  90}, -- Azure Cermet
            {itemid =  9252, droprate = 105}, -- Khoma Cloth
            {itemid =  9248, droprate = 105}, -- Niobium Ingot
            {itemid =  9256, droprate = 105}, -- Cyan Orb
            {itemid =  9251, droprate = 150}, -- Khoma Thread
            {itemid =  9247, droprate = 150}, -- Niobium Ore
            {itemid =  9255, droprate = 150}, -- Cyan Coral
        },
        
        { -- Tier 1-3 mats, 50/50 to get something
            {itemid =     0, droprate = 500}, -- Nothing
            {itemid =  9062, droprate =  12}, -- Dark Matter
            {itemid =  9064, droprate =  30}, -- Tartarian Chain
            {itemid =  9061, droprate =  30}, -- Hades' Claw
            {itemid =  9258, droprate =  45}, -- Azure Cermet
            {itemid =  9252, droprate =  52}, -- Khoma Cloth
            {itemid =  9248, droprate =  53}, -- Niobium Ingot
            {itemid =  9256, droprate =  53}, -- Cyan Orb
            {itemid =  9251, droprate =  75}, -- Khoma Thread
            {itemid =  9247, droprate =  75}, -- Niobium Ore
            {itemid =  9255, droprate =  75}, -- Cyan Coral
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
            {itemid =  3980, droprate = 100}, -- Bztavian Stinger
            {itemid =  3981, droprate = 100}, -- Bztavian Wing
            {itemid =  4014, droprate = 100}, -- Yggdreant Bole
            {itemid =  4015, droprate = 100}, -- Yggdreant Root
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
