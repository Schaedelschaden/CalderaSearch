-----------------------------------
-- Shadow of Death
-- Scythe weapon skill
-- Weaponskill Category: Magical
-- Skill Level: 70
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Snow Gorget & Aqua Gorget.
-- Aligned with the Snow Belt & Aqua Belt.
-- Element: Dark
-- Modifiers: STR:40%  INT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.50      3.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 1 params.ftp200 = 2.5 params.ftp300 = 3
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.3 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
	params.dSTAT = ((player:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)) / 2) + 8
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.SCYTHE
    params.includemab = true

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
		params.ftp100 = 1 params.ftp200 = 4.175 params.ftp300 = 8.6125
        params.str_wsc = 0.4 params.int_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
	
    return tpHits, extraHits, criticalHit, damage
end