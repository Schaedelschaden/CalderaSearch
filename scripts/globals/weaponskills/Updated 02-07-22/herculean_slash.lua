-----------------------------------
-- Herculean Slash
-- Great Sword weapon skill
-- Weaponskill Category: Magical
-- Skill Level: 290
-- Paralyzes target. Duration of effect varies with TP.
-- Aligned with the Snow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Snow Belt, Thunder Belt & Breeze Belt.
-- Element: Ice
-- Modifiers: VIT:60%
-- As this is a magic-based weaponskill it is also modified by Magic Attack Bonus.
-- 100%TP    200%TP    300%TP
-- 3.50      3.50      3.50
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 3.5 params.ftp200 = 3.5 params.ftp300 = 3.5
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.6 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
	params.dSTAT = 0
    params.ele = tpz.magic.ele.ICE
    params.skill = tpz.skill.GREAT_SWORD
    params.includemab = true
	params.specialWSDMG = player:getMod(tpz.mod.HERCULEAN_SLASH_DMG)
	
	if (player:getEquipID(tpz.slot.MAIN) == 20757) then
		params.bonusmab = 300
	end

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.vit_wsc = 0.8
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    if (damage > 0) then
        local duration = fTP(tp, 60, 120, 180)
        target:addStatusEffect(tpz.effect.PARALYSIS, 30, 0, duration)
    end
	
    return tpHits, extraHits, criticalHit, damage
end