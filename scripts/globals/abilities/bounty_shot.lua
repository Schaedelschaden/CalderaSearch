-----------------------------------
-- Ability: Bounty Shot
-- Increases the rate at which the target yields treasure. 
-- Obtained: Ranger Level 87
-- Recast Time: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local strength = 2 + player:getMod(tpz.mod.BOUNTY_SHOT_RATE) -- Base TH2, goes up to TH4 with gear
	target:addStatusEffect(tpz.effect.BOUNTY_SHOT, strength, 0, 60)
end