-----------------------------------
-- 
-- tpz.effect.COMPOSURE
-- 
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local Lvl = target:getMainLvl() / 2 + 1
	target:addMod(tpz.mod.ACC,Lvl) -- Adds 26 to 50 ACC depending on level
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
	local Lvl = target:getMainLvl() / 2 + 1
    target:delMod(tpz.mod.ACC,Lvl)
end
