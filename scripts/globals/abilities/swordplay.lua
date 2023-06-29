-----------------------------------
-- Ability: Swordplay
-- Increases accuracy and evasion until you take severe damage.
-- Obtained: Rune Fencer Level 20
-- Recast Time: 5:00
-- Duration: 02:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    local modifier = 1
    local power    = 6

    if player:getMainJob() == tpz.job.RUN then
        if player:getMod(tpz.mod.SWORDPLAY) > 0 then
            modifier = player:getMod(tpz.mod.SWORDPLAY)
        end

        power = power * modifier
    else
        power = 3
    end

    target:addStatusEffect(tpz.effect.SWORDPLAY, power, 3, 120)
end
