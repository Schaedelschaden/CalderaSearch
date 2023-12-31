-----------------------------------
-- Atonement
-- TODO: This needs to be reworked, as this weapon skill does damage based on current enmity, not based on stat modifiers. http://wiki.ffxiclopedia.org/wiki/Atonement    http://www.bg-wiki.com/bg/Atonement
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Damage varies with TP. Conqueror: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Paladin) quest.
-- Aligned with the Aqua Gorget, Flame Gorget & Light Gorget.
-- Aligned with the Aqua Belt, Flame Belt & Light Belt.
-- Element: None
-- Modifiers (old): damage varies with enmity
-- 100%TP    200%TP    300%TP
-- 0.09      0.11      0.20   -CE
-- 0.11      0.14      0.25   -VE
-- Modifiers (new): enmity from damage varies with TP
-- 100%TP    200%TP    300%TP
-- 1.00      1.5       2.0
-- Modifiers (non-mob, wrong): STR:40% VIT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.25      1.50
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftp100 = 1 params.ftp200 = 1.25 params.ftp300 = 1.5
    params.str_wsc = 0.4 params.dex_wsc = 0.0 params.vit_wsc = 0.5 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 1.0 params.atk200 = 1.0 params.atk300 = 1.0
    params.enmityMult = 1.5

    local attack =
    {
        ['type'] = tpz.attackType.BREATH,
        ['slot'] = tpz.slot.MAIN,
        ['weaponType'] = player:getWeaponSkillType(tpz.slot.MAIN),
        ['damageType'] = tpz.damageType.ELEMENTAL
    }
    local calcParams =
    {
        criticalHit     = false,
        tpHitsLanded    = 0,
        extraHitsLanded = 0,
        shadowsAbsorbed = 0,
        bonusTP         = 0
    }

    local damage = 0

    if target:getObjType() ~= tpz.objType.MOB then -- this isn't correct but might as well use what was originally here if someone uses this on a non-mob
        if USE_ADOULIN_WEAPON_SKILL_CHANGES then
            params.ftp100 = 1 params.ftp200 = 1.5 params.ftp300 = 2.0
        end

        damage, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    elseif player:getObjType() == tpz.objType.PC then
        local dmg

        if USE_ADOULIN_WEAPON_SKILL_CHANGES then
            -- dmg = (target:getCE(player) + target:getVE(player)) / 6
            -- tp affects enmity multiplier, 1.0 at 1k, 1.5 at 2k, 2.0 at 3k. Gorget/Belt adds 100 tp each.
            params.enmityMult = params.enmityMult + (tp + handleWSGorgetBelt(player) * 1000 - 1000) / 2000
            params.enmityMult = utils.clamp(params.enmityMult, 1.5, 3) -- necessary because of Gorget/Belt bonus

            local playerLvl = player:getMainLvl() + player:getItemLevel()
            local ve        = target:getVE(player)
            local ce        = target:getCE(player)

            dmg = utils.clamp((2000 + ((50.421 * playerLvl) * ((ve + ce) / 60000))), 0, tp * 3) * (1 + player:getMod(tpz.mod.ATONEMENT_DMG) / 100)
        else
            local effectiveTP = tp + handleWSGorgetBelt(player) * 1000

            effectiveTP = utils.clamp(effectiveTP, 0, 3000) -- necessary because of Gorget/Belt bonus

            local ceMod = fTP(effectiveTP, 0.09, 0.11, 0.20) -- CE portion of Atonement
            local veMod = fTP(effectiveTP, 0.11, 0.14, 0.25) -- VE portion of Atonement

            dmg = math.floor(target:getCE(player) * ceMod) + math.floor(target:getVE(player) * veMod)
        end

        damage = target:breathDmgTaken(dmg)

        calcParams.finalDmg = damage

        if damage > 0 then
            if player:getOffhandDmg() > 0 then
                calcParams.tpHitsLanded = 2
            else
                calcParams.tpHitsLanded = 1
            end
            -- Atonement always yields the TP return of a 2 hit WS (unless it does 0 damage), because if one hit lands, both hits do.
            calcParams.extraHitsLanded = 1
        end

        damage = takeWeaponskillDamage(target, player, params, primary, attack, calcParams, action)
    elseif player:getObjType() == tpz.objType.TRUST then
        local dmg  = 0
        local mLvl = player:getMainLvl()
        local ve   = target:getVE(player)
        local ce   = target:getCE(player)

        dmg    = ((28.421 * mLvl) * ((ve + ce) / 60000)) * (1 + player:getMod(tpz.mod.ATONEMENT_DMG) / 100)
        damage = target:breathDmgTaken(dmg)

        params.enmityMult          = fTP(tp, 1.0, 1.5, 2.0)
        calcParams.finalDmg        = damage
        calcParams.extraHitsLanded = 1

        damage = takeWeaponskillDamage(target, player, params, primary, attack, calcParams, action)
    end

    -- Apply aftermath
    if damage > 0 and player:isPC() then
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)
    end

    return calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.criticalHit, damage
end
