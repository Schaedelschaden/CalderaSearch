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
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 134 -- Set the Blood Pact MP Cost here
		
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
--		printf("Eerie Eye PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Eerie Eye PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
	local animationID = 1688
	if (target:isFacing(pet)) then
		if (target:hasStatusEffect(tpz.effect.SILENCE)) then
			skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
		else
			skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
			target:addStatusEffect(tpz.effect.AMNESIA, 1, 0, 30)
			target:addStatusEffect(tpz.effect.SILENCE, 1, 0, 30)
		end
	end
	
	PlayPetAnimation(pet, target, animationID)
	
	return tpz.effect.SILENCE, tpz.effect.AMNESIA
end