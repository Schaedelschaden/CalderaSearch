-----------------------------------
--
-- tpz.effect.BARWATER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.WATERRES,effect:getPower())
	
	-- Handle WHM Bar-spell MDEF bonus
	if (effect:getSubPower() > 0) then
		target:addMod(tpz.mod.MDEF, effect:getSubPower())
	end

    -- Handle WHM Empyrean Armor Set Effect
    if effect:getTier() > 0 then
        target:addMod(tpz.mod.WATER_NULL, effect:getTier())
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.WATERRES,effect:getPower())
	
	if (effect:getSubPower() > 0) then
		target:delMod(tpz.mod.MDEF, effect:getSubPower())
	end

    if (effect:getTier() > 0) then
		target:delMod(tpz.mod.WATER_NULL, effect:getTier())
	end
end