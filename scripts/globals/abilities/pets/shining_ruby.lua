---------------------------------------------
-- Shining Ruby (Carbuncle Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 44 -- Set the Blood Pact MP Cost here
	
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
--		printf("Shining Ruby PET onUseAbility BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Shining Ruby PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
--	printf("Shining Ruby PET onUseAbility\n")
    local master = pet:getMaster()
	local bonusTime = utils.clamp(master:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    target:delStatusEffect(tpz.effect.SHINING_RUBY)
    target:addStatusEffect(tpz.effect.SHINING_RUBY,1,0,duration)
    target:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.SHINING_RUBY)
    return tpz.effect.SHINING_RUBY
end