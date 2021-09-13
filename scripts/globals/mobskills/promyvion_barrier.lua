---------------------------------------------
-- Promyvion Barrier
-- Enhances defense.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST
    skill:setMsg(MobBuffMove(mob, typeEffect, 17.5, 0, 300))
	
	-- Hadal Mirrors copy the monster skills the Hadal Satiator uses
	if (mob:getID() == 16838657) then
		for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
			local baby = GetMobByID(babyID)
			
			baby:useMobAbility(752)
		end
	end
	
    return typeEffect
end