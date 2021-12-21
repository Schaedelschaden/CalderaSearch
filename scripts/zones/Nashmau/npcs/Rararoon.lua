-----------------------------------
-- Area: Nashmau
--  NPC: Rararoon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        2347,	300000,	-- Reactive Shield
		9131,	500000,	-- Tension Spring IV
		9132,	300000,	-- Heat Capacitor II
		9880,	500000,	-- Tension Spring V
		9885,	300000,	-- Magniplug
		9886,	750000,	-- Magniplug II
		2348,	100000,	-- Tranquilizer
		9035,	250000,	-- Tranquilizer II
		9133,	750000,	-- Loudspeaker IV
		9134,	500000,	-- Tranquilizer III
		9135,	750000,	-- Amplifier II
		9881,	1000000,	-- Loudspeaker V
		9882,	750000,	-- Tranquilizer IV
		9887,	300000,	-- Arcanoclutch
		9888,	500000,	-- Arcanoclutch II
		2349,	500000,	-- Turbo Charger
		2415,	750000,	-- Turbo Charger II
		9136,	500000,	-- Accelerator IV
		9137,	500000,	-- Scope III
		9884,	750000,	-- Scope IV
		9889,	500000,	-- Truesights
		2350,	500000,	-- Schurzen
		9038,	500000,	-- Shock Absorber II
		9138,	500000,	-- Armor Plate IV
		9139,	750000,	-- Shock Absorber III
		2351,	200000,	-- Dynamo
		2413,	300000,	-- Coiler
		9041,	600000,	-- Coiler II
		9069,	350000,	-- Dynamo II
		9140,	300000,	-- Stabilizer IV
		9141,	500000,	-- Dynamo III
		9883,	500000,	-- Stabilizer V
		9233,	750000,	-- Mana Channeler II
		2352,	300000,	-- Condenser
		2414,	500000,	-- Steam Jacket
		9071,	500000,	-- Resister II
		9142,	500000,	-- Mana Jammer IV
		2353,	500000,	-- Optic Fiber
		9234,	1000000,	-- Optic Fiber II
		2416,	1000000,	-- Vivi-Valve II
		9044,	500000,	-- Auto-Repair Kit III
		9143,	750000,	-- Auto-Repair Kit IV
		9073,	500000,	-- Arcanic Cell II
		9280,	500000,	-- Damage Gauge II
		2354,	750000,	-- Economizer
		9045,	300000,	-- Mana Tank III
		9074,	500000,	-- Regulator
		9144,	500000,	-- Mana Tank IV
    }

    -- player:showText(npc, ID.text.YOYOROON_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end