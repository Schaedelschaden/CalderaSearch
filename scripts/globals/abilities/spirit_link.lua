-----------------------------------
-- Ability: Spirit Link
-- Sacrifices own HP to heal Wyvern's HP.
-- Obtained: Dragoon Level 25
-- Recast Time: 1:30
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
-----------------------------------

function cutEmpathyEffectTable(validEffects,i,maxCount)
    local delindex = 1

    while maxCount < i do
        delindex = math.random(1,i)
        while validEffects[delindex+1] ~= nil do
            validEffects[delindex] = validEffects[delindex+1]
            delindex = delindex + 1
        end
        validEffects[delindex+1] = nil -- could be in the above loop, but unsure if Lua allows copying of nil?
        i = i - 1
    end

    return validEffects
end

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return tpz.msg.basic.REQUIRES_A_PET,0
    else
        if (player:getPet():getHP() == player:getPet():getMaxHP() and player:getMerit(tpz.merit.EMPATHY) == 0) then
            return tpz.msg.basic.UNABLE_TO_USE_JA,0
        else
            return 0,0
        end
    end
end

function shuffle(effects)
	for i = 1, #effects do
		local j = math.random(i, #effects)
		-- printf("%s (%s) <--> %s (select %s)", i, effects[i], j, effects[j])
		effects[i], effects[j] = effects[j], effects[i]
	end
	
	return effects
end

function onUseAbility(player,target,ability)

    local playerHP = player:getHP()
    local drainamount = (math.random(25, 35) / 100) * playerHP

    local pet = player:getPet()
    local healPet = ((drainamount + player:getStat(tpz.mod.MND) + (pet:getMainLvl() * 0.7)) * 2) * (1 + (player:getMod(tpz.mod.SPIRIT_LINK_POTENCY) / 100))
    local petTP = pet:getTP()
    local regenAmount = (player:getMainLvl() + player:getItemLevel()) / 3 -- level / 3 per tick regen
	
	-- Damage the triggering player
	if (player:getMod(tpz.mod.SPIRIT_LINK_HP_COST) > 0) then
		drainamount = drainamount - (drainamount * (player:getMod(tpz.mod.SPIRIT_LINK_HP_COST) / 100))
	end
	
	if (player:getPet():getHP() == player:getPet():getMaxHP()) then
        drainamount = 0 -- Prevents player HP loss if wyvern is at full HP
    end

    if (player:hasStatusEffect(tpz.effect.STONESKIN)) then
        local skin = player:getMod(tpz.mod.STONESKIN)

        if (skin >= drainamount) then
            if (skin == drainamount) then
                player:delStatusEffect(tpz.effect.STONESKIN)
            else
                local effect = player:getStatusEffect(tpz.effect.STONESKIN)
                effect:setPower(effect:getPower() - drainamount) -- fixes the status effect so when it ends it uses the new power instead of old
                player:delMod(tpz.mod.STONESKIN, drainamount) -- removes the amount from the mod

            end
        else
            player:delStatusEffect(tpz.effect.STONESKIN)
            player:takeDamage(drainamount - skin)
        end

    else
        player:takeDamage(drainamount)
    end

	-- Remove status effects
	local debuffs = {tpz.effect.POISON, tpz.effect.DOOM, tpz.effect.BLINDNESS, tpz.effect.PARALYSIS}
	local removeCounter
	
	-- Poison, Blind, Paralyze, Doom
	if (player:getMod(tpz.mod.SPIRIT_LINK_POTENCY) >= 10) then
		removeCounter = math.random(3, 4)
		shuffle(debuffs)
		
		for i = 1, removeCounter do
			pet:delStatusEffect(debuffs[i])
		end
	elseif (player:getMod(tpz.mod.SPIRIT_LINK_POTENCY) <= 5) then
		removeCounter = math.random(2, 3)
		shuffle(debuffs)
		
		for i = 1, removeCounter do
			pet:delStatusEffect(debuffs[i])
		end
	elseif (player:getMod(tpz.mod.SPIRIT_LINK_POTENCY) < 5) then
		pet:delStatusEffect(debuffs[math.random(4)])
	end
	
	-- Sleep
    if (pet:getHP() < pet:getMaxHP()) then -- Only removed if it heals the wyvern
        removeSleepEffects(pet)
    end

    -- Empathy status effect copying
    local empathyTotal = player:getMerit(tpz.merit.EMPATHY)
    if empathyTotal > 0 then
		-- Copies status effects to wyvern
        local effects = player:getStatusEffects()
        local validEffects = { }
        local i = 0 -- highest existing index
        local copyi = 0

        for _,effect in ipairs(effects) do
            if bit.band(effect:getFlag(),tpz.effectFlag.EMPATHY) == tpz.effectFlag.EMPATHY then
                validEffects[i+1] = effect
                i = i + 1
            end
        end

        if i < empathyTotal then
            empathyTotal = i
        elseif i > empathyTotal then
            validEffects = cutEmpathyEffectTable(validEffects,i,empathyTotal)
        end

        local copyEffect = nil
        while copyi < empathyTotal do
            copyEffect = validEffects[copyi+1]
            if pet:hasStatusEffect(copyEffect:getType()) then
                pet:delStatusEffect(copyEffect:getType())
            end

            pet:addStatusEffect(copyEffect:getType(), copyEffect:getPower(), copyEffect:getTick(), math.ceil((copyEffect:getTimeRemaining()) / 1000)) -- id,power,tick,duration(convert ms to s)
            copyi = copyi + 1
        end
		
		-- Increases wyverns level
		local prev_exp = pet:getLocalVar("wyvern_exp")
		-- Caps exp at 1000 to prevent wyvern leveling up too many times
		local exp = utils.clamp(200 * player:getMerit(tpz.merit.EMPATHY), 0, 1000)
		local currentExp = exp
		
		if (prev_exp + exp > 1000) then
			currentExp = 1000 - prev_exp
		end
		
		local diff = math.floor((prev_exp + currentExp) / 200) - math.floor(prev_exp / 200)

		if prev_exp >= 0 and prev_exp < 1000 and diff > 0 then
            -- if player:getName() == "Khalum" then
                -- player:PrintToPlayer(string.format("DIFF: [%i] = ((PREV EXP: [%i] + CURRENT EXP: [%i]) / 200) - (PREV EXP: [%i] / 200)", diff, prev_exp, currentExp, prev_exp),tpz.msg.channel.SYSTEM_3)
            -- end

			-- wyvern leveled up (diff is the number of level ups)
			pet:addMod(tpz.mod.ACC, 6 * diff)
			pet:addMod(tpz.mod.HPP, 6 * diff)
			pet:addMod(tpz.mod.ATTP, 5 * diff)
			pet:setHP(pet:getMaxHP())
			player:messageBasic(tpz.msg.basic.STATUS_INCREASED, 0, 0, pet)
			player:addMod(tpz.mod.ATTP, 4 * diff)
			player:addMod(tpz.mod.DEFP, 4 * diff)
			player:addMod(tpz.mod.HASTE_ABILITY, 200 * diff)
			player:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 2 * diff)

            pet:setLocalVar("wyvern_exp", prev_exp + exp)
            pet:setLocalVar("level_Ups", pet:getLocalVar("level_Ups") + diff)
		end
    end

    pet:addHP(healPet) --add the hp to pet
    pet:addStatusEffect(tpz.effect.REGEN, regenAmount, 3, 90) -- 90 seconds of regen
    player:addTP(petTP / 2) --add half pet tp to you
    pet:delTP(petTP / 2) -- remove half tp from pet
end
