-----------------------------------
-- Area: Port Jeuno
--  NPC: Monisette
-- !pos -6 0 -11 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------


-----------------------------------
-- artifact armor upgrade data
-- [combinationId] = {trade = {artifactBase, remTale, jobIngredient, godItem}, reward = afPlusOne},
-----------------------------------
-- Fighter's Mask +1, Fighter's Lorica +1, Fighter's Mufflers +1, Fighter's Cuisses +1, Fighter's Calligae +1
local tradePiece = {15225, 14473, 14890, 15561, 15352}

-- Rem's Tale Ch.01 x5, Rem's Tale Ch.02 x5, Rem's Tale Ch.03 x5, Rem's Tale Ch.04 x5, Rem's Tale Ch.05 x5
local remTales = {{4064, 5}, {4065, 5}, {4066, 5}, {4067, 5}, {4068, 5}}

-- Tiger Leather, Gold Thread, Imperial Silk Cloth, Karakul Cloth, Scarlet Linen, Gold Sheet, Darksteel Sheet, Tama-Hagane
local tradeMaterial = {855, 823, 2340, 2288, 1699, 752, 664, 657}

-- Phoenix Feather, Malboro Fiber, Beetle Blood, Damascene Cloth, Oxblood
local godItem = {844, 837, 1110, 836, 1311}

-- Pummeler's Mask, Pummeler's Lorica, Pummeler's Mufflers, Pummeler's Cuisses, Pummeler's Calligae
local rewardPiece = {27663, 27807, 27943, 28090, 28223}

local gilCost = {"gil", 50000}

local reforgedArtifactArmor =
{
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
	[106] = {trade = {{4044, 3}, remTales[1], tradeMaterial[3], godItem[1], {"gil", 100000}}, reward = 27786}, -- geomancy_galero
	[107] = {trade = {{4043, 3}, remTales[2], tradeMaterial[3], godItem[2], {"gil", 100000}}, reward = 27926}, -- geomancy_tunic
	[108] = {trade = {{4042, 3}, remTales[3], tradeMaterial[3], godItem[3], {"gil", 100000}}, reward = 28066}, -- geomancy_mitaines
	[109] = {trade = {{4030, 3}, remTales[4], tradeMaterial[3], godItem[4], {"gil", 100000}}, reward = 28206}, -- geomancy_pants
	[110] = {trade = {{4045, 3}, remTales[5], tradeMaterial[3], godItem[5], {"gil", 100000}}, reward = 28346}, -- geomancy_sandals
	[111] = {trade = {{4046, 3}, remTales[1], tradeMaterial[7], godItem[1], {"gil", 100000}}, reward = 27787}, -- runeist_bandeau
	[112] = {trade = {{4025, 3}, remTales[2], tradeMaterial[7], godItem[2], {"gil", 100000}}, reward = 27927}, -- runeist_coat
	[113] = {trade = {{4047, 3}, remTales[3], tradeMaterial[7], godItem[3], {"gil", 100000}}, reward = 28067}, -- runeist_mitons
	[114] = {trade = {{3923, 3}, remTales[4], tradeMaterial[7], godItem[4], {"gil", 100000}}, reward = 28207}, -- runeist_trousers
	[115] = {trade = {{4029, 3}, remTales[5], tradeMaterial[7], godItem[5], {"gil", 100000}}, reward = 28347}, -- runeist_bottes
}

-----------------------------------
-- relic armor upgrade data
-- [combinationId] = {trade = {relicBase, relicMinusOne, ingredient, {currencyId, currencyAmt}}, reward = relicPlusOne},
-----------------------------------
-- local reforgedRelicArmor =
-- {
    -- [101] = {trade = {15072, 2033, 1990, {1455, 28}}, reward = 15245}, -- warriors_mask_+1
    -- [102] = {trade = {15087, 2034, 1990, {1455, 28}}, reward = 14500}, -- warriors_lorica_+1
    -- [103] = {trade = {15102, 2035, 1990, {1455, 28}}, reward = 14909}, -- warriors_mufflers_+1
    -- [104] = {trade = {15117, 2036, 1990, {1455, 28}}, reward = 15580}, -- warriors_cuisses_+1
    -- [105] = {trade = {15132, 2037, 1990, {1455, 28}}, reward = 15665}, -- warriors_calligae_+1
    -- [106] = {trade = {15073, 2038, 2122, {1455, 26}}, reward = 15246}, -- melee_crown_+1
    -- [107] = {trade = {15088, 2039, 1991, {1455, 26}}, reward = 14501}, -- melee_cyclas_+1
    -- [108] = {trade = {15103, 2040, 2122, {1455, 26}}, reward = 14910}, -- melee_gloves_+1
    -- [109] = {trade = {15118, 2041, 2122, {1455, 26}}, reward = 15581}, -- melee_hose_+1
    -- [110] = {trade = {15133, 2042, 2122, {1455, 26}}, reward = 15666}, -- melee_gaiters_+1
    -- [111] = {trade = {15074, 2043, 1994, {1452, 28}}, reward = 15247}, -- clerics_cap_+1
    -- [112] = {trade = {15089, 2044, 1992, {1452, 28}}, reward = 14502}, -- clerics_briault_+1
    -- [113] = {trade = {15104, 2045, 1993, {1452, 28}}, reward = 14911}, -- clerics_mitts_+1
    -- [114] = {trade = {15119, 2046, 1996, {1452, 26}}, reward = 15582}, -- clerics_pantaloons_+1
    -- [115] = {trade = {15134, 2047, 1995, {1452, 28}}, reward = 15667}, -- clerics_duckbills_+1
    -- [116] = {trade = {15075, 2048, 1993, {1449, 28}}, reward = 15248}, -- sorcerers_petasos_+1
    -- [117] = {trade = {15090, 2049, 1993, {1449, 28}}, reward = 14503}, -- sorcerers_coat_+1
    -- [118] = {trade = {15105, 2050, 1993, {1449, 28}}, reward = 14912}, -- sorcerers_gloves_+1
    -- [119] = {trade = {15120, 2051, 1994, {1449, 28}}, reward = 15583}, -- sorcerers_tonban_+1
    -- [120] = {trade = {15135, 2052, 1995, {1449, 28}}, reward = 15668}, -- sorcerers_sabots_+1
    -- [121] = {trade = {15076, 2053, 1996, {1452, 22}}, reward = 15249}, -- duelists_chapeau_+1
    -- [122] = {trade = {15091, 2054, 1996, {1452, 22}}, reward = 14504}, -- duelists_tabard_+1
    -- [123] = {trade = {15106, 2055, 1996, {1452, 22}}, reward = 14913}, -- duelists_gloves_+1
    -- [124] = {trade = {15121, 2056, 1996, {1452, 22}}, reward = 15584}, -- duelists_tights_+1
    -- [125] = {trade = {15136, 2057, 2122, {1452, 26}}, reward = 15669}, -- duelists_boots_+1
    -- [126] = {trade = {15077, 2058, 1997, {1449, 26}}, reward = 15250}, -- assassins_bonnet_+1
    -- [127] = {trade = {15092, 2059, 1997, {1449, 26}}, reward = 14505}, -- assassins_vest_+1
    -- [128] = {trade = {15107, 2060, 1998, {1449, 28}}, reward = 14914}, -- assassins_armlets_+1
    -- [129] = {trade = {15122, 2061, 1997, {1449, 26}}, reward = 15585}, -- assassins_culottes_+1
    -- [130] = {trade = {15137, 2062, 1998, {1449, 28}}, reward = 15670}, -- assassins_poulaines_+1
    -- [131] = {trade = {15078, 2063,  745, {1452, 20}}, reward = 15251}, -- valor_coronet_+1
    -- [132] = {trade = {15093, 2064, 1999, {1452, 20}}, reward = 14506}, -- valor_surcoat_+1
    -- [133] = {trade = {15108, 2065,  667, {1452, 30}}, reward = 14915}, -- valor_gauntlets_+1
    -- [134] = {trade = {15123, 2066,  667, {1452, 30}}, reward = 15586}, -- valor_breeches_+1
    -- [135] = {trade = {15138, 2067,  667, {1452, 30}}, reward = 15671}, -- valor_leggings_+1
    -- [136] = {trade = {15079, 2068,  664, {1455, 28}}, reward = 15252}, -- abyss_burgeonet_+1
    -- [137] = {trade = {15094, 2069, 2001, {1455, 20}}, reward = 14507}, -- abyss_cuirass_+1
    -- [138] = {trade = {15109, 2070,  664, {1455, 28}}, reward = 14916}, -- abyss_gauntlets_+1
    -- [139] = {trade = {15124, 2071,  664, {1455, 28}}, reward = 15587}, -- abyss_flanchard_+1
    -- [140] = {trade = {15139, 2072,  664, {1455, 28}}, reward = 15672}, -- abyss_sollerets_+1
    -- [141] = {trade = {15080, 2073, 1458, {1449, 30}}, reward = 15253}, -- monster_helm_+1
    -- [142] = {trade = {15095, 2074, 2125, {1449, 26}}, reward = 14508}, -- monster_jackcoat_+1
    -- [143] = {trade = {15110, 2075, 2125, {1449, 26}}, reward = 14917}, -- monster_gloves_+1
    -- [144] = {trade = {15125, 2076, 2124, {1449, 26}}, reward = 15588}, -- monster_trousers_+1
    -- [145] = {trade = {15140, 2077, 2124, {1449, 26}}, reward = 15673}, -- monster_gaiters_+1
    -- [146] = {trade = {15081, 2078,  823, {1455, 26}}, reward = 15254}, -- bards_roundlet_+1
    -- [147] = {trade = {15096, 2079, 1459, {1455, 28}}, reward = 14509}, -- bards_justaucorps_+1
    -- [148] = {trade = {15111, 2080, 1459, {1455, 28}}, reward = 14918}, -- bards_cuffs_+1
    -- [149] = {trade = {15126, 2081, 1459, {1455, 28}}, reward = 15589}, -- bards_cannions_+1
    -- [150] = {trade = {15141, 2082, 1459, {1455, 28}}, reward = 15674}, -- bards_slippers_+1
    -- [151] = {trade = {15082, 2083, 2005, {1449, 30}}, reward = 15255}, -- scouts_beret_+1
    -- [152] = {trade = {15097, 2084, 2005, {1449, 30}}, reward = 14510}, -- scouts_jerkin_+1
    -- [153] = {trade = {15112, 2085,  506, {1449, 30}}, reward = 14919}, -- scouts_bracers_+1
    -- [154] = {trade = {15127, 2086,  506, {1449, 30}}, reward = 15590}, -- scouts_braccae_+1
    -- [155] = {trade = {15142, 2087, 2122, {1449, 26}}, reward = 15675}, -- scouts_socks_+1
    -- [156] = {trade = {15083, 2088,  752, {1455, 24}}, reward = 15256}, -- saotome_kabuto_+1
    -- [157] = {trade = {15098, 2089, 2006, {1455, 22}}, reward = 14511}, -- saotome_domaru_+1
    -- [158] = {trade = {15113, 2090, 2007, {1455, 20}}, reward = 14920}, -- saotome_kote_+1
    -- [159] = {trade = {15128, 2091, 2007, {1455, 20}}, reward = 15591}, -- saotome_haidate_+1
    -- [160] = {trade = {15143, 2092, 2007, {1455, 20}}, reward = 15676}, -- saotome_sune-ate_+1
    -- [161] = {trade = {15084, 2093, 2008, {1455, 26}}, reward = 15257}, -- koga_hatsuburi_+1
    -- [162] = {trade = {15099, 2094, 2008, {1455, 26}}, reward = 14512}, -- koga_chainmail_+1
    -- [163] = {trade = {15114, 2095, 2008, {1455, 26}}, reward = 14921}, -- koga_tekko_+1
    -- [164] = {trade = {15129, 2096, 2007, {1455, 20}}, reward = 15592}, -- koga_hakama_+1
    -- [165] = {trade = {15144, 2097, 2008, {1455, 26}}, reward = 15677}, -- koga_kyahan_+1
    -- [166] = {trade = {15085, 2098, 2012, {1452, 30}}, reward = 15258}, -- wyrm_armet_+1
    -- [167] = {trade = {15100, 2099, 2012, {1452, 30}}, reward = 14513}, -- wyrm_mail_+1
    -- [168] = {trade = {15115, 2100,  851, {1452, 30}}, reward = 14922}, -- wyrm_finger_gauntlets_+1
    -- [169] = {trade = {15130, 2101,  851, {1452, 30}}, reward = 15593}, -- wyrm_brais_+1
    -- [170] = {trade = {15145, 2102,  851, {1452, 30}}, reward = 15678}, -- wyrm_greaves_+1
    -- [171] = {trade = {15086, 2103, 2009, {1449, 30}}, reward = 15259}, -- summoners_horn_+1
    -- [172] = {trade = {15101, 2104, 2010, {1449, 30}}, reward = 14514}, -- summoners_doublet_+1
    -- [173] = {trade = {15116, 2105, 2010, {1449, 30}}, reward = 14923}, -- summoners_bracers_+1
    -- [174] = {trade = {15131, 2106, 2010, {1449, 30}}, reward = 15594}, -- summoners_spats_+1
    -- [175] = {trade = {15146, 2107,  720, {1449, 28}}, reward = 15679}, -- summoners_pigaches_+1
    -- [176] = {trade = {11465, 2662, 2703, {1452, 26}}, reward = 11466}, -- mirage_keffiyeh_+1
    -- [177] = {trade = {11292, 2663, 1702, {1452, 26}}, reward = 11293}, -- mirage_jubbah_+1
    -- [178] = {trade = {15025, 2664, 2703, {1452, 26}}, reward = 15026}, -- mirage_bazubands_+1
    -- [179] = {trade = {16346, 2665, 1702, {1452, 26}}, reward = 16347}, -- mirage_shalwar_+1
    -- [180] = {trade = {11382, 2666, 2703, {1452, 26}}, reward = 11383}, -- mirage_charuqs_+1
    -- [181] = {trade = {11468, 2667, 2122, {1455, 30}}, reward = 11469}, -- commodore_tricorne_+1
    -- [182] = {trade = {11295, 2668, 2704, {1455, 30}}, reward = 11296}, -- commodore_frac_+1
    -- [183] = {trade = {15028, 2669, 2704, {1455, 30}}, reward = 15029}, -- commodore_gants_+1
    -- [184] = {trade = {16349, 2670, 2704, {1455, 30}}, reward = 16350}, -- commodore_culottes_+1
    -- [185] = {trade = {11385, 2671, 2152, {1455, 30}}, reward = 11386}, -- commodore_bottes_+1
    -- [186] = {trade = {11471, 2672, 2705, {1449, 26}}, reward = 11472}, -- pantin_taj_+1
    -- [187] = {trade = {11298, 2673, 1999, {1449, 26}}, reward = 11299}, -- pantin_tobe_+1
    -- [188] = {trade = {15031, 2674, 2705, {1449, 26}}, reward = 15032}, -- pantin_dastanas_+1
    -- [189] = {trade = {16352, 2675, 2705, {1449, 26}}, reward = 16353}, -- pantin_churidars_+1
    -- [190] = {trade = {11388, 2676, 2538, {1449, 26}}, reward = 11389}, -- pantin_babouches_+1
    -- [191] = {trade = {11478, 2718,  745, {1452, 30}}, reward = 11479}, -- etoile_tiara_+1
    -- [192] = {trade = {11305, 2719, 2537, {1452, 30}}, reward = 11306}, -- etoile_casaque_+1
    -- [193] = {trade = {15038, 2720,  745, {1452, 30}}, reward = 15039}, -- etoile_bangles_+1
    -- [194] = {trade = {16360, 2721, 1702, {1452, 30}}, reward = 16361}, -- etoile_tights_+1
    -- [195] = {trade = {11396, 2722, 1992, {1452, 30}}, reward = 11397}, -- etoile_toe_shoes_+1
    -- [196] = {trade = {11480, 2723,  746, {1455, 28}}, reward = 11481}, -- argute_mortarboard_+1
    -- [197] = {trade = {11307, 2724, 1699, {1455, 28}}, reward = 11308}, -- argute_gown_+1
    -- [198] = {trade = {15040, 2725, 2530, {1455, 28}}, reward = 15041}, -- argute_bracers_+1
    -- [199] = {trade = {16362, 2726, 1993, {1455, 28}}, reward = 16363}, -- argute_pants_+1
    -- [200] = {trade = {11398, 2727, 2424, {1455, 28}}, reward = 11399}, -- argute_loafers_+1
-- }

function onTrade(player, npc, trade)
	local tradedCombo = 0

	-- Check for Reforged Artifact armor trade combination
	if tradedCombo == 0 then
		for k, v in pairs(reforgedArtifactArmor) do
			if npcUtil.tradeHasExactly(trade, v.trade) then
				tradedCombo = k
				break
			end
		end
	end
	
	-- Found a match
	if tradedCombo > 0 then
		local ID = zones[player:getZoneID()]
		local reward = reforgedArtifactArmor[tradedCombo].reward
	
		player:confirmTrade()
		player:addItem(reward)
		player:messageSpecial(ID.text.ITEM_OBTAINED, reward)
	end
end

function onTrigger(player, npc)

end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)

end