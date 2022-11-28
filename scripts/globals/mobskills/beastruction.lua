---------------------------------------------------
-- Beastruction
--
-- Description: Reduces remaining HP to 1, Gravity, Encumbrance, Knockback
-- Type: Physical
-- Utsusemi/Blink absorb: 
-- Range: 20 yalm radial
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if mob:getHPP() <= 35 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmg = target:getHP() - 1

    if target:isPC() then
        for i = tpz.slot.MAIN, tpz.slot.BACK do
            target:unequipItem(i)
        end
    end

    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.GRAVITY, 50, 0, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.ENCUMBRANCE_I, 65535, 0, 10)

    mob:queue(0, function(mob)
        mob:stun(5000)
    end)

    return dmg
end
