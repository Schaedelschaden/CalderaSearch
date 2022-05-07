-----------------------------------
-- Blade Kamu
-- Katana weapon skill
-- Skill Level: N/A
-- Lowers target's params.accuracy. Duration of effect varies with TP. Nagi: Aftermath effect varies with TP.
-- Effect lasts 60 seconds @ 100 TP, 90 seconds @ 200 TP, and 120 seconds @ 300 TP
-- Available only after completing the Unlocking a Myth (Ninja) quest.
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:50%  INT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.5
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
	params.ignoresDef = true
    params.ignored100 = 0.25 params.ignored200 = 0.25 params.ignored300 = 0.25

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.6 params.int_wsc = 0.6
        params.atk100 = 1.25 params.atk200 = 1.25 params.atk300 = 1.25
    end

    -- Apply Aftermath
    tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	
    if damage > 0 then
		local power = fTP(tp, 40, 70, 100)
		local duration = fTP(tp, 60, 120, 180) * applyResistanceAddEffect(player, target, tpz.magic.ele.EARTH, 0)
		target:addStatusEffect(tpz.effect.ACCURACY_DOWN, power, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end