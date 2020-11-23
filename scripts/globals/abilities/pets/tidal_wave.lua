---------------------------------------------------
-- Tidal Wave
---------------------------------------------------
require("/scripts/globals/settings")
require("/scripts/globals/status")
require("/scripts/globals/monstertpmoves")
require("/scripts/globals/magic")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local bloodboon = player:getMod(tpz.mod.BLOOD_BOON)
	local level = player:getMainLvl()
	local cost = level * 2 -- Set the Blood Pact MP Cost here
		
	if (player:hasStatusEffect(tpz.effect.ASTRAL_CONDUIT)) then
		ability:setRecast(utils.clamp(0, 0, 0))
	end
	
	if (player:hasStatusEffect(tpz.effect.APOGEE)) then
		cost = cost * 1.5
		ability:setRecast(utils.clamp(0, 0, 0))
		player:delStatusEffect(tpz.effect.APOGEE)
	end
		
	if(currentMP < cost) then
        return 87,0
    end
	
	player:setMP(0)
		
--	printf("Tidal Wave PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, master)
    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))

    local level = pet:getMainLvl()
    local damage = 48 + (level * 8)
	
	if (level > 98) then
		damage = 1000 + (level * 16)
	end
	
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet, target, skill, damage, tpz.magic.ele.WATER, 1, TP_NO_EFFECT, 0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.WATER)
    damage = AvatarFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, 1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end