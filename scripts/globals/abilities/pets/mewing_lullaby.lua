---------------------------------------------
-- Mewing Lullaby (Cait Sith Blood Pact)
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
    local animationID = 162
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local duration = 60
    local resm = applyPlayerResistance(pet,-1,target,pet:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT),tpz.skill.ELEMENTAL_MAGIC, 5)
    if (resm < 0.5) then
        skill:setMsg(tpz.msg.basic.JA_MISS_2) -- resist message
        return tpz.effect.SLEEP_I
    end
    duration = duration * resm
    if (target:hasImmunity(1) or hasSleepEffects(target)) then
        --No effect
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)

        target:addStatusEffect(tpz.effect.SLEEP_I,1,0,duration)
    end
	
	player:PrintToPlayer(string.format("The %s is asleep.", fixedMobName),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)

    return tpz.effect.SLEEP_I
end