-----------------------------------------
-- Spell: Healing Breeze
-- Restores HP for party members within area of effect
-- Spell cost: 55 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+10
-- Level: 16
-- Casting Time: 4.5 seconds
-- Recast Time: 15 seconds
-- Combos: Auto Regen
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
    local minCure = 60
    local divisor = 0.6666
    local constant = -45
    local power = getCurePowerOld(caster)

    if (power > 179) then
        divisor = 6.5
        constant = 144.6666
    elseif (power > 119) then
        divisor =  2
        constant = 65
    end

    local final = getCureFinal(caster, target, spell, getBaseCureOld(power,divisor,constant), minCure, true)
    local diff = (target:getMaxHP() - target:getHP())

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == tpz.objType.PC or target:getObjType() == tpz.objType.MOB)) then
        --Applying server mods....
        final = final * CURE_POWER
    end

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