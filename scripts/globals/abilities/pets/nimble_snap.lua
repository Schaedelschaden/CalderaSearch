---------------------------------------------------
-- Nimble Snap
-- Single target damage.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(518)
    return 0
end

function onPetAbility(target, pet, skill)

end