---------------------------------------------
-- Shah Mat
---------------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:getLocalVar("ShahMat") > 0) then
        return 1
	else
		return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
	mob:setLocalVar("ShahMat", 1)
	mob:setLocalVar("ShahMatTime", os.time())
end
