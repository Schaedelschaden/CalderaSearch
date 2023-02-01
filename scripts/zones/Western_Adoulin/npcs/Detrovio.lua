-----------------------------------
-- Area: Western Adoulin
--  NPC: Detrovio
--  !pos 99.14 -0.65 -62.81 256
-- Type: Alluvion Skirmish Armor
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

local acceptedStones =
{
    -- Snowslit x25, Snowtip x25, Snowdim x25, Snoworb x25
    {8930, 25}, {8939, 25}, {8948, 25}, {8957, 25},
    -- Leafslit x25, Leaftip x25, Leafdim x25, Leaforb x25
    {8933, 25}, {8942, 25}, {8951, 25}, {8960, 25},
    -- Duskslit x25, Dusktip x25, Duskdim x25, Duskorb x25
    {8936, 25}, {8945, 25}, {8954, 25}, {8963, 25},
    -- Snowslit +1 x2, Snowtip +1 x2, Snowdim +1 x2, Snoworb +1 x2
    {8931, 2}, {8940, 2}, {8949, 2}, {8958, 2},
    -- Leafslit +1 x2, Leaftip +1 x2, Leafdim +1 x2, Leaforb +1 x2
    {8934, 2}, {8943, 2}, {8952, 2}, {8961, 2},
    -- Duskslit +1 x2, Dusktip +1 x2, Duskdim +1 x2, Duskorb +1 x2
    {8937, 2}, {8946, 2}, {8955, 2}, {8964, 2},
    -- Snowslit +2 x1, Snowtip +2 x1, Snowdim +2 x1, Snoworb +2 x1
    {8932, 1}, {8941, 1}, {8950, 1}, {8959, 1},
    -- Leafslit +2 x1, Leaftip +2 x1, Leafdim +2 x1, Leaforb +2 x1
    {8935, 1}, {8944, 1}, {8953, 1}, {8962, 1},
    -- Duskslit +2 x1, Dusktip +2 x1, Duskdim +2 x1, Duskorb +2 x1
    {8938, 1}, {8947, 1}, {8956, 1}, {8965, 1},
}

local acceptedGear =
{
    26733, 26891, 27045, 27232, 27402, -- Yorium
    26734, 26892, 27046, 27233, 27403, -- Acro
    26735, 26893, 27047, 27234, 27404, -- Taeon
    26736, 26894, 27048, 27235, 27405, -- Telchine
    26737, 26895, 27049, 27236, 27406, -- Helios
}

-- Yorium Armor Augs
local augsYorium =
{
-- Snowslit        ACC,      ATK,    ACC/ATK,    RACC,    RATK,      MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 25}, {25, 25}, {68, 20}, {27, 10}, {29, 10}, {35, 10}, {133, 10}, {33, 25}, {31, 20}, {37, 20}},
-- Snowtip         ACC,      ATK,      RACC,     RATK,  RACC/RATK,   MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {27, 10}, {29, 10}, {69, 10}, {35, 10}, {133, 10}, {33, 25}, {31, 20}, {37, 20}},
-- Snowdim         ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {27, 10}, {29, 10}, {35, 10}, {133, 10}, {131, 10}, {33, 25}, {31, 20}, {37, 20}},
-- Snoworb      Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
                {{106, 20}, {107, 20}, {100, 20}, {101, 20}, {99, 22}, {98, 20}, {117, 20}},
-- Leafslit     Store TP, Double Attack, Cure Pot. Rcvd, WS ACC, Waltz Potency, Enmity+
                {{142, 6}, {143, 3}, {356, 7}, {326, 20}, {330, 5}, {39, 10}},
-- Leaftip      Waltz Potency, Enmity-, Subtle Blow, Haste, Enemy Crit Hit Rate, Regen
                {{330, 5}, {40, 5}, {195, 6}, {49, 3}, {42, 4}, {137, 2}},
-- Leafdim      Fast Cast, Cure Pot., Cure Spellcasting Time, Spell Interrupt Rate, Drain/Aspir Potency, Occult Acumen
                {{140, 3}, {329, 5}, {323, 5}, {53, 10}, {343, 7}, {237, 10}},
-- Leaforb      Pet: Regen, Pet: Subtle Blow, Pet: Crit Hit Rate, Pet: Double Attack, Pet: Enmity-, Pet: Store TP
                {{110, 3}, {116, 8}, {102, 4}, {123, 5}, {105, 8}, {115, 8}},
-- Duskslit     STR, VIT, STR/VIT, -% PDT, -% DT, WS DMG
                {{512, 10}, {514, 10}, {551, 7}, {54, 4}, {71, 3}, {327, 3}},
-- Dusktip      WS DMG, DEX, AGI, STR/DEX, SC DMG, -% BDT
                {{327, 3}, {513, 10}, {515, 10}, {550, 7}, {332, 5}, {56, 4}},
-- Duskdim      INT, INT/MND, STR/INT, -% MDT, +Phalanx, MND
                {{516, 10}, {554, 7}, {558, 7}, {55, 4}, {368, 3}, {517, 10}},
-- Duskorb      MND, CHR, MND/CHR, STR/CHR, Pet: Haste, Pet: -% DT
                {{517, 10}, {518, 10}, {555, 7}, {557, 7}, {111, 5}, {112, 4}}
}

-- Acro Armor Augs
local augsAcro =
{
-- Snowslit        ACC,      ATK,    ACC/ATK,    RACC,     RATK,     MACC,     MATK,      DEF,       EVA,     MEVA
                {{23, 25}, {25, 25}, {68, 20}, {27, 20}, {29, 20}, {35, 10}, {133, 10}, {33, 25}, {31, 20}, {37, 20}},
-- Snowtip         ACC,      ATK,      RACC,     RATK,  RACC/RATK,   MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {27, 20}, {29, 20}, {69, 15}, {35, 10}, {133, 10}, {33, 25}, {31, 20}, {37, 20}},
-- Snowdim         ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {27, 20}, {29, 20}, {35, 10}, {133, 10}, {131, 10}, {33, 25}, {31, 20}, {37, 20}},
-- Snoworb      Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
                {{106, 25}, {107, 25}, {100, 25}, {101, 25}, {99, 25}, {98, 25}, {117, 25}},
-- Leafslit     Enmity+, Waltz Potency, Store TP, Double Attack, Cure Pot. Rcvd, WS ACC
                {{39, 10}, {330, 5}, {142, 6}, {143, 3}, {356, 7}, {326, 20}},
-- Leaftip      Enmity-, Subtle Blow, Haste, Enemy Crit Hit Rate, Recycle, Rapid Shot
                {{40, 5}, {195, 6}, {49, 3}, {42, 4}, {212, 8}, {139, 5}},
-- Leafdim      Enmity-, Fast Cast, Conserve MP, Cure Spellcasting Time, Spell Interrupt Rate, Drain/Aspir Potency
                {{40, 5}, {140, 3}, {141, 5}, {323, 5}, {53, 10}, {343, 7}},
-- Leaforb      Pet: Regen,Pet: Store TP, Pet: Breath DMG Dealt, Pet: Double Attack, Pet: Crit Hit Rate, Call Beast Ability Delay
                {{110, 3}, {115, 8}, {121, 10}, {123, 5}, {102, 4}, {324, 12}},
-- Duskslit     STR, VIT, STR/VIT, WS DMG, Crit Hit DMG, HP
                {{512, 10}, {514, 10}, {551, 7}, {327, 3}, {328, 3}, {1, 50}},
-- Dusktip      DEX, AGI, STR/DEX, STR/AGI, Snapshot, SC DMG
                {{513, 10}, {515, 10}, {550, 7}, {552, 7}, {211, 5}, {332, 5}},
-- Duskdim      INT, INT/MND, STR/INT, Magic Crit Hit DMG, MP, MND
                {{516, 10}, {554, 7}, {558, 7}, {335, 10}, {9, 50}, {517, 10}},
-- Duskorb      MND, CHR, MND/CHR, STR/CHR, Pet: Haste, Pet: -% DT
                {{517, 10}, {518, 10}, {555, 7}, {557, 7}, {111, 5}, {112, 4}}
}

-- Taeon Armor Augs
local augsTaeon =
{
-- Snowslit        ACC,      ATK,    ACC/ATK,    RACC,     RATK,     MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 25}, {25, 25}, {68, 20}, {27, 20}, {29, 20}, {35, 10}, {133, 10}, {33, 20}, {31, 25}, {37, 20}},
-- Snowtip         RACC,     RATK,   RACC/RATK,  MACC,     MATK,      DEF,      EVA,      MEVA
                {{27, 25}, {29, 25}, {69, 20}, {35, 20}, {133, 20}, {33, 20}, {31, 25}, {37, 20}},
-- Snowdim         RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
                {{27, 25}, {29, 25}, {35, 20}, {133, 20}, {131, 15}, {33, 20}, {31, 25}, {37, 20}},
-- Snoworb      Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
                {{106, 25}, {107, 25}, {100, 25}, {101, 25}, {99, 25}, {98, 25}, {117, 25}},
-- Leafslit     Waltz Potency, WS ACC, Triple Attack, Cure Pot. Rcvd, Counter, Dual Wield
                {{330, 5}, {326, 20}, {144, 2}, {356, 7}, {145, 3}, {146, 5}},
-- Leaftip      Subtle Blow, Haste, Enemy Crit Hit Rate, Crit Hit Rate, Recycle, Snapshot
                {{195, 6}, {49, 3}, {42, 4}, {41, 3}, {212, 8}, {211, 5}},
-- Leafdim      Fast Cast, Conserve MP, Cure Spellcasting Time, Spell Interrupt Rate, Cure Potency, Enmity-
                {{140, 5}, {141, 5}, {323, 5}, {53, 10}, {329, 5}, {40, 5}},
-- Leaforb      Pet: Regen, Pet: Subtle Blow, Pet: Breath DMG Dealt, Pet: Double Attack, Pet: Crit Hit Rate, Repair Potency
                {{110, 3}, {116, 8}, {121, 10}, {123, 5}, {102, 4}, {341, 5}},
-- Duskslit     STR, VIT, STR/VIT, WS DMG, Crit Hit DMG, HP
                {{512, 10}, {514, 10}, {551, 7}, {327, 3}, {328, 3}, {1, 50}},
-- Dusktip      DEX, AGI, STR/DEX, STR/AGI, Snapshot, SC DMG
                {{513, 10}, {515, 10}, {550, 7}, {552, 7}, {211, 5}, {332, 5}},
-- Duskdim      INT, INT/MND, Magic Crit Hit DMG, Phalanx+, Regen Potency, MND
                {{516, 10}, {554, 7}, {335, 10}, {368, 3}, {371, 3}, {517, 10}},
-- Duskorb      MND, CHR, MND/CHR, STR/CHR, Pet: Haste, Pet: -% DT
                {{517, 10}, {518, 10}, {555, 7}, {557, 7}, {111, 5}, {112, 4}}
}

-- Telchine Armor Augs
local augsTelchine =
{
-- Snowslit        ACC,      ATK,     ACC/ATK,   RACC,     RATK,     MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {68, 15}, {27, 10}, {29, 10}, {35, 25}, {133, 20}, {33, 20}, {31, 20}, {37, 25}},
-- Snowtip         ACC,      ATK,      RACC,     RATK,  RACC/RATK,  MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {27, 10}, {29, 10}, {69, 5}, {35, 25}, {133, 15}, {33, 20}, {31, 20}, {37, 25}},
-- Snowdim         ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
                {{23, 20}, {25, 20}, {27, 10}, {29, 10}, {35, 25}, {133, 20}, {131, 15}, {33, 20}, {31, 20}, {37, 25}},
-- Snoworb      Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
                {{106, 20}, {107, 20}, {100, 20}, {101, 20}, {99, 20}, {98, 20}, {117, 20}},
-- Leafslit     Store TP, Double Attack, Cure Pot. Rcvd, WS ACC, Waltz Potency, Enemy Crit Hit Rate
                {{142, 6}, {143, 3}, {356, 7}, {326, 20}, {330, 5}, {42, 4}},
-- Leaftip      Waltz Potency, Enemy Crit Hit Rate, Subtle Blow, Haste, Enmity-, Regen
                {{330, 5}, {42, 4}, {195, 6}, {49, 3}, {40, 5}, {137, 2}},
-- Leafdim      Cure Potency, Fast Cast, Conserve MP, Cure Spellcasting Time, Song Spellcasting Time, Spell Interrupt Rate
                {{329, 8}, {140, 5}, {141, 5}, {323, 7}, {322, 7}, {53, 10}},
-- Leaforb      Pet: Regen, Pet: Subtle Blow, Pet: Breath DMG Dealt, Pet: Double Attack, Avatar Perp. Cost, Elemental Siphon
                {{110, 3}, {116, 8}, {121, 10}, {123, 5}, {321, 4}, {339, 7}},
-- Duskslit     STR, VIT, STR/VIT, STR/MND, WS DMG, HP
                {{512, 10}, {514, 10}, {551, 7}, {559, 7}, {327, 3}, {1, 50}},
-- Dusktip      DEX, AGI, STR/DEX, STR/AGI, Snapshot, SC DMG
                {{513, 10}, {515, 10}, {550, 7}, {552, 7}, {211, 5}, {332, 5}},
-- Duskdim      INT, INT/MND, Regen Potency, Enh. Magic Duration, MP, MND
                {{516, 10}, {554, 7}, {371, 3}, {1248, 10}, {9, 50}, {517, 10}},
-- Duskorb      MND, CHR, MND/CHR, STR/CHR, Pet: Haste, Pet: -% DT
                {{517, 10}, {518, 10}, {555, 7}, {557, 7}, {111, 5}, {112, 4}}
}

-- Helios Armor Augs
local augsHelios =
{
-- Snowslit        ACC,      ATK,    ACC/ATK,   RACC,     RATK,     MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 10}, {25, 10}, {68, 5}, {27, 10}, {29, 10}, {35, 25}, {133, 25}, {33, 20}, {31, 20}, {37, 25}},
-- Snowtip         ACC,      ATK,      RACC,     RATK,  RACC/RATK,  MACC,     MATK,      DEF,      EVA,      MEVA
                {{23, 10}, {25, 10}, {27, 10}, {29, 10}, {69, 5}, {35, 25}, {133, 25}, {33, 20}, {31, 20}, {37, 25}},
-- Snowdim         ACC,      ATK,      RACC,     RATK,     MACC,     MATK,    MACC/MATK,   DEF,      EVA,      MEVA
                {{23, 10}, {25, 10}, {27, 10}, {29, 10}, {35, 25}, {133, 25}, {131, 20}, {33, 20}, {31, 20}, {37, 25}},
-- Snoworb      Pet: ACC/RACC, Pet: ATK/RATK, Pet: MACC, Pet: MATK, Pet: DEF, Pet: EVA, Pet: MEVA
                {{106, 30}, {107, 30}, {100, 30}, {101, 30}, {99, 30}, {98, 30}, {117, 30}},
-- Leafslit     Store TP, Double Attack, Cure Pot. Rcvd, WS ACC, Waltz Potency, Enemy Crit Hit Rate
                {{142, 3}, {143, 2}, {356, 7}, {326, 10}, {330, 5}, {42, 4}},
-- Leaftip      Waltz Potency, Enemy Crit Hit Rate, Subtle Blow, Haste, Enmity-, Regen
                {{330, 5}, {42, 4}, {195, 3}, {49, 2}, {40, 5}, {137, 2}},
-- Leafdim      Magic Crit Hit Rate, Fast Cast, Conserve MP, Drain/Aspir Potency, Spell Interrupt Rate, Occult Acumen
                {{57, 8}, {140, 5}, {141, 5}, {343, 10}, {53, 10}, {237, 10}},
-- Leaforb      Pet: Regen, Pet: Crit Hit Rate, Pet: Double Attack, Avatar Perp. Cost, Blood Pact Ability Delay, Blood Boon
                {{110, 3}, {102, 4}, {123, 8}, {321, 4}, {320, 5}, {233, 7}},
-- Duskslit     STR, VIT, STR/VIT, STR/MND, WS DMG, HP
                {{512, 10}, {514, 10}, {551, 7}, {559, 7}, {327, 3}, {1, 50}},
-- Dusktip      DEX, AGI, STR/DEX, STR/AGI, Snapshot, SC DMG
                {{513, 10}, {515, 10}, {550, 7}, {552, 7}, {211, 5}, {332, 5}},
-- Duskdim      INT, INT/MND, Magic Crit Hit DMG, Magic Burst DMG, MP, MND
                {{516, 10}, {554, 7}, {335, 10}, {334, 10}, {9, 50}, {517, 10}},
-- Duskorb      MND, CHR, MND/CHR, Blood Pact DMG, Summoning Magic Skill, Pet: Haste
                {{517, 10}, {518, 10}, {555, 7}, {369, 7}, {294, 8}, {111, 6}}
}

local function getGearAugments(trade)
    local itemToAug = 0
    local augList   = {{}, {}, {}, {}}

    for i = 0, 7, 1 do
        local itemID = trade:getItemId(i)

        for v = 1, #acceptedGear do
            if itemID == acceptedGear[v] then
                itemToAug = trade:getItem(i)
                break
            end
        end
    end

    if itemToAug then
        local augID    = 0
        local augValue = 0

        for i = 1, 4 do
            augList[i][1], augList[i][2] = itemToAug:getAugment(i - 1)
        end
    end

    return augList
end

function onTrade(player, npc, trade)
    if player:getCharVar("KillCounter_Kirin") > 0 and player:getCharVar("KillCounter_JailOfLove") > 0 then
        local stoneQty
        local augGear          = 0
        local augStoneCategory = 0
        local augGearCategory  = 0

        -- Check for type of stone included in trade
        for i = 1, #acceptedStones do
            if (npcUtil.tradeHas(trade, {acceptedStones[i]})) then
                -- tradedStone = acceptedStones[i][1]
                augStoneCategory = i
                stoneQty = trade:getItemQty(acceptedStones[i][1])
                break
            end
        end

        -- Cancel transaction if no stones are found or not enough were traded
        if augStoneCategory == 0 then
            player:PrintToPlayer(string.format("Detrovio : I can't apply an augment without the appropriate number of required stones."),tpz.msg.channel.NS_SAY)
            return
        end

        if augStoneCategory >= 1 and augStoneCategory <= 12 and stoneQty ~= 25 then
            player:PrintToPlayer(string.format("Detrovio : I'll need 25 stones of that quality to apply an augment."),tpz.msg.channel.NS_SAY)
            return
        elseif augStoneCategory >= 13 and augStoneCategory <= 24 and stoneQty ~= 2 then
            player:PrintToPlayer(string.format("Detrovio : I'll need 2 stones of that quality to apply an augment."),tpz.msg.channel.NS_SAY)
            return
        elseif augStoneCategory >= 25 and augStoneCategory <= 36 and stoneQty ~= 1 then
            player:PrintToPlayer(string.format("Detrovio : I only need 1 stone of that quality to apply an augment."),tpz.msg.channel.NS_SAY)
            return
        end

        -- Check for the piece of gear
        for i = 1, #acceptedGear do
            if npcUtil.tradeHas(trade, acceptedGear[i]) then
                augGear = acceptedGear[i]
                augGearCategory = i
                break
            end
        end

        -- Cancel the transaction if no gear is found
        if augGear == 0 then
            player:PrintToPlayer(string.format("Detrovio : You're gonna have to trade me a piece of armor if you want these augments."),tpz.msg.channel.NS_SAY)
            return
        end

        local hasExistingAug = false
        local gearAugments   = getGearAugments(trade)
        
        -- for i = 1, 4 do
            -- printf("Detrovio.lua onTrade  AUGMENT %i: [%i]  AUGMENT VALUE %i: [%i]", i, gearAugments[i][1], i, gearAugments[i][2])
        -- end

        if
            gearAugments[1][1] > 0 or
            gearAugments[2][1] > 0 or
            gearAugments[3][1] > 0 or
            gearAugments[4][1] > 0
        then
            hasExistingAug = true
        end

        local selectRandom
        local randomAug
        local randomAugValue
        local existingAug = {Augment = {0, 0, 0}, Value = {0, 0, 0}}
        local augCategory

        -- Check for existing augments on the item
        for i = 1, 3 do
            if hasExistingAug == true then
                existingAug.Augment[i] = gearAugments[i][1]
                existingAug.Value[i]   = gearAugments[i][2]
                -- printf("Detrovio.lua onTrade EXISTING AUG FOUND 1 CATEGORY: [%i]  NUMBER: [%i]  VALUE: [%i]", existingAug.Category[i], existingAug.Augment[i], existingAug.Value[i])
            end
        end

        -- Applies the first augment to an unaugmented piece of gear
        -- Requires 25x NQ stones
        if hasExistingAug == false and augStoneCategory <= 12 then
            -- Pick random augment from gear specific augments using stone type to determine which row to use
            if augGearCategory >= 1 and augGearCategory <= 5 then
                selectRandom   = math.random(1, #augsYorium[augStoneCategory])
                randomAug      = augsYorium[augStoneCategory][selectRandom][1]
                randomAugValue = math.random(1, augsYorium[augStoneCategory][selectRandom][2] - 1)
                -- printf("Detrovio.lua onTrade YORIUM RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsYorium[augStoneCategory][selectRandom][2])
            elseif augGearCategory >= 6 and augGearCategory <= 10 then
                selectRandom   = math.random(1, #augsAcro[augStoneCategory])
                randomAug      = augsAcro[augStoneCategory][selectRandom][1]
                randomAugValue = math.random(1, augsAcro[augStoneCategory][selectRandom][2] - 1)
                -- printf("Detrovio.lua onTrade ACRO RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsAcro[augStoneCategory][selectRandom][2])
            elseif augGearCategory >= 11 and augGearCategory <= 15 then
                selectRandom   = math.random(1, #augsTaeon[augStoneCategory])
                randomAug      = augsTaeon[augStoneCategory][selectRandom][1]
                randomAugValue = math.random(1, augsTaeon[augStoneCategory][selectRandom][2] - 1)
                -- printf("Detrovio.lua onTrade TAEON RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsTaeon[augStoneCategory][selectRandom][2])
            elseif augGearCategory >= 16 and augGearCategory <= 20 then
                selectRandom   = math.random(1, #augsTelchine[augStoneCategory])
                randomAug      = augsTelchine[augStoneCategory][selectRandom][1]
                randomAugValue = math.random(1, augsTelchine[augStoneCategory][selectRandom][2] - 1)
                -- printf("Detrovio.lua onTrade TELCHINE RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsTelchine[augStoneCategory][selectRandom][2])
            elseif augGearCategory >= 21 and augGearCategory <= 25 then
                selectRandom   = math.random(1, #augsHelios[augStoneCategory])
                randomAug      = augsHelios[augStoneCategory][selectRandom][1]
                randomAugValue = math.random(1, augsHelios[augStoneCategory][selectRandom][2] - 1)
                -- printf("Detrovio.lua onTrade HELIOS RANDOM AUG: [%i]  VALUE: [%i]  CAP: [%i]", randomAug, randomAugValue, augsHelios[augStoneCategory][selectRandom][2])
            end

            player:tradeComplete()

            -- Sets augCategory to Slot 1 (Snow), Slot 2 (Leaf), or Slot 3 (Dusk)
            if augStoneCategory >= 1 and augStoneCategory <= 4 then
                -- augCategory = 1
                player:addItem(augGear, 1, randomAug, randomAugValue)
            elseif augStoneCategory >= 5 and augStoneCategory <= 8 then
                -- augCategory = 2
                player:addItem(augGear, 1, 0, 0, randomAug, randomAugValue)
            elseif augStoneCategory >= 9 and augStoneCategory <= 12 then
                -- augCategory = 3
                player:addItem(augGear, 1, 0, 0, 0, 0, randomAug, randomAugValue)
            end

            player:PrintToPlayer(string.format("Detrovio : Starting fresh eh? Bring back more stones if you'd like for me to try again."),tpz.msg.channel.NS_SAY)
        -- Cancels trade if the armor doesn't have an existing augment matching the traded HQ stone
        elseif hasExistingAug == false and augStoneCategory > 12 then
            player:PrintToPlayer(string.format("Detrovio : You trying to make this blow up in my face?! You have to have an existing augment for that to work!"),tpz.msg.channel.NS_SAY)
        -- Applies existing augments and new augment if in a different category or rerolls existing augment in same category
        elseif hasExistingAug == true and augStoneCategory <= 12 then
            local augSnow = {existingAug.Augment[1], existingAug.Value[1]}
            local augLeaf = {existingAug.Augment[2], existingAug.Value[2]}
            local augDusk = {existingAug.Augment[3], existingAug.Value[3]}

            -- Apply new augments
            -- Snow
            if augStoneCategory >= 1 and augStoneCategory <= 4 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    selectRandom = math.random(1, #augsYorium[augStoneCategory])
                    augSnow[1] = augsYorium[augStoneCategory][selectRandom][1]
                    augSnow[2] = math.random(1, augsYorium[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    selectRandom = math.random(1, #augsAcro[augStoneCategory])
                    augSnow[1] = augsAcro[augStoneCategory][selectRandom][1]
                    augSnow[2] = math.random(1, augsAcro[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    selectRandom = math.random(1, #augsTaeon[augStoneCategory])
                    augSnow[1] = augsTaeon[augStoneCategory][selectRandom][1]
                    augSnow[2] = math.random(1, augsTaeon[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    selectRandom = math.random(1, #augsTelchine[augStoneCategory])
                    augSnow[1] = augsTelchine[augStoneCategory][selectRandom][1]
                    augSnow[2] = math.random(1, augsTelchine[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    selectRandom = math.random(1, #augsHelios[augStoneCategory])
                    augSnow[1] = augsHelios[augStoneCategory][selectRandom][1]
                    augSnow[2] = math.random(1, augsHelios[augStoneCategory][selectRandom][2] - 1)
                end
            -- Leaf
            elseif augStoneCategory >= 5 and augStoneCategory <= 8 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    selectRandom = math.random(1, #augsYorium[augStoneCategory])
                    augLeaf[1] = augsYorium[augStoneCategory][selectRandom][1]
                    augLeaf[2] = math.random(1, augsYorium[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    selectRandom = math.random(1, #augsAcro[augStoneCategory])
                    augLeaf[1] = augsAcro[augStoneCategory][selectRandom][1]
                    augLeaf[2] = math.random(1, augsAcro[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    selectRandom = math.random(1, #augsTaeon[augStoneCategory])
                    augLeaf[1] = augsTaeon[augStoneCategory][selectRandom][1]
                    augLeaf[2] = math.random(1, augsTaeon[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    selectRandom = math.random(1, #augsTelchine[augStoneCategory])
                    augLeaf[1] = augsTelchine[augStoneCategory][selectRandom][1]
                    augLeaf[2] = math.random(1, augsTelchine[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    selectRandom = math.random(1, #augsHelios[augStoneCategory])
                    augLeaf[1] = augsHelios[augStoneCategory][selectRandom][1]
                    augLeaf[2] = math.random(1, augsHelios[augStoneCategory][selectRandom][2] - 1)
                end
            -- Dusk
            elseif augStoneCategory >= 9 and augStoneCategory <= 12 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    selectRandom = math.random(1, #augsYorium[augStoneCategory])
                    augDusk[1] = augsYorium[augStoneCategory][selectRandom][1]
                    augDusk[2] = math.random(1, augsYorium[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    selectRandom = math.random(1, #augsAcro[augStoneCategory])
                    augDusk[1] = augsAcro[augStoneCategory][selectRandom][1]
                    augDusk[2] = math.random(1, augsAcro[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    selectRandom = math.random(1, #augsTaeon[augStoneCategory])
                    augDusk[1] = augsTaeon[augStoneCategory][selectRandom][1]
                    augDusk[2] = math.random(1, augsTaeon[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    selectRandom = math.random(1, #augsTelchine[augStoneCategory])
                    augDusk[1] = augsTelchine[augStoneCategory][selectRandom][1]
                    augDusk[2] = math.random(1, augsTelchine[augStoneCategory][selectRandom][2] - 1)
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    selectRandom = math.random(1, #augsHelios[augStoneCategory])
                    augDusk[1] = augsHelios[augStoneCategory][selectRandom][1]
                    augDusk[2] = math.random(1, augsHelios[augStoneCategory][selectRandom][2] - 1)
                end
            end

            player:tradeComplete()

            player:addItem(augGear, 1, augSnow[1], augSnow[2], augLeaf[1], augLeaf[2], augDusk[1], augDusk[2])

            player:PrintToPlayer(string.format("Detrovio : Those existing augments are always tricky but it looks like I got them right."),tpz.msg.channel.NS_SAY)
        -- Applies existing augments and rolls new augment value in same category as traded stone (HQ stones)
        elseif hasExistingAug == true and augStoneCategory > 12 then
            local augSnow = {existingAug.Augment[1], existingAug.Value[1]}
            local augLeaf = {existingAug.Augment[2], existingAug.Value[2]}
            local augDusk = {existingAug.Augment[3], existingAug.Value[3]}

            -- Cancel trade if the armor does not have an existing augment in the Stone category
            -- Snow +1 & Snow +2
            if ((augSnow[1] == 0) and (augStoneCategory >= 13 and augStoneCategory <= 16) or (augSnow[1] == 0) and (augStoneCategory >= 25 and augStoneCategory <= 28)) then
                player:PrintToPlayer(string.format("Detrovio : Whoa there, the power in those stones will destroy the armor if that category isn't augmented first!"),tpz.msg.channel.NS_SAY)
                return
            -- Leaf +1 & Leaf +2
            elseif ((augLeaf[1] == 0) and (augStoneCategory >= 17 and augStoneCategory <= 20) or (augLeaf[1] == 0) and (augStoneCategory >= 29 and augStoneCategory <= 32)) then
                player:PrintToPlayer(string.format("Detrovio : Whoa there, the power in those stones will destroy the armor if that category isn't augmented first!"),tpz.msg.channel.NS_SAY)
                return
            -- Dusk +1 and Dusk +2
            elseif ((augDusk[1] == 0) and (augStoneCategory >= 21 and augStoneCategory <= 24) or (augDusk[1] == 0) and (augStoneCategory >= 33 and augStoneCategory <= 36)) then
                player:PrintToPlayer(string.format("Detrovio : Whoa there, the power in those stones will destroy the armor if that category isn't augmented first!"),tpz.msg.channel.NS_SAY)
                return
            end

            local augPointer  = 0
            local augMinValue = 0

            -- Apply new augments
            -- Snow +1
            if augStoneCategory >= 13 and augStoneCategory <= 16 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    for i, v in ipairs(augsYorium[augStoneCategory - 12]) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsYorium[augStoneCategory - 12][i][1])
                        if augsYorium[augStoneCategory - 12][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsYorium[augStoneCategory - 12][i][2] * 0.35)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsYorium[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsYorium[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    for i, v in ipairs(augsAcro) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsAcro[augStoneCategory - 12][i][1])
                        if augsAcro[augStoneCategory - 12][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsAcro[augStoneCategory - 12][i][2] * 0.35)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsAcro[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsAcro[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    for i, v in ipairs(augsTaeon) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsTaeon[augStoneCategory - 12][i][1])
                        if augsTaeon[augStoneCategory - 12][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTaeon[augStoneCategory - 12][i][2] * 0.35)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTaeon[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsTaeon[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    for i, v in ipairs(augsTelchine) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsTelchine[augStoneCategory - 12][i][1])
                        if augsTelchine[augStoneCategory - 12][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTelchine[augStoneCategory - 12][i][2] * 0.35)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTelchine[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsTelchine[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    for i, v in ipairs(augsHelios) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsHelios[augStoneCategory - 12][i][1])
                        if augsHelios[augStoneCategory - 12][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsHelios[augStoneCategory - 12][i][2] * 0.35)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsHelios[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsHelios[augStoneCategory - 12][augPointer][2] - 1)
                    end
                end
            -- Snow +2
            elseif augStoneCategory >= 25 and augStoneCategory <= 28 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    for i, v in ipairs(augsYorium) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsYorium[augStoneCategory - 24][i][1])
                        if augsYorium[augStoneCategory - 24][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsYorium[augStoneCategory - 24][i][2] * 0.70)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsYorium[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsYorium[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    for i, v in ipairs(augsAcro) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsAcro[augStoneCategory - 24][i][1])
                        if augsAcro[augStoneCategory - 24][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsAcro[augStoneCategory - 24][i][2] * 0.70)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsAcro[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsAcro[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    for i, v in ipairs(augsTaeon) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsTaeon[augStoneCategory - 24][i][1])
                        if augsTaeon[augStoneCategory - 24][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTaeon[augStoneCategory - 24][i][2] * 0.70)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTaeon[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsTaeon[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    for i, v in ipairs(augsTelchine) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsTelchine[augStoneCategory - 24][i][1])
                        if augsTelchine[augStoneCategory - 24][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTelchine[augStoneCategory - 24][i][2] * 0.70)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTelchine[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsTelchine[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    for i, v in ipairs(augsHelios) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augSnow[1], augsHelios[augStoneCategory - 24][i][1])
                        if augsHelios[augStoneCategory - 24][i][1] == augSnow[1] then
                            augPointer = i
                            augMinValue = math.floor(augsHelios[augStoneCategory - 24][i][2] * 0.70)

                            if augSnow[2] > augMinValue then
                                augMinValue = augSnow[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsHelios[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augSnow[2] = math.random(augMinValue, augsHelios[augStoneCategory - 24][augPointer][2] - 1)
                    end
                end
            -- Leaf +1
            elseif augStoneCategory >= 17 and augStoneCategory <= 20 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    for i, v in ipairs(augsYorium) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsYorium[augStoneCategory - 12][i][1])
                        if augsYorium[augStoneCategory - 12][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsYorium[augStoneCategory - 12][i][2] * 0.35)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsYorium[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsYorium[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    for i, v in ipairs(augsAcro) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsAcro[augStoneCategory - 12][i][1])
                        if augsAcro[augStoneCategory - 12][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsAcro[augStoneCategory - 12][i][2] * 0.35)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsAcro[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsAcro[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    for i, v in ipairs(augsTaeon) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsTaeon[augStoneCategory - 12][i][1])
                        if augsTaeon[augStoneCategory - 12][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTaeon[augStoneCategory - 12][i][2] * 0.35)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTaeon[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsTaeon[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    for i, v in ipairs(augsTelchine) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsTelchine[augStoneCategory - 12][i][1])
                        if augsTelchine[augStoneCategory - 12][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTelchine[augStoneCategory - 12][i][2] * 0.35)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTelchine[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsTelchine[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    for i, v in ipairs(augsHelios) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsHelios[augStoneCategory - 12][i][1])
                        if augsHelios[augStoneCategory - 12][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsHelios[augStoneCategory - 12][i][2] * 0.35)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsHelios[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsHelios[augStoneCategory - 12][augPointer][2] - 1)
                    end
                end
            -- Leaf +2
            elseif augStoneCategory >= 29 and augStoneCategory <= 32 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    for i, v in ipairs(augsYorium) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsYorium[augStoneCategory - 24][i][1])
                        if augsYorium[augStoneCategory - 24][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsYorium[augStoneCategory - 24][i][2] * 0.70)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsYorium[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsYorium[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    for i, v in ipairs(augsAcro) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsAcro[augStoneCategory - 24][i][1])
                        if augsAcro[augStoneCategory - 24][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsAcro[augStoneCategory - 24][i][2] * 0.70)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsAcro[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsAcro[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    for i, v in ipairs(augsTaeon) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsTaeon[augStoneCategory - 24][i][1])
                        if augsTaeon[augStoneCategory - 24][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTaeon[augStoneCategory - 24][i][2] * 0.70)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTaeon[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsTaeon[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    for i, v in ipairs(augsTelchine) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsTelchine[augStoneCategory - 24][i][1])
                        if augsTelchine[augStoneCategory - 24][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTelchine[augStoneCategory - 24][i][2] * 0.70)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTelchine[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsTelchine[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    for i, v in ipairs(augsHelios) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augLeaf[1], augsHelios[augStoneCategory - 24][i][1])
                        if augsHelios[augStoneCategory - 24][i][1] == augLeaf[1] then
                            augPointer = i
                            augMinValue = math.floor(augsHelios[augStoneCategory - 24][i][2] * 0.70)

                            if augLeaf[2] > augMinValue then
                                augMinValue = augLeaf[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsHelios[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augLeaf[2] = math.random(augMinValue, augsHelios[augStoneCategory - 24][augPointer][2] - 1)
                    end
                end
            -- Dusk +1
            elseif augStoneCategory >= 21 and augStoneCategory <= 24 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    for i, v in ipairs(augsYorium) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsYorium[augStoneCategory - 12][i][1])
                        if augsYorium[augStoneCategory - 12][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsYorium[augStoneCategory - 12][i][2] * 0.35)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsYorium[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsYorium[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    for i, v in ipairs(augsAcro) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsAcro[augStoneCategory - 12][i][1])
                        if augsAcro[augStoneCategory - 12][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsAcro[augStoneCategory - 12][i][2] * 0.35)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsAcro[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsAcro[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    for i, v in ipairs(augsTaeon) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsTaeon[augStoneCategory - 12][i][1])
                        if augsTaeon[augStoneCategory - 12][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTaeon[augStoneCategory - 12][i][2] * 0.35)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTaeon[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsTaeon[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    for i, v in ipairs(augsTelchine) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsTelchine[augStoneCategory - 12][i][1])
                        if augsTelchine[augStoneCategory - 12][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTelchine[augStoneCategory - 12][i][2] * 0.35)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTelchine[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsTelchine[augStoneCategory - 12][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    for i, v in ipairs(augsHelios) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsHelios[augStoneCategory - 12][i][1])
                        if augsHelios[augStoneCategory - 12][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsHelios[augStoneCategory - 12][i][2] * 0.35)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsHelios[augStoneCategory - 12][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsHelios[augStoneCategory - 12][augPointer][2] - 1)
                    end
                end
            -- Dusk +2
            elseif augStoneCategory >= 33 and augStoneCategory <= 36 then
                if augGearCategory >= 1 and augGearCategory <= 5 then
                    for i, v in ipairs(augsYorium) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsYorium[augStoneCategory - 24][i][1])
                        if augsYorium[augStoneCategory - 24][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsYorium[augStoneCategory - 24][i][2] * 0.70)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsYorium[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsYorium[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 6 and augGearCategory <= 10 then
                    for i, v in ipairs(augsAcro) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsAcro[augStoneCategory - 24][i][1])
                        if augsAcro[augStoneCategory - 24][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsAcro[augStoneCategory - 24][i][2] * 0.70)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsAcro[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsAcro[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 11 and augGearCategory <= 15 then
                    for i, v in ipairs(augsTaeon) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsTaeon[augStoneCategory - 24][i][1])
                        if augsTaeon[augStoneCategory - 24][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTaeon[augStoneCategory - 24][i][2] * 0.70)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTaeon[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsTaeon[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 16 and augGearCategory <= 20 then
                    for i, v in ipairs(augsTelchine) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsTelchine[augStoneCategory - 24][i][1])
                        if augsTelchine[augStoneCategory - 24][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsTelchine[augStoneCategory - 24][i][2] * 0.70)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsTelchine[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsTelchine[augStoneCategory - 24][augPointer][2] - 1)
                    end
                elseif augGearCategory >= 21 and augGearCategory <= 25 then
                    for i, v in ipairs(augsHelios) do
                        -- printf("Detrovio.lua onTrade SEARCH FOR [%i] AUG IN TABLE   RESULT: [%i]", augDusk[1], augsHelios[augStoneCategory - 24][i][1])
                        if augsHelios[augStoneCategory - 24][i][1] == augDusk[1] then
                            augPointer = i
                            augMinValue = math.floor(augsHelios[augStoneCategory - 24][i][2] * 0.70)

                            if augDusk[2] > augMinValue then
                                augMinValue = augDusk[2]
                            end

                            -- printf("FOUND AUG IN TABLE  AUG MAX VALUE: [%i]  NEW MIN VALUE: [%i]", augsHelios[augStoneCategory - 24][i][2], augMinValue)
                            break
                        end
                    end

                    if augPointer > 0 then
                        augDusk[2] = math.random(augMinValue, augsHelios[augStoneCategory - 24][augPointer][2] - 1)
                    end
                end
            end

            if augPointer == 0 then
                player:PrintToPlayer(string.format("Detrovio : Looks like the stones you traded me don't match the current augment."),tpz.msg.channel.NS_SAY)
                return
            end

            player:tradeComplete()

            player:addItem(augGear, 1, augSnow[1], augSnow[2], augLeaf[1], augLeaf[2], augDusk[1], augDusk[2])

            if augStoneCategory >= 13 and augStoneCategory <= 24 then
                player:PrintToPlayer(string.format("Detrovio : Whew, you can really feel the power of those stronger stones!"),tpz.msg.channel.NS_SAY)
            elseif augStoneCategory >= 25 and augStoneCategory <= 36 then
                player:PrintToPlayer(string.format("Detrovio : Yeoch, that got really hot! Here you go!"),tpz.msg.channel.NS_SAY)
            end
        end
    else
        player:PrintToPlayer(string.format("Detrovio : Looks like you'll need to defeat Kirin and the Jailer of Love before I can augment that item."),tpz.msg.channel.NS_SAY)
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Detrovio : I handle the complicated process of applying augments to Alluvion Skirmish armor from the Beastman Tribal Leaders."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
