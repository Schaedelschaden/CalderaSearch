---------------------------------------------
--  Transmogrification
--
--  Description: Activates a shield to absorb all incoming physical damage.
--  Type: Physical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() == 3) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

    MobBuffMove(mob, tpz.effect.PHYSICAL_SHIELD, 8, 0, 30)
    skill:setMsg(tpz.msg.basic.NONE)

    return 0
end