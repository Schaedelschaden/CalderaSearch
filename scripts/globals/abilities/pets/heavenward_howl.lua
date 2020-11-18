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
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 96 -- Set the Blood Pact MP Cost here
		
	if (player:hasStatusEffect(tpz.effect.ASTRAL_CONDUIT)) then
		ability:setRecast(utils.clamp(0, 0, 0))
	end
	
	if (player:hasStatusEffect(tpz.effect.APOGEE)) then
		cost = cost * 1.5
		ability:setRecast(utils.clamp(0, 0, 0))
		player:delStatusEffect(tpz.effect.APOGEE)
	end
	
	if (math.random(1,100) < bloodboon) then
		local originalcost = cost
		cost = (cost * (math.random(8,16) / 16))
--		printf("Heavenward Howl PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Heavenward Howl PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, summoner)
	local bonusTime = utils.clamp(summoner:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 60 + bonusTime
	local drainvalue = 0
	local aspirvalue = 0
    local moon = VanadielMoonPhase()

	if moon > 90 then
		drainvalue = 15
		aspirvalue = 0
	elseif moon > 75 then
		drainvalue = 12
		aspirvalue = 0
	elseif moon > 60 then
		drainvalue = 8
		aspirvalue = 1
	elseif moon > 40 then
		drainvalue = 5
		aspirvalue = 2
	elseif moon > 25 then
		drainvalue = 0
		aspirvalue = 4
	elseif moon > 10 then
		drainvalue = 0
		aspirvalue = 5
	end
	
--	printf("Heavenward Howl PET onPetAbility Drain Value: [%i] Aspir Value: [%i]\n",drainvalue,aspirvalue)
	
	if (drainvalue > 0) then
		target:delStatusEffect(tpz.effect.DRAIN_SAMBA)
		target:delStatusEffect(tpz.effect.ENDRAIN)
		target:addStatusEffect(tpz.effect.ENDRAIN,drainvalue,0,duration)
	end
	
	if (aspirvalue > 0) then
		target:delStatusEffect(tpz.effect.ASPIR_SAMBA)
		target:delStatusEffect(tpz.effect.ENASPIR)
		target:addStatusEffect(tpz.effect.ENASPIR,aspirvalue,0,duration)
	end

	skill:setMsg(tpz.msg.basic.NONE)
    return 0
end