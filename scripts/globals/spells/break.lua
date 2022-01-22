-----------------------------------------
-- Spell: Break
-- Petrifies an enemy, preventing it from acting.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    -- Bloodeye Vileberry cannot cast Break while above 50% HP
	if (caster:isMob() and caster:getHPP() >= 50 and caster:getID() == 16839068 or caster:getID() == 16839071 or caster:getID() == 16839074) then
		return 1
	else
		return 0
	end
end

function onSpellCast(caster, target, spell)
    -- Pull base stats.
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)

    local duration = calculateDuration(30, caster, target, spell)

    local params = {}
    params.diff = dINT
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.PETRIFICATION
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then
        if target:addStatusEffect(params.effect, 1, 0, duration * resist) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end