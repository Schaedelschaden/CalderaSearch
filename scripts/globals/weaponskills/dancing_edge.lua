-----------------------------------
-- Dancing Edge
-- Dagger weapon skill
-- Skill level: 200
-- Delivers a fivefold attack. params.accuracy varies with TP.
-- Will stack with Sneak Attack.
-- Will stack with Trick Attack.
-- Aligned with the Breeze Gorget & Soil Gorget.
-- Aligned with the Breeze Belt & Soil Belt.
-- Element: None
-- Modifiers: DEX:30%  CHR:40%
-- 100%TP    200%TP    300%TP
-- 1.19      1.19      1.19
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftp100 = 1.1875 params.ftp200 = 1.1875 params.ftp300 = 1.1875
    params.str_wsc = 0.0 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.4
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 1.0 params.acc200 = 1.1 params.acc300 = 1.2
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
	params.multiHitfTP = true

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.dex_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	
    return tpHits, extraHits, criticalHit, damage
end