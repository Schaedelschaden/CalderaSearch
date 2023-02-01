-----------------------------------
-- Area: Eastern Adoulin
--  NPC: Vastran
--  !pos -118.965 -0.150 -8.898 257
-- Type: Sinister Reign Rewards
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

local vwKupon =
{
    9178, -- (1) Mog Kupon A-Ab    from Kaggem      augsYgnas
    9228, -- (2) Mog Kupon A-ASYW  from Akvan       augsDarrcuiln
    2745, -- (3) Mog Kupon A-DBcd  from Pil         augsIngrid
    3968, -- (4) Mog Kupon A-De    from Cath Palug  augsTeodor
    3967, -- (5) Mog Kupon A-DeII  from Modron      augsMorimar
    2746, -- (6) Mog Kupon A-DXar  from Mimic King  augsRosulatia
    3441, -- (7) Mog Kupon A-E +2  from Aello       augsArciela
    2736, -- (8) Mog Kupon A-Lum   from Uptala      augsSajjaka
    9226, -- (9) Mog Kupon A-EMI   from Qilin       augsAugust
}

local pathKupon =
{
    9177, -- (1) Path A Mog Kupon AW-GF
    9176, -- (2) Path B Mog Kupon AW-GFII
    9175, -- (3) Path C Mog Kupon AW-GFIII
    9187, -- (4) Path D Mog Kupon AW-GeIV
}

local rewardItem =
{
    21026, -- ( 1) Himetsuruichimonji
    21697, -- ( 2) Humility
    27321, -- ( 3) Lengo pants
    27135, -- ( 4) Leyline Gloves
    27491, -- ( 5) Amm Greaves
    20517, -- ( 6) Fleshcarvers
    20936, -- ( 7) Koresuke
    27322, -- ( 8) Ta'lab Trousers
    25630, -- ( 9) Dampening Tam
    27136, -- (10) Fanatic Gloves
    20595, -- (11) Malevolence
    20796, -- (12) Purgation
    21089, -- (13) Rubicundity
    26973, -- (14) Samnhua Coat
    27295, -- (15) Samnhua Tights
    20706, -- (16) Vampirism
    20891, -- (17) Brutality
    20844, -- (18) Ferocity
    25631, -- (19) Lilitu Headpiece
    27492, -- (20) Loyalist Sabatons
    27137, -- (21) Floral Gauntlets
    27493, -- (22) Medium's Sabbots
    21214, -- (23) Nobility
    21148, -- (24) Serenity
    27323, -- (25) Enticer's Pants
    20978, -- (26) Ochu
    20596, -- (27) Taming Sari
    25705, -- (28) Witching Robe
    20705, -- (29) Brilliance
    21088, -- (30) Divinity
    25603, -- (31) Jumalik Helm
    26972, -- (32) Jumalik Mail
    27764, -- (33) Founder's Corona
    27910, -- (34) Founder's Breastplate
    28049, -- (35) Founder's Gauntlets
    28191, -- (36) Founder's Hose
    28330, -- (37) Founder's Greaves
}

-- Ygnas Augs
local augsYgnas =
{
-- Path A - ACC, ATK, STR, Quad Attack       Himetsuruchimonji
    {23, 9}, {25, 9}, {512, 9}, {354, 2},
-- Path B - ACC, ATK, DMG, STR,              Humility
    {23, 9}, {25, 9}, {45, 14}, {512, 9},
-- Path C - INT, MACC, MATK, Refresh,        Lengo Pants
    {516, 9}, {35, 9}, {133, 14}, {138, 0},
-- Path D - ACC, MACC, MATK, Fast Cast       Leyline Gloves
    {23, 14}, {35, 14}, {133, 14}, {140, 2},
}

-- Darrcuiln Augs
local augsDarrcuiln =
{
-- Path A  - VIT, HP, ACC, DT                  Amm Greaves
    {514, 9}, {2, 17}, {23, 14}, {71, 1},
-- Path B  - DMG, STR, DEX, STP                Flesh Carvers
    {45, 9}, {512, 9}, {513, 9}, {142, 4},
-- Path C  - DMG, STP, STR, ACC                Koresuke
    {45, 9}, {142, 5}, {512, 9}, {23, 9},
-- Path D - Crit Hit Dmg, ACC, MEVA, -Enmity  Ta'lab Trousers
    {328, 2}, {23, 14}, {37, 14}, {40, 6},
}

-- Ingrid Augs
local augsIngrid =
{
-- Path A - DEX, ACC, MACC, Quad ATT         Dampening Tam
    {513, 9}, {23, 14}, {35, 14}, {354, 2},
-- Path B - MP, Heal Skill, FC, Conserve MP  Fanatics Gloves
    {10, 17}, {289, 9}, {140, 7}, {141, 6},
-- Path C  - MACC, MATT, FC, INT             Malevolence
    {35, 9}, {133, 9}, {140, 4}, {516, 9},
-- Path D  - DMG, ATT, STP, WSD              Purgation
    {45, 14}, {25, 9}, {142, 5}, {327, 3},
}

--Teodor Augs
local augsTeodor =
{
-- Path A - MACC, Conserve MP, MATT, Dark Magic Skill   Rubicundity
    {35, 9}, {141, 6}, {133, 9}, {293, 9},
-- Path B - MATT, Fast Cast, MACC, Dual Wield           Samnhua Coat
    {133, 14}, {140, 4}, {35, 14}, {146, 4},
-- Path C - STR, Double Attack, DEX, Triple Attack      Samnhua Tights
    {512, 9}, {143, 2}, {513, 9}, {144, 2},
-- Path D - DMG, INT, STR, Occult Acumen                Vampirism
    {45, 14}, {516, 9}, {512, 9}, {237, 9},
}

--Morimar Augs
local augsMorimar =
{
-- Path A - DMG, STR, INT, Double Attack         Brutality
    {45, 14}, {512, 9}, {516, 9}, {143, 2},
-- Path B - DMG, STR, VIT, Double Attack         Ferocity
    {45, 14}, {512, 9}, {514, 9}, {143, 2},
-- Path C - STR, ATK, DEX, WSD                   Lilitu Headpiece
    {512, 9}, {25, 14}, {513, 9}, {327, 2},
-- Path D - STR, PDT, ATK, Haste                 Loyalist Sabatons
    {512, 9}, {54, 2}, {25, 14}, {49, 2},
}

--Rosulatia Augs
local augsRosulatia =
{
-- Path A - ACC, Triple Attack, RACC, DT                              Floral Gauntlets
    {23, 14}, {144, 2}, {27, 14}, {71, 3},
-- Path B - Cure Pot., Conserve MP, MP, MND                           Medium's Sabbots
    {329, 4}, {141, 6}, {10, 16}, {517, 9},
-- Path C - DMG, Store TP, AGI, Crit Hit Rate                         Nobility
    {45, 14}, {142, 7}, {515, 9}, {41, 3},
-- Path D - MP, Enhancing Magic Skill, Cure Casting Time, Cure Pot.   Serenity
    {10, 16}, {290, 9}, {323, 9}, {329, 4},
}

--Arciela Augs
local augsArciela =
{
-- Path A - MP, Pet: ACC/RACC, Pet: MACC, Pet: DT    Enticer's Pants
    {10, 17}, {106, 14}, {100, 14}, {112, 4},
-- Path B - DMG, DEX, STR, Ninjutsu Skill            Ochu
    {45, 14}, {513, 9}, {512, 9}, {295, 9},
-- Path C - DMG, DEX, STR, TH                        Taming Sari
    {45, 14}, {513, 9}, {512, 9}, {147, 0},
-- Path D - MP, MATT, MACC, Refresh                  Witching Robe
    {10, 17}, {133, 14}, {35, 14}, {138, 0},
}

--Sajjaka Augs
local augsSajjaka =
{
-- Path A - DMG, Shield Skill, Divine Magic Skill, Enmity    Brilliance
    {45, 14}, {286, 9}, {288, 14}, {39, 6},
-- Path B - DMG, ATK, ACC, PDT                               Divinity
    {45, 14}, {25, 9}, {23, 9}, {54, 2},
-- Path C - MND, Magic Burst DMG, MATT, Refresh              Jumalik Helm
    {517, 9}, {334, 9}, {133, 14}, {138, 0},
-- Path D - HP, Refresh, ATK, Enmity                         Jumalik Mail
    {2, 17}, {138, 1}, {25, 14}, {39, 8},
}

--August Augs
local augsAugust =
{
-- Path A - DEX, ACC, MDT, MACC                 Founder's Corona
    {513, 9}, {23, 14}, {55, 4}, {35, 14},
-- Path B - ATK, MATT, ACC, MACC                Founder's Breastplate
    {25, 14}, {133, 14}, {23, 14}, {35, 14},
-- Path C - STR, MATT, ATK, PDT                 Founder's Gauntlets
    {512, 9}, {133, 14}, {25, 14}, {54, 4},
-- Path D - MND, MACC, ATK, BDT                 Founder's Hose
    {517, 9}, {35, 14}, {25, 14}, {56, 4},
-- Path E - VIT, ACC, MATT, MEVA                Founder's Greaves
    {514, 9}, {23, 14}, {133, 14}, {37, 14},
}

function onTrade(player, npc, trade)
    if
        player:getCharVar("KillCounter_Kirin") > 0 and
        player:getCharVar("KillCounter_JailOfLove") > 0
    then
        local vwKuponPicked    = 0
        local pathKuponPicked  = 0
        local rewardItemPicked = 0
        local augItem          = 0
        local aug1             = 0
        local aug2             = 0
        local aug3             = 0
        local aug4             = 0
        local aug1Value        = 0
        local aug2Value        = 0
        local aug3Value        = 0
        local aug4Value        = 0
        local chanceValue      = math.random(1, 5)

        -- Check for VW Kupon included in trade
        for i = 1, #vwKupon do
            if npcUtil.tradeHas(trade, {vwKupon[i]}) then
                vwKuponPicked = vwKupon[i]
                break
            end
        end

        -- Cancel transaction if no VW Kupon is found
        if vwKuponPicked == 0 then
            player:PrintToPlayer(string.format("Vastran : You need to give me a Kupon you receive from defeating a Sinister Reign NM."),tpz.msg.channel.NS_SAY)
            return
        end

        -- Check for path Kupon included in trade
        for i = 1, #pathKupon do
            if npcUtil.tradeHas(trade, {pathKupon[i]}) then
                pathKuponPicked = pathKupon[i]
                break
            end
        end

        -- Cancel transaction if no path Kupon is found
        if pathKuponPicked == 0 then
            player:PrintToPlayer(string.format("Vastran : You need to give me a Kupon that determines the pathway I'll try to manifest."),tpz.msg.channel.NS_SAY)
            return
        end

        if chanceValue < 4 then -- 3 Augs
            if
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[1]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[2]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[3]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[4]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
            -- End Yngas
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[5]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[6]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[7]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[8]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
            -- End Darrcuiln
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[9]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[10]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[11]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[12]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
            -- End Ingrid
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[13]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[14]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[15]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[16]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
            -- End Teodor
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[17]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[18]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[19]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[20]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
            -- End Morimar
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[21]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[22]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[23]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[24]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
            -- End Rosulatia
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[25]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[26]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[27]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[28]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
            -- End Arciela
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[29]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[30]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[31]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[32]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
            -- End Sajjaka
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[33]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)
                aug3 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[34]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)
                aug3 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[35]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)
                aug3 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[36]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)
                aug3 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[5]
            then
                rewardItemPicked = rewardItem[37]
                aug1 = math.random(17, 20)
                aug2 = math.random(17, 20)
                aug3 = math.random(17, 20)

                while aug1 == aug2 do
                    aug2 = math.random(17, 20)
                end

                while aug1 == aug3 or aug2 == aug3 do
                    aug3 = math.random(17, 20)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
            end
            -- End August

            player:addItem(rewardItemPicked, 1, aug1, aug1Value, aug2, aug2Value, aug3, aug3Value)
        elseif chanceValue == 4 then -- 2 Augs
            if
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[1]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[2]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[3]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[4]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
            -- End Yngas
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[5]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[6]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[7]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[8]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
            -- End Darrcuiln
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[9]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[10]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[11]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[12]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
            -- End Ingrid
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[13]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[14]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[15]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[16]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
            -- End Teodor
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[17]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[18]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[19]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[20]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
            -- End Morimar
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[21]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[22]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[23]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[24]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
            -- End Rosulatia
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[25]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[26]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[27]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[28]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
            -- End Arciela
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[29]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[30]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[31]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[32]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
            -- End Sajjaka
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[33]
                aug1 = math.random(1, 4)
                aug2 = math.random(1, 4)

                while aug1 == aug2 do
                    aug2 = math.random(1, 4)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[34]
                aug1 = math.random(5, 8)
                aug2 = math.random(5, 8)

                while aug1 == aug2 do
                    aug2 = math.random(5, 8)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[35]
                aug1 = math.random(9, 12)
                aug2 = math.random(9, 12)

                while aug1 == aug2 do
                    aug2 = math.random(9, 12)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[36]
                aug1 = math.random(13, 16)
                aug2 = math.random(13, 16)

                while aug1 == aug2 do
                    aug2 = math.random(13, 16)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[5]
            then
                rewardItemPicked = rewardItem[37]
                aug1 = math.random(17, 20)
                aug2 = math.random(17, 20)

                while aug1 == aug2 do
                    aug2 = math.random(17, 20)
                end

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
            -- End August
            end

            player:addItem(rewardItemPicked, 1, aug1, aug1Value, aug2, aug2Value)
        elseif chanceValue == 5 then -- 4 Augs
            if
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[1]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug4Value = math.random(1, augsYgnas[aug4][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
                aug4      = augsYgnas[aug4][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[2]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug4Value = math.random(1, augsYgnas[aug4][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
                aug4      = augsYgnas[aug4][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[3]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug4Value = math.random(1, augsYgnas[aug4][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
                aug4      = augsYgnas[aug4][1]
            elseif
                vwKuponPicked == vwKupon[1] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[4]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsYgnas[aug1][2])
                aug2Value = math.random(1, augsYgnas[aug2][2])
                aug3Value = math.random(1, augsYgnas[aug3][2])
                aug4Value = math.random(1, augsYgnas[aug4][2])
                aug1      = augsYgnas[aug1][1]
                aug2      = augsYgnas[aug2][1]
                aug3      = augsYgnas[aug3][1]
                aug4      = augsYgnas[aug4][1]
            -- End Yngas
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[5]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug4Value = math.random(1, augsDarrcuiln[aug4][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
                aug4      = augsDarrcuiln[aug4][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[6]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug4Value = math.random(1, augsDarrcuiln[aug4][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
                aug4      = augsDarrcuiln[aug4][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[7]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug4Value = math.random(1, augsDarrcuiln[aug4][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
                aug4      = augsDarrcuiln[aug4][1]
            elseif
                vwKuponPicked == vwKupon[2] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[8]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsDarrcuiln[aug1][2])
                aug2Value = math.random(1, augsDarrcuiln[aug2][2])
                aug3Value = math.random(1, augsDarrcuiln[aug3][2])
                aug4Value = math.random(1, augsDarrcuiln[aug4][2])
                aug1      = augsDarrcuiln[aug1][1]
                aug2      = augsDarrcuiln[aug2][1]
                aug3      = augsDarrcuiln[aug3][1]
                aug4      = augsDarrcuiln[aug4][1]
            -- End Darrcuiln
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[9]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug4Value = math.random(1, augsIngrid[aug4][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
                aug4      = augsIngrid[aug4][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[10]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug4Value = math.random(1, augsIngrid[aug4][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
                aug4      = augsIngrid[aug4][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[11]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug4Value = math.random(1, augsIngrid[aug4][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
                aug4      = augsIngrid[aug4][1]
            elseif
                vwKuponPicked == vwKupon[3] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[12]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsIngrid[aug1][2])
                aug2Value = math.random(1, augsIngrid[aug2][2])
                aug3Value = math.random(1, augsIngrid[aug3][2])
                aug4Value = math.random(1, augsIngrid[aug4][2])
                aug1      = augsIngrid[aug1][1]
                aug2      = augsIngrid[aug2][1]
                aug3      = augsIngrid[aug3][1]
                aug4      = augsIngrid[aug4][1]
            -- End Ingrid
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[13]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug4Value = math.random(1, augsTeodor[aug4][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
                aug4      = augsTeodor[aug4][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[14]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug4Value = math.random(1, augsTeodor[aug4][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
                aug4      = augsTeodor[aug4][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[15]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug4Value = math.random(1, augsTeodor[aug4][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
                aug4      = augsTeodor[aug4][1]
            elseif
                vwKuponPicked == vwKupon[4] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[16]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsTeodor[aug1][2])
                aug2Value = math.random(1, augsTeodor[aug2][2])
                aug3Value = math.random(1, augsTeodor[aug3][2])
                aug4Value = math.random(1, augsTeodor[aug4][2])
                aug1      = augsTeodor[aug1][1]
                aug2      = augsTeodor[aug2][1]
                aug3      = augsTeodor[aug3][1]
                aug4      = augsTeodor[aug4][1]
            -- End Teodor
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[17]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug4Value = math.random(1, augsMorimar[aug4][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
                aug4      = augsMorimar[aug4][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[18]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug4Value = math.random(1, augsMorimar[aug4][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
                aug4      = augsMorimar[aug4][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[19]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug4Value = math.random(1, augsMorimar[aug4][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
                aug4      = augsMorimar[aug4][1]
            elseif
                vwKuponPicked == vwKupon[5] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[20]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsMorimar[aug1][2])
                aug2Value = math.random(1, augsMorimar[aug2][2])
                aug3Value = math.random(1, augsMorimar[aug3][2])
                aug4Value = math.random(1, augsMorimar[aug4][2])
                aug1      = augsMorimar[aug1][1]
                aug2      = augsMorimar[aug2][1]
                aug3      = augsMorimar[aug3][1]
                aug4      = augsMorimar[aug4][1]
            -- End Morimar
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[21]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug4Value = math.random(1, augsRosulatia[aug4][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
                aug4      = augsRosulatia[aug4][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[22]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug4Value = math.random(1, augsRosulatia[aug4][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
                aug4      = augsRosulatia[aug4][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[23]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug4Value = math.random(1, augsRosulatia[aug4][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
                aug4      = augsRosulatia[aug4][1]
            elseif
                vwKuponPicked == vwKupon[6] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[24]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsRosulatia[aug1][2])
                aug2Value = math.random(1, augsRosulatia[aug2][2])
                aug3Value = math.random(1, augsRosulatia[aug3][2])
                aug4Value = math.random(1, augsRosulatia[aug4][2])
                aug1      = augsRosulatia[aug1][1]
                aug2      = augsRosulatia[aug2][1]
                aug3      = augsRosulatia[aug3][1]
                aug4      = augsRosulatia[aug4][1]
            -- End Rosulatia
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[25]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug4Value = math.random(1, augsArciela[aug4][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
                aug4      = augsArciela[aug4][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[26]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug4Value = math.random(1, augsArciela[aug4][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
                aug4      = augsArciela[aug4][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[27]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug4Value = math.random(1, augsArciela[aug4][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
                aug4      = augsArciela[aug4][1]
            elseif
                vwKuponPicked == vwKupon[7] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[28]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsArciela[aug1][2])
                aug2Value = math.random(1, augsArciela[aug2][2])
                aug3Value = math.random(1, augsArciela[aug3][2])
                aug4Value = math.random(1, augsArciela[aug4][2])
                aug1      = augsArciela[aug1][1]
                aug2      = augsArciela[aug2][1]
                aug3      = augsArciela[aug3][1]
                aug4      = augsArciela[aug4][1]
            -- End Arciela
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[29]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug4Value = math.random(1, augsSajjaka[aug4][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
                aug4      = augsSajjaka[aug4][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[30]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug4Value = math.random(1, augsSajjaka[aug4][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
                aug4      = augsSajjaka[aug4][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[31]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug4Value = math.random(1, augsSajjaka[aug4][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
                aug4      = augsSajjaka[aug4][1]
            elseif
                vwKuponPicked == vwKupon[8] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[32]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsSajjaka[aug1][2])
                aug2Value = math.random(1, augsSajjaka[aug2][2])
                aug3Value = math.random(1, augsSajjaka[aug3][2])
                aug4Value = math.random(1, augsSajjaka[aug4][2])
                aug1      = augsSajjaka[aug1][1]
                aug2      = augsSajjaka[aug2][1]
                aug3      = augsSajjaka[aug3][1]
                aug4      = augsSajjaka[aug4][1]
            -- End Sajjaka
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[1]
            then
                rewardItemPicked = rewardItem[33]
                aug1 = 1
                aug2 = 2
                aug3 = 3
                aug4 = 4

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug4Value = math.random(1, augsAugust[aug4][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
                aug4      = augsAugust[aug4][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[2]
            then
                rewardItemPicked = rewardItem[34]
                aug1 = 5
                aug2 = 6
                aug3 = 7
                aug4 = 8

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug4Value = math.random(1, augsAugust[aug4][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
                aug4      = augsAugust[aug4][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[3]
            then
                rewardItemPicked = rewardItem[35]
                aug1 = 9
                aug2 = 10
                aug3 = 11
                aug4 = 12

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug4Value = math.random(1, augsAugust[aug4][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
                aug4      = augsAugust[aug4][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[4]
            then
                rewardItemPicked = rewardItem[36]
                aug1 = 13
                aug2 = 14
                aug3 = 15
                aug4 = 16

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug4Value = math.random(1, augsAugust[aug4][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
                aug4      = augsAugust[aug4][1]
            elseif
                vwKuponPicked == vwKupon[9] and
                pathKuponPicked == pathKupon[5]
            then
                rewardItemPicked = rewardItem[37]
                aug1 = 17
                aug2 = 18
                aug3 = 19
                aug4 = 20

                aug1Value = math.random(1, augsAugust[aug1][2])
                aug2Value = math.random(1, augsAugust[aug2][2])
                aug3Value = math.random(1, augsAugust[aug3][2])
                aug4Value = math.random(1, augsAugust[aug4][2])
                aug1      = augsAugust[aug1][1]
                aug2      = augsAugust[aug2][1]
                aug3      = augsAugust[aug3][1]
                aug4      = augsAugust[aug4][1]
            -- End August
            end

            player:addItem(rewardItemPicked, 1, aug1, aug1Value, aug2, aug2Value, aug3, aug3Value, aug4, aug4Value)
        end

        player:tradeComplete()
        player:PrintToPlayer(string.format("Vastran : The power of this item feels...overwhelming."),tpz.msg.channel.NS_SAY)
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Vastran : The more powerful creatures of Voidwatch carry ancient Kupons that may materialize amazing equipment."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
