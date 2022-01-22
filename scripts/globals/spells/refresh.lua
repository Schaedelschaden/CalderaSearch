-----------------------------------------
-- Spell: Refresh
-- Gradually restores target party member's MP
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
	local duration = 150 + target:getMod(tpz.mod.REFRESH_DURATION_RCVD)
    duration = calculateDuration(duration, caster, target, spell)
    duration = calculateDurationForLvl(duration, 41, target:getMainLvl())

	local mp = 3

	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		mp = mp * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    local mp = mp + caster:getMod(tpz.mod.ENHANCES_REFRESH)

    if target:hasStatusEffect(tpz.effect.SUBLIMATION_ACTIVATED) or target:hasStatusEffect(tpz.effect.SUBLIMATION_COMPLETE) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end

    target:delStatusEffect(tpz.effect.REFRESH)
    target:addStatusEffect(tpz.effect.REFRESH, mp, 0, duration)

    return tpz.effect.REFRESH
end