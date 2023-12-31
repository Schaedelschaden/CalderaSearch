---------------------------------------------
--  Bilgestorm
--
--  Description: Deals damage in an area of effect. Additional effect: Lowers attack, accuracy, and defense
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used at low health.*Experienced the use at 75%*
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
  -- if(mob:getFamily() == 316) then
    -- local mobSkin = mob:getModelId()

    -- if (mobSkin == 1840) then
        -- return 0
    -- else
        -- return 1
    -- end
  -- end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.ATTACK_DOWN, 25, 0, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.ACCURACY_DOWN, 100, 0, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.DEFENSE_DOWN, 25, 0, 60)

    local numhits = 1
    local accmod  = 1
    local dmgmod  = 2
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_3_SHADOW)

    return dmg
end
