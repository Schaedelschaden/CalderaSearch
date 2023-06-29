-----------------------------------
--
-- tpz.effect.TOMAHAWK
--
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------

local physSDT = { tpz.mod.SLASHRES, tpz.mod.PIERCERES, tpz.mod.IMPACTRES, tpz.mod.HTHRES }

function onEffectGain(target, effect)
    for i = 1, #physSDT do
        local sdtModPhys    = target:getMod(physSDT[i])
        local reductionPhys = (1000 - sdtModPhys) * 0.25

        target:addMod(physSDT[i], reductionPhys)
    end

    for i = 1, #tpz.magic.specificDmgTakenMod do
        local sdtModMagic    = target:getMod(tpz.magic.specificDmgTakenMod[i])
        local reductionMagic = sdtModMagic * 0.25

        target:addMod(tpz.magic.specificDmgTakenMod[i], -reductionMagic)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    for i = 1, #physSDT do
        local sdtModPhys  = target:getMod(physSDT[i])
        local restorePhys = (1000 - sdtModPhys) / 0.75

        if sdtModPhys <= 250 then
            restorePhys = sdtModPhys
        elseif sdtModPhys >= 1000 then
            restorePhys = 0
        end

        target:delMod(physSDT[i], restorePhys)
    end

    for i = 1, #tpz.magic.specificDmgTakenMod do
        local sdtModMagic  = target:getMod(tpz.magic.specificDmgTakenMod[i])
        local restoreMagic = (sdtModMagic / 0.75) - sdtModMagic

        target:delMod(tpz.magic.specificDmgTakenMod[i], -restoreMagic)
    end
end
