---------------------------------------------
-- Full Bloom
--
-- Description: Sacrifices an pet to restore HP (~10%). Additional Effect: Stoneskin.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if mob:getHPP() <= 25 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local power = math.random(27000, 35000)
    -- Morta absorbs rafflesia pets and gains a Stoneskin effect
    -- local typeEffect = tpz.effect.STONESKIN

    -- MobBuffMove(mob, typeEffect, power / 3, 0, 300)

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, power)
end
