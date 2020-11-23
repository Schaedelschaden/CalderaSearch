---------------------------------------------
-- Ecliptic Growl (Fenrir Blood Pact)
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
	local cost = 46 -- Set the Blood Pact MP Cost here
		
	if (player:hasStatusEffect(tpz.effect.ASTRAL_CONDUIT)) then
		ability:setRecast(utils.clamp(0, 0, 0))
	end
	
	if (player:hasStatusEffect(tpz.effect.APOGEE)) then
		cost = cost * 1.5
		ability:setRecast(utils.clamp(0, 0, 0))
		player:delStatusEffect(tpz.effect.APOGEE)
	end
	
	if (math.random(1,100) < bloodboon) then
--		local originalcost = cost
		cost = (cost * (math.random(8,16) / 16))
--		printf("Ecliptic Growl PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Ecliptic Growl PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime
	local petlvl = pet:getMainLvl()
	local buffvalue = 0
	local contrabuff = 8
	local buffmultiplier = 1
    local moon = VanadielMoonPhase()
    
    if moon > 90 then
        buffvalue = 7
    elseif moon > 75 then
        buffvalue = 6
    elseif moon > 60 then
        buffvalue = 5
    elseif moon > 40 then
        buffvalue = 4
    elseif moon > 25 then
        buffvalue = 3
    elseif moon > 10 then
        buffvalue = 2
    else
        buffvalue = 1
    end
	
	if (petlvl > 99) then
		buffmultiplier = 4
	elseif (petlvl <= 99) then
		buffmultiplier = 3
	elseif (petlvl <= 80) then
		buffmultiplier = 2
	elseif (petlvl <= 65) then
		buffmultiplier = 1
	end
	
	buffvalue = buffvalue * buffmultiplier
	contrabuff = contrabuff * buffmultiplier
	
    target:delStatusEffect(tpz.effect.STR_BOOST)
    target:delStatusEffect(tpz.effect.DEX_BOOST)
    target:delStatusEffect(tpz.effect.VIT_BOOST)
    target:delStatusEffect(tpz.effect.AGI_BOOST)
    target:delStatusEffect(tpz.effect.MND_BOOST)
    target:delStatusEffect(tpz.effect.CHR_BOOST)

    target:addStatusEffect(tpz.effect.STR_BOOST,buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.DEX_BOOST,buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.VIT_BOOST,buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.AGI_BOOST,contrabuff-buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.INT_BOOST,contrabuff-buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.MND_BOOST,contrabuff-buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.CHR_BOOST,contrabuff-buffvalue,0,duration)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end