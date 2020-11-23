---------------------------------------------
-- Slowga (Leviathan Blood Pact)
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
	local cost = 48 -- Set the Blood Pact MP Cost here
		
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
--		printf("Slowga PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Slowga PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    local duration = 180 + summoner:getMod(tpz.mod.SUMMONING)
    if duration > 350 then
        duration = 350
    end

    if target:addStatusEffect(tpz.effect.SLOW, 3000, 0, duration) then
        skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end
    return tpz.effect.SLOW
end