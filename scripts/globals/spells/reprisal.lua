-----------------------------------------
-- Spell: Reprisal
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
	if
        caster:getShieldSize() == 0 and
        not caster:getObjType() == tpz.objType.TRUST
    then
        return tpz.msg.basic.REQUIRES_SHIELD, 0
	else
		return 0
	end
end

function onSpellCast(caster, target, spell)
    local duration = 60
	local useComposure = false
	duration = calculateDuration(duration, caster, target, spell, useComposure)
    local maxReflectedDamage = 9999 -- target:getMaxHP() * 2 -- May 2021 version update made Reprisal permanent for its entire duration
    local reflectedPercent = 33
    local typeEffect = tpz.effect.REPRISAL
	
	-- Priwen (Increases spike damage by 50%)
	if (caster:getEquipID(tpz.slot.SUB) == 28648) then
		reflectedPercent = reflectedPercent * (150 / 100)
	end

    if target:addStatusEffect(typeEffect, reflectedPercent, 0, duration, 0, maxReflectedDamage) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end