-----------------------------------
-- Area: Western Adoulin
--  NPC: Ceciliotte
-- Type: Naakul augment NPC
-- !pos 83.491 -0.150 -47.884 256
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
    local naakualGear =
    {
    -- Kaabnax Hat, Kaabnax Trousers, Ejekamal Boots, Ejekamal Mask, Otomi Helm, Otomi Gloves,
        27737, 28167, 28305, 27738, 27739, 28028,
    -- Buremte Hat, Buremte Gloves, Uk'uxkaj Cap, Uk'uxkaj Boots, Quiahuiz Helm, Quiahuiz Leggings
        27767, 28050, 27766, 28331, 27736, 28166,
    -- Tamaxchi, Ixtab, Kuakuakait, Hatxiik, Azukinagamitsu, Atoyac, Taikogane
        21125, 20872, 20958, 20820, 21047, 20630, 20992,
    -- Xiutleato, Maochinoli, Ajjub Bow, Baqil Staff, Kaquljaan, Hunahpu, Xbalanque, Atetepeyorg
        20731, 20543, 21233, 21186, 20768, 20826, 20917, 21253
    }

    local voucher     = {{8711, 10}} -- Copper Voucher
    local pathItem    = {28800, 28801, 28802, 28803, 28804, 28805, 28806, 28807, 28808} -- Maze Rune 001 to Maze Rune 009
    local path        = 0
    local augGear     = 0
    local gearCounter = 0

    -- Cancel the transaction if no vouchers are found or not enough were traded
    if not npcUtil.tradeHas(trade, voucher) then
        player:PrintToPlayer(string.format("Ceciliotte : I'm going to need 10 Copper Vouchers to do this for you."),tpz.msg.channel.NS_SAY)
        return
    end

    -- Check for the required path Maze Rune
    for i = 1, #pathItem do
        if npcUtil.tradeHas(trade, {pathItem[i]}) then
            path = pathItem[i]
            break
        end
    end

    -- Cancel the transaction if no Maze Rune was provided
    if path == 0 then
        player:PrintToPlayer(string.format("Ceciliotte : Include a Maze Rune in your trade or I won't know which pathway to apply."),tpz.msg.channel.NS_SAY)
        return
    end

    -- Check for the piece of gear
    for i = 1, #naakualGear do
        if npcUtil.tradeHas(trade, naakualGear[i]) then
            augGear = naakualGear[i]
            gearCounter = i
            break
        end
    end

    -- Cancel the transaction if no gear is found
    if augGear == 0 then
        player:PrintToPlayer(string.format("Ceciliotte : You have to trade me a piece of Wildskeeper gear."),tpz.msg.channel.NS_SAY)
        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Ceciliotte : There, all improved!"),tpz.msg.channel.NS_SAY)

    if path == pathItem[1] then --Shared Path A
        if gearCounter <= 12 then -- Armor
            player:addItem(augGear, 1, 1, 29, 54, 1, 49, 1, 211, 1) -- HP +30, PDT -2%, Gear Haste +2%, Snapshot +2
        else -- Weapons
            player:addItem(augGear, 1, 23, 29, 35, 29, 84, 7) -- ACC +30, MACC +30, Trigger OAT Latent
        end
    elseif path == pathItem[2] then -- Shared Path B
        if gearCounter <= 12 then -- Armor
            player:addItem(augGear, 1, 9, 29, 55, 1, 140, 1) -- MP +30, MDT -2%, Fast Cast +2%
        else -- Weapons
            player:addItem(augGear, 1, 27, 29, 35, 29, 84, 7) -- RACC +30, MACC +30, Trigger OAT Latent
        end
    elseif path == pathItem[3] then -- Kumhau Path
        if gearCounter <= 12 then -- Armor
            player:addItem(augGear, 1, 362, 3, 516, 9, 9, 29) -- Magic Damage +4, INT +8, MP +30
        else -- Weapons
            player:addItem(augGear, 1, 133, 9, 362, 14, 40, 9) -- MAB +10, Magic Damage +15, Enmity -10
        end
    elseif path == pathItem[4] then -- Colkhab Path
        if gearCounter <= 12 then
            player:addItem(augGear, 1, 31, 9, 515, 7, 140, 2) -- EVA +10, AGI +8, Fast Cast +3
        else -- Weapons
            player:addItem(augGear, 1, 31, 14, 142, 4, 27, 14) -- EVA +15, STP +5, RACC +15
        end
    elseif path == pathItem[5] then -- Tchakka Path
        if gearCounter <= 12 then
            player:addItem(augGear, 1, 134, 1, 517, 7, 37, 9) -- MDEF +2, MND +8, MEVA +10
        else -- Weapons
            player:addItem(augGear, 1, 37, 14, 35, 14, 9, 29) -- MEVA +15, MACC +15, MP +30
        end
    elseif path == pathItem[6] then -- Achuka Path
        if gearCounter <= 12 then
            player:addItem(augGear, 1, 25, 9, 512, 7, 27, 9) -- ATT +10, STR +8, RATT +10
        else -- Weapons
            player:addItem(augGear, 1, 25, 19, 27, 19, 327, 1) -- ATK +20, RATK +20, WSD +2%
        end
    elseif path == pathItem[7] then -- Yumcax Path
        if gearCounter <= 12 then
            player:addItem(augGear, 1, 54, 1, 514, 7, 1, 29) -- PDT -2%, VIT +8, HP +30
        else -- Weapons
            player:addItem(augGear, 1, 71, 1, 137, 2, 356, 4) -- DT -2%, Regen +3, Cure pot Rec +5%
        end
    elseif path == pathItem[8] then -- Hurkan Path
        if gearCounter <= 12 then
            player:addItem(augGear, 1, 145, 1, 513, 7, 332, 2) -- Counter +2, DEX +8, SCD +2
        else -- Weapons
            player:addItem(augGear, 1, 23, 14, 41, 3, 328, 1) -- ACC +15, Crit hit rate +4, Crit hit dam +2
        end
    end
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Ceciliotte : Just because it's not 119 doesn't mean it isn't good."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
