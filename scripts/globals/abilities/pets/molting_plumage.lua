---------------------------------------------------
--  Molting Plumage
--  Family: Tulfaire
--  Description: Deals Wind damage to enemies within a fan-shaped area. Area of effect varies with TP.
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
	pet:useMobAbility(3063)
    return 0
end

function onPetAbility(target, pet, skill)

end