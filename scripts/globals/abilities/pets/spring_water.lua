---------------------------------------------
-- Spring Water (Leviathan Blood Pact)
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
	local cost = 99 -- Set the Blood Pact MP Cost here
		
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
--		printf("Spring Water PET onAbilityCheck BLOOD BOON COST REDUCTION [%i to %i]\n",originalcost,cost)
	end
	
	player:setMP(currentMP - cost)
	
--	printf("Spring Water PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
    local base = 47 + pet:getMainLvl()*3
    local tp = skill:getTP()
    if tp < 1000 then
        tp = 1000
    end
    base = base * tp / 1000

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP() --cap it
    end
    target:delStatusEffect(tpz.effect.BLINDNESS)
    target:delStatusEffect(tpz.effect.POISON)
    target:delStatusEffect(tpz.effect.PARALYSIS)
    target:delStatusEffect(tpz.effect.DISEASE)
    target:delStatusEffect(tpz.effect.PETRIFICATION)
        target:wakeUp()
    target:delStatusEffect(tpz.effect.SILENCE)
    if math.random() > 0.5 then
        target:delStatusEffect(tpz.effect.SLOW)
    end
    skill:setMsg(tpz.msg.basic.SELF_HEAL)
    target:addHP(base)
    return base
end