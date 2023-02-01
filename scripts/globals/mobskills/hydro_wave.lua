-----------------------------------
--  Hydro Wave
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Do not use this weapon skill on targets behind. Sub-Zero Smash
    -- should trigger in this case.
    if target:isBehind(mob) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    target:unequipItem(math.random(tpz.slot.MAIN, tpz.slot.BACK))

    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 0, 60)

    return dmg
end
