-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	baseBlock = target:getShieldSize()
	baseSpikes = 6

	local blockRateMult = 50 / 100
	local spikeMult = 0
	
	if (baseBlock ~= 0) then
		if (baseBlock == 1) then
			baseBlock = 55
		elseif (baseBlock == 2) then
			baseBlock = 40
		elseif (baseBlock == 3) then
			baseBlock = 45
		elseif (baseBlock == 4) then
			baseBlock = 30
		end
	end
	
	baseBlock = baseBlock + target:getMod(tpz.mod.SHIELDBLOCKRATE)
	
	-- Priwen
	if (target:getEquipID(tpz.slot.SUB) == 28648) then
		blockRateMult = 150 / 100
		spikeMult = 50 / 100
	end
	
	-- Adamas
	if (target:getEquipID(tpz.slot.SUB) == 10806) then
		blockRateMult = 150 / 100
	end
	
	baseBlock = baseBlock * blockRateMult
	baseSpikes = baseSpikes + (baseSpikes * spikeMult)

    target:addMod(tpz.mod.SPIKES, baseSpikes)
     -- Spike damage is calculated on hit in battleutils::TakePhysicalDamage
    target:setMod(tpz.mod.SPIKES_DMG, 0)
    target:addMod(tpz.mod.SHIELDBLOCKRATE, baseBlock)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.SPIKES, baseSpikes)
    target:setMod(tpz.mod.SPIKES_DMG, 0)
    target:delMod(tpz.mod.SHIELDBLOCKRATE, baseBlock)
end