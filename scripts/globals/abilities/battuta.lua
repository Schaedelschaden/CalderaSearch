-----------------------------------
-- Ability: Battuta
-- Increases the likelihood of parrying and deals counter damage after parrying dependent upon harbored runes.
-- Obtained: Rune Fencer Level 75 (Merits)
-- Recast Time: 5:00
-- Duration: 01:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local merits = player:getMerit(tpz.merit.MERIT_BATTUTA)
	local power = 40 + merits
	
    target:addStatusEffect(tpz.effect.BATTUTA, power, 0, 90)
end