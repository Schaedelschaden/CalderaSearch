-----------------------------------
--
-- tpz.effect.RAYKE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local resistPower =
{
    tpz.mod.RAYKE_FIRE,
    tpz.mod.RAYKE_ICE,
    tpz.mod.RAYKE_WIND,
    tpz.mod.RAYKE_EARTH,
    tpz.mod.RAYKE_LIGHTNING,
    tpz.mod.RAYKE_WATER,
    tpz.mod.RAYKE_LIGHT,
    tpz.mod.RAYKE_DARK,
}

local resistMod =
{
    tpz.mod.FIRERES,
    tpz.mod.ICERES,
    tpz.mod.WINDRES,
    tpz.mod.EARTHRES,
    tpz.mod.THUNDERRES,
    tpz.mod.WATERRES,
    tpz.mod.LIGHTRES,
    tpz.mod.DARKRES,
}

function onEffectGain(target, effect)
    for i = 1, 8 do
        if target:getMod(resistPower[i]) > 0 then
            local power = target:getMod(resistPower[i])

            target:addMod(resistMod[i], -power)
        end
    end
end

function onEffectTick(target, effect)

end

function onEffectLose(target, effect)
    for i = 1, 8 do
        if target:getMod(resistPower[i]) > 0 then
            local power = target:getMod(resistPower[i])

            target:delMod(resistMod[i], -power)
            target:setMod(resistPower[i], 0)
        end
    end
end
