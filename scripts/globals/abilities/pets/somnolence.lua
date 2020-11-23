---------------------------------------------
-- Somnolence (Diabolos Blood Pact)
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
	local cost = 30 -- Set the Blood Pact MP Cost here
		
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
--		printf("Somnolence PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Somnolence PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    local bonus = math.floor((pet:getStat(tpz.mod.INT) * 7) / 4)
	local dmg = ((10 + (pet:getMainLvl() * 2)) + bonus)
    local resist = applyPlayerResistance(pet,-1,target, 0, tpz.skill.ELEMENTAL_MAGIC, tpz.magic.ele.DARK)
    local duration = 120

    dmg = dmg*resist
    dmg = mobAddBonuses(pet,spell,target,dmg, tpz.magic.ele.DARK)
    dmg = finalMagicAdjustments(pet,target,spell,dmg)

    if (resist < 0.15) then  --the gravity effect from this ability is more likely to land than Tail Whip
        resist = 0
    end

    duration = duration * resist

    if (duration > 0 and target:hasStatusEffect(tpz.effect.WEIGHT) == false) then
        target:addStatusEffect(tpz.effect.WEIGHT, 50, 0, duration)
    end

    return dmg
end