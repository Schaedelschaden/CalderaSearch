---------------------------------------------
-- Hastega
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0, 0
end

function onPetAbility(target, pet, skill, player)
    local bonusTime = utils.clamp(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 300 + bonusTime

	target:delStatusEffectSilent(tpz.effect.HASTE)
    target:addStatusEffect(tpz.effect.HASTE, 3008, 0, duration) -- 308/1024 ~30.08%
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    return tpz.effect.HASTE
end