---------------------------------------------
-- Noctoshield (Diabolos Blood Pact)
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
    local duration = 180 + bonusTime

    target:addStatusEffect(tpz.effect.PHALANX,13,0,duration)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	
    return tpz.effect.PHALANX
end