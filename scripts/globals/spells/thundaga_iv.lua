-----------------------------------------
-- Spell: Thundaga IV
-- Deals lightning damage to enemies within area of effect.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = true
    spellParams.resistBonus = 1.0
    spellParams.V = 797
    spellParams.V0 = 800
    spellParams.V50 = 980
    spellParams.V100 = 1155
    spellParams.V200 = 1430
    spellParams.M = 1.75
    spellParams.M0 = 3.8
    spellParams.M50 = 3.3
    spellParams.M100 = 2.35
    spellParams.M200 = 1.9
    spellParams.I = 819

    return doElementalNuke(caster, spell, target, spellParams)
end
