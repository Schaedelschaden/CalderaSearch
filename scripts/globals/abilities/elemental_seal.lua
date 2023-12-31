-----------------------------------
-- Ability: Elemental Seal
-- Enhances the accuracy of the user's next spell
-- Obtained: Black Mage Level 15
-- Recast Time: 10:00
-- Duration: 1 Spell or 60 seconds, whichever occurs first.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local bonus = player:getMod(tpz.mod.MAGIC_DAMAGE) * (player:getMod(tpz.mod.ENH_ELEMENTAL_SEAL) / 100)
	
	if (bonus <= 0) then
		bonus = 1
	end
	
    player:addStatusEffect(tpz.effect.ELEMENTAL_SEAL, bonus, 0, 60)
end