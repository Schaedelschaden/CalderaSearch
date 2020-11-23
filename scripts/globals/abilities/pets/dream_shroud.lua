---------------------------------------------
-- Dream Shroud (Diabolos Blood Pact)
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
	local cost = 121 -- Set the Blood Pact MP Cost here
		
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
--		printf("Dream Shroud PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Dream Shroud PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime
    local hour = VanadielHour()
    local buffvalue = 0
	
    buffvalue = math.abs(12 - hour) + 1
	
	if (summoner:getMainLvl() > 98) then
		buffvalue = buffvalue * 2
	end
	
    target:delStatusEffect(tpz.effect.MAGIC_ATK_BOOST)
    target:delStatusEffect(tpz.effect.MAGIC_DEF_BOOST)
    target:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST,buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.MAGIC_DEF_BOOST,14 - buffvalue,0,duration)
    skill:setMsg(tpz.msg.basic.NONE)
	
    return 0
end