---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Ranged attack only used when target is out of range
    if (mob:checkDistance(target) > 2) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.6

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
	
	local shadows = info.hitslands
	
	if (mob:getID() == 17318439) then
		shadows = MOBPARAM_IGNORE_SHADOWS
		target:dispelStatusEffect()
	end

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, info.hitslanded)

    if (dmg > 0) then
       target:addTP(20)
       mob:addTP(80)
    end

    return dmg
end
