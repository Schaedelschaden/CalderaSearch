---------------------------------------------------
--  Foul Waters
--  Family: Acuex
--  Description: Deals Water elemental damage within a fan-shaped area. Duration of effect varies with TP.
--  Additional effects: Drown (-33 STR & 15 damage/tic) & Weight.
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
	pet:useMobAbility(2974)
    return 0
end

function onPetAbility(target, pet, skill)

end