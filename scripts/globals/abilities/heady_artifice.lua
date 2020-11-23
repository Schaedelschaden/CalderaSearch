-----------------------------------
-- Ability: Heady Artifice
-- Allows automatons to perform a special ability that varies with the head used.
-- Obtained: Puppetmaster Level 96
-- Recast Time: 1:00:00
-- Duration: Varies with head used
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:hasPet() == true) then
		return 0, 0
	else
		return tpz.msg.basic.REQUIRES_A_PET, 0
	end
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
    pet:addStatusEffect(tpz.effect.HEADY_ARTIFICE, 1, 0, 60)
end