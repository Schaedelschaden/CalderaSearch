-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Sifa Alani
-- Type: Ambuscade Equipment
-- !pos -103 -0.6 -50 257
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

-----------------------------------
-- Ambuscade Weapons
-----------------------------------
local itemTrades =
{
    [  1] = {trade = {21515, {9782, 15}}, reward = 21516}, -- Tokko Knuckles       to Ajja Knucles
    [  2] = {trade = {21561, {9782, 15}}, reward = 21562}, -- Tokko Knife          to Ajja Knife
    [  3] = {trade = {21617, {9782, 15}}, reward = 21618}, -- Tokko Sword          to Ajja Sword
    [  4] = {trade = {21670, {9782, 15}}, reward = 21671}, -- Tokko Claymore       to Ajja Claymore
    [  5] = {trade = {21718, {9782, 15}}, reward = 21719}, -- Tokko Axe            to Ajja Axe
    [  6] = {trade = {21775, {9782, 15}}, reward = 21776}, -- Tokko Chopper        to Ajja Chopper
    [  7] = {trade = {21826, {9782, 15}}, reward = 21827}, -- Tokko Scythe         to Ajja Scythe
    [  8] = {trade = {21879, {9782, 15}}, reward = 21880}, -- Tokko Lance          to Ajja Lance
    [  9] = {trade = {21918, {9782, 15}}, reward = 21919}, -- Tokko Katana         to Ajja Katana
    [ 10] = {trade = {21971, {9782, 15}}, reward = 21972}, -- Tokko Tachi          to Ajja Tachi
    [ 11] = {trade = {22027, {9782, 15}}, reward = 22028}, -- Tokko Rod            to Ajja Rod
    [ 12] = {trade = {22082, {9782, 15}}, reward = 22083}, -- Tokko Staff          to Ajja Staff
    [ 13] = {trade = {22108, {9782, 15}}, reward = 22109}, -- Tokko Bow            to Ajja Bow
    [ 14] = {trade = {22214, {9782, 15}}, reward = 22215}, -- Tokko Grip           to Ajja Grip
    [ 15] = {trade = {21516, {9783, 15}}, reward = 21517}, -- Ajja Knuckles        to Eletta Knucles
    [ 16] = {trade = {21562, {9783, 15}}, reward = 21563}, -- Ajja Knife           to Eletta Knife
    [ 17] = {trade = {21618, {9783, 15}}, reward = 21619}, -- Ajja Sword           to Eletta Sword
    [ 18] = {trade = {21671, {9783, 15}}, reward = 21672}, -- Ajja Claymore        to Eletta Claymore
    [ 19] = {trade = {21719, {9783, 15}}, reward = 21720}, -- Ajja Axe             to Eletta Axe
    [ 20] = {trade = {21776, {9783, 15}}, reward = 21777}, -- Ajja Chopper         to Eletta Chopper
    [ 21] = {trade = {21827, {9783, 15}}, reward = 21828}, -- Ajja Scythe          to Eletta Scythe
    [ 22] = {trade = {21880, {9783, 15}}, reward = 21881}, -- Ajja Lance           to Eletta Lance
    [ 23] = {trade = {21919, {9783, 15}}, reward = 21920}, -- Ajja Katana          to Eletta Katana
    [ 24] = {trade = {21972, {9783, 15}}, reward = 21973}, -- Ajja Tachi           to Eletta Tachi
    [ 25] = {trade = {22028, {9783, 15}}, reward = 22029}, -- Ajja Rod             to Eletta Rod
    [ 26] = {trade = {22083, {9783, 15}}, reward = 22084}, -- Ajja Staff           to Eletta Staff
    [ 27] = {trade = {22109, {9783, 15}}, reward = 22110}, -- Ajja Bow             to Eletta Bow
    [ 28] = {trade = {22215, {9783, 15}}, reward = 22216}, -- Ajja Grip            to Eletta Grip
    [ 29] = {trade = {21517, {9784, 15}}, reward = 21518}, -- Eletta Knuckles      to Kaja Knuckles
    [ 30] = {trade = {21563, {9784, 15}}, reward = 21564}, -- Eletta Knife         to Kaja Knife
    [ 31] = {trade = {21619, {9784, 15}}, reward = 21620}, -- Eletta Sword         to Kaja Sword
    [ 32] = {trade = {21672, {9784, 15}}, reward = 21673}, -- Eletta Claymore      to Kaja Claymore
    [ 33] = {trade = {21720, {9784, 15}}, reward = 21721}, -- Eletta Axe           to Kaja Axe
    [ 34] = {trade = {21777, {9784, 15}}, reward = 21778}, -- Eletta Chopper       to Kaja Chopper
    [ 35] = {trade = {21828, {9784, 15}}, reward = 21829}, -- Eletta Scythe        to Kaja Scythe
    [ 36] = {trade = {21881, {9784, 15}}, reward = 21882}, -- Eletta Lance         to Kaja Lance
    [ 37] = {trade = {21920, {9784, 15}}, reward = 21921}, -- Eletta Katana        to Kaja Katana
    [ 38] = {trade = {21973, {9784, 15}}, reward = 21974}, -- Eletta Tachi         to Kaja Tachi
    [ 39] = {trade = {22029, {9784, 15}}, reward = 22030}, -- Eletta Rod           to Kaja Rod
    [ 40] = {trade = {22084, {9784, 15}}, reward = 22085}, -- Eletta Staff         to Kaja Staff
    [ 41] = {trade = {22110, {9784, 15}}, reward = 22111}, -- Eletta Bow           to Kaja Bow
    [ 42] = {trade = {22216, {9784, 15}}, reward = 22217}, -- Eletta Grip          to Kaja Grip

    -- Kaja to Final Form Reserved 43-56

    -- IDs for Final Form: Karambit 21519, Tauret 21565, Naegling 21621, Nandaka ???, Dolichenus 21722, Lycurgos 21779, Drepanum 21830,
    -- Shining One 21883, Gokotai 21922, Hachimonji 21975, Maxentius 22031, Xoanon 22086, Ullr 22107, Khonsu 22218

    -- Ambuscade Armors - In order: Head, Body, Hands, Legs, Feet
    [ 57] = {trade = {25579, {9270,  5}}, reward = 25580}, -- Flamma Zucchetto       to Flamma Zucchetto +1
    [ 58] = {trade = {25779, {9270,  5}}, reward = 25780}, -- Flamma Korazin         to Flamma Korazin +1
    [ 59] = {trade = {25818, {9270,  5}}, reward = 25819}, -- Flamma Manopolas       to Flamma Manopolas +1
    [ 60] = {trade = {25873, {9270,  5}}, reward = 25874}, -- Flamma Dirs            to Flamma Dirs +1
    [ 61] = {trade = {25940, {9270,  5}}, reward = 25941}, -- Flamma Gabieras        to Flamma Gabieras +1
    [ 62] = {trade = {25580, {9271, 10}}, reward = 25569}, -- Flamma Zucchetto +1    to Flamma Zucchetto +2
    [ 63] = {trade = {25780, {9271, 10}}, reward = 25797}, -- Flamma Korazin +1      to Flamma Korazin +2
    [ 64] = {trade = {25819, {9271, 10}}, reward = 25835}, -- Flamma Manopolas +1    to Flamma Manopolas +2
    [ 65] = {trade = {25874, {9271, 10}}, reward = 25886}, -- Flamma Dirs +1         to Flamma Dirs +2
    [ 66] = {trade = {25941, {9271, 10}}, reward = 25953}, -- Flamma Gabieras +1     to Flamma Gabieras +2
    [ 67] = {trade = {25590, {9270,  5}}, reward = 25591}, -- Tali'ah Turban         to Tali'ah Turban +1
    [ 68] = {trade = {25764, {9270,  5}}, reward = 25765}, -- Tali'ah Manteel        to Tali'ah Manteel +1
    [ 69] = {trade = {25812, {9270,  5}}, reward = 25813}, -- Tali'ah Gages          to Tali'ah Gages +1
    [ 70] = {trade = {25871, {9270,  5}}, reward = 25872}, -- Tali'ah Seraweels      to Tali'ah Seraweels +1
    [ 71] = {trade = {25937, {9270,  5}}, reward = 25938}, -- Tali'ah Crackows       to Tali'ah Crackows +1
    [ 72] = {trade = {25591, {9271, 10}}, reward = 25573}, -- Tali'ah Turban +1      to Tali'ah Turban +2
    [ 73] = {trade = {25765, {9271, 10}}, reward = 25796}, -- Tali'ah Manteel +1     to Tali'ah Manteel +2
    [ 74] = {trade = {25813, {9271, 10}}, reward = 25834}, -- Tali'ah Gages +1       to Tali'ah Gages +2
    [ 75] = {trade = {25872, {9271, 10}}, reward = 25885}, -- Tali'ah Seraweels +1   to Tali'ah Seraweels +2
    [ 76] = {trade = {25938, {9271, 10}}, reward = 25952}, -- Tali'ah Crackows +1    to Tali'ah Crackows +2
    [ 77] = {trade = {25581, {9270,  5}}, reward = 25582}, -- Mummu Bonnet           to Mummu Bonnet +1
    [ 78] = {trade = {25781, {9270,  5}}, reward = 25782}, -- Mummu Jacket           to Mummu Jacket +1
    [ 79] = {trade = {25820, {9270,  5}}, reward = 25821}, -- Mummu Wrists           to Mummu Wrists +1
    [ 80] = {trade = {25875, {9270,  5}}, reward = 25876}, -- Mummu Kecks            to Mummu Kecks +1
    [ 81] = {trade = {25942, {9270,  5}}, reward = 25943}, -- Mummu Gamashes         to Mummu Gamashes +1
    [ 82] = {trade = {25582, {9271, 10}}, reward = 25570}, -- Mummu Bonnet +1        to Mummu Bonnet +2
    [ 83] = {trade = {25782, {9271, 10}}, reward = 25798}, -- Mummu Jacket +1        to Mummu Jacket +2
    [ 84] = {trade = {25821, {9271, 10}}, reward = 25836}, -- Mummu Wrists +1        to Mummu Wrists +2
    [ 85] = {trade = {25876, {9271, 10}}, reward = 25887}, -- Mummu Kecks +1         to Mummu Kecks +2
    [ 86] = {trade = {25943, {9271, 10}}, reward = 25954}, -- Mummu Gamashes +1      to Mummu Gamashes +2
    [ 87] = {trade = {25588, {9270,  5}}, reward = 25589}, -- Ayanmo Zucchetto       to Ayanmo Zucchetto +1
    [ 88] = {trade = {25762, {9270,  5}}, reward = 25763}, -- Ayanmo Corazza         to Ayanmo Corazza +1
    [ 89] = {trade = {25810, {9270,  5}}, reward = 25811}, -- Ayanmo Manopolas       to Ayanmo Manopolas +1
    [ 90] = {trade = {25869, {9270,  5}}, reward = 25870}, -- Ayanmo Cosciales       to Ayanmo Cosciales +1
    [ 91] = {trade = {25935, {9270,  5}}, reward = 25936}, -- Ayanmo Gambieras       to Ayanmo Gambieras +1
    [ 92] = {trade = {25589, {9271, 10}}, reward = 25572}, -- Ayanmo Zucchetto +1    to Ayanmo Zucchetto +2
    [ 93] = {trade = {25763, {9271, 10}}, reward = 25795}, -- Ayanmo Corazza +1      to Ayanmo Corazza +2
    [ 94] = {trade = {25811, {9271, 10}}, reward = 25833}, -- Ayanmo Manopolas +1    to Ayanmo Manopolas +2
    [ 95] = {trade = {25870, {9271, 10}}, reward = 25884}, -- Ayanmo Cosciales +1    to Ayanmo Cosciales +2
    [ 96] = {trade = {25936, {9271, 10}}, reward = 25951}, -- Ayanmo Gambieras +1    to Ayanmo Gambieras +2
    [ 97] = {trade = {25583, {9270,  5}}, reward = 25584}, -- Mallquis Chapeau       to Mallquis Chapeau +1
    [ 98] = {trade = {25783, {9270,  5}}, reward = 25784}, -- Mallquis Saio          to Mallquis Saio +1
    [ 99] = {trade = {25822, {9270,  5}}, reward = 25823}, -- Mallquis Cuffs         to Mallquis Cuffs +1
    [100] = {trade = {25877, {9270,  5}}, reward = 25878}, -- Mallquis Trews         to Mallquis Trews +1
    [101] = {trade = {25944, {9270,  5}}, reward = 25945}, -- Mallquis Clogs         to Mallquis Clogs +1
    [102] = {trade = {25584, {9271, 10}}, reward = 25571}, -- Mallquis Chapeau +1    to Mallquis Chapeau +2
    [103] = {trade = {25784, {9271, 10}}, reward = 25799}, -- Mallquis Saio +1       to Mallquis Saio +2
    [104] = {trade = {25823, {9271, 10}}, reward = 25837}, -- Mallquis Cuffs +1      to Mallquis Cuffs +2
    [105] = {trade = {25878, {9271, 10}}, reward = 25888}, -- Mallquis Trews +1      to Mallquis Trews +2
    [106] = {trade = {25945, {9271, 10}}, reward = 25955}, -- Mallquis Clogs +1      to Mallquis Clogs +2
    [107] = {trade = {25659, {9270,  5}}, reward = 25660}, -- Sulevia's Mask         to Sulevia's Mask +1
    [108] = {trade = {25745, {9270,  5}}, reward = 25746}, -- Sulevia's Platemail    to Sulevia's Platemail +1
    [109] = {trade = {25800, {9270,  5}}, reward = 25801}, -- Sulevia's Gauntlets    to Sulevia's Gauntlets +1
    [110] = {trade = {25858, {9270,  5}}, reward = 25859}, -- Sulevia's Cuisses      to Sulevia's Cuisses +1
    [111] = {trade = {25925, {9270,  5}}, reward = 25926}, -- Sulevia's Leggings     to Sulevia's Leggings +1
    [112] = {trade = {25660, {9271, 10}}, reward = 25574}, -- Sulevia's Mask +1      to Sulevia's Mask +2
    [113] = {trade = {25746, {9271, 10}}, reward = 25790}, -- Sulevia's Platemail +1 to Sulevia's Platemail +2
    [114] = {trade = {25801, {9271, 10}}, reward = 25828}, -- Sulevia's Gauntlets +1 to Sulevia's Gauntlets +2
    [115] = {trade = {25859, {9271, 10}}, reward = 25879}, -- Sulevia's Cuisses +1   to Sulevia's Cuisses +2
    [116] = {trade = {25926, {9271, 10}}, reward = 25946}, -- Sulevia's Leggings +1  to Sulevia's Leggings +2
    [117] = {trade = {25663, {9270,  5}}, reward = 25664}, -- Hizamaru Somen         to Hizamaru Somen +1
    [118] = {trade = {25749, {9270,  5}}, reward = 25750}, -- Hizamaru Haramaki      to Hizamaru Haramaki +1
    [119] = {trade = {25804, {9270,  5}}, reward = 25805}, -- Hizamaru Kote          to Hizamaru Kote +1
    [120] = {trade = {25862, {9270,  5}}, reward = 25863}, -- Hizamaru Hizayoroi     to Hizamaru Hizayoroi +1
    [121] = {trade = {25929, {9270,  5}}, reward = 25930}, -- Hizamaru Sune-Ate      to Hizamaru Sune-Ate +1
    [122] = {trade = {25664, {9271, 10}}, reward = 25576}, -- Hizamaru Somen +1      to Hizamaru Somen +2
    [123] = {trade = {25750, {9271, 10}}, reward = 25792}, -- Hizamaru Haramaki +1   to Hizamaru Haramaki +2
    [124] = {trade = {25805, {9271, 10}}, reward = 25830}, -- Hizamaru Kote +1       to Hizamaru Kote +2
    [125] = {trade = {25863, {9271, 10}}, reward = 25881}, -- Hizamaru Hizayoroi +1  to Hizamaru Hizayoroi +2
    [126] = {trade = {25930, {9271, 10}}, reward = 25948}, -- Hizamaru Sune-Ate +1   to Hizamaru Sune-Ate +2
    [127] = {trade = {25665, {9270,  5}}, reward = 25666}, -- Inyanga Tiara          to Inyanga Tiara +1
    [128] = {trade = {25751, {9270,  5}}, reward = 25752}, -- Inyanga Jubbah         to Inyanga Jubbah +1
    [129] = {trade = {25806, {9270,  5}}, reward = 25807}, -- Inyanga Dastanas       to Inyanga Dastanas +1
    [130] = {trade = {25865, {9270,  5}}, reward = 25866}, -- Inyanga Shalwar        to Inyanga Shalwar +1
    [131] = {trade = {25931, {9270,  5}}, reward = 25932}, -- Inyanga Crackows       to Inyanga Crackows +1
    [132] = {trade = {25666, {9271, 10}}, reward = 25577}, -- Inyanga Tiara +1       to Inyanga Tiara +2
    [133] = {trade = {25752, {9271, 10}}, reward = 25793}, -- Inyanga Jubbah +1      to Inyanga Jubbah +2
    [134] = {trade = {25807, {9271, 10}}, reward = 25831}, -- Inyanga Dastanas +1    to Inyanga Dastanas +2
    [135] = {trade = {25866, {9271, 10}}, reward = 25882}, -- Inyanga Shalwar +1     to Inyanga Shalwar +2
    [136] = {trade = {25932, {9271, 10}}, reward = 25949}, -- Inyanga Crackows +1    to Inyanga Crackows +2
    [137] = {trade = {25661, {9270,  5}}, reward = 25662}, -- Meghanada Visor        to Meghanada Visor +1
    [138] = {trade = {25747, {9270,  5}}, reward = 25748}, -- Meghanada Cuirie       to Meghanada Cuirie +1
    [139] = {trade = {25802, {9270,  5}}, reward = 25803}, -- Meghanada Gloves       to Meghanada Gloves +1
    [140] = {trade = {25860, {9270,  5}}, reward = 25861}, -- Meghanada Chausses     to Meghanada Chausses +1
    [141] = {trade = {25927, {9270,  5}}, reward = 25928}, -- Meghanada Jambeaux     to Meghanada Jambeaux +1
    [142] = {trade = {25662, {9271, 10}}, reward = 25575}, -- Meghanada Visor +1     to Meghanada Visor +2
    [143] = {trade = {25748, {9271, 10}}, reward = 25791}, -- Meghanada Cuirie +1    to Meghanada Cuirie +2
    [144] = {trade = {25803, {9271, 10}}, reward = 25829}, -- Meghanada Gloves +1    to Meghanada Gloves +2
    [145] = {trade = {25861, {9271, 10}}, reward = 25880}, -- Meghanada Chausses +1  to Meghanada Chausses +2
    [146] = {trade = {25928, {9271, 10}}, reward = 25947}, -- Meghanada Jambeaux +1  to Meghanada Jambeaux +2
    [147] = {trade = {25667, {9270,  5}}, reward = 25668}, -- Jhakri Coronal         to Jhakri Coronal +1
    [148] = {trade = {25753, {9270,  5}}, reward = 25754}, -- Jhakri Robe            to Jhakri Robe +1
    [149] = {trade = {25808, {9270,  5}}, reward = 25809}, -- Jhakri Cuffs           to Jhakri Cuffs +1
    [150] = {trade = {25867, {9270,  5}}, reward = 25868}, -- Jhakri Slops           to Jhakri Slops +1
    [151] = {trade = {25933, {9270,  5}}, reward = 25934}, -- Jhakri Pigaches        to Jhakri Pigaches +1
    [152] = {trade = {25668, {9271, 10}}, reward = 25578}, -- Jhakri Coronal +1      to Jhakri Coronal +2
    [153] = {trade = {25754, {9271, 10}}, reward = 25794}, -- Jhakri Robe +1         to Jhakri Robe +2
    [154] = {trade = {25809, {9271, 10}}, reward = 25832}, -- Jhakri Cuffs +1        to Jhakri Cuffs +2
    [155] = {trade = {25868, {9271, 10}}, reward = 25883}, -- Jhakri Slops +1        to Jhakri Slops +2
    [156] = {trade = {25934, {9271, 10}}, reward = 25950}, -- Jhakri Pigaches +1     to Jhakri Pigaches +2
}

function onTrade(player, npc, trade)
    local itemtrades
    local tradedCombo = 0

    -- Check for matching trade
    if tradedCombo == 0 and player:getCharVar("KillCounter_Kirin") >= 1 and player:getCharVar("KillCounter_JailofLove") >= 1 then
        for k, v in pairs(itemTrades) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                tradedCombo = k
                break
            end
        end
    end

    -- Found a match
    if tradedCombo > 0 then --  and not player:hasItem(itemTrades[tradedCombo].reward)
        local ID = zones[player:getZoneID()]
        local reward = itemTrades[tradedCombo].reward

        for i = 1, #itemTrades do
            if tradedCombo == i and player:hasItem(itemTrades[tradedCombo].reward) then
                player:messageSpecial(ID.text.CANNOT_OBTAIN_MORE)
                return
            end
        end

        player:confirmTrade()
        player:addItem(itemTrades[tradedCombo].reward, 1)
        player:messageSpecial(ID.text.ITEM_OBTAINED, itemTrades[tradedCombo].reward)

        if tradedCombo <= 56 then
            player:PrintToPlayer(string.format("Sifa Alani : These weapons have limitless untapped potential."),tpz.msg.channel.NS_SAY)
        elseif tradedCombo >= 57 then
            player:PrintToPlayer(string.format("Sifa Alani : These armor pieces have limitless untapped potential."),tpz.msg.channel.NS_SAY)
        end
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Sifa Alani : I'm fascinated by the equipment of Ambuscade!"),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
