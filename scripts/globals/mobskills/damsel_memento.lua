---------------------------------------------
-- Damsel Memento
--
-- Description: Restores HP.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(tpz.msg.basic.SELF_HEAL)
	
	mob:delStatusEffect(tpz.effect.POISON)
	mob:delStatusEffect(tpz.effect.PARALYSIS)
	mob:delStatusEffect(tpz.effect.BLINDNESS)
	mob:delStatusEffect(tpz.effect.SILENCE)
	mob:delStatusEffect(tpz.effect.DISEASE)
	mob:delStatusEffect(tpz.effect.CURSE)
	mob:delStatusEffect(tpz.effect.BIND)
	mob:delStatusEffect(tpz.effect.WEIGHT)
	mob:delStatusEffect(tpz.effect.SLOW)
	mob:delStatusEffect(tpz.effect.ADDLE)
	mob:delStatusEffect(tpz.effect.PLAGUE)

    return MobHealMove(mob, mob:getMaxHP() * 5 / 100)
end