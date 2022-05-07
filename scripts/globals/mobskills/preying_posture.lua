---------------------------------------------
-- Howl
--
-- Description: Grants the effect of Warcry to user and any linked allies.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getLocalVar("DeathProphet") == 1) then
        return 1
	else
		return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local power = 25
    local duration = 300

    local typeEffect1 = tpz.effect.WARCRY
	local typeEffect2 = tpz.effect.MAGIC_ATK_BOOST
	local typeEffect3 = tpz.effect.DEFENSE_BOOST
	local typeEffect4 = tpz.effect.MAGIC_DEF_BONUS
	
	if (mob:getMainLvl() >= 136) then
		skill:setMsg(MobBuffMove(mob, typeEffect1, 50, 0, duration))
		MobBuffMove(mob, typeEffect2, 200, 0, duration)
		MobBuffMove(mob, typeEffect3, 100, 0, duration)
		MobBuffMove(mob, typeEffect4, 100, 0, duration)
	else
		skill:setMsg(MobBuffMove(mob, typeEffect1, power, 0, duration))
		MobBuffMove(mob, typeEffect2, power, 0, duration)
		MobBuffMove(mob, typeEffect3, power, 0, duration)
		MobBuffMove(mob, typeEffect4, power, 0, duration)
	end
	
	if (mob:getHPP() < 50) then
		mob:setLocalVar("DeathProphet", 1)
		if (mob:getID() == 17293648 or 17293649) then
			mob:PrintToArea(string.format("Kaggen: The end is near."),tpz.msg.channel.NS_SAY)
		end
	end
	
    -- skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect1
end
