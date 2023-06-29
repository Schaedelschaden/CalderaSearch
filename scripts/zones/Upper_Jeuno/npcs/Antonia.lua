-----------------------------------
-- Area: Upper Jeuno
--  NPC: Antonia
-- Standard Merchant NPC
-- !pos -34.244 -0.72 75.975 244
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        21393, 1000000,  -- Arasy Sachet
        21504, 1000000,  -- Arasy Sainti
        21554, 1000000,  -- Arasy Knife
        21604, 1000000,  -- Arasy Sword
        21654, 1000000,  -- Arasy Claymore
        21704, 1000000,  -- Arasy Tabar
        21762, 1000000,  -- Arasy Axe
        21812, 1000000,  -- Arasy Scythe
        21865, 1000000,  -- Arasy Lance
        22015, 1000000,  -- Arasy Rod
        22074, 1000000,  -- Arasy Staff
        22122, 1000000,  -- Arasy Bow
        22135, 1000000,  -- Arasy Gun
        21392, 1000000,  -- Animator Z
        21960, 1000000,  -- Ashijiro no Tachi
        21909, 1000000,  -- Yoshikiri
        26722, 1500000,  -- Gefechtschaller
        26881, 1500000,  -- Gefechtbrust
        27224, 1500000,  -- Gefechtdeichlings
        27396, 1500000,  -- Gefechtschuhs
        27987, 1500000,  -- Gefechthentzes
        26726, 1500000,  -- Revealer's Crown
        26885, 1500000,  -- Revealer's Tunic
        27991, 1500000,  -- Revealer's Mitts
        27228, 1500000,  -- Revealer's Pants
        27400, 1500000,  -- Revealer's Pumps
        26724, 1500000,  -- Sombra Tiara
        26883, 1500000,  -- Sombra Harness
        27989, 1500000,  -- Sombra Mittens
        27226, 1500000,  -- Sombra Tights
        27398, 1500000,  -- Sombra Leggings
    }

    player:showText(npc, ID.text.ANTONIA_SHOP_DIALOG)
	tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end