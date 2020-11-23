---------------------------------------------
-- Camisado (Diabolos Blood Pact)
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
	local cost = 20 -- Set the Blood Pact MP Cost here
		
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
--		printf("Camisado PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Camisado PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3.5

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_ACC_VARIES,1,1.50,2)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.BLUNT,numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(pet,totaldamage)

    return totaldamage
end