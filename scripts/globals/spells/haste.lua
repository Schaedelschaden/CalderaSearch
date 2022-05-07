-----------------------------------------
-- Spell: Haste
-- Composure increases duration 3x
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(300, caster, target, spell)
    duration = calculateDurationForLvl(duration, 48, target:getMainLvl())

    local power = 1465 -- 150/1024 ~14.65%
	
	if (target:hasStatusEffect(tpz.effect.FLURRY) or target:hasStatusEffect(tpz.effect.FLURRY_II)) then
		target:delStatusEffect(tpz.effect.FLURRY)
		target:delStatusEffect(tpz.effect.FLURRY_II)
	end
	
	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    if not target:addStatusEffect(tpz.effect.HASTE, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.HASTE
end