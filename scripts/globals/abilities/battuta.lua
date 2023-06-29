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
	local merits   = player:getMerit(tpz.merit.BATTUTA) - 4
	local power    = 40
    local subPower = merits

    target:addStatusEffect(tpz.effect.BATTUTA, power, 0, 90, 0, subPower)
end
