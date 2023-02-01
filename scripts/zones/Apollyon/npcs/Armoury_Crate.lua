-----------------------------------
-- Area: Apollyon
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/limbus")
require("scripts/globals/zone")
local ID = require("scripts/zones/Apollyon/IDs")

local loot =
{
    [1293] =
    {
        --  SE_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 9285, droprate =  350}, -- RDM
                {itemid = 9286, droprate =  278}, -- THF
                {itemid = 9295, droprate =  174}, -- SMN
                {itemid = 9290, droprate =  200}, -- BRD
                {itemid = 9288, droprate =   47}, -- DRK
                {itemid = 9291, droprate =   49}, -- RNG
                {itemid = 9293, droprate =  200}, -- NIN
                {itemid = 9297, droprate =   62}, -- COR
                {itemid = 9299, droprate =  407}, -- DNC
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 9285, droprate =  350}, -- RDM
                {itemid = 9286, droprate =  278}, -- THF
                {itemid = 9295, droprate =  174}, -- SMN
                {itemid = 9290, droprate =  200}, -- BRD
                {itemid = 9288, droprate =   47}, -- DRK
                {itemid = 9291, droprate =   49}, -- RNG
                {itemid = 9293, droprate =  200}, -- NIN
                {itemid = 9297, droprate =   62}, -- COR
                {itemid = 9299, droprate =  407}, -- DNC
            },
        },
        -- SE_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9295, droprate =  47}, -- SMN
                {itemid = 9290, droprate =  30}, -- BRD
                {itemid = 9287, droprate = 200}, -- PLD
                {itemid = 9289, droprate = 460}, -- BST
                {itemid = 9298, droprate = 400}, -- PUP
                {itemid = 9291, droprate =  20}, -- RNG
                {itemid = 9293, droprate =  80}, -- NIN
                {itemid = 9288, droprate =  90}, -- DRK
                {itemid = 9297, droprate = 100}, -- COR
                {itemid = 9299, droprate = 120}, -- DNC
            },
            {
                {itemid = 9302, droprate = 999}, -- Nothing
                {itemid = 9295, droprate =  47}, -- SMN
                {itemid = 9290, droprate =  30}, -- BRD
                {itemid = 9287, droprate = 200}, -- PLD
                {itemid = 9289, droprate = 460}, -- BST
                {itemid = 9298, droprate = 400}, -- PUP
                {itemid = 9291, droprate =  20}, -- RNG
                {itemid = 9293, droprate =  80}, -- NIN
                {itemid = 9288, droprate =  90}, -- DRK
                {itemid = 9297, droprate = 100}, -- COR
                {itemid = 9299, droprate = 120}, -- DNC
            },
        },
        -- SE_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 999}, -- Nothing
                {itemid = 9293, droprate =  59}, -- NIN
                {itemid = 9295, droprate = 139}, -- SMN
                {itemid = 9290, droprate =  39}, -- BRD
                {itemid = 1681, droprate =  39}, -- Light Steel
                {itemid =  645, droprate =  39}, -- Darksteel Ore
                {itemid = 9282, droprate = 627}, -- MNK
            },
            {
                {itemid = 9302, droprate = 500}, -- Nothing
                {itemid = 9288, droprate = 159}, -- DRK
                {itemid = 9291, droprate = 139}, -- RNG
                {itemid = 9297, droprate =  39}, -- COR
                {itemid =  664, droprate =  20}, -- Darksteel Sheet
                {itemid =  646, droprate =  20}, -- Adaman Ore
                {itemid = 9281, droprate = 200}, -- WAR 
            },
        },
        -- SE_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9283, droprate = 220}, -- WHM
                {itemid = 9284, droprate = 300}, -- BLM
                {itemid = 9294, droprate = 260}, -- DRG
                {itemid = 9292, droprate = 340}, -- SAM
                {itemid = 9296, droprate = 220}, -- BLU
                {itemid = 9300, droprate = 180}, -- SCH
                {itemid = 9281, droprate = 300}, -- WAR
            },
            {
                {itemid = 9283, droprate = 220}, -- WHM
                {itemid = 9284, droprate = 300}, -- BLM
                {itemid = 9294, droprate = 260}, -- DRG
                {itemid = 9292, droprate = 340}, -- SAM
                {itemid = 9296, droprate = 220}, -- BLU
                {itemid = 9300, droprate = 180}, -- SCH
                {itemid = 9281, droprate = 300}, -- WAR
            },
            {
                {itemid = 1909, droprate = 1000}, -- Smalt Chip
            },
            {
                {itemid = 2127, droprate =  59}, -- Metal Chip
                {itemid = 9301, droprate = 100}, -- Nothing
            },
        },
    },
    [1292] =
    {
        -- NE_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9292, droprate = 304}, -- SAM
                {itemid = 9287, droprate =  18}, -- PLD
                {itemid = 9286, droprate = 200}, -- THF
                {itemid = 9299, droprate = 200}, -- DNC
                {itemid = 9298, droprate =  36}, -- PUP
                {itemid = 9282, droprate =  18}, -- MNK
                {itemid = 9285, droprate =  36}, -- RDM
                {itemid = 9283, droprate = 411}, -- WHM
                {itemid = 9300, droprate = 482}, -- SCH
                {itemid = 9289, droprate =  18}, -- BST
            },
            {
                {itemid = 9301, droprate = 1000}, -- SAM
                {itemid = 9292, droprate =  304}, -- SAM
                {itemid = 9287, droprate =   18}, -- PLD
                {itemid = 9286, droprate =  200}, -- THF
                {itemid = 9299, droprate =  200}, -- DNC
                {itemid = 9298, droprate =   36}, -- PUP
                {itemid = 9282, droprate =   18}, -- MNK
                {itemid = 9285, droprate =   36}, -- RDM
                {itemid = 9283, droprate =  411}, -- WHM
                {itemid = 9300, droprate =  482}, -- SCH
                {itemid = 9289, droprate =   18}, -- BST
            },
        },
        -- NE_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9289, droprate =  26}, -- BST
                {itemid = 9282, droprate =  53}, -- MNK
                {itemid = 9287, droprate =  26}, -- PLD
                {itemid = 9298, droprate =  26}, -- PUP
                {itemid = 9284, droprate = 395}, -- BLM
                {itemid = 9294, droprate = 289}, -- DRG
                {itemid = 9286, droprate =  53}, -- THF
                {itemid = 9285, droprate = 112}, -- RDM
                {itemid = 9296, droprate = 477}, -- BLU
            },
            {
                {itemid = 9302, droprate =  1000}, -- Nothing
                {itemid = 9289, droprate =    26}, -- BST
                {itemid = 9282, droprate =    53}, -- MNK
                {itemid = 9287, droprate =    26}, -- PLD
                {itemid = 9298, droprate =    26}, -- PUP
                {itemid = 9284, droprate =   395}, -- BLM
                {itemid = 9294, droprate =   289}, -- DRG
                {itemid = 9286, droprate =    53}, -- THF
                {itemid = 9285, droprate =   112}, -- RDM
                {itemid = 9296, droprate =   477}, -- BLU
            },
        },
        -- NE_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 9281, droprate =  788}, -- WAR
                {itemid = 9285, droprate =   30}, -- RDM
                {itemid = 9292, droprate =  130}, -- SAM
                {itemid = 9294, droprate =  100}, -- DRG
                {itemid = 9289, droprate =   90}, -- BST
                {itemid = 9282, droprate =   30}, -- MNK
                {itemid = 9286, droprate =   99}, -- THF
                {itemid = 9298, droprate =   61}, -- PUP
                {itemid = 9299, droprate =   30}, -- DNC
                {itemid = 9287, droprate =  160}, -- PLD
            },
            {
                {itemid = 9302, droprate = 1000}, -- Nothing
                {itemid = 9281, droprate =  788}, -- WAR
                {itemid = 9285, droprate =   30}, -- RDM
                {itemid = 9292, droprate =  130}, -- SAM
                {itemid = 9294, droprate =  100}, -- DRG
                {itemid = 9289, droprate =   90}, -- BST
                {itemid = 9282, droprate =   30}, -- MNK
                {itemid = 9286, droprate =   99}, -- THF
                {itemid = 9298, droprate =   61}, -- PUP
                {itemid = 9299, droprate =   30}, -- DNC
                {itemid = 9287, droprate =  160}, -- PLD
            },
            {
                {itemid = 9301, droprate = 180}, -- RUN
                {itemid = 1633, droprate =  30}, -- Clot Plasma
                {itemid =  821, droprate =  40}, -- Rainbow Thread
                {itemid = 1311, droprate =  50}, -- Oxblood
                {itemid = 1883, droprate =  40}, -- Shell Powder
                {itemid = 2004, droprate =  20}, -- Carapace Powder
            },
            {
                {itemid = 9302, droprate = 180}, -- GEO
                {itemid = 1633, droprate =  30}, -- Clot Plasma
                {itemid =  821, droprate =  40}, -- Rainbow Thread
                {itemid = 1311, droprate =  50}, -- Oxblood
                {itemid = 1883, droprate =  40}, -- Shell Powder
                {itemid = 2004, droprate =  20}, -- Carapace Powder
            },
        },
        -- NE_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9290, droprate = 326}, -- BRD
                {itemid = 9288, droprate = 256}, -- DRK
                {itemid = 9291, droprate = 395}, -- RNG
                {itemid = 9295, droprate = 279}, -- SMN
                {itemid = 9293, droprate = 256}, -- NIN
                {itemid = 9297, droprate = 326}, -- COR
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 9290, droprate =  326}, -- BRD
                {itemid = 9288, droprate =  256}, -- DRK
                {itemid = 9291, droprate =  395}, -- RNG
                {itemid = 9295, droprate =  279}, -- SMN
                {itemid = 9293, droprate =  256}, -- NIN
                {itemid = 9297, droprate =  326}, -- COR
            },
        },
        -- NE_Apollyon floor 5
        [5] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1910, droprate = 1000}, -- Smoky Chip
            },
            {
                {itemid = 9301, droprate = 100}, -- Nothing
                {itemid = 2127, droprate =  59}, -- Metal Chip
            },
        },
    },

    -- Apollyon: SW
    [1291] =
    {
        -- SW_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9290, droprate = 464}, -- BRD
                {itemid = 9288, droprate = 250}, -- DRK
                {itemid = 9292, droprate = 110}, -- SAM
                {itemid = 9284, droprate =  71}, -- BLM
                {itemid = 9281, droprate = 180}, -- WAR
                {itemid = 9296, droprate = 210}, -- BLU
                {itemid = 9300, droprate = 111}, -- SCH
                {itemid = 9283, droprate = 107}, -- WHM
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 9290, droprate =  464}, -- BRD
                {itemid = 9288, droprate =  250}, -- DRK
                {itemid = 9292, droprate =  110}, -- SAM
                {itemid = 9284, droprate =   71}, -- BLM
                {itemid = 9281, droprate =  180}, -- WAR
                {itemid = 9296, droprate =  210}, -- BLU
                {itemid = 9300, droprate =  111}, -- SCH
                {itemid = 9283, droprate =  107}, -- WHM
            },
        },
        -- SW_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9291, droprate = 154}, -- RNG
                {itemid = 9283, droprate =  95}, -- WHM
                {itemid = 9295, droprate = 269}, -- SMN
                {itemid = 9284, droprate = 106}, -- BLM
                {itemid = 9281, droprate =  77}, -- WAR
                {itemid = 9297, droprate = 423}, -- COR
                {itemid = 9294, droprate = 110}, -- DRG
            },
            {
                {itemid = 9301, droprate = 999}, -- Nothing
                {itemid = 9291, droprate = 154}, -- RNG
                {itemid = 9283, droprate =  95}, -- WHM
                {itemid = 9295, droprate = 269}, -- SMN
                {itemid = 9284, droprate = 106}, -- BLM
                {itemid = 9281, droprate =  77}, -- WAR
                {itemid = 9297, droprate = 423}, -- COR
                {itemid = 9294, droprate = 110}, -- DRG
            },
        },
        -- SW_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 120}, -- Nothing
                {itemid = 9281, droprate = 120}, -- WAR
                {itemid = 9293, droprate = 595}, -- NIN
                {itemid = 9294, droprate = 100}, -- DRG
                {itemid = 9284, droprate =  24}, -- BLM
                {itemid = 9292, droprate =  48}, -- SAM
                {itemid = 9283, droprate =  24}, -- WHM
                {itemid = 9296, droprate =  24}, -- BLU
                {itemid = 9300, droprate =  71}, -- SCH
            },
            {
                {itemid = 9301, droprate = 120}, -- Nothing
                {itemid = 9281, droprate = 120}, -- WAR
                {itemid = 9293, droprate = 595}, -- NIN
                {itemid = 9294, droprate = 100}, -- DRG
                {itemid = 9284, droprate =  24}, -- BLM
                {itemid = 9292, droprate =  48}, -- SAM
                {itemid = 9283, droprate =  24}, -- WHM
                {itemid = 9296, droprate =  24}, -- BLU
                {itemid = 9300, droprate =  71}, -- SCH
            },
            {
                {itemid = 9301, droprate = 638}, -- Nothing
                {itemid = 1311, droprate =  32}, -- Oxblood
                {itemid = 1883, droprate =  40}, -- Shell Powder
                {itemid = 1681, droprate =  31}, -- Light Steel
                {itemid = 1633, droprate =  71}, -- Clot Plasma
                {itemid =  645, droprate =  31}, -- Darksteel Ore
                {itemid =  664, droprate =  63}, -- Darksteel Sheet
                {itemid =  646, droprate =  31}, -- Adaman Ore
                {itemid =  821, droprate =  63}, -- Rainbow Thread
            },
        },
        -- SW_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9286, droprate = 468}, -- THF
                {itemid = 9289, droprate = 340}, -- BST
                {itemid = 9282, droprate = 255}, -- MNK
                {itemid = 9285, droprate = 191}, -- RDM
                {itemid = 9287, droprate = 170}, -- PLD
                {itemid = 9298, droprate = 340}, -- PUP
                {itemid = 9299, droprate = 170}, -- DNC
            },
            {
                {itemid = 9301, droprate = 400}, -- Nothing
                {itemid = 9286, droprate = 468}, -- THF
                {itemid = 9289, droprate = 340}, -- BST
                {itemid = 9282, droprate = 255}, -- MNK
                {itemid = 9285, droprate = 191}, -- RDM
                {itemid = 9287, droprate = 170}, -- PLD
                {itemid = 9298, droprate = 340}, -- PUP
                {itemid = 9299, droprate = 170}, -- DNC
            },
            {
                {itemid = 1987, droprate = 1000}, -- Charcoal Chip
            },
            {
                {itemid = 2127, droprate =  59}, -- Metal Chip
                {itemid = 9301, droprate = 100}, -- Nothing
            },
        },
    },

    -- Apollyon: NW
    [1290] =
    {
        -- NW_Apollyon floor 1
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 100}, -- Nothing
                {itemid = 9284, droprate =  25}, -- BLM
                {itemid = 9296, droprate = 175}, -- BLU
                {itemid = 9294, droprate = 100}, -- DRG
                {itemid = 9287, droprate =  25}, -- PLD
                {itemid = 9292, droprate = 250}, -- SAM
                {itemid = 9300, droprate =  75}, -- SCH
                {itemid = 9281, droprate = 225}, -- WAR
                {itemid = 9283, droprate =  50}, -- WHM
            },
        },
        -- NW_Apollyon floor 2
        [2] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9301, droprate = 100}, -- Nothing
                {itemid = 9287, droprate = 235}, -- PLD
                {itemid = 9297, droprate =  59}, -- COR
                {itemid = 9288, droprate = 235}, -- DRK
                {itemid = 9293, droprate = 147}, -- NIN
                {itemid = 9291, droprate = 118}, -- RNG
                {itemid = 9295, droprate = 176}, -- SMN
                {itemid = 9283, droprate = 110}, -- WHM
            },
        },
        -- NW_Apollyon floor 3
        [3] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 9289, droprate = 133}, -- BST
                {itemid = 9282, droprate = 133}, -- MNK
                {itemid = 9287, droprate = 133}, -- PLD
                {itemid = 9298, droprate = 133}, -- PUP
                {itemid = 9285, droprate = 110}, -- RDM
                {itemid = 9286, droprate = 400}, -- THF
            },
            {
                {itemid = 9301, droprate = 400}, -- Nothing
                {itemid =  646, droprate =  50}, -- Adaman Ore
                {itemid = 1633, droprate =  50}, -- Clot Plasma
                {itemid =  664, droprate =  50}, -- Darksteel Sheet
                {itemid =  645, droprate =  50}, -- Darksteel Ore
                {itemid = 1311, droprate =  50}, -- Oxblood
                {itemid = 1681, droprate =  50}, -- Light Steel
                {itemid =  821, droprate =  50}, -- Rainbow Thread
                {itemid = 1883, droprate =  50}, -- Shell Powder
            },
            {
                {itemid = 9301, droprate = 400}, -- Nothing
                {itemid =  646, droprate =  50}, -- Adaman Ore
                {itemid = 1633, droprate =  50}, -- Clot Plasma
                {itemid =  664, droprate =  50}, -- Darksteel Sheet
                {itemid =  645, droprate =  50}, -- Darksteel Ore
                {itemid = 1311, droprate =  50}, -- Oxblood
                {itemid = 1681, droprate =  50}, -- Light Steel
                {itemid =  821, droprate =  50}, -- Rainbow Thread
                {itemid = 1883, droprate =  50}, -- Shell Powder
            },
        },
        -- NW_Apollyon floor 4
        [4] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
                {itemid = 9301, droprate = 1000}, -- Nothing
            },
            {
                {itemid = 9301, droprate = 100}, -- Nothing
                {itemid = 9284, droprate =  80}, -- BLM
                {itemid = 9296, droprate =  70}, -- BLU
                {itemid = 9290, droprate =  48}, -- BRD
                {itemid = 9289, droprate =  30}, -- BST
                {itemid = 9297, droprate =  25}, -- COR
                {itemid = 9294, droprate =  19}, -- DRG
                {itemid = 9288, droprate =  48}, -- DRK
                {itemid = 9282, droprate =  90}, -- MNK
                {itemid = 9293, droprate = 100}, -- NIN
                {itemid = 9298, droprate =  48}, -- PUP
                {itemid = 9285, droprate = 136}, -- RDM
                {itemid = 9291, droprate =  80}, -- RNG
                {itemid = 9292, droprate = 110}, -- SAM
                {itemid = 9295, droprate =  95}, -- SMN
                {itemid = 9299, droprate = 123}, -- DNC
                {itemid = 9283, droprate =  48}, -- WHM
            },
        },
        -- NW_Apollyon floor 5
        [5] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 9284, droprate = 109}, -- BLM
                {itemid = 9296, droprate = 152}, -- BLU
                {itemid = 9290, droprate = 283}, -- BRD
                {itemid = 9289, droprate = 109}, -- BST
                {itemid = 9297, droprate =  65}, -- COR
                {itemid = 9299, droprate = 130}, -- DNC
                {itemid = 9294, droprate =  65}, -- DRG
                {itemid = 9288, droprate = 174}, -- DRK
                {itemid = 9282, droprate = 130}, -- MNK
                {itemid = 9293, droprate = 196}, -- NIN
                {itemid = 9287, droprate = 174}, -- PLD
                {itemid = 9298, droprate = 174}, -- PUP
                {itemid = 9285, droprate = 109}, -- RDM
                {itemid = 9291, droprate = 130}, -- RNG
                {itemid = 9292, droprate = 304}, -- SAM
                {itemid = 9300, droprate =  87}, -- SCH
                {itemid = 9295, droprate = 217}, -- SMN
                {itemid = 9286, droprate = 174}, -- THF
                {itemid = 9281, droprate = 130}, -- WAR
                {itemid = 9283, droprate = 109}, -- WHM
            },
            {
                {itemid = 9284, droprate = 109}, -- BLM
                {itemid = 9296, droprate = 152}, -- BLU
                {itemid = 9290, droprate = 283}, -- BRD
                {itemid = 9289, droprate = 109}, -- BST
                {itemid = 9297, droprate =  65}, -- COR
                {itemid = 9299, droprate = 130}, -- DNC
                {itemid = 9294, droprate =  65}, -- DRG
                {itemid = 9288, droprate = 174}, -- DRK
                {itemid = 9282, droprate = 130}, -- MNK
                {itemid = 9293, droprate = 196}, -- NIN
                {itemid = 9287, droprate = 174}, -- PLD
                {itemid = 9298, droprate = 174}, -- PUP
                {itemid = 9285, droprate = 109}, -- RDM
                {itemid = 9291, droprate = 130}, -- RNG
                {itemid = 9292, droprate = 304}, -- SAM
                {itemid = 9300, droprate =  87}, -- SCH
                {itemid = 9295, droprate = 217}, -- SMN
                {itemid = 9286, droprate = 174}, -- THF
                {itemid = 9281, droprate = 130}, -- WAR
                {itemid = 9283, droprate = 109}, -- WHM
            },
            {
                {itemid = 9301, droprate = 300}, -- Nothing
                {itemid = 9284, droprate = 109}, -- BLM
                {itemid = 9296, droprate = 152}, -- BLU
                {itemid = 9290, droprate = 283}, -- BRD
                {itemid = 9289, droprate = 109}, -- BST
                {itemid = 9297, droprate =  65}, -- COR
                {itemid = 9299, droprate = 130}, -- DNC
                {itemid = 9294, droprate =  65}, -- DRG
                {itemid = 9288, droprate = 174}, -- DRK
                {itemid = 9282, droprate = 130}, -- MNK
                {itemid = 9293, droprate = 196}, -- NIN
                {itemid = 9287, droprate = 174}, -- PLD
                {itemid = 9298, droprate = 174}, -- PUP
                {itemid = 9285, droprate = 109}, -- RDM
                {itemid = 9291, droprate = 130}, -- RNG
                {itemid = 9292, droprate = 304}, -- SAM
                {itemid = 9300, droprate =  87}, -- SCH
                {itemid = 9295, droprate = 217}, -- SMN
                {itemid = 9286, droprate = 174}, -- THF
                {itemid = 9281, droprate = 130}, -- WAR
                {itemid = 9283, droprate = 109}, -- WHM
            },
            {
                {itemid = 1988, droprate = 1000}, -- Magenta Chip
            },
            {
                {itemid = 2127, droprate =  59}, -- Metal Chip
                {itemid = 9301, droprate = 100}, -- Nothing
            },
        },
    },
    [1294] =
    {
        -- CS_Apollyon
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =    0, droprate = 1000}, -- Nothing
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 2127, droprate =  59}, -- Metal Chip
                {itemid =    0, droprate = 100}, -- Nothing
            },
        },
    },
    [1296] =
    {
        -- Proto-Omega
        [1] =
        {
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid = 1875, droprate = 1000}, -- Ancient Beastcoin
            },
            {
                {itemid =  25659, droprate = 357}, -- Sulevia's Mask
                {itemid =  25800, droprate = 214}, -- Sulevia's Gauntlets
                {itemid =  25858, droprate = 210}, -- Sulevia's Cuisses
                {itemid =  25925, droprate = 219}, -- Sulevia's Leggings
            },
            {
                {itemid =     0, droprate = 735}, -- Nothing
                {itemid =  25745, droprate = 265}, -- Sulevia's Plate
            },
        },
    },
}

function onTrade(player,npc,trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if not battlefield then
        return
    end
    local crateID = npc:getID()
    local model = npc:getModelId()
    local X = npc:getXPos()
    local Y = npc:getYPos()
    local Z = npc:getZPos()
    local bfid = battlefield:getID()
    local hold = false
    if npc:getLocalVar("open") == 0 then
        switch (bfid): caseof 
        {
            [1290] = function() -- NW Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_NW_CRATE[5] then
                    for i = 1, 4 do
                        for j = 1, 5 do
                            if crateID == ID.npc.APOLLYON_NW_CRATE[i][j] then
                                if model == 960 then
                                    tpz.battlefield.HealPlayers(battlefield)
                                elseif model == 961 then
                                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                elseif model == 962 then
									player:PrintToPlayer(string.format("Time extensions have been disabled."),tpz.msg.channel.SYSTEM_3)
                                    -- tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                                end
                            end
                        end
                    end
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][5], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1291] = function() -- SW Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_SW_CRATE[4] then
                    for i = 1, 3 do
                        if i == 3 then
                            local mimicSpawned = battlefield:getLocalVar("mimicSpawned")
                            if mimicSpawned ~= 7 then
                                local timePH = battlefield:getLocalVar("timePH")
                                local restorePH = battlefield:getLocalVar("restorePH")
                                local itemPH = battlefield:getLocalVar("itemPH")
                                for j = 0, 9 do
                                    if crateID == ID.npc.APOLLYON_SW_CRATE[i]+j then
                                        if crateID == restorePH then
                                            tpz.battlefield.HealPlayers(battlefield)
                                        elseif crateID == itemPH then
                                            tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                        elseif crateID == timePH then
											player:PrintToPlayer(string.format("Time extensions have been disabled."),tpz.msg.channel.SYSTEM_3)
                                            -- tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                                        else
                                            if mimicSpawned == 0 or mimicSpawned == 2 or mimicSpawned == 4 or mimicSpawned == 6 then
                                                npc:setStatus(tpz.status.DISAPPEAR)
                                                battlefield:setLocalVar("mimicSpawned", mimicSpawned+1)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]):setSpawn(X, Y, Z)
                                                SpawnMob(ID.mob.APOLLYON_SW_MOB[3]):setPos(X, Y, Z)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]):updateClaim(player)
                                            elseif mimicSpawned == 1 or mimicSpawned == 5 then
                                                npc:setStatus(tpz.status.DISAPPEAR)
                                                battlefield:setLocalVar("mimicSpawned", mimicSpawned+2)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+1):setSpawn(X, Y, Z)
                                                SpawnMob(ID.mob.APOLLYON_SW_MOB[3]+1):setPos(X, Y, Z)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+1):updateClaim(player)
                                            elseif mimicSpawned == 3 then
                                                npc:setStatus(tpz.status.DISAPPEAR)
                                                battlefield:setLocalVar("mimicSpawned", mimicSpawned+4)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+2):setSpawn(X, Y, Z)
                                                SpawnMob(ID.mob.APOLLYON_SW_MOB[3]+2):setPos(X, Y, Z)
                                                GetMobByID(ID.mob.APOLLYON_SW_MOB[3]+2):updateClaim(player)
                                            end
                                        end
                                    end
                                end
                            else
                                hold = true
                            end
                        else
                            for j = 0, 2 do
                                if crateID == ID.npc.APOLLYON_SW_CRATE[i]+j then
                                    if j ~= 0 then GetNPCByID(ID.npc.APOLLYON_SW_CRATE[i]):setStatus(tpz.status.DISAPPEAR) end
                                    if j ~= 1 then GetNPCByID(ID.npc.APOLLYON_SW_CRATE[i]+1):setStatus(tpz.status.DISAPPEAR) end
                                    if j ~= 2 then GetNPCByID(ID.npc.APOLLYON_SW_CRATE[i]+2):setStatus(tpz.status.DISAPPEAR) end
                                    if model == 960 then
                                        tpz.battlefield.HealPlayers(battlefield)
                                    elseif model == 961 then
                                        tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                    elseif model == 962 then
										player:PrintToPlayer(string.format("Time extensions have been disabled."),tpz.msg.channel.SYSTEM_3)
                                        -- tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                                    end
                                end
                            end
                        end
                    end
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][4], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1292] = function() -- NE Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_NE_CRATE[5] then
                    for i = 1, 4 do
                        for j = 1, 5 do
                            if crateID == ID.npc.APOLLYON_NE_CRATE[i][j] then
                                if model == 960 then
                                    tpz.battlefield.HealPlayers(battlefield)
                                elseif model == 961 then
                                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                elseif model == 962 then
									player:PrintToPlayer(string.format("Time extensions have been disabled."),tpz.msg.channel.SYSTEM_3)
                                    -- tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                                end
                            end
                        end
                    end
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][5], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1293] = function() -- SE Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_SE_CRATE[4] then
                    for i = 1, 3 do
                        for j = 0, 2 do
                            if crateID == ID.npc.APOLLYON_SE_CRATE[i]+j then
                                if model == 960 then
                                    tpz.battlefield.HealPlayers(battlefield)
                                elseif model == 961 then
                                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][i], nil, npc)
                                elseif model == 962 then
									player:PrintToPlayer(string.format("Time extensions have been disabled."),tpz.msg.channel.SYSTEM_3)
                                    -- tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                                end
                            end
                        end
                    end
                else
                    for i = 1, 8 do
                        GetMobByID(ID.mob.APOLLYON_SE_MOB[4]+i):setStatus(tpz.status.DISAPPEAR)
                    end
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][4], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1294] = function() -- CS Apollyon Crate Handling
                if crateID ~= ID.npc.APOLLYON_CS_CRATE then
					player:PrintToPlayer(string.format("Time extensions have been disabled."),tpz.msg.channel.SYSTEM_3)
                    -- tpz.limbus.extendTimeLimit(battlefield, 15, tpz.zone.APOLLYON)
                else
                    tpz.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                    battlefield:setLocalVar("cutsceneTimer", 10)
                    battlefield:setLocalVar("lootSeen", 1)
                end
            end,
            [1296] = function() -- Central Apollyon Crate Handling
                tpz.limbus.handleLootRolls(battlefield, loot[bfid][1], nil, npc)
                battlefield:setLocalVar("cutsceneTimer", 10)
                battlefield:setLocalVar("lootSeen", 1)
            end,
        }
        if not hold then
            npc:entityAnimationPacket("open")
            npc:setLocalVar("open", 1)
            npc:timer(15000, function(npc)
                npc:entityAnimationPacket("kesu")
            end)
            npc:timer(16000, function(npc)
                npc:setStatus(tpz.status.DISAPPEAR)
                npc:timer(500, function(mob)
                    npc:setLocalVar("open", 0)
                end)
            end)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
