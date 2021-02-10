---------------------------------------------
-- Eerie Eye (Cait Sith Blood Pact)
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
	local animationID = 163
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	if (target:isFacing(pet)) then
		if (target:hasStatusEffect(tpz.effect.SILENCE)) then
			skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
		else
			skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
			target:addStatusEffect(tpz.effect.AMNESIA, 1, 0, 30)
			target:addStatusEffect(tpz.effect.SILENCE, 1, 0, 30)
			player:PrintToPlayer(string.format("The %s receives the effects of silence and amnesia.", fixedMobName),tpz.msg.channel.NS_SAY)
		end
	end
	
	PlayPetAnimation(pet, target, 13, animationID)
	
	return tpz.effect.SILENCE, tpz.effect.AMNESIA
end