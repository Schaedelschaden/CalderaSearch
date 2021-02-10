-----------------------------------
-- Area:  Castle Oztroja
-- NPC:   _47i (Far Right Handle)
-- Notes: Opens door _471 (2nd Floor Brass Door)
-- !pos -182 -15 -19 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
local CASTLE_OZTROJA = require("scripts/zones/Castle_Oztroja/globals")
require("scripts/globals/status")

function onTrigger(player, npc)
--	printf("_47i.lua onTrigger CASTLE OZTROJA FL2 BRASS DOOR LEVER 4\n")
    -- CASTLE_OZTROJA.handleOnTrigger(npc)
	if npc:getAnimation() == tpz.anim.CLOSE_DOOR then
        npc:setAnimation(tpz.anim.OPEN_DOOR)
    else
        npc:setAnimation(tpz.anim.CLOSE_DOOR)
    end
	GetNPCByID(ID.npc.HANDLE_DOOR_FLOOR_2):openDoor(6)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
