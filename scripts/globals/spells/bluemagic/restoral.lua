-----------------------------------------
-- Spell: Restoral
-- Restores the caster’s HP.
-- Spell cost: 127 MP
-- Monster Type: Archaic Machines
-- Spell Type: Magical (Light)
-- Blue Magic Points: 7
-- Stat Bonus: HP+15 MP+15
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
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
    local minCure = 640
    local divisor = 0.6666
    local constant = 450
    local power = getCurePowerOld(caster)
	local diff = (target:getMaxHP() - target:getHP())
	
	caster:PrintToPlayer(string.format("Restoral POWER: [%i]", power))
	
	if (power > 559) then
        divisor = 1.3
        constant = 650
    elseif (power > 319) then
        divisor =  1
        constant = 560
    end
	
	local basecure = getBaseCureOld(power, divisor, constant)
    local final = getCureFinal(caster, spell, basecure, minCure, true)

    final = final + (final * (target:getMod(tpz.mod.CURE_POTENCY_RCVD)/100))

    --Applying server mods....
    final = final * CURE_POWER

    if (final > diff) then
        final = diff
    end

    target:addHP(final)
    target:wakeUp()
    caster:updateEnmityFromCure(target, final)
    spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

    return final
end