---------------------------------------------
-- Wind's Blessing (Siren Blood Pact)
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
	local animationID = 184
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local strength = pet:getStat(tpz.mod.MND) / 4
	local bonusTime = utils.clamp(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 120)
	local duration = 60 + bonusTime
	
	target:delStatusEffect(tpz.effect.RAMPART)
	target:delStatusEffect(tpz.effect.SHINING_RUBY)
	target:addStatusEffect(tpz.effect.WINDS_BLESSING, strength, 0, duration)
	skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	
	player:PrintToPlayer(string.format("%s gains the effect of Wind's Blessing.", fixedMobName),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)
	
	return tpz.effect.AQUAVEIL
end