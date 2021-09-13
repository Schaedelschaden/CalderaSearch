---------------------------------------------
--  Firefly Fandango
--
--  Description: Deals light damage to enemies within range. Additional effect: Paralysis, Flash, and Max MP Down.
--  Type: Magical (Light)
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
	
	local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.8, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 15, 0, 60)
    MobStatusEffectMove(mob, target, tpz.effect.FLASH, 1, 0, 30)
    MobStatusEffectMove(mob, target, tpz.effect.MAX_MP_DOWN, 50, 0, 60)

    return dmg
end