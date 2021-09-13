---------------------------------------------
-- Rotten Stench
-- Inflicts Magic Accuracy Down + Accuracy Down.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.ACCURACY_DOWN
	local typeEffectTwo = tpz.effect.MAGIC_ACC_DOWN
	
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffectOne, 200, 0, 60))
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffectTwo, 200, 0, 60))

    return typeEffect
end