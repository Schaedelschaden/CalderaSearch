---------------------------------------------
-- Poison Nails (Carbuncle Blood Pact)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 11 -- Set the Blood Pact MP Cost here
		
	if (player:hasStatusEffect(tpz.effect.ASTRAL_CONDUIT)) then
		ability:setRecast(utils.clamp(0, 0, 0))
	end
	
	if (player:hasStatusEffect(tpz.effect.APOGEE)) then
		cost = cost * 1.5
		ability:setRecast(utils.clamp(0, 0, 0))
		player:delStatusEffect(tpz.effect.APOGEE)
	end
	
	if (math.random(1,100) < bloodboon) then
--		local originalcost = cost
		cost = (cost * (math.random(8,16) / 16))
--		printf("Poison Nails PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Poison Nails PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
--	printf("Poison Nails PET onUseAbility\n")
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3)

    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.PIERCING,numhits)

    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
    target:updateEnmityFromDamage(pet,totaldamage)

    if (AvatarPhysicalHit(skill, totalDamage) and target:hasStatusEffect(tpz.effect.POISON) == false) then
        target:addStatusEffect(tpz.effect.POISON,1,3,60)
    end

    return totaldamage
end