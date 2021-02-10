---------------------------------------------------
-- Sheep Charge
-- Deals damage to a single target. Additional effect: Knockback
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(262)
    return 0
end

function onPetAbility(target, pet, skill)

end