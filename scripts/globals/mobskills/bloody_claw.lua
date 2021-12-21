---------------------------------------------
-- Bloody Claw
-- Family: Gargouille
-- Description: Steals an enemy's HP. Additional effect: Reduces a random stat.
-- Type: Physical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee
-- Notes: Despite the attack ignoring Utsusemi, it is physical, and therefore capable of missing entirely.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 0) then -- On ground
		return 0
	elseif (mob:AnimationSub() == 1) then -- In air
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3
    local accmod = 2
    local dmgmod = 1.2
    local typeEffect = 136 + math.random(0, 6) -- 136 is tpz.effect.STR_DOWN add 0 to 6 for all 7 of the possible attribute reductions
	
	-- Goji spams abilities so tone it down a bit
	if (mob:getID() == 17269127 or mob:getID() == 17269128 or mob:getID() == 17269129) then
		dmgmod = 0.7
	end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 3, 120)

    return dmg
end
