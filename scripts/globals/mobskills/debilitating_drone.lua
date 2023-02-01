---------------------------------------------
-- Debilitating Drone (Enfeebling)
-- Description: Random stat down
-- Type: Physical
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local effects =
    {
        tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN,
        tpz.effect.INT_DOWN, tpz.effect.MND_DOWN, tpz.effect.CHR_DOWN
    }

    local pickEffect = math.random(#effects)

    skill:setMsg(MobStatusEffectMove(mob, target, effects[pickEffect], 30, 3, 60))

    return pickEffect
end
