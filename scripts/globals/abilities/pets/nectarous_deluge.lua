---------------------------------------------------
--  Nectarous Deluge
--  Family: Snapweed
--  Description: Deals Water elemental damage to enemies within area of effect. Duration of effect varies with TP.
--  Additional effects: Poison.
--  Type: Magical
--  Range: Radial
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3099)
    return 0
end

function onPetAbility(target, pet, skill)

end