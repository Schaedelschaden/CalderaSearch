---------------------------------------------
-- Dark Arrivisme
--
-- Description: Deals Moderate damage within an area of effect.
-- Additional Effects: Knockback and Dispel (3 buffs)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2.75, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    for i = 1, 3 do
        target:dispelStatusEffect()
    end

    mob:setMod(tpz.mod.HUMANOID_KILLER, 30)

    mob:timer(30000, function(mob)
        mob:setMod(tpz.mod.HUMANOID_KILLER, 0)
    end)

    return dmg
end
