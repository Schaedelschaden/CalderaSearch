---------------------------------------------
-- Rhino Attack
-- Deals damage to a single target. Additional effect: Knockback
-- Utsusemi/Blink absorb: 1 shadow
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 0
    local mobhp = mob:getHPP()

    if (mob:getID() == 17957329 and mobhp <= 25) then
        result = 1
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)

    -- KNOCKBACK

    local numhits = 1
    local accmod = 1
    local dmgmod = 2.2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
    return dmg
end
