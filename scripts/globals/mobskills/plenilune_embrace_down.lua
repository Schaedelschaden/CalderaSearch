---------------------------------------------
-- Plenilune_Embrace
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 0 and os.time() >= mob:getLocalVar("PLENILUNE_EMBRACE_COOL") + 20) then
		return 0
	else
		-- mob:useMobAbility(2173)
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
	
	mob:setLocalVar("PLENILUNE_EMBRACE_COOL", os.time())
	
    -- Todo: verify/correct maths
    return MobHealMove(mob, heal)
end