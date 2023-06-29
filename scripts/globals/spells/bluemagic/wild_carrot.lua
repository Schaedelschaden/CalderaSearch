-----------------------------------------
-- Spell: Wild Carrot
-- Restores HP for the target party member
-- Spell cost: 37 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: HP+5
-- Level: 30
-- Casting Time: 2.5 seconds
-- Recast Time: 6 seconds
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
    local minCure = 120
    local divisor = 1
    local constant = 60
    local power = getCurePowerOld(caster)

    if (power > 179) then
        divisor = 15.6666
        constant = 170.43
    elseif (power > 149) then
        divisor =  2
        constant = 105
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

	-- Curse II prevents restoring HP
	if not (caster:hasStatusEffect(20)) then
		target:addHP(final)
		target:wakeUp()
		caster:updateEnmityFromCure(target,final)
	end
	
    spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

    return final
end