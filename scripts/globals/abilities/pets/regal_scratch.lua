---------------------------------------------
-- Regal Scratch (Cait Sith Blood Pact)
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
	local cost = 5 -- Set the Blood Pact MP Cost here
		
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
--		printf("Regal Scratch PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n", originalcost, cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Regal Scratch PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    local animationID = 1686
	local player = pet:getMaster()
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local numhits = 3
    local accmod = 1
    local dmgmod = 1
    local dmgmodsubsequent = 1

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.SLASHING,numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    target:updateEnmityFromDamage(pet,totaldamage)
	
	player:PrintToPlayer(string.format("The %s takes %i damage.", fixedMobName, totaldamage),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, animationID)

    return totaldamage
end