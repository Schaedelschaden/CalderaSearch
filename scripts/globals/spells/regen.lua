-----------------------------------------
-- Spell: Regen
-- Gradually restores target's HP.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local hp = 5
	
	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		hp = hp * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end
	
	hp = math.ceil(hp * (1 + 0.011 * caster:getMod(tpz.mod.REGEN_MULTIPLIER))) -- spell base times gear multipliers
    hp = hp + caster:getMerit(tpz.merit.REGEN_EFFECT) + caster:getMod(tpz.mod.REGEN_BASE) -- bonus hp from merits
    hp = hp + caster:getMod(tpz.mod.LIGHT_ARTS_REGEN) -- bonus hp from light arts

    local duration = calculateDuration(75 + caster:getMod(tpz.mod.REGEN_DURATION), caster, target, spell)
    duration = calculateDurationForLvl(duration, 21, target:getMainLvl())

    if target:addStatusEffect(tpz.effect.REGEN, hp, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return tpz.effect.REGEN
end