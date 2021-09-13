-----------------------------------------
-- Spell: Warp II
-- Transports player to their home point. Can cast on allies.
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
	local zoneId = caster:getZoneID()

	if (zoneId == 255 or zoneId == 146 or zoneId == 6 or zoneId == 8 or zoneId == 207 or zoneId == 203 or zoneId == 201 or zoneId == 202 or zoneId == 211 or
		zoneId == 209 or zoneId == 36 or zoneId == 170 or zoneId == 139 or zoneId == 180 or zoneId == 31 or zoneId == 206 or zoneId == 277 or zoneId == 163 or
		zoneId == 32 or zoneId == 179 or zoneId == 10 or zoneId == 165 or zoneId == 156 or zoneId == 144) then
		caster:PrintToPlayer(string.format("That spell cannot be cast in this zone. Please exit the area and try again."),tpz.msg.channel.SYSTEM_3)
		return 1
	else
		return 0
	end
end

function onSpellCast(caster, target, spell)
    if target:getObjType() == tpz.objType.PC then
        target:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.WARP, 0, 3.4)
        spell:setMsg(tpz.msg.basic.MAGIC_TELEPORT)
    end
    return 0
end
