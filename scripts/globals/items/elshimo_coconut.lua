-----------------------------------------
-- ID: 5187
-- Item: elshimo_coconut
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -1
-- Intelligence -1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5187);
end;

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AGI, -1);
    target:addMod(dsp.mod.INT, -1);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.AGI, -1);
    target:delMod(dsp.mod.INT, -1);
end;
