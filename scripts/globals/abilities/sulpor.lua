-----------------------------------
-- Ability: Sulpor
-- Increases resistance against water and deals lightning damage.
-- Obtained: Rune Fencer Level 5
-- Recast Time: 0:05
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}

    local level       = player:getMainLvl()
    local RuneCounter = 0
    local merits      = player:getMerit(tpz.merit.RUNE_ENHANCE)
    local potency     = math.floor(((49 * level) / 99) + merits)

    if player:getMainJob() ~= tpz.job.RUN then
        potency = potency / 2.75
        level   = player:getSubLvl()
    end

    local subWeaponType = player:getStorageItem(0, 0, tpz.slot.SUB)

    if
        player:isDualWielding() and
        subWeaponType ~= nil and
        not subWeaponType:isShield()
    then
        potency = potency / 2
    end

    for i,v in ipairs(RuneEnhancement) do
        if (player:hasStatusEffect(RuneEnhancement[i])) then
            RuneCounter = RuneCounter + player:countEffect(RuneEnhancement[i])
        end
    end

    if
        level >= 1 and
        level < 35 and
        RuneCounter <= 1
    then
        for i,v in ipairs(RuneEnhancement) do
            player:delStatusEffect(RuneEnhancement[i])
        end
    elseif
        level >= 35 and
        level < 65 and
        RuneCounter >= 2
    then
        player:removeOldestRune()
    elseif
        level >= 65 and
        RuneCounter >= 3
    then
        player:removeOldestRune()
    end

    player:addStatusEffect(RuneEnhancement[5], potency, 3, 300)
end
