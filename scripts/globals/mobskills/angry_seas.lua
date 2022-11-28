---------------------------------------------------
-- Angry Seas
--
-- Description: Inflicts Gravity and Encumbrance
-- Type: Physical
-- Utsusemi/Blink absorb: 
-- Range: Unknown
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if target:isPC() then
        for i = tpz.slot.MAIN, tpz.slot.BACK do
            target:unequipItem(i)
        end
    end

    skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.GRAVITY, 50, 0, 60))
    MobStatusEffectMove(mob, target, tpz.effect.ENCUMBRANCE_I, 65535, 0, 10)

    return tpz.effect.GRAVITY
end
