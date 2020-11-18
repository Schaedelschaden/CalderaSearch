---------------------------------------------
-- Pavor Nocturnus (Diabolos Blood Pact)
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
	local cost = 197 -- Set the Blood Pact MP Cost here
		
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
--		printf("Pavor Nocturnus PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Pavor Nocturnus PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
	local chance = 5 -- Low Death rate against mobs that are awake
	local rollRandom = math.random(0,99)
	
	if (target:hasStatusEffect(tpz.effect.SLEEP_I)) or (target:hasStatusEffect(tpz.effect.SLEEP_II)) then
		chance = 95 -- High Death rate against mobs that are asleep
	end
	
	if (target:isNM()) then
		chance = 0 -- No Death rate against NMs
	end
	
	printf("Pavor Nocturnus PET onPetAbility CHANCE: [%i]  RANDOM: [%i]\n", chance, rollRandom)
	
	-- Attempts to kill the target if it is asleep and is not an NM
	if (rollRandom < chance) then
		printf("Pavor Nocturnus PET onPetAbility DEATH EFFECT\n")
		skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)
        target:takeDamage(target:getHP(), pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
		return tpz.effect.KO
	else
		printf("Pavor Nocturnus PET onPetAbility DISPEL EFFECT\n")
		-- Dispels an effect if Death fails
		local effect = target:dispelStatusEffect()
		skill:setMsg(tpz.msg.basic.SKILL_ERASE)
		if (effect == tpz.effect.NONE) then
            -- No effect to dispel
            skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
        end
		return effect
	end
end