---------------------------------------------
-- Holy Mist (Carbuncle Blood Pact)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local cost = 152 -- Set the Blood Pact MP Cost here
		
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
--		printf("Holy Mist PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Holy Mist PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
--	printf("Holy Mist PET onPetAbility\n")
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
	local tp = skill:getTP()

	local damage = 2425
	damage = damage + (dINT * 1.5)
	damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHT,1,TP_DMG_BONUS,2)
	damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHT)
	damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHT,1)

	target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
	target:updateEnmityFromDamage(pet,damage)

	return damage
end