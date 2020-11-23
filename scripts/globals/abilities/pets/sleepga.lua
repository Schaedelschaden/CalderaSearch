---------------------------------------------
-- Sleepga (Shiva Blood Pact)
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
	local cost = 54 -- Set the Blood Pact MP Cost here
		
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
--		printf("Sleepga PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Sleepga PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    local duration = 60
    local resm = applyPlayerResistance(pet,-1,target,pet:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT),tpz.skill.ELEMENTAL_MAGIC, 5)
    if (resm < 0.5) then
        skill:setMsg(tpz.msg.basic.JA_MISS_2) -- resist message
        return tpz.effect.SLEEP_I
    end
    duration = duration * resm
    if (target:hasImmunity(1) or hasSleepEffects(target)) then
        --No effect
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)

        target:addStatusEffect(tpz.effect.SLEEP_I,1,0,duration)
    end

    return tpz.effect.SLEEP_I
end