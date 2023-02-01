-----------------------------------
-- Zone: Abyssea - Misareaux
-- NPC: Cruor Prospector
-- Type: Cruor NPC
-- !pos
-----------------------------------
local ID = require("scripts/zones/Abyssea-Konschtat/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/abyssea")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)

end

function onTrigger(player, npc)
    local cruor = player:getCurrency("cruor")
    local demilune = tpz.abyssea.getDemiluneAbyssite(player)
    local cosmos = tpz.abyssea.getCosmosAbyssite(player)

    -- Player must have Visitant status
--  if (player:hasStatusEffect(tpz.effect.VISITANT)) then
        player:startEvent(2002, cruor, demilune, 0, cosmos, 0, 10240, 0, 3660214) -- csid, cruor, demiluneAbyssite, 0, cosmosAbyssite, 0, 0, 0, 0
--  end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    local cruor = player:getCurrency("cruor")
    local Price = 0
    local ItemID = 0
    local Quantity = 1
--  printf("Aby-Misareaux Cruor_Prospector.cpp onEventFinish CSID: [%i]  OPTION: [%i]\n", csid, option)

    -- Item Exchanges - Page 1
    if option == 65537 then -- Creed Armet
        Price = 5000
        ItemID = 12014
    elseif option == 131073 then -- Bale Burgeonet
        Price = 5000
        ItemID = 12015
    elseif option == 196609 then -- Ferine Cabasset
        Price = 5000
        ItemID = 12016
    elseif option == 262145 then -- Aoidos' Calot
        Price = 5000
        ItemID = 12017
    elseif option == 327681 then -- Sylvan Gapette
        Price = 5000
        ItemID = 12018
    end

    if player:hasItem(ItemID) then
        player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, ItemID)
        ItemID = 0
    end

    if option == 17170433 then -- 1x Forbidden Key
        Price = 500
        ItemID = 2490
    elseif option == 84279297 then -- 5x Forbidden Key
        Price = 2500
        ItemID = 2490
        Quantity = 5
    elseif option == 168165377 then -- 10x Forbidden Key
        Price = 5000
        ItemID = 2490
        Quantity = 10
    elseif option == 503709697 then -- 30x Forbidden Key
        Price = 15000
        ItemID = 2490
        Quantity = 30
    elseif option == 839254017 then -- 50x Forbidden Key
        Price = 25000
        ItemID = 2490
        Quantity = 50
    elseif option == 524289 then -- Shadow Throne
        Price = 2000000
        ItemID = 6410

    -- Temporary Item Exchanges - Page 1
    elseif option == 65538 then -- Lucid Potion I
        if player:addTempItem(5824, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5824)
            player:delCurrency("cruor", 80)
        end
    elseif option == 131074 then -- Lucid Ether I
        if player:addTempItem(5827, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5827)
            player:delCurrency("cruor", 80)
        end
    elseif option == 196610 then -- Catholicon
        if player:addTempItem(4206, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4206)
            player:delCurrency("cruor", 80)
        end
    elseif option == 262146 then -- Dusty Elixer
        if player:addTempItem(5433, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5433)
            player:delCurrency("cruor", 120)
        end
    elseif option == 327682 then -- Clear Salve I
        if player:addTempItem(5837, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5837)
            player:delCurrency("cruor", 120)
        end
    elseif option == 393218 then -- Stalwart's Tonic
        if player:addTempItem(5839, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5839)
            player:delCurrency("cruor", 150)
        end
    elseif option == 458754 then -- Ascetic's Tonic
        if player:addTempItem(5841, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5841)
            player:delCurrency("cruor", 150)
        end
    elseif option == 524290 then -- Champion's Tonic
        if player:addTempItem(5843, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5843)
            player:delCurrency("cruor", 150)
        end
    elseif option == 589826 then -- Lucid Potion II
        if player:addTempItem(5825, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5825)
            player:delCurrency("cruor", 200)
        end
    elseif option == 655362 then -- Lucid Ether II
        if player:addTempItem(5828, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5828)
            player:delCurrency("cruor", 200)
        end

    -- Temporary Item Exchanges - Page 2
    elseif option == 720898 then -- Lucid Elixir I
        if player:addTempItem(5830, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5830)
            player:delCurrency("cruor", 300)
        end
    elseif option == 786434 then -- Flask of Healing Powder
        if player:addTempItem(5322, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5322)
            player:delCurrency("cruor", 300)
        end
    elseif option == 851970 then -- Flask of Mana Powder
        if player:addTempItem(4255, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4255)
            player:delCurrency("cruor", 300)
        end
    elseif option == 917506 then -- Tube of Healing Salve I
        if player:addTempItem(5835, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5835)
            player:delCurrency("cruor", 300)
        end
    elseif option == 983042 then -- Bottle of Vicar's Drink
        if player:addTempItem(5439, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5439)
            player:delCurrency("cruor", 300)
        end
    elseif option == 1048578 then -- Tube of Clear Salve II
        if player:addTempItem(5838, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5838)
            player:delCurrency("cruor", 300)
        end
    elseif option == 1114114 then -- Flask of Primeval Brew
        if player:addTempItem(5853, 1) then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5853)
            if (player:hasKeyItem(1443)) then
                player:delCurrency("cruor", 200000)
            else
                player:delCurrency("cruor", 2000000)
            end
        end

    -- Key Item Exchanges
    elseif option == 65539 then -- Map of Abyssea - Misareaux
        if not player:hasKeyItem(tpz.ki.MAP_OF_ABYSSEA_MISAREAUX) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.MAP_OF_ABYSSEA_MISAREAUX)
            player:addKeyItem(tpz.ki.MAP_OF_ABYSSEA_MISAREAUX)
            player:delCurrency("cruor", 4500)
        else
            -- Should have a generic message (IDs.lua #7391) but gives Mog Tablet message instead
            player:PrintToPlayer(string.format("Cruor Prospector : It appears you already possess that key item."),tpz.msg.channel.NS_SAY)
        end
    elseif option == 131075 then -- Ivory Abyssite of Avarice
        if not player:hasKeyItem(tpz.ki.IVORY_ABYSSITE_OF_AVARICE) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.IVORY_ABYSSITE_OF_AVARICE)
            player:addKeyItem(tpz.ki.IVORY_ABYSSITE_OF_AVARICE)
            player:delCurrency("cruor", 8000)
        else
            -- Should have a generic message (IDs.lua #7391) but gives Mog Tablet message instead
            player:PrintToPlayer(string.format("Cruor Prospector : It appears you already possess that key item."),tpz.msg.channel.NS_SAY)
        end
    elseif option == 196611 then -- Ivory Abyssite of Kismet
        if not player:hasKeyItem(tpz.ki.IVORY_ABYSSITE_OF_KISMET) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.IVORY_ABYSSITE_OF_KISMET)
            player:addKeyItem(tpz.ki.IVORY_ABYSSITE_OF_KISMET)
            player:delCurrency("cruor", 5000)
        else
            -- Should have a generic message (IDs.lua #7391) but gives Mog Tablet message instead
            player:PrintToPlayer(string.format("Cruor Prospector : It appears you already possess that key item."),tpz.msg.channel.NS_SAY)
        end
    elseif option == 262147 then -- Lunar Abyssite
        if not player:hasKeyItem(tpz.ki.LUNAR_ABYSSITE1) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.LUNAR_ABYSSITE1)
            player:addKeyItem(tpz.ki.LUNAR_ABYSSITE1)
            player:delCurrency("cruor", 100000)
        else
            -- Should have a generic message (IDs.lua #7391) but gives Mog Tablet message instead
            player:PrintToPlayer(string.format("Cruor Prospector : It appears you already possess that key item."),tpz.msg.channel.NS_SAY)
        end
    elseif option == 458755 then -- Clear Demilune Abyssite
        if not player:hasKeyItem(tpz.ki.CLEAR_DEMILUNE_ABYSSITE) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.CLEAR_DEMILUNE_ABYSSITE)
            player:addKeyItem(tpz.ki.CLEAR_DEMILUNE_ABYSSITE)
            player:delCurrency("cruor", 300)
        else
            -- Should have a generic message (IDs.lua #7391) but gives Mog Tablet message instead
            player:PrintToPlayer(string.format("Cruor Prospector : It appears you already possess that key item."),tpz.msg.channel.NS_SAY)
        end

    -- Cruor Buffs
    elseif (option == 393220 and cruor >= 50) then -- HP Boost
        player:addStatusEffectEx(tpz.effect.ABYSSEA_HP, tpz.effect.MAX_HP_BOOST, 40 + (tpz.abyssea.getAbyssiteTotal(player, "MERIT") * 10), 0, 0)
        player:setHP(9999)
        player:delCurrency("cruor", 50)
    elseif (option == 458756 and cruor >= 120) then -- MP Boost
        player:addStatusEffectEx(tpz.effect.ABYSSEA_MP, tpz.effect.MAX_MP_BOOST, 20 + (tpz.abyssea.getAbyssiteTotal(player, "MERIT") * 5), 0, 0)
        player:setMP(9999)
        player:delCurrency("cruor", 120)
    elseif (option == 524292 and cruor >= 100) then -- STR-DEX Boost
        player:addStatusEffectEx(tpz.effect.ABYSSEA_STR, tpz.effect.STR_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_DEX, tpz.effect.DEX_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:delCurrency("cruor", 100)
    elseif (option == 589828 and cruor >= 100) then -- VIT-AGI Boost
        player:addStatusEffectEx(tpz.effect.ABYSSEA_VIT, tpz.effect.VIT_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_AGI, tpz.effect.AGI_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:delCurrency("cruor", 100)
    elseif (option == 655364 and cruor >= 100) then -- INT-MND-CHR Boost
        player:addStatusEffectEx(tpz.effect.ABYSSEA_INT, tpz.effect.INT_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_MND, tpz.effect.MND_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_CHR, tpz.effect.CHR_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:delCurrency("cruor", 100)
    elseif (option == 720900 and cruor >= 470) then -- All enhancements
        player:addStatusEffectEx(tpz.effect.ABYSSEA_HP, tpz.effect.MAX_HP_BOOST, 40 + (tpz.abyssea.getAbyssiteTotal(player, "MERIT") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_MP, tpz.effect.MAX_MP_BOOST, 20 + (tpz.abyssea.getAbyssiteTotal(player, "MERIT") * 5), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_STR, tpz.effect.STR_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_DEX, tpz.effect.DEX_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_VIT, tpz.effect.VIT_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_AGI, tpz.effect.AGI_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_INT, tpz.effect.INT_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_MND, tpz.effect.MND_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:addStatusEffectEx(tpz.effect.ABYSSEA_CHR, tpz.effect.CHR_BOOST_II, 20 + (tpz.abyssea.getAbyssiteTotal(player, "FURTHERANCE") * 10), 0, 0)
        player:setHP(9999)
        player:setMP(9999)
        player:delCurrency("cruor", 470)
    end

    if ItemID ~= 0 then
        if player:getFreeSlotsCount() >= 1 then
            player:messageSpecial(ID.text.ITEM_OBTAINED, ItemID)
            player:addItem(ItemID, Quantity)
            player:delCurrency("cruor", Price)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, ItemID)
        end
    end
end
