---------------------------------------------
-- Lunatic Voice (Siren Blood Pact)
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
	local animationID = 178
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
    target:addStatusEffect(tpz.effect.SILENCE, 2, 0, 90)
	skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
	
	player:PrintToPlayer(string.format("The %s receives the effect of silence.", fixedMobName),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)
	
    return tpz.effect.SILENCE
end