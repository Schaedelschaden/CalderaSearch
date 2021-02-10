---------------------------------------------------
--  Zealous Snort
--  Family: Raaz
--  Description: +25% Haste, +25 MDB, and increases the likelihood of both countering and guarding for pet and Beastmaster. Duration of effect varies with TP.
--  Type: Buff
--  Range: Self & master
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.ZEALOUS_SNORT
	local icon = tpz.effect.COUNTERSTANCE
	local duration = 90
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 120
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 180
	end
	
	if (master ~= nil) then
		master:addStatusEffectEx(typeEffect, icon, 1, 0, duration)
	end
	
    skill:setMsg(MobBuffMoveEx(mob, typeEffect, icon, 1, 0, duration))
	
    return tpz.effect.COUNTERSTANCE
end