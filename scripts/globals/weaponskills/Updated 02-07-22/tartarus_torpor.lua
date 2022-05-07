-----------------------------------
-- Tartarus Torpor
-- Staff weapon skill
-- Level: 73 (Unlocked while equipped with a Samudra)
-- Puts to sleep enemies within the area of effect and lowers their magical defense and magical evasion.
-- Duration of effect varies with TP. 
-- Element: Earth
-- Modifiers: STR:30%  INT:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00       1.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.2 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.2 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.STAFF
    params.includemab = true

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.3 params.int_wsc = 0.3
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
	
	if (damage > 0) then
		local power = fTP(tp, 10, 20, 30)
		local duration = fTP(tp, 90, 150, 210) * applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0)
		target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, duration * 0.25)
		target:addStatusEffect(tpz.effect.MAGIC_EVASION_DOWN, power * 2, 0, duration)
        target:addStatusEffect(tpz.effect.MAGIC_DEF_DOWN, power, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end