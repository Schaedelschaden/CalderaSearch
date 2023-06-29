---------------------------------------------
-- Somnial Durance
-- 15' conal gaze sleep
-- Prevents damage and DoT's from waking the target
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.SLEEP_I
    local power1      = 2
    local tick1       = 0
    local duration1   = 60

    skill:setMsg(MobGazeMove(mob, target, typeEffect1, power1, tick1, duration1))

    local effect = target:getStatusEffect(tpz.effect.SLEEP_I)

    -- Prevent taking damage from waking the target
    if effect then
        effect:unsetFlag(tpz.effectFlag.DAMAGE)
    end

    local typeEffect2 = tpz.effect.CHOKE
    local power2      = 150
    local tick2       = 3
    local duration2   = 180

    MobGazeMove(mob, target, typeEffect2, power2, tick2, duration2)

    return typeEffect
end
