-----------------------------------------
-- Spell: Exuviation
-- Restores HP and removes one detrimental magic effect
-- Spell cost: 40 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 4
-- Stat Bonus: HP+5 MP+5 CHR+1
-- Level: 75
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
--
-- Combos: Resist Sleep
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local minCure = 60
    local effect = target:eraseStatusEffect()
    local divisor = 1
    local constant = 40
    local power = getCurePowerOld(caster)

    if (power > 79) then
        divisor = 57
        constant = 79.125
    elseif (power > 69) then
        divisor =  2
        constant = 55
    end

    local final = getCureFinal(caster, target, spell, getBaseCureOld(power, divisor, constant), minCure, true)

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == tpz.objType.PC or target:getObjType() == tpz.objType.MOB)) then
        --Applying server mods....
        final = final * CURE_POWER
    end

    local diff = (target:getMaxHP() - target:getHP())
    if (final > diff) then
        final = diff
    end

    target:addHP(final)
    target:wakeUp()
    target:eraseStatusEffect()
    caster:updateEnmityFromCure(target,final)
    spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

    return final
end
