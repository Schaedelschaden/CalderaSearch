---------------------------------------------------
-- Sickle Slash
-- Deals critical damage. Chance of critical hit varies with TP.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(810)
    return 0
end

function onPetAbility(target, pet, skill)

end