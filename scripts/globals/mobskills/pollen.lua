---------------------------------------------
-- Pollen
--
-- Description: Restores HP.
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
    local potency = skill:getParam()

    if (potency == 0) then
        potency = 12
    end

    potency = potency - math.random(0, potency/4)
	
	-- Chasmic Hornet's healing capability is scaled down
	if (mob:getID() == 17318451) then
		potency = (math.random(3, 6))
	end

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, mob:getMaxHP() * potency / 100)
end
