---------------------------------------------
-- Level 1 Holy (Cait Sith Blood Pact)
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
	local cost = 235 -- Set the Blood Pact MP Cost here
		
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
--		printf("LeveL 1 Holy PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Level 1 Holy PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
	local animationID = 1690
--	printf("Level 1 Holy PET onPetAbility\n")
	local player = pet:getMaster()
	local mobName = target:getName()
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))

	local damage = 700
	damage = damage + (dINT * 1.5)
	damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHT,1,TP_NO_EFFECT,2)
	damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHT)
	damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHT,1)

	target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
	target:updateEnmityFromDamage(pet,damage)
	
	player:PrintToPlayer(string.format("The %s takes %i damage.", mobName, damage),tpz.msg.channel.SYSTEM_3)
	skill:setMsg(tpz.msg.basic.HIT_DMG)
	
	PlayPetAnimation(pet, pet, animationID)

	return damage
end