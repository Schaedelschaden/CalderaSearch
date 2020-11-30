---------------------------------------------
-- Tidal Roar (Leviathan Blood Pact)
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
	
--	printf("Tidal Roar PET onPetAbility\n")
	target:delStatusEffect(tpz.effect.ATTACK_DOWN)
	target:addStatusEffect(tpz.effect.ATTACK_DOWN, 25, 3, duration)
	skill:setMsg(tpz.msg.basic.NONE)
end