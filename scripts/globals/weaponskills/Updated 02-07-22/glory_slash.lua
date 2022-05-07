-----------------------------------
-- Glory Slash
-- Sword weapon skill
-- Skill Level: NA
-- Only avaliable during Campaign Battle while weilding Lex Talionis.
-- Delivers and area attack that deals triple damage. Damage varies with TP. Additional effect Stun.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: Light
-- Modifiers: STR:30%
-- 100%TP    200%TP    300%TP
-- 3.00      3.50      4.00
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 3 params.ftp200 = 5 params.ftp300 = 7
    params.str_wsc = 0.5 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0

    if (damage > 0) then
        local duration = fTP(tp, 3, 4, 6)
        target:addStatusEffect(tpz.effect.STUN, 1, 0, duration)
    end

    local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	
    return tpHits, extraHits, damage
end