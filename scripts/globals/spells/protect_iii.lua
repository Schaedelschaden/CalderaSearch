-----------------------------------------
-- Spell: Protect III
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local power = 90
    local tier = 3
    local spelllevel = 47
    local duration = calculateDuration(1800, spell:getSkillType(), spell:getSpellGroup(), caster, target, false)
    duration = calculateDurationForLvl(duration, spelllevel, target:getMainLvl())
    local buff = 0
    if target:getMod(tpz.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        buff = 2 -- 2x Tier from MOD
    end

    local power = power + (buff * tier)
	
	if (caster:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 2
		caster:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    local typeEffect = tpz.effect.PROTECT
        if target:addStatusEffect(typeEffect, power, 0, duration, 0, 0, tier) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return typeEffect
end