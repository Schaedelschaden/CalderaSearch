-----------------------------------------
-- Spell: Blink
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(300, spell:getSkillType(), spell:getSpellGroup(), caster, target)
	local power = BLINK_SHADOWS
	
	if (caster:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 2
		caster:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    if target:addStatusEffect(tpz.effect.BLINK, BLINK_SHADOWS, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.BLINK
end