-----------------------------------------
-- Spell: Animus Augeo
-- Facilitates enmity gain for target party member.
--
-- Adds Enmity +20.
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
	local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)
	
	if target:addStatusEffect(tpz.effect.ENMITY_BOOST, 20, 0, duration, 0, 0, 0) then
		target:delStatusEffect(tpz.effect.ENMITY_DOWN)
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.ENMITY_BOOST
end