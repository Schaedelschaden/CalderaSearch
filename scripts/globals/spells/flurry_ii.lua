-----------------------------------------
-- Spell: Flurry II
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local power = 30
    local duration = calculateDuration(150, caster, target, spell)
    duration = calculateDurationForLvl(duration, 96, target:getMainLvl())

	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    if target:addStatusEffect(tpz.effect.FLURRY_II, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.FLURRY_II
end