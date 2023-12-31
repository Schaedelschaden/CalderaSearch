-----------------------------------
-- Area: Dragons Aery
--  NPC: qm0 (???)
-- Spawns Fafnir or Nidhogg
-- !pos 82 6.9 42 154
-- ID: 17408033
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
    -- if LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1 then
        -- npc:setStatus(tpz.status.DISAPPEAR)
    -- end
	npc:setPos(82, 6.8, 42, 0, 178)
end

function onTrade(player, npc, trade)
    if not GetMobByID(ID.mob.FAFNIR):isSpawned() and not GetMobByID(ID.mob.NIDHOGG):isSpawned() then
        if LandKingSystem_NQ ~= 0 and npcUtil.tradeHas(trade, 3339) and npcUtil.popFromQM(player, npc, ID.mob.FAFNIR) then
            player:confirmTrade()
        elseif LandKingSystem_HQ ~= 0 and npcUtil.tradeHas(trade, 3340) and npcUtil.popFromQM(player, npc, ID.mob.NIDHOGG) then
            player:confirmTrade()
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.IRREPRESSIBLE_MIGHT)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end