-----------------------------------------
-- Spell: Adloquium
-- Gradually increases target's TP.
--
-- Adds 10 TP/tick Regain
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
	local power = 1
	local duration = calculateDuration(180, caster, target, spell)
	
	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end
	
	if target:addStatusEffect(tpz.effect.REGAIN, power, 0, duration, 0, 0, 0) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.REGAIN
end