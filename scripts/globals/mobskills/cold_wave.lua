---------------------------------------------
--  Cold Wave
--
--  Description: Deals ice damage that lowers Agility and gradually reduces HP of enemies within range.
--  Additional effect: Frost
--  Type: Magical (Ice)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

local customDamage =
{
    --Structure: [Mob ID] = { Power, Damage Mod },
    [16801793] = {100, 4},
    [16801794] = {100, 4},
    [16801795] = {100, 4},
}

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.FROST

    local power      = mob:getMainLvl() / 5 * 0.6 + 6
    local powerFrost = mob:getMainLvl() / 5 * 0.6 + 6
	local dmgmod     = 1
    local mobID      = mob:getID()
    local altPower   = customDamage[mobID][1]
    local altDmgMod  = customDamage[mobID][2]

    if altPower and altDmgMod then
        power  = altPower
        dmgmod = altDmgMod
    end

    MobStatusEffectMove(mob, target, typeEffect, powerFrost, 3, 60)

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2.8, tpz.magic.ele.ICE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
