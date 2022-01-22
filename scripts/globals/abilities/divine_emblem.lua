-----------------------------------
-- Ability: Divine Emblem
-- Enhances the accuracy of your next divine magic spell and increases enmity. 
-- Obtained: Paladin Level 78
-- Recast Time: 03:00
-- Duration: 01:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
	player:addStatusEffect(tpz.effect.DIVINE_EMBLEM, 50, 0, 60) -- 50% increase to enmity
end