-----------------------------------------
-- Spell: White Wind
-- Restores HP of all party members within area of effect.
-- Spell cost: 145 MP
-- Monster Type: Dragons
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 5
-- Stat Bonus: HP+5 AGI+1
-- Level: 94
-- Casting Time: 7 seconds
-- Recast Time: 20 seconds
--
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
    local power = math.floor(target:getMaxHP() / 7) * 2
    local diff = (target:getMaxHP() - target:getHP())

	local final = getCureFinal(caster, target, spell, power, power, true)

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