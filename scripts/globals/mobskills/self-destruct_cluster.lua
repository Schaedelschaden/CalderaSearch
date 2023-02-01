---------------------------------------------------
-- Self-Destruct
--
-- Description: Detonates one (or all) of its bombs, inflicting fire damage.
-- Family: Cluster
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 20'
-- Notes: Only used below 50% health.
--        Normally only detonates one of the bombs in the cluster, but if its used
--        below 20%, there's a chance all bombs will explode.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if
        not mob:isNM() and
        mob:getHPP() <= 50
    then
        return 0
    elseif 
        mob:isNM() and
        mob:getHPP() <= 66
    then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local clusterBonus   = 1
    local baseMultiplier = 9

    if mob:isNM() then
        baseMultiplier = 14
    end

    switch (mob:AnimationSub): caseof
    {
        [0] = function ()
            clusterBonus = 1.5
        end,
        [1] = function ()
            clusterBonus = 1.25
        end,
        [2] = function ()
            clusterBonus = 1.15
        end,
    }

    local dmgmod = 1
    local mobHPP = skill:getMobHPP() / 100
    local damage = mob:getWeaponDmg() * baseMultiplier * mobHPP * clusterBonus

    -- Stats from NM - Abyssic Cluster (Level 125)
    -- 128 Mob Weapon DMG * baseMultiplier(14) * 66% mobHPP * clusterBonus(1.5) = 1,774 base damage
    local info = MobMagicalMove(mob, target, skill, damage, tpz.magic.ele.FIRE, dmgmod, TP_MAB_BONUS, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)

    mob:AnimationSub(mob:AnimationSub + 1)

    if
        mob:AnimationSub == 2 and
        not mob:isNM()
    then
        mob:setHP(0)
    end

    return dmg
end
