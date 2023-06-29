-----------------------------------
-- Ability: Formless Strikes
-- While in effect, melee attacks will not be considered physical damage. No effect on weapon skills.
-- Obtainable: Monk Level 75
-- Recast Time: 0:10:00
-- Duration: 0:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local merits = player:getMerit(tpz.merit.FORMLESS_STRIKES)
	
	player:addStatusEffect(tpz.effect.FORMLESS_STRIKES, merits, 0, 180)
end
