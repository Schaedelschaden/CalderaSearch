-----------------------------------
-- Ukko's Fury
-- Great Axe Weapon Skill
-- Skill Level: N/A
-- Description: Delivers a twofold attack that slows target. Chance of params.critical hit varies with TP. Ukonvasara: Aftermath.
-- Available only when equipped with Ukonvasara (85), Ukonvasara (90), Ukonvasara (95), Maschu +1, Maschu +2.
-- Aligned with the Light Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Light Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Light/Fragmentation
-- Modifiers: STR:80%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 2.0        2.0        2.0
-- params.critical Chance added with TP:
-- 100%TP    200%TP    300%TP
-- 20%        35%        55%
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100  = 2.00 params.ftp200  = 2.00 params.ftp300  = 2.00
    params.str_wsc = 0.60 params.dex_wsc = 0.00 params.vit_wsc = 0.00 params.agi_wsc = 0.00
    params.int_wsc = 0.00 params.mnd_wsc = 0.00 params.chr_wsc = 0.00
    params.crit100 = 0.20 params.crit200 = 0.35 params.crit300 = 0.55
    params.acc100  = 0.00 params.acc200  = 0.00 params.acc300  = 0.00
    params.atk100  = 1.00 params.atk200  = 1.00 params.atk300  = 1.00
    params.canCrit = true

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.EMPYREAN)
    end

    if damage > 0 then
		local duration = 60 * applyResistanceAddEffect(player, target, tpz.magic.ele.EARTH, 0)
		target:addStatusEffect(tpz.effect.SLOW, 1500, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end