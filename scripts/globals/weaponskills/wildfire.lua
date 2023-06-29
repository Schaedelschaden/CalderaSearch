-----------------------------------
-- Wildfire
-- Marksmanship weapon skill
-- Weaponskill Category: Magical
-- Skill Level: N/A
-- Description: Deals fire elemental damage. Enmity generation varies with TP. Armageddon: Aftermath.
-- Acquired permanently by completing the appropriate Walk of Echoes Weapon Skill Trials.
-- Can also be used by equipping Armageddon (85)/(90)/(95)/(99) or Bedlam +1/+2/+3.
-- Aligned with the Soil Gorget & Shadow Gorget.
-- Aligned with the Soil Belt & Shadow Belt.
-- Element: Fire
-- Skillchain Properties: Darkness/Gravitation
-- Modifiers: AGI:60%
-- Damage Multipliers by TP:
--  100%TP    200%TP    300%TP
--  5.5      5.5     5.5
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100  = 5.50 params.ftp200  = 5.50 params.ftp300  = 5.50
    params.str_wsc = 0.00 params.dex_wsc = 0.00 params.vit_wsc = 0.00 params.agi_wsc = 0.60
    params.int_wsc = 0.00 params.mnd_wsc = 0.00 params.chr_wsc = 0.00
    params.dSTAT   = (player:getStat(tpz.mod.AGI) - target:getStat(tpz.mod.INT)) * 2
    params.ele     = tpz.magic.ele.FIRE
    params.skill   = tpz.skill.MARKSMANSHIP
    params.includemab = true
    -- params.adjustMDEFCalc = 0.06

    -- TODO: needs to give enmity down at varying tp percent's that is treated separately than the gear cap of -50% enmity http://www.bg-wiki.com/bg/Wildfire

    local damage, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Apply aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.RANGED, tpz.aftermath.type.EMPYREAN)
    end

    return tpHits, extraHits, criticalHit, damage
end
