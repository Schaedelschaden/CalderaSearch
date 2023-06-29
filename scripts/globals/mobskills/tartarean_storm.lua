---------------------------------------------
--  Tartarean Storm
--
--  Description: 
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 18' radial
--  Notes: 
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local baseDmg = mob:getWeaponDmg() * 5

    if mob:hasStatusEffect(tpz.effect.VOIDSTORM) then
        baseDmg = mob:getWeaponDmg() * 10
    end

    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, baseDmg, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)

    return dmg
end
