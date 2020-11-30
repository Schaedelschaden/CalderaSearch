---------------------------------------------
-- Perfect Defense
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
	local player = pet:getMaster()
    local power = 100 * (player:getMP() / player:getMaxMP())
    local duration = 60
	local summoningSkill = player:getSkillLevel(tpz.skill.SUMMONING_MAGIC)
    
	if (player ~= nil) then
        if (summoningSkill > 600) then
            summoningSkill = 600
        end
        duration = 30 + summoningSkill / 20
    end
    
	target:delStatusEffect(tpz.effect.PERFECT_DEFENSE)
    target:addStatusEffect(tpz.effect.PERFECT_DEFENSE,power,3,duration)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    player:setMP(0)
    
	return tpz.effect.PERFECT_DEFENSE
end