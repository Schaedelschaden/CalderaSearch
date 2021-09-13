---------------------------------------------
-- Ritual Bind
-- 10' Binds and paralyzes players in area of effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BIND
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60))
	local typeEffect = tpz.effect.PARALYZE
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 120))
	
	-- Immediately follows up with Throat Stab
	mob:useMobAbility(788)

    return typeEffect
end
