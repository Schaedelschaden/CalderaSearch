-----------------------------------
-- Ability: Souleater
-- Consumes your own HP to enhance attacks.
-- Obtained: Dark Knight Level 30
-- Recast Time: 6:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    local duration = 60
    local subPower = (target:getMerit(tpz.merit.MUTED_SOUL) / 10) * target:getMod(tpz.mod.ENHANCES_MUTED_SOUL)

    player:addStatusEffect(tpz.effect.SOULEATER, 1, 0, duration, 0, subPower)
end
