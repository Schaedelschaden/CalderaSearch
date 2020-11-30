---------------------------------------------
-- Glittering Ruby (Carbuncle Blood Pact)
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
    -- Randomly give str/dex/vit/agi/int/mnd/chr (Formula: 3 + floor(level / 5))
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