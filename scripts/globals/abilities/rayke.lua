-----------------------------------
-- Ability: Rayke
-- Expends runes to reduce elemental resistance of the target.
-- Obtained: Rune Fencer Level 75 (Merit)
-- Cast Time: Instant
-- Recast Time: 5:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

local RuneEnhancement =
{
    tpz.effect.IGNIS,    -- Fire
    tpz.effect.GELUS,    -- Ice
    tpz.effect.FLABRA,   -- Wind
    tpz.effect.TELLUS,   -- Earth
    tpz.effect.SULPOR,   -- Lightning
    tpz.effect.UNDA,     -- Water
    tpz.effect.LUX,      -- Light
    tpz.effect.TENEBRAE, -- Dark
}

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

function onAbilityCheck(player, target, ability)
    if
        player:hasStatusEffect(tpz.effect.IGNIS) or
        player:hasStatusEffect(tpz.effect.GELUS) or
        player:hasStatusEffect(tpz.effect.FLABRA) or
        player:hasStatusEffect(tpz.effect.TELLUS) or
        player:hasStatusEffect(tpz.effect.SULPOR) or
        player:hasStatusEffect(tpz.effect.UNDA) or
        player:hasStatusEffect(tpz.effect.LUX) or
        player:hasStatusEffect(tpz.effect.TENEBRAE)
    then
        return 0,0
    else
        return tpz.msg.basic.REQUIRES_RUNES
    end
end

function onUseAbility(player, target, ability, action)
    local power       = 50
    local RuneCounter = 0
    local duration    = 30 + player:getMerit(tpz.merit.RAYKE)

    for i,v in ipairs(RuneEnhancement) do
        RuneCounter = 0

        if player:hasStatusEffect(RuneEnhancement[i]) then
            RuneCounter = player:countEffect(RuneEnhancement[i])
            power       = power * RuneCounter

            target:setMod(resistPower[i], power)
        end
    end

    player:removeAllRunes()

    target:addStatusEffect(tpz.effect.RAYKE, 1, 0, duration)

    return tpz.effect.RAYKE
end