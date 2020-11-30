-----------------------------------------
-- Spell: Erase
--
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local effect = target:eraseStatusEffect()
	local bonusEffect
	
	if (caster:getMod(tpz.mod.ENH_ERASE) > 0) then
		bonusEffect = target:eraseStatusEffect()
	end

    if (effect == tpz.effect.NONE) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        spell:setMsg(tpz.msg.basic.MAGIC_ERASE)
    end

    return effect
end