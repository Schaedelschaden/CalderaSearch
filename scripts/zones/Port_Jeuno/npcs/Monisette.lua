-----------------------------------
-- Area: Port Jeuno
--  NPC: Monisette
-- !pos -6 0 -11 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

-----------------------------------
-- Reforged Artifact Materials
-----------------------------------

-- HQ+1 AF  - Fighter's Mask +1, Fighter's Lorica +1, Fighter's Mufflers +1, Fighter's Cuisses +1, Fighter's Calligae +1,
-- NQ RAF   - Pummeler's Mask, Pummeler's Lorica, Pummeler's Mufflers, Pummeler's Cuisses, Pummeler's Calligae
-- HQ+1 RAF - Pummeler's Mask +1, Pummeler's Lorica +1, Pummeler's Mufflers +1, Pummeler's Cuisses +1, Pummeler's Calligae +1
-- HQ+2 RAF - Pummeler's Mask +2, Pummeler's Lorica +2, Pummeler's Mufflers +2, Pummeler's Cuisses +2, Pummeler's Calligae +2 (FUTURE)
local tradePiece =
{
    15225, 14473, 14890, 15561, 15352,
    27663, 27807, 27943, 28090, 28223,
    27684, 27828, 27964, 28111, 28244,
    23040, 23107, 23174, 23241, 23308,
}

-- Reforged NQ and +1 Materials
-- Rem's Tale Ch.01 x5, Rem's Tale Ch.02 x5, Rem's Tale Ch.03 x5, Rem's Tale Ch.04 x5, Rem's Tale Ch.05 x5,
-- Rem's Tale Ch.06 x5, Rem's Tale Ch.07 x5, Rem's Tale Ch.08 x5, Rem's Tale Ch.09 x5, Rem's Tale Ch.10 x5
local remTales =
{
    {4064, 2}, {4065, 2}, {4066, 2}, {4067, 2}, {4068, 2},
    {4069, 2}, {4070, 2}, {4071, 2}, {4072, 2}, {4073, 2},
}

local tradeMaterial =
{
    { 855,  1}, -- Tiger Leather
    { 823,  1}, -- Gold Thread
    {2340,  1}, -- Imperial Silk Cloth
    {2288,  1}, -- Karakul Cloth
    {1699,  1}, -- Scarlet Linen
    { 752,  1}, -- Gold Sheet
    { 664,  1}, -- Darksteel Sheet
    { 657,  1}, -- Tama-Hagane
    {6152, 36}, -- Death for Dimwits       (Great Axe Skill)    - WAR
    {6147, 36}, -- Mikhe's Memo            (Hand-to-Hand Skill) - MNK
    {6167, 36}, -- Coveffe Barrows Musings (Healing Skill)      - WHM
    {6170, 36}, -- Bounty List             (Elemental Skill)    - BLM
    {6169, 36}, -- Investigative Report    (Enfeebling Skill)   - RDM
    {6148, 36}, -- Dagger Enchiridion      (Dagger Skill)       - THF
    {6164, 36}, -- The Successor           (Shield Skill)       - PLD
    {6153, 36}, -- Ludwig's Report         (Scythe Skill)       - DRK
    {6151, 36}, -- Striking Bull's Diary   (Axe Skill)          - BST
    {6172, 36}, -- Breezy Libretto         (Singing Skill)      - BRD
    {6159, 36}, -- Perih's Primer          (Archery Skill)      - RNG
    {6156, 36}, -- Noillurie's Log         (Great Katana Skill) - SAM
    {6155, 36}, -- Kagetora's Diary        (Katana Skill)       - NIN
    {6154, 36}, -- Clash of Titans         (Polearm Skill)      - DRG
    {6176, 36}, -- Astral Homeland         (Summoning Skill)    - SMN
    {6177, 36}, -- Life-form Study         (Blue Magic Skill)   - BLU
    {6160, 36}, -- Barrels of Fun          (Marksmanship Skill) - COR
    {6162, 36}, -- Mikhe's Note            (Guarding Skill)     - PUP
    {6163, 36}, -- Sonia's Diary           (Evasion Skill)      - DNC
    {6168, 36}, -- Aid for All             (Enhancing Skill)    - SCH
    {6179, 36}, -- The Bell Tolls          (Handbell Skill)     - GEO
    {6150, 36}, -- Mieuseloir's Diary      (Great Sword Skill)  - RUN

    -- Swing and Stab (Sword Skill)
    -- Ferreous's Diary (Club Skill)
    -- Kayeel-Payeel's Memoirs (Staff Skill)
    -- Throwing Weapon Enchiridion (Throwing Skill)
    -- Kagetora's Journal (Parrying Skill)
    -- Altana's Hymn (Divine Skill)
    -- Dark Deeds (Dark Skill)
    -- Cavernous Score (String Instrument Skill)
    -- Beaming Score (Wind Instrument Skill)
    -- Yomi's Diagram (Ninjutsu skill)
    -- Hrohj's Record (Geomancy Skill)
}

-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood,
-- Maliyakaleya Orb, Hepatizon Ingot, Beryllium Ingot, Exalted Lumber, Sif's Macrame
local godItem =
{
     844,  837, 1110,  836, 1311,
    8720, 8722, 8724, 8726, 8728,
}

-- NQ RAF   - Pummeler's Mask, Pummeler's Lorica, Pummeler's Mufflers, Pummeler's Cuisses, Pummeler's Calligae,
-- HQ+1 RAF - Pummeler's Mask +1, Pummeler's Lorica +1, Pummeler's Mufflers +1, Pummeler's Cuisses +1, Pummeler's Calligae +1
-- HQ+2 RAF - Pummeler's Mask +2, Pummeler's Lorica +2, Pummeler's Mufflers +2, Pummeler's Cuisses +2, Pummeler's Calligae +2
-- HQ+3 RAF - Pummeler's Mask +3, Pummeler's Lorica +3, Pummeler's Mufflers +3, Pummeler's Cuisses +3, Pummeler's Calligae +3 (FUTURE)
local rewardPiece =
{
    27663, 27807, 27943, 28090, 28223,
    27684, 27828, 27964, 28111, 28244,
    23040, 23107, 23174, 23241, 23308,
    23643, 23442, 23509, 23576, 23643,
}

local gilCost = {"gil", 50000}

-- RAF+2 Materials
local jobCard   = {9281} -- Paragon WAR Card
local aCurrency = {1875} -- Ancient Beastcoin

-----------------------------------
-- Artifact armor upgrade data
-----------------------------------

local reforgedArtifactArmor =
{
    -- Reforged Artifact Armor (109)
    [  1] = {trade = {tradePiece[1],        remTales[1], tradeMaterial[1], godItem[1], gilCost}, reward = rewardPiece[1]      }, -- pummelers_mask
    [  2] = {trade = {tradePiece[2],        remTales[2], tradeMaterial[1], godItem[2], gilCost}, reward = rewardPiece[2]      }, -- pummelers_lorica
    [  3] = {trade = {tradePiece[3],        remTales[3], tradeMaterial[1], godItem[3], gilCost}, reward = rewardPiece[3]      }, -- pummelers_mufflers
    [  4] = {trade = {tradePiece[4],        remTales[4], tradeMaterial[1], godItem[4], gilCost}, reward = rewardPiece[4]      }, -- pummelers_cuisses
    [  5] = {trade = {tradePiece[5],        remTales[5], tradeMaterial[1], godItem[5], gilCost}, reward = rewardPiece[5]      }, -- pummelers_calligae
    [  6] = {trade = {tradePiece[1] + 1,    remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 1  }, -- anchorites_crown
    [  7] = {trade = {tradePiece[2] + 1,    remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 1  }, -- anchorites_cyclas
    [  8] = {trade = {tradePiece[3] + 1,    remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 1  }, -- anchorites_gloves
    [  9] = {trade = {tradePiece[4] + 1,    remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 1  }, -- anchorites_hose
    [ 10] = {trade = {tradePiece[5] + 1,    remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 1  }, -- anchorites_gaiters
    [ 11] = {trade = {tradePiece[1] + 2,    remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 2  }, -- theophany_cap
    [ 12] = {trade = {tradePiece[2] + 2,    remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 2  }, -- theophany_briault
    [ 13] = {trade = {tradePiece[3] + 2,    remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 2  }, -- theophany_mitts
    [ 14] = {trade = {tradePiece[4] + 2,    remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 2  }, -- theophany_pantaloons
    [ 15] = {trade = {tradePiece[5] + 2,    remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 2  }, -- theophany_duckbills
    [ 16] = {trade = {tradePiece[1] + 3,    remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 3  }, -- spaekonas_petasos
    [ 17] = {trade = {tradePiece[2] + 3,    remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 3  }, -- spaekonas_coat
    [ 18] = {trade = {tradePiece[3] + 3,    remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 3  }, -- spaekonas_gloves
    [ 19] = {trade = {tradePiece[4] + 3,    remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 3  }, -- spaekonas_tonban
    [ 20] = {trade = {tradePiece[5] + 3,    remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 3  }, -- spaekonas_sabots
    [ 21] = {trade = {tradePiece[1] + 4,    remTales[1], tradeMaterial[5], godItem[1], gilCost}, reward = rewardPiece[1] + 4  }, -- atrophy_chapeau
    [ 22] = {trade = {tradePiece[2] + 4,    remTales[2], tradeMaterial[5], godItem[2], gilCost}, reward = rewardPiece[2] + 4  }, -- atrophy_tabard
    [ 23] = {trade = {tradePiece[3] + 4,    remTales[3], tradeMaterial[5], godItem[3], gilCost}, reward = rewardPiece[3] + 4  }, -- atrophy_gloves
    [ 24] = {trade = {tradePiece[4] + 4,    remTales[4], tradeMaterial[5], godItem[4], gilCost}, reward = rewardPiece[4] + 4  }, -- atrophy_tights
    [ 25] = {trade = {tradePiece[5] + 4,    remTales[5], tradeMaterial[5], godItem[5], gilCost}, reward = rewardPiece[5] + 4  }, -- atrophy_boots
    [ 26] = {trade = {tradePiece[1] + 5,    remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 5  }, -- pillagers_bonnet
    [ 27] = {trade = {tradePiece[2] + 5,    remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 5  }, -- pillagers_vest
    [ 28] = {trade = {tradePiece[3] + 5,    remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 5  }, -- pillagers_armlets
    [ 29] = {trade = {tradePiece[4] + 5,    remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 5  }, -- pillagers_culottes
    [ 30] = {trade = {tradePiece[5] + 5,    remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 5  }, -- pillagers_poulaines
    [ 31] = {trade = {tradePiece[1] + 6,    remTales[1], tradeMaterial[6], godItem[1], gilCost}, reward = rewardPiece[1] + 6  }, -- reverence_coronet
    [ 32] = {trade = {tradePiece[2] + 6,    remTales[2], tradeMaterial[6], godItem[2], gilCost}, reward = rewardPiece[2] + 6  }, -- reverence_surcoat
    [ 33] = {trade = {tradePiece[3] + 6,    remTales[3], tradeMaterial[6], godItem[3], gilCost}, reward = rewardPiece[3] + 6  }, -- reverence_gauntlets
    [ 34] = {trade = {tradePiece[4] + 6,    remTales[4], tradeMaterial[6], godItem[4], gilCost}, reward = rewardPiece[4] + 6  }, -- reverence_breeches
    [ 35] = {trade = {tradePiece[5] + 6,    remTales[5], tradeMaterial[6], godItem[5], gilCost}, reward = rewardPiece[5] + 6  }, -- reverence_leggings
    [ 36] = {trade = {tradePiece[1] + 7,    remTales[1], tradeMaterial[7], godItem[1], gilCost}, reward = rewardPiece[1] + 7  }, -- ignominy_burgeonet
    [ 37] = {trade = {tradePiece[2] + 7,    remTales[2], tradeMaterial[7], godItem[2], gilCost}, reward = rewardPiece[2] + 7  }, -- ignominy_cuirass
    [ 38] = {trade = {tradePiece[3] + 7,    remTales[3], tradeMaterial[7], godItem[3], gilCost}, reward = rewardPiece[3] + 7  }, -- ignominy_gauntlets
    [ 39] = {trade = {tradePiece[4] + 7,    remTales[4], tradeMaterial[7], godItem[4], gilCost}, reward = rewardPiece[4] + 7  }, -- ignominy_flanchard
    [ 40] = {trade = {tradePiece[5] + 7,    remTales[5], tradeMaterial[7], godItem[5], gilCost}, reward = rewardPiece[5] + 7  }, -- ignominy_sollerets
    [ 41] = {trade = {tradePiece[1] + 8,    remTales[1], tradeMaterial[1], godItem[1], gilCost}, reward = rewardPiece[1] + 8  }, -- totemic_helm
    [ 42] = {trade = {tradePiece[2] + 8,    remTales[2], tradeMaterial[1], godItem[2], gilCost}, reward = rewardPiece[2] + 8  }, -- totemic_jackcoat
    [ 43] = {trade = {tradePiece[3] + 8,    remTales[3], tradeMaterial[1], godItem[3], gilCost}, reward = rewardPiece[3] + 8  }, -- totemic_gloves
    [ 44] = {trade = {tradePiece[4] + 8,    remTales[4], tradeMaterial[1], godItem[4], gilCost}, reward = rewardPiece[4] + 8  }, -- totemic_trousers
    [ 45] = {trade = {tradePiece[5] + 8,    remTales[5], tradeMaterial[1], godItem[5], gilCost}, reward = rewardPiece[5] + 8  }, -- totemic_gaiters
    [ 46] = {trade = {tradePiece[1] + 9,    remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 9  }, -- brioso_roundlet
    [ 47] = {trade = {tradePiece[2] + 9,    remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 9  }, -- brioso_justaucorps
    [ 48] = {trade = {tradePiece[3] + 9,    remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 9  }, -- brioso_cuffs
    [ 49] = {trade = {tradePiece[4] + 9,    remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 9  }, -- brioso_cannions
    [ 50] = {trade = {tradePiece[5] + 9,    remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 9  }, -- brioso_slippers
    [ 51] = {trade = {tradePiece[1] + 10,   remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 10 }, -- orion_beret
    [ 52] = {trade = {tradePiece[2] + 10,   remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 10 }, -- orion_jerkin
    [ 53] = {trade = {tradePiece[3] + 10,   remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 10 }, -- orion_bracers
    [ 54] = {trade = {tradePiece[4] + 10,   remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 10 }, -- orion_braccae
    [ 55] = {trade = {tradePiece[5] + 10,   remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 10 }, -- orion_socks
    [ 56] = {trade = {tradePiece[1] + 11,   remTales[1], tradeMaterial[8], godItem[1], gilCost}, reward = rewardPiece[1] + 11 }, -- wakido_kabuto
    [ 57] = {trade = {tradePiece[2] + 11,   remTales[2], tradeMaterial[8], godItem[2], gilCost}, reward = rewardPiece[2] + 11 }, -- wakido_domaru
    [ 58] = {trade = {tradePiece[3] + 11,   remTales[3], tradeMaterial[8], godItem[3], gilCost}, reward = rewardPiece[3] + 11 }, -- wakido_kote
    [ 59] = {trade = {tradePiece[4] + 11,   remTales[4], tradeMaterial[8], godItem[4], gilCost}, reward = rewardPiece[4] + 11 }, -- wakido_haidate
    [ 60] = {trade = {tradePiece[5] + 11,   remTales[5], tradeMaterial[8], godItem[5], gilCost}, reward = rewardPiece[5] + 11 }, -- wakido_sune-ate
    [ 61] = {trade = {tradePiece[1] + 12,   remTales[1], tradeMaterial[8], godItem[1], gilCost}, reward = rewardPiece[1] + 12 }, -- hachiya_hatsuburi
    [ 62] = {trade = {tradePiece[2] + 12,   remTales[2], tradeMaterial[8], godItem[2], gilCost}, reward = rewardPiece[2] + 12 }, -- hachiya_chainmail
    [ 63] = {trade = {tradePiece[3] + 12,   remTales[3], tradeMaterial[8], godItem[3], gilCost}, reward = rewardPiece[3] + 12 }, -- hachiya_tekko
    [ 64] = {trade = {tradePiece[4] + 12,   remTales[4], tradeMaterial[8], godItem[4], gilCost}, reward = rewardPiece[4] + 12 }, -- hachiya_hakama
    [ 65] = {trade = {tradePiece[5] + 12,   remTales[5], tradeMaterial[8], godItem[5], gilCost}, reward = rewardPiece[5] + 12 }, -- hachiya_kyahan
    [ 66] = {trade = {tradePiece[1] + 13,   remTales[1], tradeMaterial[6], godItem[1], gilCost}, reward = rewardPiece[1] + 13 }, -- vishap_armet
    [ 67] = {trade = {tradePiece[2] + 13,   remTales[2], tradeMaterial[6], godItem[2], gilCost}, reward = rewardPiece[2] + 13 }, -- vishap_mail
    [ 68] = {trade = {tradePiece[3] + 13,   remTales[3], tradeMaterial[6], godItem[3], gilCost}, reward = rewardPiece[3] + 13 }, -- vishap_finger_gauntlets
    [ 69] = {trade = {tradePiece[4] + 13,   remTales[4], tradeMaterial[6], godItem[4], gilCost}, reward = rewardPiece[4] + 13 }, -- vishap_brais
    [ 70] = {trade = {tradePiece[5] + 13,   remTales[5], tradeMaterial[6], godItem[5], gilCost}, reward = rewardPiece[5] + 13 }, -- vishap_greaves
    [ 71] = {trade = {tradePiece[1] + 14,   remTales[1], tradeMaterial[5], godItem[1], gilCost}, reward = rewardPiece[1] + 14 }, -- convokers_horn
    [ 72] = {trade = {tradePiece[2] + 14,   remTales[2], tradeMaterial[5], godItem[2], gilCost}, reward = rewardPiece[2] + 14 }, -- convokers_doublet
    [ 73] = {trade = {tradePiece[3] + 14,   remTales[3], tradeMaterial[5], godItem[3], gilCost}, reward = rewardPiece[3] + 14 }, -- convokers_bracers
    [ 74] = {trade = {tradePiece[4] + 14,   remTales[4], tradeMaterial[5], godItem[4], gilCost}, reward = rewardPiece[4] + 14 }, -- convokers_spats
    [ 75] = {trade = {tradePiece[5] + 14,   remTales[5], tradeMaterial[5], godItem[5], gilCost}, reward = rewardPiece[5] + 14 }, -- convokers_pigaches
    [ 76] = {trade = {tradePiece[1] - 3761, remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 15 }, -- assimilators_keffiyeh
    [ 77] = {trade = {tradePiece[2] - 3182, remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 15 }, -- assimilators_jubbah
    [ 78] = {trade = {tradePiece[3] + 134,  remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 15 }, -- assimilators_bazubands
    [ 79] = {trade = {tradePiece[4] + 784,  remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 15 }, -- assimilators_shalwar
    [ 80] = {trade = {tradePiece[5] - 3971, remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 15 }, -- assimilators_charuqs
    [ 81] = {trade = {tradePiece[1] - 3758, remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 16 }, -- laksamanas_tricorne
    [ 82] = {trade = {tradePiece[2] - 3179, remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 16 }, -- laksamanas_frac
    [ 83] = {trade = {tradePiece[3] + 137,  remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 16 }, -- laksamanas_gants
    [ 84] = {trade = {tradePiece[4] + 787,  remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 16 }, -- laksamanas_culottes
    [ 85] = {trade = {tradePiece[5] - 3968, remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 16 }, -- laksamanas_bottes
    [ 86] = {trade = {tradePiece[1] - 3755, remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 17 }, -- foire_taj
    [ 87] = {trade = {tradePiece[2] - 3176, remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 17 }, -- foire_tobe
    [ 88] = {trade = {tradePiece[3] + 140,  remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 17 }, -- foire_dastanas
    [ 89] = {trade = {tradePiece[4] + 790,  remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 17 }, -- foire_churidars
    [ 90] = {trade = {tradePiece[5] - 3965, remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 17 }, -- foire_babouches
    [ 91] = {trade = {tradePiece[1] - 3750, remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 18 }, -- maxixi_tiara
    [ 92] = {trade = {tradePiece[2] - 3171, remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 18 }, -- maxixi_casaque
    [ 93] = {trade = {tradePiece[3] + 145,  remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 18 }, -- maxixi_bangles
    [ 94] = {trade = {tradePiece[4] + 796,  remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 18 }, -- maxixi_tights
    [ 95] = {trade = {tradePiece[5] - 3959, remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 18 }, -- maxixi_toe_shoes
    [ 96] = {trade = {tradePiece[1] - 3749, remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 19 }, -- maxixi_tiara
    [ 97] = {trade = {tradePiece[2] - 3170, remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 19 }, -- maxixi_casaque
    [ 98] = {trade = {tradePiece[3] + 146,  remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 19 }, -- maxixi_bangles
    [ 99] = {trade = {tradePiece[4] + 797,  remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 19 }, -- maxixi_tights
    [100] = {trade = {tradePiece[5] - 3958, remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 19 }, -- maxixi_toe_shoes
    [101] = {trade = {tradePiece[1] - 3748, remTales[1], tradeMaterial[5], godItem[1], gilCost}, reward = rewardPiece[1] + 20 }, -- academics_mortarboard
    [102] = {trade = {tradePiece[2] - 3169, remTales[2], tradeMaterial[5], godItem[2], gilCost}, reward = rewardPiece[2] + 20 }, -- academics_gown
    [103] = {trade = {tradePiece[3] + 147,  remTales[3], tradeMaterial[5], godItem[3], gilCost}, reward = rewardPiece[3] + 20 }, -- academics_bracers
    [104] = {trade = {tradePiece[4] + 798,  remTales[4], tradeMaterial[5], godItem[4], gilCost}, reward = rewardPiece[4] + 20 }, -- academics_pants
    [105] = {trade = {tradePiece[5] - 3957, remTales[5], tradeMaterial[5], godItem[5], gilCost}, reward = rewardPiece[5] + 20 }, -- academics_loafers
    [106] = {trade = {{4044, 3},            remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 123}, -- geomancy_galero
    [107] = {trade = {{4043, 3},            remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 119}, -- geomancy_tunic
    [108] = {trade = {{4042, 3},            remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 123}, -- geomancy_mitaines
    [109] = {trade = {{4030, 3},            remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 116}, -- geomancy_pants
    [110] = {trade = {{4045, 3},            remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 123}, -- geomancy_sandals
    [111] = {trade = {{4046, 3},            remTales[1], tradeMaterial[7], godItem[1], gilCost}, reward = rewardPiece[1] + 124}, -- runeist_bandeau
    [112] = {trade = {{4025, 3},            remTales[2], tradeMaterial[7], godItem[2], gilCost}, reward = rewardPiece[2] + 120}, -- runeist_coat
    [113] = {trade = {{4047, 3},            remTales[3], tradeMaterial[7], godItem[3], gilCost}, reward = rewardPiece[3] + 124}, -- runeist_mitons
    [114] = {trade = {{3923, 3},            remTales[4], tradeMaterial[7], godItem[4], gilCost}, reward = rewardPiece[4] + 117}, -- runeist_trousers
    [115] = {trade = {{4029, 3},            remTales[5], tradeMaterial[7], godItem[5], gilCost}, reward = rewardPiece[5] + 124}, -- runeist_bottes
    -- Reforged Artifact Armor +1 (119)
    [116] = {trade = {tradePiece[ 6],       remTales[ 6], tradeMaterial[ 9], godItem[ 6]}, reward = rewardPiece[ 6]      }, -- pummelers_mask_+1
    [117] = {trade = {tradePiece[ 7],       remTales[ 7], tradeMaterial[ 9], godItem[ 7]}, reward = rewardPiece[ 7]      }, -- pummelers_lorica_+1
    [118] = {trade = {tradePiece[ 8],       remTales[ 8], tradeMaterial[ 9], godItem[ 8]}, reward = rewardPiece[ 8]      }, -- pummelers_mufflers_+1
    [119] = {trade = {tradePiece[ 9],       remTales[ 9], tradeMaterial[ 9], godItem[ 9]}, reward = rewardPiece[ 9]      }, -- pummelers_cuisses_+1
    [120] = {trade = {tradePiece[10],       remTales[10], tradeMaterial[ 9], godItem[10]}, reward = rewardPiece[10]      }, -- pummelers_calligae_+1
    [121] = {trade = {tradePiece[ 6] + 1,   remTales[ 6], tradeMaterial[10], godItem[ 6]}, reward = rewardPiece[ 6] + 1  }, -- anchorites_crown_+1
    [122] = {trade = {tradePiece[ 7] + 1,   remTales[ 7], tradeMaterial[10], godItem[ 7]}, reward = rewardPiece[ 7] + 1  }, -- anchorites_cyclas_+1
    [123] = {trade = {tradePiece[ 8] + 1,   remTales[ 8], tradeMaterial[10], godItem[ 8]}, reward = rewardPiece[ 8] + 1  }, -- anchorites_gloves_+1
    [124] = {trade = {tradePiece[ 9] + 1,   remTales[ 9], tradeMaterial[10], godItem[ 9]}, reward = rewardPiece[ 9] + 1  }, -- anchorites_hose_+1
    [125] = {trade = {tradePiece[10] + 1,   remTales[10], tradeMaterial[10], godItem[10]}, reward = rewardPiece[10] + 1  }, -- anchorites_gaiters_+1
    [126] = {trade = {tradePiece[ 6] + 2,   remTales[ 6], tradeMaterial[11], godItem[ 6]}, reward = rewardPiece[ 6] + 2  }, -- theophany_cap_+1
    [127] = {trade = {tradePiece[ 7] + 2,   remTales[ 7], tradeMaterial[11], godItem[ 7]}, reward = rewardPiece[ 7] + 2  }, -- theophany_briault_+1
    [128] = {trade = {tradePiece[ 8] + 2,   remTales[ 8], tradeMaterial[11], godItem[ 8]}, reward = rewardPiece[ 8] + 2  }, -- theophany_mitts_+1
    [129] = {trade = {tradePiece[ 9] + 2,   remTales[ 9], tradeMaterial[11], godItem[ 9]}, reward = rewardPiece[ 9] + 2  }, -- theophany_pantaloons_+1
    [130] = {trade = {tradePiece[10] + 2,   remTales[10], tradeMaterial[11], godItem[10]}, reward = rewardPiece[10] + 2  }, -- theophany_duckbills_+1
    [131] = {trade = {tradePiece[ 6] + 3,   remTales[ 6], tradeMaterial[12], godItem[ 6]}, reward = rewardPiece[ 6] + 3  }, -- spaekonas_petasos_+1
    [132] = {trade = {tradePiece[ 7] + 3,   remTales[ 7], tradeMaterial[12], godItem[ 7]}, reward = rewardPiece[ 7] + 3  }, -- spaekonas_coat_+1
    [133] = {trade = {tradePiece[ 8] + 3,   remTales[ 8], tradeMaterial[12], godItem[ 8]}, reward = rewardPiece[ 8] + 3  }, -- spaekonas_gloves_+1
    [134] = {trade = {tradePiece[ 9] + 3,   remTales[ 9], tradeMaterial[12], godItem[ 9]}, reward = rewardPiece[ 9] + 3  }, -- spaekonas_tonban_+1
    [135] = {trade = {tradePiece[10] + 3,   remTales[10], tradeMaterial[12], godItem[10]}, reward = rewardPiece[10] + 3  }, -- spaekonas_sabots_+1
    [136] = {trade = {tradePiece[ 6] + 4,   remTales[ 6], tradeMaterial[13], godItem[ 6]}, reward = rewardPiece[ 6] + 4  }, -- atrophy_chapeau_+1
    [137] = {trade = {tradePiece[ 7] + 4,   remTales[ 7], tradeMaterial[13], godItem[ 7]}, reward = rewardPiece[ 7] + 4  }, -- atrophy_tabard_+1
    [138] = {trade = {tradePiece[ 8] + 4,   remTales[ 8], tradeMaterial[13], godItem[ 8]}, reward = rewardPiece[ 8] + 4  }, -- atrophy_gloves_+1
    [139] = {trade = {tradePiece[ 9] + 4,   remTales[ 9], tradeMaterial[13], godItem[ 9]}, reward = rewardPiece[ 9] + 4  }, -- atrophy_tights_+1
    [140] = {trade = {tradePiece[10] + 4,   remTales[10], tradeMaterial[13], godItem[10]}, reward = rewardPiece[10] + 4  }, -- atrophy_boots_+1
    [141] = {trade = {tradePiece[ 6] + 5,   remTales[ 6], tradeMaterial[14], godItem[ 6]}, reward = rewardPiece[ 6] + 5  }, -- pillagers_bonnet_+1
    [142] = {trade = {tradePiece[ 7] + 5,   remTales[ 7], tradeMaterial[14], godItem[ 7]}, reward = rewardPiece[ 7] + 5  }, -- pillagers_vest_+1
    [143] = {trade = {tradePiece[ 8] + 5,   remTales[ 8], tradeMaterial[14], godItem[ 8]}, reward = rewardPiece[ 8] + 5  }, -- pillagers_armlets_+1
    [144] = {trade = {tradePiece[ 9] + 5,   remTales[ 9], tradeMaterial[14], godItem[ 9]}, reward = rewardPiece[ 9] + 5  }, -- pillagers_culottes_+1
    [145] = {trade = {tradePiece[10] + 5,   remTales[10], tradeMaterial[14], godItem[10]}, reward = rewardPiece[10] + 5  }, -- pillagers_poulaines_+1
    [146] = {trade = {tradePiece[ 6] + 6,   remTales[ 6], tradeMaterial[15], godItem[ 6]}, reward = rewardPiece[ 6] + 6  }, -- reverence_coronet_+1
    [147] = {trade = {tradePiece[ 7] + 6,   remTales[ 7], tradeMaterial[15], godItem[ 7]}, reward = rewardPiece[ 7] + 6  }, -- reverence_surcoat_+1
    [148] = {trade = {tradePiece[ 8] + 6,   remTales[ 8], tradeMaterial[15], godItem[ 8]}, reward = rewardPiece[ 8] + 6  }, -- reverence_gauntlets_+1
    [149] = {trade = {tradePiece[ 9] + 6,   remTales[ 9], tradeMaterial[15], godItem[ 9]}, reward = rewardPiece[ 9] + 6  }, -- reverence_breeches_+1
    [150] = {trade = {tradePiece[10] + 6,   remTales[10], tradeMaterial[15], godItem[10]}, reward = rewardPiece[10] + 6  }, -- reverence_leggings_+1
    [151] = {trade = {tradePiece[ 6] + 7,   remTales[ 6], tradeMaterial[16], godItem[ 6]}, reward = rewardPiece[ 6] + 7  }, -- ignominy_burgeonet_+1
    [152] = {trade = {tradePiece[ 7] + 7,   remTales[ 7], tradeMaterial[16], godItem[ 7]}, reward = rewardPiece[ 7] + 7  }, -- ignominy_cuirass_+1
    [153] = {trade = {tradePiece[ 8] + 7,   remTales[ 8], tradeMaterial[16], godItem[ 8]}, reward = rewardPiece[ 8] + 7  }, -- ignominy_gauntlets_+1
    [154] = {trade = {tradePiece[ 9] + 7,   remTales[ 9], tradeMaterial[16], godItem[ 9]}, reward = rewardPiece[ 9] + 7  }, -- ignominy_flanchard_+1
    [155] = {trade = {tradePiece[10] + 7,   remTales[10], tradeMaterial[16], godItem[10]}, reward = rewardPiece[10] + 7  }, -- ignominy_sollerets_+1
    [156] = {trade = {tradePiece[ 6] + 8,   remTales[ 6], tradeMaterial[17], godItem[ 6]}, reward = rewardPiece[ 6] + 8  }, -- totemic_helm_+1
    [157] = {trade = {tradePiece[ 7] + 8,   remTales[ 7], tradeMaterial[17], godItem[ 7]}, reward = rewardPiece[ 7] + 8  }, -- totemic_jackcoat_+1
    [158] = {trade = {tradePiece[ 8] + 8,   remTales[ 8], tradeMaterial[17], godItem[ 8]}, reward = rewardPiece[ 8] + 8  }, -- totemic_gloves_+1
    [159] = {trade = {tradePiece[ 9] + 8,   remTales[ 9], tradeMaterial[17], godItem[ 9]}, reward = rewardPiece[ 9] + 8  }, -- totemic_trousers_+1
    [160] = {trade = {tradePiece[10] + 8,   remTales[10], tradeMaterial[17], godItem[10]}, reward = rewardPiece[10] + 8  }, -- totemic_gaiters_+1
    [161] = {trade = {tradePiece[ 6] + 9,   remTales[ 6], tradeMaterial[18], godItem[ 6]}, reward = rewardPiece[ 6] + 9  }, -- brioso_roundlet_+1
    [162] = {trade = {tradePiece[ 7] + 9,   remTales[ 7], tradeMaterial[18], godItem[ 7]}, reward = rewardPiece[ 7] + 9  }, -- brioso_justaucorps_+1
    [163] = {trade = {tradePiece[ 8] + 9,   remTales[ 8], tradeMaterial[18], godItem[ 8]}, reward = rewardPiece[ 8] + 9  }, -- brioso_cuffs_+1
    [164] = {trade = {tradePiece[ 9] + 9,   remTales[ 9], tradeMaterial[18], godItem[ 9]}, reward = rewardPiece[ 9] + 9  }, -- brioso_cannions_+1
    [165] = {trade = {tradePiece[10] + 9,   remTales[10], tradeMaterial[18], godItem[10]}, reward = rewardPiece[10] + 9  }, -- brioso_slippers_+1
    [166] = {trade = {tradePiece[ 6] + 10,  remTales[ 6], tradeMaterial[19], godItem[ 6]}, reward = rewardPiece[ 6] + 10 }, -- orion_beret_+1
    [167] = {trade = {tradePiece[ 7] + 10,  remTales[ 7], tradeMaterial[19], godItem[ 7]}, reward = rewardPiece[ 7] + 10 }, -- orion_jerkin_+1
    [168] = {trade = {tradePiece[ 8] + 10,  remTales[ 8], tradeMaterial[19], godItem[ 8]}, reward = rewardPiece[ 8] + 10 }, -- orion_bracers_+1
    [169] = {trade = {tradePiece[ 9] + 10,  remTales[ 9], tradeMaterial[19], godItem[ 9]}, reward = rewardPiece[ 9] + 10 }, -- orion_braccae_+1
    [170] = {trade = {tradePiece[10] + 10,  remTales[10], tradeMaterial[19], godItem[10]}, reward = rewardPiece[10] + 10 }, -- orion_socks_+1
    [171] = {trade = {tradePiece[ 6] + 11,  remTales[ 6], tradeMaterial[20], godItem[ 6]}, reward = rewardPiece[ 6] + 11 }, -- wakido_kabuto_+1
    [172] = {trade = {tradePiece[ 7] + 11,  remTales[ 7], tradeMaterial[20], godItem[ 7]}, reward = rewardPiece[ 7] + 11 }, -- wakido_domaru_+1
    [173] = {trade = {tradePiece[ 8] + 11,  remTales[ 8], tradeMaterial[20], godItem[ 8]}, reward = rewardPiece[ 8] + 11 }, -- wakido_kote_+1
    [174] = {trade = {tradePiece[ 9] + 11,  remTales[ 9], tradeMaterial[20], godItem[ 9]}, reward = rewardPiece[ 9] + 11 }, -- wakido_haidate_+1
    [175] = {trade = {tradePiece[10] + 11,  remTales[10], tradeMaterial[20], godItem[10]}, reward = rewardPiece[10] + 11 }, -- wakido_sune-ate_+1
    [176] = {trade = {tradePiece[ 6] + 12,  remTales[ 6], tradeMaterial[21], godItem[ 6]}, reward = rewardPiece[ 6] + 12 }, -- hachiya_hatsuburi_+1
    [177] = {trade = {tradePiece[ 7] + 12,  remTales[ 7], tradeMaterial[21], godItem[ 7]}, reward = rewardPiece[ 7] + 12 }, -- hachiya_chainmail_+1
    [178] = {trade = {tradePiece[ 8] + 12,  remTales[ 8], tradeMaterial[21], godItem[ 8]}, reward = rewardPiece[ 8] + 12 }, -- hachiya_tekko_+1
    [179] = {trade = {tradePiece[ 9] + 12,  remTales[ 9], tradeMaterial[21], godItem[ 9]}, reward = rewardPiece[ 9] + 12 }, -- hachiya_hakama_+1
    [180] = {trade = {tradePiece[10] + 12,  remTales[10], tradeMaterial[21], godItem[10]}, reward = rewardPiece[10] + 12 }, -- hachiya_kyahan_+1
    [181] = {trade = {tradePiece[ 6] + 13,  remTales[ 6], tradeMaterial[22], godItem[ 6]}, reward = rewardPiece[ 6] + 13 }, -- vishap_armet_+1
    [182] = {trade = {tradePiece[ 7] + 13,  remTales[ 7], tradeMaterial[22], godItem[ 7]}, reward = rewardPiece[ 7] + 13 }, -- vishap_mail_+1
    [183] = {trade = {tradePiece[ 8] + 13,  remTales[ 8], tradeMaterial[22], godItem[ 8]}, reward = rewardPiece[ 8] + 13 }, -- vishap_finger_gauntlets_+1
    [184] = {trade = {tradePiece[ 9] + 13,  remTales[ 9], tradeMaterial[22], godItem[ 9]}, reward = rewardPiece[ 9] + 13 }, -- vishap_brais_+1
    [185] = {trade = {tradePiece[10] + 13,  remTales[10], tradeMaterial[22], godItem[10]}, reward = rewardPiece[10] + 13 }, -- vishap_greaves_+1
    [186] = {trade = {tradePiece[ 6] + 14,  remTales[ 6], tradeMaterial[23], godItem[ 6]}, reward = rewardPiece[ 6] + 14 }, -- convokers_horn_+1
    [187] = {trade = {tradePiece[ 7] + 14,  remTales[ 7], tradeMaterial[23], godItem[ 7]}, reward = rewardPiece[ 7] + 14 }, -- convokers_doublet_+1
    [188] = {trade = {tradePiece[ 8] + 14,  remTales[ 8], tradeMaterial[23], godItem[ 8]}, reward = rewardPiece[ 8] + 14 }, -- convokers_bracers_+1
    [189] = {trade = {tradePiece[ 9] + 14,  remTales[ 9], tradeMaterial[23], godItem[ 9]}, reward = rewardPiece[ 9] + 14 }, -- convokers_spats_+1
    [190] = {trade = {tradePiece[10] + 14,  remTales[10], tradeMaterial[23], godItem[10]}, reward = rewardPiece[10] + 14 }, -- convokers_pigaches_+1
    [191] = {trade = {tradePiece[ 6] + 15,  remTales[ 6], tradeMaterial[24], godItem[ 6]}, reward = rewardPiece[ 6] + 15 }, -- assimilators_keffiyeh_+1
    [192] = {trade = {tradePiece[ 7] + 15,  remTales[ 7], tradeMaterial[24], godItem[ 7]}, reward = rewardPiece[ 7] + 15 }, -- assimilators_jubbah_+1
    [193] = {trade = {tradePiece[ 8] + 15,  remTales[ 8], tradeMaterial[24], godItem[ 8]}, reward = rewardPiece[ 8] + 15 }, -- assimilators_bazubands_+1
    [194] = {trade = {tradePiece[ 9] + 15,  remTales[ 9], tradeMaterial[24], godItem[ 9]}, reward = rewardPiece[ 9] + 15 }, -- assimilators_shalwar_+1
    [195] = {trade = {tradePiece[10] + 15,  remTales[10], tradeMaterial[24], godItem[10]}, reward = rewardPiece[10] + 15 }, -- assimilators_charuqs_+1
    [196] = {trade = {tradePiece[ 6] + 16,  remTales[ 6], tradeMaterial[25], godItem[ 6]}, reward = rewardPiece[ 6] + 16 }, -- laksamanas_tricorne_+1
    [197] = {trade = {tradePiece[ 7] + 16,  remTales[ 7], tradeMaterial[25], godItem[ 7]}, reward = rewardPiece[ 7] + 16 }, -- laksamanas_frac_+1
    [198] = {trade = {tradePiece[ 8] + 16,  remTales[ 8], tradeMaterial[25], godItem[ 8]}, reward = rewardPiece[ 8] + 16 }, -- laksamanas_gants_+1
    [199] = {trade = {tradePiece[ 9] + 16,  remTales[ 9], tradeMaterial[25], godItem[ 9]}, reward = rewardPiece[ 9] + 16 }, -- laksamanas_culottes_+1
    [200] = {trade = {tradePiece[10] + 16,  remTales[10], tradeMaterial[25], godItem[10]}, reward = rewardPiece[10] + 16 }, -- laksamanas_bottes_+1
    [201] = {trade = {tradePiece[ 6] + 17,  remTales[ 6], tradeMaterial[26], godItem[ 6]}, reward = rewardPiece[ 6] + 17 }, -- foire_taj_+1
    [202] = {trade = {tradePiece[ 7] + 17,  remTales[ 7], tradeMaterial[26], godItem[ 7]}, reward = rewardPiece[ 7] + 17 }, -- foire_tobe_+1
    [203] = {trade = {tradePiece[ 8] + 17,  remTales[ 8], tradeMaterial[26], godItem[ 8]}, reward = rewardPiece[ 8] + 17 }, -- foire_dastanas_+1
    [204] = {trade = {tradePiece[ 9] + 17,  remTales[ 9], tradeMaterial[26], godItem[ 9]}, reward = rewardPiece[ 9] + 17 }, -- foire_churidars_+1
    [205] = {trade = {tradePiece[10] + 17,  remTales[10], tradeMaterial[26], godItem[10]}, reward = rewardPiece[10] + 17 }, -- foire_babouches_+1
    [206] = {trade = {tradePiece[ 6] + 18,  remTales[ 6], tradeMaterial[27], godItem[ 6]}, reward = rewardPiece[ 6] + 18 }, -- maxixi_tiara_+1
    [207] = {trade = {tradePiece[ 7] + 18,  remTales[ 7], tradeMaterial[27], godItem[ 7]}, reward = rewardPiece[ 7] + 18 }, -- maxixi_casaque_+1
    [208] = {trade = {tradePiece[ 8] + 18,  remTales[ 8], tradeMaterial[27], godItem[ 8]}, reward = rewardPiece[ 8] + 18 }, -- maxixi_bangles_+1
    [209] = {trade = {tradePiece[ 9] + 18,  remTales[ 9], tradeMaterial[27], godItem[ 9]}, reward = rewardPiece[ 9] + 18 }, -- maxixi_tights_+1
    [210] = {trade = {tradePiece[10] + 18,  remTales[10], tradeMaterial[27], godItem[10]}, reward = rewardPiece[10] + 18 }, -- maxixi_toe_shoes_+1
    [211] = {trade = {tradePiece[ 6] + 19,  remTales[ 6], tradeMaterial[27], godItem[ 6]}, reward = rewardPiece[ 6] + 19 }, -- maxixi_tiara_+1
    [212] = {trade = {tradePiece[ 7] + 19,  remTales[ 7], tradeMaterial[27], godItem[ 7]}, reward = rewardPiece[ 7] + 19 }, -- maxixi_casaque_+1
    [213] = {trade = {tradePiece[ 8] + 19,  remTales[ 8], tradeMaterial[27], godItem[ 8]}, reward = rewardPiece[ 8] + 19 }, -- maxixi_bangles_+1
    [214] = {trade = {tradePiece[ 9] + 19,  remTales[ 9], tradeMaterial[27], godItem[ 9]}, reward = rewardPiece[ 9] + 19 }, -- maxixi_tights_+1
    [215] = {trade = {tradePiece[10] + 19,  remTales[10], tradeMaterial[27], godItem[10]}, reward = rewardPiece[10] + 19 }, -- maxixi_toe_shoes_+1
    [216] = {trade = {tradePiece[ 6] + 20,  remTales[ 6], tradeMaterial[28], godItem[ 6]}, reward = rewardPiece[ 6] + 20 }, -- academics_mortarboard_+1
    [217] = {trade = {tradePiece[ 7] + 20,  remTales[ 7], tradeMaterial[28], godItem[ 7]}, reward = rewardPiece[ 7] + 20 }, -- academics_gown_+1
    [218] = {trade = {tradePiece[ 8] + 20,  remTales[ 8], tradeMaterial[28], godItem[ 8]}, reward = rewardPiece[ 8] + 20 }, -- academics_bracers_+1
    [219] = {trade = {tradePiece[ 9] + 20,  remTales[ 9], tradeMaterial[28], godItem[ 9]}, reward = rewardPiece[ 9] + 20 }, -- academics_pants_+1
    [220] = {trade = {tradePiece[10] + 20,  remTales[10], tradeMaterial[28], godItem[10]}, reward = rewardPiece[10] + 20 }, -- academics_loafers_+1
    [221] = {trade = {tradePiece[ 6] + 123, remTales[ 6], tradeMaterial[29], godItem[ 6]}, reward = rewardPiece[ 6] + 21 }, -- geomancy_galero_+1
    [222] = {trade = {tradePiece[ 7] + 119, remTales[ 7], tradeMaterial[29], godItem[ 7]}, reward = rewardPiece[ 7] + 21 }, -- geomancy_tunic_+1
    [223] = {trade = {tradePiece[ 8] + 123, remTales[ 8], tradeMaterial[29], godItem[ 8]}, reward = rewardPiece[ 8] + 21 }, -- geomancy_mitaines_+1
    [224] = {trade = {tradePiece[ 9] + 116, remTales[ 9], tradeMaterial[29], godItem[ 9]}, reward = rewardPiece[ 9] + 21 }, -- geomancy_pants_+1
    [225] = {trade = {tradePiece[10] + 123, remTales[10], tradeMaterial[29], godItem[10]}, reward = rewardPiece[10] + 21 }, -- geomancy_sandals_+1
    [226] = {trade = {tradePiece[ 6] + 124, remTales[ 6], tradeMaterial[30], godItem[ 6]}, reward = rewardPiece[ 6] + 22 }, -- runeist_bandeau_+1
    [227] = {trade = {tradePiece[ 7] + 120, remTales[ 7], tradeMaterial[30], godItem[ 7]}, reward = rewardPiece[ 7] + 22 }, -- runeist_coat_+1
    [228] = {trade = {tradePiece[ 8] + 124, remTales[ 8], tradeMaterial[30], godItem[ 8]}, reward = rewardPiece[ 8] + 22 }, -- runeist_mitons_+1
    [229] = {trade = {tradePiece[ 9] + 117, remTales[ 9], tradeMaterial[30], godItem[ 9]}, reward = rewardPiece[ 9] + 22 }, -- runeist_trousers_+1
    [230] = {trade = {tradePiece[10] + 124, remTales[10], tradeMaterial[30], godItem[10]}, reward = rewardPiece[10] + 22 }, -- runeist_bottes_+1
    -- Reforged Artifact Armor +2 (119)
-- Structure:
 -- [ ID] = {trade = {baseGearID + offset, {jobCard + off, qty}, {ABC's      , qty}}, reward = rewardGearID        },
    [231] = {trade = {tradePiece[11],      {jobCard[1],      3}, {aCurrency[1], 20}}, reward = rewardPiece[11]     }, -- pummelers_mask_+2
    [232] = {trade = {tradePiece[12],      {jobCard[1],      5}, {aCurrency[1], 35}}, reward = rewardPiece[12]     }, -- pummelers_lorica_+2
    [233] = {trade = {tradePiece[13],      {jobCard[1],      2}, {aCurrency[1], 15}}, reward = rewardPiece[13]     }, -- pummelers_mufflers_+2
    [234] = {trade = {tradePiece[14],      {jobCard[1],      4}, {aCurrency[1], 15}}, reward = rewardPiece[14]     }, -- pummelers_cuisses_+2
    [235] = {trade = {tradePiece[15],      {jobCard[1],      1}, {aCurrency[1], 25}}, reward = rewardPiece[15]     }, -- pummelers_calligae_+2
    [236] = {trade = {tradePiece[11] + 1,  {jobCard[1] + 1,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 1 }, -- anchorites_crown_+2
    [237] = {trade = {tradePiece[12] + 1,  {jobCard[1] + 1,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 1 }, -- anchorites_cyclas_+2
    [238] = {trade = {tradePiece[13] + 1,  {jobCard[1] + 1,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 1 }, -- anchorites_gloves_+2
    [239] = {trade = {tradePiece[14] + 1,  {jobCard[1] + 1,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 1 }, -- anchorites_hose_+2
    [240] = {trade = {tradePiece[15] + 1,  {jobCard[1] + 1,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 1 }, -- anchorites_gaiters_+2
    [241] = {trade = {tradePiece[11] + 2,  {jobCard[1] + 2,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 2 }, -- theophany_cap_+2
    [242] = {trade = {tradePiece[12] + 2,  {jobCard[1] + 2,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 2 }, -- theophany_briault_+2
    [243] = {trade = {tradePiece[13] + 2,  {jobCard[1] + 2,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 2 }, -- theophany_mitts_+2
    [244] = {trade = {tradePiece[14] + 2,  {jobCard[1] + 2,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 2 }, -- theophany_pantaloons_+2
    [245] = {trade = {tradePiece[15] + 2,  {jobCard[1] + 2,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 2 }, -- theophany_duckbills_+2
    [246] = {trade = {tradePiece[11] + 3,  {jobCard[1] + 3,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 3 }, -- spaekonas_petasos_+2
    [247] = {trade = {tradePiece[12] + 3,  {jobCard[1] + 3,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 3 }, -- spaekonas_coat_+2
    [248] = {trade = {tradePiece[13] + 3,  {jobCard[1] + 3,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 3 }, -- spaekonas_gloves_+2
    [249] = {trade = {tradePiece[14] + 3,  {jobCard[1] + 3,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 3 }, -- spaekonas_tonban_+2
    [250] = {trade = {tradePiece[15] + 3,  {jobCard[1] + 3,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 3 }, -- spaekonas_sabots_+2
    [251] = {trade = {tradePiece[11] + 4,  {jobCard[1] + 4,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 4 }, -- atrophy_chapeau_+2
    [252] = {trade = {tradePiece[12] + 4,  {jobCard[1] + 4,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 4 }, -- atrophy_tabard_+2
    [253] = {trade = {tradePiece[13] + 4,  {jobCard[1] + 4,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 4 }, -- atrophy_gloves_+2
    [254] = {trade = {tradePiece[14] + 4,  {jobCard[1] + 4,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 4 }, -- atrophy_tights_+2
    [255] = {trade = {tradePiece[15] + 4,  {jobCard[1] + 4,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 4 }, -- atrophy_boots_+2
    [256] = {trade = {tradePiece[11] + 5,  {jobCard[1] + 5,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 5 }, -- pillagers_bonnet_+2
    [257] = {trade = {tradePiece[12] + 5,  {jobCard[1] + 5,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 5 }, -- pillagers_vest_+2
    [258] = {trade = {tradePiece[13] + 5,  {jobCard[1] + 5,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 5 }, -- pillagers_armlets_+2
    [259] = {trade = {tradePiece[14] + 5,  {jobCard[1] + 5,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 5 }, -- pillagers_culottes_+2
    [260] = {trade = {tradePiece[15] + 5,  {jobCard[1] + 5,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 5 }, -- pillagers_poulaines_+2
    [261] = {trade = {tradePiece[11] + 6,  {jobCard[1] + 6,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 6 }, -- reverence_coronet_+2
    [262] = {trade = {tradePiece[12] + 6,  {jobCard[1] + 6,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 6 }, -- reverence_surcoat_+2
    [263] = {trade = {tradePiece[13] + 6,  {jobCard[1] + 6,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 6 }, -- reverence_gauntlets_+2
    [264] = {trade = {tradePiece[14] + 6,  {jobCard[1] + 6,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 6 }, -- reverence_breeches_+2
    [265] = {trade = {tradePiece[15] + 6,  {jobCard[1] + 6,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 6 }, -- reverence_leggings_+2
    [266] = {trade = {tradePiece[11] + 7,  {jobCard[1] + 7,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 7 }, -- ignominy_burgeonet_+2
    [267] = {trade = {tradePiece[12] + 7,  {jobCard[1] + 7,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 7 }, -- ignominy_cuirass_+2
    [268] = {trade = {tradePiece[13] + 7,  {jobCard[1] + 7,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 7 }, -- ignominy_gauntlets_+2
    [269] = {trade = {tradePiece[14] + 7,  {jobCard[1] + 7,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 7 }, -- ignominy_flanchard_+2
    [270] = {trade = {tradePiece[15] + 7,  {jobCard[1] + 7,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 7 }, -- ignominy_sollerets_+2
    [271] = {trade = {tradePiece[11] + 8,  {jobCard[1] + 8,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 8 }, -- totemic_helm_+2
    [272] = {trade = {tradePiece[12] + 8,  {jobCard[1] + 8,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 8 }, -- totemic_jackcoat_+2
    [273] = {trade = {tradePiece[13] + 8,  {jobCard[1] + 8,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 8 }, -- totemic_gloves_+2
    [274] = {trade = {tradePiece[14] + 8,  {jobCard[1] + 8,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 8 }, -- totemic_trousers_+2
    [275] = {trade = {tradePiece[15] + 8,  {jobCard[1] + 8,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 8 }, -- totemic_gaiters_+2
    [276] = {trade = {tradePiece[11] + 9,  {jobCard[1] + 9,  3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 9 }, -- brioso_roundlet_+2
    [277] = {trade = {tradePiece[12] + 9,  {jobCard[1] + 9,  5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 9 }, -- brioso_justaucorps_+2
    [278] = {trade = {tradePiece[13] + 9,  {jobCard[1] + 9,  2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 9 }, -- brioso_cuffs_+2
    [279] = {trade = {tradePiece[14] + 9,  {jobCard[1] + 9,  4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 9 }, -- brioso_cannions_+2
    [280] = {trade = {tradePiece[15] + 9,  {jobCard[1] + 9,  1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 9 }, -- brioso_slippers_+2
    [281] = {trade = {tradePiece[11] + 10, {jobCard[1] + 10, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 10}, -- orion_beret_+2
    [282] = {trade = {tradePiece[12] + 10, {jobCard[1] + 10, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 10}, -- orion_jerkin_+2
    [283] = {trade = {tradePiece[13] + 10, {jobCard[1] + 10, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 10}, -- orion_bracers_+2
    [284] = {trade = {tradePiece[14] + 10, {jobCard[1] + 10, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 10}, -- orion_braccae_+2
    [285] = {trade = {tradePiece[15] + 10, {jobCard[1] + 10, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 10}, -- orion_socks_+2
    [286] = {trade = {tradePiece[11] + 11, {jobCard[1] + 11, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 11}, -- wakido_kabuto_+2
    [287] = {trade = {tradePiece[12] + 11, {jobCard[1] + 11, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 11}, -- wakido_domaru_+2
    [288] = {trade = {tradePiece[13] + 11, {jobCard[1] + 11, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 11}, -- wakido_kote_+2
    [289] = {trade = {tradePiece[14] + 11, {jobCard[1] + 11, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 11}, -- wakido_haidate_+2
    [290] = {trade = {tradePiece[15] + 11, {jobCard[1] + 11, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 11}, -- wakido_sune-ate_+2
    [291] = {trade = {tradePiece[11] + 12, {jobCard[1] + 12, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 12}, -- hachiya_hatsuburi_+2
    [292] = {trade = {tradePiece[12] + 12, {jobCard[1] + 12, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 12}, -- hachiya_chainmail_+2
    [293] = {trade = {tradePiece[13] + 12, {jobCard[1] + 12, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 12}, -- hachiya_tekko_+2
    [294] = {trade = {tradePiece[14] + 12, {jobCard[1] + 12, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 12}, -- hachiya_hakama_+2
    [295] = {trade = {tradePiece[15] + 12, {jobCard[1] + 12, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 12}, -- hachiya_kyahan_+2
    [296] = {trade = {tradePiece[11] + 13, {jobCard[1] + 13, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 13}, -- vishap_armet_+2
    [297] = {trade = {tradePiece[12] + 13, {jobCard[1] + 13, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 13}, -- vishap_mail_+2
    [298] = {trade = {tradePiece[13] + 13, {jobCard[1] + 13, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 13}, -- vishap_finger_gauntlets_+2
    [299] = {trade = {tradePiece[14] + 13, {jobCard[1] + 13, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 13}, -- vishap_brais_+2
    [300] = {trade = {tradePiece[15] + 13, {jobCard[1] + 13, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 13}, -- vishap_greaves_+2
    [301] = {trade = {tradePiece[11] + 14, {jobCard[1] + 14, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 14}, -- convokers_horn_+2
    [302] = {trade = {tradePiece[12] + 14, {jobCard[1] + 14, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 14}, -- convokers_doublet_+2
    [303] = {trade = {tradePiece[13] + 14, {jobCard[1] + 14, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 14}, -- convokers_bracers_+2
    [304] = {trade = {tradePiece[14] + 14, {jobCard[1] + 14, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 14}, -- convokers_spats_+2
    [305] = {trade = {tradePiece[15] + 14, {jobCard[1] + 14, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 14}, -- convokers_pigaches_+2
    [306] = {trade = {tradePiece[11] + 15, {jobCard[1] + 15, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 15}, -- assimilators_keffiyeh_+2
    [307] = {trade = {tradePiece[12] + 15, {jobCard[1] + 15, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 15}, -- assimilators_jubbah_+2
    [308] = {trade = {tradePiece[13] + 15, {jobCard[1] + 15, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 15}, -- assimilators_bazubands_+2
    [309] = {trade = {tradePiece[14] + 15, {jobCard[1] + 15, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 15}, -- assimilators_shalwar_+2
    [310] = {trade = {tradePiece[15] + 15, {jobCard[1] + 15, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 15}, -- assimilators_charuqs_+2
    [311] = {trade = {tradePiece[11] + 16, {jobCard[1] + 16, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 16}, -- laksamanas_tricorne_+2
    [312] = {trade = {tradePiece[12] + 16, {jobCard[1] + 16, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 16}, -- laksamanas_frac_+2
    [313] = {trade = {tradePiece[13] + 16, {jobCard[1] + 16, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 16}, -- laksamanas_gants_+2
    [314] = {trade = {tradePiece[14] + 16, {jobCard[1] + 16, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 16}, -- laksamanas_culottes_+2
    [315] = {trade = {tradePiece[15] + 16, {jobCard[1] + 16, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 16}, -- laksamanas_bottes_+2
    [316] = {trade = {tradePiece[11] + 17, {jobCard[1] + 17, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 17}, -- foire_taj_+2
    [317] = {trade = {tradePiece[12] + 17, {jobCard[1] + 17, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 17}, -- foire_tobe_+2
    [318] = {trade = {tradePiece[13] + 17, {jobCard[1] + 17, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 17}, -- foire_dastanas_+2
    [319] = {trade = {tradePiece[14] + 17, {jobCard[1] + 17, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 17}, -- foire_churidars_+2
    [320] = {trade = {tradePiece[15] + 17, {jobCard[1] + 17, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 17}, -- foire_babouches_+2
    [321] = {trade = {tradePiece[11] + 18, {jobCard[1] + 18, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 18}, -- maxixi_tiara_+2 - Male
    [322] = {trade = {tradePiece[12] + 18, {jobCard[1] + 18, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 18}, -- maxixi_casaque_+2
    [323] = {trade = {tradePiece[13] + 18, {jobCard[1] + 18, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 18}, -- maxixi_bangles_+2
    [324] = {trade = {tradePiece[14] + 18, {jobCard[1] + 18, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 18}, -- maxixi_tights_+2
    [325] = {trade = {tradePiece[15] + 18, {jobCard[1] + 18, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 18}, -- maxixi_toe_shoes_+2
    [326] = {trade = {tradePiece[11] + 19, {jobCard[1] + 18, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 19}, -- maxixi_tiara_+2 - Female
    [327] = {trade = {tradePiece[12] + 19, {jobCard[1] + 18, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 19}, -- maxixi_casaque_+2
    [328] = {trade = {tradePiece[13] + 19, {jobCard[1] + 18, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 19}, -- maxixi_bangles_+2
    [329] = {trade = {tradePiece[14] + 19, {jobCard[1] + 18, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 19}, -- maxixi_tights_+2
    [330] = {trade = {tradePiece[15] + 19, {jobCard[1] + 18, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 19}, -- maxixi_toe_shoes_+2
    [331] = {trade = {tradePiece[11] + 20, {jobCard[1] + 19, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 20}, -- academics_mortarboard_+2
    [332] = {trade = {tradePiece[12] + 20, {jobCard[1] + 19, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 20}, -- academics_gown_+2
    [333] = {trade = {tradePiece[13] + 20, {jobCard[1] + 19, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 20}, -- academics_bracers_+2
    [334] = {trade = {tradePiece[14] + 20, {jobCard[1] + 19, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 20}, -- academics_pants_+2
    [335] = {trade = {tradePiece[15] + 20, {jobCard[1] + 19, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 20}, -- academics_loafers_+2
    [336] = {trade = {tradePiece[11] + 21, {jobCard[1] + 20, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 21}, -- geomancy_galero_+2
    [337] = {trade = {tradePiece[12] + 21, {jobCard[1] + 20, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 21}, -- geomancy_tunic_+2
    [338] = {trade = {tradePiece[13] + 21, {jobCard[1] + 20, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 21}, -- geomancy_mitaines_+2
    [339] = {trade = {tradePiece[14] + 21, {jobCard[1] + 20, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 21}, -- geomancy_pants_+2
    [340] = {trade = {tradePiece[15] + 21, {jobCard[1] + 20, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 21}, -- geomancy_sandals_+2
    [341] = {trade = {tradePiece[11] + 22, {jobCard[1] + 21, 3}, {aCurrency[1], 20}}, reward = rewardPiece[11] + 22}, -- runeist_bandeau_+2
    [342] = {trade = {tradePiece[12] + 22, {jobCard[1] + 21, 5}, {aCurrency[1], 35}}, reward = rewardPiece[12] + 22}, -- runeist_coat_+2
    [343] = {trade = {tradePiece[13] + 22, {jobCard[1] + 21, 2}, {aCurrency[1], 15}}, reward = rewardPiece[13] + 22}, -- runeist_mitons_+2
    [344] = {trade = {tradePiece[14] + 22, {jobCard[1] + 21, 4}, {aCurrency[1], 15}}, reward = rewardPiece[14] + 22}, -- runeist_trousers_+2
    [345] = {trade = {tradePiece[15] + 22, {jobCard[1] + 21, 1}, {aCurrency[1], 25}}, reward = rewardPiece[15] + 22}, -- runeist_bottes_+2
    -- Reforged Artifact Armor +3 (119) (Slots 346-460 reserved)
}

-----------------------------------
-- Reforged Relic Materials
-----------------------------------

-- HQ+2 Relic   - Warrior's Mask +2, Warrior's Lorica +2, Warrior's Mufflers +2, Warrior's Cuisses +2, Warrior's Calligae +2,
-- NQ RRelic    - Agoge Mask, Agoge Lorica, Agoge Mufflers, Agoge Cuisses, Agoge Calligae
-- HQ+1 RRelic  - Agoge Mask +1, Agoge Lorica +1, Agoge Mufflers +1, Agoge Cuisses +1, Agoge Calligae +1
-- HQ+2 RRelic  - Agoge Mask +2, Agoge Lorica +2, Agoge Mufflers +2, Agoge Cuisses +2, Agoge Calligae +2 (FUTURE)
local relicTrade =
{
    10650, 10670, 10690, 10710, 10730,
    26624, 26800, 26976, 27152, 27328,
    26625, 26801, 26977, 27153, 27329,
    23063, 23130, 23197, 23264, 23331,
}

-- 1 Byne Bill, Ordelle Bronzepiece, Tukuku Whiteshell
-- 100 Byne Bill, Montiont Silverpiece, Lungo-Nango Jadeshell
local dynaCurrency =
{
    {1455, 50}, {1452, 50}, {1449, 50},
    {1456,  1}, {1453,  1}, {1450,  1},
}

-- Wootz Ore x12, Griffon Hide x12, Sparkling Stone x12, Mammoth Tusk x12, Relic Iron x12, Lancewood Log x12
-- Forgotten Thought x5, Forgotten Hope x5, Forgotten Touch x5, Forgotten Journey x5, Forgotten Step x5
local relicTradeMaterial =
{
    {1469, 12}, {1516, 12}, {1470, 12}, {1458, 12}, {1466, 12}, {1464, 12},
    {3493,  5}, {3494,  5}, {3495,  5}, {3496,  5}, {3497,  5},
}

-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood
local relicGodItem =
{
    844, 837, 1110, 836, 1311,
}

-- NQ RRelic   - Agoge Mask, Agoge Lorica, Agoge Mufflers, Agoge Cuisses, Agoge Calligae
-- HQ+1 RRelic - Agoge Mask +1, Agoge Lorica +1, Agoge Mufflers +1, Agoge Cuisses +1, Agoge Calligae +1
-- HQ+2 RRelic - Agoge Mask +2, Agoge Lorica +2, Agoge Mufflers +2, Agoge Cuisses +2, Agoge Calligae +2
-- HQ+3 RRelic - Agoge Mask +3, Agoge Lorica +3, Agoge Mufflers +3, Agoge Cuisses +3, Agoge Calligae +3
local relicReward =
{
    26624, 26800, 26976, 27152, 27328,
    26625, 26801, 26977, 27153, 27329,
    23063, 23130, 23197, 23264, 23331,
    23398, 23465, 23532, 23599, 23666,
}

-- RRelic +2 Materials

-- Headshard x5, Torsoshard x5, Handshard x5, Legshard x5, Footshard x5
local shards =
{
    {9544, 5}, {9588, 5}, {9632, 5}, {9676, 5}, {9720, 5},
}

-- Moonbow Steel, Moonbow Stone, Moonbow Urushi, Moonbow Cloth, Moonbow Leather
local moonbowMats =
{
    4077, 4081, 4080, 4078, 4079,
}

-----------------------------------
-- Relic armor upgrade data
-----------------------------------
local reforgedRelicArmor =
{
    -- Reforged Relic Armor (109)
    [461] = {trade = {relicTrade[1],      dynaCurrency[1], relicTradeMaterial[1], relicGodItem[1]}, reward = relicReward[1]     }, -- agoge_mask
    [462] = {trade = {relicTrade[2],      dynaCurrency[1], relicTradeMaterial[1], relicGodItem[2]}, reward = relicReward[2]     }, -- agoge_lorica
    [463] = {trade = {relicTrade[3],      dynaCurrency[1], relicTradeMaterial[1], relicGodItem[3]}, reward = relicReward[3]     }, -- agoge_mufflers
    [464] = {trade = {relicTrade[4],      dynaCurrency[1], relicTradeMaterial[1], relicGodItem[4]}, reward = relicReward[4]     }, -- agoge_cuisses
    [465] = {trade = {relicTrade[5],      dynaCurrency[1], relicTradeMaterial[1], relicGodItem[5]}, reward = relicReward[5]     }, -- agoge_calligae
    [466] = {trade = {relicTrade[1] +  1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 2 }, -- hesychasts_crown
    [467] = {trade = {relicTrade[2] +  1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 2 }, -- hesychasts_cyclas
    [468] = {trade = {relicTrade[3] +  1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 2 }, -- hesychasts_gloves
    [469] = {trade = {relicTrade[4] +  1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 2 }, -- hesychasts_hose
    [470] = {trade = {relicTrade[5] +  1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 2 }, -- hesychasts_gaiters
    [471] = {trade = {relicTrade[1] +  2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[1]}, reward = relicReward[1] + 4 }, -- piety_cap
    [472] = {trade = {relicTrade[2] +  2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[2]}, reward = relicReward[2] + 4 }, -- piety_briault
    [473] = {trade = {relicTrade[3] +  2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[3]}, reward = relicReward[3] + 4 }, -- piety_mitts
    [474] = {trade = {relicTrade[4] +  2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[4]}, reward = relicReward[4] + 4 }, -- piety_pantaloons
    [475] = {trade = {relicTrade[5] +  2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[5]}, reward = relicReward[5] + 4 }, -- piety_duckbills
    [476] = {trade = {relicTrade[1] +  3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[1]}, reward = relicReward[1] + 6 }, -- archmages_petasos
    [477] = {trade = {relicTrade[2] +  3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[2]}, reward = relicReward[2] + 6 }, -- archmages_coat
    [478] = {trade = {relicTrade[3] +  3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[3]}, reward = relicReward[3] + 6 }, -- archmages_gloves
    [479] = {trade = {relicTrade[4] +  3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[4]}, reward = relicReward[4] + 6 }, -- archmages_tonban
    [480] = {trade = {relicTrade[5] +  3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[5]}, reward = relicReward[5] + 6 }, -- archmages_sabots
    [481] = {trade = {relicTrade[1] +  4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 8 }, -- vitiation_chapeau
    [482] = {trade = {relicTrade[2] +  4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 8 }, -- vitiation_tabard
    [483] = {trade = {relicTrade[3] +  4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 8 }, -- vitiation_gloves
    [484] = {trade = {relicTrade[4] +  4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 8 }, -- vitiation_tights
    [485] = {trade = {relicTrade[5] +  4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 8 }, -- vitiation_boots
    [486] = {trade = {relicTrade[1] +  5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 10}, -- plunderers_bonnet
    [487] = {trade = {relicTrade[2] +  5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 10}, -- plunderers_vest
    [488] = {trade = {relicTrade[3] +  5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 10}, -- plunderers_armlets
    [489] = {trade = {relicTrade[4] +  5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 10}, -- plunderers_culottes
    [490] = {trade = {relicTrade[5] +  5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 10}, -- plunderers_poulaines
    [491] = {trade = {relicTrade[1] +  6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[1]}, reward = relicReward[1] + 12}, -- caballarius_coronet
    [492] = {trade = {relicTrade[2] +  6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[2]}, reward = relicReward[2] + 12}, -- caballarius_surcoat
    [493] = {trade = {relicTrade[3] +  6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[3]}, reward = relicReward[3] + 12}, -- caballarius_gauntlets
    [494] = {trade = {relicTrade[4] +  6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[4]}, reward = relicReward[4] + 12}, -- caballarius_breeches
    [495] = {trade = {relicTrade[5] +  6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[5]}, reward = relicReward[5] + 12}, -- caballarius_leggings
    [496] = {trade = {relicTrade[1] +  7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[1]}, reward = relicReward[1] + 14}, -- fallens_burgeonet
    [497] = {trade = {relicTrade[2] +  7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[2]}, reward = relicReward[2] + 14}, -- fallens_cuirass
    [498] = {trade = {relicTrade[3] +  7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[3]}, reward = relicReward[3] + 14}, -- fallens_finger_gauntlets
    [499] = {trade = {relicTrade[4] +  7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[4]}, reward = relicReward[4] + 14}, -- fallens_flanchard
    [500] = {trade = {relicTrade[5] +  7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[5]}, reward = relicReward[5] + 14}, -- fallens_sollerets
    [501] = {trade = {relicTrade[1] +  8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[1]}, reward = relicReward[1] + 16}, -- ankusa_helm
    [502] = {trade = {relicTrade[2] +  8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[2]}, reward = relicReward[2] + 16}, -- ankusa_jackcoat
    [503] = {trade = {relicTrade[3] +  8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[3]}, reward = relicReward[3] + 16}, -- ankusa_gloves
    [504] = {trade = {relicTrade[4] +  8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[4]}, reward = relicReward[4] + 16}, -- ankusa_trousers
    [505] = {trade = {relicTrade[5] +  8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[5]}, reward = relicReward[5] + 16}, -- ankusa_gaiters
    [506] = {trade = {relicTrade[1] +  9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 18}, -- bihu_roundlet
    [507] = {trade = {relicTrade[2] +  9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 18}, -- bihu_justaucorps
    [508] = {trade = {relicTrade[3] +  9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 18}, -- bihu_cuffs
    [509] = {trade = {relicTrade[4] +  9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 18}, -- bihu_cannions
    [510] = {trade = {relicTrade[5] +  9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 18}, -- bihu_slippers
    [511] = {trade = {relicTrade[1] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 20}, -- arcadian_beret
    [512] = {trade = {relicTrade[2] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 20}, -- arcadian_jerkin
    [513] = {trade = {relicTrade[3] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 20}, -- arcadian_bracers
    [514] = {trade = {relicTrade[4] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 20}, -- arcadian_braccae
    [515] = {trade = {relicTrade[5] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 20}, -- arcadian_socks
    [516] = {trade = {relicTrade[1] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[1]}, reward = relicReward[1] + 22}, -- sakonji_kabuto
    [517] = {trade = {relicTrade[2] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[2]}, reward = relicReward[2] + 22}, -- sakonji_domaru
    [518] = {trade = {relicTrade[3] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[3]}, reward = relicReward[3] + 22}, -- sakonji_kote
    [519] = {trade = {relicTrade[4] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[4]}, reward = relicReward[4] + 22}, -- sakonji_haidate
    [520] = {trade = {relicTrade[5] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[5]}, reward = relicReward[5] + 22}, -- sakonji_sune-ate
    [521] = {trade = {relicTrade[1] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[1]}, reward = relicReward[1] + 24}, -- mochizuki_hatsuburi
    [522] = {trade = {relicTrade[2] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[2]}, reward = relicReward[2] + 24}, -- mochizuki_chainmail
    [523] = {trade = {relicTrade[3] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[3]}, reward = relicReward[3] + 24}, -- mochizuki_tekko
    [524] = {trade = {relicTrade[4] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[4]}, reward = relicReward[4] + 24}, -- mochizuki_hakama
    [525] = {trade = {relicTrade[5] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[5]}, reward = relicReward[5] + 24}, -- mochizuki_kyahan
    [526] = {trade = {relicTrade[1] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 26}, -- pteroslaver_armet
    [527] = {trade = {relicTrade[2] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 26}, -- pteroslaver_mail
    [528] = {trade = {relicTrade[3] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 26}, -- pteroslaver_finger_gauntlets
    [529] = {trade = {relicTrade[4] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 26}, -- pteroslaver_brais
    [530] = {trade = {relicTrade[5] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 26}, -- pteroslaver_greaves
    [531] = {trade = {relicTrade[1] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[1]}, reward = relicReward[1] + 28}, -- glyphic_horn
    [532] = {trade = {relicTrade[2] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[2]}, reward = relicReward[2] + 28}, -- glyphic_doublet
    [533] = {trade = {relicTrade[3] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[3]}, reward = relicReward[3] + 28}, -- glyphic_bracers
    [534] = {trade = {relicTrade[4] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[4]}, reward = relicReward[4] + 28}, -- glyphic_spats
    [535] = {trade = {relicTrade[5] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[5]}, reward = relicReward[5] + 28}, -- glyphic_pigaches
    [536] = {trade = {relicTrade[1] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 30}, -- luhlaza_keffiyeh
    [537] = {trade = {relicTrade[2] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 30}, -- luhlaza_jubbah
    [538] = {trade = {relicTrade[3] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 30}, -- luhlaza_bazubands
    [539] = {trade = {relicTrade[4] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 30}, -- luhlaza_shalwar
    [540] = {trade = {relicTrade[5] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 30}, -- luhlaza_charuqs
    [541] = {trade = {relicTrade[1] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[1]}, reward = relicReward[1] + 32}, -- lanun_tricorne
    [542] = {trade = {relicTrade[2] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[2]}, reward = relicReward[2] + 32}, -- lanun_frac
    [543] = {trade = {relicTrade[3] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[3]}, reward = relicReward[3] + 32}, -- lanun_gants
    [544] = {trade = {relicTrade[4] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[4]}, reward = relicReward[4] + 32}, -- lanun_trews
    [545] = {trade = {relicTrade[5] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[5]}, reward = relicReward[5] + 32}, -- lanun_bottes
    [546] = {trade = {relicTrade[1] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[1]}, reward = relicReward[1] + 34}, -- pitre_taj
    [547] = {trade = {relicTrade[2] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[2]}, reward = relicReward[2] + 34}, -- pitre_tobe
    [548] = {trade = {relicTrade[3] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[3]}, reward = relicReward[3] + 34}, -- pitre_dastanas
    [549] = {trade = {relicTrade[4] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[4]}, reward = relicReward[4] + 34}, -- pitre_churidars
    [550] = {trade = {relicTrade[5] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[5]}, reward = relicReward[5] + 34}, -- pitre_babouches
    [551] = {trade = {relicTrade[1] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[1]}, reward = relicReward[1] + 36}, -- horos_tiara
    [552] = {trade = {relicTrade[2] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[2]}, reward = relicReward[2] + 36}, -- horos_casaque
    [553] = {trade = {relicTrade[3] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[3]}, reward = relicReward[3] + 36}, -- horos_bangles
    [554] = {trade = {relicTrade[4] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[4]}, reward = relicReward[4] + 36}, -- horos_tights
    [555] = {trade = {relicTrade[5] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[5]}, reward = relicReward[5] + 36}, -- horos_shoes
    [556] = {trade = {relicTrade[1] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[1]}, reward = relicReward[1] + 38}, -- pedagogy_mortarboard
    [557] = {trade = {relicTrade[2] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[2]}, reward = relicReward[2] + 38}, -- pedagogy_gown
    [558] = {trade = {relicTrade[3] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[3]}, reward = relicReward[3] + 38}, -- pedagogy_bracers
    [559] = {trade = {relicTrade[4] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[4]}, reward = relicReward[4] + 38}, -- pedagogy_pants
    [560] = {trade = {relicTrade[5] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[5]}, reward = relicReward[5] + 38}, -- pedagogy_loafers
    [561] = {trade = {{4044, 3},          dynaCurrency[3], relicTradeMaterial[4], relicGodItem[1]}, reward = relicReward[1] + 40}, -- bagua_galero
    [562] = {trade = {{4043, 3},          dynaCurrency[3], relicTradeMaterial[4], relicGodItem[2]}, reward = relicReward[2] + 40}, -- bagua_tunic
    [563] = {trade = {{4042, 3},          dynaCurrency[3], relicTradeMaterial[4], relicGodItem[3]}, reward = relicReward[3] + 40}, -- bagua_mitaines
    [564] = {trade = {{4030, 3},          dynaCurrency[3], relicTradeMaterial[4], relicGodItem[4]}, reward = relicReward[4] + 40}, -- bagua_pants
    [565] = {trade = {{4045, 3},          dynaCurrency[3], relicTradeMaterial[4], relicGodItem[5]}, reward = relicReward[5] + 40}, -- bagua_sandals
    [566] = {trade = {{4046, 3},          dynaCurrency[2], relicTradeMaterial[5], relicGodItem[1]}, reward = relicReward[1] + 42}, -- futhark_bandeau
    [567] = {trade = {{4025, 3},          dynaCurrency[2], relicTradeMaterial[5], relicGodItem[2]}, reward = relicReward[2] + 42}, -- futhark_coat
    [568] = {trade = {{4047, 3},          dynaCurrency[2], relicTradeMaterial[5], relicGodItem[3]}, reward = relicReward[3] + 42}, -- futhark_mitons
    [569] = {trade = {{3923, 3},          dynaCurrency[2], relicTradeMaterial[5], relicGodItem[4]}, reward = relicReward[4] + 42}, -- futhark_trousers
    [570] = {trade = {{4029, 3},          dynaCurrency[2], relicTradeMaterial[5], relicGodItem[5]}, reward = relicReward[5] + 42}, -- futhark_boots
    -- Reforged Relic Armor +1 (119)
    [571] = {trade = {relicTrade[ 6],      dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6]     }, -- agoge_mask_+1
    [572] = {trade = {relicTrade[ 7],      dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7]     }, -- agoge_lorica_+1
    [573] = {trade = {relicTrade[ 8],      dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8]     }, -- agoge_mufflers_+1
    [574] = {trade = {relicTrade[ 9],      dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9]     }, -- agoge_cuisses_+1
    [575] = {trade = {relicTrade[10],      dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10]     }, -- agoge_calligae_+1
    [576] = {trade = {relicTrade[ 6] + 2,  dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 2 }, -- hesychasts_crown_+1
    [577] = {trade = {relicTrade[ 7] + 2,  dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 2 }, -- hesychasts_cyclas_+1
    [578] = {trade = {relicTrade[ 8] + 2,  dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 2 }, -- hesychasts_gloves_+1
    [579] = {trade = {relicTrade[ 9] + 2,  dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 2 }, -- hesychasts_hose_+1
    [580] = {trade = {relicTrade[10] + 2,  dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 2 }, -- hesychasts_gaiters_+1
    [581] = {trade = {relicTrade[ 6] + 4,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 4 }, -- piety_cap_+1
    [582] = {trade = {relicTrade[ 7] + 4,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 4 }, -- piety_briault_+1
    [583] = {trade = {relicTrade[ 8] + 4,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 4 }, -- piety_mitts_+1
    [584] = {trade = {relicTrade[ 9] + 4,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 4 }, -- piety_pantaloons_+1
    [585] = {trade = {relicTrade[10] + 4,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 4 }, -- piety_duckbills_+1
    [586] = {trade = {relicTrade[ 6] + 6,  dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 6 }, -- archmages_petasos_+1
    [587] = {trade = {relicTrade[ 7] + 6,  dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 6 }, -- archmages_coat_+1
    [588] = {trade = {relicTrade[ 8] + 6,  dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 6 }, -- archmages_gloves_+1
    [589] = {trade = {relicTrade[ 9] + 6,  dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 6 }, -- archmages_tonban_+1
    [590] = {trade = {relicTrade[10] + 6,  dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 6 }, -- archmages_sabots_+1
    [591] = {trade = {relicTrade[ 6] + 8,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 8 }, -- vitiation_chapeau_+1
    [592] = {trade = {relicTrade[ 7] + 8,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 8 }, -- vitiation_tabard_+1
    [593] = {trade = {relicTrade[ 8] + 8,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 8 }, -- vitiation_gloves_+1
    [594] = {trade = {relicTrade[ 9] + 8,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 8 }, -- vitiation_tights_+1
    [595] = {trade = {relicTrade[10] + 8,  dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 8 }, -- vitiation_boots_+1
    [596] = {trade = {relicTrade[ 6] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 10}, -- plunderers_bonnet_+1
    [597] = {trade = {relicTrade[ 7] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 10}, -- plunderers_vest_+1
    [598] = {trade = {relicTrade[ 8] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 10}, -- plunderers_armlets_+1
    [599] = {trade = {relicTrade[ 9] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 10}, -- plunderers_culottes_+1
    [600] = {trade = {relicTrade[10] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 10}, -- plunderers_poulaines_+1
    [601] = {trade = {relicTrade[ 6] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 12}, -- caballarius_coronet_+1
    [602] = {trade = {relicTrade[ 7] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 12}, -- caballarius_surcoat_+1
    [603] = {trade = {relicTrade[ 8] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 12}, -- caballarius_gauntlets_+1
    [604] = {trade = {relicTrade[ 9] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 12}, -- caballarius_breeches_+1
    [605] = {trade = {relicTrade[10] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 12}, -- caballarius_leggings_+1
    [606] = {trade = {relicTrade[ 6] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 14}, -- fallens_burgeonet_+1
    [607] = {trade = {relicTrade[ 7] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 14}, -- fallens_cuirass_+1
    [608] = {trade = {relicTrade[ 8] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 14}, -- fallens_finger_gauntlets_+1
    [609] = {trade = {relicTrade[ 9] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 14}, -- fallens_flanchard_+1
    [610] = {trade = {relicTrade[10] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 14}, -- fallens_sollerets_+1
    [611] = {trade = {relicTrade[ 6] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 16}, -- ankusa_helm_+1
    [612] = {trade = {relicTrade[ 7] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 16}, -- ankusa_jackcoat_+1
    [613] = {trade = {relicTrade[ 8] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 16}, -- ankusa_gloves_+1
    [614] = {trade = {relicTrade[ 9] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 16}, -- ankusa_trousers_+1
    [615] = {trade = {relicTrade[10] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 16}, -- ankusa_gaiters_+1
    [616] = {trade = {relicTrade[ 6] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 18}, -- bihu_roundlet_+1
    [617] = {trade = {relicTrade[ 7] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 18}, -- bihu_justaucorps_+1
    [618] = {trade = {relicTrade[ 8] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 18}, -- bihu_cuffs_+1
    [619] = {trade = {relicTrade[ 9] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 18}, -- bihu_cannions_+1
    [620] = {trade = {relicTrade[10] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 18}, -- bihu_slippers_+1
    [621] = {trade = {relicTrade[ 6] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 20}, -- arcadian_beret_+1
    [622] = {trade = {relicTrade[ 7] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 20}, -- arcadian_jerkin_+1
    [623] = {trade = {relicTrade[ 8] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 20}, -- arcadian_bracers_+1
    [624] = {trade = {relicTrade[ 9] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 20}, -- arcadian_braccae_+1
    [625] = {trade = {relicTrade[10] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 20}, -- arcadian_socks_+1
    [626] = {trade = {relicTrade[ 6] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 22}, -- sakonji_kabuto_+1
    [627] = {trade = {relicTrade[ 7] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 22}, -- sakonji_domaru_+1
    [628] = {trade = {relicTrade[ 8] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 22}, -- sakonji_kote_+1
    [629] = {trade = {relicTrade[ 9] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 22}, -- sakonji_haidate_+1
    [630] = {trade = {relicTrade[10] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 22}, -- sakonji_sune-ate_+1
    [631] = {trade = {relicTrade[ 6] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 24}, -- mochizuki_hatsuburi_+1
    [632] = {trade = {relicTrade[ 7] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 24}, -- mochizuki_chainmail_+1
    [633] = {trade = {relicTrade[ 8] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 24}, -- mochizuki_tekko_+1
    [634] = {trade = {relicTrade[ 9] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 24}, -- mochizuki_hakama_+1
    [635] = {trade = {relicTrade[10] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 24}, -- mochizuki_kyahan_+1
    [636] = {trade = {relicTrade[ 6] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 26}, -- pteroslaver_armet_+1
    [637] = {trade = {relicTrade[ 7] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 26}, -- pteroslaver_mail_+1
    [638] = {trade = {relicTrade[ 8] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 26}, -- pteroslaver_finger_gauntlets_+1
    [639] = {trade = {relicTrade[ 9] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 26}, -- pteroslaver_brais_+1
    [640] = {trade = {relicTrade[10] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 26}, -- pteroslaver_greaves_+1
    [641] = {trade = {relicTrade[ 6] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 28}, -- glyphic_horn_+1
    [642] = {trade = {relicTrade[ 7] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 28}, -- glyphic_doublet_+1
    [643] = {trade = {relicTrade[ 8] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 28}, -- glyphic_bracers_+1
    [644] = {trade = {relicTrade[ 9] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 28}, -- glyphic_spats_+1
    [645] = {trade = {relicTrade[10] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 28}, -- glyphic_pigaches_+1
    [646] = {trade = {relicTrade[ 6] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 30}, -- luhlaza_keffiyeh_+1
    [647] = {trade = {relicTrade[ 7] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 30}, -- luhlaza_jubbah_+1
    [648] = {trade = {relicTrade[ 8] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 30}, -- luhlaza_bazubands_+1
    [649] = {trade = {relicTrade[ 9] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 30}, -- luhlaza_shalwar_+1
    [650] = {trade = {relicTrade[10] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 30}, -- luhlaza_charuqs_+1
    [651] = {trade = {relicTrade[ 6] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 32}, -- lanun_tricorne_+1
    [652] = {trade = {relicTrade[ 7] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 32}, -- lanun_frac_+1
    [653] = {trade = {relicTrade[ 8] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 32}, -- lanun_gants_+1
    [654] = {trade = {relicTrade[ 9] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 32}, -- lanun_trews_+1
    [655] = {trade = {relicTrade[10] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 32}, -- lanun_bottes_+1
    [656] = {trade = {relicTrade[ 6] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 34}, -- pitre_taj_+1
    [657] = {trade = {relicTrade[ 7] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 34}, -- pitre_tobe_+1
    [658] = {trade = {relicTrade[ 8] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 34}, -- pitre_dastanas_+1
    [659] = {trade = {relicTrade[ 9] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 34}, -- pitre_churidars_+1
    [660] = {trade = {relicTrade[10] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 34}, -- pitre_babouches_+1
    [661] = {trade = {relicTrade[ 6] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 36}, -- horos_tiara_+1
    [662] = {trade = {relicTrade[ 7] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 36}, -- horos_casaque_+1
    [663] = {trade = {relicTrade[ 8] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 36}, -- horos_bangles_+1
    [664] = {trade = {relicTrade[ 9] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 36}, -- horos_tights_+1
    [665] = {trade = {relicTrade[10] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 36}, -- horos_shoes_+1
    [666] = {trade = {relicTrade[ 6] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 38}, -- pedagogy_mortarboard_+1
    [667] = {trade = {relicTrade[ 7] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 38}, -- pedagogy_gown_+1
    [668] = {trade = {relicTrade[ 8] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 38}, -- pedagogy_bracers_+1
    [669] = {trade = {relicTrade[ 9] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[ 9] + 38}, -- pedagogy_pants_+1
    [670] = {trade = {relicTrade[10] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 38}, -- pedagogy_loafers_+1
    [671] = {trade = {relicTrade[ 6] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 40}, -- bagua_galero_+1
    [672] = {trade = {relicTrade[ 7] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 40}, -- bagua_tunic_+1
    [673] = {trade = {relicTrade[ 8] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 40}, -- bagua_mitaines_+1
    [674] = {trade = {relicTrade[ 9] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[ 9] + 40}, -- bagua_pants_+1
    [675] = {trade = {relicTrade[10] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 40}, -- bagua_sandals_+1
    [676] = {trade = {relicTrade[ 6] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 7]}, reward = relicReward[ 6] + 42}, -- futhark_bandeau_+1
    [677] = {trade = {relicTrade[ 7] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 8]}, reward = relicReward[ 7] + 42}, -- futhark_coat_+1
    [678] = {trade = {relicTrade[ 8] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[ 9]}, reward = relicReward[ 8] + 42}, -- futhark_mitons_+1
    [679] = {trade = {relicTrade[ 9] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[ 9] + 42}, -- futhark_trousers_+1
    [680] = {trade = {relicTrade[10] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 42}, -- futhark_boots_+1
    -- Reforged Relic Armor +2 (119)
    [681] = {trade = {relicTrade[11],      {9544, 5}, moonbowMats[1], {1451, 3}        }, reward = 23063}, -- Agoge Mask +2
    [682] = {trade = {relicTrade[12],      {9588, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23130}, -- Agoge Lorica +2
    [683] = {trade = {relicTrade[13],      {9632, 5}, moonbowMats[3], {1454, 3}        }, reward = 23197}, -- Agoge Mufflers +2
    [684] = {trade = {relicTrade[14],      {9676, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23264}, -- Agoge Cuisses +2
    [685] = {trade = {relicTrade[15],      {9720, 5}, moonbowMats[5], {1457, 3}        }, reward = 23331}, -- Agoge Calligae +2
    [686] = {trade = {relicTrade[11] + 2,  {9545, 5}, moonbowMats[1], {1451, 3}        }, reward = 23064}, -- Hesychast's Crown +2
    [687] = {trade = {relicTrade[12] + 2,  {9589, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23131}, -- Hesychast's Cyclas +2
    [688] = {trade = {relicTrade[13] + 2,  {9633, 5}, moonbowMats[3], {1454, 3}        }, reward = 23198}, -- Hesychast's Gloves +2
    [689] = {trade = {relicTrade[14] + 2,  {9677, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23265}, -- Hesychast's Hose +2
    [690] = {trade = {relicTrade[15] + 2,  {9721, 5}, moonbowMats[5], {1457, 3}        }, reward = 23332}, -- Hesychast's Gaiters +2
    [691] = {trade = {relicTrade[11] + 4,  {9546, 5}, moonbowMats[1], {1451, 3}        }, reward = 23065}, -- Piety Cap +2
    [692] = {trade = {relicTrade[12] + 4,  {9590, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23132}, -- Piety Briault +2
    [693] = {trade = {relicTrade[13] + 4,  {9634, 5}, moonbowMats[3], {1454, 3}        }, reward = 23199}, -- Piety Mitts +2
    [694] = {trade = {relicTrade[14] + 4,  {9678, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23266}, -- Piety Pantaloons +2
    [695] = {trade = {relicTrade[15] + 4,  {9722, 5}, moonbowMats[5], {1457, 3}        }, reward = 23333}, -- Piety Duckbills +2
    [696] = {trade = {relicTrade[11] + 6,  {9547, 5}, moonbowMats[1], {1451, 3}        }, reward = 23066}, -- Archmage's Petasos +2
    [697] = {trade = {relicTrade[12] + 6,  {9591, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23133}, -- Archmage's Coat +2
    [698] = {trade = {relicTrade[13] + 6,  {9635, 5}, moonbowMats[3], {1454, 3}        }, reward = 23200}, -- Archmage's gloves +2
    [699] = {trade = {relicTrade[14] + 6,  {9679, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23267}, -- Archmage's Tonban +2
    [700] = {trade = {relicTrade[15] + 6,  {9723, 5}, moonbowMats[5], {1457, 3}        }, reward = 23334}, -- Archmage's Sabots +2
    [701] = {trade = {relicTrade[11] + 8,  {9548, 5}, moonbowMats[1], {1451, 3}        }, reward = 23067}, -- Vitiation Chapeau +2
    [702] = {trade = {relicTrade[12] + 8,  {9592, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23134}, -- Vitiation Tabard +2
    [703] = {trade = {relicTrade[13] + 8,  {9636, 5}, moonbowMats[3], {1454, 3}        }, reward = 23201}, -- Vitiation Gloves +2
    [704] = {trade = {relicTrade[14] + 8,  {9680, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23268}, -- Vitiation Tights +2
    [705] = {trade = {relicTrade[15] + 8,  {9724, 5}, moonbowMats[5], {1457, 3}        }, reward = 23335}, -- Vitiation Boots +2
    [706] = {trade = {relicTrade[11] + 10, {9549, 5}, moonbowMats[1], {1451, 3}        }, reward = 23068}, -- Plunderer's Bonnet +2
    [707] = {trade = {relicTrade[12] + 10, {9593, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23135}, -- Plunderer's Vest +2
    [708] = {trade = {relicTrade[13] + 10, {9637, 5}, moonbowMats[3], {1454, 3}        }, reward = 23202}, -- Plunderer's Armlets +2
    [709] = {trade = {relicTrade[14] + 10, {9681, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23269}, -- Plunderer's Culottes +2
    [710] = {trade = {relicTrade[15] + 10, {9725, 5}, moonbowMats[5], {1457, 3}        }, reward = 23336}, -- Plunderer's Poulaines +2
    [711] = {trade = {relicTrade[11] + 12, {9550, 5}, moonbowMats[1], {1451, 3}        }, reward = 23069}, -- Caballarius Coronet +2
    [712] = {trade = {relicTrade[12] + 12, {9594, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23136}, -- Caballarius Surcoat +2
    [713] = {trade = {relicTrade[13] + 12, {9638, 5}, moonbowMats[3], {1454, 3}        }, reward = 23203}, -- Caballarius Gauntlets +2
    [714] = {trade = {relicTrade[14] + 12, {9682, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23270}, -- Caballarius Breeches +2
    [715] = {trade = {relicTrade[15] + 12, {9726, 5}, moonbowMats[5], {1457, 3}        }, reward = 23337}, -- Caballarius Leggings +2
    [716] = {trade = {relicTrade[11] + 14, {9551, 5}, moonbowMats[1], {1451, 3}        }, reward = 23070}, -- Fallen's Burgeonet +2
    [717] = {trade = {relicTrade[12] + 14, {9595, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23137}, -- Fallen's Cuirass +2
    [718] = {trade = {relicTrade[13] + 14, {9639, 5}, moonbowMats[3], {1454, 3}        }, reward = 23204}, -- Fallen's Finger Gauntlets +2
    [719] = {trade = {relicTrade[14] + 14, {9683, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23271}, -- Fallen's Flanchard +2
    [720] = {trade = {relicTrade[15] + 14, {9727, 5}, moonbowMats[5], {1457, 3}        }, reward = 23338}, -- Fallen's Sollerets +2
    [721] = {trade = {relicTrade[11] + 16, {9552, 5}, moonbowMats[1], {1451, 3}        }, reward = 23071}, -- Ankusa Helm +2
    [722] = {trade = {relicTrade[12] + 16, {9596, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23138}, -- Ankusa Jackcoat +2
    [723] = {trade = {relicTrade[13] + 16, {9640, 5}, moonbowMats[3], {1454, 3}        }, reward = 23205}, -- Ankusa Gloves +2
    [724] = {trade = {relicTrade[14] + 16, {9684, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23272}, -- Ankusa Trousers +2
    [725] = {trade = {relicTrade[15] + 16, {9728, 5}, moonbowMats[5], {1457, 3}        }, reward = 23339}, -- Ankusa Gaiters +2
    [726] = {trade = {relicTrade[11] + 18, {9553, 5}, moonbowMats[1], {1451, 3}        }, reward = 23072}, -- Bihu Roundlet +2
    [727] = {trade = {relicTrade[12] + 18, {9597, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23139}, -- Bihu Justaucorps +2
    [728] = {trade = {relicTrade[13] + 18, {9641, 5}, moonbowMats[3], {1454, 3}        }, reward = 23206}, -- Bihu Cuffs +2
    [729] = {trade = {relicTrade[14] + 18, {9685, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23273}, -- Bihu Cannions +2
    [730] = {trade = {relicTrade[15] + 18, {9729, 5}, moonbowMats[5], {1457, 3}        }, reward = 23340}, -- Bihu Slippers +2
    [731] = {trade = {relicTrade[11] + 20, {9554, 5}, moonbowMats[1], {1451, 3}        }, reward = 23073}, -- Arcadian Beret +2
    [732] = {trade = {relicTrade[12] + 20, {9598, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23140}, -- Arcadian Jerkin +2
    [733] = {trade = {relicTrade[13] + 20, {9642, 5}, moonbowMats[3], {1454, 3}        }, reward = 23207}, -- Arcadian Bracers +2
    [734] = {trade = {relicTrade[14] + 20, {9686, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23274}, -- Arcadian Braccae +2
    [735] = {trade = {relicTrade[15] + 20, {9730, 5}, moonbowMats[5], {1457, 3}        }, reward = 23341}, -- Arcadian Socks +2
    [736] = {trade = {relicTrade[11] + 22, {9555, 5}, moonbowMats[1], {1451, 3}        }, reward = 23074}, -- Sakonji Kabuto +2
    [737] = {trade = {relicTrade[12] + 22, {9599, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23141}, -- Sakonji Domaru +2
    [738] = {trade = {relicTrade[13] + 22, {9643, 5}, moonbowMats[3], {1454, 3}        }, reward = 23208}, -- Sakonji Kote +2
    [739] = {trade = {relicTrade[14] + 22, {9687, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23275}, -- Sakonji Haidate +2
    [740] = {trade = {relicTrade[15] + 22, {9731, 5}, moonbowMats[5], {1457, 3}        }, reward = 23342}, -- Sakonji Sune-Ate +2
    [741] = {trade = {relicTrade[11] + 24, {9556, 5}, moonbowMats[1], {1451, 3}        }, reward = 23075}, -- Mochizuki Hatsuburi +2
    [742] = {trade = {relicTrade[12] + 24, {9600, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23142}, -- Mochizuki Chainmail +2
    [743] = {trade = {relicTrade[13] + 24, {9644, 5}, moonbowMats[3], {1454, 3}        }, reward = 23209}, -- Mochizuki Tekko +2
    [744] = {trade = {relicTrade[14] + 24, {9688, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23276}, -- Mochizuki Hakama +2
    [745] = {trade = {relicTrade[15] + 24, {9732, 5}, moonbowMats[5], {1457, 3}        }, reward = 23343}, -- Mochizuki Kyahan +2
    [746] = {trade = {relicTrade[11] + 26, {9557, 5}, moonbowMats[1], {1451, 3}        }, reward = 23076}, -- Pteroslaver Armet +2
    [747] = {trade = {relicTrade[12] + 26, {9601, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23143}, -- Pteroslaver Mail +2
    [748] = {trade = {relicTrade[13] + 26, {9645, 5}, moonbowMats[3], {1454, 3}        }, reward = 23210}, -- Pteroslaver Finger Gauntlets +2
    [749] = {trade = {relicTrade[14] + 26, {9689, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23277}, -- Pteroslaver Brais +2
    [750] = {trade = {relicTrade[15] + 26, {9733, 5}, moonbowMats[5], {1457, 3}        }, reward = 23344}, -- Pteroslaver Greaves +2
    [751] = {trade = {relicTrade[11] + 28, {9558, 5}, moonbowMats[1], {1451, 3}        }, reward = 23077}, -- Glyphic Horn +2
    [752] = {trade = {relicTrade[12] + 28, {9602, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23144}, -- Glyphic Doublet +2
    [753] = {trade = {relicTrade[13] + 28, {9646, 5}, moonbowMats[3], {1454, 3}        }, reward = 23211}, -- Glyphic Bracers +2
    [754] = {trade = {relicTrade[14] + 28, {9690, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23278}, -- Glyphic Spats +2
    [755] = {trade = {relicTrade[15] + 28, {9734, 5}, moonbowMats[5], {1457, 3}        }, reward = 23345}, -- Glyphic Pigaches +2
    [756] = {trade = {relicTrade[11] + 30, {9559, 5}, moonbowMats[1], {1451, 3}        }, reward = 23078}, -- Luhlaza Keffiyeh +2
    [757] = {trade = {relicTrade[12] + 30, {9603, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23145}, -- Luhlaza Jubbah +2
    [758] = {trade = {relicTrade[13] + 30, {9647, 5}, moonbowMats[3], {1454, 3}        }, reward = 23212}, -- Luhlaza Bazubands +2
    [759] = {trade = {relicTrade[14] + 30, {9691, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23279}, -- Luhlaza Shalwar +2
    [760] = {trade = {relicTrade[15] + 30, {9735, 5}, moonbowMats[5], {1457, 3}        }, reward = 23346}, -- Luhlaza Charuqs +2
    [761] = {trade = {relicTrade[11] + 32, {9560, 5}, moonbowMats[1], {1451, 3}        }, reward = 23079}, -- Lanun Tricorne +2
    [762] = {trade = {relicTrade[12] + 32, {9604, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23146}, -- Lanun Frac +2
    [763] = {trade = {relicTrade[13] + 32, {9648, 5}, moonbowMats[3], {1454, 3}        }, reward = 23213}, -- Lanun Gants +2
    [764] = {trade = {relicTrade[14] + 32, {9692, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23280}, -- Lanun Trews +2
    [765] = {trade = {relicTrade[15] + 32, {9736, 5}, moonbowMats[5], {1457, 3}        }, reward = 23347}, -- Lanun bottes +2
    [766] = {trade = {relicTrade[11] + 34, {9561, 5}, moonbowMats[1], {1451, 3}        }, reward = 23080}, -- Pitre Taj +2
    [767] = {trade = {relicTrade[12] + 34, {9605, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23147}, -- Pitre Tobe +2
    [768] = {trade = {relicTrade[13] + 34, {9649, 5}, moonbowMats[3], {1454, 3}        }, reward = 23214}, -- Pitre Dastanas +2
    [769] = {trade = {relicTrade[14] + 34, {9693, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23281}, -- Pitre Churidars +2
    [770] = {trade = {relicTrade[15] + 34, {9737, 5}, moonbowMats[5], {1457, 3}        }, reward = 23348}, -- Pitre Babouches +2
    [771] = {trade = {relicTrade[11] + 36, {9562, 5}, moonbowMats[1], {1451, 3}        }, reward = 23081}, -- Horos Tiara +2
    [772] = {trade = {relicTrade[12] + 36, {9606, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23148}, -- Horos Casaque +2
    [773] = {trade = {relicTrade[13] + 36, {9650, 5}, moonbowMats[3], {1454, 3}        }, reward = 23215}, -- Horos Bangles +2
    [774] = {trade = {relicTrade[14] + 36, {9694, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23282}, -- Horos Tights +2
    [775] = {trade = {relicTrade[15] + 36, {9738, 5}, moonbowMats[5], {1457, 3}        }, reward = 23349}, -- Horos Toe Shoes +2
    [776] = {trade = {relicTrade[11] + 38, {9563, 5}, moonbowMats[1], {1451, 3}        }, reward = 23082}, -- Pedagogy Mortarboard +2
    [777] = {trade = {relicTrade[12] + 38, {9607, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23149}, -- Pedagogy Gown +2
    [778] = {trade = {relicTrade[13] + 38, {9651, 5}, moonbowMats[3], {1454, 3}        }, reward = 23216}, -- Pedagogy Bracers +2
    [779] = {trade = {relicTrade[14] + 38, {9695, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23283}, -- Pedagogy Pants +2
    [780] = {trade = {relicTrade[15] + 38, {9739, 5}, moonbowMats[5], {1457, 3}        }, reward = 23350}, -- Pedagogy Loafers +2
    [781] = {trade = {relicTrade[11] + 40, {9564, 5}, moonbowMats[1], {1451, 3}        }, reward = 23083}, -- Bagua Galero +2
    [782] = {trade = {relicTrade[12] + 40, {9608, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23150}, -- Bagua Tunic +2
    [783] = {trade = {relicTrade[13] + 40, {9652, 5}, moonbowMats[3], {1454, 3}        }, reward = 23217}, -- Bagua Mitaines +2
    [784] = {trade = {relicTrade[14] + 40, {9696, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23284}, -- Bagua Pants +2
    [785] = {trade = {relicTrade[15] + 40, {9740, 5}, moonbowMats[5], {1457, 3}        }, reward = 23351}, -- Bagua Sandals +2
    [786] = {trade = {relicTrade[11] + 42, {9565, 5}, moonbowMats[1], {1451, 3}        }, reward = 23084}, -- Futhark Bandeau +2
    [787] = {trade = {relicTrade[12] + 42, {9609, 5}, moonbowMats[2],  1451, 1454, 1457}, reward = 23151}, -- Futhark Coat +2
    [788] = {trade = {relicTrade[13] + 42, {9653, 5}, moonbowMats[3], {1454, 3}        }, reward = 23218}, -- Futhark Mitons +2
    [789] = {trade = {relicTrade[14] + 42, {9697, 5}, moonbowMats[4],  1451, 1454, 1457}, reward = 23285}, -- Futhark Trousers +2
    [790] = {trade = {relicTrade[15] + 42, {9741, 5}, moonbowMats[5], {1457, 3}        }, reward = 23352}, -- Futhark Boots +2
    -- Reforged Relic Armor +3 (119) (Slots 791-900 reserved)
}

-----------------------------------
-- Reforged Empyrean Materials
-----------------------------------

-- HQ+2 Emp  - Ravager's Mask +2, Ravager's Lorica +2, Ravager's Mufflers +2, Ravager's Cuisses +2, Ravager's Calligae +2,
-- NQ REmp   - Boii Mask, Boii Lorica, Boii Mufflers, Boii Cuisses, Boii Calligae
-- HQ+1 REmp - Boii Mask +1, Boii Lorica +1, Boii Mufflers +1, Boii Cuisses +1, Boii Calligae +1
-- HQ+2 REmp - Boii Mask +2, Boii Lorica +2, Boii Mufflers +2, Boii Cuisses +2, Boii Calligae +2
local empTrade =
{
    11064, 11084, 11104, 11124, 11144,
    26740, 26898, 27052, 27237, 27411,
}

-- Ravager's Seal: Head x8, Ravager's Seal: Body x8, Ravager's Seal: Hands x8, Ravager's Seal: Legs x8, Ravager's Seal: Feet x8
-- Purple Spriggan Spirit x8, Pachypodium Spirit x8, Ake-Ome Spirit x8, Bottle of Star Sprinkles x8, Chestnut Tree Sap x8
-- Red Spriggan Spirit x8, Beetle Spirit x8, Antlion Spirit x8, Monarch Beetle Saliva x8, Dragoneye x8
local empSeals =
{
    3110, 3130, 3150, 3170, 3190,
    8760, 4056, 8736, 8737, 3986,
    8761, 4054, 4055, 3985, 4048,
}

-- Bakka's Wing, Balaur Skull, Lieje Lantern, Chasmic Stinger, Keesha's Pamama, Marvin's Pelage,
-- Mikey's Nugget, Chukwa's Egg, Cuelebre's Horn, Mictlantecuhtli's Habit, Manananggal's Necklet
local empTradeMaterial =
{
    2938, 2943, 2944, 2936, 2941, 2935,
    2942, 2933, 2939, 2940, 2934,
}

-- Briareus Helm, Glavoid Shell, Kukulkan Fang, Carabosse Gem, 2-Leaf Chloris Bud
local empBossItem =
{
    2929, 2927, 2932, 2930, 2928,
}

-- Boii Mask, Boii Lorica, Boii Mufflers, Boii Cuisses, Boii Calligae
-- Boii Mask +1, Boii Lorica +1, Boii Mufflers +1, Boii Cuisses +1, Boii Calligae +1
local empReward =
{
    26740, 26898, 27052, 27237, 27411,
    26741, 26899, 27053, 27238, 27412,
}

-----------------------------------
-- Empyrean armor upgrade data
-----------------------------------
local reforgedEmpyreanArmor =
{
    -- -- Reforged Empyrean Armor (109)
    [ 901] = {trade = {empTrade[1],      {empSeals[1],      8}, empTradeMaterial[ 6], empBossItem[1]}, reward = empReward[1]     }, -- boii_mask
    [ 902] = {trade = {empTrade[2],      {empSeals[2],      8}, empTradeMaterial[ 6], empBossItem[2]}, reward = empReward[2]     }, -- boii_lorica
    [ 903] = {trade = {empTrade[3],      {empSeals[3],      8}, empTradeMaterial[ 6], empBossItem[3]}, reward = empReward[3]     }, -- boii_mufflers
    [ 904] = {trade = {empTrade[4],      {empSeals[4],      8}, empTradeMaterial[ 6], empBossItem[4]}, reward = empReward[4]     }, -- boii_cuisses
    [ 905] = {trade = {empTrade[5],      {empSeals[5],      8}, empTradeMaterial[ 6], empBossItem[5]}, reward = empReward[5]     }, -- boii_calligae
    [ 906] = {trade = {empTrade[1] + 1,  {empSeals[1] + 1,  8}, empTradeMaterial[ 5], empBossItem[1]}, reward = empReward[1] + 2 }, -- bhikku_crown
    [ 907] = {trade = {empTrade[2] + 1,  {empSeals[2] + 1,  8}, empTradeMaterial[ 5], empBossItem[2]}, reward = empReward[2] + 2 }, -- bhikku_cyclas
    [ 908] = {trade = {empTrade[3] + 1,  {empSeals[3] + 1,  8}, empTradeMaterial[ 5], empBossItem[3]}, reward = empReward[3] + 2 }, -- bhikku_gloves
    [ 909] = {trade = {empTrade[4] + 1,  {empSeals[4] + 1,  8}, empTradeMaterial[ 5], empBossItem[4]}, reward = empReward[4] + 2 }, -- bhikku_hose
    [ 910] = {trade = {empTrade[5] + 1,  {empSeals[5] + 1,  8}, empTradeMaterial[ 5], empBossItem[5]}, reward = empReward[5] + 2 }, -- bhikku_gaiters
    [ 911] = {trade = {empTrade[1] + 2,  {empSeals[1] + 2,  8}, empTradeMaterial[ 1], empBossItem[1]}, reward = empReward[1] + 4 }, -- ebers_cap
    [ 912] = {trade = {empTrade[2] + 2,  {empSeals[2] + 2,  8}, empTradeMaterial[ 1], empBossItem[2]}, reward = empReward[2] + 4 }, -- ebers_bliaud
    [ 913] = {trade = {empTrade[3] + 2,  {empSeals[3] + 2,  8}, empTradeMaterial[ 1], empBossItem[3]}, reward = empReward[3] + 4 }, -- ebers_mitts
    [ 914] = {trade = {empTrade[4] + 2,  {empSeals[4] + 2,  8}, empTradeMaterial[ 1], empBossItem[4]}, reward = empReward[4] + 4 }, -- ebers_pantaloons
    [ 915] = {trade = {empTrade[5] + 2,  {empSeals[5] + 2,  8}, empTradeMaterial[ 1], empBossItem[5]}, reward = empReward[5] + 4 }, -- ebers_duckbills
    [ 916] = {trade = {empTrade[1] + 3,  {empSeals[1] + 3,  8}, empTradeMaterial[ 3], empBossItem[1]}, reward = empReward[1] + 6 }, -- wicce_petasos
    [ 917] = {trade = {empTrade[2] + 3,  {empSeals[2] + 3,  8}, empTradeMaterial[ 3], empBossItem[2]}, reward = empReward[2] + 6 }, -- wicce_coat
    [ 918] = {trade = {empTrade[3] + 3,  {empSeals[3] + 3,  8}, empTradeMaterial[ 3], empBossItem[3]}, reward = empReward[3] + 6 }, -- wicce_gloves
    [ 919] = {trade = {empTrade[4] + 3,  {empSeals[4] + 3,  8}, empTradeMaterial[ 3], empBossItem[4]}, reward = empReward[4] + 6 }, -- wicce_chausses
    [ 920] = {trade = {empTrade[5] + 3,  {empSeals[5] + 3,  8}, empTradeMaterial[ 3], empBossItem[5]}, reward = empReward[5] + 6 }, -- wicce_sabots
    [ 921] = {trade = {empTrade[1] + 4,  {empSeals[1] + 4,  8}, empTradeMaterial[11], empBossItem[1]}, reward = empReward[1] + 8 }, -- lethargy_chappel
    [ 922] = {trade = {empTrade[2] + 4,  {empSeals[2] + 4,  8}, empTradeMaterial[11], empBossItem[2]}, reward = empReward[2] + 8 }, -- lethargy_sayon
    [ 923] = {trade = {empTrade[3] + 4,  {empSeals[3] + 4,  8}, empTradeMaterial[11], empBossItem[3]}, reward = empReward[3] + 8 }, -- lethargy_gantherots
    [ 924] = {trade = {empTrade[4] + 4,  {empSeals[4] + 4,  8}, empTradeMaterial[11], empBossItem[4]}, reward = empReward[4] + 8 }, -- lethargy_fuseau
    [ 925] = {trade = {empTrade[5] + 4,  {empSeals[5] + 4,  8}, empTradeMaterial[11], empBossItem[5]}, reward = empReward[5] + 8 }, -- lethargy_houseaux
    [ 926] = {trade = {empTrade[1] + 5,  {empSeals[1] + 5,  8}, empTradeMaterial[ 4], empBossItem[1]}, reward = empReward[1] + 10}, -- skulkers_bonnet
    [ 927] = {trade = {empTrade[2] + 5,  {empSeals[2] + 5,  8}, empTradeMaterial[ 4], empBossItem[2]}, reward = empReward[2] + 10}, -- skulkers_vest
    [ 928] = {trade = {empTrade[3] + 5,  {empSeals[3] + 5,  8}, empTradeMaterial[ 4], empBossItem[3]}, reward = empReward[3] + 10}, -- skulkers_armlets
    [ 929] = {trade = {empTrade[4] + 5,  {empSeals[4] + 5,  8}, empTradeMaterial[ 4], empBossItem[4]}, reward = empReward[4] + 10}, -- skulkers_culottes
    [ 930] = {trade = {empTrade[5] + 5,  {empSeals[5] + 5,  8}, empTradeMaterial[ 4], empBossItem[5]}, reward = empReward[5] + 10}, -- skulkers_poulaines
    [ 931] = {trade = {empTrade[1] + 6,  {empSeals[1] + 6,  8}, empTradeMaterial[ 8], empBossItem[1]}, reward = empReward[1] + 12}, -- chevaliers_armet
    [ 932] = {trade = {empTrade[2] + 6,  {empSeals[2] + 6,  8}, empTradeMaterial[ 8], empBossItem[2]}, reward = empReward[2] + 12}, -- chevaliers_cuirass
    [ 933] = {trade = {empTrade[3] + 6,  {empSeals[3] + 6,  8}, empTradeMaterial[ 8], empBossItem[3]}, reward = empReward[3] + 12}, -- chevaliers_gauntlets
    [ 934] = {trade = {empTrade[4] + 6,  {empSeals[4] + 6,  8}, empTradeMaterial[ 8], empBossItem[4]}, reward = empReward[4] + 12}, -- chevaliers_cuisses
    [ 935] = {trade = {empTrade[5] + 6,  {empSeals[5] + 6,  8}, empTradeMaterial[ 8], empBossItem[5]}, reward = empReward[5] + 12}, -- chevaliers_sabatons
    [ 936] = {trade = {empTrade[1] + 7,  {empSeals[1] + 7,  8}, empTradeMaterial[ 3], empBossItem[1]}, reward = empReward[1] + 14}, -- heathens_burgeonet
    [ 937] = {trade = {empTrade[2] + 7,  {empSeals[2] + 7,  8}, empTradeMaterial[ 3], empBossItem[2]}, reward = empReward[2] + 14}, -- heathens_cuirass
    [ 938] = {trade = {empTrade[3] + 7,  {empSeals[3] + 7,  8}, empTradeMaterial[ 3], empBossItem[3]}, reward = empReward[3] + 14}, -- heathens_gauntlets
    [ 939] = {trade = {empTrade[4] + 7,  {empSeals[4] + 7,  8}, empTradeMaterial[ 3], empBossItem[4]}, reward = empReward[4] + 14}, -- heathens_flanchard
    [ 940] = {trade = {empTrade[5] + 7,  {empSeals[5] + 7,  8}, empTradeMaterial[ 3], empBossItem[5]}, reward = empReward[5] + 14}, -- heathens_sollerets
    [ 941] = {trade = {empTrade[1] + 8,  {empSeals[1] + 8,  8}, empTradeMaterial[ 6], empBossItem[1]}, reward = empReward[1] + 16}, -- nukumi_cabasset
    [ 942] = {trade = {empTrade[2] + 8,  {empSeals[2] + 8,  8}, empTradeMaterial[ 6], empBossItem[2]}, reward = empReward[2] + 16}, -- nukumi_gausape
    [ 943] = {trade = {empTrade[3] + 8,  {empSeals[3] + 8,  8}, empTradeMaterial[ 6], empBossItem[3]}, reward = empReward[3] + 16}, -- nukumi_manoplas
    [ 944] = {trade = {empTrade[4] + 8,  {empSeals[4] + 8,  8}, empTradeMaterial[ 6], empBossItem[4]}, reward = empReward[4] + 16}, -- nukumi_quijotes
    [ 945] = {trade = {empTrade[5] + 8,  {empSeals[5] + 8,  8}, empTradeMaterial[ 6], empBossItem[5]}, reward = empReward[5] + 16}, -- nukumi_ocreae
    [ 946] = {trade = {empTrade[1] + 9,  {empSeals[1] + 9,  8}, empTradeMaterial[ 9], empBossItem[1]}, reward = empReward[1] + 18}, -- fili_calot
    [ 947] = {trade = {empTrade[2] + 9,  {empSeals[2] + 9,  8}, empTradeMaterial[ 9], empBossItem[2]}, reward = empReward[2] + 18}, -- fili_hongreline
    [ 948] = {trade = {empTrade[3] + 9,  {empSeals[3] + 9,  8}, empTradeMaterial[ 9], empBossItem[3]}, reward = empReward[3] + 18}, -- fili_manchettes
    [ 949] = {trade = {empTrade[4] + 9,  {empSeals[4] + 9,  8}, empTradeMaterial[ 9], empBossItem[4]}, reward = empReward[4] + 18}, -- fili_rhingrave
    [ 950] = {trade = {empTrade[5] + 9,  {empSeals[5] + 9,  8}, empTradeMaterial[ 9], empBossItem[5]}, reward = empReward[5] + 18}, -- fili_cothurnes
    [ 951] = {trade = {empTrade[1] + 10, {empSeals[1] + 10, 8}, empTradeMaterial[ 7], empBossItem[1]}, reward = empReward[1] + 20}, -- amini_gapette
    [ 952] = {trade = {empTrade[2] + 10, {empSeals[2] + 10, 8}, empTradeMaterial[ 7], empBossItem[2]}, reward = empReward[2] + 20}, -- amini_caban
    [ 953] = {trade = {empTrade[3] + 10, {empSeals[3] + 10, 8}, empTradeMaterial[ 7], empBossItem[3]}, reward = empReward[3] + 20}, -- amini_glovelettes
    [ 954] = {trade = {empTrade[4] + 10, {empSeals[4] + 10, 8}, empTradeMaterial[ 7], empBossItem[4]}, reward = empReward[4] + 20}, -- amini_brague
    [ 955] = {trade = {empTrade[5] + 10, {empSeals[5] + 10, 8}, empTradeMaterial[ 7], empBossItem[5]}, reward = empReward[5] + 20}, -- amini_bottillons
    [ 956] = {trade = {empTrade[1] + 11, {empSeals[1] + 11, 8}, empTradeMaterial[11], empBossItem[1]}, reward = empReward[1] + 22}, -- kasuga_kabuto
    [ 957] = {trade = {empTrade[2] + 11, {empSeals[2] + 11, 8}, empTradeMaterial[11], empBossItem[2]}, reward = empReward[2] + 22}, -- kasuga_domaru
    [ 958] = {trade = {empTrade[3] + 11, {empSeals[3] + 11, 8}, empTradeMaterial[11], empBossItem[3]}, reward = empReward[3] + 22}, -- kasuga_kote
    [ 959] = {trade = {empTrade[4] + 11, {empSeals[4] + 11, 8}, empTradeMaterial[11], empBossItem[4]}, reward = empReward[4] + 22}, -- kasuga_haidate
    [ 960] = {trade = {empTrade[5] + 11, {empSeals[5] + 11, 8}, empTradeMaterial[11], empBossItem[5]}, reward = empReward[5] + 22}, -- kasuga_sune-ate
    [ 961] = {trade = {empTrade[1] + 12, {empSeals[1] + 12, 8}, empTradeMaterial[ 5], empBossItem[1]}, reward = empReward[1] + 24}, -- hattori_zukin
    [ 962] = {trade = {empTrade[2] + 12, {empSeals[2] + 12, 8}, empTradeMaterial[ 5], empBossItem[2]}, reward = empReward[2] + 24}, -- hattori_ningi
    [ 963] = {trade = {empTrade[3] + 12, {empSeals[3] + 12, 8}, empTradeMaterial[ 5], empBossItem[3]}, reward = empReward[3] + 24}, -- hattori_tekko
    [ 964] = {trade = {empTrade[4] + 12, {empSeals[4] + 12, 8}, empTradeMaterial[ 5], empBossItem[4]}, reward = empReward[4] + 24}, -- hattori_hakama
    [ 965] = {trade = {empTrade[5] + 12, {empSeals[5] + 12, 8}, empTradeMaterial[ 5], empBossItem[5]}, reward = empReward[5] + 24}, -- hattori_kyahan
    [ 966] = {trade = {empTrade[1] + 13, {empSeals[1] + 13, 8}, empTradeMaterial[ 2], empBossItem[1]}, reward = empReward[1] + 26}, -- peltasts_mezail
    [ 967] = {trade = {empTrade[2] + 13, {empSeals[2] + 13, 8}, empTradeMaterial[ 2], empBossItem[2]}, reward = empReward[2] + 26}, -- peltasts_plackart
    [ 968] = {trade = {empTrade[3] + 13, {empSeals[3] + 13, 8}, empTradeMaterial[ 2], empBossItem[3]}, reward = empReward[3] + 26}, -- peltasts_vambraces
    [ 969] = {trade = {empTrade[4] + 13, {empSeals[4] + 13, 8}, empTradeMaterial[ 2], empBossItem[4]}, reward = empReward[4] + 26}, -- peltasts_cuissots
    [ 970] = {trade = {empTrade[5] + 13, {empSeals[5] + 13, 8}, empTradeMaterial[ 2], empBossItem[5]}, reward = empReward[5] + 26}, -- peltasts_schynbalds
    [ 971] = {trade = {empTrade[1] + 14, {empSeals[1] + 14, 8}, empTradeMaterial[10], empBossItem[1]}, reward = empReward[1] + 28}, -- beckoners_horn
    [ 972] = {trade = {empTrade[2] + 14, {empSeals[2] + 14, 8}, empTradeMaterial[10], empBossItem[2]}, reward = empReward[2] + 28}, -- beckoners_doublet
    [ 973] = {trade = {empTrade[3] + 14, {empSeals[3] + 14, 8}, empTradeMaterial[10], empBossItem[3]}, reward = empReward[3] + 28}, -- beckoners_bracers
    [ 974] = {trade = {empTrade[4] + 14, {empSeals[4] + 14, 8}, empTradeMaterial[10], empBossItem[4]}, reward = empReward[4] + 28}, -- beckoners_spats
    [ 975] = {trade = {empTrade[5] + 14, {empSeals[5] + 14, 8}, empTradeMaterial[10], empBossItem[5]}, reward = empReward[5] + 28}, -- beckoners_pigaches
    [ 976] = {trade = {empTrade[1] + 15, {empSeals[1] + 15, 8}, empTradeMaterial[ 2], empBossItem[1]}, reward = empReward[1] + 30}, -- hashishin_kavuk
    [ 977] = {trade = {empTrade[2] + 15, {empSeals[2] + 15, 8}, empTradeMaterial[ 2], empBossItem[2]}, reward = empReward[2] + 30}, -- hashishin_mintan
    [ 978] = {trade = {empTrade[3] + 15, {empSeals[3] + 15, 8}, empTradeMaterial[ 2], empBossItem[3]}, reward = empReward[3] + 30}, -- hashishin_bazubands
    [ 979] = {trade = {empTrade[4] + 15, {empSeals[4] + 15, 8}, empTradeMaterial[ 2], empBossItem[4]}, reward = empReward[4] + 30}, -- hashishin_tayt
    [ 980] = {trade = {empTrade[5] + 15, {empSeals[5] + 15, 8}, empTradeMaterial[ 2], empBossItem[5]}, reward = empReward[5] + 30}, -- hashishin_basmak
    [ 981] = {trade = {empTrade[1] + 16, {empSeals[1] + 16, 8}, empTradeMaterial[ 9], empBossItem[1]}, reward = empReward[1] + 32}, -- chasseurs_tricorne
    [ 982] = {trade = {empTrade[2] + 16, {empSeals[2] + 16, 8}, empTradeMaterial[ 9], empBossItem[2]}, reward = empReward[2] + 32}, -- chasseurs_frac
    [ 983] = {trade = {empTrade[3] + 16, {empSeals[3] + 16, 8}, empTradeMaterial[ 9], empBossItem[3]}, reward = empReward[3] + 32}, -- chasseurs_gants
    [ 984] = {trade = {empTrade[4] + 16, {empSeals[4] + 16, 8}, empTradeMaterial[ 9], empBossItem[4]}, reward = empReward[4] + 32}, -- chasseurs_culottes
    [ 985] = {trade = {empTrade[5] + 16, {empSeals[5] + 16, 8}, empTradeMaterial[ 9], empBossItem[5]}, reward = empReward[5] + 32}, -- chasseurs_bottes
    [ 986] = {trade = {empTrade[1] + 17, {empSeals[1] + 17, 8}, empTradeMaterial[ 7], empBossItem[1]}, reward = empReward[1] + 34}, -- karagoz_capello
    [ 987] = {trade = {empTrade[2] + 17, {empSeals[2] + 17, 8}, empTradeMaterial[ 7], empBossItem[2]}, reward = empReward[2] + 34}, -- karagoz_farsetto
    [ 988] = {trade = {empTrade[3] + 17, {empSeals[3] + 17, 8}, empTradeMaterial[ 7], empBossItem[3]}, reward = empReward[3] + 34}, -- karagoz_guanti
    [ 989] = {trade = {empTrade[4] + 17, {empSeals[4] + 17, 8}, empTradeMaterial[ 7], empBossItem[4]}, reward = empReward[4] + 34}, -- karagoz_pantaloni
    [ 990] = {trade = {empTrade[5] + 17, {empSeals[5] + 17, 8}, empTradeMaterial[ 7], empBossItem[5]}, reward = empReward[5] + 34}, -- karagoz_scarpe
    [ 991] = {trade = {empTrade[1] + 18, {empSeals[1] + 18, 8}, empTradeMaterial[ 4], empBossItem[1]}, reward = empReward[1] + 36}, -- maculele_tiara
    [ 992] = {trade = {empTrade[2] + 18, {empSeals[2] + 18, 8}, empTradeMaterial[ 4], empBossItem[2]}, reward = empReward[2] + 36}, -- maculele_casaque
    [ 993] = {trade = {empTrade[3] + 18, {empSeals[3] + 18, 8}, empTradeMaterial[ 4], empBossItem[3]}, reward = empReward[3] + 36}, -- maculele_bangles
    [ 994] = {trade = {empTrade[4] + 18, {empSeals[4] + 18, 8}, empTradeMaterial[ 4], empBossItem[4]}, reward = empReward[4] + 36}, -- maculele_tights
    [ 995] = {trade = {empTrade[5] + 18, {empSeals[5] + 18, 8}, empTradeMaterial[ 4], empBossItem[5]}, reward = empReward[5] + 36}, -- maculele_toeshoes
    [ 996] = {trade = {empTrade[1] + 19, {empSeals[1] + 19, 8}, empTradeMaterial[ 1], empBossItem[1]}, reward = empReward[1] + 38}, -- arbatel_bonnet
    [ 997] = {trade = {empTrade[2] + 19, {empSeals[2] + 19, 8}, empTradeMaterial[ 1], empBossItem[2]}, reward = empReward[2] + 38}, -- arbatel_gown
    [ 998] = {trade = {empTrade[3] + 19, {empSeals[3] + 19, 8}, empTradeMaterial[ 1], empBossItem[3]}, reward = empReward[3] + 38}, -- arbatel_bracers
    [ 999] = {trade = {empTrade[4] + 19, {empSeals[4] + 19, 8}, empTradeMaterial[ 1], empBossItem[4]}, reward = empReward[4] + 38}, -- arbatel_pants
    [1000] = {trade = {empTrade[5] + 19, {empSeals[5] + 19, 8}, empTradeMaterial[ 1], empBossItem[5]}, reward = empReward[5] + 38}, -- arbatel_loafers
    [1001] = {trade = {{4044, 3},        {empSeals[6],      8}, empTradeMaterial[10], empBossItem[1]}, reward = empReward[1] + 40}, -- azimuth_hood
    [1002] = {trade = {{4043, 3},        {empSeals[7],      8}, empTradeMaterial[10], empBossItem[2]}, reward = empReward[2] + 40}, -- azimuth_coat
    [1003] = {trade = {{4042, 3},        {empSeals[8],      8}, empTradeMaterial[10], empBossItem[3]}, reward = empReward[3] + 40}, -- azimuth_gloves
    [1004] = {trade = {{4030, 3},        {empSeals[9],      8}, empTradeMaterial[10], empBossItem[4]}, reward = empReward[4] + 40}, -- azimuth_tights
    [1005] = {trade = {{4045, 3},        {empSeals[10],     8}, empTradeMaterial[10], empBossItem[5]}, reward = empReward[5] + 40}, -- azimuth_gaiters
    [1006] = {trade = {{4046, 3},        {empSeals[11],     8}, empTradeMaterial[ 8], empBossItem[1]}, reward = empReward[1] + 42}, -- erilaz_galea
    [1007] = {trade = {{4025, 3},        {empSeals[12],     8}, empTradeMaterial[ 8], empBossItem[2]}, reward = empReward[2] + 42}, -- erilaz_surcoat
    [1008] = {trade = {{4047, 3},        {empSeals[13],     8}, empTradeMaterial[ 8], empBossItem[3]}, reward = empReward[3] + 42}, -- erilaz_gauntlets
    [1009] = {trade = {{3923, 3},        {empSeals[14],     8}, empTradeMaterial[ 8], empBossItem[4]}, reward = empReward[4] + 42}, -- erilaz_leg_guards
    [1010] = {trade = {{4029, 3},        {empSeals[15],     8}, empTradeMaterial[ 8], empBossItem[5]}, reward = empReward[5] + 42}, -- erilaz_greaves
    -- Reforged Empyrean Armor +2 (119) (Slots 1011-1120 reserved)
    -- Reforged Empyrean Armor +3 (119) (Slots 1121-1230 reserved)
}

function onTrade(player, npc, trade)
    local gilCost
    local tradedCombo = 0
    local augItem = 0
    local skyAugmentsCarryOver =
    {
        {"1", "14", "31", "9", "42", "1", "54", "1"},   -- HP +15, EVA +10, Enemy Crit Hit Rate -2%, PDT -2%
        {"41", "1", "328", "1", "129", "9", "195", "2"}, -- Crit Hit Rate +2%, Crit Hit Damage +2%, ACC/RACC +10, Subtle Blow +3
        {"9", "14", "133", "4", "362", "9", "35", "9"}, -- MP +15, MAB +5, Magic Damage +10, MACC +10
        {"1806", "4", "102", "1", "115", "2"},          -- Pet: STR/DEX/VIT +5, Pet: Crit Hit Rate +2%, Pet: Store TP +3
        -- {"1", "29", "31", "19", "42", "3", "54", "3"},   -- HP +30, EVA +20, Enemy Crit Hit Rate -4%, PDT -4%
        -- {"41", "4", "328", "4", "106", "19", "195", "5"}, -- Crit Hit Rate +4%, Crit Hit Damage +4%, ACC/RACC +20, Subtle Blow +6
        -- {"9", "29", "133", "9", "362", "19", "35", "19"}, -- MP +30, MAB +10, Magic Damage +20, MACC +20
        -- {"1806", "9", "102", "3", "115", "5"},           -- Pet: STR/DEX/VIT +10, Pet: Crit Hit Rate +4%, Pet: Store TP +6
    }

    -- Check for Reforged Artifact armor trade combination
    if tradedCombo == 0 then
        for k, v in pairs(reforgedArtifactArmor) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                tradedCombo = k
                augItem = v.trade[1]
                break
            end
        end

        for k, v in pairs(reforgedRelicArmor) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                tradedCombo = k
                augItem = v.trade[1]
                break
            end
        end

        for k, v in pairs(reforgedEmpyreanArmor) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                tradedCombo = k
                augItem = v.trade[1]
                break
            end
        end
    end

    -- Found a match
    if tradedCombo > 0 then
        local ID = zones[player:getZoneID()]
        local reward = 0
        local augments = {0, 0, 0, 0, 0, 0, 0, 0}
        local checkGenbu
        local checkByakko
        local checkSeiryu
        local checkSuzaku

        if
            (tradedCombo >= 116 and tradedCombo <= 230) or
            (tradedCombo >= 571 and tradedCombo <= 680)
        then
            checkGenbu = player:getCharVar("[Aug]SuibhnePathGenbu_"..augItem)
            checkByakko = player:getCharVar("[Aug]SuibhnePathByakko_"..augItem)
            checkSeiryu = player:getCharVar("[Aug]SuibhnePathSeiryu_"..augItem)
            checkSuzaku = player:getCharVar("[Aug]SuibhnePathSuzaku_"..augItem)
        end

        if checkGenbu == 1 then
            augments = skyAugmentsCarryOver[1]
            player:setCharVar("[Aug]SuibhnePathGenbu_"..augItem, 0)
        elseif checkByakko == 1 then
            augments = skyAugmentsCarryOver[2]
            player:setCharVar("[Aug]SuibhnePathByakko_"..augItem, 0)
        elseif checkSuzaku == 1 then
            augments = skyAugmentsCarryOver[3]
            player:setCharVar("[Aug]SuibhnePathSuzaku_"..augItem, 0)
        elseif checkSeiryu == 1 then
            augments = skyAugmentsCarryOver[4]
            player:setCharVar("[Aug]SuibhnePathSeiryu_"..augItem, 0)
        end

        if tradedCombo <= 460 then
            reward = reforgedArtifactArmor[tradedCombo].reward
        elseif tradedCombo >= 461 and tradedCombo <= 900 then
            reward = reforgedRelicArmor[tradedCombo].reward
        elseif tradedCombo >= 901 and tradedCombo <= 1230 then
            reward = reforgedEmpyreanArmor[tradedCombo].reward
        end

        if tradedCombo <= 115 then
            player:delGil(50000)
        end

        player:confirmTrade()
        player:addItem(reward, 1, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8])
        player:messageSpecial(ID.text.ITEM_OBTAINED, reward)
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Monisette : Oh, hello! I handle the trades for Reforged Artifact, Relic, and Empyrean armor."),tpz.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Monisette : NOTE: If you have augmented any of the NQ or HQ+1 Reforged armor using Suibhne I will carry over the augments to the upgraded set!"),tpz.msg.channel.NS_SAY)
    player:PrintToPlayer(string.format("Monisette : NOTE: Upgrading from HQ+1 to HQ+2 will wipe all augments."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end