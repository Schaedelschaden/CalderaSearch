-----------------------------------------
--
-- Spell: Temper
--
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = tpz.effect.MULTI_STRIKES
    local enhskill = caster:getSkillLevel(tpz.skill.ENHANCING_MAGIC)
    local duration = calculateDuration(180, caster, target, spell)
    duration = calculateDurationForLvl(duration, 95, target:getMainLvl())

    local power = 5
	
    if enhskill >= 360 then
        power = math.floor((enhskill - 300) / 10)
    else
        print("Warning: Unknown enhancing magic skill for Temper.")
    end

	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    if target:addStatusEffect(effect, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end