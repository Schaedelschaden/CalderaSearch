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
-- artifact armor upgrade data
-----------------------------------
-- Fighter's Mask +1, Fighter's Lorica +1, Fighter's Mufflers +1, Fighter's Cuisses +1, Fighter's Calligae +1,
-- Pummeler's Mask, Pummeler's Lorica, Pummeler's Mufflers, Pummeler's Cuisses, Pummeler's Calligae
local tradePiece = {15225, 14473, 14890, 15561, 15352,
				    27663, 27807, 27943, 28090, 28223}

-- Rem's Tale Ch.01 x5, Rem's Tale Ch.02 x5, Rem's Tale Ch.03 x5, Rem's Tale Ch.04 x5, Rem's Tale Ch.05 x5,
-- Rem's Tale Ch.06 x5, Rem's Tale Ch.07 x5, Rem's Tale Ch.08 x5, Rem's Tale Ch.09 x5, Rem's Tale Ch.10 x5
local remTales = {{4064, 2}, {4065, 2}, {4066, 2}, {4067, 2}, {4068, 2},
				  {4069, 2}, {4070, 2}, {4071, 2}, {4072, 2}, {4073, 2}}

-- Tiger Leather, Gold Thread, Imperial Silk Cloth, Karakul Cloth, Scarlet Linen, Gold Sheet, Darksteel Sheet, Tama-Hagane,
-- Behemoth Leather, Platinum Silk Thread, Raxa, Twill Damask, Siren's Hair, Orichalcum Sheet, Durium Sheet, Damascus Ingot
local tradeMaterial = {855, 823, 2340, 2288, 1699, 752, 664, 657,
					   862, 2476, 1132, 2200, 1313, 668, 758, 658}

-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood,
-- Maliyakaleya Orb, Hepatizon Ingot, Beryllium Ingot, Exalted Lumber, Sif's Macrame
local godItem = {844, 837, 1110, 836, 1311,
				 8720, 8722, 8724, 8726, 8728}

-- Pummeler's Mask, Pummeler's Lorica, Pummeler's Mufflers, Pummeler's Cuisses, Pummeler's Calligae,
-- Pummeler's Mask +1, Pummeler's Lorica +1, Pummeler's Mufflers +1, Pummeler's Cuisses +1, Pummeler's Calligae +1
local rewardPiece = {27663, 27807, 27943, 28090, 28223,
					 27684, 27828, 27964, 28111, 28244}

local gilCost = {"gil", 50000}

local reforgedArtifactArmor =
{
	-- Reforged Artifact Armor (109)
    [  1] = {trade = {tradePiece[1], remTales[1], tradeMaterial[1], godItem[1], gilCost}, reward = rewardPiece[1]}, -- pummelers_mask
    [  2] = {trade = {tradePiece[2], remTales[2], tradeMaterial[1], godItem[2], gilCost}, reward = rewardPiece[2]}, -- pummelers_lorica
    [  3] = {trade = {tradePiece[3], remTales[3], tradeMaterial[1], godItem[3], gilCost}, reward = rewardPiece[3]}, -- pummelers_mufflers
    [  4] = {trade = {tradePiece[4], remTales[4], tradeMaterial[1], godItem[4], gilCost}, reward = rewardPiece[4]}, -- pummelers_cuisses
    [  5] = {trade = {tradePiece[5], remTales[5], tradeMaterial[1], godItem[5], gilCost}, reward = rewardPiece[5]}, -- pummelers_calligae
    [  6] = {trade = {tradePiece[1] + 1, remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 1}, -- anchorites_crown
    [  7] = {trade = {tradePiece[2] + 1, remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 1}, -- anchorites_cyclas
    [  8] = {trade = {tradePiece[3] + 1, remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 1}, -- anchorites_gloves
    [  9] = {trade = {tradePiece[4] + 1, remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 1}, -- anchorites_hose
    [ 10] = {trade = {tradePiece[5] + 1, remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 1}, -- anchorites_gaiters
    [ 11] = {trade = {tradePiece[1] + 2, remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 2}, -- theophany_cap
    [ 12] = {trade = {tradePiece[2] + 2, remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 2}, -- theophany_briault
    [ 13] = {trade = {tradePiece[3] + 2, remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 2}, -- theophany_mitts
    [ 14] = {trade = {tradePiece[4] + 2, remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 2}, -- theophany_pantaloons
    [ 15] = {trade = {tradePiece[5] + 2, remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 2}, -- theophany_duckbills
    [ 16] = {trade = {tradePiece[1] + 3, remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 3}, -- spaekonas_petasos
    [ 17] = {trade = {tradePiece[2] + 3, remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 3}, -- spaekonas_coat
    [ 18] = {trade = {tradePiece[3] + 3, remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 3}, -- spaekonas_gloves
    [ 19] = {trade = {tradePiece[4] + 3, remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 3}, -- spaekonas_tonban
    [ 20] = {trade = {tradePiece[5] + 3, remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 3}, -- spaekonas_sabots
    [ 21] = {trade = {tradePiece[1] + 4, remTales[1], tradeMaterial[5], godItem[1], gilCost}, reward = rewardPiece[1] + 4}, -- atrophy_chapeau
    [ 22] = {trade = {tradePiece[2] + 4, remTales[2], tradeMaterial[5], godItem[2], gilCost}, reward = rewardPiece[2] + 4}, -- atrophy_tabard
    [ 23] = {trade = {tradePiece[3] + 4, remTales[3], tradeMaterial[5], godItem[3], gilCost}, reward = rewardPiece[3] + 4}, -- atrophy_gloves
    [ 24] = {trade = {tradePiece[4] + 4, remTales[4], tradeMaterial[5], godItem[4], gilCost}, reward = rewardPiece[4] + 4}, -- atrophy_tights
    [ 25] = {trade = {tradePiece[5] + 4, remTales[5], tradeMaterial[5], godItem[5], gilCost}, reward = rewardPiece[5] + 4}, -- atrophy_boots
    [ 26] = {trade = {tradePiece[1] + 5, remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 5}, -- pillagers_bonnet
    [ 27] = {trade = {tradePiece[2] + 5, remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 5}, -- pillagers_vest
    [ 28] = {trade = {tradePiece[3] + 5, remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 5}, -- pillagers_armlets
    [ 29] = {trade = {tradePiece[4] + 5, remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 5}, -- pillagers_culottes
    [ 30] = {trade = {tradePiece[5] + 5, remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 5}, -- pillagers_poulaines
    [ 31] = {trade = {tradePiece[1] + 6, remTales[1], tradeMaterial[6], godItem[1], gilCost}, reward = rewardPiece[1] + 6}, -- reverence_coronet
    [ 32] = {trade = {tradePiece[2] + 6, remTales[2], tradeMaterial[6], godItem[2], gilCost}, reward = rewardPiece[2] + 6}, -- reverence_surcoat
    [ 33] = {trade = {tradePiece[3] + 6, remTales[3], tradeMaterial[6], godItem[3], gilCost}, reward = rewardPiece[3] + 6}, -- reverence_gauntlets
    [ 34] = {trade = {tradePiece[4] + 6, remTales[4], tradeMaterial[6], godItem[4], gilCost}, reward = rewardPiece[4] + 6}, -- reverence_breeches
    [ 35] = {trade = {tradePiece[5] + 6, remTales[5], tradeMaterial[6], godItem[5], gilCost}, reward = rewardPiece[5] + 6}, -- reverence_leggings
    [ 36] = {trade = {tradePiece[1] + 7, remTales[1], tradeMaterial[7], godItem[1], gilCost}, reward = rewardPiece[1] + 7}, -- ignominy_burgeonet
    [ 37] = {trade = {tradePiece[2] + 7, remTales[2], tradeMaterial[7], godItem[2], gilCost}, reward = rewardPiece[2] + 7}, -- ignominy_cuirass
    [ 38] = {trade = {tradePiece[3] + 7, remTales[3], tradeMaterial[7], godItem[3], gilCost}, reward = rewardPiece[3] + 7}, -- ignominy_gauntlets
    [ 39] = {trade = {tradePiece[4] + 7, remTales[4], tradeMaterial[7], godItem[4], gilCost}, reward = rewardPiece[4] + 7}, -- ignominy_flanchard
    [ 40] = {trade = {tradePiece[5] + 7, remTales[5], tradeMaterial[7], godItem[5], gilCost}, reward = rewardPiece[5] + 7}, -- ignominy_sollerets
    [ 41] = {trade = {tradePiece[1] + 8, remTales[1], tradeMaterial[1], godItem[1], gilCost}, reward = rewardPiece[1] + 8}, -- totemic_helm
    [ 42] = {trade = {tradePiece[2] + 8, remTales[2], tradeMaterial[1], godItem[2], gilCost}, reward = rewardPiece[2] + 8}, -- totemic_jackcoat
    [ 43] = {trade = {tradePiece[3] + 8, remTales[3], tradeMaterial[1], godItem[3], gilCost}, reward = rewardPiece[3] + 8}, -- totemic_gloves
    [ 44] = {trade = {tradePiece[4] + 8, remTales[4], tradeMaterial[1], godItem[4], gilCost}, reward = rewardPiece[4] + 8}, -- totemic_trousers
    [ 45] = {trade = {tradePiece[5] + 8, remTales[5], tradeMaterial[1], godItem[5], gilCost}, reward = rewardPiece[5] + 8}, -- totemic_gaiters
    [ 46] = {trade = {tradePiece[1] + 9, remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 9}, -- brioso_roundlet
    [ 47] = {trade = {tradePiece[2] + 9, remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 9}, -- brioso_justaucorps
    [ 48] = {trade = {tradePiece[3] + 9, remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 9}, -- brioso_cuffs
    [ 49] = {trade = {tradePiece[4] + 9, remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 9}, -- brioso_cannions
    [ 50] = {trade = {tradePiece[5] + 9, remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 9}, -- brioso_slippers
    [ 51] = {trade = {tradePiece[1] + 10, remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 10}, -- orion_beret
    [ 52] = {trade = {tradePiece[2] + 10, remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 10}, -- orion_jerkin
    [ 53] = {trade = {tradePiece[3] + 10, remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 10}, -- orion_bracers
    [ 54] = {trade = {tradePiece[4] + 10, remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 10}, -- orion_braccae
    [ 55] = {trade = {tradePiece[5] + 10, remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 10}, -- orion_socks
    [ 56] = {trade = {tradePiece[1] + 11, remTales[1], tradeMaterial[8], godItem[1], gilCost}, reward = rewardPiece[1] + 11}, -- wakido_kabuto
    [ 57] = {trade = {tradePiece[2] + 11, remTales[2], tradeMaterial[8], godItem[2], gilCost}, reward = rewardPiece[2] + 11}, -- wakido_domaru
    [ 58] = {trade = {tradePiece[3] + 11, remTales[3], tradeMaterial[8], godItem[3], gilCost}, reward = rewardPiece[3] + 11}, -- wakido_kote
    [ 59] = {trade = {tradePiece[4] + 11, remTales[4], tradeMaterial[8], godItem[4], gilCost}, reward = rewardPiece[4] + 11}, -- wakido_haidate
    [ 60] = {trade = {tradePiece[5] + 11, remTales[5], tradeMaterial[8], godItem[5], gilCost}, reward = rewardPiece[5] + 11}, -- wakido_sune-ate
    [ 61] = {trade = {tradePiece[1] + 12, remTales[1], tradeMaterial[8], godItem[1], gilCost}, reward = rewardPiece[1] + 12}, -- hachiya_hatsuburi
    [ 62] = {trade = {tradePiece[2] + 12, remTales[2], tradeMaterial[8], godItem[2], gilCost}, reward = rewardPiece[2] + 12}, -- hachiya_chainmail
    [ 63] = {trade = {tradePiece[3] + 12, remTales[3], tradeMaterial[8], godItem[3], gilCost}, reward = rewardPiece[3] + 12}, -- hachiya_tekko
    [ 64] = {trade = {tradePiece[4] + 12, remTales[4], tradeMaterial[8], godItem[4], gilCost}, reward = rewardPiece[4] + 12}, -- hachiya_hakama
    [ 65] = {trade = {tradePiece[5] + 12, remTales[5], tradeMaterial[8], godItem[5], gilCost}, reward = rewardPiece[5] + 12}, -- hachiya_kyahan
    [ 66] = {trade = {tradePiece[1] + 13, remTales[1], tradeMaterial[6], godItem[1], gilCost}, reward = rewardPiece[1] + 13}, -- vishap_armet
    [ 67] = {trade = {tradePiece[2] + 13, remTales[2], tradeMaterial[6], godItem[2], gilCost}, reward = rewardPiece[2] + 13}, -- vishap_mail
    [ 68] = {trade = {tradePiece[3] + 13, remTales[3], tradeMaterial[6], godItem[3], gilCost}, reward = rewardPiece[3] + 13}, -- vishap_finger_gauntlets
    [ 69] = {trade = {tradePiece[4] + 13, remTales[4], tradeMaterial[6], godItem[4], gilCost}, reward = rewardPiece[4] + 13}, -- vishap_brais
    [ 70] = {trade = {tradePiece[5] + 13, remTales[5], tradeMaterial[6], godItem[5], gilCost}, reward = rewardPiece[5] + 13}, -- vishap_greaves
    [ 71] = {trade = {tradePiece[1] + 14, remTales[1], tradeMaterial[5], godItem[1], gilCost}, reward = rewardPiece[1] + 14}, -- convokers_horn
    [ 72] = {trade = {tradePiece[2] + 14, remTales[2], tradeMaterial[5], godItem[2], gilCost}, reward = rewardPiece[2] + 14}, -- convokers_doublet
    [ 73] = {trade = {tradePiece[3] + 14, remTales[3], tradeMaterial[5], godItem[3], gilCost}, reward = rewardPiece[3] + 14}, -- convokers_bracers
    [ 74] = {trade = {tradePiece[4] + 14, remTales[4], tradeMaterial[5], godItem[4], gilCost}, reward = rewardPiece[4] + 14}, -- convokers_spats
    [ 75] = {trade = {tradePiece[5] + 14, remTales[5], tradeMaterial[5], godItem[5], gilCost}, reward = rewardPiece[5] + 14}, -- convokers_pigaches
    [ 76] = {trade = {tradePiece[1] - 3761, remTales[1], tradeMaterial[3], godItem[1], gilCost}, reward = rewardPiece[1] + 15}, -- assimilators_keffiyeh
    [ 77] = {trade = {tradePiece[2] - 3182, remTales[2], tradeMaterial[3], godItem[2], gilCost}, reward = rewardPiece[2] + 15}, -- assimilators_jubbah
    [ 78] = {trade = {tradePiece[3] + 134, remTales[3], tradeMaterial[3], godItem[3], gilCost}, reward = rewardPiece[3] + 15}, -- assimilators_bazubands
    [ 79] = {trade = {tradePiece[4] + 784, remTales[4], tradeMaterial[3], godItem[4], gilCost}, reward = rewardPiece[4] + 15}, -- assimilators_shalwar
    [ 80] = {trade = {tradePiece[5] - 3971, remTales[5], tradeMaterial[3], godItem[5], gilCost}, reward = rewardPiece[5] + 15}, -- assimilators_charuqs
    [ 81] = {trade = {tradePiece[1] - 3758, remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 16}, -- laksamanas_tricorne
    [ 82] = {trade = {tradePiece[2] - 3179, remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 16}, -- laksamanas_frac
    [ 83] = {trade = {tradePiece[3] + 137, remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 16}, -- laksamanas_gants
    [ 84] = {trade = {tradePiece[4] + 787, remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 16}, -- laksamanas_culottes
    [ 85] = {trade = {tradePiece[5] - 3968, remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 16}, -- laksamanas_bottes
    [ 86] = {trade = {tradePiece[1] - 3755, remTales[1], tradeMaterial[4], godItem[1], gilCost}, reward = rewardPiece[1] + 17}, -- foire_taj
    [ 87] = {trade = {tradePiece[2] - 3176, remTales[2], tradeMaterial[4], godItem[2], gilCost}, reward = rewardPiece[2] + 17}, -- foire_tobe
    [ 88] = {trade = {tradePiece[3] + 140, remTales[3], tradeMaterial[4], godItem[3], gilCost}, reward = rewardPiece[3] + 17}, -- foire_dastanas
    [ 89] = {trade = {tradePiece[4] + 790, remTales[4], tradeMaterial[4], godItem[4], gilCost}, reward = rewardPiece[4] + 17}, -- foire_churidars
    [ 90] = {trade = {tradePiece[5] - 3965, remTales[5], tradeMaterial[4], godItem[5], gilCost}, reward = rewardPiece[5] + 17}, -- foire_babouches
    [ 91] = {trade = {tradePiece[1] - 3750, remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 18}, -- maxixi_tiara
    [ 92] = {trade = {tradePiece[2] - 3171, remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 18}, -- maxixi_casaque
    [ 93] = {trade = {tradePiece[3] + 145, remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 18}, -- maxixi_bangles
    [ 94] = {trade = {tradePiece[4] + 796, remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 18}, -- maxixi_tights
    [ 95] = {trade = {tradePiece[5] - 3959, remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 18}, -- maxixi_toe_shoes
    [ 96] = {trade = {tradePiece[1] - 3749, remTales[1], tradeMaterial[2], godItem[1], gilCost}, reward = rewardPiece[1] + 19}, -- maxixi_tiara
    [ 97] = {trade = {tradePiece[2] - 3170, remTales[2], tradeMaterial[2], godItem[2], gilCost}, reward = rewardPiece[2] + 19}, -- maxixi_casaque
    [ 98] = {trade = {tradePiece[3] + 146, remTales[3], tradeMaterial[2], godItem[3], gilCost}, reward = rewardPiece[3] + 19}, -- maxixi_bangles
    [ 99] = {trade = {tradePiece[4] + 797, remTales[4], tradeMaterial[2], godItem[4], gilCost}, reward = rewardPiece[4] + 19}, -- maxixi_tights
    [100] = {trade = {tradePiece[5] - 3958, remTales[5], tradeMaterial[2], godItem[5], gilCost}, reward = rewardPiece[5] + 19}, -- maxixi_toe_shoes
    [101] = {trade = {tradePiece[1] - 3748, remTales[1], tradeMaterial[5], godItem[1], gilCost}, reward = rewardPiece[1] + 20}, -- academics_mortarboard
    [102] = {trade = {tradePiece[2] - 3169, remTales[2], tradeMaterial[5], godItem[2], gilCost}, reward = rewardPiece[2] + 20}, -- academics_gown
    [103] = {trade = {tradePiece[3] + 147, remTales[3], tradeMaterial[5], godItem[3], gilCost}, reward = rewardPiece[3] + 20}, -- academics_bracers
    [104] = {trade = {tradePiece[4] + 798, remTales[4], tradeMaterial[5], godItem[4], gilCost}, reward = rewardPiece[4] + 20}, -- academics_pants
    [105] = {trade = {tradePiece[5] - 3957, remTales[5], tradeMaterial[5], godItem[5], gilCost}, reward = rewardPiece[5] + 20}, -- academics_loafers
	[106] = {trade = {{4044, 3}, remTales[1], tradeMaterial[3], godItem[1], {"gil", 50000}}, reward = 27786}, -- geomancy_galero
	[107] = {trade = {{4043, 3}, remTales[2], tradeMaterial[3], godItem[2], {"gil", 50000}}, reward = 27926}, -- geomancy_tunic
	[108] = {trade = {{4042, 3}, remTales[3], tradeMaterial[3], godItem[3], {"gil", 50000}}, reward = 28066}, -- geomancy_mitaines
	[109] = {trade = {{4030, 3}, remTales[4], tradeMaterial[3], godItem[4], {"gil", 50000}}, reward = 28206}, -- geomancy_pants
	[110] = {trade = {{4045, 3}, remTales[5], tradeMaterial[3], godItem[5], {"gil", 50000}}, reward = 28346}, -- geomancy_sandals
	[111] = {trade = {{4046, 3}, remTales[1], tradeMaterial[7], godItem[1], {"gil", 50000}}, reward = 27787}, -- runeist_bandeau
	[112] = {trade = {{4025, 3}, remTales[2], tradeMaterial[7], godItem[2], {"gil", 50000}}, reward = 27927}, -- runeist_coat
	[113] = {trade = {{4047, 3}, remTales[3], tradeMaterial[7], godItem[3], {"gil", 50000}}, reward = 28067}, -- runeist_mitons
	[114] = {trade = {{3923, 3}, remTales[4], tradeMaterial[7], godItem[4], {"gil", 50000}}, reward = 28207}, -- runeist_trousers
	[115] = {trade = {{4029, 3}, remTales[5], tradeMaterial[7], godItem[5], {"gil", 50000}}, reward = 28347}, -- runeist_bottes
	-- Reforged Artifact Armor +1 (119)
    [116] = {trade = {tradePiece[6], remTales[6], tradeMaterial[9], godItem[6]}, reward = rewardPiece[6]}, -- pummelers_mask_+1
    [117] = {trade = {tradePiece[7], remTales[7], tradeMaterial[9], godItem[7]}, reward = rewardPiece[7]}, -- pummelers_lorica_+1
    [118] = {trade = {tradePiece[8], remTales[8], tradeMaterial[9], godItem[8]}, reward = rewardPiece[8]}, -- pummelers_mufflers_+1
    [119] = {trade = {tradePiece[9], remTales[9], tradeMaterial[9], godItem[9]}, reward = rewardPiece[9]}, -- pummelers_cuisses_+1
    [120] = {trade = {tradePiece[10], remTales[10], tradeMaterial[9], godItem[10]}, reward = rewardPiece[10]}, -- pummelers_calligae_+1
    [121] = {trade = {tradePiece[6] + 1, remTales[6], tradeMaterial[10], godItem[6]}, reward = rewardPiece[6] + 1}, -- anchorites_crown_+1
    [122] = {trade = {tradePiece[7] + 1, remTales[7], tradeMaterial[10], godItem[7]}, reward = rewardPiece[7] + 1}, -- anchorites_cyclas_+1
    [123] = {trade = {tradePiece[8] + 1, remTales[8], tradeMaterial[10], godItem[8]}, reward = rewardPiece[8] + 1}, -- anchorites_gloves_+1
    [124] = {trade = {tradePiece[9] + 1, remTales[9], tradeMaterial[10], godItem[9]}, reward = rewardPiece[9] + 1}, -- anchorites_hose_+1
    [125] = {trade = {tradePiece[10] + 1, remTales[10], tradeMaterial[10], godItem[10]}, reward = rewardPiece[10] + 1}, -- anchorites_gaiters_+1
    [126] = {trade = {tradePiece[6] + 2, remTales[6], tradeMaterial[11], godItem[6]}, reward = rewardPiece[6] + 2}, -- theophany_cap_+1
    [127] = {trade = {tradePiece[7] + 2, remTales[7], tradeMaterial[11], godItem[7]}, reward = rewardPiece[7] + 2}, -- theophany_briault_+1
    [128] = {trade = {tradePiece[8] + 2, remTales[8], tradeMaterial[11], godItem[8]}, reward = rewardPiece[8] + 2}, -- theophany_mitts_+1
    [129] = {trade = {tradePiece[9] + 2, remTales[9], tradeMaterial[11], godItem[9]}, reward = rewardPiece[9] + 2}, -- theophany_pantaloons_+1
    [130] = {trade = {tradePiece[10] + 2, remTales[10], tradeMaterial[11], godItem[10]}, reward = rewardPiece[10] + 2}, -- theophany_duckbills_+1
    [131] = {trade = {tradePiece[6] + 3, remTales[6], tradeMaterial[12], godItem[6]}, reward = rewardPiece[6] + 3}, -- spaekonas_petasos_+1
    [132] = {trade = {tradePiece[7] + 3, remTales[7], tradeMaterial[12], godItem[7]}, reward = rewardPiece[7] + 3}, -- spaekonas_coat_+1
    [133] = {trade = {tradePiece[8] + 3, remTales[8], tradeMaterial[12], godItem[8]}, reward = rewardPiece[8] + 3}, -- spaekonas_gloves_+1
    [134] = {trade = {tradePiece[9] + 3, remTales[9], tradeMaterial[12], godItem[9]}, reward = rewardPiece[9] + 3}, -- spaekonas_tonban_+1
    [135] = {trade = {tradePiece[10] + 3, remTales[10], tradeMaterial[12], godItem[10]}, reward = rewardPiece[10] + 3}, -- spaekonas_sabots_+1
    [136] = {trade = {tradePiece[6] + 4, remTales[6], tradeMaterial[13], godItem[6]}, reward = rewardPiece[6] + 4}, -- atrophy_chapeau_+1
    [137] = {trade = {tradePiece[7] + 4, remTales[7], tradeMaterial[13], godItem[7]}, reward = rewardPiece[7] + 4}, -- atrophy_tabard_+1
    [138] = {trade = {tradePiece[8] + 4, remTales[8], tradeMaterial[13], godItem[8]}, reward = rewardPiece[8] + 4}, -- atrophy_gloves_+1
    [139] = {trade = {tradePiece[9] + 4, remTales[9], tradeMaterial[13], godItem[9]}, reward = rewardPiece[9] + 4}, -- atrophy_tights_+1
    [140] = {trade = {tradePiece[10] + 4, remTales[10], tradeMaterial[13], godItem[10]}, reward = rewardPiece[10] + 4}, -- atrophy_boots_+1
    [141] = {trade = {tradePiece[6] + 5, remTales[6], tradeMaterial[10], godItem[6]}, reward = rewardPiece[6] + 5}, -- pillagers_bonnet_+1
    [142] = {trade = {tradePiece[7] + 5, remTales[7], tradeMaterial[10], godItem[7]}, reward = rewardPiece[7] + 5}, -- pillagers_vest_+1
    [143] = {trade = {tradePiece[8] + 5, remTales[8], tradeMaterial[10], godItem[8]}, reward = rewardPiece[8] + 5}, -- pillagers_armlets_+1
    [144] = {trade = {tradePiece[9] + 5, remTales[9], tradeMaterial[10], godItem[9]}, reward = rewardPiece[9] + 5}, -- pillagers_culottes_+1
    [145] = {trade = {tradePiece[10] + 5, remTales[10], tradeMaterial[10], godItem[10]}, reward = rewardPiece[10] + 5}, -- pillagers_poulaines_+1
    [146] = {trade = {tradePiece[6] + 6, remTales[6], tradeMaterial[14], godItem[6]}, reward = rewardPiece[6] + 6}, -- reverence_coronet_+1
    [147] = {trade = {tradePiece[7] + 6, remTales[7], tradeMaterial[14], godItem[7]}, reward = rewardPiece[7] + 6}, -- reverence_surcoat_+1
    [148] = {trade = {tradePiece[8] + 6, remTales[8], tradeMaterial[14], godItem[8]}, reward = rewardPiece[8] + 6}, -- reverence_gauntlets_+1
    [149] = {trade = {tradePiece[9] + 6, remTales[9], tradeMaterial[14], godItem[9]}, reward = rewardPiece[9] + 6}, -- reverence_breeches_+1
    [150] = {trade = {tradePiece[10] + 6, remTales[10], tradeMaterial[14], godItem[10]}, reward = rewardPiece[10] + 6}, -- reverence_leggings_+1
    [151] = {trade = {tradePiece[6] + 7, remTales[6], tradeMaterial[15], godItem[6]}, reward = rewardPiece[6] + 7}, -- ignominy_burgeonet_+1
    [152] = {trade = {tradePiece[7] + 7, remTales[7], tradeMaterial[15], godItem[7]}, reward = rewardPiece[7] + 7}, -- ignominy_cuirass_+1
    [153] = {trade = {tradePiece[8] + 7, remTales[8], tradeMaterial[15], godItem[8]}, reward = rewardPiece[8] + 7}, -- ignominy_gauntlets_+1
    [154] = {trade = {tradePiece[9] + 7, remTales[9], tradeMaterial[15], godItem[9]}, reward = rewardPiece[9] + 7}, -- ignominy_flanchard_+1
    [155] = {trade = {tradePiece[10] + 7, remTales[10], tradeMaterial[15], godItem[10]}, reward = rewardPiece[10] + 7}, -- ignominy_sollerets_+1
    [156] = {trade = {tradePiece[6] + 8, remTales[6], tradeMaterial[9], godItem[6]}, reward = rewardPiece[6] + 8}, -- totemic_helm_+1
    [157] = {trade = {tradePiece[7] + 8, remTales[7], tradeMaterial[9], godItem[7]}, reward = rewardPiece[7] + 8}, -- totemic_jackcoat_+1
    [158] = {trade = {tradePiece[8] + 8, remTales[8], tradeMaterial[9], godItem[8]}, reward = rewardPiece[8] + 8}, -- totemic_gloves_+1
    [159] = {trade = {tradePiece[9] + 8, remTales[9], tradeMaterial[9], godItem[9]}, reward = rewardPiece[9] + 8}, -- totemic_trousers_+1
    [160] = {trade = {tradePiece[10] + 8, remTales[10], tradeMaterial[9], godItem[10]}, reward = rewardPiece[10] + 8}, -- totemic_gaiters_+1
    [161] = {trade = {tradePiece[6] + 9, remTales[6], tradeMaterial[11], godItem[6]}, reward = rewardPiece[6] + 9}, -- brioso_roundlet_+1
    [162] = {trade = {tradePiece[7] + 9, remTales[7], tradeMaterial[11], godItem[7]}, reward = rewardPiece[7] + 9}, -- brioso_justaucorps_+1
    [163] = {trade = {tradePiece[8] + 9, remTales[8], tradeMaterial[11], godItem[8]}, reward = rewardPiece[8] + 9}, -- brioso_cuffs_+1
    [164] = {trade = {tradePiece[9] + 9, remTales[9], tradeMaterial[11], godItem[9]}, reward = rewardPiece[9] + 9}, -- brioso_cannions_+1
    [165] = {trade = {tradePiece[10] + 9, remTales[10], tradeMaterial[11], godItem[10]}, reward = rewardPiece[10] + 9}, -- brioso_slippers_+1
    [166] = {trade = {tradePiece[6] + 10, remTales[6], tradeMaterial[12], godItem[6]}, reward = rewardPiece[6] + 10}, -- orion_beret_+1
    [167] = {trade = {tradePiece[7] + 10, remTales[7], tradeMaterial[12], godItem[7]}, reward = rewardPiece[7] + 10}, -- orion_jerkin_+1
    [168] = {trade = {tradePiece[8] + 10, remTales[8], tradeMaterial[12], godItem[8]}, reward = rewardPiece[8] + 10}, -- orion_bracers_+1
    [169] = {trade = {tradePiece[9] + 10, remTales[9], tradeMaterial[12], godItem[9]}, reward = rewardPiece[9] + 10}, -- orion_braccae_+1
    [170] = {trade = {tradePiece[10] + 10, remTales[10], tradeMaterial[12], godItem[10]}, reward = rewardPiece[10] + 10}, -- orion_socks_+1
    [171] = {trade = {tradePiece[6] + 11, remTales[6], tradeMaterial[16], godItem[6]}, reward = rewardPiece[6] + 11}, -- wakido_kabuto_+1
    [172] = {trade = {tradePiece[7] + 11, remTales[7], tradeMaterial[16], godItem[7]}, reward = rewardPiece[7] + 11}, -- wakido_domaru_+1
    [173] = {trade = {tradePiece[8] + 11, remTales[8], tradeMaterial[16], godItem[8]}, reward = rewardPiece[8] + 11}, -- wakido_kote_+1
    [174] = {trade = {tradePiece[9] + 11, remTales[9], tradeMaterial[16], godItem[9]}, reward = rewardPiece[9] + 11}, -- wakido_haidate_+1
    [175] = {trade = {tradePiece[10] + 11, remTales[10], tradeMaterial[16], godItem[10]}, reward = rewardPiece[10] + 11}, -- wakido_sune-ate_+1
    [176] = {trade = {tradePiece[6] + 12, remTales[6], tradeMaterial[16], godItem[6]}, reward = rewardPiece[6] + 12}, -- hachiya_hatsuburi_+1
    [177] = {trade = {tradePiece[7] + 12, remTales[7], tradeMaterial[16], godItem[7]}, reward = rewardPiece[7] + 12}, -- hachiya_chainmail_+1
    [178] = {trade = {tradePiece[8] + 12, remTales[8], tradeMaterial[16], godItem[8]}, reward = rewardPiece[8] + 12}, -- hachiya_tekko_+1
    [179] = {trade = {tradePiece[9] + 12, remTales[9], tradeMaterial[16], godItem[9]}, reward = rewardPiece[9] + 12}, -- hachiya_hakama_+1
    [180] = {trade = {tradePiece[10] + 12, remTales[10], tradeMaterial[16], godItem[10]}, reward = rewardPiece[10] + 12}, -- hachiya_kyahan_+1
    [181] = {trade = {tradePiece[6] + 13, remTales[6], tradeMaterial[14], godItem[6]}, reward = rewardPiece[6] + 13}, -- vishap_armet_+1
    [182] = {trade = {tradePiece[7] + 13, remTales[7], tradeMaterial[14], godItem[7]}, reward = rewardPiece[7] + 13}, -- vishap_mail_+1
    [183] = {trade = {tradePiece[8] + 13, remTales[8], tradeMaterial[14], godItem[8]}, reward = rewardPiece[8] + 13}, -- vishap_finger_gauntlets_+1
    [184] = {trade = {tradePiece[9] + 13, remTales[9], tradeMaterial[14], godItem[9]}, reward = rewardPiece[9] + 13}, -- vishap_brais_+1
    [185] = {trade = {tradePiece[10] + 13, remTales[10], tradeMaterial[14], godItem[10]}, reward = rewardPiece[10] + 13}, -- vishap_greaves_+1
    [186] = {trade = {tradePiece[6] + 14, remTales[6], tradeMaterial[13], godItem[6]}, reward = rewardPiece[6] + 14}, -- convokers_horn_+1
    [187] = {trade = {tradePiece[7] + 14, remTales[7], tradeMaterial[13], godItem[7]}, reward = rewardPiece[7] + 14}, -- convokers_doublet_+1
    [188] = {trade = {tradePiece[8] + 14, remTales[8], tradeMaterial[13], godItem[8]}, reward = rewardPiece[8] + 14}, -- convokers_bracers_+1
    [189] = {trade = {tradePiece[9] + 14, remTales[9], tradeMaterial[13], godItem[9]}, reward = rewardPiece[9] + 14}, -- convokers_spats_+1
    [190] = {trade = {tradePiece[10] + 14, remTales[10], tradeMaterial[13], godItem[10]}, reward = rewardPiece[10] + 14}, -- convokers_pigaches_+1
    [191] = {trade = {tradePiece[6] + 15, remTales[6], tradeMaterial[11], godItem[6]}, reward = rewardPiece[6] + 15}, -- assimilators_keffiyeh_+1
    [192] = {trade = {tradePiece[7] + 15, remTales[7], tradeMaterial[11], godItem[7]}, reward = rewardPiece[7] + 15}, -- assimilators_jubbah_+1
    [193] = {trade = {tradePiece[8] + 15, remTales[8], tradeMaterial[11], godItem[8]}, reward = rewardPiece[8] + 15}, -- assimilators_bazubands_+1
    [194] = {trade = {tradePiece[9] + 15, remTales[9], tradeMaterial[11], godItem[9]}, reward = rewardPiece[9] + 15}, -- assimilators_shalwar_+1
    [195] = {trade = {tradePiece[10] + 15, remTales[10], tradeMaterial[11], godItem[10]}, reward = rewardPiece[10] + 15}, -- assimilators_charuqs_+1
    [196] = {trade = {tradePiece[6] + 16, remTales[6], tradeMaterial[12], godItem[6]}, reward = rewardPiece[6] + 16}, -- laksamanas_tricorne_+1
    [197] = {trade = {tradePiece[7] + 16, remTales[7], tradeMaterial[12], godItem[7]}, reward = rewardPiece[7] + 16}, -- laksamanas_frac_+1
    [198] = {trade = {tradePiece[8] + 16, remTales[8], tradeMaterial[12], godItem[8]}, reward = rewardPiece[8] + 16}, -- laksamanas_gants_+1
    [199] = {trade = {tradePiece[9] + 16, remTales[9], tradeMaterial[12], godItem[9]}, reward = rewardPiece[9] + 16}, -- laksamanas_culottes_+1
    [200] = {trade = {tradePiece[10] + 16, remTales[10], tradeMaterial[12], godItem[10]}, reward = rewardPiece[10] + 16}, -- laksamanas_bottes_+1
    [201] = {trade = {tradePiece[6] + 17, remTales[6], tradeMaterial[12], godItem[6]}, reward = rewardPiece[6] + 17}, -- foire_taj_+1
    [202] = {trade = {tradePiece[7] + 17, remTales[7], tradeMaterial[12], godItem[7]}, reward = rewardPiece[7] + 17}, -- foire_tobe_+1
    [203] = {trade = {tradePiece[8] + 17, remTales[8], tradeMaterial[12], godItem[8]}, reward = rewardPiece[8] + 17}, -- foire_dastanas_+1
    [204] = {trade = {tradePiece[9] + 17, remTales[9], tradeMaterial[12], godItem[9]}, reward = rewardPiece[9] + 17}, -- foire_churidars_+1
    [205] = {trade = {tradePiece[10] + 17, remTales[10], tradeMaterial[12], godItem[10]}, reward = rewardPiece[10] + 17}, -- foire_babouches_+1
    [206] = {trade = {tradePiece[6] + 18, remTales[6], tradeMaterial[10], godItem[6]}, reward = rewardPiece[6] + 18}, -- maxixi_tiara_+1
    [207] = {trade = {tradePiece[7] + 18, remTales[7], tradeMaterial[10], godItem[7]}, reward = rewardPiece[7] + 18}, -- maxixi_casaque_+1
    [208] = {trade = {tradePiece[8] + 18, remTales[8], tradeMaterial[10], godItem[8]}, reward = rewardPiece[8] + 18}, -- maxixi_bangles_+1
    [209] = {trade = {tradePiece[9] + 18, remTales[9], tradeMaterial[10], godItem[9]}, reward = rewardPiece[9] + 18}, -- maxixi_tights_+1
    [210] = {trade = {tradePiece[10] + 18, remTales[10], tradeMaterial[10], godItem[10]}, reward = rewardPiece[10] + 18}, -- maxixi_toe_shoes_+1
    [211] = {trade = {tradePiece[6] + 19, remTales[6], tradeMaterial[10], godItem[6]}, reward = rewardPiece[6] + 19}, -- maxixi_tiara_+1
    [212] = {trade = {tradePiece[7] + 19, remTales[7], tradeMaterial[10], godItem[7]}, reward = rewardPiece[7] + 19}, -- maxixi_casaque_+1
    [213] = {trade = {tradePiece[8] + 19, remTales[8], tradeMaterial[10], godItem[8]}, reward = rewardPiece[8] + 19}, -- maxixi_bangles_+1
    [214] = {trade = {tradePiece[9] + 19, remTales[9], tradeMaterial[10], godItem[9]}, reward = rewardPiece[9] + 19}, -- maxixi_tights_+1
    [215] = {trade = {tradePiece[10] + 19, remTales[10], tradeMaterial[10], godItem[10]}, reward = rewardPiece[10] + 19}, -- maxixi_toe_shoes_+1
    [216] = {trade = {tradePiece[6] + 20, remTales[6], tradeMaterial[13], godItem[6]}, reward = rewardPiece[6] + 20}, -- academics_mortarboard_+1
    [217] = {trade = {tradePiece[7] + 20, remTales[7], tradeMaterial[13], godItem[7]}, reward = rewardPiece[7] + 20}, -- academics_gown_+1
    [218] = {trade = {tradePiece[8] + 20, remTales[8], tradeMaterial[13], godItem[8]}, reward = rewardPiece[8] + 20}, -- academics_bracers_+1
    [219] = {trade = {tradePiece[9] + 20, remTales[9], tradeMaterial[13], godItem[9]}, reward = rewardPiece[9] + 20}, -- academics_pants_+1
    [220] = {trade = {tradePiece[10] + 20, remTales[10], tradeMaterial[13], godItem[10]}, reward = rewardPiece[10] + 20}, -- academics_loafers_+1
	[221] = {trade = {tradePiece[6] + 123, remTales[6], tradeMaterial[11], godItem[6]}, reward = rewardPiece[6] + 21}, -- geomancy_galero_+1
	[222] = {trade = {tradePiece[7] + 119, remTales[7], tradeMaterial[11], godItem[7]}, reward = rewardPiece[7] + 21}, -- geomancy_tunic_+1
	[223] = {trade = {tradePiece[8] + 123, remTales[8], tradeMaterial[11], godItem[8]}, reward = rewardPiece[8] + 21}, -- geomancy_mitaines_+1
	[224] = {trade = {tradePiece[9] + 116, remTales[9], tradeMaterial[11], godItem[9]}, reward = rewardPiece[9] + 21}, -- geomancy_pants_+1
	[225] = {trade = {tradePiece[10] + 123, remTales[10], tradeMaterial[11], godItem[10]}, reward = rewardPiece[10] + 21}, -- geomancy_sandals_+1
	[226] = {trade = {tradePiece[6] + 124, remTales[6], tradeMaterial[16], godItem[6]}, reward = rewardPiece[6] + 22}, -- runeist_bandeau_+1
	[227] = {trade = {tradePiece[7] + 120, remTales[7], tradeMaterial[16], godItem[7]}, reward = rewardPiece[7] + 22}, -- runeist_coat_+1
	[228] = {trade = {tradePiece[8] + 124, remTales[8], tradeMaterial[16], godItem[8]}, reward = rewardPiece[8] + 22}, -- runeist_mitons_+1
	[229] = {trade = {tradePiece[9] + 117, remTales[9], tradeMaterial[16], godItem[9]}, reward = rewardPiece[9] + 22}, -- runeist_trousers_+1
	[230] = {trade = {tradePiece[10] + 124, remTales[10], tradeMaterial[16], godItem[10]}, reward = rewardPiece[10] + 22}, -- runeist_bottes_+1
}

-- Warrior's Mask +2, Warrior's Lorica +2, Warrior's Mufflers +2, Warrior's Cuisses +2, Warrior's Calligae +2,
-- Agoge Mask, Agoge Lorica, Agoge Mufflers, Agoge Cuisses, Agoge Calligae
local relicTrade = {10650, 10670, 10690, 10710, 10730,
				    26624, 26800, 26976, 27152, 27328}

-- 1 Byne Bill, Ordelle Bronzepiece, Tukuku Whiteshell
-- 100 Byne Bill, Montiont Silverpiece, Lungo-Nango Jadeshell
local dynaCurrency = {{1455, 50}, {1452, 50}, {1449, 50},
					  1456, 1453, 1450}

-- Wootz Ore x12, Griffon Hide x12, Sparkling Stone x12, Mammoth Tusk x12, Relic Iron x12, Lancewood Log x12
-- Forgotten Thought x5, Forgotten Hope x5, Forgotten Touch x5, Forgotten Journey x5, Forgotten Step x5
local relicTradeMaterial = {{1469, 12}, {1516, 12}, {1470, 12}, {1458, 12}, {1466, 12}, {1464, 12},
							{3493, 5}, {3494, 5}, {3495, 5}, {3496, 5}, {3497, 5}}

-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood
local relicGodItem = {844, 837, 1110, 836, 1311}

-- Agoge Mask, Agoge Lorica, Agoge Mufflers, Agoge Cuisses, Agoge Calligae
-- Agoge Mask +1, Agoge Lorica +1, Agoge Mufflers +1, Agoge Cuisses +1, Agoge Calligae +1
local relicReward = {26624, 26800, 26976, 27152, 27328,
					 26625, 26801, 26977, 27153, 27329}

-----------------------------------
-- relic armor upgrade data
-----------------------------------
local reforgedRelicArmor =
{
	-- Reforged Relic Armor (109)
	[231] = {trade = {relicTrade[1], dynaCurrency[1], relicTradeMaterial[1], relicGodItem[1]}, reward = relicReward[1]}, -- agoge_mask
	[232] = {trade = {relicTrade[2], dynaCurrency[1], relicTradeMaterial[1], relicGodItem[2]}, reward = relicReward[2]}, -- agoge_lorica
	[233] = {trade = {relicTrade[3], dynaCurrency[1], relicTradeMaterial[1], relicGodItem[3]}, reward = relicReward[3]}, -- agoge_mufflers
	[234] = {trade = {relicTrade[4], dynaCurrency[1], relicTradeMaterial[1], relicGodItem[4]}, reward = relicReward[4]}, -- agoge_cuisses
	[235] = {trade = {relicTrade[5], dynaCurrency[1], relicTradeMaterial[1], relicGodItem[5]}, reward = relicReward[5]}, -- agoge_calligae
	[236] = {trade = {relicTrade[1] + 1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 2}, -- hesychasts_crown
	[237] = {trade = {relicTrade[2] + 1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 2}, -- hesychasts_cyclas
	[238] = {trade = {relicTrade[3] + 1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 2}, -- hesychasts_gloves
	[239] = {trade = {relicTrade[4] + 1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 2}, -- hesychasts_hose
	[240] = {trade = {relicTrade[5] + 1, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 2}, -- hesychasts_gaiters
	[241] = {trade = {relicTrade[1] + 2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[1]}, reward = relicReward[1] + 4}, -- piety_cap
	[242] = {trade = {relicTrade[2] + 2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[2]}, reward = relicReward[2] + 4}, -- piety_briault
	[243] = {trade = {relicTrade[3] + 2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[3]}, reward = relicReward[3] + 4}, -- piety_mitts
	[244] = {trade = {relicTrade[4] + 2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[4]}, reward = relicReward[4] + 4}, -- piety_pantaloons
	[245] = {trade = {relicTrade[5] + 2, dynaCurrency[2], relicTradeMaterial[3], relicGodItem[5]}, reward = relicReward[5] + 4}, -- piety_duckbills
	[246] = {trade = {relicTrade[1] + 3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[1]}, reward = relicReward[1] + 6}, -- archmages_petasos
	[247] = {trade = {relicTrade[2] + 3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[2]}, reward = relicReward[2] + 6}, -- archmages_coat
	[248] = {trade = {relicTrade[3] + 3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[3]}, reward = relicReward[3] + 6}, -- archmages_gloves
	[249] = {trade = {relicTrade[4] + 3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[4]}, reward = relicReward[4] + 6}, -- archmages_tonban
	[250] = {trade = {relicTrade[5] + 3, dynaCurrency[3], relicTradeMaterial[3], relicGodItem[5]}, reward = relicReward[5] + 6}, -- archmages_sabots
	[251] = {trade = {relicTrade[1] + 4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 8}, -- vitiation_chapeau
	[252] = {trade = {relicTrade[2] + 4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 8}, -- vitiation_tabard
	[253] = {trade = {relicTrade[3] + 4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 8}, -- vitiation_gloves
	[254] = {trade = {relicTrade[4] + 4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 8}, -- vitiation_tights
	[255] = {trade = {relicTrade[5] + 4, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 8}, -- vitiation_boots
	[256] = {trade = {relicTrade[1] + 5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 10}, -- plunderers_bonnet
	[257] = {trade = {relicTrade[2] + 5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 10}, -- plunderers_vest
	[258] = {trade = {relicTrade[3] + 5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 10}, -- plunderers_armlets
	[259] = {trade = {relicTrade[4] + 5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 10}, -- plunderers_culottes
	[260] = {trade = {relicTrade[5] + 5, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 10}, -- plunderers_poulaines
	[261] = {trade = {relicTrade[1] + 6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[1]}, reward = relicReward[1] + 12}, -- caballarius_coronet
	[262] = {trade = {relicTrade[2] + 6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[2]}, reward = relicReward[2] + 12}, -- caballarius_surcoat
	[263] = {trade = {relicTrade[3] + 6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[3]}, reward = relicReward[3] + 12}, -- caballarius_gauntlets
	[264] = {trade = {relicTrade[4] + 6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[4]}, reward = relicReward[4] + 12}, -- caballarius_breeches
	[265] = {trade = {relicTrade[5] + 6, dynaCurrency[2], relicTradeMaterial[1], relicGodItem[5]}, reward = relicReward[5] + 12}, -- caballarius_leggings
	[266] = {trade = {relicTrade[1] + 7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[1]}, reward = relicReward[1] + 14}, -- fallens_burgeonet
	[267] = {trade = {relicTrade[2] + 7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[2]}, reward = relicReward[2] + 14}, -- fallens_cuirass
	[268] = {trade = {relicTrade[3] + 7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[3]}, reward = relicReward[3] + 14}, -- fallens_finger_gauntlets
	[269] = {trade = {relicTrade[4] + 7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[4]}, reward = relicReward[4] + 14}, -- fallens_flanchard
	[270] = {trade = {relicTrade[5] + 7, dynaCurrency[1], relicTradeMaterial[1], relicGodItem[5]}, reward = relicReward[5] + 14}, -- fallens_sollerets
	[271] = {trade = {relicTrade[1] + 8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[1]}, reward = relicReward[1] + 16}, -- ankusa_helm
	[272] = {trade = {relicTrade[2] + 8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[2]}, reward = relicReward[2] + 16}, -- ankusa_jackcoat
	[273] = {trade = {relicTrade[3] + 8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[3]}, reward = relicReward[3] + 16}, -- ankusa_gloves
	[274] = {trade = {relicTrade[4] + 8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[4]}, reward = relicReward[4] + 16}, -- ankusa_trousers
	[275] = {trade = {relicTrade[5] + 8, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[5]}, reward = relicReward[5] + 16}, -- ankusa_gaiters
	[276] = {trade = {relicTrade[1] + 9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 18}, -- bihu_roundlet
	[277] = {trade = {relicTrade[2] + 9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 18}, -- bihu_justaucorps
	[278] = {trade = {relicTrade[3] + 9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 18}, -- bihu_cuffs
	[279] = {trade = {relicTrade[4] + 9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 18}, -- bihu_cannions
	[280] = {trade = {relicTrade[5] + 9, dynaCurrency[1], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 18}, -- bihu_slippers
	[281] = {trade = {relicTrade[1] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 20}, -- arcadian_beret
	[282] = {trade = {relicTrade[2] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 20}, -- arcadian_jerkin
	[283] = {trade = {relicTrade[3] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 20}, -- arcadian_bracers
	[284] = {trade = {relicTrade[4] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 20}, -- arcadian_braccae
	[285] = {trade = {relicTrade[5] + 10, dynaCurrency[3], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 20}, -- arcadian_socks
	[286] = {trade = {relicTrade[1] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[1]}, reward = relicReward[1] + 22}, -- sakonji_kabuto
	[287] = {trade = {relicTrade[2] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[2]}, reward = relicReward[2] + 22}, -- sakonji_domaru
	[288] = {trade = {relicTrade[3] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[3]}, reward = relicReward[3] + 22}, -- sakonji_kote
	[289] = {trade = {relicTrade[4] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[4]}, reward = relicReward[4] + 22}, -- sakonji_haidate
	[290] = {trade = {relicTrade[5] + 11, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[5]}, reward = relicReward[5] + 22}, -- sakonji_sune-ate
	[291] = {trade = {relicTrade[1] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[1]}, reward = relicReward[1] + 24}, -- mochizuki_hatsuburi
	[292] = {trade = {relicTrade[2] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[2]}, reward = relicReward[2] + 24}, -- mochizuki_chainmail
	[293] = {trade = {relicTrade[3] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[3]}, reward = relicReward[3] + 24}, -- mochizuki_tekko
	[294] = {trade = {relicTrade[4] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[4]}, reward = relicReward[4] + 24}, -- mochizuki_hakama
	[295] = {trade = {relicTrade[5] + 12, dynaCurrency[1], relicTradeMaterial[5], relicGodItem[5]}, reward = relicReward[5] + 24}, -- mochizuki_kyahan
	[296] = {trade = {relicTrade[1] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 26}, -- pteroslaver_armet
	[297] = {trade = {relicTrade[2] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 26}, -- pteroslaver_mail
	[298] = {trade = {relicTrade[3] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 26}, -- pteroslaver_finger_gauntlets
	[299] = {trade = {relicTrade[4] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 26}, -- pteroslaver_brais
	[300] = {trade = {relicTrade[5] + 13, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 26}, -- pteroslaver_greaves
	[301] = {trade = {relicTrade[1] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[1]}, reward = relicReward[1] + 28}, -- glyphic_horn
	[302] = {trade = {relicTrade[2] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[2]}, reward = relicReward[2] + 28}, -- glyphic_doublet
	[303] = {trade = {relicTrade[3] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[3]}, reward = relicReward[3] + 28}, -- glyphic_bracers
	[304] = {trade = {relicTrade[4] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[4]}, reward = relicReward[4] + 28}, -- glyphic_spats
	[305] = {trade = {relicTrade[5] + 14, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[5]}, reward = relicReward[5] + 28}, -- glyphic_pigaches
	[306] = {trade = {relicTrade[1] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[1]}, reward = relicReward[1] + 30}, -- luhlaza_keffiyeh
	[307] = {trade = {relicTrade[2] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[2]}, reward = relicReward[2] + 30}, -- luhlaza_jubbah
	[308] = {trade = {relicTrade[3] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[3]}, reward = relicReward[3] + 30}, -- luhlaza_bazubands
	[309] = {trade = {relicTrade[4] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[4]}, reward = relicReward[4] + 30}, -- luhlaza_shalwar
	[310] = {trade = {relicTrade[5] + 15, dynaCurrency[2], relicTradeMaterial[2], relicGodItem[5]}, reward = relicReward[5] + 30}, -- luhlaza_charuqs
	[311] = {trade = {relicTrade[1] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[1]}, reward = relicReward[1] + 32}, -- lanun_tricorne
	[312] = {trade = {relicTrade[2] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[2]}, reward = relicReward[2] + 32}, -- lanun_frac
	[313] = {trade = {relicTrade[3] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[3]}, reward = relicReward[3] + 32}, -- lanun_gants
	[314] = {trade = {relicTrade[4] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[4]}, reward = relicReward[4] + 32}, -- lanun_trews
	[315] = {trade = {relicTrade[5] + 16, dynaCurrency[1], relicTradeMaterial[3], relicGodItem[5]}, reward = relicReward[5] + 32}, -- lanun_bottes
	[316] = {trade = {relicTrade[1] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[1]}, reward = relicReward[1] + 34}, -- pitre_taj
	[317] = {trade = {relicTrade[2] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[2]}, reward = relicReward[2] + 34}, -- pitre_tobe
	[318] = {trade = {relicTrade[3] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[3]}, reward = relicReward[3] + 34}, -- pitre_dastanas
	[319] = {trade = {relicTrade[4] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[4]}, reward = relicReward[4] + 34}, -- pitre_churidars
	[320] = {trade = {relicTrade[5] + 17, dynaCurrency[3], relicTradeMaterial[6], relicGodItem[5]}, reward = relicReward[5] + 34}, -- pitre_babouches
	[321] = {trade = {relicTrade[1] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[1]}, reward = relicReward[1] + 36}, -- horos_tiara
	[322] = {trade = {relicTrade[2] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[2]}, reward = relicReward[2] + 36}, -- horos_casaque
	[323] = {trade = {relicTrade[3] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[3]}, reward = relicReward[3] + 36}, -- horos_bangles
	[324] = {trade = {relicTrade[4] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[4]}, reward = relicReward[4] + 36}, -- horos_tights
	[325] = {trade = {relicTrade[5] + 18, dynaCurrency[2], relicTradeMaterial[4], relicGodItem[5]}, reward = relicReward[5] + 36}, -- horos_shoes
	[326] = {trade = {relicTrade[1] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[1]}, reward = relicReward[1] + 38}, -- pedagogy_mortarboard
	[327] = {trade = {relicTrade[2] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[2]}, reward = relicReward[2] + 38}, -- pedagogy_gown
	[328] = {trade = {relicTrade[3] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[3]}, reward = relicReward[3] + 38}, -- pedagogy_bracers
	[329] = {trade = {relicTrade[4] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[4]}, reward = relicReward[4] + 38}, -- pedagogy_pants
	[330] = {trade = {relicTrade[5] + 19, dynaCurrency[1], relicTradeMaterial[6], relicGodItem[5]}, reward = relicReward[5] + 38}, -- pedagogy_loafers
	[331] = {trade = {{4044, 3}, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[1]}, reward = relicReward[1] + 40}, -- bagua_galero
	[332] = {trade = {{4043, 3}, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[2]}, reward = relicReward[2] + 40}, -- bagua_tunic
	[333] = {trade = {{4042, 3}, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[3]}, reward = relicReward[3] + 40}, -- bagua_mitaines
	[334] = {trade = {{4030, 3}, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[4]}, reward = relicReward[4] + 40}, -- bagua_pants
	[335] = {trade = {{4045, 3}, dynaCurrency[3], relicTradeMaterial[4], relicGodItem[5]}, reward = relicReward[5] + 40}, -- bagua_sandals
	[336] = {trade = {{4046, 3}, dynaCurrency[2], relicTradeMaterial[5], relicGodItem[1]}, reward = relicReward[1] + 42}, -- futhark_bandeau
	[337] = {trade = {{4025, 3}, dynaCurrency[2], relicTradeMaterial[5], relicGodItem[2]}, reward = relicReward[2] + 42}, -- futhark_coat
	[338] = {trade = {{4047, 3}, dynaCurrency[2], relicTradeMaterial[5], relicGodItem[3]}, reward = relicReward[3] + 42}, -- futhark_mitons
	[339] = {trade = {{3923, 3}, dynaCurrency[2], relicTradeMaterial[5], relicGodItem[4]}, reward = relicReward[4] + 42}, -- futhark_trousers
	[340] = {trade = {{4029, 3}, dynaCurrency[2], relicTradeMaterial[5], relicGodItem[5]}, reward = relicReward[5] + 42}, -- futhark_boots
	-- Reforged Relic Armor +1 (119)
	[341] = {trade = {relicTrade[6], dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6]}, -- agoge_mask_+1
	[342] = {trade = {relicTrade[7], dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7]}, -- agoge_lorica_+1
	[343] = {trade = {relicTrade[8], dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8]}, -- agoge_mufflers_+1
	[344] = {trade = {relicTrade[9], dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9]}, -- agoge_cuisses_+1
	[345] = {trade = {relicTrade[10], dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10]}, -- agoge_calligae_+1
	[346] = {trade = {relicTrade[6] + 2, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 2}, -- hesychasts_crown_+1
	[347] = {trade = {relicTrade[7] + 2, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 2}, -- hesychasts_cyclas_+1
	[348] = {trade = {relicTrade[8] + 2, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 2}, -- hesychasts_gloves_+1
	[349] = {trade = {relicTrade[9] + 2, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 2}, -- hesychasts_hose_+1
	[350] = {trade = {relicTrade[10] + 2, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 2}, -- hesychasts_gaiters_+1
	[351] = {trade = {relicTrade[6] + 4, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 4}, -- piety_cap_+1
	[352] = {trade = {relicTrade[7] + 4, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 4}, -- piety_briault_+1
	[353] = {trade = {relicTrade[8] + 4, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 4}, -- piety_mitts_+1
	[354] = {trade = {relicTrade[9] + 4, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 4}, -- piety_pantaloons_+1
	[355] = {trade = {relicTrade[10] + 4, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 4}, -- piety_duckbills_+1
	[356] = {trade = {relicTrade[6] + 6, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 6}, -- archmages_petasos_+1
	[357] = {trade = {relicTrade[7] + 6, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 6}, -- archmages_coat_+1
	[358] = {trade = {relicTrade[8] + 6, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 6}, -- archmages_gloves_+1
	[359] = {trade = {relicTrade[9] + 6, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 6}, -- archmages_tonban_+1
	[360] = {trade = {relicTrade[10] + 6, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 6}, -- archmages_sabots_+1
	[361] = {trade = {relicTrade[6] + 8, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 8}, -- vitiation_chapeau_+1
	[362] = {trade = {relicTrade[7] + 8, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 8}, -- vitiation_tabard_+1
	[363] = {trade = {relicTrade[8] + 8, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 8}, -- vitiation_gloves_+1
	[364] = {trade = {relicTrade[9] + 8, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 8}, -- vitiation_tights_+1
	[365] = {trade = {relicTrade[10] + 8, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 8}, -- vitiation_boots_+1
	[366] = {trade = {relicTrade[6] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 10}, -- plunderers_bonnet_+1
	[367] = {trade = {relicTrade[7] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 10}, -- plunderers_vest_+1
	[368] = {trade = {relicTrade[8] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 10}, -- plunderers_armlets_+1
	[369] = {trade = {relicTrade[9] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 10}, -- plunderers_culottes_+1
	[370] = {trade = {relicTrade[10] + 10, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 10}, -- plunderers_poulaines_+1
	[371] = {trade = {relicTrade[6] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 12}, -- caballarius_coronet_+1
	[372] = {trade = {relicTrade[7] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 12}, -- caballarius_surcoat_+1
	[373] = {trade = {relicTrade[8] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 12}, -- caballarius_gauntlets_+1
	[374] = {trade = {relicTrade[9] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 12}, -- caballarius_breeches_+1
	[375] = {trade = {relicTrade[10] + 12, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 12}, -- caballarius_leggings_+1
	[376] = {trade = {relicTrade[6] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 14}, -- fallens_burgeonet_+1
	[377] = {trade = {relicTrade[7] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 14}, -- fallens_cuirass_+1
	[378] = {trade = {relicTrade[8] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 14}, -- fallens_finger_gauntlets_+1
	[379] = {trade = {relicTrade[9] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 14}, -- fallens_flanchard_+1
	[380] = {trade = {relicTrade[10] + 14, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 14}, -- fallens_sollerets_+1
	[381] = {trade = {relicTrade[6] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 16}, -- ankusa_helm_+1
	[382] = {trade = {relicTrade[7] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 16}, -- ankusa_jackcoat_+1
	[383] = {trade = {relicTrade[8] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 16}, -- ankusa_gloves_+1
	[384] = {trade = {relicTrade[9] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 16}, -- ankusa_trousers_+1
	[385] = {trade = {relicTrade[10] + 16, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 16}, -- ankusa_gaiters_+1
	[386] = {trade = {relicTrade[6] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 18}, -- bihu_roundlet_+1
	[387] = {trade = {relicTrade[7] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 18}, -- bihu_justaucorps_+1
	[388] = {trade = {relicTrade[8] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 18}, -- bihu_cuffs_+1
	[389] = {trade = {relicTrade[9] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 18}, -- bihu_cannions_+1
	[390] = {trade = {relicTrade[10] + 18, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 18}, -- bihu_slippers_+1
	[391] = {trade = {relicTrade[6] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 20}, -- arcadian_beret_+1
	[392] = {trade = {relicTrade[7] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 20}, -- arcadian_jerkin_+1
	[393] = {trade = {relicTrade[8] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 20}, -- arcadian_bracers_+1
	[394] = {trade = {relicTrade[9] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 20}, -- arcadian_braccae_+1
	[395] = {trade = {relicTrade[10] + 20, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 20}, -- arcadian_socks_+1
	[396] = {trade = {relicTrade[6] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 22}, -- sakonji_kabuto_+1
	[397] = {trade = {relicTrade[7] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 22}, -- sakonji_domaru_+1
	[398] = {trade = {relicTrade[8] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 22}, -- sakonji_kote_+1
	[399] = {trade = {relicTrade[9] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 22}, -- sakonji_haidate_+1
	[400] = {trade = {relicTrade[10] + 22, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 22}, -- sakonji_sune-ate_+1
	[401] = {trade = {relicTrade[6] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 24}, -- mochizuki_hatsuburi_+1
	[402] = {trade = {relicTrade[7] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 24}, -- mochizuki_chainmail_+1
	[403] = {trade = {relicTrade[8] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 24}, -- mochizuki_tekko_+1
	[404] = {trade = {relicTrade[9] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 24}, -- mochizuki_hakama_+1
	[405] = {trade = {relicTrade[10] + 24, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 24}, -- mochizuki_kyahan_+1
	[406] = {trade = {relicTrade[6] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 26}, -- pteroslaver_armet_+1
	[407] = {trade = {relicTrade[7] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 26}, -- pteroslaver_mail_+1
	[408] = {trade = {relicTrade[8] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 26}, -- pteroslaver_finger_gauntlets_+1
	[409] = {trade = {relicTrade[9] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 26}, -- pteroslaver_brais_+1
	[410] = {trade = {relicTrade[10] + 26, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 26}, -- pteroslaver_greaves_+1
	[411] = {trade = {relicTrade[6] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 28}, -- glyphic_horn_+1
	[412] = {trade = {relicTrade[7] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 28}, -- glyphic_doublet_+1
	[413] = {trade = {relicTrade[8] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 28}, -- glyphic_bracers_+1
	[414] = {trade = {relicTrade[9] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 28}, -- glyphic_spats_+1
	[415] = {trade = {relicTrade[10] + 28, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 28}, -- glyphic_pigaches_+1
	[416] = {trade = {relicTrade[6] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 30}, -- luhlaza_keffiyeh_+1
	[417] = {trade = {relicTrade[7] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 30}, -- luhlaza_jubbah_+1
	[418] = {trade = {relicTrade[8] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 30}, -- luhlaza_bazubands_+1
	[419] = {trade = {relicTrade[9] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 30}, -- luhlaza_shalwar_+1
	[420] = {trade = {relicTrade[10] + 30, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 30}, -- luhlaza_charuqs_+1
	[421] = {trade = {relicTrade[6] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 32}, -- lanun_tricorne_+1
	[422] = {trade = {relicTrade[7] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 32}, -- lanun_frac_+1
	[423] = {trade = {relicTrade[8] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 32}, -- lanun_gants_+1
	[424] = {trade = {relicTrade[9] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 32}, -- lanun_trews_+1
	[425] = {trade = {relicTrade[10] + 32, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 32}, -- lanun_bottes_+1
	[426] = {trade = {relicTrade[6] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 34}, -- pitre_taj_+1
	[427] = {trade = {relicTrade[7] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 34}, -- pitre_tobe_+1
	[428] = {trade = {relicTrade[8] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 34}, -- pitre_dastanas_+1
	[429] = {trade = {relicTrade[9] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 34}, -- pitre_churidars_+1
	[430] = {trade = {relicTrade[10] + 34, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 34}, -- pitre_babouches_+1
	[431] = {trade = {relicTrade[6] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 36}, -- horos_tiara_+1
	[432] = {trade = {relicTrade[7] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 36}, -- horos_casaque_+1
	[433] = {trade = {relicTrade[8] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 36}, -- horos_bangles_+1
	[434] = {trade = {relicTrade[9] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 36}, -- horos_tights_+1
	[435] = {trade = {relicTrade[10] + 36, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 36}, -- horos_shoes_+1
	[436] = {trade = {relicTrade[6] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[7]}, reward = relicReward[6] + 38}, -- pedagogy_mortarboard_+1
	[437] = {trade = {relicTrade[7] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[8]}, reward = relicReward[7] + 38}, -- pedagogy_gown_+1
	[438] = {trade = {relicTrade[8] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[9]}, reward = relicReward[8] + 38}, -- pedagogy_bracers_+1
	[439] = {trade = {relicTrade[9] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[10]}, reward = relicReward[9] + 38}, -- pedagogy_pants_+1
	[440] = {trade = {relicTrade[10] + 38, dynaCurrency[1], dynaCurrency[4], relicTradeMaterial[11]}, reward = relicReward[10] + 38}, -- pedagogy_loafers_+1
	[441] = {trade = {relicTrade[6] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[7]}, reward = relicReward[6] + 40}, -- bagua_galero_+1
	[442] = {trade = {relicTrade[7] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[8]}, reward = relicReward[7] + 40}, -- bagua_tunic_+1
	[443] = {trade = {relicTrade[8] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[9]}, reward = relicReward[8] + 40}, -- bagua_mitaines_+1
	[444] = {trade = {relicTrade[9] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[10]}, reward = relicReward[9] + 40}, -- bagua_pants_+1
	[445] = {trade = {relicTrade[10] + 40, dynaCurrency[3], dynaCurrency[6], relicTradeMaterial[11]}, reward = relicReward[10] + 40}, -- bagua_sandals_+1
	[446] = {trade = {relicTrade[6] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[7]}, reward = relicReward[6] + 42}, -- futhark_bandeau_+1
	[447] = {trade = {relicTrade[7] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[8]}, reward = relicReward[7] + 42}, -- futhark_coat_+1
	[448] = {trade = {relicTrade[8] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[9]}, reward = relicReward[8] + 42}, -- futhark_mitons_+1
	[449] = {trade = {relicTrade[9] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[10]}, reward = relicReward[9] + 42}, -- futhark_trousers_+1
	[450] = {trade = {relicTrade[10] + 42, dynaCurrency[2], dynaCurrency[5], relicTradeMaterial[11]}, reward = relicReward[10] + 42}, -- futhark_boots_+1
}

-- Ravager's Mask +2, Ravager's Lorica +2, Ravager's Mufflers +2, Ravager's Cuisses +2, Ravager's Calligae +2,
-- Boii Mask, Boii Lorica, Boii Mufflers, Boii Cuisses, Boii Calligae
local empTrade = {11064, 11084, 11104, 11124, 11144,
				  26740, 26898, 27052, 27237, 27411}

-- Ravager's Seal: Head x8, Ravager's Seal: Body x8, Ravager's Seal: Hands x8, Ravager's Seal: Legs x8, Ravager's Seal: Feet x8
-- Purple Spriggan Spirit x8, Pachypodium Spirit x8, Ake-Ome Spirit x8, Bottle of Star Sprinkles x8, Chestnut Tree Sap x8
-- Red Spriggan Spirit x8, Beetle Spirit x8, Antlion Spirit x8, Monarch Beetle Saliva x8, Dragoneye x8
local empSeals = {3110, 3130, 3150, 3170, 3190,
				  8760, 4056, 8736, 8737, 3986,
				  8761, 4054, 4055, 3985, 4048}

-- Bakka's Wing, Balaur Skull, Lieje Lantern, Chasmic Stinger, Keesha's Pamama, Marvin's Pelage,
-- Mikey's Nugget, Chukwa's Egg, Cuelebre's Horn, Mictlantecuhtli's Habit, Manananggal's Necklet
local empTradeMaterial = {2938, 2943, 2944, 2936, 2941, 2935,
						  2942, 2933, 2939, 2940, 2934}

-- Briareus Helm, Glavoid Shell, Kukulkan Fang, Carabosse Gem, 2-Leaf Chloris Bud
local empBossItem = {2929, 2927, 2932, 2930, 2928}

-- Boii Mask, Boii Lorica, Boii Mufflers, Boii Cuisses, Boii Calligae
-- Boii Mask +1, Boii Lorica +1, Boii Mufflers +1, Boii Cuisses +1, Boii Calligae +1
local empReward = {26740, 26898, 27052, 27237, 27411,
				   26741, 26899, 27053, 27238, 27412}

-----------------------------------
-- empyrean armor upgrade data
-----------------------------------
local reforgedEmpyreanArmor =
{
	-- -- Reforged Empyrean Armor (109)
	[451] = {trade = {empTrade[1], {empSeals[1], 8}, empTradeMaterial[6], empBossItem[1]}, reward = empReward[1]}, -- boii_mask
	[452] = {trade = {empTrade[2], {empSeals[2], 8}, empTradeMaterial[6], empBossItem[2]}, reward = empReward[2]}, -- boii_lorica
	[453] = {trade = {empTrade[3], {empSeals[3], 8}, empTradeMaterial[6], empBossItem[3]}, reward = empReward[3]}, -- boii_mufflers
	[454] = {trade = {empTrade[4], {empSeals[4], 8}, empTradeMaterial[6], empBossItem[4]}, reward = empReward[4]}, -- boii_cuisses
	[455] = {trade = {empTrade[5], {empSeals[5], 8}, empTradeMaterial[6], empBossItem[5]}, reward = empReward[5]}, -- boii_calligae
	[456] = {trade = {empTrade[1] + 1, {empSeals[1] + 1, 8}, empTradeMaterial[5], empBossItem[1]}, reward = empReward[1] + 2}, -- bhikku_crown
	[457] = {trade = {empTrade[2] + 1, {empSeals[2] + 1, 8}, empTradeMaterial[5], empBossItem[2]}, reward = empReward[2] + 2}, -- bhikku_cyclas
	[458] = {trade = {empTrade[3] + 1, {empSeals[3] + 1, 8}, empTradeMaterial[5], empBossItem[3]}, reward = empReward[3] + 2}, -- bhikku_gloves
	[459] = {trade = {empTrade[4] + 1, {empSeals[4] + 1, 8}, empTradeMaterial[5], empBossItem[4]}, reward = empReward[4] + 2}, -- bhikku_hose
	[460] = {trade = {empTrade[5] + 1, {empSeals[5] + 1, 8}, empTradeMaterial[5], empBossItem[5]}, reward = empReward[5] + 2}, -- bhikku_gaiters
	[461] = {trade = {empTrade[1] + 2, {empSeals[1] + 2, 8}, empTradeMaterial[1], empBossItem[1]}, reward = empReward[1] + 4}, -- ebers_cap
	[462] = {trade = {empTrade[2] + 2, {empSeals[2] + 2, 8}, empTradeMaterial[1], empBossItem[2]}, reward = empReward[2] + 4}, -- ebers_bliaud
	[463] = {trade = {empTrade[3] + 2, {empSeals[3] + 2, 8}, empTradeMaterial[1], empBossItem[3]}, reward = empReward[3] + 4}, -- ebers_mitts
	[464] = {trade = {empTrade[4] + 2, {empSeals[4] + 2, 8}, empTradeMaterial[1], empBossItem[4]}, reward = empReward[4] + 4}, -- ebers_pantaloons
	[465] = {trade = {empTrade[5] + 2, {empSeals[5] + 2, 8}, empTradeMaterial[1], empBossItem[5]}, reward = empReward[5] + 4}, -- ebers_duckbills
	[466] = {trade = {empTrade[1] + 3, {empSeals[1] + 3, 8}, empTradeMaterial[3], empBossItem[1]}, reward = empReward[1] + 6}, -- wicce_petasos
	[467] = {trade = {empTrade[2] + 3, {empSeals[2] + 3, 8}, empTradeMaterial[3], empBossItem[2]}, reward = empReward[2] + 6}, -- wicce_coat
	[468] = {trade = {empTrade[3] + 3, {empSeals[3] + 3, 8}, empTradeMaterial[3], empBossItem[3]}, reward = empReward[3] + 6}, -- wicce_gloves
	[469] = {trade = {empTrade[4] + 3, {empSeals[4] + 3, 8}, empTradeMaterial[3], empBossItem[4]}, reward = empReward[4] + 6}, -- wicce_chausses
	[470] = {trade = {empTrade[5] + 3, {empSeals[5] + 3, 8}, empTradeMaterial[3], empBossItem[5]}, reward = empReward[5] + 6}, -- wicce_sabots
	[471] = {trade = {empTrade[1] + 4, {empSeals[1] + 4, 8}, empTradeMaterial[11], empBossItem[1]}, reward = empReward[1] + 8}, -- lethargy_chappel
	[472] = {trade = {empTrade[2] + 4, {empSeals[2] + 4, 8}, empTradeMaterial[11], empBossItem[2]}, reward = empReward[2] + 8}, -- lethargy_sayon
	[473] = {trade = {empTrade[3] + 4, {empSeals[3] + 4, 8}, empTradeMaterial[11], empBossItem[3]}, reward = empReward[3] + 8}, -- lethargy_gantherots
	[474] = {trade = {empTrade[4] + 4, {empSeals[4] + 4, 8}, empTradeMaterial[11], empBossItem[4]}, reward = empReward[4] + 8}, -- lethargy_fuseau
	[475] = {trade = {empTrade[5] + 4, {empSeals[5] + 4, 8}, empTradeMaterial[11], empBossItem[5]}, reward = empReward[5] + 8}, -- lethargy_houseaux
	[476] = {trade = {empTrade[1] + 5, {empSeals[1] + 5, 8}, empTradeMaterial[4], empBossItem[1]}, reward = empReward[1] + 10}, -- skulkers_bonnet
	[477] = {trade = {empTrade[2] + 5, {empSeals[2] + 5, 8}, empTradeMaterial[4], empBossItem[2]}, reward = empReward[2] + 10}, -- skulkers_vest
	[478] = {trade = {empTrade[3] + 5, {empSeals[3] + 5, 8}, empTradeMaterial[4], empBossItem[3]}, reward = empReward[3] + 10}, -- skulkers_armlets
	[479] = {trade = {empTrade[4] + 5, {empSeals[4] + 5, 8}, empTradeMaterial[4], empBossItem[4]}, reward = empReward[4] + 10}, -- skulkers_culottes
	[480] = {trade = {empTrade[5] + 5, {empSeals[5] + 5, 8}, empTradeMaterial[4], empBossItem[5]}, reward = empReward[5] + 10}, -- skulkers_poulaines
	[481] = {trade = {empTrade[1] + 6, {empSeals[1] + 6, 8}, empTradeMaterial[8], empBossItem[1]}, reward = empReward[1] + 12}, -- chevaliers_armet
	[482] = {trade = {empTrade[2] + 6, {empSeals[2] + 6, 8}, empTradeMaterial[8], empBossItem[2]}, reward = empReward[2] + 12}, -- chevaliers_cuirass
	[483] = {trade = {empTrade[3] + 6, {empSeals[3] + 6, 8}, empTradeMaterial[8], empBossItem[3]}, reward = empReward[3] + 12}, -- chevaliers_gauntlets
	[484] = {trade = {empTrade[4] + 6, {empSeals[4] + 6, 8}, empTradeMaterial[8], empBossItem[4]}, reward = empReward[4] + 12}, -- chevaliers_cuisses
	[485] = {trade = {empTrade[5] + 6, {empSeals[5] + 6, 8}, empTradeMaterial[8], empBossItem[5]}, reward = empReward[5] + 12}, -- chevaliers_sabatons
	[486] = {trade = {empTrade[1] + 7, {empSeals[1] + 7, 8}, empTradeMaterial[3], empBossItem[1]}, reward = empReward[1] + 14}, -- heathens_burgeonet
	[487] = {trade = {empTrade[2] + 7, {empSeals[2] + 7, 8}, empTradeMaterial[3], empBossItem[2]}, reward = empReward[2] + 14}, -- heathens_cuirass
	[488] = {trade = {empTrade[3] + 7, {empSeals[3] + 7, 8}, empTradeMaterial[3], empBossItem[3]}, reward = empReward[3] + 14}, -- heathens_gauntlets
	[489] = {trade = {empTrade[4] + 7, {empSeals[4] + 7, 8}, empTradeMaterial[3], empBossItem[4]}, reward = empReward[4] + 14}, -- heathens_flanchard
	[490] = {trade = {empTrade[5] + 7, {empSeals[5] + 7, 8}, empTradeMaterial[3], empBossItem[5]}, reward = empReward[5] + 14}, -- heathens_sollerets
	[491] = {trade = {empTrade[1] + 8, {empSeals[1] + 8, 8}, empTradeMaterial[6], empBossItem[1]}, reward = empReward[1] + 16}, -- nukumi_cabasset
	[492] = {trade = {empTrade[2] + 8, {empSeals[2] + 8, 8}, empTradeMaterial[6], empBossItem[2]}, reward = empReward[2] + 16}, -- nukumi_gausape
	[493] = {trade = {empTrade[3] + 8, {empSeals[3] + 8, 8}, empTradeMaterial[6], empBossItem[3]}, reward = empReward[3] + 16}, -- nukumi_manoplas
	[494] = {trade = {empTrade[4] + 8, {empSeals[4] + 8, 8}, empTradeMaterial[6], empBossItem[4]}, reward = empReward[4] + 16}, -- nukumi_quijotes
	[495] = {trade = {empTrade[5] + 8, {empSeals[5] + 8, 8}, empTradeMaterial[6], empBossItem[5]}, reward = empReward[5] + 16}, -- nukumi_ocreae
	[496] = {trade = {empTrade[1] + 9, {empSeals[1] + 9, 8}, empTradeMaterial[9], empBossItem[1]}, reward = empReward[1] + 18}, -- fili_calot
	[497] = {trade = {empTrade[2] + 9, {empSeals[2] + 9, 8}, empTradeMaterial[9], empBossItem[2]}, reward = empReward[2] + 18}, -- fili_hongreline
	[498] = {trade = {empTrade[3] + 9, {empSeals[3] + 9, 8}, empTradeMaterial[9], empBossItem[3]}, reward = empReward[3] + 18}, -- fili_manchettes
	[499] = {trade = {empTrade[4] + 9, {empSeals[4] + 9, 8}, empTradeMaterial[9], empBossItem[4]}, reward = empReward[4] + 18}, -- fili_rhingrave
	[500] = {trade = {empTrade[5] + 9, {empSeals[5] + 9, 8}, empTradeMaterial[9], empBossItem[5]}, reward = empReward[5] + 18}, -- fili_cothurnes
	[501] = {trade = {empTrade[1] + 10, {empSeals[1] + 10, 8}, empTradeMaterial[7], empBossItem[1]}, reward = empReward[1] + 20}, -- amini_gapette
	[502] = {trade = {empTrade[2] + 10, {empSeals[2] + 10, 8}, empTradeMaterial[7], empBossItem[2]}, reward = empReward[2] + 20}, -- amini_caban
	[503] = {trade = {empTrade[3] + 10, {empSeals[3] + 10, 8}, empTradeMaterial[7], empBossItem[3]}, reward = empReward[3] + 20}, -- amini_glovelettes
	[504] = {trade = {empTrade[4] + 10, {empSeals[4] + 10, 8}, empTradeMaterial[7], empBossItem[4]}, reward = empReward[4] + 20}, -- amini_brague
	[505] = {trade = {empTrade[5] + 10, {empSeals[5] + 10, 8}, empTradeMaterial[7], empBossItem[5]}, reward = empReward[5] + 20}, -- amini_bottillons
	[506] = {trade = {empTrade[1] + 11, {empSeals[1] + 11, 8}, empTradeMaterial[11], empBossItem[1]}, reward = empReward[1] + 22}, -- kasuga_kabuto
	[507] = {trade = {empTrade[2] + 11, {empSeals[2] + 11, 8}, empTradeMaterial[11], empBossItem[2]}, reward = empReward[2] + 22}, -- kasuga_domaru
	[508] = {trade = {empTrade[3] + 11, {empSeals[3] + 11, 8}, empTradeMaterial[11], empBossItem[3]}, reward = empReward[3] + 22}, -- kasuga_kote
	[509] = {trade = {empTrade[4] + 11, {empSeals[4] + 11, 8}, empTradeMaterial[11], empBossItem[4]}, reward = empReward[4] + 22}, -- kasuga_haidate
	[510] = {trade = {empTrade[5] + 11, {empSeals[5] + 11, 8}, empTradeMaterial[11], empBossItem[5]}, reward = empReward[5] + 22}, -- kasuga_sune-ate
	[511] = {trade = {empTrade[1] + 12, {empSeals[1] + 12, 8}, empTradeMaterial[5], empBossItem[1]}, reward = empReward[1] + 24}, -- hattori_zukin
	[512] = {trade = {empTrade[2] + 12, {empSeals[2] + 12, 8}, empTradeMaterial[5], empBossItem[2]}, reward = empReward[2] + 24}, -- hattori_ningi
	[513] = {trade = {empTrade[3] + 12, {empSeals[3] + 12, 8}, empTradeMaterial[5], empBossItem[3]}, reward = empReward[3] + 24}, -- hattori_tekko
	[514] = {trade = {empTrade[4] + 12, {empSeals[4] + 12, 8}, empTradeMaterial[5], empBossItem[4]}, reward = empReward[4] + 24}, -- hattori_hakama
	[515] = {trade = {empTrade[5] + 12, {empSeals[5] + 12, 8}, empTradeMaterial[5], empBossItem[5]}, reward = empReward[5] + 24}, -- hattori_kyahan
	[516] = {trade = {empTrade[1] + 13, {empSeals[1] + 13, 8}, empTradeMaterial[2], empBossItem[1]}, reward = empReward[1] + 26}, -- peltasts_mezail
	[517] = {trade = {empTrade[2] + 13, {empSeals[2] + 13, 8}, empTradeMaterial[2], empBossItem[2]}, reward = empReward[2] + 26}, -- peltasts_plackart
	[518] = {trade = {empTrade[3] + 13, {empSeals[3] + 13, 8}, empTradeMaterial[2], empBossItem[3]}, reward = empReward[3] + 26}, -- peltasts_vambraces
	[519] = {trade = {empTrade[4] + 13, {empSeals[4] + 13, 8}, empTradeMaterial[2], empBossItem[4]}, reward = empReward[4] + 26}, -- peltasts_cuissots
	[520] = {trade = {empTrade[5] + 13, {empSeals[5] + 13, 8}, empTradeMaterial[2], empBossItem[5]}, reward = empReward[5] + 26}, -- peltasts_schynbalds
	[521] = {trade = {empTrade[1] + 14, {empSeals[1] + 14, 8}, empTradeMaterial[10], empBossItem[1]}, reward = empReward[1] + 28}, -- beckoners_horn
	[522] = {trade = {empTrade[2] + 14, {empSeals[2] + 14, 8}, empTradeMaterial[10], empBossItem[2]}, reward = empReward[2] + 28}, -- beckoners_doublet
	[523] = {trade = {empTrade[3] + 14, {empSeals[3] + 14, 8}, empTradeMaterial[10], empBossItem[3]}, reward = empReward[3] + 28}, -- beckoners_bracers
	[524] = {trade = {empTrade[4] + 14, {empSeals[4] + 14, 8}, empTradeMaterial[10], empBossItem[4]}, reward = empReward[4] + 28}, -- beckoners_spats
	[525] = {trade = {empTrade[5] + 14, {empSeals[5] + 14, 8}, empTradeMaterial[10], empBossItem[5]}, reward = empReward[5] + 28}, -- beckoners_pigaches
	[526] = {trade = {empTrade[1] + 15, {empSeals[1] + 15, 8}, empTradeMaterial[2], empBossItem[1]}, reward = empReward[1] + 30}, -- hashishin_kavuk
	[527] = {trade = {empTrade[2] + 15, {empSeals[2] + 15, 8}, empTradeMaterial[2], empBossItem[2]}, reward = empReward[2] + 30}, -- hashishin_mintan
	[528] = {trade = {empTrade[3] + 15, {empSeals[3] + 15, 8}, empTradeMaterial[2], empBossItem[3]}, reward = empReward[3] + 30}, -- hashishin_bazubands
	[529] = {trade = {empTrade[4] + 15, {empSeals[4] + 15, 8}, empTradeMaterial[2], empBossItem[4]}, reward = empReward[4] + 30}, -- hashishin_tayt
	[530] = {trade = {empTrade[5] + 15, {empSeals[5] + 15, 8}, empTradeMaterial[2], empBossItem[5]}, reward = empReward[5] + 30}, -- hashishin_basmak
	[531] = {trade = {empTrade[1] + 16, {empSeals[1] + 16, 8}, empTradeMaterial[9], empBossItem[1]}, reward = empReward[1] + 32}, -- chasseurs_tricorne
	[532] = {trade = {empTrade[2] + 16, {empSeals[2] + 16, 8}, empTradeMaterial[9], empBossItem[2]}, reward = empReward[2] + 32}, -- chasseurs_frac
	[533] = {trade = {empTrade[3] + 16, {empSeals[3] + 16, 8}, empTradeMaterial[9], empBossItem[3]}, reward = empReward[3] + 32}, -- chasseurs_gants
	[534] = {trade = {empTrade[4] + 16, {empSeals[4] + 16, 8}, empTradeMaterial[9], empBossItem[4]}, reward = empReward[4] + 32}, -- chasseurs_culottes
	[535] = {trade = {empTrade[5] + 16, {empSeals[5] + 16, 8}, empTradeMaterial[9], empBossItem[5]}, reward = empReward[5] + 32}, -- chasseurs_bottes
	[536] = {trade = {empTrade[1] + 17, {empSeals[1] + 17, 8}, empTradeMaterial[7], empBossItem[1]}, reward = empReward[1] + 34}, -- karagoz_capello
	[537] = {trade = {empTrade[2] + 17, {empSeals[2] + 17, 8}, empTradeMaterial[7], empBossItem[2]}, reward = empReward[2] + 34}, -- karagoz_farsetto
	[538] = {trade = {empTrade[3] + 17, {empSeals[3] + 17, 8}, empTradeMaterial[7], empBossItem[3]}, reward = empReward[3] + 34}, -- karagoz_guanti
	[539] = {trade = {empTrade[4] + 17, {empSeals[4] + 17, 8}, empTradeMaterial[7], empBossItem[4]}, reward = empReward[4] + 34}, -- karagoz_pantaloni
	[540] = {trade = {empTrade[5] + 17, {empSeals[5] + 17, 8}, empTradeMaterial[7], empBossItem[5]}, reward = empReward[5] + 34}, -- karagoz_scarpe
	[541] = {trade = {empTrade[1] + 18, {empSeals[1] + 18, 8}, empTradeMaterial[4], empBossItem[1]}, reward = empReward[1] + 36}, -- maculele_tiara
	[542] = {trade = {empTrade[2] + 18, {empSeals[2] + 18, 8}, empTradeMaterial[4], empBossItem[2]}, reward = empReward[2] + 36}, -- maculele_casaque
	[543] = {trade = {empTrade[3] + 18, {empSeals[3] + 18, 8}, empTradeMaterial[4], empBossItem[3]}, reward = empReward[3] + 36}, -- maculele_bangles
	[544] = {trade = {empTrade[4] + 18, {empSeals[4] + 18, 8}, empTradeMaterial[4], empBossItem[4]}, reward = empReward[4] + 36}, -- maculele_tights
	[545] = {trade = {empTrade[5] + 18, {empSeals[5] + 18, 8}, empTradeMaterial[4], empBossItem[5]}, reward = empReward[5] + 36}, -- maculele_toeshoes
	[546] = {trade = {empTrade[1] + 19, {empSeals[1] + 19, 8}, empTradeMaterial[1], empBossItem[1]}, reward = empReward[1] + 38}, -- arbatel_bonnet
	[547] = {trade = {empTrade[2] + 19, {empSeals[2] + 19, 8}, empTradeMaterial[1], empBossItem[2]}, reward = empReward[2] + 38}, -- arbatel_gown
	[548] = {trade = {empTrade[3] + 19, {empSeals[3] + 19, 8}, empTradeMaterial[1], empBossItem[3]}, reward = empReward[3] + 38}, -- arbatel_bracers
	[549] = {trade = {empTrade[4] + 19, {empSeals[4] + 19, 8}, empTradeMaterial[1], empBossItem[4]}, reward = empReward[4] + 38}, -- arbatel_pants
	[550] = {trade = {empTrade[5] + 19, {empSeals[5] + 19, 8}, empTradeMaterial[1], empBossItem[5]}, reward = empReward[5] + 38}, -- arbatel_loafers
	[551] = {trade = {{4044, 3}, {empSeals[6], 8}, empTradeMaterial[10], empBossItem[1]}, reward = empReward[1] + 40}, -- azimuth_hood
	[552] = {trade = {{4043, 3}, {empSeals[7], 8}, empTradeMaterial[10], empBossItem[2]}, reward = empReward[2] + 40}, -- azimuth_coat
	[553] = {trade = {{4042, 3}, {empSeals[8], 8}, empTradeMaterial[10], empBossItem[3]}, reward = empReward[3] + 40}, -- azimuth_gloves
	[554] = {trade = {{4030, 3}, {empSeals[9], 8}, empTradeMaterial[10], empBossItem[4]}, reward = empReward[4] + 40}, -- azimuth_tights
	[555] = {trade = {{4045, 3}, {empSeals[10], 8}, empTradeMaterial[10], empBossItem[5]}, reward = empReward[5] + 40}, -- azimuth_gaiters
	[556] = {trade = {{4046, 3}, {empSeals[11], 8}, empTradeMaterial[8], empBossItem[1]}, reward = empReward[1] + 42}, -- erilaz_galea
	[557] = {trade = {{4025, 3}, {empSeals[12], 8}, empTradeMaterial[8], empBossItem[2]}, reward = empReward[2] + 42}, -- erilaz_surcoat
	[558] = {trade = {{4047, 3}, {empSeals[13], 8}, empTradeMaterial[8], empBossItem[3]}, reward = empReward[3] + 42}, -- erilaz_gauntlets
	[559] = {trade = {{3923, 3}, {empSeals[14], 8}, empTradeMaterial[8], empBossItem[4]}, reward = empReward[4] + 42}, -- erilaz_leg_guards
	[560] = {trade = {{4029, 3}, {empSeals[15], 8}, empTradeMaterial[8], empBossItem[5]}, reward = empReward[5] + 42}, -- erilaz_greaves
}

function onTrade(player, npc, trade)
	local gilCost
	local tradedCombo = 0
	local augItem = 0
	local skyAugmentsCarryOver = {
		{"1", "14", "31", "9", "42", "1", "54", "1"}, 	-- HP +15, EVA +10, Enemy Crit Hit Rate -2%, PDT -2%
		{"41", "1", "328", "1", "106", "9", "195", "2"}, -- Crit Hit Rate +2%, Crit Hit Damage +2%, ACC/RACC +10, Subtle Blow +3
		{"9", "14", "133", "4", "362", "9", "35", "9"}, -- MP +15, MAB +5, Magic Damage +10, MACC +10
		{"1806", "4", "102", "1", "115", "2"}, 			-- Pet: STR/DEX/VIT +5, Pet: Crit Hit Rate +2%, Pet: Store TP +3
		-- {"1", "29", "31", "19", "42", "3", "54", "3"}, 	-- HP +30, EVA +20, Enemy Crit Hit Rate -4%, PDT -4%
		-- {"41", "4", "328", "4", "106", "19", "195", "5"}, -- Crit Hit Rate +4%, Crit Hit Damage +4%, ACC/RACC +20, Subtle Blow +6
		-- {"9", "29", "133", "9", "362", "19", "35", "19"}, -- MP +30, MAB +10, Magic Damage +20, MACC +20
		-- {"1806", "9", "102", "3", "115", "5"}, 			-- Pet: STR/DEX/VIT +10, Pet: Crit Hit Rate +4%, Pet: Store TP +6
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
		
		if ((tradedCombo >= 116 and tradedCombo <= 230) or (tradedCombo >= 341 and tradedCombo <= 450)) then
			checkGenbu = player:getCharVar("[Aug]SuibhnePathGenbu_"..augItem)
			checkByakko = player:getCharVar("[Aug]SuibhnePathByakko_"..augItem)
			checkSeiryu = player:getCharVar("[Aug]SuibhnePathSeiryu_"..augItem)
			checkSuzaku = player:getCharVar("[Aug]SuibhnePathSuzaku_"..augItem)
		end
		
		if (checkGenbu == 1) then
			augments = skyAugmentsCarryOver[1]
			player:setCharVar("[Aug]SuibhnePathGenbu_"..augItem, 0)
		elseif (checkByakko == 1) then
			augments = skyAugmentsCarryOver[2]
			player:setCharVar("[Aug]SuibhnePathByakko_"..augItem, 0)
		elseif (checkSuzaku == 1) then
			augments = skyAugmentsCarryOver[3]
			player:setCharVar("[Aug]SuibhnePathSuzaku_"..augItem, 0)
		elseif (checkSeiryu == 1) then
			augments = skyAugmentsCarryOver[4]
			player:setCharVar("[Aug]SuibhnePathSeiryu_"..augItem, 0)
		end
		
		if (tradedCombo <= 230) then
			reward = reforgedArtifactArmor[tradedCombo].reward
		elseif (tradedCombo >= 231 and tradedCombo <= 450) then
			reward = reforgedRelicArmor[tradedCombo].reward
		elseif (tradedCombo >= 451 and tradedCombo <= 560) then
			reward = reforgedEmpyreanArmor[tradedCombo].reward
		end
		
		if (tradedCombo <= 115) then
			player:delGil(50000)
		end
	
		player:confirmTrade()
		player:addItem(reward, 1, augments[1], augments[2], augments[3], augments[4], augments[5], augments[6], augments[7], augments[8])
		player:messageSpecial(ID.text.ITEM_OBTAINED, reward)
	end
end

function onTrigger(player, npc)
	player:PrintToPlayer(string.format("Monisette : Oh, hello! I handle the trades for Reforged Artifact, Relic, and Empyrean armor."),tpz.msg.channel.NS_SAY)
	player:PrintToPlayer(string.format("Monisette : Please note that if you have augmented any of the Reforged armor using Suibhne I will carry over the augments to the upgraded set!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end