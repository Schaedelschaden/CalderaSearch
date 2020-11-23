---------------------------------------------
-- Glittering Ruby (Carbuncle Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 62 -- Set the Blood Pact MP Cost here
	
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
--		printf("Glittering Ruby PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Glittering Ruby PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    --randomly give str/dex/vit/agi/int/mnd/chr (Formula: 3 + floor(level / 5))
    local strength = (3 + math.floor(pet:getMainLvl()/ 5))
--	printf("Glittering Ruby PET onUseAbility STRENGTH [%i]\n",strength)
	local effect = math.random()
	local effectid = tpz.effect.STR_BOOST
	
    if (effect<=0.14) then --STR
        effectid = tpz.effect.STR_BOOST
    elseif (effect<=0.28) then --DEX
        effectid = tpz.effect.DEX_BOOST
    elseif (effect<=0.42) then --VIT
        effectid = tpz.effect.VIT_BOOST
    elseif (effect<=0.56) then --AGI
        effectid = tpz.effect.AGI_BOOST
    elseif (effect<=0.7) then --INT
        effectid = tpz.effect.INT_BOOST
    elseif (effect<=0.84) then --MND
        effectid = tpz.effect.MND_BOOST
    else --CHR
        effectid = tpz.effect.CHR_BOOST
    end

    target:addStatusEffect(effectid,strength,0,90)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	
    return effectid
end