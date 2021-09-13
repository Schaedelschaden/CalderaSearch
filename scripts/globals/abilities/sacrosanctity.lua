-----------------------------------
-- Ability: Sacrosanctity
-- Enhances magic defense for party members within area of effect.
-- Obtained: White Mage Level 95
-- Recast Time: 10:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player, target, ability)
	target:addStatusEffect(tpz.effect.SACROSANCTITY, 1, 0, 60)
	
	target:addListener("MAGIC_TAKE", "SACROSANCTITY_TAKE_MAGIC", function(target, caster, spell)
        target:delStatusEffect(tpz.effect.SACROSANCTITY)
    end)
end