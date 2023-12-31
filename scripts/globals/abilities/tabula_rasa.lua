-----------------------------------
-- Ability: Tabula Rasa
-- Optimizes both white and black magic capabilities while allowing charge-free stratagem use.
-- Obtained: Scholar Level 1
-- Recast Time: 1:00:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)

    local regenbonus = 0

    -- Caps at 36 at level 99
    if (player:getMainJob() == tpz.job.SCH and player:getMainLvl() >= 20) then
        regenbonus = math.floor((player:getMainLvl() - 1) / 4)
    end

    local helixbonus = 0

    if (player:getMainJob() == tpz.job.SCH and player:getMainLvl() >= 20) then
        helixbonus = math.floor((player:getMainLvl() / 5) - 3)
    end

    player:resetRecast(228)
    player:resetRecast(231)
    player:resetRecast(232)
    player:addStatusEffect(tpz.effect.TABULA_RASA, math.floor(helixbonus * 1.5), 0, 180, 0, math.floor(regenbonus * 1.5))

    return tpz.effect.TABULA_RASA
end
