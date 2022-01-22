---------------------------------------------
-- Plenilune_Embrace
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 1) then
		return 0
	else
		mob:useMobAbility(2174)
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
	local heal = mob:getMaxHP() * 0.05
	
	if (mob:isNM()) then
		heal = mob:getMaxHP() * 0.025
	end

    skill:setMsg(tpz.msg.basic.SKILL_RECOVERS_HP)
	
	mob:setTP(0)
	
	-- skill:setMsg(MobBuffMove(mob, tpz.effect.HASTE, 1000, 0, 300)) -- If it broke this was what did it.
    return MobHealMove(mob, heal)
end