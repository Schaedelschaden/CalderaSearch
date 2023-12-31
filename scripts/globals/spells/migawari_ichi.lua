---------------------------------------------------------------
--
-- Spell: Migawari: Ichi
-- Nullifies a Death Blow for the Caster
-- A Death Blow is, in general, Damage >= Max HP
-- Threshold for negation is thought to be reduced
-- by 1% for every 5 Ninjutsu Skill
--
-- Effect Power: Damage Threshold %
-- Effect Sub Power: Damage Reduction % (In this case, 100%)
--
---------------------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
--------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration          = 300
    local effect            = tpz.effect.MIGAWARI
    local ninjutsu          = target:getSkillLevel(tpz.skill.NINJUTSU)
    local negationThreshold = 100 - (math.floor(ninjutsu / 15.5) - caster:getMod(tpz.mod.ENH_MIGAWARI))

    caster:addStatusEffect(effect, negationThreshold, 0, duration, 0, 100)

    return effect
end
