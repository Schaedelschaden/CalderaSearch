-----------------------------------------
-- Spell: Magic Fruit
-- Restores HP for the target party member
-- Spell cost: 72 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: CHR+1 HP+5
-- Level: 58
-- Casting Time: 3.5 seconds
-- Recast Time: 6 seconds
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
	-- Info from https://www.bg-wiki.com/bg/Cure_Formula
    local minCure = 250 -- Min Cap
    local divisor = 0.6666 -- Rate
    local constant = 130 -- Const
    local power = getCurePowerOld(caster) -- ((3 * MND) + VIT + (3 * math.floor(healingskill/5)))
	
	if (power > 559) then
        divisor = 1.8 -- 2.8333
        constant = 391.2
    elseif (power > 319) then
        divisor =  1
        constant = 210
    end
	
	local basecure = getBaseCureOld(power,divisor,constant)
    local final = getCureFinal(caster, target, spell, basecure, minCure, true)
    local diff = (target:getMaxHP() - target:getHP())

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == tpz.objType.PC or target:getObjType() == tpz.objType.MOB)) then
        --Applying server mods....
        final = final * CURE_POWER
    end

    if (final > diff) then
        final = diff
    end

    target:addHP(final)
    target:wakeUp()
    caster:updateEnmityFromCure(target,final)
    spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

    return final
end