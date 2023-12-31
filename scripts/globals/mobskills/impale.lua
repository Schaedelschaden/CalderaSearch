---------------------------------------------
--  Impale
--
--  Description: Deals damage to a single target. Additional effect: Paralysis (NM version AE applies a strong poison effect and resets enmity on target)
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow (NM version ignores shadows)
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PARALYSIS
    local numhits = 1
    local accmod = 2
    local dmgmod = 3.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local shadows = info.hitslanded
	
	-- if (mob:getID() == 17957301 or mob:getID() == 17957302) then
		-- local typeEffect = tpz.effect.PARALYSIS
		-- local numhits = 1
		-- local accmod = 2
		-- local dmgmod = 5
		-- local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
		-- local shadows = info.hitslanded
	-- end

    if mob:isMobType(MOBTYPE_NOTORIOUS) then
        shadows = MOBPARAM_IGNORE_SHADOWS
        typeEffect = tpz.effect.POISON
        mob:resetEnmity(target)
    end

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, shadows)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 120)
    
    return dmg
end