------------------------
--    Exudation     --
-- Description: Attack varies with TP. Idris: Aftermath effect varies with TP.
-- Acquired permanently by completing the appropriate Walk of Echoes Weapon Skill Trials.
-- Can also be used by equipping Idris.
-- Skillchain Properties: Darkness / Fragmentation
-- Modifiers: INT: 50% / MND: 50%
-- 100%TP    200%TP    300%TP
-- 1.50      3.625      4.75
--------------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
---------------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.50 params.ftp200 = 3.625 params.ftp300 = 4.75
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 1.0 params.mnd_wsc = 1.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
	
	if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 2.8 params.ftp200 = 2.8 params.ftp300 = 2.8
        params.int_wsc = 0.5 params.mnd_wsc = 0.5
		params.atk100 = 1.5 params.atk200 = 2.625 params.atk300 = 3.75
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)

    return tpHits, extraHits, criticalHit, damage
end