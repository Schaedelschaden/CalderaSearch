-----------------------------------------
-- Spell: Winds of Promyvion
-- Removes one detrimental magic effect for party members within area of effect.
-- Spell cost: 36 MP
-- Monster Type: Empty
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: MND+3 CHR-2
-- Level: 89
-- Casting Time: 3 seconds
-- Recast Time: 20 seconds
-- Combos: Auto Refresh
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

    if (effect == tpz.effect.NONE) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_ERASE)
    end

    return effect
end