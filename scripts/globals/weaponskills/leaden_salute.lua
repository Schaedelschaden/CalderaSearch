-----------------------------------
-- Leaden Salute
-- Sword weapon skill
-- Weaponskill Category: Magical
-- Skill Level: N/A
-- Delivers a Twofold attack. Damage varies with TP. Death Penalty: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Corsair) quest.
-- Aligned with the Shadow Gorget, Soil Gorget & Light Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Light Belt.
-- Element: Darkness
-- Modifiers: AGI:30%
-- 100%TP    200%TP    300%TP
-- 4.00      4.25      4.75
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100  = 4.00 params.ftp200  = 4.25 params.ftp300  = 4.75
    params.str_wsc = 0.00 params.dex_wsc = 0.00 params.vit_wsc = 0.00 params.agi_wsc = 0.30
    params.int_wsc = 0.00 params.mnd_wsc = 0.00 params.chr_wsc = 0.00
    params.dSTAT   = (player:getStat(tpz.mod.AGI) - target:getStat(tpz.mod.INT)) * 2
    params.ele     = tpz.magic.ele.DARK
    params.skill   = tpz.skill.MARKSMANSHIP
    params.includemab = true

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp200  = 6.70 params.ftp300 = 10.00
        params.agi_wsc = 1.00
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Apply Aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.RANGED, tpz.aftermath.type.MYTHIC)
    end

    return tpHits, extraHits, criticalHit, damage
end
