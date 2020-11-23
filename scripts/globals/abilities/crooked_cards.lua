-----------------------------------
-- Ability: Crooked Cards
-- Increases the effects of the next Phantom Roll.
-- Obtained: Corsair Level 95
-- Recast Time: 10:00
-- Duration: 1:00 or until next roll
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.CROOKED_CARDS, 20, 0, 60)

    return 0
end