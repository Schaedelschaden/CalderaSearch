-----------------------------------
--
-- tpz.effect.BESIEGED
--
-----------------------------------
function onEffectGain(target, effect)
    -- printf("besieged.lua onEffectGain  TARGET: [%s]  OS TIME: [%i]  TIME LIMIT: [%i]", target:getName(), os.time(), target:getLocalVar("Besieged_End_Time"))
    if target:getPet() then
        target:getPet():addStatusEffect(tpz.effect.BESIEGED, effect:getPower(), 0, effect:getDuration())
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    -- printf("besieged.lua onEffectLose  1  TARGET: [%s]  OS TIME: [%i]  TIME LIMIT: [%i]", target:getName(), os.time(), target:getLocalVar("Besieged_End_Time"))

    if (target:getPet()) then
        target:getPet():delStatusEffect(tpz.effect.BESIEGED)
    elseif
        target:getObjType() == tpz.objType.MOB and
        os.time() >= target:getLocalVar("Besieged_End_Time") and
        target:getLocalVar("Besieged_End_Time") > 0
    then
        -- printf("besieged.lua onEffectLose  2  TARGET: [%s]  OS TIME: [%i]  TIME LIMIT: [%i]", target:getName(), os.time(), target:getLocalVar("Besieged_End_Time"))
        DespawnMob(target:getID())
    end
end
