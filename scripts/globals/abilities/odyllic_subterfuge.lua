-----------------------------------
-- Ability: Odyllic Subterfuge
-- Greatly reduces the target's magic accuracy.
-- Obtained: Rune Fencer Level 96
-- Cast Time: Instant
-- Recast Time: 1:00:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onUseAbility(player, target, ability)
	target:addStatusEffect(tpz.effect.ODYLLIC_SUBTERFUGE, 250, 0, 30)
end