---------------------------------------------
-- Heavenward Howl (Fenrir Blood Pact)
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
    local duration = 60 + bonusTime
	local drainvalue = 0
	local aspirvalue = 0
    local moon = VanadielMoonPhase()
--	printf("Heavenward Howl PET onPetAbility Moon Phase: [%i]\n", moon)


	if moon > 90 then
		drainvalue = 15
	elseif moon > 75 then
		drainvalue = 12
	elseif moon > 60 then
		drainvalue = 8
	elseif moon > 40 then
		aspirvalue = 2
	elseif moon > 25 then
		aspirvalue = 4
	elseif moon > 10 then
		aspirvalue = 5
	end
	
--	printf("Heavenward Howl PET onPetAbility Drain Value: [%i] Aspir Value: [%i]\n",drainvalue,aspirvalue)
	
	if (drainvalue > aspirvalue) then
		target:delStatusEffect(tpz.effect.DRAIN_SAMBA)
		target:delStatusEffect(tpz.effect.ENDRAIN)
		target:addStatusEffect(tpz.effect.ENDRAIN,drainvalue,0,duration)
	end
	
	if (aspirvalue > drainvalue) then
		target:delStatusEffect(tpz.effect.ASPIR_SAMBA)
		target:delStatusEffect(tpz.effect.ENASPIR)
		target:addStatusEffect(tpz.effect.ENASPIR,aspirvalue,0,duration)
	end

	skill:setMsg(tpz.msg.basic.NONE)
    return 0
end