-----------------------------------------
-- Spell: Protectra IV
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local power = 140
    local tier = 4
    local spelllevel = 63
    local duration = calculateDuration(1800, caster, target, spell, false)
    duration = calculateDurationForLvl(duration, spelllevel, target:getMainLvl())
    local buff = 0
    if target:getMod(tpz.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        buff = 2 -- 2x Tier from MOD
    end

	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    local power = power + (buff * tier)

    local typeEffect = tpz.effect.PROTECT
        if target:addStatusEffect(typeEffect, power, 0, duration, 0, 0, tier) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return typeEffect
end