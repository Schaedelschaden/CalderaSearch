---------------------------------------------
-- Crimson Howl (Ifrit Blood Pact)
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
	local cost = 84 -- Set the Blood Pact MP Cost here
		
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
--		printf("Crimson Howl PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Crimson Howl PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, summoner)
	local bonusTime = utils.clamp(summoner:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
	local petLvl = pet:getMainLvl()
	printf("Crimson Howl PET onPetAbility PET LEVEL: [%i]\n",petLvl)
	local potency = (petLvl / 16) + 4.75
	printf("Crimson Howl PET onPetAbility POTENCY: [%i]\n",potency)
	local duration = 60 + bonusTime

    target:addStatusEffect(tpz.effect.WARCRY,potency,0,duration)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    return tpz.effect.WARCRY
end