---------------------------------------------------
-- Mijin Gakure
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod    = 1
    local hpmod     = skill:getMobHPP() / 100
    local basePower = (mob:getFamily() == 335) and 4 or 6 -- Maat has a weaker (4) Mijin than usual (6)
    local power     = hpmod * 9 + basePower
    local baseDmg   = mob:getWeaponDmg() * power

    if not mob:isNM() then
        power = power / 2
    end

    local info = MobMagicalMove(mob, target, skill, baseDmg, tpz.magic.ele.NONE, dmgmod, TP_MAB_BONUS, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_IGNORE_SHADOWS)

    -- if mob:isInDynamis() and not mob:isNM() then -- dynamis mobs will kill themselves, other mobs might not
        -- mob:setHP(0)
    -- end

    return dmg
end
