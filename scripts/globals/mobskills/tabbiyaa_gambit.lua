---------------------------------------------
-- Tabbiyaa Gambit
--
-- Description: Provides total immunity to all damage types except one.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getLocalVar("TabbiyaaGambit") > 0) then
        return 1
	else
		return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local potency = math.random(7500, 10000)
	local rnd = math.random()
	local changeHP = mob:getLocalVar("changeHP")

		if rnd < 0.25 then
			mob:setLocalVar("TabbiyaaGambit", 1)
		elseif rnd < 0.5 then
			mob:setLocalVar("TabbiyaaGambit", 2)
		elseif rnd < 0.75 then
			mob:setLocalVar("TabbiyaaGambit", 3)
		else
			mob:setLocalVar("TabbiyaaGambit", 4)
		end

	mob:setLocalVar("changeHP", mob:getHP())
	-- mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 2, 0, 0)

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, potency)
end