-----------------------------------
-- Ability: Triple Shot
-- Occasionally uses three units of ammunition to deal triple damage.
-- Obtained: Corsair Level 87
-- Recast Time: 5:00
-- Duration: 1:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    local chance = 40

    player:addStatusEffect(tpz.effect.TRIPLE_SHOT, chance, 0, 90)
end