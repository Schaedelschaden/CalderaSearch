-----------------------------------------
-- Spell: Curaga V
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
    local minCure = 600

    local divisor = 1
    local constant = 570
    local power = getCurePowerOld(caster)
    if (power > 780) then
        divisor = 2.667
        constant = 814--this is too powerful and needs to be fixed when the rest of the curaga 5 numbers are determined
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
		target:restoreHP(final)
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
