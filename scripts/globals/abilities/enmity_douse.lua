-----------------------------------
-- Ability: Enmity Douse
-- Reduces the target's enmity towards you. 
-- Obtained: Black Mage Level 87
-- Recast Time: 10:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0, 0
end

function onUseAbility(player, target, ability)
    if (target:isMob()) then
        target:lowerEnmity(player, 99)
    end
end
