---------------------------------------------
-- Dream Shroud (Diabolos Blood Pact)
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
    local hour = VanadielHour()
    local buffvalue = 0
	
    buffvalue = math.abs(12 - hour) + 1
	
	if (player:getMainLvl() > 98) then
		buffvalue = buffvalue * 2
	end
	
    target:delStatusEffect(tpz.effect.MAGIC_ATK_BOOST)
    target:delStatusEffect(tpz.effect.MAGIC_DEF_BOOST)
    target:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST,buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.MAGIC_DEF_BOOST,14 - buffvalue,0,duration)
    skill:setMsg(tpz.msg.basic.NONE)
	
    return 0
end