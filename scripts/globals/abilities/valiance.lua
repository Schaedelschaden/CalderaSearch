-----------------------------------
-- Ability: Valiance
-- Reduces elemental damage for party members within area of effect. The types of elemental damage reduced depend on the runes you harbor.
-- Obtained: Rune Fencer Level 50
-- Recast Time: 05:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if player:hasStatusEffect(tpz.effect.VALLATION) then -- Vallation active prevents the use of Valiance
        return tpz.msg.basic.CANNOT_PERFORM
    elseif
        player:hasStatusEffect(tpz.effect.IGNIS) or
        player:hasStatusEffect(tpz.effect.GELUS) or
        player:hasStatusEffect(tpz.effect.FLABRA) or
        player:hasStatusEffect(tpz.effect.TELLUS) or
        player:hasStatusEffect(tpz.effect.SULPOR) or
        player:hasStatusEffect(tpz.effect.UNDA) or
        player:hasStatusEffect(tpz.effect.LUX) or
        player:hasStatusEffect(tpz.effect.TENEBRAE)
    then
        return 0, 0
    else
        return tpz.msg.basic.REQUIRES_RUNES
    end
end

function onUseAbility(player, target, ability)
    local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}
    local sdtPower = {"Valiance_Ice", "Valiance_Wind", "Valiance_Earth", "Valiance_Lightning", "Valiance_Water", "Valiance_Fire", "Valiance_Dark", "Valiance_Light"}

    local merits      = player:getMerit(tpz.merit.VALLATION_EFFECT)
    local power       = 15 + merits
    local RuneCounter = 0
    local duration    = 180 + player:getMod(tpz.mod.VALLATION_DURATION)

    for i,v in ipairs(RuneEnhancement) do
        RuneCounter = 0

        if (player:hasStatusEffect(RuneEnhancement[i])) then
            RuneCounter = player:countEffect(RuneEnhancement[i])
            power       = power * RuneCounter

            target:setCharVar(sdtPower[i], power)
--          printf("vallation.lua onUseAbility VALLATION RUNE: [%i] COUNTER: [%i] POWER: [%i]", RuneEnhancement[i], RuneCounter, power)
        end
    end

    target:addStatusEffect(tpz.effect.VALIANCE, power, 0, duration)

    local party = player:getParty()
    local mob   = player:getTarget()

    for i, v in ipairs(party) do
        if v:hasStatusEffect(tpz.effect.VALIANCE) and mob ~= nil then
            local currentCE = mob:getCE(player)
            local currentVE = mob:getVE(player)

            mob:setCE(player, currentCE + 450)
            mob:setVE(player, currentVE + 900)
        end
    end
end
