-----------------------------------
-- Area: Upper Jeuno
--  NPC: Antonia
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        21504, 2000100,    -- Arasy Sainti
        21554, 2000100,    -- Arasy Knife
        21604, 2000100,    -- Arasy Sword
        21654, 2000100,    -- Arasy Claymore
        21704, 2000100,    -- Arasy Tabar
        21762, 2000100,    -- Arasy Axe
        21812, 2000100,    -- Arasy Scythe
        21865, 2000100,    -- Arasy Lance
        21909, 2000100,    -- Yoshikiri
        21960, 2000100,    -- Ashijiro no Tachi
        22015, 2000100,    -- Arasy Rod
        22074, 2000100,    -- Arasy Staff
        22122, 2000100,    -- Arasy Bow
        22135, 2000100,    -- Arasy Gun
        21392, 2000100,    -- Animator Z
        21393, 2000100,    -- Arasy Sachet
    }

    -- player:showText(npc, ID.text.ANTONIA_SHOP_DIALOG)
	-- tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end