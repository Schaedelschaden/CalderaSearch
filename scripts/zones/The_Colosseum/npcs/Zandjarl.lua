-----------------------------------
-- Area: The Colosseum
--  NPC: Zandjarl
-- Type: Pankration NPC
-- !pos -599 0 45 71
-----------------------------------
local ID = require("scripts/zones/The_Colosseum/IDs")
-----------------------------------
function onSpawn(npc)
    npc:renameEntity("Battle Square")
end


function onTrade(player, npc, trade)
    npc:renameEntity("Battle Square")
    -- local RESULT = nil
    -- local COUNT = trade:getItemCount()
    -- local TOTAL = player:getCurrency("jetton")
    -- local MAX = 100000000

    -- if (trade:hasItemQty(2184, COUNT)) then
        -- RESULT = 2*COUNT
    -- elseif (trade:hasItemQty(2185, COUNT)) then
        -- RESULT = 10*COUNT
    -- elseif (trade:hasItemQty(2186, COUNT)) then
        -- RESULT = 30*COUNT
    -- elseif (trade:hasItemQty(2187, COUNT)) then
        -- RESULT = 200*COUNT
    -- end

    -- if (RESULT ~= nil) then
        -- if ((RESULT + TOTAL) > MAX) then
            -- -- player:startEvent(47); ..it no work..
            -- npc:showText(npc, ID.text.EXCEED_THE_LIMIT_OF_JETTONS)
        -- else
            -- -- packet cap says its a "showText" thing..
            -- npc:showText(npc, ID.text.I_CAN_GIVE_YOU, RESULT)
            -- npc:showText(npc, ID.text.THANKS_FOR_STOPPING_BY)
            -- player:addCurrency("jetton", RESULT)
            -- player:tradeComplete()
        -- end
    -- end
    
    
    local party = player:getAlliance()
    local BP    = player:getLocalVar("BattlePoints")
    local topBP = 0
   
    if (not GetMobByID(17068033):isSpawned() and trade:getGil() == 1) then
        for _, v in ipairs(party) do
            if v:getLocalVar("BattlePoints") > topBP then
                topBP = v:getLocalVar("BattlePoints")
            end
            v:addStatusEffect(tpz.effect.BESIEGED, 71, 0, 0)
            if v:getObjType() == tpz.objType.PC then
                v:addStatusEffect(tpz.effect.RERAISE, 3, 0, 3600)
                v:getStatusEffect(tpz.effect.RERAISE):setFlag(tpz.effectFlag.ON_ZONE)
            end
        end
        
        SpawnMob(17068033)
        
        if topBP == 0 then
            GetMobByID(17068033):setModelId(403)
            GetMobByID(17068033):renameEntity("Kirin")
        elseif topBP == 1 then
            GetMobByID(17068033):setModelId(789)
            GetMobByID(17068033):renameEntity("Shadow Lord")
        elseif topBP == 2 then
            GetMobByID(17068033):setModelId(1378)
            GetMobByID(17068033):renameEntity("Absolute Virtue")
        elseif topBP == 3 then
            GetMobByID(17068033):setModelId(16)
            GetMobByID(17068033):renameEntity("Carbuncle")
        elseif topBP == 4 then
            GetMobByID(17068033):setModelId(25)
            GetMobByID(17068033):renameEntity("Diabolos")
        elseif topBP == 5 then
            GetMobByID(17068033):setModelId(284)
            GetMobByID(17068033):renameEntity("Serket")
        elseif topBP == 6 then
            GetMobByID(17068033):setModelId(2013)
            GetMobByID(17068033):renameEntity("Warbler")
        elseif topBP == 7 then
            GetMobByID(17068033):setModelId(1748)
            GetMobByID(17068033):renameEntity("Tunga")
        elseif topBP == 8 then
            GetMobByID(17068033):setModelId(2029)
            GetMobByID(17068033):renameEntity("Glavoid")
        elseif topBP == 9 then
            GetMobByID(17068033):setModelId(1778)
            GetMobByID(17068033):renameEntity("Wulgaru")
        elseif topBP == 10 then
            GetMobByID(17068033):setModelId(398)
            GetMobByID(17068033):renameEntity("Ungur")
        elseif topBP == 11 then
            GetMobByID(17068033):setModelId(318)
            GetMobByID(17068033):renameEntity("Guivre")
        elseif topBP == 12 then
            GetMobByID(17068033):setModelId(398)
            GetMobByID(17068033):renameEntity("Bune")
        elseif topBP == 13 then
            GetMobByID(17068033):setModelId(420)
            GetMobByID(17068033):renameEntity("Biast")
        elseif topBP == 14 then
            GetMobByID(17068033):setModelId(317)
            GetMobByID(17068033):renameEntity("Yowie")
        elseif topBP == 15 then
            GetMobByID(17068033):setModelId(317)
            GetMobByID(17068033):renameEntity("Lindwurm")
        elseif topBP == 16 then
            GetMobByID(17068033):setModelId(2015)
            GetMobByID(17068033):renameEntity("Kinepikwa")
        elseif topBP == 17 then
            GetMobByID(17068033):setModelId(1349)
            GetMobByID(17068033):renameEntity("Intulo")
        elseif topBP == 18 then
            GetMobByID(17068033):setModelId(328)
            GetMobByID(17068033):renameEntity("Tarasque")
        elseif topBP == 19 then
            GetMobByID(17068033):setModelId(2500)
            GetMobByID(17068033):renameEntity("Colkhab")
        elseif topBP == 20 then
            GetMobByID(17068033):setModelId(2505)
            GetMobByID(17068033):renameEntity("Tchakka")
        elseif topBP == 21 then
            GetMobByID(17068033):setModelId(2515)
            GetMobByID(17068033):renameEntity("Achuka")
        elseif topBP == 22 then
            GetMobByID(17068033):setModelId(2510)
            GetMobByID(17068033):renameEntity("Yumcax")
        elseif topBP == 23 then
            GetMobByID(17068033):setModelId(2580)
            GetMobByID(17068033):renameEntity("Hurkan")
        elseif topBP == 24 then
            GetMobByID(17068033):setModelId(2585)
            GetMobByID(17068033):renameEntity("Kumhau")
        elseif topBP == 25 then
            GetMobByID(17068033):setModelId(404)
            GetMobByID(17068033):renameEntity("King Behemoth")
        elseif topBP == 26 then
            GetMobByID(17068033):setModelId(783)
            GetMobByID(17068033):renameEntity("Nidhogg")
        elseif topBP == 27 then
            GetMobByID(17068033):setModelId(401)
            GetMobByID(17068033):renameEntity("Aspidochelone")
        elseif topBP == 28 then
            GetMobByID(17068033):setModelId(608)
            GetMobByID(17068033):renameEntity("Tiamat")
        elseif topBP == 29 then
            GetMobByID(17068033):setModelId(611)
            GetMobByID(17068033):renameEntity("Vrtra")
        elseif topBP == 30 then
            GetMobByID(17068033):setModelId(609)
            GetMobByID(17068033):renameEntity("Jormungand")
        elseif topBP == 31 then
            GetMobByID(17068033):setModelId(1793)
            GetMobByID(17068033):renameEntity("Cerberus")
        elseif topBP == 32 then
            GetMobByID(17068033):setModelId(1805)
            GetMobByID(17068033):renameEntity("Khimaira")
        elseif topBP == 33 then
            GetMobByID(17068033):setModelId(2222)
            GetMobByID(17068033):renameEntity("Zirnitra")
        elseif topBP == 34 then
            GetMobByID(17068033):setModelId(1011)
            GetMobByID(17068033):renameEntity("Bakgodek")
        elseif topBP == 35 then
            GetMobByID(17068033):setModelId(782)
            GetMobByID(17068033):renameEntity("Za'Dha")
        elseif topBP == 36 then
            GetMobByID(17068033):setModelId(781)
            GetMobByID(17068033):renameEntity("Tzee Xicu")
        elseif topBP == 37 then
            GetMobByID(17068033):setModelId(1865)
            GetMobByID(17068033):renameEntity("Medusa")
        elseif topBP == 38 then
            GetMobByID(17068033):setModelId(1863)
            GetMobByID(17068033):renameEntity("Gulool Ja Ja")
        elseif topBP == 39 then
            GetMobByID(17068033):setModelId(1867)
            GetMobByID(17068033):renameEntity("Gurfurlur")
        elseif topBP == 40 then
            GetMobByID(17068033):setModelId(2104)
            GetMobByID(17068033):renameEntity("Kaggen")
        elseif topBP == 41 then
            GetMobByID(17068033):setModelId(2081)
            GetMobByID(17068033):renameEntity("Vee Ladu")
        elseif topBP == 42 then
            GetMobByID(17068033):setModelId(2033)
            GetMobByID(17068033):renameEntity("Rugaroo")
        elseif topBP == 43 then
            GetMobByID(17068033):setModelId(1359)
            GetMobByID(17068033):renameEntity("Tikbalang")
        elseif topBP == 44 then
            GetMobByID(17068033):setModelId(1307)
            GetMobByID(17068033):renameEntity("Bahamut")
        elseif topBP == 45 then
            GetMobByID(17068033):setModelId(2367)
            GetMobByID(17068033):renameEntity("Shinryu")
        elseif topBP == 46 then
            GetMobByID(17068033):setModelId(1845)
            GetMobByID(17068033):renameEntity("Bart's Ideas")
        elseif topBP == 47 then
            GetMobByID(17068033):setModelId(26)
            GetMobByID(17068033):renameEntity("TK's Hammer")
        elseif topBP == 48 then
            GetMobByID(17068033):setModelId(772)
            GetMobByID(17068033):renameEntity("Nar's Purpose")
        elseif topBP == 49 then
            GetMobByID(17068033):setModelId(2942)
            GetMobByID(17068033):renameEntity("Caldera")
        end        
    end
    
    GetMobByID(17068033):hideHP(true)
    GetMobByID(17068033):setMobLevel(119 + topBP)

end

function onTrigger(player, npc)
    npc:renameEntity("Battle Square")
    
    player:PrintToPlayer(string.format("Battle Square: Your Current BP is %s", player:getLocalVar("BattlePoints")),tpz.msg.channel.NS_SAY)    
    player:timer(1000, function(playerArg)
        playerArg:PrintToPlayer(string.format("Battle Square: Trade me 1 gil to start fighting."),tpz.msg.channel.NS_SAY)
    end)
    
    local BP  = player:getLocalVar("BattlePoints")
    if BP > 0 and BP < 11 then
        tpz.shop.general(player, BP1)
    elseif BP > 10 and BP < 21 then
        tpz.shop.general(player, BP2)
    elseif BP > 20 and BP < 31 then
        tpz.shop.general(player, BP3)
    elseif BP > 30 and BP < 41 then
        tpz.shop.general(player, BP4)
    elseif BP > 40 and BP < 51 then
        tpz.shop.general(player, BP5)
    elseif BP > 50 then
        tpz.shop.general(player, BP6)
    else
        player:timer(3000, function(playerArg)
            playerArg:PrintToPlayer(string.format("Battle Square: You need at least one kill to get BP."),tpz.msg.channel.NS_SAY)
        end)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    -- if (csid == 1900) then -- onTrigger
        -- local shop =
        -- {
            -- [1] = {itemID = 18721, price = 2, QTY = 1}, -- SoulTrapper
            -- [257] = {itemID = 18724, price = 500, QTY = 1}, -- Soultrapper 2000
            -- [513] = {itemID = 16134, price = 5000, QTY = 1}, -- Zoraal Ja's Helm
            -- [65537] = {itemID = 18722, price = 2, QTY = 12}, -- Blank Soul Plates
            -- [65793] = {itemID = 18725, price = 500, QTY = 12}, -- High Speed Soul plates
            -- [66049] = {itemID = 16135, price = 5000, QTY = 1}, -- Dartorgor's Coif
            -- [131585] = {itemID = 16136, price = 5000, QTY = 1}, -- Lamia No.3's Garland
            -- [197121] = {itemID = 16137, price = 5000, QTY = 1}  -- Cacaroon's Hood
        -- }
        -- local result = shop[option]
        -- if (result ~= nil) then
            -- if (result.itemID ~= nil) then
                -- if (player:addItem(result.itemID, result.QTY)) then
                    -- player:delCurrency("jetton", result.price)
                    -- player:messageSpecial(ID.text.ITEM_OBTAINED, result.itemID)
                -- else
                    -- player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, result.itemID)
                -- end
            -- end
        -- end
    -- end
end