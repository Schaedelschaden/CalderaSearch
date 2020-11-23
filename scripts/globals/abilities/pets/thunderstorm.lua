---------------------------------------------
-- Thunderstorm (Ramuh Blood Pact)
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
	local cost = 182 -- Set the Blood Pact MP Cost here
		
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
--		printf("Thunderstorm PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Thunderstorm PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)

    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local tp = skill:getTP() / 10
    local master = pet:getMaster()
    local merits = 0
    if (master ~= nil and master:isPC()) then
        merits = master:getMerit(tpz.merit.THUNDERSTORM)
    end

    tp = tp + (merits - 40)
    if (tp > 300) then
        tp = 300
    end

    --note: this formula is only accurate for level 75 - 76+ may have a different intercept and/or slope
    local damage = math.floor(512 + 1.72*(tp+1))
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHTNING,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHTNING)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHTNING,1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end