---------------------------------------------
--  Mow
--
--  Description: Deals damage in an area of effect.
--  Additional effect: Poison
--  Additional effect: Dispels up to 3 buffs
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Poison can take around 10HP/tick
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod  = 1
    local dmgmod  = 1
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.POISON
    local power      = mob:getMainLvl() / 4 + 3

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 60)

    for i = 1, 3 do
        local chance = 100

        if i == 2 then
            chance = 66
        elseif i = 3 then
            chance = 33
        end

        if math.random(0, 100) <= chance then
            target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
        end
    end

    return dmg
end
