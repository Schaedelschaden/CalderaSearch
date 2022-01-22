-----------------------------------------
-- Spell: Reprisal
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
	if caster:getShieldSize() == 0 then
        return tpz.msg.basic.REQUIRES_SHIELD, 0
	else
		return 0
	end
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(60, caster, target, spell)
    local maxReflectedDamage = target:getMaxHP() * 2
    local reflectedPercent = 33
    local typeEffect = tpz.effect.REPRISAL

    if target:addStatusEffect(typeEffect, reflectedPercent, 0, duration, 0, maxReflectedDamage) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end