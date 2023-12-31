-----------------------------------------
-- Spell: Shellra
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local power = 27 -- power/256 handled below before passing final DMGMAGIC value
    local tier = 1
    local spelllevel = 18
    local duration = calculateDuration(1800, caster, target, spell, false)
    duration = calculateDurationForLvl(duration, spelllevel, target:getMainLvl())

    local buff = 0
    if target:getMod(tpz.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        buff = 1 -- Adds the tier as a bonus to power before calculation
    end
    local power = utils.roundup((power + (buff * tier)) / 2.56) -- takes the result and converts it back to a usable DMGMAGIC value

	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    local typeEffect = tpz.effect.SHELL
        if target:addStatusEffect(typeEffect, power, 0, duration, 0, 0, tier) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end
    return typeEffect
end