---------------------------------------------------
--  Gloom Spray
--  Family: Mosquito
--  Description: Deals darkness damage to enemies in a fan-shaped area originating from pet. Damage varies with TP.
--  Additional effects: Dispel.
--  Type: Magical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3262)
    return 0
end

function onPetAbility(target, pet, skill)

end