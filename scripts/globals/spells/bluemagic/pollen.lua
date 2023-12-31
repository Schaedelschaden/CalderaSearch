-----------------------------------------
-- Spell: Pollen
-- Restores HP
-- Spell cost: 8 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Light)
-- Blue Magic Points: 1
-- Stat Bonus: CHR+1 HP+5
-- Level: 1
-- Casting Time: 2 seconds
-- Recast Time: 5 seconds
-- Combos: Resist Sleep
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local minCure = 14
    local divisor = 1
    local constant = -6
    local power = getCurePowerOld(caster)

    if (power > 33) then
        divisor = 57
        constant = 33.125
    elseif (power > 23) then
        divisor =  2
        constant = 9
    end

    local final = getCureFinal(caster, target, spell, getBaseCureOld(power,divisor,constant), minCure, true)

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == tpz.objType.PC or target:getObjType() == tpz.objType.MOB)) then
        --Applying server mods....
        final = final * CURE_POWER
    end

    local diff = (target:getMaxHP() - target:getHP())
    if (final > diff) then
        final = diff
    end
	
	-- Curse II prevents restoring HP
	if not (caster:hasStatusEffect(20)) then
		target:addHP(final)
	end

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == tpz.objType.PC or target:getObjType() == tpz.objType.MOB)) then
        caster:updateEnmityFromCure(target, final)
    end
    spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

    return final
end