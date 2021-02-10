---------------------------------------------------
--  Pentapeck
--  Family: Tulfaire
--  Description: Deals physical damage. Duration of effect varies with TP.
--  Additional effects: Amnesia.
--  Type: Physical
--  Range: Single
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.AMNESIA
	local duration = 120
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 150
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 180
	end
	
	MobStatusEffectMove(mob, target, typeEffect, 1, 0, duration)
	
	local numhits = 5
    local accmod = 1
    local dmgmod = 0.8
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)
	
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
	
    return dmg
end