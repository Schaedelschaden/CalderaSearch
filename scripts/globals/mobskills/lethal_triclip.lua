---------------------------------------------
--  Lethal Triclip
--
--  Description: Deals damage in a threefold attack. Additional effect: Max HP Down
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
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
    if mob:getID() == 17666487 then -- Khalkotaur
        skill:setKnockback(5)
    end

    local numhits = 3
    local accmod  = 1
    local dmgmod  = 2
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local typeEffect = tpz.effect.MAX_HP_DOWN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 120)

    return dmg
end
