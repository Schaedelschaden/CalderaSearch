---------------------------------------------
-- Into the Light
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.BIND
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 60))
	local typeEffect2 = tpz.effect.PARALYSIS
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect2, 30, 0, 120))
	
    return typeEffect1
end
