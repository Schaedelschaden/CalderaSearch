---------------------------------------------------
-- Heavy Strike
-- Damage varies with TP.
-- 0% TP: 2.25 / 150% TP: 3.50 / 300% TP: 4.75
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.7
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local typeEffect = tpz.effect.SLOW

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1250, 0, 120)
	
	if (mob:getName() == "Ullikummi") then
		local targetCE = mob:getCE(target)
		local targetVE = mob:getVE(target)
		-- printf("heavy_strike.lua onMobWeaponSkill HEAVY STRIKE CURRENT/NEW CE: [%i / %i]  CURRENT/NEW VE: [%i / %i]\n", targetCE, targetCE - 750, targetVE, targetVE - 1500)
		
		if (targetCE > 750) then
			mob:setCE(target, targetCE - 750)
		else
			mob:setCE(target, 0)
		end
		
		if (targetVE > 1500) then
			mob:setVE(target, targetVE - 1500)
		else
			mob:setVE(target, 0)
		end
    end

    return dmg
end
