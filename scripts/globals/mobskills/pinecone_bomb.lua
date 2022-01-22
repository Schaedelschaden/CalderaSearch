---------------------------------------------
--  Pinecone Bomb
--
--  Description: Single target damage with sleep.
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.3
	
	if (mob:getID() == 16937051) then
		dmgmod = 5
	end
	
	if (mob:getLocalVar("ENHANCED_TP_MOVES") ~= 0) then
		-- TODO: Set mobskill to hit AoE on certain NM's
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
	
	local shadows = info.hitslanded
	
	if (mob:getLocalVar("ENHANCED_TP_MOVES") ~= 0) then
		shadows = MOBPARAM_WIPE_SHADOWS
	end
	
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, shadows)

    local typeEffect = tpz.effect.SLEEP_I

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)

    return dmg
end
