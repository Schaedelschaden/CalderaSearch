---------------------------------------------
-- Nightmare (Diabolos Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill, player)
	local bonusTime = utils.clamp(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 90 + bonusTime
	
	target:addStatusEffect(tpz.effect.NIGHTMARE, 1, 0, duration)
	target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, duration)
	target:addStatusEffect(tpz.effect.BIO, 2, 3, duration)
	
	skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
	
	return tpz.effect.SLEEP_I
end