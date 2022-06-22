---------------------------------------------
-- Healing Breeze
--
-- Description: Restores HP for party members within area of effect.
-- Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local potency = skill:getParam()
	local heal

    if (potency == 0) then
        potency = 12
    end

    potency = potency - math.random(0, potency/4)
	heal = mob:getMaxHP() * potency / 100
	
	if (mob:isNM()) then
		heal = utils.clamp(heal, 0, mob:getMaxHP() / 10)
	end

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, heal)
end
