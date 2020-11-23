-----------------------------------
-- Ability: Scarlet Delirium
-- Channels damage taken into enhanced attack and magic attack.
-- Obtained: Dark Knight Level 95
-- Recast Time: 01:30
-- Duration: 01:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability)
	target:addStatusEffect(tpz.effect.SCARLET_DELIRIUM,1,0,90)
end
