-----------------------------------
-- Ability: Divine Caress
-- If the next spell you cast cures a status ailment, your target will gain enhanced resistance to that ailment.
-- Obtained: White Mage Level 83
-- Recast Time: 1:00
-- Duration: 1:00 (or until an appropriate spell is cast)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
	return 0, 0
end

function onUseAbility(player, target, ability)
	target:addStatusEffect(tpz.effect.DIVINE_CARESS_I, 3, 0, 60)
end