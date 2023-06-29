-----------------------------------
-- Flash Nova
-- Skill level: 290
-- Delivers light elemental damage. Additional effect: Flash. Chance of effect varies with TP.
-- Generates a significant amount of Enmity.
-- Does not stack with Sneak Attack
-- Aligned with Aqua Gorget.
-- Aligned with Aqua Belt.
-- Properties:
-- Element: Light
-- Skillchain Properties:Induration Reverberation
-- Modifiers: STR:30% MND:30%
-- Damage Multipliers by TP:
--     100%TP    200%TP     300%TP
--      3.00     3.00     3.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    if player:getObjType() == tpz.objType.PC then
        local params = {}
        params.numHits = 1        
        params.ftp100 = 3 params.ftp200 = 3 params.ftp300 = 3
        params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.3 params.chr_wsc = 0.0
        params.dSTAT = ((player:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)) / 2) + 8
        params.ele = tpz.magic.ele.LIGHT
        params.skill = tpz.skill.CLUB
        params.includemab = true

        if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
            params.str_wsc = 0.5 params.mnd_wsc = 0.5
        end
        
        local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar) 
        
    else
        local params = {}
        params.numHits = 1
        params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
        params.str_wsc = 0.2 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
        params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
        params.canCrit = false
        params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
        params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
        
        local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar) 
    end    
	
    return tpHits, extraHits, criticalHit, damage
end