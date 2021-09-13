require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 4
    local accmod = 1
    local dmgmod = 0.55
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 1.5, 2)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
	
	-- Hadal Mirrors copy the monster skills the Hadal Satiator uses
	if (mob:getID() == 16838657) then
		for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
			local baby = GetMobByID(babyID)
			
			baby:useMobAbility(741)
		end
	end
	
    return dmg
end