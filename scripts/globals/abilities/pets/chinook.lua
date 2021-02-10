---------------------------------------------
-- Chinook (Siren Blood Pact)
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
	local animationID = 180
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local strength = 3 + math.floor((player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300) / 75)
	local duration = 900
	
	target:addStatusEffect(tpz.effect.AQUAVEIL, strength, 0, duration)
	skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	
	player:PrintToPlayer(string.format("%s gains the effect of Aquaveil.", fixedMobName),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)
	
	return tpz.effect.AQUAVEIL
end