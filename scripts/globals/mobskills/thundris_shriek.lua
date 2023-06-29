---------------------------------------------
-- Thundris Shriek
--
-- Description: Deals heavy lightning damage to targets in area of effect. Additional effect: Terror
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown
-- Notes: Players will begin to be intimidated by the dvergr after this attack.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getID() == 17666501 or
        mob:getID() == 17666505 or
        mob:getID() == 17666509) and
       mob:getHPP() <= 25
    then
        return 0
    end

    -- if
        -- mob:getFamily() == 91 or -- DvergrSkull
        -- mob:getFamily() == 316   -- Pandemonium
    -- then
        -- local mobSkin = mob:getModelId()

        -- if
            -- mobSkin == 1839 or
            -- mobSkin == 1840
        -- then
            -- return 0
        -- else
            -- return 1
        -- end
    -- end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.TERROR

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 15)

    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 5, tpz.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)

    -- Handle Humanoid Killer and removal
    mob:setMod(tpz.mod.HUMANOID_KILLER, 20)

    mob:timer(60000, function(mobArg)
        mobArg:setMod(tpz.mod.HUMANOID_KILLER, 0)
    end)

    return dmg
end
