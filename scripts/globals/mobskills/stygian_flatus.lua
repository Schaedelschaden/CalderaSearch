---------------------------------------------
-- Stygian Flatus
-- Emits a cloud of spores that inflict paralysis.
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
-- Duration: 9:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PARALYSIS

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 120))
	
	-- Hadal Mirrors copy the monster skills the Hadal Satiator uses
	if (mob:getID() == 16838657) then
		for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
			local baby = GetMobByID(babyID)
			
			baby:useMobAbility(750)
		end
	end

    return typeEffect
end