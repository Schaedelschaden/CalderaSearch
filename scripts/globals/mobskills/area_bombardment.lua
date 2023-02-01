---------------------------------------------------
-- Area Bombardment
-- Moderate cone magical damage and dispels multiple effects. Resets enmity on target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2.6, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)

    for i = 1, math.random(1, 3) do
        target:dispelStatusEffect()
    end

    mob:resetEnmity(target)

    return dmg
end
