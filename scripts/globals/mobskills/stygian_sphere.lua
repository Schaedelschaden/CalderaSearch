---------------------------------------------
-- Stygian Sphere
--
-- Description: Heals self for 1,800-2,000+ HP.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local potency = math.random(4800, 5000)
	
	mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 2, 0, 0)

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, potency)
end