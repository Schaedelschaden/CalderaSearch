-----------------------------------
-- Dimidiation
-- Great Sword weapon skill
-- Skill Level: 415
-- Delivers a twofold attack. Damage varies with TP. Epeolatry: Aftermath effect varies with TP.
-- Aligned with the Breeze Gorget and Thunder Gorget.
-- Aligned with the Breeze Belt and Thunder Belt.
-- Element: None
-- Modifiers: DEX:80%
-- 100%TP    200%TP    300%TP
--  2.25      4.5       6.75
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
require("scripts/globals/aftermath")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
	params.numHits = 2
	params.ftp100 = 2.25 params.ftp200 = 4.5 params.ftp300 = 6.75
	params.str_wsc = 0.0 params.dex_wsc = 0.8 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
	params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
	params.canCrit = false
	params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
	params.atk100 = 1.25 params.atk200 = 1.25 params.atk300 = 1.25

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	
	tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)
    
	return tpHits, extraHits, criticalHit, damage
end