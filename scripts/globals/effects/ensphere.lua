-----------------------------------
--
-- tpz.effect.ENSPHERE
--
-----------------------------------
-- Store the effect in the effect power
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

-- local bonuses = {{tpz.mod.CRITHITRATE, 3}, {tpz.mod.CRITHITRATE, 4}, {tpz.mod.MATT, 5}, {tpz.mod.MATT, 10}, {tpz.mod.STORETP, 6}, {tpz.mod.HASTE_GEAR, 200},
				 -- {tpz.mod.FASTCAST, 5}, {tpz.mod.DOUBLE_ATTACK, 3}, {tpz.mod.DOUBLE_ATTACK, 4}, {tpz.mod.RERAISE_I, 1}, {tpz.mod.REGAIN, 5}, {tpz.mod.REFRESH, 1}}

function onEffectGain(target, effect)
	-- local power = effect:getPower()

	-- for i = 1, #bonuses do
		-- if (power == i) then
			-- -- printf("ensphere.lua onEffectGain POWER: [%i]  MOD: [%s]  VALUE: [%i]", power, bonuses[i][1], bonuses[i][2])
			-- target:addMod(bonuses[i][1], bonuses[i][2])
		-- end
	-- end
end

function onEffectTick(target, effect)
	-- local allianceList = target:getAlliance()
	-- local MemberName = {}
	-- local targ
	
	-- for i,v in ipairs(allianceList) do
		-- MemberName[i] = v:getName()
	-- end
	
	-- for i = 1, #MemberName do
		-- targ = GetPlayerByName(MemberName[i])
		
		-- if (target:checkDistance(targ) <= 10) then
			-- -- printf("ensphere.lua onEffectTick TARGET IN RANGE OF WEARER  WEARER: [%s]  TARGET: [%s]", target:getName(), targ:getName())
		-- else
			-- -- printf("ensphere.lua onEffectTick TARGET NOT IN RANGE OF WEARER")
		-- end
	-- end
end

function onEffectLose(target, effect)
	printf("ensphere.lua onEffectLose  NAME: [%s]", target:getName())

	if (target:getLocalVar("ENSPHERE_ACTIVE_10") == 1 and target:getHP() <= 0) then
		target:sendReraise(1)
	end
    -- local power = effect:getPower()

	-- for i = 1, #bonuses do
		-- if (power == i) then
			-- target:delMod(bonuses[i][1], bonuses[i][2])
		-- end
		
		-- if (power == 10 and target:getHP() <= 0) then
			-- target:sendReraise(1)
		-- end
	-- end
end