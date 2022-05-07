-----------------------------------
-- Sanguine Blade
-- Sword weapon skill
-- Weaponskill Category: Magical
-- Skill Level: 300
-- Drains a percentage of damage dealt to HP varies with TP.
-- Will not stack with Sneak Attack.
-- Not aligned with any "elemental gorgets" or "elemental belts" due to it's absence of Skillchain properties.
-- Element: Dark
-- Modifiers: STR:30%  MND:50%
-- 100%TP    200%TP    300%TP
-- 2.75      2.75      2.75
-- HP Drained by TP:
-- 100%TP    200%TP    300%TP
-- 50%       75%    100%
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local drain = fTP(tp, 50, 75, 100)

    local params = {}
    params.ftp100 = 2.75 params.ftp200 = 2.75 params.ftp300 = 2.75
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.5 params.chr_wsc = 0.0
	params.dSTAT = (player:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)) * 2
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.SWORD
    params.includemab = true

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        drain = fTP(tp, 80, 120, 160)
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    if (target:isUndead() == false) then
        player:addHP((damage / 100) * drain)
    end

    return tpHits, extraHits, criticalHit, damage
end