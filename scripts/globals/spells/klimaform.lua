-----------------------------------------
-- Spell: Klimaform
-- Increases magic accuracy for spells of the same element as current weather
-----------------------------------------

require("scripts/globals/status")

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local mJob  = caster:getMainJob()
    local mLvl  = caster:getMainLvl()
    local power = 15 -- Base MACC bonus

    -- Caldera custom adjustment
    if mJob == tpz.job.SCH then
        if caster:isPC() then
            mLvl = mLvl + caster:getItemLevel()
        end

        power = power + (mLvl / 2.36)
    end

    target:addStatusEffect(tpz.effect.KLIMAFORM, power, 0, 300)

    return tpz.effect.KLIMAFORM
end
