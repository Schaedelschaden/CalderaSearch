---------------------------------------------
-- Ululation
-- Paralyzes all enemies in an area of effect.
--
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() > 25) then 
            if (target:isBehind(mob, 48) == false) then
				return 0
			else
				return 1
			end
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	if (mob:getID() == 17957298) then
		mob:resetEnmity(target)
	end
	
    local typeEffect = tpz.effect.PARALYSIS

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, math.random(18, 22), 0, 120))

    return typeEffect
end
