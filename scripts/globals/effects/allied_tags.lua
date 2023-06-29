-----------------------------------
--
--
--
-----------------------------------

local dps     = {tpz.job.WAR, tpz.job.MNK, tpz.job.THF, tpz.job.BST, tpz.job.DRK, tpz.job.RNG, tpz.job.DRG, tpz.job.SAM, tpz.job.BLU, tpz.job.COR, tpz.job.PUP, tpz.job.DNC}
local tanks   = {tpz.job.PLD, tpz.job.RUN, tpz.job.NIN}
local casters = {tpz.job.BLM, tpz.job.RDM, tpz.job.SCH, tpz.job.WHM, tpz.job.BRD, tpz.job.SMN, tpz.job.GEO}

function onEffectGain(target,effect)
    -- if (target:getPet()) then
        -- target:getPet():addStatusEffect(effect)
    -- end
    if target:getMainJob() == tanks then
        target:setMod(tpz.mod.UDMGPHYS, -95)
        target:setMod(tpz.mod.UDMGBREATH, -95)
        target:setMod(tpz.mod.UDMGMAGIC, -95)
        target:setMod(tpz.mod.UDMGRANGE, -95)
    elseif target:getMainJob() == dps then
        target:setMod(tpz.mod.UDMGPHYS, -97)
        target:setMod(tpz.mod.UDMGBREATH, -97)
        target:setMod(tpz.mod.UDMGMAGIC, -97)
        target:setMod(tpz.mod.UDMGRANGE, -97)
    else
        target:setMod(tpz.mod.UDMGPHYS, -98)
        target:setMod(tpz.mod.UDMGBREATH, -98)
        target:setMod(tpz.mod.UDMGMAGIC, -98)
        target:setMod(tpz.mod.UDMGRANGE, -98)
    end
    
    target:addMod(tpz.mod.CURE_POTENCY_RCVD, -25)
    target:addMod(tpz.mod.WALTZ_POTENCY_RCVD, -20)
    target:addMod(tpz.mod.SHIELD_BASH, -95)
    target:addStatusEffect(tpz.effect.LEVEL_RESTRICTION, 98, 0, 0)
    target:addStatusEffect(tpz.effect.SJ_RESTRICTION, 0, 0, 0, 0)
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
    -- if (target:getPet()) then
        -- target:getPet():delStatusEffect(tpz.effect.ALLIED_TAGS)
    -- end
    target:setMod(tpz.mod.UDMGPHYS, 0)
    target:setMod(tpz.mod.UDMGBREATH, 0)
    target:setMod(tpz.mod.UDMGMAGIC, 0)
    target:setMod(tpz.mod.UDMGRANGE, 0)
    target:delMod(tpz.mod.CURE_POTENCY_RCVD, -25)
    target:delMod(tpz.mod.WALTZ_POTENCY_RCVD, -20)
    target:delMod(tpz.mod.SHIELD_BASH, -95)
    target:delStatusEffect(tpz.effect.LEVEL_RESTRICTION)
    target:delStatusEffect(tpz.effect.SJ_RESTRICTION)
    target:timer(2000, function(targetArg)
        targetArg:sendRaise(3)
    end)
end
