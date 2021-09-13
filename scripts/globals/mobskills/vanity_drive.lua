---------------------------------------------------
-- Vanity Drive
-- Deals damage to a single target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local dmgmod = math.random(1, 2)+math.random()
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
	
	-- Hadal Mirrors copy the monster skills the Hadal Satiator uses
	if (mob:getID() == 16838657) then
		for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
			local baby = GetMobByID(babyID)
			
			baby:useMobAbility(747)
		end
	end
	
    return dmg
end