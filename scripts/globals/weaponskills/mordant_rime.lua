-----------------------------------
-- Mordant Rime
-- Dagger weapon skill
-- Skill level: N/A
-- Description: Delivers a twofold attack that decreases target's movement speed. Chance of decreasing movement speed varies with TP. Carnwenhan: Aftermath effect varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt.
-- Element: None
-- Skillchain Properties: Fragmentation/Distortion
-- Modifiers: DEX:30%  CHR:70%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 5.0        5.0        5.0
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 3 params.ftp200 = 3 params.ftp300 = 3
    params.str_wsc = 0.0 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.5
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 5 params.ftp200 = 5 params.ftp300 = 5
        params.chr_wsc = 0.7
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Apply aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)
    end

	local chance = fTP(tp, 40, 65, 100)

    if damage > 0 and math.random() <= chance then
		target:addStatusEffect(tpz.effect.WEIGHT, 26, 0, 60)
    end

    return tpHits, extraHits, criticalHit, damage
end
