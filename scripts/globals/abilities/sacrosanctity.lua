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
	
	-- target:addListener("MAGIC_TAKE", "SACROSANCTITY_TAKE_MAGIC", function(target, caster, spell)
        -- target:delStatusEffect(tpz.effect.SACROSANCTITY)
    -- end)
	
	target:addListener("TAKE_DAMAGE", "SACROSANCTITY_TAKE_MAGIC", function(target, amount, attacker, attackType, damageType)
		-- Damage Type - Elemental: 5, Fire: 6, Ice: 7, Wind: 8, Earth: 9, Thunder: 10, Water: 11, Light: 12, Dark: 13
		for i = 5, 13 do
			if (damageType == i) then
				target:delStatusEffect(tpz.effect.SACROSANCTITY)
			end
		end
	end)
end