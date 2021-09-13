---------------------------------------------
--  Words of Bane
--
--  Description: Curses a single target.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single Target
--  Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.CURSE_I

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 360))
	
	-- Tonberry Lieje will instantly cast Flare when above 50% HPP and Flare II when below 50% HPP
	if (mob:getID() == 16839067 and mob:getHPP() > 50) then
		mob:addStatusEffectEx(tpz.effect.CHAINSPELL, 1, 0, 30)
		mob:castSpell(204, target)
		mob:setLocalVar("REMOVE_CHAINSPELL", os.time())
	elseif (mob:getID() == 16839067 and mob:getHPP() <= 50) then
		mob:addStatusEffectEx(tpz.effect.CHAINSPELL, 1, 0, 30)
		mob:castSpell(205, target)
		mob:setLocalVar("REMOVE_CHAINSPELL", os.time())
	end

    return typeEffect
end
