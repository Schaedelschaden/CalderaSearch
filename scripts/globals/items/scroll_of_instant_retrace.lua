-----------------------------------------
-- ID: 5428
-- Scroll of Instant Retrace
-- Transports the user to their Allied Nation.
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
	local zoneId = target:getZoneID()

	if (zoneId == 255 or zoneId == 146 or zoneId == 6 or zoneId == 8 or zoneId == 207 or zoneId == 203 or zoneId == 201 or zoneId == 202 or zoneId == 211 or
		zoneId == 209 or zoneId == 36 or zoneId == 170 or zoneId == 139 or zoneId == 180 or zoneId == 31 or zoneId == 206 or zoneId == 277 or zoneId == 163 or
		zoneId == 32 or zoneId == 179 or zoneId == 10 or zoneId == 165 or zoneId == 156 or zoneId == 144) then
		target:PrintToPlayer(string.format("That item cannot be used in this zone. Please exit the area and try again."),tpz.msg.channel.SYSTEM_3)
		return 1
	elseif not (target:getCampaignAllegiance() > 0) then
		return 56
	else
        return 0
	end
end

function onItemUse(target)
    if (target:getCampaignAllegiance() > 0) then
        target:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.RETRACE, 0, 2)
    end
end
