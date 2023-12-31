-----------------------------------
-- Ability: Overkill
-- Increases ranged attack speed and the chance of activating Double/Triple Shot.
-- Obtained: Ranger Level 96
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
	player:addStatusEffect(tpz.effect.OVERKILL,1,0,60)
end
