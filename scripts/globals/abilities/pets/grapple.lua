---------------------------------------------------
-- Grapple
-- Deals physical damage to enemies within a fan-shaped area originating from pet.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(363)
    return 0
end

function onPetAbility(target, pet, skill)

end