-----------------------------------------
-- Spell: Endark
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end


function onSpellCast(caster, target, spell)
    local effect       = tpz.effect.ENDARK
    local magicskill   = target:getSkillLevel(tpz.skill.DARK_MAGIC)
    local potency      = ((magicskill / 8) + 12.5) + caster:getMod(tpz.mod.ENDARK_DMG_BONUS)
	local baseDuration = 180 + caster:getMod(tpz.mod.ENSPELL_DURATION_BONUS)
	local duration     = calculateDuration(baseDuration, caster, target, spell)

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end
