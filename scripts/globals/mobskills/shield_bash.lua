---------------------------------------------
--  Final Heaven
--
--  Description:  Delivers an attack that can stun the target. Shield required.
--  Type: Physical
--  Range: Melee
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
    local dmgmod = 8

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 2, 2, 2)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    local status = MobStatusEffectMove(mob, target, tpz.effect.STUN, 1, 0, 7)

    if
        status and
        target:isMob()
    then
        local addImmunity = 30

        if not target:isNM() then
            addImmunity = 10
        end

        target:addMod(tpz.mod.IMMUNITY_STUN, addImmunity)
    end

    return dmg
end
