-----------------------------------
-- Randgrith
-- Club weapon skill
-- Skill level: N/A
-- Lowers target's evasion. Gullintani/Mjollnir: Temporarily improves params.accuracy.
-- Available only when equipped with the Relic Weapons Gullintani (Dynamis use only), Mjollnir, or a Charged Molva Maul.
-- Aftermath: Adds +20 params.accuracy after the weapon skill is used, duration is determined by TP. Only available with Gullintani and Mjollnir.
-- 100% = 20 seconds, 200% = 40 seconds, 300% = 60 seconds.
-- This Relic Weapon is only available to White Mages Scholars must use the Molva Maul to acquire this weapon skill.
-- Shield Break effect : Evasion -32
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:40%  MND:40%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 2.75 params.ftp200 = 2.75 params.ftp300 = 2.75
    params.str_wsc = 0.4 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.4 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
	
	if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp100 = 4.25 params.ftp200 = 4.25 params.ftp300 = 4.25
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.RELIC)
    end

    if damage > 0 then
		local power = fTP(tp, 30, 60, 90)
		local duration = fTP(tp, 90, 150, 210) * applyResistanceAddEffect(player, target, tpz.magic.ele.ICE, 0)
		target:addStatusEffect(tpz.effect.EVASION_DOWN, power, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end