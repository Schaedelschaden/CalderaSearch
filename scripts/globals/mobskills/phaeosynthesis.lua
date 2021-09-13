---------------------------------------------
-- Phaeosynthesis
--
-- Description: Adds an EVA boost and potent Regen
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Only available during daytime.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- only used during daytime
    local currentTime = VanadielHour()
	
    if (currentTime >= 6 and currentTime <= 18) then
        return 0
    end
	
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local power = ((mob:getMainLvl() / 5) * 4) + 10
    local duration = 60

    local typeEffect1 = tpz.effect.REGEN
	local typeEffect2 = tpz.effect.EVASION_BOOST
	
    skill:setMsg(MobBuffMove(mob, typeEffect1, power, 0, duration))
	MobBuffMove(mob, typeEffect2, power * 2, 0, duration)
	
    return typeEffect1
end