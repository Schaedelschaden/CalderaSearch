-----------------------------------
--
-- tpz.mod.SABOTEUR
--
-----------------------------------

function onEffectGain(target, effect)
	local Lvl = target:getMainLvl() * 2 + 2 -- No formula known for this so guesstimating a reasonable value would be MACC +4 at level 1 thru MACC +200 at level 99
	target:addMod(tpz.mod.MACC, Lvl)
end

function onEffectTick(target, effect)

end

function onEffectLose(target, effect)
	local Lvl = target:getMainLvl() * 2 + 2
	target:delMod(tpz.mod.MACC, Lvl)
end