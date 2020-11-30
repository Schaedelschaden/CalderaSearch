-----------------------------------
--
-- tpz.effect.DIABOLOS_S_FAVOR
--
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.REFRESH, effect:getPower())
end

function onEffectTick(target, effect)
	local timer = target:getLocalVar("Favor_BP_Delay_Timer")
	local counter = utils.clamp(math.floor(timer / 4), 0, 10)
	
	target:setMod(tpz.mod.AVATARS_FAVOR_BP_DELAY, counter)
	
	if (counter < 10) then
--		target:PrintToPlayer(string.format("Diabolos's Favor Timer: [%i]  Counter: [%i]", timer, counter))
		target:setLocalVar("Favor_BP_Delay_Timer", timer + 1)
		target:setLocalVar("Favor_BP_Delay_Counter", counter)
	end
end

function onEffectLose(target, effect)
	local counter = target:getLocalVar("Favor_BP_Delay_Counter")
	counter = utils.clamp(counter, 0, 10)
	
	target:delMod(tpz.mod.REFRESH, effect:getPower())
	target:delMod(tpz.mod.AVATARS_FAVOR_BP_DELAY, counter)
end