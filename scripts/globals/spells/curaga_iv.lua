-----------------------------------------
-- Spell: Curaga IV
-- Restores HP of all party members within area of effect.
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
    local minCure = 450

    local divisor = 0.6666
    local constant = 330
    local power = getCurePowerOld(caster)
    if (power > 560) then
        divisor = 2.8333
        constant = 591.2
    elseif (power > 320) then
        divisor =  1
        constant = 410
    end
	
	local final

	if isValidHealTarget(caster, target) then -- e.g. is a PC and not a monster (?)
		final = getCureFinal(caster, target, spell, getBaseCureOld(power, divisor, constant), minCure, false)

		--Applying server mods....
		final = final * CURE_POWER

		local diff = (target:getMaxHP() - target:getHP())
		if (final > diff) then
			final = diff
		end
		target:addHP(final)

		target:wakeUp()
		caster:updateEnmityFromCure(target, final)

        -- updateNotorietyCure(caster, target)
	end

    spell:setMsg(tpz.msg.basic.AOE_HP_RECOVERY)

    local mpBonusPercent = (final*caster:getMod(tpz.mod.CURE2MP_PERCENT))/100
    if (mpBonusPercent > 0) then
        caster:addMP(mpBonusPercent)
    end

    return final
end
