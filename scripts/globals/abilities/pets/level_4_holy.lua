---------------------------------------------
-- Level 4 Holy (Cait Sith Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local animationID = 1693
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
--		printf("LeveL 4 Holy PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Level 4 Holy PET onAbilityCheck\n")

	PlayPetAnimation(pet, target, animationID)
	
	return 0,0
end

function onPetAbility(target, pet, skill)
--	printf("Level 4 Holy PET onPetAbility\n")
	local player = pet:getMaster()
	local mobName = target:getName()
	local moblevel = target:getMainLvl()
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))

	local damage = 1500
	
	if (moblevel % 4 == 0) then -- Divides moblevel by 4 then checks if there is any remainder
		damage = damage + (dINT * 1.5)
		damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHT,1,TP_NO_EFFECT,2)
		damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHT)
		damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHT,1)

		target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
		target:updateEnmityFromDamage(pet,damage)
	
		player:PrintToPlayer(string.format("The %s takes %i damage.", mobName, damage),tpz.msg.channel.SYSTEM_3)
		skill:setMsg(tpz.msg.basic.HIT_DMG)

		return damage
	else
		player:PrintToPlayer(string.format("Cait Sith's ability has no effect on the %s.", mobName),tpz.msg.channel.SYSTEM_3)
		return 0
	end
end