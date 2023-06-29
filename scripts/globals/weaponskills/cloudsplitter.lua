-----------------------------------
-- Cloudsplitter
-- Axe weapon skill
-- Weaponskill Category: Magical
-- Skill level: NA
-- Description: Deals lightning elemental damage. Damage varies with TP. Farsha: Aftermath.
-- Available only when equipped with Farsha (85), Farsha (90) or Alard's Axe +1.
-- Elemental gorgets do not affect damage. Rairin Obi increases damage on Lightning day and/or weather.
-- Element: Lightning
-- Modifiers: STR:40% MND:40%
-- 100%TP    200%TP    300%TP
-- 3.75        5.0      6.0
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/magic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 3.75 params.ftp200 = 5.0 params.ftp300 = 6.0
    params.str_wsc = 0.4 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.4 params.chr_wsc = 0.0
	params.dSTAT = 0
    params.ele = tpz.magic.ele.LIGHTNING
    params.skill = tpz.skill.AXE
    params.includemab = true
	params.specialWSDMG = player:getMod(tpz.mod.CLOUDSPLITTER_DMG)
	
	if player:getEquipID(tpz.slot.MAIN) == 20808 then
		params.bonusmab = 300
	end

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp200 = 6.6992 params.ftp300 = 8.5
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Apply aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.EMPYREAN)
    end

    return tpHits, extraHits, criticalHit, damage
end