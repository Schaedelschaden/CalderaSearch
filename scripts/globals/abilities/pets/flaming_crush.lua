---------------------------------------------
-- Flaming Crush (Ifrit Blood Pact)
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
	local cost = 164 -- Set the Blood Pact MP Cost here
		
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
--		printf("Flaming Crush PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Flaming Crush PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 10
    local dmgmodsubsequent = 1
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3)
    --get resist multiplier (1x if no resist)
    local resist = applyPlayerResistance(pet,-1,target,pet:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT),tpz.skill.ELEMENTAL_MAGIC, tpz.magic.ele.FIRE)
	
    --get the resisted damage
    damage.dmg = damage.dmg*resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    damage.dmg = mobAddBonuses(pet,spell,target,damage.dmg,1)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.FIRE,numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.FIRE)
    target:updateEnmityFromDamage(pet,totaldamage)

    return totaldamage
end