-----------------------------------
--
-- tpz.effect.EGG
--
-----------------------------------
-- Store the Ensphere effect in the effect power
-- 1 = Critical Hit Rate +3% (Mextli Harness)
-- 2 = Critical Hit Rate +4% (Enforcer's Harness)
-- 3 = Magic Attack Bonus +5 (Anhur Robe)
-- 4 = Magic Attack Bonus +10 (Gyve Doublet/Zendik Robe)
-- 5 = Store TP +6 (Fazheluo Radiant Mail)
-- 6 = Haste +2% (Toci's Harness)
-- 7 = Fast Cast +5% (Heka's Kalasiris)
-- 8 = Double Attack +3% (Mekira Meikogai)
-- 9 = Double Attack +4% (Kubira Meikogai)
-- 10 = Reraise (Annointed Kalasiris)
-- 11 = Regain +5 (Makora Meikogai)
-- 12 = Refresh +1 (Mekosuchinae Harness)
-----------------------------------

local bonuses = {{tpz.mod.CRITHITRATE, 3}, {tpz.mod.CRITHITRATE, 4}, {tpz.mod.MATT, 5}, {tpz.mod.MATT, 10}, {tpz.mod.STORETP, 6}, {tpz.mod.HASTE_GEAR, 200},
				 {tpz.mod.FASTCAST, 5}, {tpz.mod.DOUBLE_ATTACK, 3}, {tpz.mod.DOUBLE_ATTACK, 4}, {tpz.mod.RERAISE_I, 1}, {tpz.mod.REGAIN, 5}, {tpz.mod.REFRESH, 1}}

function onEffectGain(target, effect)
	-- printf("egg.lua onEffectGain TARGET: [%s]", target:getName())
end

function onEffectTick(target, effect)
	local allianceList = target:getAlliance()
	local MemberName = {}
	local targ
	
	for i,v in ipairs(allianceList) do
		MemberName[i] = v:getName()
	end
	
	for i = 1, #MemberName do
		targ = GetPlayerByName(MemberName[i])
		
		if (target:getName() ~= targ:getName() and target:checkDistance(targ) <= 10 and targ:getLocalVar("ENSPHERE_ACTIVE_"..effect:getPower()) == 0) then
			-- printf("ensphere.lua onEffectTick TARGET IN RANGE OF WEARER  WEARER: [%s]  TARGET: [%s]", target:getName(), targ:getName())
			targ:addStatusEffectEx(tpz.effect.ENSPHERE, tpz.effect.ENSPHERE, 1, 3, 0)
			targ:setLocalVar("ENSPHERE_ACTIVE_"..effect:getPower(), 1)
			targ:addMod(bonuses[effect:getPower()][1], bonuses[effect:getPower()][2])
		elseif (target:getName() ~= targ:getName() and target:checkDistance(targ) > 10 and targ:getLocalVar("ENSPHERE_ACTIVE_"..effect:getPower()) == 1) then
			-- printf("ensphere.lua onEffectTick TARGET NOT IN RANGE OF WEARER")
			targ:setLocalVar("ENSPHERE_ACTIVE_"..effect:getPower(), 0)
			targ:delMod(bonuses[effect:getPower()][1], bonuses[effect:getPower()][2])
			
			local ensphereCounter = 0
			
			for i = 1, 12 do
				if (targ:getLocalVar("ENSPHERE_ACTIVE_"..i) == 1) then
					ensphereCounter = ensphereCounter + 1
				end
			end
			
			if (ensphereCounter == 0) then
				targ:delStatusEffectSilent(tpz.effect.ENSPHERE)
			end
		end
	end
end

function onEffectLose(target, effect)
	local allianceList = target:getAlliance()
	local MemberName = {}
	local targ
	
	for i,v in ipairs(allianceList) do
		MemberName[i] = v:getName()
	end
	
	for i = 1, #MemberName do
		if (target ~= nil and targ ~= nil) then
			-- printf("egg.lua onEffectLose MEMBER NAME: [%s]", MemberName[i])
			targ = GetPlayerByName(MemberName[i])
			
			if (target:getName() ~= targ:getName() and targ:getLocalVar("ENSPHERE_ACTIVE_"..effect:getPower()) == 1) then
				targ:setLocalVar("ENSPHERE_ACTIVE_"..effect:getPower(), 0)
				targ:delMod(bonuses[effect:getPower()][1], bonuses[effect:getPower()][2])
			end
			
			local ensphereCounter = 0
			
			for i = 1, 12 do
				if (targ:getLocalVar("ENSPHERE_ACTIVE_"..i) == 1) then
					ensphereCounter = ensphereCounter + 1
				end
			end
			
			if (ensphereCounter == 0) then
				targ:delStatusEffectSilent(tpz.effect.ENSPHERE)
			end
		end
	end
end